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
> 对于 macOS 平台，需要选中的是安装目录下 `DELTARUNE.app/Contents/Resources`
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
翻译文本与修改后的贴图使用 **CC BY-NC-SA 4.0** 协议许可<br>
在保留好人汉化组署名的前提下，您可以对补丁的文本和贴图进行修改，并在不违反相关法律规范的前提下合理使用，好人汉化组对修改后的内容不负任何责任。
## 基于原版 data 生成成品 data 方法
1. 使用 Undertale Mod Tool 打开一个章节的 data
2. 选择 Scripts -> Run other script...
3. 选择仓库中的 import_offline.csx
4. 选择仓库中对应章节的文件夹 ***不是 imports 文件夹***
5. 执行结束后保存 data
6. 两个语言 json 生成在了 imports 文件夹旁边的 result 文件夹中，将其放置到游戏章节目录下的 lang 文件夹中即可
> [!IMPORTANT]  
> 由于使用了 bmfont 来生成位图字体，bmfont 这个程序过于老旧<br>
> 使用脚本时需要保证第4步的目标路径无汉字等特殊字符<br>
> 否则将会无法生成位图字体并因为找不到 `.fnt` 而报错
## 本仓库结构
### 主要的 Undertale Mod Tool 脚本（*.csx）
export.csx 从游戏文件中导出文本字体与贴图<br>
import_offline.csx 基于原版 data 生成成品 data 与语言 json 文件<br>
import.csx 基于原版 data 生成成品 data 与语言 json 文件，自动从 Weblate 获取文本的版本
### 每个章节对应 imports 内结构（ch*/imports）
`atlas` 使用的纹理页图集，包含所有新纹理，使用 `FreeTexturePacker.exe` 生成<br>
`code` [修改过的 GML 代码](#%E4%BF%AE%E6%94%B9%E8%BF%87%E7%9A%84-gml-%E4%BB%A3%E7%A0%81%E5%AE%9E%E7%8E%B0chimportscode)<br>
`font` 字体<br>
`font/font` [原字体的补字字体](#%E8%A1%A5%E5%AD%97%E7%94%A8%E5%AD%97%E4%BD%93chimportsfontfont)<br>
`font/pics` 原字体的字符单图<br>
`font/bmfc` 补字字体的 bmfont 基础配置<br>
`pics` 贴图留档，打包时不使用<br>
`pics_zhname` 人名翻译版贴图留档，打包时不使用<br>
`text_src` 语言文件
> [!IMPORTANT]  
> 除了第三章 Tenna 的 `funnytext` 艺术字有特殊处理，自动居中外<br>
> 其余贴图都需要保证大小与原本的相同，否则会报错
### 修改过的 GML 代码实现（ch*/imports/code）
#### 通用
0. 废话：把代码中硬编码没有走游戏多语言系统的文本改动了<br>修改了各种坐标值来微调文字显示位置和动画
1. 改动了 `is_english` 使得游戏即使当 `lang` 为 `en` 时也会从语言文件夹中加载 json
2. 改动了 `obj_writer` 添加了汉字字符字宽逻辑
3. 改动了 `DEVICE_MENU`（读档界面）使得日文下显示的是`简体中文`而不是`English`
4. 改动了 `obj_credits` 覆盖掉了原有的日文本地化名单为汉化组名单
5. 改动了 `scr_kana_check` 去除了文本中含有日文时切换为日文字体的功能<br>
这个功能原本用于保证日文玩家名也能在英文时正常显示
6. 改动了 `scr_change_language`、`obj_initializer2`、`scr_84_lang_load`、`scr_84_init_localization`、`DEVICE_MENU` 来实现人名翻译的切换
7. 改动了所有使用了含有人名贴图的代码用于加载人名翻译版贴图，对应贴图名为在 `spr_` 后加上 `zhname_`
#### 第一章
1. 改动了 `obj_writer` 把后三章的``` ` ```保留特殊字符文本功能带回了第一章
2. 改动了 `obj_writer` 把后三章的`\n`换行逻辑带回了第一章
#### 第二章
1. 改动了 `obj_fusionmenu` 来让存档点的`伙伴`页面字串不被横向压缩
2. `obj_welcometothecity_backinglights`，逐字效果的适配
#### 第三章
1. 改动了 `obj_fusionmenu` 来让存档点的`伙伴`页面字串不被横向压缩
2. 改动了 `obj_writer_quiz` 添加了汉字字符字宽逻辑
3. 改动了 `scr_rhythmgame_lyrics` 使得音游小游戏强制使用日文方式显示字间隙
4. 改动了 `obj_ch3_closet` 加长了 Tenna 发癫
5. 改动了 `obj_watercooler`/`obj_holywatercooler` 把 Watercooler/Holywatercooler 说话逻辑改为和日文一样随机字符
6. 改动了 `obj_rouxls_annyoing_dog_controller` 把 Rouxls 战的 `神烦狗 参战` 从英文的文本改为了和日文一样的贴图形式
#### 第四章
1. 改动了 `obj_fusionmenu` 来让存档点的`伙伴`页面字串不被横向压缩
2. 清空了 `obj_dw_church_intro_guei_Draw_0` 来去除一个文本中的特殊字符<br>这条文本的中文译文中不含这个特殊字符
3. 改动了 `obj_takingtoolong` 来让 TAKING TOO LONG 不会 TAKING TOO LONG
4. 把 `obj_micmenu` 回退到了 Patch 1.02 之前的版本<br>
Patch 1.02 为了允许麦克风有更多字符能显示，强制这里使用日文字体，所以回退到旧版
### 补字用字体（ch*/imports/font/font）
`battle.ttf`/`normal.ttf` SimSun 12x（中易宋体 内嵌点阵 12）<br>（修改过拼音、全角问号叹号、双层直角引号）<br>
`sans.ttf` 方正少儿（手机端主题提取的两万字大字库版）<br>
`noelle.ttf` Boutique Bitmap 9x9 R（精品点阵体 9x9 R）<br>
`8bit.ttf` Boutique Bitmap 9x9 B （精品点阵体 9x9 B）<br>
`legend.ttf` 基于 DR 日文使用的 Maru Monica 补字，By 晓晓_Akatsuki
### 杂项脚本（misc_scripts）
`convert.py` 繁中初始化用的脚本（仅用于初次导入，后续全部需要进行人工校对）<br>
`collecting_spr.py` 从一个目录中提取另一个目录中有的所有文件<br>
`compare_sprs.py` 匹配已翻译和全部 spr 的目录来找出未翻译的 spr<br>
`move_spr.py` 把没有按文件夹分类的 spr 覆盖到分类好的 spr 目录中<br>
`nameconverter.py` 人名翻译替换脚本<br>
`zhnames.json` 人名翻译替换表