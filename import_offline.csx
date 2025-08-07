#load "scripts/import.csx"

using UndertaleModLib.Util;

string workspace = PromptChooseDirectory();
if (workspace == null) return;
string name = ScriptInputDialog("Input", "Name:", $"deltarune/{new DirectoryInfo(workspace).Name}", "Cancel", "Submit", false, false);
if (name == null) return;
await Run(workspace, name);

