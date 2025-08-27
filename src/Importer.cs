using System.Collections.Concurrent;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Text.Encodings.Web;
using System.Text.Json;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using UndertaleModLib;
using UndertaleModLib.Compiler;
using UndertaleModLib.Models;
using UndertaleModLib.Util;
using static System.Net.Mime.MediaTypeNames;
namespace DeltarunePacker
{

    public partial class Importer(string datawinPath, string workspace, string resultPath)
    {
        private readonly UndertaleData datawin = UndertaleIO.Read(new FileStream(datawinPath, FileMode.Open, FileAccess.Read), (warning, isImportant) => Console.WriteLine($"[LoadDataWin]warning: {warning}"));
        private readonly StreamWriter m_logger = new(new FileStream(Path.Combine(resultPath, "log.txt"), FileMode.Create, FileAccess.Write));

        private void Info(string msg) {
            Console.WriteLine(msg);
        }
        private void Warning(string msg) {
            m_logger.WriteLine(msg);
            Console.WriteLine(msg);
        }
        private void Error(string msg) {
            m_logger.WriteLine(msg);
            Console.Error.WriteLine(msg);
            Console.Error.Write(new StackTrace().ToString());
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
            sprite = new();
            datawin.Sprites.Add(sprite);
            sprite.Name = datawin.Strings.MakeString(name);
            sprite.Width = baseSprite.Width;
            sprite.Height = baseSprite.Height;
            sprite.MarginLeft = baseSprite.MarginLeft;
            sprite.MarginRight = baseSprite.MarginRight;
            sprite.MarginTop = baseSprite.MarginTop;
            sprite.MarginBottom = baseSprite.MarginBottom;
            sprite.OriginX = baseSprite.OriginX;
            sprite.OriginY = baseSprite.OriginY;
            sprite.Transparent = baseSprite.Transparent;
            sprite.Smooth = baseSprite.Smooth;
            sprite.Preload = baseSprite.Preload;
            sprite.BBoxMode = baseSprite.BBoxMode;
            sprite.SepMasks = baseSprite.SepMasks;
            sprite.CollisionMasks = baseSprite.CollisionMasks;
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

        public async Task ImportSprites()
        {
            foreach(var file in new DirectoryInfo(Path.Combine(workspace, "imports/atlas")).EnumerateFiles("*.cfg")) {
                Task<byte[]> png = File.ReadAllBytesAsync(Path.ChangeExtension(file.FullName, ".png"));
                Task<string[]> lines = File.ReadAllLinesAsync(file.FullName, Encoding.UTF8);
                UndertaleEmbeddedTexture texture = new();
                texture.TextureData.Image = GMImage.FromPng(await png);
                texture.Scaled = 1;
                lock (datawin.EmbeddedTextures) {
                    datawin.EmbeddedTextures.Add(texture);
                }
                Range[] segment = new Range[9];
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
                        continue;
                    }
                    // 尺寸不一致
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
                    if (!name.Contains("funnytext", StringComparison.Ordinal) && !name.Contains("battlemsg", StringComparison.Ordinal)) {
                        // 这条只是提醒尺寸变了 不一定有问题 自查下即可
                        if (name.Contains("zhname")) {
                            continue;
                        }
                        Info($"[ImportSprites]{file.Name}: {name}_{id} is {w}*{h}, requires{pageItem.SourceWidth}*{pageItem.SourceHeight}");
                    }
                    if (sprite.CollisionMasks.Count > 0) {
                        Warning($"[ImportSprites] size changed for sprite {name} with CollisionMask");
                    }
                    continue;
                }
            }
        }
        #endregion
        #region ImportTexts
        [GeneratedRegex(@"^(\s*\\[A-Zabd-z][A-Za-z0-9]\s*)+")]
        private static partial Regex RegexPrefix();
        [GeneratedRegex(@"/%*\s*$")]
        private static partial Regex RegexSuffix();
        [GeneratedRegex(@"(?<!\^[0-9])(\.+)\.(?=\s*[\w&])")]
        private static partial Regex RestoreEN();
        [GeneratedRegex(@"(?<!\^[0-9])([：？！，。]*)([：？！，。])(?=\s*[\w&])")]
        private static partial Regex RestoreCN();
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
                // 开头的\\cX要保留
                string? prefix = RegexPrefix().Match(fmt)?.Value;
                string? suffix = RegexSuffix().Match(fmt)?.Value;
                item = prefix + item + suffix;
            }
            // 不换行空格换成普通空格
            item = item.Replace('\u00A0', ' ');
            // 全角空格换成两个半角空格
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

            return item;
        }
        public void ImportTexts(string targetJson, string baseJson, string fmtJson)
        {
            using JsonDocument baseData = JsonDocument.Parse(baseJson);
            using JsonDocument targetData = JsonDocument.Parse(targetJson);
            using JsonDocument fmtData = JsonDocument.Parse(fmtJson);
            using FileStream outStream = new(Path.Combine(resultPath, "lang_en.json"), FileMode.Create);
            using Utf8JsonWriter writer = new(outStream, new JsonWriterOptions() { Encoder = JavaScriptEncoder.UnsafeRelaxedJsonEscaping, Indented = true });
            writer.WriteStartObject();
            foreach (var item in fmtData.RootElement.EnumerateObject()) {
                // profiler显示的热点 待优化
                bool hasFmt = baseData.RootElement.TryGetProperty(item.Name, out JsonElement baseItem);
                bool found = targetData.RootElement.TryGetProperty(item.Name, out JsonElement targetItem);
                if (!found && !hasFmt)
                {
                    continue;
                }
                else if (!found)
                {
                    Warning($"[WriteRestoredJson]no translation for {item.Name}: {item.Value}");
                }
                else if (!hasFmt)
                {
                    Warning($"[WriteRestoredJson]missing fmtKey {item.Name}: {item.Value}");
                    continue;
                }
                writer.WriteString(item.Name, RestoreItem(
                    item.Name,
                    found ? targetItem.ToString() : baseItem.ToString(),
                    item.Value.ToString()
                ));
            }
            writer.WriteEndObject();
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
        public Task ImportFonts(IEnumerable<Task<(string fileName, string content)> > taskBag, string extraString) {
            // 清一下上次的dump 防止出错
            if (Directory.Exists(dumpPath)) {
                Directory.Delete(dumpPath, true);
            }
            Directory.CreateDirectory(dumpPath);

            Task copyFiles = Parallel.ForEachAsync(new DirectoryInfo(Path.Combine(workspace, "imports/font/font")).EnumerateFiles(), (config, _) => {
                File.Copy(config.ToString(), Path.Combine(dumpPath, config.Name));
                return new ValueTask();
            });
            Task writeDict = Task.Run(async () => {
                using FileStream dict = new(dictPath, FileMode.Create, FileAccess.Write);
                foreach (var taskItem in taskBag) {
                    dict.Write(Encoding.Unicode.GetBytes((await taskItem).content)); // dic.txt需要是UTF-16的
                }
                dict.Write(Encoding.Unicode.GetBytes(extraString));
                dict.Close();
            });
            return Parallel.ForEachAsync(new DirectoryInfo(Path.Combine(workspace, "imports/font/bmfc")).EnumerateFiles(), async (config, _) => {
                Task<string> bmfc = File.ReadAllTextAsync(config.FullName, Encoding.UTF8);
                string font_name = Path.GetFileNameWithoutExtension(config.Name);
                if (font_name == null)
                {
                    return;
                }
                string configPath = Path.Combine(dumpPath, config.Name);
                string outputPath = Path.Combine(dumpPath, $"{font_name}.fnt");
                StringBuilder cfgPics = new();
                foreach (FileInfo img in new DirectoryInfo(Path.Combine(workspace, "imports/font/pics", font_name)).EnumerateFiles())
                {
                    //33,2,1.png
                    string[] tokens = img.Name.Split(',');
                    //参考格式: icon=".../imports/font/pics/fnt_main/id,xadv,xoff.png",id,xoff,yoff,xadv
                    cfgPics.AppendLine($"""icon="{img.FullName}",{tokens[0]},{tokens[2].Replace(".png", "")},{0},{tokens[1]}""");
                }
                //回写完整的配置文件
                Task writeCfg = bmfc.ContinueWith(task => File.WriteAllTextAsync(configPath, task.Result + cfgPics.ToString(), Encoding.UTF8));
                await Task.WhenAll(copyFiles, writeDict, writeCfg);
                //跑bmfont转字库
                using Process? p = Process.Start(new ProcessStartInfo() {
                    FileName = Path.Combine(workspace, "../bmfont64.com"),
                    WorkingDirectory = workspace,
                    CreateNoWindow = true,
                    ArgumentList = {
                        "-c", configPath,
                        "-o", outputPath,
                        "-t", Path.Combine(dumpPath, "dict.txt")
                    }
                });
                if (p == null)
                {
                    Error($"[ImportFonts]{font_name} bmfont start failed!");
                    return;
                }
                await p.WaitForExitAsync().ContinueWith(async _ =>
                {
                    p.Close();
                    if (!File.Exists(Path.Combine(dumpPath, $"{font_name}_0.png")))
                    {
                        Warning($"[ImportFonts]{font_name} bmfont exec failed!");
                        return;
                    }
                    if (File.Exists(Path.Combine(dumpPath, $"{font_name}_1.png")))
                    {
                        Warning($"[ImportFonts]{font_name} exceed font texture size!");
                        return;
                    }
                    Task<string> generateGlyphs = File.ReadAllTextAsync(outputPath, Encoding.UTF8);
                    Task<byte[]> readTexture = File.ReadAllBytesAsync(Path.Combine(dumpPath, $"{font_name}_0.png"));
                    UndertaleEmbeddedTexture texture = new();
                    lock (datawin.EmbeddedTextures)
                    {
                        datawin.EmbeddedTextures.Add(texture);
                    }

                    UndertaleFont font = datawin.Fonts.ByName(font_name);
                    font.Glyphs.Clear();
                    font.RangeStart = 1;
                    font.RangeEnd = 65535;

                    UndertaleTexturePageItem pageItem = font.Texture;
                    pageItem.SourceX = 0;
                    pageItem.SourceY = 0;
                    pageItem.TargetX = 0;
                    pageItem.TargetY = 0;
                    Int16 xoffset = Int16.Parse(XOffset().Match(bmfc.Result).Groups[1].Value);
                    Int16 yoffset = Int16.Parse(YOffset().Match(bmfc.Result).Groups[1].Value);
                    Int16 cnShift = Int16.Parse(CNShift().Match(bmfc.Result).Groups[1].Value);
                    UInt16 extraH = (UInt16)Math.Abs(yoffset);
                    string fnt = await generateGlyphs;
                    if (string.IsNullOrEmpty(fnt)) {
                        Warning($"[ImportFonts]{font_name} exported config is empty!");
                    }
                    foreach (Match match in Pattern().Matches(fnt))
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
                        font.Glyphs.Add(glyph);
                    }
                    GMImage image = GMImage.FromPng(await readTexture);
                    texture.TextureData.Image = image;
                    pageItem.TexturePage = texture;
                    pageItem.SourceWidth = (ushort)image.Width;
                    pageItem.SourceHeight = (ushort)image.Height;
                    pageItem.TargetWidth = (ushort)image.Width;
                    pageItem.TargetHeight = (ushort)image.Height;
                    pageItem.BoundingWidth = (ushort)image.Width;
                    pageItem.BoundingHeight = (ushort)image.Height;
                });
                Info($"[ImportFonts]{font_name} imported!");
            });
        }
        #endregion
        #region ImportCodes
        public async Task ImportCodes(IEnumerable<Task<(string fileName, string content)> > taskBag, Task previousTask)
        {
            CodeImportGroup importGroup = new(datawin);
            foreach (var taskItem in taskBag) {
                var (fileName, content) = await taskItem;
                if (datawin.Code.ByName(fileName) == null) {
                    Warning($"[MainTask]code not exist within data.win: {fileName}");
                    continue;
                }
                importGroup.QueueReplace(fileName, content);
            }
            // 代码编译可能依赖新增的sprite
            await previousTask;
            CompileResult result = importGroup.Import();
            if (!result.Successful) {
                Error($"[ImportCodes]compile failed: {result.Errors}");
            }
            if (datawin.Variables.Any(x => x.Name.Content.Contains("zhname"))) {
                Error($"[ImportCodes]unexpected result!");
            }
        }
        #endregion
        private IEnumerable<Task<(string fileName, string content)> > ReadCodes() {
            ConcurrentBag<Task<(string fileName, string content)> > taskBag = [];
            Parallel.ForEach(new DirectoryInfo(Path.Combine(workspace, "imports/code")).EnumerateFiles(), 
                file => taskBag.Add(File.ReadAllTextAsync(file.FullName, Encoding.UTF8).ContinueWith(
                    task => (Path.GetFileNameWithoutExtension(file.Name), task.Result)
                )
            ));
            return taskBag;
        }
        public void Run()
        {
            Task<string> en = File.ReadAllTextAsync(Path.Combine(workspace, "imports/text_src/en.json"), Encoding.UTF8);
            Task<string> cn = File.ReadAllTextAsync(Path.Combine(workspace, "imports/text_src/cn.json"), Encoding.UTF8);
            Task<string> fmt = File.ReadAllTextAsync(Path.Combine(workspace, "imports/text_src/raw.json"), Encoding.UTF8);
            Task<string> extra = File.ReadAllTextAsync(Path.Combine(workspace, "imports/text_src/extra.txt"), Encoding.UTF8);
            var taskBag = ReadCodes();
            Task importFonts = Task.Run(async () => await ImportFonts(taskBag, await cn + await extra));
            Task importSprites = ImportSprites();
            Task importCodes = Task.Run(async () => await ImportCodes(taskBag, importSprites));
            Task importTexts = Task.Run(async () => ImportTexts(await cn, await en, await fmt));
            using FileStream output = new(Path.Combine(resultPath, "data.win"), FileMode.Create, FileAccess.Write);
            Task.WaitAll(importFonts, importCodes);
            UndertaleIO.Write(output, datawin);// 打包完成 保存data.win
            importTexts.Wait();// 这里是生成json
        }
    }
}