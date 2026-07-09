namespace deltarunePacker
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            string workspace = Path.GetFullPath(args[0]);
            var res = Path.Combine(workspace, "result");
            foreach (var dir in new[] { "ch1", "ch2", "ch3", "ch4", "ch5", "main", "demo" }){
                Directory.CreateDirectory(Path.Combine(workspace, "result", dir));
                Directory.CreateDirectory(Path.Combine(workspace, "export_result", dir));
			}
            DateTime begin = DateTime.Now;
            await Task.WhenAll(
                new Exporter(Path.Combine(workspace, "export_result/ch5"), Path.Combine(workspace, "ch5/data.win")).Run()
                // new Exporter(Path.Combine(workspace, "export_result/ch4"), Path.Combine(workspace, "ch4/data.win")).Run()
                // new Exporter(Path.Combine(workspace, "export_result/ch3"), Path.Combine(workspace, "ch3/data.win")).Run(),
                // new Exporter(Path.Combine(workspace, "export_result/ch2"), Path.Combine(workspace, "ch2/data.win")).Run()
            );
            // await Task.WhenAll(
            //     new Importer(Path.Combine(workspace, "ch5"), Path.Combine(workspace, "result/ch5"), Path.Combine(workspace, "ch5/data.win")).Run(),
            //     new Importer(Path.Combine(workspace, "ch4"), Path.Combine(workspace, "result/ch4"), Path.Combine(workspace, "ch4/data.win")).Run(),
            //     new Importer(Path.Combine(workspace, "ch3"), Path.Combine(workspace, "result/ch3"), Path.Combine(workspace, "ch3/data.win")).Run(),
            //     new Importer(Path.Combine(workspace, "ch2"), Path.Combine(workspace, "result/ch2"), Path.Combine(workspace, "ch2/data.win")).Run(),
            //     new Importer(Path.Combine(workspace, "ch1"), Path.Combine(workspace, "result/ch1"), Path.Combine(workspace, "ch1/data.win")).Run(),
            //     new Importer(Path.Combine(workspace, "main"), Path.Combine(workspace, "result/main"), Path.Combine(workspace, "main/data.win")).RunMain()
            // );
            // await Task.WhenAll(
            //     new Importer(Path.Combine(workspace, "demo"), Path.Combine(workspace, "result/demo"), Path.Combine(workspace, "demo/data.win")).RunDemo()
            // );

            // // 复制文本到demo
            // foreach (var f in Directory.GetFiles(Path.Combine(res, "ch1"), "lang_*.json"))
            //     File.Copy(f, Path.Combine(res, "demo", Path.GetFileNameWithoutExtension(f) + "_ch1.json"), true);
            // foreach (var f in Directory.GetFiles(Path.Combine(res, "ch2"), "lang_*.json"))
            //     File.Copy(f, Path.Combine(res, "demo", Path.GetFileName(f)), true);
            // Console.WriteLine($"build time: {DateTime.Now - begin}");
        }
    }
}
