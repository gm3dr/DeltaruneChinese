using System.Text;
using System.Diagnostics;
using System.Threading.Tasks;
using System.Text.RegularExpressions;
using ImageMagick;
using UndertaleModLib.Util;

//替换字库
void ReplaceFonts(string workspace, StreamWriter logger) {
    string dumpPath = Path.Combine(workspace, "dump");
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
        StringBuilder bmfcFull = new(bmfc);
        foreach (FileInfo img in new DirectoryInfo(Path.Combine(workspace, "imports/font/pics", font_name)).EnumerateFiles()) {
            //33,2,1.png
            string[] tokens = img.Name.Split(',');
            //参考格式: icon=".../imports/font/pics/fnt_main/id,xadv,xoff.png",id,xoff,yoff,xadv
            bmfcFull.AppendLine($"""icon="{img.FullName}",{tokens[0]},{tokens[2].Replace(".png", "")},{0},{tokens[1]}""");
        }
        //回写完整的配置文件
        string configPath = Path.Combine(dumpPath, config.Name);
        string outputPath = Path.Combine(dumpPath, $"{font_name}.fnt");
        File.WriteAllText(configPath, bmfcFull.ToString(), Encoding.UTF8);
        
        //跑bmfont转字库
        using (Process p = Process.Start(new ProcessStartInfo(Path.Combine(workspace, "../bmfont64.exe")) {
            WorkingDirectory = workspace,
            ArgumentList = {
                "-c", configPath,
                "-o", outputPath,
                "-t", Path.Combine(dumpPath, "dic.txt")
            }
        })) {
            p.WaitForExit();
            if(p.ExitCode != 0) {
                logger.WriteLine($"[ReplaceFonts]bmfont exec error for {config.Name}: {p.ExitCode}");
                return;
            }
            p.Close();
        }
        if (File.Exists(Path.Combine(dumpPath, $"{font_name}_1.png"))) {
            logger.WriteLine($"[ReplaceFonts]{font_name} exceed font texture size!");
            return;
        }
        //替换原有字库
        UndertaleFont font = Data.Fonts.ByName(font_name);
        font.Glyphs.Clear();
        font.RangeStart = 1;
        font.RangeEnd = 65535;

        var text = File.ReadAllText(outputPath, Encoding.UTF8);
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