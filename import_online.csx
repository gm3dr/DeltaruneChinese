#load "scripts/import.csx"
using System.Text;
using System.Net.Http;
using System.Threading.Tasks;

using UndertaleModLib.Util;

using(HttpClient client = new()){
    string workspace = PromptChooseDirectory();
    if (workspace == null) return;
    string name = ScriptInputDialog("Input", "Name:", $"deltarune/{new DirectoryInfo(workspace).Name}", "Cancel", "Submit", false, false);
    if (name == null) return;
    string address = ScriptInputDialog("Input", "API Address:", "", "Cancel", "Submit", false, false);
    if (address == null) return;
    string apiToken = ScriptInputDialog("Input", "Weblate Token:", "", "Cancel", "Submit", false, false);
    if (apiToken == null) return;
    client.BaseAddress = new Uri(address);
    client.DefaultRequestHeaders.Add("Authorization", $"Token {apiToken}");
    Task.WaitAll(
        File.WriteAllTextAsync(Path.Combine(workspace, "imports/text_src/en.json"), await client.GetStringAsync($"translations/{name}/en/file/"), Encoding.UTF8),
        File.WriteAllTextAsync(Path.Combine(workspace, "imports/text_src/cn.json"), await client.GetStringAsync($"translations/{name}/zh_Hans/file/"), Encoding.UTF8)
    );
    await Run(workspace, name);
}

