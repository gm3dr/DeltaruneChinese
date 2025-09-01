# DELTARUNE 中文本地化补丁 By 好人汉化组
**从 [此处](https://github.com/gm3dr/DeltaruneChinese/releases/latest) 下载最新版汉化补丁**<br>
本仓库源码为不定期手动更新，**不代表** 目前最新构建

## 补丁安装方法
> [!NOTE]
> 如果在安装过程中出现任何问题<br>
> 请先尝试在 Steam 右键 DELTARUNE<br>
> 选择 `属性 -> 本地文件 -> 验证游戏文件完整性`<br>
> 待 Steam 验证完毕后再次尝试
### 一键安装器
前往 https://github.com/gm3dr/DeltaruneChinesePatcher/releases/latest 下载安装器<br>
将汉化补丁放到安装器根目录，打开安装器<br>
输入 DELTARUNE 安装目录（或「浏览」，选中 DELTARUNE 安装目录）<br>
点击「安装补丁」即可
> [!TIP]
> 获取安装目录方法：在 Steam 右键 DELTARUNE<br>
> 选择 `管理 -> 浏览本地文件`

> [!IMPORTANT]
> 对于 macOS 平台，补丁需要放到安装器包 `DELTARUNE Chinese Patcher.app/Contents/MacOS` 内<br>
> 以及需要选中的目录是安装目录下 `DELTARUNE.app/Contents/Resources`
### 手动安装
下载汉化补丁，将里面所有的内容全部解压到 DELTARUNE 安装目录下，全部覆盖<br>
使用 [DeltaPatcher](https://github.com/marco-calautti/DeltaPatcher) 按照以下表格输入<br>
输入后点击 `Apply patch`<br>
对以下表格每一行执行相同操作<br>
|Original file|XDelta patch|
|-|-|
|data.win|main.xdelta|
|chapter1_windows/data.win|chapter1.xdelta|
|chapter2_windows/data.win|chapter2.xdelta|
|chapter3_windows/data.win|chapter3.xdelta|
|chapter4_windows/data.win|chapter4.xdelta|

> [!IMPORTANT]
> 对于 macOS 平台，除了需要使用 macOS 版本的补丁外<br>
> 还需要进行以下操作<br>
> 把安装目录替换为安装目录下 `DELTARUNE.app/Contents/Resources` <br>
> 把 `Original file` 一栏的 `_windows` 改为 `_mac` <br>
> 把 `data.win` 改为 `game.ios`

> [!TIP]
> Linux 不需要额外操作，可以与 Windows 共用补丁<br>
> 游戏文件和补丁文件一样，都是完全相同的<br>
> 这是因为 Steam 使用 Proton 兼容层运行 Windows 版 DELTARUNE
# 由此开始是本仓库源码的内容<br>玩家看上面就足够了
## 协议 License
翻译文本（`workspace/ch*/imports/text_src`）与修改后的贴图（`workspace/ch*/imports/pics`/`workspace/ch*/imports/pics_zhname`）使用 **[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh-hans)** 协议许可<br>
在保留好人汉化组署名的前提下，您可以对补丁的文本和贴图进行修改，并在不违反相关法律规范的前提下合理使用，好人汉化组对修改后的内容不负任何责任。

打包脚本源码 `src` 与 `export.csx` 在 **[GPL 通用公共许可证 v3（GPL v3）](https://www.gnu.org/licenses/gpl-3.0.zh-cn.html)** 下开源<br>
杂项脚本 `misc_scripts/*.py` 在 **[MIT 许可证](https://opensource.org/license/MIT)** 下开源
## 基于原版 data 生成成品 data 方法
1. 将四个章节的 data 分别命名为 `data<章节阿拉伯数字>.win` 并全部放置到 workspace 目录下
2. 命令行运行 `bin/deltarunePacker.exe` ，传入 workspace 目录作为参数
3. 在 workspace 目录下的 result 文件夹中获取结果
> [!IMPORTANT]
> 由于使用了 bmfont 来生成位图字体，bmfont 这个程序过于老旧<br>
> 使用脚本时需要保证 workspace 路径无汉字等特殊字符<br>
> 否则将会无法生成位图字体并因为找不到 `.fnt` 而报错
## 本仓库结构
### 主要的构建程序与脚本
- `export.csx` 从游戏文件中导出文本字体与贴图
- `src` 构建程序源代码
  - `Importer.cs` 主逻辑
- `bin` 构建程序二进制
  - `deltarunePacker.exe` 程序本体，需要传入 workspace 目录作为参数
### 每个章节对应 imports 内结构（workspace/ch\*/imports）
- `atlas` 使用的纹理页图集，包含所有新纹理，使用 `FreeTexturePacker.exe` 生成<br>
Format 选择 `custom`，点击右边的笔图标填写 `packer_exporter.txt` 里的内容，<br>
Padding 填 `1`，Packer 选择 `OptimalPacker`，Method 选择 `Automatic`<br>
勾选 `Power of two` `Detect identical` `Remove file ext`，取消勾选 `Allow trim` `Allow rotation`
- `code` [修改过的 GML 代码](#%E4%BF%AE%E6%94%B9%E8%BF%87%E7%9A%84-gml-%E4%BB%A3%E7%A0%81%E5%AE%9E%E7%8E%B0workspacechimportscode)
- `font` 字体
  - `font` [原字体的补字字体](#%E8%A1%A5%E5%AD%97%E7%94%A8%E5%AD%97%E4%BD%93workspacechimportsfontfont)
  - `pics` 原字体的字符单图
  - `bmfc` 补字字体的 bmfont 基础配置
- `pics` 贴图留档，打包时不使用
- `pics_zhname` 人名翻译版贴图留档，打包时不使用
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
6. 改动了 `scr_kana_check` 去除了文本中含有日文时切换为日文字体的功能<br>
这个功能原本用于保证日文玩家名也能在英文时正常显示
1. 改动了 `scr_change_language`、`obj_initializer2`、`scr_84_lang_load`、`scr_84_init_localization`、`DEVICE_MENU` 来实现人名翻译的切换<br>
添加了变量 `global.names` 用于存储人名翻译选项的值，往 `true_config.ini` 里添加了 `NAMES` 项用来存储人名翻译选项的设定
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
https://www.123912.com/s/KPMSVv-ydDjv <br>
（不含所有生成的代理文件，格式全是 mov 大小几十个 G，但是 PR 2025 性能优化也是烂完了没代理剪不动都）
### 杂项脚本（misc_scripts）
- `convert.py` 繁中初始化用的脚本（仅用于初次导入，后续全部需要进行人工校对）
- `collecting_spr.py` 从一个目录中提取另一个目录中有的所有文件
- `compare_sprs.py` 匹配已翻译和全部 spr 的目录来找出未翻译的 spr
- `move_spr.py` 把没有按文件夹分类的 spr 覆盖到分类好的 spr 目录中
- `nameconverter.py` 人名翻译替换脚本
- `zhnames.json` 完整人名翻译替换表
- `zhnames_recruit.json` 仅可招揽人名翻译替换表