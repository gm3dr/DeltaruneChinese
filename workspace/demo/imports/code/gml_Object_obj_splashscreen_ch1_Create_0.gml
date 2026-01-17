xx = __view_get(e__VW.XView, 0);
yy = __view_get(e__VW.YView, 0);
text_alpha_a = 0;
text_alpha_b = 0;
loaded = false;
heart_pos_y = yy + 288;
heart_pos_y_ja = yy + 328;
heart_pos_x_padding = (global.lang == "ja") ? -20 : -10;
heart_pos_x_default = xx + 200 + heart_pos_x_padding;
heart_pos_x = heart_pos_x_default;
heart_pos_x_h_padding = (global.lang == "ja") ? 140 : 155;
line_height = 50;
line_height_ja = 33;
select_padding = 45;
confirming = false;
visit_shop = false;
selected = false;
buffer = 0;
played_text_en = "此游戏是为已经熟悉《UNDERTALE》的玩家准备的。";
played_text_ja_1 = "このプログラムは、";
played_text_ja_2 = "すでに「UNDERTALE」をプレイした方向けです。";
check_text_en = "是否想先玩一下《UNDERTALE》？";
check_text_ja_1 = "まだプレイしたことのない方は、";
check_text_ja_2 = "まずは「UNDERTALE」をチェックしてみませんか？";
shop_options = (global.lang == "en") ? ["是", "否"] : ["はい", "いいえ"];
shop_text = (global.lang == "en") ? "任天堂eShop" : "ニンテンドーeショップ";
commerce_dialog_open = false;

if (os_type == os_ps4)
{
    shop_text = (global.lang == "en") ? "\"PlayStation Store\"" : "「PlayStation Store」";
    psn_load_modules();
}

check_undertale = (global.lang == "en") ? "游玩《UNDERTALE》" : "「UNDERTALE」をチェック";
start_dr = (global.lang == "en") ? "启动《DELTARUNE》" : "「DELTARUNE」をプレイ";
global.currentroom = room;

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
