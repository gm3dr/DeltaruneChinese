# DELTARUNE 中文本地化补丁 — 项目概览

> 好人汉化组维护的 DELTARUNE（第 1~5 章 + Demo）中文本地化项目。
> 工作流：从游戏解包 → 替换文本/贴图/代码 → 导入打包 → xdelta 差分 → 分发。

---

## 仓库结构

```
├── atlas_packer/           # Node.js 纹理页图集打包工具
│   ├── run.js              # 入口，基于 free-tex-packer-core 合成贴图
│   ├── template.mst        # 纹理页模板
│   └── package.json
├── scripts/                # Node.js 全平台构建脚本入口
│   ├── package.json        # 依赖: @clack/prompts
│   ├── build.js            # 入口 — 多选步骤后顺序执行
│   └── lib/
│       ├── utils.js        # 共享工具层（平台检测、Steam 路径、exec 等）
│       ├── 1-copy-datawin.js
│       ├── 2-download-text.js
│       ├── 3-generate-atlas.js
│       ├── 4-pack-resources.js
│       └── 5-generate-patch.js
├── MANIFEST.md              # Steam depot manifest ID（供构建脚本参考）
├── cn_installer/            # 安装程序外壳资源
│   ├── 7zS2.sfx            # 自解压模块
│   ├── readme.txt           # 更新日志模板
│   ├── linux/              # Linux 安装器
│   ├── win/                # Windows 安装器 (含 config.txt)
│   └── winold/
├── prproj/                 # Adobe Premiere Pro 2025 工程项目
│                           # (Tenna 小视频、宣传片、第五章片头动画)
├── src/                    # C# (.NET 10) 汉化打包核心工具
│   ├── Program.cs          # 入口：遍历 ch1~ch5/main/demo 调用 Importer
│   ├── Loader.cs           # 基类：日志分级、data.win 加载
│   ├── Importer.cs         # 核心：将本地化资源导入 data.win
│   ├── Exporter.cs         # 从原版 data.win 提取文本（导出 en.json）
│   └── lib/
│       ├── UndertaleModLib.dll     # GameMaker data.win 操作库
│       └── Underanalyzer.dll       # GML 反编译/编译器
├── tool/                   # 辅助工具
│   ├── 7z.exe / 7z         # 7-Zip 压缩（仅 Windows 或系统已安装时使用）
│   ├── bmfont64.exe        # 像素字体生成（Windows 直接调用，非 Windows 通过 Wine）
│   └── xdelta3 / xdelta3.exe # 差分补丁生成
├── workspace/              # 汉化工作区 — 核心资源目录
│   ├── ch1/ ~ ch5/         # 第 1~5 章汉化资源
│   │   └── imports/
│   │       ├── atlas/      # 重新打包的纹理页（已合成的大图）
│   │       ├── code/       # 修改过的 GML 代码 (.gml)
│   │       ├── font/       # 字体资源
│   │       │   ├── font/   # 补字用 TTF 字体
│   │       │   ├── pics/   # 原字体字符单图
│   │       │   └── bmfc/   # bmfont 配置
│   │       ├── pics/       # 本地化贴图（生成图集用）
│   │       ├── pics_zhname/ # 人名翻译版贴图
│   │       └── text_src/   # 语言文件
│   │           ├── cn.json # 中文翻译 JSON
│   │           ├── en.json # 英文原文 JSON
│   │           └── raw.json # 游戏原始文本
│   ├── demo/               # Demo 版汉化资源
│   ├── global/             # 跨章节共享资源
│   │   ├── re_cnname.json  # 中文人名替换表
│   │   └── re_recruit.json # 招募替换表
│   ├── main/               # 章节选择器汉化资源
│   └── result/             # 打包输出目录（被 gitignore）
├── *.ps1                   # PowerShell 工作流脚本（旧版，仅供参考）
└── AGENTS.md               # 本文件 — AI 项目概览
```

---

## 核心技术栈

| 层 | 技术 |
| :--- | :--- |
| 游戏引擎 | GameMaker Studio 2 (YoYo Games) |
| 资源格式 | `data.win` (GMS2 打包格式) |
| 操作库 | UndertaleModLib + Underanalyzer (.NET) |
| 打包工具 | C# .NET 10 (`src/deltarunePacker`) |
| 图集合成 | Node.js / free-tex-packer-core |
| 字体生成 | bmfont64.exe（Windows 直接调用，非 Windows 通过 Wine） |
| 差分分发 | xdelta3 |
| 分发打包 | 7z SFX 自解压 |

---

## 构建工作流

> ⚡ 使用 `node scripts/build.js` 启动交互式构建，可选择要执行的步骤。
> 旧版 PS1 脚本保留在根目录，仅作参考。

### 复制游戏文件 — `scripts/lib/1-copy-datawin.js`
- 自动检测 OS（Win/macOS/Linux），从 Steam 安装目录复制各章 `data.win`
- **前置操作**：在 Steam 控制台输入 `MANIFEST.md` 中的 `download_depot` 命令下载对应版本

### 下载翻译文本 — `scripts/lib/2-download-text.js`（可选）
- 从 Weblate 翻译平台 API 拉取最新的中英文 JSON
- **依赖**：根目录 `secrets.ps1`（含 TOKEN 和 URL）

### 生成纹理图集 — `scripts/lib/3-generate-atlas.js`
- 调用 `node atlas_packer/run.js`，将各章 `imports/pics/` 散图合成为完整纹理页

### 打包汉化资源 — `scripts/lib/4-pack-resources.js`
- 编译并运行 `src/deltarunePacker`（.NET 10）
- `Importer` 逐章执行：导入图集 → 替换文本 → 替换/注入 GML 代码 → 替换贴图
- **字体生成**：C# 内部调用 bmfont64.exe（Windows）或通过 Wine 调用（非 Windows）

### 生成汉化补丁 — `scripts/lib/5-generate-patch.js`
- xdelta3 对比原版与汉化 data.win 生成差分
- 7z 打包最终分发文件 + 可选安装程序打包

---

## 每章 imports 目录结构详解

```
workspace/ch{N}/imports/
├── atlas/           纹理页（打包后输出位置，由步骤 3 生成）
├── code/            修改过的 GML 代码
├── font/            字体资源
│   ├── font/        TTF 补字字体
│   ├── pics/        原字体字符单图
│   └── bmfc/        bmfont 配置
├── pics/            本地化贴图散图（源文件，步骤 3 读取）
├── pics_zhname/     人名翻译版贴图
└── text_src/        多语言文本数据（⚠️ 可能较大，避免完整读取）
    ├── cn.json      中文翻译
    ├── en.json      英文原文
    └── raw.json     游戏原始文本
```

### GML 代码修改要点

**通用修改（所有章节）：**
- 绕过 `is_english` 检查，使 `lang=en` 时仍从语言文件夹加载 JSON
- `obj_writer`：添加中文字符字宽逻辑、支持 `\n` 换行、保留 `` ` `` 特殊文本功能
- `DEVICE_MENU`：日文下显示"简体中文"
- `obj_credits`：覆盖日文 staff 名单为汉化组名单
- `scr_kana_check`：去除日文字体切换
- 人名翻译切换：修改 `scr_change_language`、`obj_initializer2`、`DEVICE_MENU` 等
  - 新增变量 `global.names` 和 `true_config.ini` 的 `NAMES` 项

**各章特有：**
- **ch1**：Sans 店名 / Toriel 黑板人名翻译
- **ch2**：Pipis 人名翻译、逐字效果适配
- **ch3**：Tenna 音游/小视频/发癫/人名翻译、Rouxls 战飞机旗帜
- **ch4**：TAKING TOO LONG 修正、回退 `obj_micmenu`、Sans 店名/Toriel 黑板
- **ch5**：Flowery 出场动画 (prproj)

---

## 人名翻译系统

通过 `workspace/global/re_cnname.json` 和 `re_recruit.json` 实现：
- `global.names` 变量存储用户选择（中文名 / 英文名）
- 各章 `obj_84_lang_helper`、`obj_town_event` 等负责具体切换
- 图集有 `pics_zhname/` 目录存放中文名版本贴图

---

## .NET 打包工具 (src/deltarunePacker)

| 类 | 职责 |
| :--- | :--- |
| `Loader` | 基类，加载 `data.win`，提供日志分级（Verbose/Info/Warning/Error/Assert） |
| `Importer` | 将中文本地化资源导入 `data.win`：贴图替换、文本注入、GML 编译替换、字体导入 |
| `Exporter` | 从原版 `data.win` 提取文本生成 JSON（用于翻译） |
| `Program` | 入口，并行处理 ch1~ch5/main，再处理 demo，复制语言文件 |

---

## 字体系统

| 字体 | 用途 |
| :--- | :--- |
| `normal.ttf` | SimSun 12x — 中易宋体内嵌点阵（修改过标点符号） |
| `battle.ttf` | SimSun 16x — 战斗中文字 |
| `sans.ttf` | 方正少儿 — 手机端提取大字库版 |
| `noelle.ttf` | Boutique Bitmap 9x9 R — 精品点阵体 |
| `8bit.ttf` | Boutique Bitmap 9x9 B — 精品点阵体 |
| `legend.ttf` | Maru Monica 补字版 |

> 字体生成由 C# `Importer.ImportFonts` 负责：Windows 直接调用 `tool/bmfont64.exe`，
> 非 Windows 通过 `wine tool/bmfont64.exe` 运行。JS 脚本不参与字体生成。

---

## 协议

- **翻译文本 + 贴图**：CC BY-NC-SA 4.0
- **打包工具源码 (src/) + PS1 脚本**：GPL v3
- **GML 代码**：从游戏解包修改，无授权协议，后果自负

---

## 注意事项（AI Agent）

1. **⚠️ 大文件警告**：`workspace/ch*/imports/text_src/` 下的 `cn.json`、`en.json`、`raw.json` 为翻译数据文件，体积很大，**除非明确需要分析文本内容，否则不要读取**。
2. **⚠️ 大文件警告**：`atlas_packer/node_modules/`、`workspace/result/` 等目录被 gitignore，本地不存在或体积大，勿操作。
3. **构建入口**：使用 `node scripts/build.js`，内置多选步骤菜单。
4. **构建依赖**：需要 .NET 10 SDK、Node.js、Steam 客户端（拥有 DELTARUNE）。
5. **操作系统差异**：Windows/Linux 使用 `data.win`，macOS 使用 `game.ios`；补丁不通用。
6. **字体跨平台**：非 Windows 系统需安装 Wine 以运行 bmfont64.exe。
7. **GML 代码**：文件名为 `gml_Object_*` / `gml_GlobalScript_*` 格式，对应 GameMaker 内部命名。
8. **未完成章节**：ch5 和 demo 可能仍在开发中，注意检查文件完整性。
