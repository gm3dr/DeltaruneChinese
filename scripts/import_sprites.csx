
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
async Task ImportSprites(string path, StreamWriter logger) {
    await Parallel.ForEachAsync(new DirectoryInfo(path).EnumerateFiles().Where(file => file.Extension == ".cfg"), async (file, _) => {
        Task<byte[]> png = File.ReadAllBytesAsync(Path.ChangeExtension(file.FullName, ".png"));
        UndertaleEmbeddedTexture texture = new();
        Parallel.ForEach(File.ReadLines(file.FullName), line => {
            string[] sv1 = line.Split(',');
            if (sv1.Length != 9) {
                logger.WriteLine($"[ImportSprites]{file.Name}: invalid config! {line}");
                return;
            }
            string key = sv1[0];
            int split_pos = key.LastIndexOf('_');
            if (split_pos < 0) {
                logger.WriteLine($"[ImportSprites]{file.Name}: invalid key! {line}");
                return;
            }
            if (!int.TryParse(key[(split_pos + 1)..], out int id)) {
                logger.WriteLine($"[ImportSprites]{file.Name}: invalid id! {line}");
                return;
            }
            string name = key[..split_pos];
            UndertaleSprite sprite = GetSprite(name, logger);
            if (sprite == null) {
                return;
            }
            if (id < 0 || id >= sprite.Textures.Count) {
                logger.WriteLine($"[ImportSprites]{file.Name}: invalid frame! {line}");
                return;
            }
            
            if (!uint.TryParse(sv1[1], out uint x) ||
                !uint.TryParse(sv1[2], out uint y) ||
                !uint.TryParse(sv1[3], out uint w) ||
                !uint.TryParse(sv1[4], out uint h) ||
                !uint.TryParse(sv1[5], out uint ix) ||
                !uint.TryParse(sv1[6], out uint iy) ||
                !uint.TryParse(sv1[7], out uint iw) ||
                !uint.TryParse(sv1[8], out uint ih)) {
                logger.WriteLine($"[ImportSprites]{file.Name}: invalid param! {line}");
                return;
            }
            UndertaleTexturePageItem pageItem = sprite.Textures[id].Texture;
            pageItem.TexturePage = texture;
            pageItem.SourceX = (ushort)x;
            pageItem.SourceY = (ushort)y;
            if(w == pageItem.SourceWidth && h == pageItem.SourceHeight) {
                pageItem.TargetX += (ushort)ix;
                pageItem.TargetY += (ushort)iy;
                pageItem.SourceWidth -= (ushort)(w - iw);
                pageItem.SourceHeight -= (ushort)(h - ih);
                pageItem.TargetWidth -= (ushort)(w - iw);
                pageItem.TargetHeight -= (ushort)(h - ih);
                return;
            }
            // 尺寸不一致
            if (!name.Contains("funnytext") && !name.Contains("battlemsg")) {
                // 这条只是提醒尺寸变了 不一定有问题 自查下即可
                logger.WriteLine($"[ImportSprites]{file.Name}: {key} is {w}*{h}, requires{pageItem.SourceWidth}*{pageItem.SourceHeight}");
            }
            if (sprite.CollisionMasks.Count > 0) {
                logger.WriteLine($"[ImportSprites] size changed for sprite {name} with CollisionMask");
            }
            // [重要][请自查] 要改尺寸的话每帧的图都得一样大
            // sprite的参数只改一次 避免并发问题
            if (id == 0) {
                sprite.OriginX = (int)(sprite.OriginX * w / sprite.Width);
                sprite.OriginY = (int)(sprite.OriginY * h / sprite.Height);
                sprite.Width = w;
                sprite.Height = h;
                sprite.MarginLeft = 0;
                sprite.MarginTop = 0;
                sprite.MarginRight = (int)w;
                sprite.MarginBottom = (int)h;
            }

            pageItem.TargetX = (ushort)ix;
            pageItem.TargetY = (ushort)iy;
            pageItem.SourceWidth = (ushort)iw;
            pageItem.SourceHeight = (ushort)ih;
            pageItem.TargetWidth = (ushort)iw;
            pageItem.TargetHeight = (ushort)ih;
            pageItem.BoundingWidth = (ushort)w;
            pageItem.BoundingHeight = (ushort)h;

            // if (!name.Contains("funnytext")) {
            //     return;
            // }
            // // 艺术字特殊处理 需要把origin居中
            // var dx = sprite.OriginX - sprite.Width / 2;
            // var dy = sprite.OriginY - sprite.Height / 2;
            // if (dx < -1 || dx > 1 || dy < -1 || dy > 1) {
            //     logger.WriteLine($"[ImportSprites]{name}: Origin point is {sprite.OriginX}, {sprite.OriginY}(expected {sprite.Width / 2},{sprite.Height / 2})");
            // }
            // sprite.OriginX = w / 2;
            // sprite.OriginY = h / 2;
        });
        
        texture.TextureData.Image = GMImage.FromPng(await png);
        texture.Scaled = 1;
        lock(Data.EmbeddedTextures) {
            Data.EmbeddedTextures.Add(texture);
        }
    });
}
