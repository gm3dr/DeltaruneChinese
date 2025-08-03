using System.Text;
using System.Text.Json;
using System.Text.RegularExpressions;
using System;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Text.Encodings.Web;
using UndertaleModLib.Util;
using ImageMagick;
string workspace = PromptChooseDirectory();
if (workspace == null) return;
string exportPath = Path.Combine(workspace, "exports");
Directory.CreateDirectory(exportPath);
//导出图片
void DumpSprite() {
	Directory.CreateDirectory(Path.Combine(exportPath, "pics"));
	using TextureWorker worker = new();
    Parallel.ForEach(Data.Sprites, sprite => {
        for (int i = 0; i < sprite.Textures.Count; i++) {
            if (sprite.Textures[i]?.Texture == null) {
                continue;
            }
			worker.ExportAsPNG(sprite.Textures[i].Texture, Path.Combine(exportPath, $"pics/{sprite.Name.Content}_{i}.png"), null, false);
		}
    });
}

//导出字库元素
void DumpFonts() {
	using TextureWorker worker = new();
    Parallel.ForEach(Data.Fonts, font => {
        string font_name = font.Name.Content;
        string subpath = Path.Combine(exportPath, "font", "pics", font_name);
        Directory.CreateDirectory(subpath);

        var texture = worker.GetTextureFor(font.Texture, font_name, true) as MagickImage;
        Parallel.ForEach(font.Glyphs, glyph =>
        {
            if (glyph.Character > 255)
            {
                return;
            }
            //为什么会有0*0的字。。
            if (glyph.SourceWidth == 0 || glyph.SourceHeight == 0)
            {
                return;
            }
            using MagickImage resultImage = new(MagickColors.Transparent, glyph.SourceWidth, glyph.SourceHeight);
            resultImage.CopyPixels(texture, new MagickGeometry(glyph.SourceX, glyph.SourceY, glyph.SourceWidth, glyph.SourceHeight));
            TextureWorker.SaveImageToFile(resultImage, Path.Combine(subpath, $"{glyph.Character},{glyph.Shift - glyph.SourceWidth},{glyph.Offset}.png"));
        });
    });
}

//导出文本
void DumpText() {
    Directory.CreateDirectory(Path.Combine(exportPath, "lang"));
    Dictionary<string, string> mapping = [];

    Regex[] regexes = [
        // msgsetloc(id, 原文, key)
        new Regex("""msgsetloc\([\w\+]+, "((?:[^"\\]|\\.)*)", "((?:[^"\\]|\\.)*)"\)"""),
        // msgnextloc(原文, key)
        new Regex("""msgnextloc\("((?:[^"\\]|\\.)*)", "((?:[^"\\]|\\.)*)"\)"""),
        // stringsetloc(原文, key)
        new Regex("""stringsetloc\("((?:[^"\\]|\\.)*)", "((?:[^"\\]|\\.)*)"\)"""),
        // msgsetsubloc(id, 原文, 参数, key)
        new Regex("""msgsetsubloc\(\w+, "((?:[^"\\]|\\.)*)"(?:\s*,[^,]*)*?, "((?:[^"\\]|\\.)*)"\)"""),
        // msgnextsubloc(原文, 参数, key)
        new Regex("""msgnextsubloc\("((?:[^"\\]|\\.)*)"(?:\s*,[^,]*)*?, "((?:[^"\\]|\\.)*)"\)"""),
        // stringsetsubloc(原文, 参数, key)
        new Regex("""stringsetsubloc\("((?:[^"\\]|\\.)*)"(?:\s*,[^,]*)*?, "((?:[^"\\]|\\.)*)"\)"""),
    ];
    void SearchPair(Regex r, string str) {
        foreach(Match m in r.Matches(str)) {
            mapping.TryAdd(m.Groups[2].Value, Regex.Unescape(m.Groups[1].Value));
        }
    }
    GlobalDecompileContext globalDecompileContext = new(Data);
    Underanalyzer.Decompiler.IDecompileSettings decompilerSettings = Data.ToolInfo.DecompilerSettings;
    foreach(var code in Data.Code.Where(c => c.ParentEntry is null)) {
        if(code == null) {
            continue;
        }
        try {
            string decompiled = new Underanalyzer.Decompiler.DecompileContext(globalDecompileContext, code, decompilerSettings).DecompileToString();
            Array.ForEach(regexes, r => SearchPair(r, decompiled));
        } catch (Exception e) {
            ScriptMessage(e.Message);
        }
    }
    //输出ch2的json
    var processors = new (Regex pattern, string replacement)[] {
        (new Regex(@"[#&]"), "\n"), // #和&替换成回车
        (new Regex(@"^(\s*\\[A-Zabd-z][A-Za-z0-9]\s*)+(.*)/%*\s*$"), "$2"), // 去掉头尾的控制字符
        (new Regex(@"\^1([：？！，。?!,.])"), "$1"), // 去掉标点前的^1
    };
    using Utf8JsonWriter writer = new(
		new FileStream(Path.Combine(exportPath, "lang/lang_en.json"), FileMode.Create), 
		new JsonWriterOptions(){
			Encoder = JavaScriptEncoder.UnsafeRelaxedJsonEscaping,
			Indented = true,
		}
	);
	writer.WriteStartObject();
    using var ja = JsonDocument.Parse(File.ReadAllText(Path.Combine(workspace, "lang_ja.json"), Encoding.UTF8));
	foreach(var item in ja.RootElement.EnumerateObject()) {
        mapping.TryGetValue(item.Name, out string v);
        if (v != null) {
            // foreach (var (pattern, replacement) in processors) {
            //     v = pattern.Replace(v, replacement);
            // }
            // 不换行空格换成普通空格
            v = v.Replace('\u00A0', ' ');
            // 全角空格换成两个半角空格
            v = v.Replace("\u3000", "  ");
            // tab也换成两个空格
            v = v.Replace("\t", "  ");
        }
        writer.WriteString(item.Name, v);
	}
	writer.WriteEndObject();
	writer.Flush();
}
DumpText();
DumpFonts();
//DumpSprite();
