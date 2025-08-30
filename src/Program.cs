using DeltarunePacker;

namespace deltarunePacker
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string workspace = Path.GetFullPath(args[0]);
            Directory.CreateDirectory(Path.Combine(workspace, "result/ch4"));
            Directory.CreateDirectory(Path.Combine(workspace, "result/ch3"));
            Directory.CreateDirectory(Path.Combine(workspace, "result/ch2"));
            Directory.CreateDirectory(Path.Combine(workspace, "result/ch1"));
            DateTime begin = DateTime.Now;
            Task.WaitAll(
                Task.Run(() => new Importer(Path.Combine(workspace, "data4.win"), Path.Combine(workspace, "ch4"), Path.Combine(workspace, "result/ch4")).Run()),
                Task.Run(() => new Importer(Path.Combine(workspace, "data3.win"), Path.Combine(workspace, "ch3"), Path.Combine(workspace, "result/ch3")).Run()),
                Task.Run(() => new Importer(Path.Combine(workspace, "data2.win"), Path.Combine(workspace, "ch2"), Path.Combine(workspace, "result/ch2")).Run()),
                Task.Run(() => new Importer(Path.Combine(workspace, "data1.win"), Path.Combine(workspace, "ch1"), Path.Combine(workspace, "result/ch1")).Run())
            );
            Console.WriteLine($"build time: {DateTime.Now - begin}");
        }
    }
}
