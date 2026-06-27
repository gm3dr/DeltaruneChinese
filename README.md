# DELTARUNE 中文本地化补丁 By 好人汉化组

**从 [此处](https://github.com/gm3dr/DeltaruneChinese/releases/latest) 下载最新版汉化补丁**<br>
本仓库源码滚动更新，如需下载特定时间戳的仓库快照，请到Release页面下载。

## 补丁安装方法
> [!NOTE]
> 如果在安装过程中出现任何问题<br>
> 请先尝试在 Steam 右键 DELTARUNE<br>
> 选择 `属性 -> 本地文件 -> 验证游戏文件完整性`<br>
> 待 Steam 验证完毕后再次尝试

> [!TIP]
> 获取安装目录方法：在 Steam 右键 DELTARUNE<br>
> 选择 `管理 -> 浏览本地文件`

### 一键安装器
1. 前往 https://github.com/gm3dr/DeltaruneChinesePatcher/releases/latest 下载安装器<br>
2. *（仅限 macOS）* 将安装器移动到 `Applications` 目录下<br>
3. 将汉化补丁放到安装器根目录 *（macOS 操作步骤见下文）*，打开安装器<br>
4. *（仅限 macOS 或 Linux）* 输入 DELTARUNE 安装目录（或「浏览」，选中 DELTARUNE 安装目录）<br>
5. 点击「安装补丁」即可

> [!TIP]
> Windows 版安装器可以全自动从 Steam 获取 DELTARUNE 安装路径<br>
> 安装 DELTARUNE 后重启电脑，再运行汉化安装器，就会自动填入路径，无需手动操作<br>

> [!IMPORTANT]
> macOS 没有注册表，所以无法自动填写游戏路径<br>
> 在 Finder 中右键 `DELTARUNE Chinese Patcher.app`，选择「显示包内容」即可显示包内文件<br>
> 补丁需要放到安装器 `DELTARUNE Chinese Patcher.app/Contents/MacOS` 文件夹<br>
> 需要填入的游戏目录为 DELTARUNE 目录下 `DELTARUNE.app/Contents/Resources`

### 手动安装
下载汉化补丁，将里面所有的内容全部解压到 DELTARUNE 安装目录下，全部覆盖<br>
使用 [DeltaPatcher](https://github.com/marco-calautti/DeltaPatcher) 按照以下表格逐行进行输入<br>
输入后点击 `Apply patch`<br>

#### Windows / Linux
| Original file | XDelta patch |
| :--- | :--- |
| `DELTARUNE 安装路径`/data.win | `补丁路径`/main.xdelta |
| `DELTARUNE 安装路径`/chapter1_windows/data.win | `补丁路径`/chapter1.xdelta |
| `DELTARUNE 安装路径`/chapter2_windows/data.win | `补丁路径`/chapter2.xdelta |
| `DELTARUNE 安装路径`/chapter3_windows/data.win | `补丁路径`/chapter3.xdelta |
| `DELTARUNE 安装路径`/chapter4_windows/data.win | `补丁路径`/chapter4.xdelta |
| `DELTARUNE 安装路径`/chapter5_windows/data.win | `补丁路径`/chapter5.xdelta |

> [!TIP]
> Linux 不需要额外操作，可以与 Windows 共用补丁<br>
> 游戏文件和补丁文件一样，都是完全相同的<br>
> 这是因为 Steam 使用 Proton 兼容层运行 Windows 版 DELTARUNE

#### macOS
| Original file | XDelta patch |
| :--- | :--- |
| `DELTARUNE 安装路径`/game.ios | `补丁路径`/main.xdelta |
| `DELTARUNE 安装路径`/chapter1_mac/game.ios | `补丁路径`/chapter1.xdelta |
| `DELTARUNE 安装路径`/chapter2_mac/game.ios | `补丁路径`/chapter2.xdelta |
| `DELTARUNE 安装路径`/chapter3_mac/game.ios | `补丁路径`/chapter3.xdelta |
| `DELTARUNE 安装路径`/chapter4_mac/game.ios | `补丁路径`/chapter4.xdelta |
| `DELTARUNE 安装路径`/chapter5_mac/game.ios | `补丁路径`/chapter5.xdelta |

> [!IMPORTANT]
> macOS 需要使用 macOS 版本的补丁，Windows 版补丁无法使用<br>
> macOS 的游戏安装路径为「安装目录下 `DELTARUNE.app/Contents/Resources`」<br>

---

# 由此开始是本仓库源码的内容<br>玩家看上面的就足够了

## 协议 License
翻译文本（`workspace/ch*/imports/text_src`）与修改的中文贴图（`workspace/ch*/imports/pics`/`workspace/ch*/imports/pics_zhname`）使用 **[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh-hans)** 协议许可<br>
在保留好人汉化组署名的前提下，您可以对补丁的文本和贴图进行修改，并合法使用，好人汉化组对修改后的内容不承担任何责任。

打包工具源码 `src` 及 Powershell 脚本 `*.ps1` 在 **[GPL 通用公共许可证 v3（GPL v3）](https://www.gnu.org/licenses/gpl-3.0.zh-cn.html)** 下开源。

GML 代码 `workspace/ch*/imports/code` 是从 DELTARUNE 游戏中，使用 Undertale Mod Tool 工具解包并修改的。由于改动较小，无法分别列出，恕我们无法给出授权协议<br>
您可以使用或修改这些代码，后果自负，好人汉化组对于这些代码的改动不承担任何责任。

## 依赖项 Prerequisites

本地生成补丁需要如下依赖：

- **.NET 10.0 SDK**（用于编译 `src/deltarunePacker.csproj`）
- **Node.js & npm**（用于运行 `atlas_packer` 图集切片工具）
- **Steam 客户端**（且账户中拥有 DELTARUNE，以获取特定 Depot 的游戏文件）
- （可选）如果需要拉取最新文本，需在根目录创建 `secrets.ps1` 存放你的 API Token。

> [!IMPORTANT]
> 在生成像素字体时需要调用 `bmfont64.exe` 程序，**必须保证文件路径没有任何汉字或特殊字符**。否则可能会因路径编码不匹配而报错。

## 工作流简介 (Powershell 脚本)

所有打包过程已整合成 PS1 脚本，存放在根目录。直接按顺序运行即可：

### 1. `复制datawin.ps1` (下载游戏)
自动识别操作系统（Windows/macOS/Linux），并前往对应的 Steam 安装目录抓取所需文件。

> [!IMPORTANT]
> **运行此脚本前，请在系统浏览器输入 `steam://open/console` 打开 Steam 控制台，并逐行输入以下命令，下载指定版本的游戏：**
> - `download_depot 1671210 1671212 5291565625263756968`
> - `download_depot 1671210 1671213 667983367427050155`
> - `download_depot 1690940 1690941 7280478300334929399`
> - `download_depot 1690940 1690942 1337622988459417429`

### 2. `下载文本.ps1` (拉取远端翻译，可选)
通过 API 全自动下载第 1~5 章最新的中英文 `en.json` 与 `cn.json`。

> [!TIP]
> 在运行该脚本前，请确保您拥有“好人汉化组” Weblate 翻译站的访问权限。在仓库根目录新建 `secrets.ps1`：
> ```powershell
> $env:TOKEN = "你的 API Token"
> $env:URL = "翻译站网址"
> ```

### 3. `生成图集.ps1` (打包纹理贴图)

通过 `node atlas_packer/run.js` 根据 `template.mst` 模板，将散装的本地化贴图合成为游戏引擎使用的完整大图。

### 4. `打包资源.ps1` (构建二进制 Data)

调用 .NET 10 工具链编译打包器，并运行 `src` 目录下的 `deltarunePacker` 的资源导入工具，将汉化贴图、文本等导入到各章 data.win中。

### 5. `生成汉化补丁.ps1` (生成分发封包)

调用 `xdelta3` 生成各平台的补丁差分文件，并调用 `7z` 打包补丁和安装器，构建出汉化补丁成品。

---

## 仓库结构

```text
├── atlas_packer       # 图集生成工具
│   ├── package.json
│   ├── run.js         # 主脚本
│   └── template.mst   # 模板
├── cn_installer       # 汉化安装器、打包依赖、自解压模块
├── prproj             # Adobe Premiere Pro 2025 工程项目
├── src                # 汉化打包核心工具源码 (C#)
│   ├── Importer.cs / Exporter.cs / Loader.cs / Program.cs
│   └── lib            # 底层基础库（UndertaleModLib.dll, Underanalyzer.dll）
├── tool               # 额外的辅助工具（7z.exe、bmfont64.exe、xdelta3.exe）
└── workspace          # 汉化工作区
    ├── ch1 ~ ch4      # 1 - 4章汉化资源（贴图、字体、文本、代码等）
    ├── demo           # Demo 版汉化资源
    ├── global         # 人名替换表、跨章节共享资源
    ├── main           # 章节选择器汉化资源（主要是代码）
    └── result         # 输出

```

> [!NOTE]
> `.gitignore` 过滤了所有的临时目录（`temp`, `obj`, `bin`），底层依赖包（`node_modules`）、游戏本体文件（`data.win`, `game.ios`）、密钥文件（`secrets.*`）。在提交 PR 时请勿夹带此类文件。

### 每个章节对应 imports 内结构（workspace/ch\*/imports）
- `atlas` 使用的纹理页图集，包含所有新纹理，使用 `node atlas_packer/run` 生成
- `code` [修改过的 GML 代码](#%E4%BF%AE%E6%94%B9%E8%BF%87%E7%9A%84-gml-%E4%BB%A3%E7%A0%81%E5%AE%9E%E7%8E%B0workspacechimportscode)
- `font` 字体
  - `font` [原字体的补字字体](#%E8%A1%A5%E5%AD%97%E7%94%A8%E5%AD%97%E4%BD%93workspacechimportsfontfont)
  - `pics` 原字体的字符单图
  - `bmfc` 补字字体的 bmfont 基础配置
- `pics` 贴图，用于生成纹理页图集
- `pics_zhname` 人名翻译版贴图，用于生成纹理页图集
- `text_src` 打包使用的语言文件
> [!IMPORTANT]
> 除了第三章 Tenna 的 `funnytext` 艺术字有特殊处理，自动居中外<br>
> 其余贴图都需要保证大小与原本的相同，否则会报错

### 修改过的 GML 代码实现（workspace/ch\*/imports/code）
#### 通用
1. 废话：把代码中硬编码没有走游戏多语言系统的文本改动了<br>修改了各种坐标值来微调文字显示位置和动画
2. 改动了 `is_english` 使得游戏即使当 `lang` 为 `en` 时也会从语言文件夹中加载 json
3. 改动了 `obj_writer` 添加了汉字字符字宽逻辑
4. 改动了 `DEVICE_MENU`（读档界面）使得日文下显示的是`简体中文`而不是`English`
5. 改动了 `obj_credits` 覆盖掉了原有的日文本地化名单为汉化组名单
6. 改动了 `scr_kana_check` 去除了文本中含有日文时切换为日文字体的功能<br>这个功能原本用于保证日文玩家名也能在英文时正常显示
7. 改动了 `scr_change_language`、`obj_initializer2`、`scr_84_lang_load`、`scr_84_init_localization`、`DEVICE_MENU` 来实现人名翻译的切换<br>添加了变量 `global.names` 用于存储人名翻译选项的值，往 `true_config.ini` 里添加了 `NAMES` 项用来存储人名翻译选项的设定
#### 第一章
1. 改动了 `obj_writer` 把后三章的``` ` ```保留特殊字符文本功能带回了第一章
2. 改动了 `obj_writer` 把后三章的`\n`换行逻辑带回了第一章
3. 改动了 `obj_town_event` 来实现 Sans 店名的人名翻译切换
4. 改动了 `obj_84_lang_helper` 来实现 Toriel 黑板的人名翻译切换
#### 第二章
1. 改动了 `obj_fusionmenu` 来让存档点的`伙伴`页面字串不被横向压缩
2. `obj_welcometothecity_backinglights`，逐字效果的适配
3. 改动了 `obj_town_event` 来实现 Sans 店名的人名翻译切换
4. 改动了 `obj_84_lang_helper` 来实现 Toriel 黑板的人名翻译切换
5. 改动了 `obj_pipis_egg_bullet`/`obj_pipis_enemy` 来实现 Pipis 的人名翻译切换
#### 第三章
1. 改动了 `obj_fusionmenu` 来让存档点的`伙伴`页面字串不被横向压缩
2. 改动了 `obj_writer_quiz` 添加了汉字字符字宽逻辑
3. 改动了 `scr_rhythmgame_lyrics` 使得音游小游戏强制使用日文方式显示字间隙
4. 改动了 `obj_ch3_closet` 加长了 Tenna 发癫
5. 改动了 `obj_watercooler`/`obj_holywatercooler` 把 Watercooler/Holywatercooler 说话逻辑改为和日文一样随机字符
6. 改动了 `obj_rouxls_annyoing_dog_controller` 把 Rouxls 战的 `神烦狗 参战` 从英文的文本改为了和日文一样的贴图形式
7. 改动了 `obj_room_green_room` 来实现 Ramb 位置上方的人名翻译切换
8. 改动了 `obj_dw_ranking_t_explain` 来实现 T 级房间 Tenna 的人名翻译切换
9. 改动了 `scr_rhythmgame_draw` 来实现音游小游戏的人名翻译切换
10. 改动了 `obj_ch3_couch_video` 来实现 Tenna 小视频的人名翻译切换
11. 改动了 `obj_rouxls_biplane_flag` 来实现 Rouxls 战飞机旗帜弹幕的人名翻译切换
#### 第四章
1. 改动了 `obj_fusionmenu` 来让存档点的`伙伴`页面字串不被横向压缩
2. 清空了 `obj_dw_church_intro_guei_Draw_0` 来去除一个文本中的特殊字符<br>这条文本的中文译文中不含这个特殊字符
3. 改动了 `obj_takingtoolong` 来让 TAKING TOO LONG 不会 TAKING TOO LONG
4. 把 `obj_micmenu` 回退到了 Patch 1.02 之前的版本<br>
Patch 1.02 为了允许麦克风有更多字符能显示，强制这里使用日文字体，所以回退到旧版
1. 改动了 `obj_room_town_mid` 来实现 Sans 店名的人名翻译切换
2. 改动了 `obj_84_lang_helper` 来实现 Toriel 黑板的人名翻译切换
3. 改动了 `scr_rhythmgame_draw` 来实现音游小游戏的人名翻译切换
### 补字用字体（workspace/ch\*/imports/font/font）
- `normal.ttf` SimSun 12x（中易宋体 内嵌点阵 12）<br>（修改过拼音、全角问号叹号、全角逗号句号、双层直角引号）
- `battle.ttf` SimSun 16x（中易宋体 内嵌点阵 16）
- `sans.ttf` 方正少儿（手机端主题提取的两万字大字库版）
- `noelle.ttf` Boutique Bitmap 9x9 R（精品点阵体 9x9 R）
- `8bit.ttf` Boutique Bitmap 9x9 B （精品点阵体 9x9 B）
- `legend.ttf` 基于 DR 日文使用的 Maru Monica 补字，By 晓晓_Akatsuki

### Adobe Premiere Pro 2025 工程项目（prproj）
- `tennaIntroF1_compressed_28` [第三章的 Tenna 神人小视频](https://www.bilibili.com/video/BV15mT5zAEJS)
- `1-4宣传片` [B站官号发布的 1-4 章汉化发布宣传片](https://www.bilibili.com/video/BV1BPhWzdEao)<br>
为了控制文件大小，去除了宣传片使用的所有视频素材，请在下方网盘下载后全部放置到文件夹内<br>
https://www.123912.com/s/KPMSVv-ydDjv
- `ch5_intro_en` 第五章的 Flowery 出场动画