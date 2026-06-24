using ImageMagick;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using Underanalyzer.Decompiler;
using UndertaleModLib;
using UndertaleModLib.Decompiler;
using UndertaleModLib.Models;
using UndertaleModLib.Util;

namespace deltarunePacker
{
    public partial class Exporter(string resultPath, string datawinPath, LogLevel logLevel = LogLevel.Info) : Loader(resultPath, datawinPath, logLevel)
    {
        // msgnextloc(原文, key)
        [GeneratedRegex("""msgnextloc\("((?:[^"\\]|\\.)*)", "((?:[^"\\]|\\.)*)"\)""")] private static partial Regex Re_msgnextloc();
        // stringsetloc(原文, key)
        [GeneratedRegex("""stringsetloc\("((?:[^"\\]|\\.)*)", "((?:[^"\\]|\\.)*)"\)""")] private static partial Regex Re_stringsetloc();
        // msgsetloc(id, 原文, key)
        [GeneratedRegex("""msgsetloc\([\w\+]+, "((?:[^"\\]|\\.)*)", "((?:[^"\\]|\\.)*)"\)""")] private static partial Regex Re_msgsetloc();
        // msgnextsubloc(原文, 参数, key)
        [GeneratedRegex("""msgsetsubloc\("((?:[^"\\]|\\.)*)"(?:\s*,[^,]*)*?, "((?:[^"\\]|\\.)*)"\)""")] private static partial Regex Re_msgsetsubloc();
        // msgnextsubloc(原文, 参数, key)
        [GeneratedRegex("""msgnextsubloc\("((?:[^"\\]|\\.)*)"(?:\s*,[^,]*)*?, "((?:[^"\\]|\\.)*)"\)""")] private static partial Regex Re_msgnextsubloc();
        // stringsetsubloc(原文, 参数, key)
        [GeneratedRegex("""stringsetsubloc\("((?:[^"\\]|\\.)*)"(?:\s*,[^,]*)*?, "((?:[^"\\]|\\.)*)"\)""")] private static partial Regex Re_stringsetsubloc();
        private static readonly Regex[] regexes = [
            Re_msgsetloc(),
            Re_msgnextloc(),
            Re_stringsetloc(),
            Re_msgsetsubloc(),
            Re_msgnextsubloc(),
            Re_stringsetsubloc()
        ];
        private IEnumerable<KeyValuePair<string, string>> DecompileCodes(UndertaleData datawin)
        {
            GlobalDecompileContext globalDecompileContext = new(datawin);
            IDecompileSettings decompilerSettings = datawin.ToolInfo.DecompilerSettings;
            return datawin.Code
                .Where(code => code != null && code.ParentEntry is null)
                .Select(code => {
                    try
                    {
                        DecompileContext decompiler = new(globalDecompileContext, code, decompilerSettings);
                        return new KeyValuePair<string, string>(code.Name.Content, decompiler.DecompileToString());
                    }
                    catch (Exception e)
                    {
                        Warning($"{code.Name.Content} decompile failed: {e.Message}");
                        return new KeyValuePair<string, string>(code.Name.Content, "");
                    }
                });
        }
        [GeneratedRegex(@"(?<!`)[#&]")] private static partial Regex ReplaceNewlines();
        [GeneratedRegex(@"\^1")] private static partial Regex RemoveSmallPauses();
        [GeneratedRegex(@"/\s*%*\s*$")] private static partial Regex TrimBack();
        [GeneratedRegex(@"^\s*(\\(?!c)[A-Za-z0-9]{2}\s*)+")] private static partial Regex TrimFront();
        private static readonly (Regex regex, string replacement)[] processors = [
            (ReplaceNewlines(), "\n"), // #和&替换成回车
            (RemoveSmallPauses(), ""), // 去掉标点前的^1
            (TrimBack(), ""), // 去掉头尾的控制字符
            (TrimFront(), ""), // 去掉头尾的控制字符
        ];
        private static string Unescape(string text)
        {
            // from UndertaleModTool
            return text.Replace("\\r", "\r").Replace("\\t", "\t").Replace("\\n", "\n").Replace("\\\"", "\"").Replace("\\\\", "\\");
        }
        private static readonly TextureWorker worker = new();
        public async Task ExportTexts(IEnumerable<string> codes, string json) 
        {
            var dictFromCode = codes.SelectMany(code => regexes
                    .SelectMany(regex => regex.Matches(code))
                    .Where(m => !string.IsNullOrWhiteSpace(m.Groups[2].Value))
                    .Select(match => new KeyValuePair<string, string>(match.Groups[2].Value, Unescape(match.Groups[1].Value)))
                )
                // 分组取第一个，避免 Key 碰撞报错
                .GroupBy(p => p.Key)
                .ToDictionary(g => g.Key, g => g.First().Value);

            var dictFromJson = JObject.Parse(json).Properties()
                .Where(p => !string.IsNullOrWhiteSpace(p.Name))
                .GroupBy(p => p.Name)
                .ToDictionary(g => g.Key, g => g.First().Value.ToString());

            var enResult = new Dictionary<string, string>();
            var jaResult = new Dictionary<string, string>();

            foreach (var kvp in dictFromCode)
            {
                string key = kvp.Key;
                string processedCodeValue = processors.Aggregate(
                    kvp.Value, 
                    (content, processor) => processor.regex.Replace(content, processor.replacement)
                );
                enResult[key] = processedCodeValue;
                if (dictFromJson.TryGetValue(key, out string? jsonValue))
                {
                    string processedJsonValue = processors.Aggregate(
                        jsonValue,
                        (content, processor) => processor.regex.Replace(content, processor.replacement)
                    );
                    jaResult[key] = processedJsonValue;
                }
                else
                {
                    jaResult[key] = processedCodeValue;
                }
            }
            string textSrcDir = Path.Combine(ResultPath, "text_src");
            Directory.CreateDirectory(textSrcDir); 
            string enFullPath = Path.Combine(textSrcDir, "en.json");
            using (JsonTextWriter writerEn = new(File.CreateText(enFullPath)))
            {
                writerEn.Formatting = Formatting.Indented;
                await writerEn.WriteStartObjectAsync();
                foreach (var pair in enResult)
                {
                    await writerEn.WritePropertyNameAsync(pair.Key);
                    await writerEn.WriteValueAsync(pair.Value ?? "");
                }
                await writerEn.WriteEndObjectAsync();
                await writerEn.FlushAsync();
            }
            string jaFullPath = Path.Combine(textSrcDir, "ja_JP.json");
            using (JsonTextWriter writerJa = new(File.CreateText(jaFullPath)))
            {
                writerJa.Formatting = Formatting.Indented;
                await writerJa.WriteStartObjectAsync();
                foreach (var pair in jaResult)
                {
                    await writerJa.WritePropertyNameAsync(pair.Key);
                    await writerJa.WriteValueAsync(pair.Value ?? "");
                }
                await writerJa.WriteEndObjectAsync();
                await writerJa.FlushAsync();
            }
            string rawFullPath = Path.Combine(textSrcDir, "raw.json");
            await File.WriteAllTextAsync(rawFullPath, json ?? "");
        }
        public async Task ExportFont(UndertaleFont font) {            
            string font_name = font.Name.Content;
            if (font_name.Contains("_ja")) return;
            string subpath = Path.Combine(ResultPath, $"font/pics/{font_name}");
            Directory.CreateDirectory(subpath);
            
            IMagickImage<byte> texture = worker.GetTextureFor(font.Texture, font_name, true);
            await Task.WhenAll(font.Glyphs.Where(glyph => glyph.SourceWidth != 0 && glyph.SourceHeight != 0).Select(glyph => texture
                    .CloneArea(glyph.SourceX, glyph.SourceY, glyph.SourceWidth, glyph.SourceHeight)
                    .WriteAsync(Path.Combine(subpath, $"{glyph.Character},{glyph.Shift - glyph.SourceWidth},{glyph.Offset}.png"), MagickFormat.Png32)
                )
            );
        }
        public async Task ExportCodes(IEnumerable<KeyValuePair<string, string>> codes) {
            string outPath = Path.Combine(ResultPath, "code");
            Directory.CreateDirectory(outPath);

            await Task.WhenAll(codes.Select(pair => File.WriteAllTextAsync(Path.Combine(outPath, $"{pair.Key}.gml"), pair.Value, Encoding.UTF8)));
        }
        public async Task ExportSprites(UndertaleData datawin) {
            string outPath = Path.Combine(ResultPath, "pics");
            Directory.CreateDirectory(outPath);
            
            await Task.WhenAll(datawin.Sprites
                .SelectMany(sprite => sprite.Textures.Where(x => x.Texture != null)
                .Select((item, idx) => {
                    string name = $"{sprite.Name.Content}_{idx}.png";
                    return worker.GetTextureFor(item.Texture, name).WriteAsync(Path.Combine(outPath, name), MagickFormat.Png32);
                })
            ));
        }
        public async Task Run() {
            Task<string> jp = File.ReadAllTextAsync(DatawinPath.Replace("data.win", "lang_ja.json"));
            Directory.CreateDirectory(ResultPath);
            UndertaleData datawin = LoadData();
            Task exportFonts = Task.WhenAll(datawin.Fonts.Select(ExportFont));
            Task exportSprites = ExportSprites(datawin);
            KeyValuePair<string, string>[] codes = [.. DecompileCodes(datawin)];
            Task exportTexts = ExportTexts(codes.Select(code => code.Value), await jp);
            Task exportCodes = ExportCodes(codes);
            await exportFonts;
            await exportSprites;
            await exportTexts;
            await exportCodes;
        }
    }
}
