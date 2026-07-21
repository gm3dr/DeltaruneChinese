using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using NReco.Text;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using System.Text.RegularExpressions;
using UndertaleModLib;
using UndertaleModLib.Compiler;
using UndertaleModLib.Models;
using UndertaleModLib.Util;
namespace deltarunePacker
{
    public partial class Importer(string workspace, string resultPath, string datawinPath, LogLevel logLevel = LogLevel.Info) : Loader(resultPath, datawinPath, logLevel)
    {
        #region ImportSprite
        private static UndertaleSprite? GetSprite(UndertaleData datawin, string name)
        {
            UndertaleSprite sprite = datawin.Sprites.ByName(name, false);
            if (sprite != null)
            {
                return sprite;
            }
            UndertaleSprite baseSprite = datawin.Sprites.ByName(name.Replace("_zhname", ""), false);
            if (baseSprite == null)
            {
                return null;
            }
            sprite = new()
            {
                Name = datawin.Strings.MakeString(name),
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
            datawin.Sprites.Add(sprite);
            foreach (var frame in baseSprite.Textures)
            {
                UndertaleTexturePageItem item = frame.Texture;
                UndertaleTexturePageItem resultItem = new()
                {
                    SourceX = item.SourceX,
                    SourceY = item.SourceY,
                    TargetX = item.TargetX,
                    TargetY = item.TargetY,
                    TexturePage = item.TexturePage,
                    SourceWidth = item.SourceWidth,
                    TargetWidth = item.TargetWidth,
                    SourceHeight = item.SourceHeight,
                    TargetHeight = item.TargetHeight,
                    BoundingWidth = item.BoundingWidth,
                    BoundingHeight = item.BoundingHeight
                };
                sprite.Textures.Add(new() { Texture = resultItem });
                datawin.TexturePageItems.Add(resultItem);
            }
            return sprite;
        }

        public async Task ImportSprites(UndertaleData datawin)
        {
            Range[] segment = new Range[9];
            foreach (var file in new DirectoryInfo(Path.Combine(workspace, "imports/atlas")).GetFiles("*.cfg"))
            {
                Task<byte[]> png = File.ReadAllBytesAsync(Path.ChangeExtension(file.FullName, ".png"));
                Task<string[]> lines = File.ReadAllLinesAsync(file.FullName, Encoding.UTF8);
                UndertaleEmbeddedTexture texture = new()
                {
                    Scaled = 1
                };
                lock (datawin.EmbeddedTextures)
                {
                    datawin.EmbeddedTextures.Add(texture);
                }
                texture.TextureData.Image = GMImage.FromPng(await png);
                foreach (var line in await lines)
                {
                    int split_pos = line.LastIndexOf('_');
                    ReadOnlySpan<char> lineSpan = line.AsSpan(split_pos + 1);
                    if (lineSpan.Split(segment, ',') != 9 ||
                        !int.TryParse(lineSpan[segment[0]], out int id) ||
                        !uint.TryParse(lineSpan[segment[1]], out uint x) ||
                        !uint.TryParse(lineSpan[segment[2]], out uint y) ||
                        !uint.TryParse(lineSpan[segment[3]], out uint w) ||
                        !uint.TryParse(lineSpan[segment[4]], out uint h) ||
                        !uint.TryParse(lineSpan[segment[5]], out uint ix) ||
                        !uint.TryParse(lineSpan[segment[6]], out uint iy) ||
                        !uint.TryParse(lineSpan[segment[7]], out uint iw) ||
                        !uint.TryParse(lineSpan[segment[8]], out uint ih))
                    {
                        Warning($"[ImportSprites]{file.Name}: invalid param! {line}");
                        continue;
                    }
                    string name = line[..split_pos];
                    UndertaleSprite? sprite = GetSprite(datawin, name);
                    if (sprite == null)
                    {
                        Warning($"[ImportSprite]missing sprite: {name}");
                        continue;
                    }
                    if (id >= sprite.Textures.Count)
                    {
                        Warning($"[ImportSprites]{file.Name}: invalid frame! {line}");
                        continue;
                    }
                    UndertaleTexturePageItem pageItem = sprite.Textures[id].Texture;
                    pageItem.TexturePage = texture;
                    if (iw == pageItem.TargetWidth && ih == pageItem.TargetHeight)
                    {
                        // 实际尺寸一致 直接替换即可
                        pageItem.SourceX = (ushort)x;
                        pageItem.SourceY = (ushort)y;
                        pageItem.SourceWidth = (ushort)iw;
                        pageItem.SourceHeight = (ushort)ih;
                        Verbose($"[ImportSprite]{name} directly imported!");
                        continue;
                    }
                    pageItem.SourceX = (ushort)x;
                    pageItem.SourceY = (ushort)y;
                    pageItem.TargetWidth = (ushort)iw;
                    pageItem.TargetHeight = (ushort)ih;
                    if (w == pageItem.SourceWidth && h == pageItem.SourceHeight)
                    {
                        // 原尺寸一致 对准即可
                        pageItem.SourceWidth = (ushort)iw;
                        pageItem.SourceHeight = (ushort)ih;
                        pageItem.TargetX += (ushort)ix;
                        pageItem.TargetY += (ushort)iy;
                        Verbose($"[ImportSprite]{name} arranged imported!");
                        continue;
                    }
                    // 尺寸不一致
                    if (!name.Contains("zhname") && !name.Contains("funnytext", StringComparison.Ordinal) && !name.Contains("battlemsg", StringComparison.Ordinal))
                    {
                        // 这条只是提醒尺寸变了 不一定有问题 自查下即可
                        Warning($"[ImportSprites]{file.Name}: {name}_{id} is {w}*{h}, requires {pageItem.SourceWidth}*{pageItem.SourceHeight}");
                    }
                    pageItem.SourceWidth = (ushort)iw;
                    pageItem.SourceHeight = (ushort)ih;
                    pageItem.TargetX = (ushort)ix;
                    pageItem.TargetY = (ushort)iy;
                    // [重要][请自查] 要改尺寸的话每帧的图都得一样大
                    pageItem.BoundingWidth = (ushort)w;
                    pageItem.BoundingHeight = (ushort)h;
                    // sprite的参数只改一次 避免并发问题
                    if (id == 0)
                    {
                        sprite.OriginX = (int)(sprite.OriginX * w / sprite.Width);
                        sprite.OriginY = (int)(sprite.OriginY * h / sprite.Height);
                        sprite.Width = w;
                        sprite.Height = h;
                        sprite.MarginLeft = 0;
                        sprite.MarginTop = 0;
                        sprite.MarginRight = (int)w;
                        sprite.MarginBottom = (int)h;
                    }

                    if (sprite.CollisionMasks.Count > 0)
                    {
                        Warning($"[ImportSprites] size changed for sprite {name} with CollisionMask");
                    }
                    Verbose($"[ImportSprite]{name} resized imported!");
                }
            }
        }
        #endregion
        #region ImportTexts
        // 开头的\\cX要保留
        [GeneratedRegex(@"^(\s*\\[A-Zabd-z][A-Za-z0-9]\s*)+")] private static partial Regex RegexPrefix();
        [GeneratedRegex(@"/%*\s*$")] private static partial Regex RegexSuffix();
        [GeneratedRegex(@"(?<!\^[0-9])(\.+)\.(?=\s*[\w&])")] private static partial Regex RestoreEN();
        [GeneratedRegex(@"(?<!\^[0-9])([：？！，。]*)([：？！，。])(?=\s*[\w&])")] private static partial Regex RestoreCN();

        [GeneratedRegex(@"^[a-zA-Z0-9]")] private static partial Regex ReplacerSuffix();
        [GeneratedRegex(@"(?<![\\^~][a-zA-Z0-9]*)[a-zA-Z0-9]$")] private static partial Regex ReplacerPrefix();
        private string RestoreItem(string key, string item, string fmt)
        {
            bool hasNumberTag = !string.IsNullOrEmpty(fmt) && Regex.IsMatch(fmt, @"\^[0-9]");
            if (hasNumberTag)
            {
                // 标点前面加^1
                item = RestoreEN().Replace(item, "$1^1.");
                item = RestoreCN().Replace(item, "$1^1$2");
            }

            if (!string.IsNullOrEmpty(item) && string.IsNullOrEmpty(fmt))
            {
                Warning($"[RestoreItem]fmt empty: {key}");
            }
            else
            {
                // 恢复前后的特殊符号
                item = RegexPrefix().Match(fmt).Value + item + RegexSuffix().Match(fmt).Value;
            }
            if (item.StartsWith("\\m"))
            {
                // 小头像格式全角空格变一个普通空格
                item = item.Replace("\u3000", " ");
            }
            else
            {
                // 其他格式全角空格变两个普通空格
                item = item.Replace("\u3000", "  ");
            }
            // 不换行空格换成普通空格
            item = item.Replace('\u00A0', ' ');

            return item;
        }
        private static KeyValuePair<string, string> PairSelector(JProperty x) => new(x.Name, x.Value.ToString());
        private static string ReplaceItem(string key, string rawText, AhoCorasickDoubleArrayTrie<string> replacer)
        {
            if (key.Contains("special_name_check", StringComparison.OrdinalIgnoreCase)
             || key.Contains("spelling_bee", StringComparison.OrdinalIgnoreCase)
             || key.Contains("DEVICE_CONTACT", StringComparison.OrdinalIgnoreCase))
            {
                return rawText;
            }
            Stack<ReadOnlyMemory<char>> result = [];
            int curPos = rawText.Length;
            foreach (var hit in replacer.ParseText(rawText).OrderByDescending(x => x.End).ThenBy(x => x.Begin))
            {
                if (curPos < hit.End) continue;
                var suffixSpan = rawText.AsSpan(hit.End, curPos - hit.End);
                var prefixSpan = rawText.AsSpan(0, hit.Begin);
                if (!suffixSpan.IsEmpty && ReplacerSuffix().IsMatch(suffixSpan)) continue;
                if (!prefixSpan.IsEmpty && ReplacerPrefix().IsMatch(prefixSpan)) continue;
                result.Push(rawText.AsMemory(hit.End..curPos));
                result.Push(hit.Value.AsMemory());
                curPos = hit.Begin;
            }
            result.Push(rawText.AsMemory(0, curPos));
            return string.Concat(result);
        }
        public async Task ImportTexts(string targetJson, string baseJson, string fmtJson, string re_cnname, string re_recruit)
        {
            AhoCorasickDoubleArrayTrie<string> recruitReplacer = new(JObject.Parse(re_recruit).Properties().Select(PairSelector), true);
            AhoCorasickDoubleArrayTrie<string> cnnameReplacer = new(JObject.Parse(re_cnname).Properties().Select(PairSelector), true);
            JObject fmtData = JObject.Parse(fmtJson);
            JObject baseData = JObject.Parse(baseJson);
            JObject targetData = JObject.Parse(targetJson);

            using JsonTextWriter defaultWriter = new(File.CreateText(Path.Combine(ResultPath, "lang_en.json")));
            using JsonTextWriter cnnameWriter = new(File.CreateText(Path.Combine(ResultPath, "lang_en_names.json")));
            using JsonTextWriter recruitWriter = new(File.CreateText(Path.Combine(ResultPath, "lang_en_names_recruitable.json")));

            defaultWriter.Formatting = Formatting.Indented;
            cnnameWriter.Formatting = Formatting.Indented;
            recruitWriter.Formatting = Formatting.Indented;

            await defaultWriter.WriteStartObjectAsync();
            await cnnameWriter.WriteStartObjectAsync();
            await recruitWriter.WriteStartObjectAsync();
            foreach (JProperty fmtItem in fmtData.Properties())
            {
                var (fmtKey, fmtValue) = (fmtItem.Name, fmtItem.Value.ToString());
                bool hasFmt = baseData.TryGetValue(fmtKey, out JToken? baseItem);
                bool found = targetData.TryGetValue(fmtKey, out JToken? targetItem);
                if (!found && !hasFmt)
                {
                    continue;
                }
                if (!hasFmt)
                {
                    Warning($"[WriteRestoredJson]missing fmtKey {fmtKey}: {fmtValue}");
                    continue;
                }
                if (!found)
                {
                    Warning($"[WriteRestoredJson]no translation for {fmtKey}: {fmtValue}");
                }
                await defaultWriter.WritePropertyNameAsync(fmtKey);
                await cnnameWriter.WritePropertyNameAsync(fmtKey);
                await recruitWriter.WritePropertyNameAsync(fmtKey);
                string targetOrigin = (found ? targetItem : baseItem)!.ToString();
                await defaultWriter.WriteValueAsync(RestoreItem(fmtKey, targetOrigin, fmtValue));
                await cnnameWriter.WriteValueAsync(RestoreItem(fmtKey, ReplaceItem(fmtKey, targetOrigin, cnnameReplacer), fmtValue));
                await recruitWriter.WriteValueAsync(RestoreItem(fmtKey, ReplaceItem(fmtKey, targetOrigin, recruitReplacer), fmtValue));
            }
            await defaultWriter.WriteEndObjectAsync();
            await cnnameWriter.WriteEndObjectAsync();
            await recruitWriter.WriteEndObjectAsync();
        }
        #endregion
        #region ImportFonts

        private async Task ImportFonts(UndertaleData datawin)
        {
            Range[] segment = new Range[8];
            foreach (var file in new DirectoryInfo(Path.Combine(workspace, "imports/font/atlas")).GetFiles("*.cfg"))
            {
                string font_name = Path.GetFileNameWithoutExtension(file.Name);
                if(font_name.StartsWith("all_in_one")) continue;
                if(font_name.EndsWith("-0.cfg")) Warning($"[ImportFonts]{font_name} exceed font texture size!");
                UndertaleFont font = datawin.Fonts.ByName(font_name);
                font.RangeStart = 1;
                font.RangeEnd = 65535;
                Task<string[]> lines = File.ReadAllLinesAsync(file.FullName, Encoding.UTF8);
                Task replaceTexture = File.ReadAllBytesAsync(file.FullName.Replace(".cfg",".png"))
                    .ContinueWith(png => {
                        GMImage img = GMImage.FromPng(png.Result);
                        UndertaleEmbeddedTexture texture = new() {
                            TextureWidth = img.Width,
                            TextureHeight = img.Height,
                            TextureData = new(){ Image = img }
                        };
                        UndertaleTexturePageItem pageItem = font.Texture;
                        pageItem.SourceX = 0;
                        pageItem.SourceY = 0;
                        pageItem.TargetX = 0;
                        pageItem.TargetY = 0;
                        pageItem.TexturePage = texture;
                        pageItem.SourceWidth = (ushort)texture.TextureWidth;
                        pageItem.TargetWidth = (ushort)texture.TextureWidth;
                        pageItem.SourceHeight = (ushort)texture.TextureHeight;
                        pageItem.TargetHeight = (ushort)texture.TextureHeight;
                        pageItem.BoundingWidth = (ushort)texture.TextureWidth;
                        pageItem.BoundingHeight = (ushort)texture.TextureHeight;
                        lock (datawin.EmbeddedTextures) datawin.EmbeddedTextures.Add(texture);
                    });
                font.Glyphs = [..(await lines).Select(line => {
                    ReadOnlySpan<char> lineSpan = line.AsSpan();
                    if (lineSpan.Split(segment, ',') != 8 ||
                        !ushort.TryParse(lineSpan[segment[1]], out ushort id) ||
                        !short.TryParse(lineSpan[segment[2]], out short shift) ||
                        !short.TryParse(lineSpan[segment[3]], out short offset) ||
                        !ushort.TryParse(lineSpan[segment[4]], out ushort x) ||
                        !ushort.TryParse(lineSpan[segment[5]], out ushort y) ||
                        !ushort.TryParse(lineSpan[segment[6]], out ushort w) ||
                        !ushort.TryParse(lineSpan[segment[7]], out ushort h) )
                    {
                        Warning($"[ImportFonts]{file.Name}: invalid param! {line}");
                        return null!;
                    }
                    return new UndertaleFont.Glyph {
                        Character = id,
                        SourceX = x,
                        SourceY = y,
                        SourceWidth = w,
                        SourceHeight = h,
                        Offset = offset,
                        Shift = shift,
                    };
                }).Where(glyph => glyph != null)
                .OrderBy(glyph => glyph.Character)];
            }
        }
        #endregion
        #region ImportCodes
        public async Task ImportCodes(UndertaleData datawin, Task previousTask)
        {
            CodeImportGroup importGroup = new(datawin);
            foreach (var file in new DirectoryInfo(Path.Combine(workspace, "imports/code")).GetFiles()){
                string fileName = Path.GetFileNameWithoutExtension(file.Name);
                Task<string> content = File.ReadAllTextAsync(file.FullName, Encoding.UTF8);
                if (datawin.Code.ByName(fileName) == null)
                {
                    Warning($"[ImportCodes]code not exist within data.win: {fileName}");
                    continue;
                }
                importGroup.QueueReplace(fileName, await content);
            }
            // 代码编译可能依赖新增的sprite
            await previousTask;
            CompileResult result = importGroup.Import();
            if (!result.Successful)
            {
                Warning($"[ImportCodes]compile failed: {result.PrintAllErrors(true)}");
            }
            if (datawin.Variables.Any(x => x.Name.Content.Contains("zhname")))
            {
                Error($"[ImportCodes]unexpected result!");
            }
        }
        #endregion
        public async Task Run()
        {
            Task<UndertaleData> datawinTask = Task.Run(LoadData);
            Task<string> cn = File.ReadAllTextAsync(Path.Combine(workspace, "imports/text_src/cn.json"), Encoding.UTF8);
            Task<string> en = File.ReadAllTextAsync(Path.Combine(workspace, "imports/text_src/en.json"), Encoding.UTF8);
            Task<string> fmt = File.ReadAllTextAsync(Path.Combine(workspace, "lang_ja.json"), Encoding.UTF8);
            Task<string> re_cnname = File.ReadAllTextAsync(Path.Combine(workspace, "../global/re_cnname.json"), Encoding.UTF8);
            Task<string> re_recruit = File.ReadAllTextAsync(Path.Combine(workspace, "../global/re_recruit.json"), Encoding.UTF8);
            Task importTexts = ImportTexts(await cn, await en, await fmt, await re_cnname, await re_recruit);

            using UndertaleData datawin = await datawinTask;
            Task importCodes = ImportCodes(datawin, ImportSprites(datawin));
            Task importFonts = ImportFonts(datawin);
            await Task.WhenAll(importFonts, importCodes);

            using FileStream output = new(Path.Combine(ResultPath, "data.win"), FileMode.Create, FileAccess.Write);

            Info($"saving {ResultPath} ...");
            UndertaleIO.Write(output, datawin);
            await importTexts;
            Info($"{ResultPath} saved!");
        }
        /**
        * 只导入字体和代码，启动器逻辑
        */
        public async Task RunMain()
        {
            UndertaleData datawin = LoadData();
            Task importCodes = ImportCodes(datawin, Task.CompletedTask);
            Task importFonts = ImportFonts(datawin);
            await Task.WhenAll(importFonts, importCodes);

            using FileStream output = new(Path.Combine(ResultPath, "data.win"), FileMode.Create, FileAccess.Write);

            Info($"saving {ResultPath} ...");
            UndertaleIO.Write(output, datawin);
            Info($"{ResultPath} saved!");
        }

        /**
        * 文本不做处理，字体使用ch1+ch2的字符集
        **/
        public async Task RunDemo()
        {
            UndertaleData datawin = LoadData();
            Task importCodes = ImportCodes(datawin, ImportSprites(datawin));
            Task importFonts = ImportFonts(datawin);
            await Task.WhenAll(importFonts, importCodes);

            using FileStream output = new(Path.Combine(ResultPath, "data.win"), FileMode.Create, FileAccess.Write);

            Info($"saving {ResultPath} ...");
            UndertaleIO.Write(output, datawin);
            Info($"{ResultPath} saved!");
        }

    }
}