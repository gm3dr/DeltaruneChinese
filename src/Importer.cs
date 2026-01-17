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
        [GeneratedRegex(@"(?<!\\[a-zA-Z0-9]*)[a-zA-Z0-9]$")] private static partial Regex ReplacerPrefix();
        private string RestoreItem(string key, string item, string fmt)
        {
            if (item.StartsWith('@'))
            {
                // 标记为不用加^1
                item = item[1..];
            }
            else
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
                var suffix = rawText.AsMemory(hit.End..curPos);
                var prefix = rawText.AsMemory(..hit.Begin);
                if (!suffix.IsEmpty && ReplacerSuffix().IsMatch(suffix.Span)) continue;
                if (!prefix.IsEmpty && ReplacerPrefix().IsMatch(prefix.Span)) continue;
                result.Push(suffix);
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
        [GeneratedRegex(@"char id=(\d+)\s+x=(\d+)\s+y=(\d+)\s+width=(\d+)\s+height=(\d+)\s+xoffset=(-?\d+)\s+yoffset=(-?\d+)\s+xadvance=(\d+)", RegexOptions.Compiled)] private static partial Regex Pattern();
        [GeneratedRegex(@"# xoffset=(-?\d+)")] private static partial Regex XOffset();
        [GeneratedRegex(@"# yoffset=(-?\d+)")] private static partial Regex YOffset();
        [GeneratedRegex(@"# cnShift=(-?\d+)")] private static partial Regex CNShift();
        private readonly string dumpPath = Path.Combine(resultPath, "dump");
        private readonly string dictPath = Path.Combine(resultPath, "dump/dict.txt");
        private async Task ImportFontData(Task<UndertaleData> datawinTask, string font_name, string outputPath, string bmfc)
        {
            string pngPath = Path.Combine(dumpPath, $"{font_name}_0.png");
            // 检查后置 出错了直接把任务崩掉就行
            // 这里可能还有救 说不定等一会还能刷出来
            while (!File.Exists(outputPath) || !File.Exists(pngPath)) Info($"[ImportFonts]{font_name} bmfont output not found!");
            var readFnt = File.ReadAllTextAsync(outputPath, Encoding.UTF8).ContinueWith(fnt =>
            {
                Int16 xoffset = Int16.Parse(XOffset().Match(bmfc).Groups[1].Value);
                Int16 yoffset = Int16.Parse(YOffset().Match(bmfc).Groups[1].Value);
                Int16 cnShift = Int16.Parse(CNShift().Match(bmfc).Groups[1].Value);
                UInt16 extraH = (UInt16)Math.Abs(yoffset);
                var glyphs = Pattern().Matches(fnt.Result).Select(match =>
                {
                    UndertaleFont.Glyph glyph = new()
                    {
                        Character = UInt16.Parse(match.Groups[1].Value),
                        SourceX = (UInt16)(int.Parse(match.Groups[2].Value) + 1),
                        SourceY = (UInt16)(int.Parse(match.Groups[3].Value) + 1),
                        SourceWidth = (UInt16)(int.Parse(match.Groups[4].Value) - 2),
                        SourceHeight = (UInt16)(int.Parse(match.Groups[5].Value) - 2),
                        Offset = (Int16)(int.Parse(match.Groups[6].Value) + 1),
                        Shift = Int16.Parse(match.Groups[8].Value)
                    };
                    // 解决中英混排问题
                    if (glyph.Character > 127)
                    {
                        glyph.Offset += xoffset;
                        glyph.Shift += cnShift;
                    }
                    if ((yoffset > 0 && glyph.Character <= 127) ||
                        (yoffset < 0 && glyph.Character > 127))
                    {
                        glyph.SourceY += extraH;
                        glyph.SourceHeight -= extraH;
                    }
                    return glyph;
                }).Aggregate(new UndertalePointerList<UndertaleFont.Glyph>(), (result, item) =>
                {
                    result.Add(item);
                    return result;
                });
                return glyphs;
            });
            var readPng = File.ReadAllBytesAsync(pngPath).ContinueWith(png =>
            {
                GMImage img = GMImage.FromPng(png.Result);
                return new UndertaleEmbeddedTexture()
                {
                    TextureWidth = img.Width,
                    TextureHeight = img.Height,
                    TextureData = new()
                    {
                        Image = img
                    }
                };
            });
            UndertaleData datawin = await datawinTask;
            UndertaleFont font = datawin.Fonts.ByName(font_name);
            font.RangeStart = 1;
            font.RangeEnd = 65535;
            UndertaleTexturePageItem pageItem = font.Texture;
            pageItem.SourceX = 0;
            pageItem.SourceY = 0;
            pageItem.TargetX = 0;
            pageItem.TargetY = 0;
            UndertaleEmbeddedTexture texture = await readPng;
            pageItem.TexturePage = texture;
            pageItem.SourceWidth = (ushort)texture.TextureWidth;
            pageItem.TargetWidth = (ushort)texture.TextureWidth;
            pageItem.SourceHeight = (ushort)texture.TextureHeight;
            pageItem.TargetHeight = (ushort)texture.TextureHeight;
            pageItem.BoundingWidth = (ushort)texture.TextureWidth;
            pageItem.BoundingHeight = (ushort)texture.TextureHeight;
            lock (datawin.EmbeddedTextures) datawin.EmbeddedTextures.Add(texture);
            font.Glyphs = await readFnt;
            if (File.Exists(Path.Combine(dumpPath, $"{font_name}_1.png"))) Warning($"[ImportFonts]{font_name} exceed font texture size!");
        }
        public async Task ImportFonts(Task<UndertaleData> datawinTask, IEnumerable<Task<string>> dictContents)
        {
            // 清一下上次的dump 防止出错
            if (Directory.Exists(dumpPath)) Directory.Delete(dumpPath, true);
            Directory.CreateDirectory(dumpPath);

            // dic.txt需要是UTF-16的
            Task writeDict = Task.WhenAll(dictContents).ContinueWith(task =>
            {
                char[] set = [.. task.Result.SelectMany(x => x).Distinct()];
                File.WriteAllBytes(dictPath, Encoding.Unicode.GetBytes(set));
            });
            Task copyFiles = Task.Run(() =>
            {
                foreach (var config in new DirectoryInfo(Path.Combine(workspace, "imports/font/font")).GetFiles())
                {
                    File.Copy(config.ToString(), Path.Combine(dumpPath, config.Name));
                }
            });
            await Task.WhenAll(new DirectoryInfo(Path.Combine(workspace, "imports/font/bmfc")).GetFiles().Select(async config =>
            {
                Task<string> bmfc = File.ReadAllTextAsync(config.FullName, Encoding.UTF8);
                string font_name = Path.GetFileNameWithoutExtension(config.Name);
                IEnumerable<string> segments = new DirectoryInfo(Path.Combine(workspace, "imports/font/pics", font_name)).GetFiles()
                    .Select(img =>
                    {
                        Span<Range> tokens = stackalloc Range[3];
                        ReadOnlySpan<char> imgName = Path.GetFileNameWithoutExtension(img.FullName.AsSpan());
                        imgName.Split(tokens, ',');
                        return $"icon=\"{img.FullName}\",{imgName[tokens[0]]},{imgName[tokens[2]]},{0},{imgName[tokens[1]]}\n";
                        //参考格式: icon=".../imports/font/pics/fnt_main/id,xadv,xoff.png",id,xoff,yoff,xadv
                    });
                // 回写完整的配置文件
                string configPath = Path.Combine(dumpPath, config.Name);
                Task writeCfg = File.WriteAllTextAsync(configPath, string.Concat(segments.Prepend(await bmfc)), Encoding.UTF8);
                string outputPath = Path.Combine(dumpPath, $"{font_name}.fnt");
                Process bmfont = new()
                {
                    StartInfo = new ProcessStartInfo()
                    {
                        FileName = "bmfont64.exe",
                        CreateNoWindow = true,
                        RedirectStandardOutput = true,
                        ArgumentList = {
                            "-c", configPath,
                            "-o", outputPath,
                            "-t", dictPath
                        }
                    }
                };
                // 这里是关键路径 一点都不能耽搁
                await writeDict;
                await copyFiles;
                await writeCfg;
                bmfont.Start();
                Info($"[ImportFonts]{font_name} started!");
                await bmfont!.WaitForExitAsync();
                Info($"[ImportFonts]{font_name} finished!");
                await ImportFontData(datawinTask, font_name, outputPath, bmfc.Result);
                Info($"[ImportFonts]{font_name} imported!");
            }));
        }
        #endregion
        #region ImportCodes
        public async Task ImportCodes(UndertaleData datawin, IEnumerable<(string, Task<string>)> taskBag, Task previousTask)
        {
            CodeImportGroup importGroup = new(datawin);
            foreach (var (fileName, content) in taskBag)
            {
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
            IEnumerable<(string fileName, Task<string> content)> taskBag = [.. new DirectoryInfo(Path.Combine(workspace, "imports/code")).GetFiles()
                .Select(file => (Path.GetFileNameWithoutExtension(file.Name), File.ReadAllTextAsync(file.FullName, Encoding.UTF8))
            ).ToArray()];
            Task<string> re_cnname = File.ReadAllTextAsync(Path.Combine(workspace, "../global/re_cnname.json"), Encoding.UTF8);
            Task<string> cn = File.ReadAllTextAsync(Path.Combine(workspace, "imports/text_src/cn.json"), Encoding.UTF8);
            Task<UndertaleData> datawinTask = Task.Run(LoadData);
            Task importFonts = ImportFonts(datawinTask, taskBag.Select(x => x.content).Append(re_cnname).Append(cn));

            UndertaleData datawin = await datawinTask; // 卡一下后面的任务 腾出CPU让bmfont早点执行完
            Task<string> re_recruit = File.ReadAllTextAsync(Path.Combine(workspace, "../global/re_recruit.json"), Encoding.UTF8);
            Task<string> fmt = File.ReadAllTextAsync(Path.Combine(workspace, "imports/text_src/raw.json"), Encoding.UTF8);
            Task<string> en = File.ReadAllTextAsync(Path.Combine(workspace, "imports/text_src/en.json"), Encoding.UTF8);
            using FileStream output = new(Path.Combine(ResultPath, "data.win"), FileMode.Create, FileAccess.Write);
            Task importTexts = ImportTexts(await cn, await en, await fmt, await re_cnname, await re_recruit);

            // using UndertaleData datawin = await datawinTask;// 如果对CPU很有信心的可以把上面那行await挪到这里
            Task importCodes = ImportCodes(datawin, taskBag, ImportSprites(datawin));
            await importFonts;
            await importCodes;
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
            IEnumerable<(string fileName, Task<string> content)> taskBag = [.. new DirectoryInfo(Path.Combine(workspace, "imports/code")).GetFiles()
                .Select(file => (Path.GetFileNameWithoutExtension(file.Name), File.ReadAllTextAsync(file.FullName, Encoding.UTF8))
            ).ToArray()];
            Task<UndertaleData> datawinTask = Task.Run(LoadData);
            // ⭐ 字体：只用 code 的字符集
            Task importFonts = ImportFonts(datawinTask,taskBag.Select(x => x.content));

            UndertaleData datawin = await datawinTask;

            // code 本身还是照常导入
            Task importCodes = ImportCodes(datawin,taskBag, Task.CompletedTask);
            await Task.WhenAll(importFonts, importCodes);

            using FileStream output = new(Path.Combine(ResultPath, "data.win"),FileMode.Create,FileAccess.Write);

            Info($"saving {ResultPath} ...");
            UndertaleIO.Write(output, datawin);
            Info($"{ResultPath} saved!");
        }

    }
}