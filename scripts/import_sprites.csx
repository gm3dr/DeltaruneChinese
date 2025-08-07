
using System.Linq;
using System.Threading.Tasks;
using ImageMagick;
using UndertaleModLib.Util;

UndertaleSprite GetSprite(string name, StreamWriter logger) {
    lock (Data.Sprites) {
        UndertaleSprite result = Data.Sprites.ByName(name, false);
        if (result != null) {
            return result;
        }
        UndertaleSprite baseSprite = Data.Sprites.ByName(name.Replace("_zhname", ""), false);
        if (baseSprite == null) {
            logger.WriteLine($"[CloneSprite]missing sprite: {name}");
            return result;
        }
        result = new() {
            Name = Data.Strings.MakeString(name),
            Width = baseSprite.Width,
            Height = baseSprite.Height,
            MarginLeft = baseSprite.MarginLeft,
            MarginRight = baseSprite.MarginRight,
            MarginTop = baseSprite.MarginTop,
            MarginBottom = baseSprite.MarginBottom,
            OriginX = baseSprite.OriginX,
            OriginY = baseSprite.OriginY,
            Transparent = baseSprite.Transparent,
            Smooth = baseSprite.Smooth,
            Preload = baseSprite.Preload,
            BBoxMode = baseSprite.BBoxMode,
            SepMasks = baseSprite.SepMasks,
            CollisionMasks = baseSprite.CollisionMasks
        };
        Data.Sprites.Add(result);
        
        for (int i = 0; i < baseSprite.Textures.Count; i++) {
            UndertaleTexturePageItem item = baseSprite.Textures[i].Texture;
            UndertaleTexturePageItem resultItem = new() {
                SourceX = (ushort)item.SourceX,
                SourceY = (ushort)item.SourceY,
                SourceWidth = (ushort)item.SourceWidth,
                SourceHeight = (ushort)item.SourceHeight,
                TargetX = (ushort)item.TargetX,
                TargetY = (ushort)item.TargetY,
                TargetWidth = (ushort)item.TargetWidth,
                TargetHeight = (ushort)item.TargetHeight,
                BoundingWidth = (ushort)item.BoundingWidth,
                BoundingHeight = (ushort)item.BoundingHeight,
                TexturePage = item.TexturePage
            };
            result.Textures.Add(new UndertaleSprite.TextureEntry() {
                Texture = resultItem
            });
            Data.TexturePageItems.Add(resultItem);
        }
        return result;
    }
}
void ImportSprites(string path, StreamWriter logger) {
    Parallel.ForEach(new DirectoryInfo(path).EnumerateFiles().Where(file => file.Extension == ".cfg"), async file => {
        // async函数这里要单独try catch
        try {
            Task<byte[]> png = File.ReadAllBytesAsync(Path.ChangeExtension(file.FullName, ".png"));
            UndertaleEmbeddedTexture texture = new();
            Parallel.ForEach(File.ReadLines(file.FullName), line => {
                string[] sv1 = line.Split(',');
                if (sv1.Length != 5) {
                    logger.WriteLine($"{file.Name}: config error!");
                    return;
                }
                string key = sv1[0];
                int x = int.Parse(sv1[1]);
                int y = int.Parse(sv1[2]);
                int w = int.Parse(sv1[3]);
                int h = int.Parse(sv1[4]);

                int split_pos = key.LastIndexOf('_');
                if (split_pos < 0) {
                    logger.WriteLine($"[ImportSprites]{file.Name} {key}: key error!");
                    return;
                }
                int id = int.Parse(key[(split_pos + 1)..]);
                string name = key[..split_pos];
                UndertaleSprite sprite = GetSprite(name, logger);
                
                if (sprite == null) {
                    return;
                }
                if (id < 0 || id >= sprite.Textures.Count) {
                    logger.WriteLine($"[ImportSprites]no frame {id} for sprite {name}!");
                    return;
                }
                UndertaleTexturePageItem pageItem = sprite.Textures[id].Texture;
                pageItem.TexturePage = texture;
                pageItem.SourceX = (ushort)x;
                pageItem.SourceY = (ushort)y;
                if(w == pageItem.SourceWidth && h == pageItem.SourceHeight) {
                    return;
                }
                // 尺寸不一致
                if (!name.Contains("funnytext") && !name.Contains("battlemsg")) {
                    logger.WriteLine($"[ImportSprites]sprite size invalid:{name} is {w}*{h}, requires{pageItem.SourceWidth}*{pageItem.SourceHeight}");
                }
                if (sprite.CollisionMasks.Count > 0) {
                    logger.WriteLine($"[ImportSprites] size changed for sprite {name} with CollisionMask");
                }
                sprite.Width = (uint)w;
                sprite.Height = (uint)h;
                sprite.MarginLeft = 0;
                sprite.MarginTop = 0;
                sprite.MarginRight = w;
                sprite.MarginBottom = h;

                pageItem.TargetX = 0;
                pageItem.TargetY = 0;
                pageItem.SourceWidth = (ushort)w;
                pageItem.SourceHeight = (ushort)h;
                pageItem.TargetWidth = (ushort)w;
                pageItem.TargetHeight = (ushort)h;
                pageItem.BoundingWidth = (ushort)w;
                pageItem.BoundingHeight = (ushort)h;
                if (!name.Contains("funnytext")) {
                    return;
                }
                // 艺术字特殊处理 需要把origin居中
                var dx = sprite.OriginX - sprite.Width / 2;
                var dy = sprite.OriginY - sprite.Height / 2;
                if (dx < -1 || dx > 1 || dy < -1 || dy > 1) {
                    logger.WriteLine($"[ImportSprites]{name}: Origin point is {sprite.OriginX}, {sprite.OriginY}(expected {sprite.Width / 2},{sprite.Height / 2})");
                }
                sprite.OriginX = w / 2;
                sprite.OriginY = h / 2;
            });
            
            texture.TextureData.Image = GMImage.FromPng(await png);
            texture.Scaled = 1;
            lock(Data.EmbeddedTextures) {
                Data.EmbeddedTextures.Add(texture);
            }
        } catch (Exception e) {
            logger.WriteLine(e.Message);
            logger.Write(e.StackTrace);
        }
    });
}
