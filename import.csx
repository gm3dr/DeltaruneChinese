using System;
using System.Diagnostics;
using System.IO;
using System.Net.Http;
using System.Linq;
using System.Drawing;
using System.Drawing.Imaging;
using System.Threading;
using System.Threading.Tasks;
using System.Text;
using System.Text.Json;
using System.Text.Encodings.Web;
using System.Text.RegularExpressions;
using ImageMagick;

using UndertaleModLib.Util;
string workspace = PromptChooseDirectory();
if (workspace == null) return;
string name = ScriptInputDialog("Input", "Name:", $"deltarune/{new DirectoryInfo(workspace).Name}", "Cancel", "Submit", false, false);
if (name == null) return;
string address = ScriptInputDialog("Input", "API Address:", "", "Cancel", "Submit", false, false);
if (address == null) return;
string apiToken = ScriptInputDialog("Input", "Weblate Token:", "", "Cancel", "Submit", false, false);
if (apiToken == null) return;
string dumpPath = Path.Combine(workspace, "dump");
string resultPath = Path.Combine(workspace, "result");
// 清一下上次的dump 防止出错
if (Directory.Exists(dumpPath)) {
    Directory.Delete(dumpPath, true);
}
Directory.CreateDirectory(dumpPath);
Directory.CreateDirectory(resultPath);

StreamWriter log = new(
	new FileStream(
		Path.Combine(resultPath, "log.txt"),
		FileMode.Create
	)
);
UndertaleSprite CloneSprite(UndertaleSprite x, string name) {
    UndertaleSprite result = new () {
        Name = Data.Strings.MakeString(name),
        Width = x.Width,
        Height = x.Height,
        MarginLeft = x.MarginLeft,
        MarginRight = x.MarginRight,
        MarginTop = x.MarginTop,
        MarginBottom = x.MarginBottom,
        OriginX = x.OriginX,
        OriginY = x.OriginY
    };
    for (int i = 0; i < x.Textures.Count; i++) {
        UndertaleTexturePageItem item = x.Textures[i].Texture;
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
        Data.TexturePageItems.Add(resultItem);
        result.Textures.Add(new UndertaleSprite.TextureEntry() {
            Texture = resultItem
        });
    }
    if (x.SepMasks is UndertaleSprite.SepMaskType.Precise) {
        log.WriteLine($"[CloneSprite]: need to generate CollisionMask for {name}");
    }
    Data.Sprites.Add(result);
    return result;
}
//替换图片
void ImportSprites()
{
    var iter = new DirectoryInfo(Path.Combine(workspace, "imports/atlas"))
        .EnumerateFiles()
        .Where(file => file.Extension == ".cfg");
    Parallel.ForEach(iter, file => {
        string picPath = Path.ChangeExtension(file.FullName, ".png");
        var lines = File.ReadLines(file.FullName);
        string[] sv0 = lines.First().Split(',');
        int atlasWidth = int.Parse(sv0[0]);
        int atlasHeight = int.Parse(sv0[1]);

        UndertaleEmbeddedTexture texture = new();
        texture.TextureData.Image = GMImage.FromPng(File.ReadAllBytes(Path.ChangeExtension(file.FullName, ".png")));
        texture.Scaled = 1;
        lock (Data.EmbeddedTextures) {
            Data.EmbeddedTextures.Add(texture);
        }
        Parallel.ForEach(lines.Skip(1), line => {        
            string[] sv1 = line.Split(',');
            if (sv1.Length != 5) {
                log.WriteLine($"{file.Name}: config error!");
                return;
            }
            string key = sv1[0];
            int x = int.Parse(sv1[1]);
            int y = int.Parse(sv1[2]);
            int w = int.Parse(sv1[3]);
            int h = int.Parse(sv1[4]);

            int split_pos = key.LastIndexOf('_');
            if (split_pos < 0) {
                log.WriteLine($"[ImportSprites]{file.Name} {key}: key error!");
                return;
            }
            int id = int.Parse(key[(split_pos + 1)..]);
            string name = key[..split_pos];
            UndertaleSprite sprite;
            lock(Data.Sprites) {
                sprite = Data.Sprites.ByName(name, false);
                if (sprite == null) {
                    UndertaleSprite spriteBase = Data.Sprites.ByName(name.Replace("_zhname", ""), false);
                    if (spriteBase == null) {
                        log.WriteLine($"[ImportSprites]missing sprite: {name}");
                        return;
                    }
                    sprite = CloneSprite(spriteBase, name);
                }
            }
            if (id < 0 || id >= sprite.Textures.Count) {
                log.WriteLine($"[ImportSprites]no frame {id} for sprite {name}!");
                return;
            }
            UndertaleTexturePageItem pageItem = sprite.Textures[id].Texture;
            pageItem.TexturePage = texture;
            pageItem.SourceX = (ushort)x;
            pageItem.SourceY = (ushort)y;
            if(w != pageItem.SourceWidth || h != pageItem.SourceHeight) {
                // 尺寸不一致
                if (!name.Contains("funnytext") && !name.Contains("battlemsg")) {
                    log.WriteLine($"[ImportSprites]sprite size invalid:{name} is{w}*{h}, requires{pageItem.SourceWidth}*{pageItem.SourceHeight}");
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
                // 艺术字特殊处理 需要把origin居中
                if (name.Contains("funnytext")) {
                    var dx = sprite.OriginX - sprite.Width / 2;
                    var dy = sprite.OriginY - sprite.Height / 2;
                    if (dx < -1 || dx > 1 || dy < -1 || dy > 1) {
                        log.WriteLine($"[ImportSprites]{name}: Origin point is {sprite.OriginX}, {sprite.OriginY}(expected {sprite.Width / 2},{sprite.Height / 2})");
                    }
                    sprite.OriginX = w / 2;
                    sprite.OriginY = h / 2;
                }
            }
        });
    });
}

//替换字库
void ReplaceFonts()
{
	Parallel.ForEach(
		new DirectoryInfo(Path.Combine(workspace, "imports/font/font")).EnumerateFiles(),
		config => {
            File.Copy(config.ToString(), Path.Combine(dumpPath, config.Name));
        } 
	);
	//参考格式: char id=97   x=520   y=0     width=6     height=15    xoffset=0     yoffset=0     xadvance=7     page=0  chnl=15
    Regex pattern = new(@"char id=(\d+)\s+x=(\d+)\s+y=(\d+)\s+width=(\d+)\s+height=(\d+)\s+xoffset=(-?\d+)\s+yoffset=(-?\d+)\s+xadvance=(\d+)", RegexOptions.Compiled);
    Parallel.ForEach(new DirectoryInfo(Path.Combine(workspace, "imports/font/bmfc")).EnumerateFiles(), config => {
		string font_name = Path.GetFileNameWithoutExtension(config.Name);
		string bmfc = File.ReadAllText(config.ToString(), Encoding.UTF8);
        var xoffset = Int16.Parse(Regex.Match(bmfc, @"# xoffset=(-?\d+)").Groups[1].Value);
        var yoffset = Int16.Parse(Regex.Match(bmfc, @"# yoffset=(-?\d+)").Groups[1].Value);
        var cnShift = Int16.Parse(Regex.Match(bmfc, @"# cnShift=(-?\d+)").Groups[1].Value);

        foreach (FileInfo img in new DirectoryInfo(Path.Combine(workspace, "imports/font/pics", font_name)).EnumerateFiles()) {
			//33,2,1.png
            string[] tokens = img.Name.Split(',');
            //参考格式: icon=".../imports/font/pics/fnt_main/id,xadv,xoff.png",id,xoff,yoff,xadv
            bmfc += $"""icon="{Path.Combine(workspace, "imports", "font", "pics", font_name, img.Name)}",{tokens[0]},{tokens[2].Replace(".png", "")},{0},{tokens[1]}""" + '\n';
        }
        var configPath = Path.Combine(dumpPath, config.Name);
        //回写完整的配置文件
        File.WriteAllText(configPath, bmfc, Encoding.UTF8);
		
		//跑bmfont转字库
		using (Process p = Process.Start(new ProcessStartInfo(Path.Combine(workspace, "../bmfont64.exe")) {
			WorkingDirectory = workspace,
			ArgumentList = {
				"-c", configPath,
				"-o", Path.Combine(dumpPath, $"{font_name}.fnt"),
				"-t", Path.Combine(dumpPath, "dic.txt")
			}
		})) {
			p.WaitForExit();
			if(p.ExitCode != 0) {
                log.WriteLine($"[ReplaceFonts]bmfont exec error for {config.Name}: {p.ExitCode}");
                return;
            }
			p.Close();
		}
        //替换原有字库
        UndertaleFont font = Data.Fonts.ByName(font_name);
        font.Glyphs.Clear();
        font.RangeStart = 1;
        font.RangeEnd = 65535;

    	var text = File.ReadAllText(Path.Combine(dumpPath, $"{font_name}.fnt"), Encoding.UTF8);
	    foreach (Match m in pattern.Matches(text)) {
            var extraH = (UInt16)Math.Abs(yoffset);
            UndertaleFont.Glyph glyph = new() {
                Character = UInt16.Parse(m.Groups[1].Value),
                SourceX = UInt16.Parse(m.Groups[2].Value),
                SourceY = UInt16.Parse(m.Groups[3].Value),
                SourceWidth = UInt16.Parse(m.Groups[4].Value),
                SourceHeight = UInt16.Parse(m.Groups[5].Value),
                Offset = Int16.Parse(m.Groups[6].Value),
                Shift = Int16.Parse(m.Groups[8].Value)
            };
            glyph.SourceX += 1;
            glyph.SourceY += 1;
            glyph.SourceWidth -= 2;
            glyph.SourceHeight -= 2;
            glyph.Offset += 1;
            // 解决中英混排问题
            if (glyph.Character > 127)
            {
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
        //插入新的Texture
        GMImage image = GMImage.FromPng(File.ReadAllBytes(Path.Combine(dumpPath, $"{font_name}_0.png")));
        UndertaleEmbeddedTexture texture = new();
        lock(Data.EmbeddedTextures) {
            Data.EmbeddedTextures.Add(texture);
        }
        texture.TextureData.Image = image;

        UndertaleTexturePageItem pageItem = font.Texture;
        pageItem.SourceX = 0;
        pageItem.SourceY = 0;
        pageItem.SourceWidth = (ushort)image.Width;
        pageItem.SourceHeight = (ushort)image.Height;
        pageItem.TargetX = 0;
        pageItem.TargetY = 0;
        pageItem.TargetWidth = (ushort)image.Width;
        pageItem.TargetHeight = (ushort)image.Height;
        pageItem.BoundingWidth = (ushort)image.Width;
        pageItem.BoundingHeight = (ushort)image.Height;
        pageItem.TexturePage = texture;
    });
}
string RestoreItem(string key, string item, string fmt) {
	if (item.StartsWith('@')) {
		// 标记为不用加^1
        item = item.Substring(1);
    } else {
		// 标点前面加^1
        item = Regex.Replace(item, @"(?<!\^[0-9])([：？！，。]*)([：？！，。])(?=\s*[\w&])", "$1^1$2");        
        item = Regex.Replace(item, @"(?<!\^[0-9])(\.+)\.(?=\s*[\w&])", "$1^1.");	}

    if (item.StartsWith(@"\\r")){
		// 标记为保持原样
        return item.Substring(3);
    }
	if (!string.IsNullOrEmpty(item) && string.IsNullOrEmpty(fmt)) {
        log.WriteLine($"[RestoreItem]fmt empty: {key}");
	} else {
		// 恢复前后的特殊符号
        // 开头的\\cX要保留
        string prefix = Regex.Match(fmt, @"^(\s*\\[A-Zabd-z][A-Za-z0-9]\s*)+")?.Value;
        string suffix = Regex.Match(fmt, @"/%*\s*$")?.Value;
		item = prefix + item + suffix;
	}
    // 不换行空格换成普通空格
    item = item.Replace('\u00A0', ' ');
	// 全角空格换成两个半角空格
    if (item.StartsWith("\\m")) {
        // 小头像格式全角空格变一个普通空格
        item = item.Replace("\u3000", " ");
    } else {
        // 其他格式全角空格变两个普通空格
        item = item.Replace("\u3000", "  ");
    }
	
	return item;
}

void WriteRestoredJson(string pathResult, string targetJson, string baseJson, string fmtJson) {
    using JsonDocument baseData = JsonDocument.Parse(baseJson);
    using JsonDocument targetData = JsonDocument.Parse(targetJson);
    using JsonDocument fmtData = JsonDocument.Parse(fmtJson);
    using Utf8JsonWriter writer = new(
		new FileStream(pathResult, FileMode.Create), 
		new JsonWriterOptions(){
			Encoder = JavaScriptEncoder.UnsafeRelaxedJsonEscaping,
			Indented = true,
		}
	);
	writer.WriteStartObject();
	foreach(var item in fmtData.RootElement.EnumerateObject()) {
        bool hasFmt = baseData.RootElement.TryGetProperty(item.Name, out JsonElement baseItem);
        bool found = targetData.RootElement.TryGetProperty(item.Name, out JsonElement targetItem);
        if(!found && !hasFmt) {
            continue;
        } else if (!found) {
            log.WriteLine($"[WriteRestoredJson]no translation for {item.Name}: {item.Value}");
        } else if (!hasFmt) {
            log.WriteLine($"[WriteRestoredJson]missing fmtKey {item.Name}: {item.Value}");
            continue;
        }
        writer.WriteString(item.Name, RestoreItem(
			item.Name,
			found ? targetItem.ToString() : baseItem.ToString(),
			item.Value.ToString()
		));
	}
	writer.WriteEndObject();
	writer.Flush();
}
async Task MainTask() {
	using HttpClient client = new();
    
	client.BaseAddress = new Uri(address);
	client.DefaultRequestHeaders.Add("Authorization", $"Token {apiToken}");
    string en = await client.GetStringAsync($"translations/{name}/en/file/");
    string cn = await client.GetStringAsync($"translations/{name}/zh_Hans/file/");
    string fmt = await File.ReadAllTextAsync(Path.Combine(workspace, "imports/text_src/raw.json"), Encoding.UTF8);
    WriteRestoredJson(Path.Combine(resultPath, "lang_en.json"), cn, en, fmt);

    using(FileStream dic = new(Path.Combine(dumpPath, "dic.txt"), FileMode.Create)) {
        dic.Write(Encoding.Unicode.GetBytes(cn)); // 这里需要UTF-16
        UndertaleModLib.Compiler.CodeImportGroup importGroup = new(Data);
        foreach (var file in new DirectoryInfo(Path.Combine(workspace, "imports/code")).EnumerateFiles()) {
            string codeName = Path.GetFileNameWithoutExtension(file.Name);
            if (Data.Code.ByName(codeName) == null) {
                log.WriteLine($"[MainTask]code not exist within data.win: {codeName}");
            }
            string code = await File.ReadAllTextAsync(file.FullName);
            importGroup.QueueReplace(codeName, code); //替换指定名称的脚本代码
            dic.Write(Encoding.Unicode.GetBytes(code)); // 这里需要UTF-16
        }
        importGroup.Import();
    }
    ReplaceFonts();
}
SyncBinding("Sprites, TexturePageItems, EmbeddedTextures, Fonts, Strings, Code, CodeLocals, Scripts, GlobalInitScripts, GameObjects, Functions, Variables", true);
DateTime begin = DateTime.UtcNow;
try {
    await Task.WhenAll(
		Task.Run(ImportSprites),
		MainTask()
	);
} catch(Exception e) {
	log.WriteLine(e.Message);
	log.Write(e.StackTrace);
} finally {
    DateTime end = DateTime.UtcNow;
    ScriptMessage($"build time: {end - begin}");
    log.Close();
    log.Dispose();
}
DisableAllSyncBindings();