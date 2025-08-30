using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Text.RegularExpressions;
using System.Collections.Concurrent;
using System.Diagnostics;
using System.Text;
using UndertaleModLib.Compiler;
using UndertaleModLib.Models;
using UndertaleModLib.Util;
using UndertaleModLib;
namespace DeltarunePacker
{
    public enum LogLevel { All, Info, Warning, Error, Assert, Off}
    public partial class Importer(string datawinPath, string workspace, string resultPath, LogLevel logLevel = LogLevel.Info)
    {
        private readonly UndertaleData datawin = UndertaleIO.Read(new FileStream(datawinPath, FileMode.Open, FileAccess.Read), (warning, isImportant) => Console.WriteLine($"[LoadDataWin]warning: {warning}"));
        private readonly StreamWriter m_logger = new(new FileStream(Path.Combine(resultPath, "log.txt"), FileMode.Create, FileAccess.Write));

        private void Verbose(string msg) { if (logLevel <= LogLevel.All) Console.WriteLine("[V]" + msg); }
        private void Info(string msg) { if (logLevel <= LogLevel.Info) Console.WriteLine("[I]" + msg); }
        private void Warning(string msg) {
            if (logLevel <= LogLevel.Warning) {
                string full = "[W]" + msg;
                m_logger.WriteLine(full);
                Console.WriteLine(full);
            }
        }
        private void Error(string msg) {
            if (logLevel <= LogLevel.Error) {
                string full = $"[E]{msg}\n{new StackTrace().ToString()}";
                m_logger.Write(full);
                Console.Error.Write(full);
            }
        }
        private void Assert(string msg) {
            if (logLevel <= LogLevel.Assert) {
                string full = $"{msg}\n{new StackTrace().ToString()}";
                m_logger.Write(full);
                Console.Error.Write(full);
            }
            throw new Exception(msg);
        }
        #region ImportSprite
        private UndertaleSprite? GetSprite(string name) {
            UndertaleSprite sprite = datawin.Sprites.ByName(name, false);
            if (sprite != null) {
                return sprite;
            }
            UndertaleSprite baseSprite = datawin.Sprites.ByName(name.Replace("_zhname", ""), false);
            if (baseSprite == null) {
                return null;
            }
            sprite = new() {
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
            foreach (var frame in baseSprite.Textures) {
                UndertaleTexturePageItem item = frame.Texture;
                UndertaleTexturePageItem resultItem = new() {
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

        public async Task ImportSprites() {
            Range[] segment = new Range[9];
            foreach(var file in new DirectoryInfo(Path.Combine(workspace, "imports/atlas")).EnumerateFiles("*.cfg")) {
                Task<byte[]> png = File.ReadAllBytesAsync(Path.ChangeExtension(file.FullName, ".png"));
                Task<string[]> lines = File.ReadAllLinesAsync(file.FullName, Encoding.UTF8);
                UndertaleEmbeddedTexture texture = new() {
                    Scaled = 1
                };
                lock (datawin.EmbeddedTextures) {
                    datawin.EmbeddedTextures.Add(texture);
                }
                texture.TextureData.Image = GMImage.FromPng(await png);
                foreach (var line in await lines) {
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
                        !uint.TryParse(lineSpan[segment[8]], out uint ih)) {
                        Warning($"[ImportSprites]{file.Name}: invalid param! {line}");
                        continue;
                    }
                    string name = line[..split_pos];
                    UndertaleSprite? sprite = GetSprite(name);
                    if (sprite == null) {
                        Warning($"[ImportSprite]missing sprite: {name}");
                        continue;
                    }
                    if (id >= sprite.Textures.Count) {
                        Warning($"[ImportSprites]{file.Name}: invalid frame! {line}");
                        continue;
                    }
                    UndertaleTexturePageItem pageItem = sprite.Textures[id].Texture;
                    pageItem.TexturePage = texture;
                    if (iw == pageItem.TargetWidth && ih == pageItem.TargetHeight) {
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
                    if (w == pageItem.SourceWidth && h == pageItem.SourceHeight) {
                        // 原尺寸一致 对准即可
                        pageItem.SourceWidth = (ushort)iw;
                        pageItem.SourceHeight = (ushort)ih;
                        pageItem.TargetX += (ushort)ix;
                        pageItem.TargetY += (ushort)iy;
                        Verbose($"[ImportSprite]{name} arranged imported!");
                        continue;
                    }
                    // 尺寸不一致
                    if (!name.Contains("zhname") && !name.Contains("funnytext", StringComparison.Ordinal) && !name.Contains("battlemsg", StringComparison.Ordinal)) {
                        // 这条只是提醒尺寸变了 不一定有问题 自查下即可
                        Info($"[ImportSprites]{file.Name}: {name}_{id} is {w}*{h}, requires {pageItem.SourceWidth}*{pageItem.SourceHeight}");
                    }
                    pageItem.SourceWidth = (ushort)iw;
                    pageItem.SourceHeight = (ushort)ih;
                    pageItem.TargetX = (ushort)ix;
                    pageItem.TargetY = (ushort)iy;
                    // [重要][请自查] 要改尺寸的话每帧的图都得一样大
                    pageItem.BoundingWidth = (ushort)w;
                    pageItem.BoundingHeight = (ushort)h;
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

                    if (sprite.CollisionMasks.Count > 0) {
                        Warning($"[ImportSprites] size changed for sprite {name} with CollisionMask");
                    }
                    Verbose($"[ImportSprite]{name} resized imported!");
                }
            }
        }
        #endregion
        #region ImportTexts
        // 开头的\\cX要保留
        [GeneratedRegex(@"^(\s*\\[A-Zabd-z][A-Za-z0-9]\s*)+")]
        private static partial Regex RegexPrefix();
        [GeneratedRegex(@"/%*\s*$")]
        private static partial Regex RegexSuffix();
        [GeneratedRegex(@"(?<!\^[0-9])(\.+)\.(?=\s*[\w&])")]
        private static partial Regex RestoreEN();
        [GeneratedRegex(@"(?<!\^[0-9])([：？！，。]*)([：？！，。])(?=\s*[\w&])")]
        private static partial Regex RestoreCN();
        private string RestoreItem(string key, string item, string fmt) {
            if (item.StartsWith('@')) {
                // 标记为不用加^1
                item = item[1..];
            } else {
                // 标点前面加^1
                item = RestoreEN().Replace(item, "$1^1.");
                item = RestoreCN().Replace(item, "$1^1$2");
            }

            if (!string.IsNullOrEmpty(item) && string.IsNullOrEmpty(fmt)) {
                Warning($"[RestoreItem]fmt empty: {key}");
            } else {
                // 恢复前后的特殊符号
                item = RegexPrefix().Match(fmt).Value + item + RegexSuffix().Match(fmt).Value;
            }
            if (item.StartsWith("\\m")) {
                // 小头像格式全角空格变一个普通空格
                item = item.Replace("\u3000", " ");
            } else {
                // 其他格式全角空格变两个普通空格
                item = item.Replace("\u3000", "  ");
            }
            // 不换行空格换成普通空格
            item = item.Replace('\u00A0', ' ');

            return item;
        }
        public void ImportTexts(string targetJson, string baseJson, string fmtJson) {
            JObject fmtData = JObject.Parse(fmtJson);
            JObject baseData = JObject.Parse(baseJson);
            JObject targetData = JObject.Parse(targetJson);
            using JsonTextWriter writer = new(File.CreateText(Path.Combine(resultPath, "lang_en.json")));
            writer.Formatting = Formatting.Indented;
            Task writeTask = writer.WriteStartObjectAsync();
            foreach (var fmtItem in fmtData.Properties()) {
                var (fmtKey, fmtValue) = (fmtItem.Name, fmtItem.Value.ToString());
                bool hasFmt = baseData.TryGetValue(fmtKey, out var baseItem);
                bool found = targetData.TryGetValue(fmtKey, out var targetItem);
                if (!found && !hasFmt) {
                    continue;
                } else if (!found) {
                    Warning($"[WriteRestoredJson]no translation for {fmtKey}: {fmtValue}");
                } else if (!hasFmt) {
                    Warning($"[WriteRestoredJson]missing fmtKey {fmtKey}: {fmtValue}");
                    continue;
                }
                string targetValue = RestoreItem(fmtKey, (found ? targetItem : baseItem)!.ToString(), fmtValue);
                writeTask = writeTask.ContinueWith(_ => {
                    writer.WritePropertyName(fmtKey);
                    writer.WriteValue(targetValue);
                });
            }
            writeTask.ContinueWith(_ => writer.WriteEndObject()).Wait();
        }
        #endregion
        #region ImportFonts
        [GeneratedRegex(@"char id=(\d+)\s+x=(\d+)\s+y=(\d+)\s+width=(\d+)\s+height=(\d+)\s+xoffset=(-?\d+)\s+yoffset=(-?\d+)\s+xadvance=(\d+)", RegexOptions.Compiled)]
        private static partial Regex Pattern();
        [GeneratedRegex(@"# xoffset=(-?\d+)")]
        private static partial Regex XOffset();
        [GeneratedRegex(@"# yoffset=(-?\d+)")]
        private static partial Regex YOffset();
        [GeneratedRegex(@"# cnShift=(-?\d+)")]
        private static partial Regex CNShift();
        private readonly string dumpPath = Path.Combine(resultPath, "dump");
        private readonly string dictPath = Path.Combine(resultPath, "dump/dict.txt");
        public void ImportFonts(IEnumerable<Task<(string fileName, string content)> > taskBag, string extraString) {
            // 清一下上次的dump 防止出错
            if (Directory.Exists(dumpPath)) {
                Directory.Delete(dumpPath, true);
            }
            Directory.CreateDirectory(dumpPath);

            Task copyFiles = Task.Run(() => {
                foreach (var config in new DirectoryInfo(Path.Combine(workspace, "imports/font/font")).EnumerateFiles().AsParallel()) {
                    File.Copy(config.ToString(), Path.Combine(dumpPath, config.Name));
                }
            });
            Task writeDict = Task.Run(async () => {
                // dic.txt需要是UTF-16的
                using FileStream dict = new(dictPath, FileMode.Create, FileAccess.Write);
                dict.Write(Encoding.Unicode.GetBytes(extraString));
                foreach (var taskItem in taskBag) {
                    dict.Write(Encoding.Unicode.GetBytes((await taskItem).content)); 
                }
            });
            Parallel.ForEach(new DirectoryInfo(Path.Combine(workspace, "imports/font/bmfc")).EnumerateFiles(), config => {
                Task<string> bmfc = File.ReadAllTextAsync(config.FullName, Encoding.UTF8);
                string font_name = Path.GetFileNameWithoutExtension(config.Name);
                if (font_name == null) {
                    return;
                }
                string configPath = Path.Combine(dumpPath, config.Name);
                StringBuilder cfgPics = new();
                foreach (FileInfo img in new DirectoryInfo(Path.Combine(workspace, "imports/font/pics", font_name)).EnumerateFiles()) {
                    //33,2,1.png
                    string[] tokens = img.Name.Split(',');
                    //参考格式: icon=".../imports/font/pics/fnt_main/id,xadv,xoff.png",id,xoff,yoff,xadv
                    cfgPics.Append($"icon=\"{img.FullName}\",{tokens[0]},{tokens[2].Replace(".png", "")},{0},{tokens[1]}'\n'");
                }
                // 回写完整的配置文件
                Task writeCfg = bmfc.ContinueWith(task => File.WriteAllText(configPath, cfgPics.Insert(0, task.Result).ToString(), Encoding.UTF8));
                string outputPath = Path.Combine(dumpPath, $"{font_name}.fnt");
                using Process bmfont = new();
                bmfont.StartInfo = new ProcessStartInfo() {
                    FileName = Path.Combine(workspace, "../bmfont64.exe"),
                    WorkingDirectory = workspace,
                    CreateNoWindow = true,
                    RedirectStandardOutput = true,
                    ArgumentList = {
                        "-c", configPath,
                        "-o", outputPath,
                        "-t", Path.Combine(dumpPath, "dict.txt")
                    }
                };
                // 这里是关键路径 一点都不能耽搁
                // 检查后置 自旋等待 出错了直接把任务崩掉就行
                Task.WhenAll(copyFiles, writeDict, writeCfg).ContinueWith(_ => {
                    bmfont.Start();
                    Info($"[ImportFonts]{font_name} started!");
                    bmfont!.WaitForExitAsync().ContinueWith(_ => {
                        string pngPath = Path.Combine(dumpPath, $"{font_name}_0.png");
                        while (!File.Exists(outputPath) || !File.Exists(pngPath)) {
                            Info($"[ImportFonts]{font_name} bmfont output not found!");
                        }
                        Task<string> readGlyphs = File.ReadAllTextAsync(outputPath, Encoding.UTF8);
                        Task<byte[]> readTexture = File.ReadAllBytesAsync(pngPath);
                        UndertaleFont font = datawin.Fonts.ByName(font_name);
                        font.Glyphs.Clear();
                        Int16 xoffset = Int16.Parse(XOffset().Match(bmfc.Result).Groups[1].Value);
                        Int16 yoffset = Int16.Parse(YOffset().Match(bmfc.Result).Groups[1].Value);
                        Int16 cnShift = Int16.Parse(CNShift().Match(bmfc.Result).Groups[1].Value);
                        UInt16 extraH = (UInt16)Math.Abs(yoffset);
                        Task importGlyphs = readGlyphs.ContinueWith(fnt => {
                            foreach (Match match in Pattern().Matches(fnt.Result)) {
                                UndertaleFont.Glyph glyph = new() {
                                    Character = UInt16.Parse(match.Groups[1].Value),
                                    SourceX = (UInt16)(int.Parse(match.Groups[2].Value) + 1),
                                    SourceY = (UInt16)(int.Parse(match.Groups[3].Value) + 1),
                                    SourceWidth = (UInt16)(int.Parse(match.Groups[4].Value) - 2),
                                    SourceHeight = (UInt16)(int.Parse(match.Groups[5].Value) - 2),
                                    Offset = (Int16)(int.Parse(match.Groups[6].Value) + 1),
                                    Shift = Int16.Parse(match.Groups[8].Value)
                                };
                                // 解决中英混排问题
                                if (glyph.Character > 127) {
                                    glyph.Offset += xoffset;
                                    glyph.Shift += cnShift;
                                }
                                if ((yoffset > 0 && glyph.Character <= 127) ||
                                    (yoffset < 0 && glyph.Character > 127)) {
                                    glyph.SourceY += extraH;
                                    glyph.SourceHeight -= extraH;
                                }
                                font.Glyphs.Add(glyph);
                            }
                        });
                        UndertaleEmbeddedTexture texture = new();
                        UndertaleTexturePageItem pageItem = font.Texture;
                        Task importTexture = readTexture.ContinueWith(png => {
                            GMImage image = GMImage.FromPng(png.Result);
                            texture.TextureData.Image = image;
                            pageItem.SourceWidth = (ushort)image.Width;
                            pageItem.SourceHeight = (ushort)image.Height;
                            pageItem.TargetWidth = (ushort)image.Width;
                            pageItem.TargetHeight = (ushort)image.Height;
                            pageItem.BoundingWidth = (ushort)image.Width;
                            pageItem.BoundingHeight = (ushort)image.Height;
                        });
                        font.RangeStart = 1;
                        font.RangeEnd = 65535;
                        pageItem.SourceX = 0;
                        pageItem.SourceY = 0;
                        pageItem.TargetX = 0;
                        pageItem.TargetY = 0;
                        pageItem.TexturePage = texture;
                        lock (datawin.EmbeddedTextures) {
                            datawin.EmbeddedTextures.Add(texture);
                        }
                        if (File.Exists(Path.Combine(dumpPath, $"{font_name}_1.png"))) {
                            Warning($"[ImportFonts]{font_name} exceed font texture size!");
                        } else {
                            Task.WaitAll(importGlyphs, importTexture);
                            Info($"[ImportFonts]{font_name} imported!");
                        }
                    }).Wait();
                }).Wait();
            });
        }
        #endregion
        #region ImportCodes
        public void ImportCodes(IEnumerable<Task<(string fileName, string content)> > taskBag, Task previousTask) {
            CodeImportGroup importGroup = new(datawin);
            foreach (var taskItem in taskBag) {
                taskItem.Wait();
                var (fileName, content) = taskItem.Result;
                if (datawin.Code.ByName(fileName) == null) {
                    Warning($"[MainTask]code not exist within data.win: {fileName}");
                    continue;
                }
                importGroup.QueueReplace(fileName, content);
            }
            previousTask.Wait();// 代码编译可能依赖新增的sprite
            CompileResult result = importGroup.Import();
            if (!result.Successful) {
                Warning($"[ImportCodes]compile failed: { result.PrintAllErrors(true) }");
            }
            if (datawin.Variables.Any(x => x.Name.Content.Contains("zhname"))) {
                Error($"[ImportCodes]unexpected result!");
            }
        }
        #endregion

        private ConcurrentBag<Task<(string fileName, string content)>> ReadCodes() {
            ConcurrentBag<Task<(string fileName, string content)> > taskBag = [];
            Parallel.ForEach(new DirectoryInfo(Path.Combine(workspace, "imports/code")).EnumerateFiles(), 
                file => taskBag.Add(File.ReadAllTextAsync(file.FullName, Encoding.UTF8).ContinueWith(
                    task => (Path.GetFileNameWithoutExtension(file.Name), task.Result)
                )
            ));
            return taskBag;
        }
        public void Run() {
            Task<string> en = File.ReadAllTextAsync(Path.Combine(workspace, "imports/text_src/en.json"), Encoding.UTF8);
            Task<string> cn = File.ReadAllTextAsync(Path.Combine(workspace, "imports/text_src/cn.json"), Encoding.UTF8);
            Task<string> fmt = File.ReadAllTextAsync(Path.Combine(workspace, "imports/text_src/raw.json"), Encoding.UTF8);
            Task<string> extra = File.ReadAllTextAsync(Path.Combine(workspace, "imports/text_src/extra.txt"), Encoding.UTF8);
            var taskBag = ReadCodes();
            Task importFonts = Task.Run(async () => ImportFonts(taskBag, await cn + await extra));
            Task importTexts = Task.Run(async () => ImportTexts(await cn, await en, await fmt));
            Task importCodes = Task.Run(() => ImportCodes(taskBag, ImportSprites()));
            using FileStream output = new(Path.Combine(resultPath, "data.win"), FileMode.Create, FileAccess.Write);
            Task.WaitAll(importFonts, importCodes);
            Info($"saving {resultPath} ...");
            UndertaleIO.Write(output, datawin);// 打包完成 保存data.win
            importTexts.Wait();// 这里是生成json
            Info($"{resultPath} saved!");
        }
    }
}