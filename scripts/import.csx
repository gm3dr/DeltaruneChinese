#load "import_cnfonts.csx"
#load "import_sprites.csx"
#load "import_strings.csx"

using System.Text;
using System.Threading;
using System.Threading.Tasks;

using ImageMagick;
using UndertaleModLib.Util;
 
async Task Run(string workspace, string name) {
    SyncBinding("Sprites, TexturePageItems, EmbeddedTextures, Fonts, Strings, Code, CodeLocals, Scripts, GlobalInitScripts, GameObjects, Functions, Variables", true);
    DateTime beginTime = DateTime.UtcNow;
    string resultPath = Path.Combine(workspace, "result");
    StreamWriter logger = new(
        new FileStream(
            Path.Combine(resultPath, "log.txt"),
            FileMode.Create
        )
    );
    try{
        Task importSprites = Task.Run(() => ImportSprites(Path.Combine(workspace, "imports/atlas"), logger));
        string dumpPath = Path.Combine(workspace, "dump");
        // 清一下上次的dump 防止出错
        if (Directory.Exists(dumpPath)) {
            Directory.Delete(dumpPath, true);
        }
        Directory.CreateDirectory(dumpPath);
        Directory.CreateDirectory(resultPath);

        Task<string> en = File.ReadAllTextAsync(Path.Combine(workspace, "imports/text_src/en.json"), Encoding.UTF8);
        Task<string> cn = File.ReadAllTextAsync(Path.Combine(workspace, "imports/text_src/cn.json"), Encoding.UTF8);
        Task<string> fmt = File.ReadAllTextAsync(Path.Combine(workspace, "imports/text_src/raw.json"), Encoding.UTF8);
        Task<string> extra = File.ReadAllTextAsync(Path.Combine(workspace, "imports/text_src/extra.txt"), Encoding.UTF8);
        
        // 导入代码
        UndertaleModLib.Compiler.CodeImportGroup importGroup = new(Data);
        // dic.txt需要是UTF-16的
        using(FileStream dic = new(Path.Combine(dumpPath, "dic.txt"), FileMode.Create)) {
            foreach (var file in new DirectoryInfo(Path.Combine(workspace, "imports/code")).EnumerateFiles()) {
                Task<string> code = File.ReadAllTextAsync(file.FullName);

                string codeName = Path.GetFileNameWithoutExtension(file.Name);
                if (Data.Code.ByName(codeName) == null) {
                    logger.WriteLine($"[MainTask]code not exist within data.win: {codeName}");
                }
                importGroup.QueueReplace(codeName, await code); //替换指定名称的脚本代码
                dic.Write(Encoding.Unicode.GetBytes(await code));
            }
            dic.Write(Encoding.Unicode.GetBytes(await cn)); 
            dic.Write(Encoding.Unicode.GetBytes(await extra));
        }
        Task importTexts = Task.Run(async () => WriteRestoredJson(Path.Combine(resultPath, "lang_en.json"), await cn, await en, await fmt, logger));
        Task importFonts = Task.Run(() => ReplaceFonts(workspace, logger));
        importSprites.Wait();
        
        // 代码编译可能依赖新增的sprite
        Task importCodes = Task.Run(() => importGroup.Import());
        await Task.WhenAll(
            importSprites,
            importTexts,
            importFonts,
            importCodes
        );
    } catch (Exception e){
        logger.WriteLine(e.Message);
        logger.Write(e.StackTrace);
    } finally {
        logger.Close();
        logger.Dispose();
    }
    DisableAllSyncBindings();
    ScriptMessage($"build time: {DateTime.UtcNow - beginTime}");
}