# DELTARUNE 中文本地化补丁 By 好人汉化组

**从 [此处](https://github.com/gm3dr/DeltaruneChinese/releases/latest) 下载最新版汉化补丁**<br>
本仓库源码滚动更新，如需下载特定时间戳的仓库快照，请到Release页面下载。

（2026-07-23） **当前仓库 GML 反编译使用[UndertaleModTool](https://github.com/UnderminersTeam/UndertaleModTool/releases) 0.9.1.2版**

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
- 前往 https://github.com/gm3dr/DeltaruneChinesePatcher/releases/latest 下载安装器<br>
- *（仅限 macOS）* 将安装器移动到 `Applications` 目录下<br>
- 将汉化补丁放到安装器根目录 *（macOS 操作步骤见下文）*，打开安装器<br>
- *（仅限 macOS 或 Linux）* 输入 DELTARUNE 安装目录（或「浏览」，选中 DELTARUNE 安装目录）<br>
- 点击「安装补丁」即可

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
见 [LICENSE.md](./LICENSE.md)

## 依赖项 Prerequisites

本地生成补丁需要如下依赖：

- **Powershell 7+**（用于运行 PS1 脚本，考虑到下面对 .NET 10 的需求，建议直接使用 PowerShell 7.6+）
- **.NET 10.0 SDK**（用于编译 `src/deltarunePacker.csproj`）
- **Node.js & npm**（用于运行 `atlas_packer` 图集与字体生成工具，只要不是太老的版本一般都可以）
- **7-Zip & XDelta3**（用于生成 `.xdelta` 格式的差分补丁并打包）
- **Steam 客户端**（且账户中拥有 DELTARUNE，以获取特定 Depot 的游戏文件）
- （可选）如果需要拉取最新文本，需在根目录创建 `secrets.ps1` 存放你的 API Token。

### 安装方式
请根据所使用的系统进行选择：

> [!NOTE]
> - 考虑到 .NET 11 已正式发布，如果需要保持使用 .NET 10，请在安装 .NET SDK 与 PowerShell 时自行为其添加相应的版本号标识
> - 关于 7-Zip 和 XDelta3，Windows 平台会将 `tool` 目录下的 `7z.exe` 与 `xdelta3.exe` 添加到临时环境变量中作为兜底，其他平台则需要像以下内容一样自行安装。
> - 对于 Linux 及 FreeBSD 平台，请自行将 `sudo` 替换为你所使用的提权工具

<details>

<summary>Windows 10/11 x64</summary>

基本上 Windows 10 2004(19041) 及以上版本即可保证脚本运行不出错，可以下载相应安装包，也可以用 winget 安装：
```powershell
winget install --id Microsoft.DotNet.SDK.10 Microsoft.PowerShell OpenJS.NodeJS.LTS
```

</details>

<details>

<summary>Fedora</summary>

```bash
sudo dnf install xdelta 7zip tar curl npm nodejs dotnet-sdk-10.0

dotnet tool install -g PowerShell
# 随后，根据提示和你所使用的 shell，把 $HOME/.dotnet/tools 加到 PATH
```

</details>

<details>

<summary>Arch Linux (含 SteamOS 3)</summary>

```bash
# 如果你使用的是 paru 而非 yay，请你在执行时把下面的 yay 换成 paru
yay -S --needed powershell-bin xdelta3 tar 7zip curl npm nodejs dotnet-sdk-10.0
```

其中，[`powershell-bin`](https://aur.archlinux.org/packages/powershell-bin) 来自 AUR，其它包来自官方仓库  
这个包可以换成 [`powershell-lts-bin`](https://aur.archlinux.org/packages/powershell-lts-bin) / [`powershell-preview-bin`](https://aur.archlinux.org/packages/powershell-preview-bin) / [`powershell`](https://aur.archlinux.org/packages/powershell) / [`powershell-git`](https://aur.archlinux.org/packages/powershell-git) 等类似包

不使用 AUR 的依赖安装：
```bash
sudo pacman -S --needed xdelta3 tar 7zip curl npm nodejs dotnet-sdk-10.0
dotnet tool install -g PowerShell

# 随后，根据提示和你所使用的 shell，把 $HOME/.dotnet/tools 加到 PATH 里
```

在测试 SteamOS 3.8 时，pacman 源里的 dotnet-sdk 还停在 9，需要另外找办法装 .NET SDK 10+，然后再 `dotnet tool install`，例如：
```bash
# 以下内容来自 https://learn.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual
curl -L https://dot.net/v1/dotnet-install.sh -o dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh --channel 10.0
```

> PS: [Windows 在 VirtualBox 上安装 SteamOS 3 虚拟机的教程](https://i12bretro.github.io/tutorials/0857.html)，以及需要按照[相应视频的评论区](https://www.youtube.com/watch?v=NJ2jvTgp4AA)中 AdminHouse 的做法（虚拟机设置中的显卡控制器改为 VBoxSVGA）和 qzind 的做法（将 `./tools/repair_device.sh` 中的 `set -eu` 一行注释掉）进行修改。

</details>

<details>

<summary>Debian</summary>

```bash
sudo apt install xdelta3 tar 7zip curl npm nodejs

# 以下内容修改自 https://learn.microsoft.com/zh-cn/dotnet/core/install/linux-debian?tabs=dotnet10
# 如果你用的是 Debian 12，把下面的 13 改为 12
curl https://packages.microsoft.com/config/debian/13/packages-microsoft-prod.deb -o /tmp/packages-microsoft-prod.deb
sudo dpkg -i /tmp/packages-microsoft-prod.deb
rm /tmp/packages-microsoft-prod.deb

sudo apt update
sudo apt install dotnet-sdk-10.0

dotnet tool install -g PowerShell

# 随后，根据提示和你所使用的 shell，把 $HOME/.dotnet/tools 加到 PATH 里
```

</details>

<details>

<summary>Ubuntu</summary>

需要 Ubuntu 24.04 及以上的 LTS 版本或常规版本，其他版本官方 apt 源没有 `dotnet-sdk-10.0` 包，见 [来源](https://learn.microsoft.com/zh-cn/dotnet/core/install/linux-ubuntu-install?pivots=os-linux-ubuntu-2404&tabs=dotnet10)
```bash
sudo apt install xdelta3 tar 7zip curl npm nodejs dotnet-sdk-10.0

dotnet tool install -g PowerShell

# 随后，根据提示和你所使用的 shell，把 $HOME/.dotnet/tools 加到 PATH 里
```

</details>

<details>

<summary>FreeBSD (实验性)</summary>

**此平台相比其它平台补丁构建更容易失败 / 不可用，请自行承担风险！**

更推荐启用 latest 分支的 pkg 源，以及 main 分支的 ports，以解决依赖问题

```sh
sudo pkg install xdelta3 7-zip curl npm node powershell python3 vips
```

FreeBSD ports 的 main 分支已有 .NET 10，可通过源代码编译安装：
```sh
cd /usr/ports/lang/dotnet

# 如果你已经启用了 latest 分支的 pkg 源，可以用以下命令从二进制安装依赖
make install install-missing-packages

sudo make reinstall clean
```

或者，可以从二进制安装 .NET 到用户：
```sh
# 去 https://github.com/sec/dotnet-core-freebsd-source-build/releases/latest 下载 .NET SDK 10
# 或者用以下的命令安装 (请自行替换 URL 中的版本号 (如果有更新的版本) ，以及 FreeBSD 版本，这里是 FreeBSD 15 x64)
# 要下载的东西很大，>1GB，记得留出充足的时间或直接改用 aria2, axel 等多线程下载工具

mkdir -p ~/dotnet-sdk/library-packs

curl https://github.com/sec/dotnet-core-freebsd-source-build/releases/download/10.0.110-vmr/dotnet-sdk-10.0.110-freebsd.15-x64.tar.gz -o dotnet-sdk.tar.gz
tar -xf dotnet-sdk.tar.gz -C ~/dotnet-sdk
rm dotnet-sdk.tar.gz

curl https://github.com/sec/dotnet-core-freebsd-source-build/releases/download/10.0.110-vmr/Private.SourceBuilt.Artifacts.10.0.110-servicing.26326.116.freebsd-x64.tar.gz -o artifacts.tar.gz
tar -xf artifacts.tar.gz -C ~/dotnet-sdk/library-packs
rm artifacts.tar.gz


# 随后，根据提示和你所使用的 shell，把 $HOME/dotnet-sdk 加到 PATH 最前面
```

进入本仓库目录后，需要手动安装 atlas_packer 依赖：
```sh
npm install --prefix atlas_packer --os=freebsd
```

此外，由于 FreeBSD 不会被 `$Is*` 的环境变量检测到系统，所以需要在 `./1-复制datawin.ps1` 的系统识别部分的 `else` 分支添加你的 Depot 下载路径

示例（假设你已经切换到了用 `linux-steam-utils` 安装过 Steam 的用户）：
```powershell
# 1. 自动识别操作系统并设置 Steam 根目录
$gameVer = "current"
if ($IsWindows -or $env:OS -like "*Windows*") {
    $AppsDir = "C:/Program Files (x86)/Steam/steamapps/content"
} elseif ($IsMacOS) {
    $AppsDir = "$env:HOME/Library/Application Support/Steam/Steam.AppBundle/Steam/Contents/MacOS/steamapps/content"
} elseif ($IsLinux) {
    $AppsDir = "$env:HOME/.local/share/Steam/ubuntu12_32/steamapps/content"
} else {
    $AppsDir = "$env:HOME/.local/share/Steam/ubuntu12_32/steamapps/content" # 可以 Ctrl + C/V Linux 部分的代码 (
}
```

</details>

<details>

<summary>macOS (x86_64)</summary>

对于 x86_64 架构 (Intel CPU) 的 macOS，由于 brew 已经开始逐步放弃对 x86_64 架构的支持，导致使用其安装时会需要现场编译相关依赖，故推荐 [手动下载 .NET SDK](https://dotnet.microsoft.com/zh-cn/download/dotnet) 进行安装，不过 PowerShell 和 Node.js 还是有相应安装命令可用的：

```bash
# 以下内容来自 Node.js 官网
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.41.0/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 24

dotnet tool install -g PowerShell

# 随后，根据提示和你所使用的 shell，把 $HOME/.dotnet/tools 加到 PATH 里
```

别忘了手动下载 [7z](https://www.7-zip.org/download.html) 和 [xdelta3](https://github.com/jmacd/xdelta/releases) 的二进制文件并加到 PATH 里。

> PS: [Windows 在 VMware Workstation 上安装 macOS x86_64 虚拟机的教程](https://imacos.top/2026/04/15/amd-intel/)，如果系统镜像文件不好找，可以参考[这个教程](https://blog.gucats.com/posts/31dfa174.html)的做法生成修复镜像（如果无法导入 `.vhdx`，可以在 VMware Workstation 所在目录运行 `.\vmware-vdiskmanager.exe -r "xxxxxxxx.vhdx" -t 0 "xxxxxxxx.vmdk"` 转换为 `.vmdk`），这样进入虚拟机安装 macOS 时就会在线下载对应系统安装文件。

</details>

<details>

<summary>macOS (ARM64)</summary>

对于 ARM64 架构 (Apple Silicon) 的 macOS，直接用 brew 安装依赖应当就足够了，目前未经测试，故暂不在此给出详细的安装命令。

</details>

## 工作流简介 (Powershell 脚本)

所有打包过程已整合成 PS1 脚本，存放在根目录。直接按顺序运行即可：

### 1. `复制datawin.ps1` (下载游戏)
自动识别操作系统（Windows/macOS/Linux），并前往对应的 Steam 安装目录抓取所需文件。

> [!IMPORTANT]
> **运行此脚本前，请在系统浏览器输入 `steam://open/console` 或通过终端命令 `steam -console` 打开 Steam 控制台，并逐行输入以下命令，下载指定版本的游戏：**
> - `download_depot 1671210 1671212`
> - `download_depot 1671210 1671213`
> - `download_depot 1690940 1690941`
> - `download_depot 1690940 1690942`

### 2. `下载文本.ps1` (拉取远端翻译，可选)
通过 API 全自动下载第 1~5 章最新的中英文 `en.json` 与 `cn.json`。

> [!TIP]
> 在运行该脚本前，请确保您拥有“好人汉化组” Weblate 翻译站的访问权限。在仓库根目录新建 `secrets.ps1`：
> ```powershell
> $env:TOKEN = "你的 API Token"
> $env:URL = "翻译站网址"
> ```

### 3. `3.1-生成图集.ps1` 和 `3.2-生成字库.ps1` (打包纹理贴图与字体图集)

通过 `node atlas_packer/run.js` 根据 `template.mst` 模板，将散装的本地化贴图合成为游戏引擎使用的完整大图。<br>
同时通过 `node atlas_packer/generate_font.js` 根据 `fonts.cfg` 配置和 `font.mst` 模板，调用 `freetype2` 直接渲染 TTF 字体，生成各字体的字符图集到 `workspace/global/font/atlas/`。

### 4. `打包资源.ps1` (构建二进制 Data)

调用 .NET 10 工具链编译打包器，并运行 `src` 目录下的 `deltarunePacker` 的资源导入工具，将汉化贴图、文本等导入到各章 data.win 中。

### 5. `生成汉化补丁.ps1` (生成分发封包)

调用 `xdelta3` 生成各平台的补丁差分文件，并调用 `7z` 打包补丁，构建出汉化补丁成品。

### 跨平台构建说明

已在下列平台上测试完整运行打包脚本，详见 [PR #13](https://github.com/gm3dr/DeltaruneChinese/pull/13)。  
目前不保证非 Windows x64 平台做出的 patch 可以正常使用，这部分也许需要玩家自行测试。

- 物理机：
    - Windows 11 x64
    - Fedora 44, Arch Linux
- 虚拟机：
    - Debian 13, Ubuntu 26.04 LTS, FreeBSD 15.1-RELEASE-p2, SteamOS 3.8
    - macOS 15.2 x86_64

## 仓库结构

```text
├── atlas_packer          # 图集与字体生成工具
│   ├── package.json      # Node.js 依赖包
│   ├── run.js            # 纹理贴图打包主脚本
│   ├── generate_font.js  # 字体图集生成脚本（基于 freetype2 直接渲染）
│   ├── pack_task.js      # 打包工作线程
│   ├── template.mst      # 纹理贴图 cfg 模板
│   └── font.mst          # 字体图集 cfg 模板
├── cn_installer          # 汉化安装器、打包依赖、自解压模块
├── prproj                # Adobe Premiere Pro 2025 工程项目
├── src                   # 汉化打包核心工具源码
│   ├── *.cs              # C# 源码
│   └── lib               # 底层基础库（UndertaleModLib.dll, Underanalyzer.dll）
├── tool                  # 额外的辅助工具（7z.exe、xdelta3.exe）
└── workspace             # 汉化工作区
    ├── ch*               # 各章节汉化资源（贴图、文本、代码等）
    ├── demo              # Demo 版汉化资源
    ├── global            # 跨章节共享资源
    │   └── font          # 字体
    │   └── *.json        # 人名翻译替换表
    ├── main              # 章节选择器汉化资源（主要是代码）
    └── result            # 输出

```

> [!NOTE]
> `.gitignore` 过滤了所有的临时目录（`temp`, `obj`, `bin`），底层依赖包（`node_modules`）、游戏本体文件（`data.win`, `game.ios`）、字体生成产物（`workspace/global/font/atlas/`）、密钥文件（`secrets.*`）。在提交 PR 时请勿夹带此类文件。

### 每个章节对应 imports 内结构（workspace/ch\*/imports）
- `atlas` 使用的纹理页图集，包含所有新纹理，使用 `node atlas_packer/run` 生成
- `code` [修改过的 GML 代码](#%E4%BF%AE%E6%94%B9%E8%BF%87%E7%9A%84-gml-%E4%BB%A3%E7%A0%81%E5%AE%9E%E7%8E%B0workspacechimportscode)
- `pics` 贴图，用于生成纹理页图集
- `pics_zhname` 人名翻译版贴图，用于生成纹理页图集
- `text_src` 打包使用的语言文件

> [!IMPORTANT]
> 除了第三章 Tenna 的 `funnytext` 艺术字有特殊处理，自动居中外<br>
> 其余贴图都需要保证大小与原本的相同，否则会报错

### 修改过的 GML 代码实现（workspace/ch\*/imports/code）
#### 通用
- 废话：把代码中硬编码没有走游戏多语言系统的文本改动了<br>修改了各种坐标值来微调文字显示位置和动画
- 改动了 `is_english` 使得游戏即使当 `lang` 为 `en` 时也会从语言文件夹中加载 json
- 改动了 `obj_writer` 添加了汉字字符字宽逻辑
- 改动了 `DEVICE_MENU`（读档界面）使得日文下显示的是`简体中文`而不是`English`
- 改动了 `obj_credits` 覆盖掉了原有的日文本地化名单为汉化组名单
- 改动了 `scr_kana_check` 去除了文本中含有日文时切换为日文字体的功能<br>这个功能原本用于保证日文玩家名也能在英文时正常显示
- 改动了 `scr_change_language`、`obj_initializer2`、`scr_84_lang_load`、`scr_84_init_localization`、`DEVICE_MENU` 来实现人名翻译的切换<br>添加了变量 `global.names` 用于存储人名翻译选项的值，往 `true_config.ini` 里添加了 `NAMES` 项用来存储人名翻译选项的设定
- 帮忙修复了 `scr_get_input_name` 遇到未定义绑键时会闪退的问题
#### 第一章
- 改动了 `obj_writer` 把后三章的``` ` ```保留特殊字符文本功能带回了第一章
- 改动了 `obj_writer` 把后三章的`\n`换行逻辑带回了第一章
- 改动了 `obj_town_event` 来实现 Sans 店名的人名翻译切换
- 改动了 `obj_84_lang_helper` 来实现 Toriel 黑板的人名翻译切换
#### 第二章
- 改动了 `obj_fusionmenu` 来让存档点的`伙伴`页面字串不被横向压缩
- `obj_welcometothecity_backinglights`，逐字效果的适配
- 改动了 `obj_town_event` 来实现 Sans 店名的人名翻译切换
- 改动了 `obj_84_lang_helper` 来实现 Toriel 黑板的人名翻译切换
- 改动了 `obj_pipis_egg_bullet`/`obj_pipis_enemy` 来实现 Pipis 的人名翻译切换
#### 第三章
- 改动了 `obj_fusionmenu` 来让存档点的`伙伴`页面字串不被横向压缩
- 改动了 `obj_writer_quiz` 添加了汉字字符字宽逻辑
- 改动了 `scr_rhythmgame_lyrics` 使得歌词除了空格以外的字符强制使用日文方式显示字间隙
- 改动了 `obj_rhythmgame` 使得音游小游戏歌词强制使用日文方式显示字间隙
- 改动了 `obj_ch3_closet` 加长了 Tenna 发癫
- 改动了 `obj_watercooler`/`obj_holywatercooler` 把 Watercooler/Holywatercooler 说话逻辑改为和日文一样随机字符
- 改动了 `obj_rouxls_annyoing_dog_controller` 把 Rouxls 战的 `神烦狗 参战` 从英文的文本改为了和日文一样的贴图形式
- 改动了 `obj_room_green_room` 来实现 Ramb 位置上方的人名翻译切换
- 改动了 `obj_dw_ranking_t_explain` 来实现 T 级房间 Tenna 的人名翻译切换
- 改动了 `scr_rhythmgame_draw` 来实现音游小游戏的人名翻译切换
- 改动了 `obj_ch3_couch_video` 来实现 Tenna 小视频的人名翻译切换
- 改动了 `obj_rouxls_biplane_flag` 来实现 Rouxls 战飞机旗帜弹幕的人名翻译切换
- 改动了 `scr_charbox` 与 `scr_84_init_localization` 来实现战斗内 Rouxls 与 Lancer 按钮的人名翻译切换
#### 第四章
- 改动了 `obj_fusionmenu` 来让存档点的`伙伴`页面字串不被横向压缩
- 改动了 `scr_rhythmgame_lyrics` 使得歌词除了空格以外的字符强制使用日文方式显示字间隙
- 改动了 `obj_rhythmgame` 使得音游小游戏歌词强制使用日文方式显示字间隙
- 清空了 `obj_dw_church_intro_guei_Draw_0` 来去除一个文本中的特殊字符<br>这条文本的中文译文中不含这个特殊字符
- 改动了 `obj_takingtoolong` 来让 TAKING TOO LONG 不会 TAKING TOO LONG
- 把 `obj_micmenu` 回退到了 Patch 1.02 之前的版本<br>Patch 1.02 为了允许麦克风有更多字符能显示，强制这里使用日文字体，所以回退到旧版
- 改动了 `obj_room_town_mid` 来实现 Sans 店名的人名翻译切换
- 改动了 `obj_84_lang_helper` 来实现 Toriel 黑板的人名翻译切换
- 改动了 `scr_rhythmgame_draw` 来实现音游小游戏的人名翻译切换
#### 第五章
- 改动了 `obj_fusionmenu` 来让存档点的`伙伴`页面字串不被横向压缩
- 改动了 `scr_rhythmgame_draw` 来实现音游小游戏的人名翻译切换
- 改动了 `scr_rhythmgame_lyrics` 使得歌词除了空格以外的字符强制使用日文方式显示字间隙
- 改动了 `obj_rhythmgame` 使得音游小游戏歌词强制使用日文方式显示字间隙
- 改动了 `obj_flowery_lyrics` 使得 Flowery 战歌词强制使用日文方式显示字间隙
- 改动了 `obj_ch5_DWCR01` 来修复泡泡对话不会正常结束消失的问题
- 改动了 `obj_ch5_LW20W_end` 来修正 Weird Route 结尾的显示效果
- 改动了 `obj_date_controller` 来修复 Pink 战约会阶段的何意味强制换行问题<br>以及帮忙修复了 Pink 战某些文本描边显示异常的问题
- 改动了 `obj_battlecontroller` 来修正 Netskie 战的查看文本显示
- 改动了 `obj_green_enemy` 来实现 Green 战斗中 Green 牌子的人名翻译切换
- 改动了 `obj_yellow_enemy` 来实现 Yellow 战斗中 Green 牌子的人名翻译切换
- 帮忙修复了 `obj_terracota_enemy` 的错误结束回合问题
- 改动了 `obj_yellow_trial_manager` 来修正审判介面手柄按钮偏移的问题
- 改动了 `obj_town_mid_conbini`、`obj_room_town_mid` 与 `obj_ch5_LWF02_bg` 来实现 Sans 店名的人名翻译切换
- 改动了 `obj_dw_cliff_climbrefresher` 来修复自动换行导致的显示异常
- 改动了 `obj_plat_foreground_writer` 来修复横版跳跃状态下互动文本错位的问题
- 改动了 `obj_84_lang_helper` 与 `obj_room_torielclass` 来实现 Toriel 黑板的人名翻译切换
- 改动了 `scr_charbox` 与 `scr_84_init_localization` 来实现战斗内 Flowery 队友的人名翻译切换

### 字体（`workspace/global/font/`）

各章节通过 `fonts.cfg` 配置描述字体参数，使用 `node atlas_packer/generate_font.js` 调用 `freetype2` 直接渲染生成字符图集

- `normal.ttf` SimSun 12x（中易宋体 内嵌点阵 12）<br>（修改过拼音、全角问号叹号、全角逗号句号、双层直角引号）
- `battle.ttf` SimSun 16x（中易宋体 内嵌点阵 16）
- `sans.ttf` 方正少儿（手机端主题提取的两万字大字库版）
- `noelle.ttf` Boutique Bitmap 9x9 R（精品点阵体 9x9 R）
- `8bit.ttf` Boutique Bitmap 9x9 B （精品点阵体 9x9 B）
- `legend.ttf` 基于 DR 日文使用的 Maru Monica 补字，By 晓晓_Akatsuki

#### `fonts.cfg`

为 JSON 格式
- `name` 字体原名
- `path` 中文字体路径
- `char_size` 字号
- `offset_en` 英文字形偏移
- `offset_cn` 中文字形偏移

### Adobe Premiere Pro 2025 工程项目（prproj）
- `tennaIntroF1_compressed_28` [第三章的 Tenna 神人小视频](https://www.bilibili.com/video/BV15mT5zAEJS)
- `1-4宣传片` [B站官号发布的 1-4 章汉化发布宣传片](https://www.bilibili.com/video/BV1BPhWzdEao)<br>
为了控制文件大小，去除了宣传片使用的所有视频素材，请在下方网盘下载后全部放置到文件夹内<br>
https://1813524098.share.123pan.cn/123pan/KPMSVv-ydDjv
- `ch5_intro_en` 第五章的 Flowery 出场动画
- `ch5宣传片` [B站官号发布的 1-5 章汉化发布宣传片](https://www.bilibili.com/video/BV1PEMA6TEqj)<br>
为了控制文件大小，去除了宣传片使用的所有视频素材，请在下方网盘下载后全部放置到文件夹内<br>
https://1813524098.share.123pan.cn/123pan/KPMSVv-phcdd
