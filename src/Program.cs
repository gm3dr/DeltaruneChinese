namespace deltarunePacker {
    internal class Program {
        static async Task Main(string[] args) {
            string workspace = Path.GetFullPath(args[0]);
            Directory.CreateDirectory(Path.Combine(workspace, "result/ch4"));
            Directory.CreateDirectory(Path.Combine(workspace, "result/ch3"));
            Directory.CreateDirectory(Path.Combine(workspace, "result/ch2"));
            Directory.CreateDirectory(Path.Combine(workspace, "result/ch1"));
            Directory.CreateDirectory(Path.Combine(workspace, "result/main"));
            DateTime begin = DateTime.Now;
            await Task.WhenAll(
                new Importer(Path.Combine(workspace, "ch4"), Path.Combine(workspace, "result/ch4"), Path.Combine(workspace, "ch4/data.win")).Run(),
                new Importer(Path.Combine(workspace, "ch3"), Path.Combine(workspace, "result/ch3"), Path.Combine(workspace, "ch3/data.win")).Run(),
                new Importer(Path.Combine(workspace, "ch2"), Path.Combine(workspace, "result/ch2"), Path.Combine(workspace, "ch2/data.win")).Run(),
                new Importer(Path.Combine(workspace, "ch1"), Path.Combine(workspace, "result/ch1"), Path.Combine(workspace, "ch1/data.win")).Run(),
                new Importer(Path.Combine(workspace, "main"), Path.Combine(workspace, "result/main"), Path.Combine(workspace, "main/data.win")).RunMain()
            );
            Console.WriteLine($"build time: {DateTime.Now - begin}");
        }
    }
}
