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

        [GeneratedRegex(@"[#&]")] private static partial Regex ReplaceNewlines();
        [GeneratedRegex(@"\^1([：？！，。?!,.])")] private static partial Regex RemoveSmallPauses();
        [GeneratedRegex(@"^(\s*\\[A-Zabd-z][A-Za-z0-9]\s*)+(.*)/%*\s*$")] private static partial Regex TrimBothEnds();
        private static readonly (Regex regex, string replacement)[] processors = [
            (ReplaceNewlines(), "\n"), // #和&替换成回车
            (RemoveSmallPauses(), "$1"), // 去掉标点前的^1
            (TrimBothEnds(), "$2"), // 去掉头尾的控制字符
        ];
        
        private static readonly TextureWorker worker = new();
        public async Task ExportTexts(IEnumerable<string> codes, string json) {
            string outPath = Path.Combine(ResultPath, "texts");
            Directory.CreateDirectory(outPath);

            IEnumerable<KeyValuePair<string, string>> dictFromCode = codes.SelectMany(code => regexes
                .SelectMany(regex => regex.Matches(code))
                .Select(match => new KeyValuePair<string, string>(match.Groups[2].Value, match.Groups[1].Value))
                .Distinct()
            ); ;
            IEnumerable<KeyValuePair<string, string>> dictFromJson = JObject.Parse(json).Properties()
                .Select(prop => new KeyValuePair<string, string>(prop.Name, prop.Value.ToString()));
            foreach (var group in dictFromCode.GroupBy(pair => pair.Key).Where(group => group.Count() > 1)) {
                Warning($"{group.Key} colliding!");
            }
            foreach (var group in dictFromJson.GroupBy(pair => pair.Key).Where(group => group.Count() > 1)) {
                Warning($"[DictFromJson]{group.Key} colliding!");
            }
            IEnumerable<KeyValuePair<string, string>> result = dictFromCode
                .IntersectBy(dictFromJson.Select(pair => pair.Key), pair => pair.Key)
                .Select(pair => processors.Aggregate(
                    pair.Value, 
                    (content, processor) => processor.regex.Replace(content, processor.replacement),
                    result => new KeyValuePair<string, string>(pair.Key, result)
                ));
            IEnumerable<string> common = result.Select(pair => pair.Key);
            foreach (var pair in dictFromCode.ExceptBy(common, pair => pair.Key)) {
                Warning($"[DictFromJson]key {pair.Key} not found!");
            }
            foreach(var pair in dictFromJson.ExceptBy(common, pair => pair.Key)) {
                Warning($"[DictFromCode]key {pair.Key} not found!");
            }
            
            JsonTextWriter writer = new(File.CreateText(Path.Combine(ResultPath, "lang_en.json")));
            await writer.WriteStartObjectAsync();
            await Task.WhenAll(result.Select(async pair => {
                await writer.WritePropertyNameAsync(pair.Key);
                await writer.WriteValueAsync(pair.Value.ToString());
            }));
            await writer.WriteEndObjectAsync();
        }
        public async Task ExportFont(UndertaleFont font) {            
            string font_name = font.Name.Content;
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
            string outPath = Path.Combine(ResultPath, "codes");
            Directory.CreateDirectory(outPath);

            await Task.WhenAll(codes.Select(pair => File.WriteAllTextAsync(Path.Combine(outPath, pair.Key), pair.Value, Encoding.UTF8)));
        }
        public async Task ExportSprites(UndertaleData datawin) {
            string outPath = Path.Combine(ResultPath, "pics");
            Directory.CreateDirectory(outPath);
            
            await Task.WhenAll(datawin.Sprites
                .SelectMany(sprite => sprite.Textures.Where(x => x.Texture != null)
                .Select((item, idx) => {
                    string name = $"{sprite.Name.Content}_{idx}";
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
