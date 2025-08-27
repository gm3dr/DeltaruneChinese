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
played_text_en = /*"This program is intended for players#who are already familiar with UNDERTALE."*/"本程序专为熟悉UNDERTALE的玩家提供。";
played_text_ja_1 = "このプログラムは、";
played_text_ja_2 = "すでに「UNDERTALE」をプレイした方向けです。";
check_text_en = /*"Would you like to check out UNDERTALE first?"*/"你愿意先了解UNDERTALE吗？";
check_text_ja_1 = "まだプレイしたことのない方は、";
check_text_ja_2 = "まずは「UNDERTALE」をチェックしてみませんか？";
shop_options = (global.lang == "en") ? /*["Yes", "No"]*/["是", "否"] : ["はい", "いいえ"];
shop_text = (global.lang == "en") ? "Nintendo eShop" : "ニンテンドーeショップ";

if (os_type == os_ps4 || os_type == os_ps5)
    shop_text = (global.lang == "en") ? "Playstation Store" : "Playstation Store";

check_undertale = (global.lang == "en") ? /*"Check Out UNDERTALE"*/"了解UNDERTALE" : "「UNDERTALE」をチェック";
start_dr = (global.lang == "en") ? /*"Start DELTARUNE"*/"开始DELTARUNE" : "「DELTARUNE」をプレイ";
global.currentroom = scr_get_id_by_room_index(room);

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
