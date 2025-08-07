using System.Text.Json;
using System.Text.Encodings.Web;
using System.Text.RegularExpressions;
string RestoreItem(string key, string item, string fmt, StreamWriter logger) {
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
        logger.WriteLine($"[RestoreItem]fmt empty: {key}");
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

void WriteRestoredJson(string pathResult, string targetJson, string baseJson, string fmtJson, StreamWriter logger) {
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
            logger.WriteLine($"[WriteRestoredJson]no translation for {item.Name}: {item.Value}");
        } else if (!hasFmt) {
            logger.WriteLine($"[WriteRestoredJson]missing fmtKey {item.Name}: {item.Value}");
            continue;
        }
        writer.WriteString(item.Name, RestoreItem(
            item.Name,
            found ? targetItem.ToString() : baseItem.ToString(),
            item.Value.ToString(),
            logger
        ));
    }
    writer.WriteEndObject();
    writer.Flush();
}
