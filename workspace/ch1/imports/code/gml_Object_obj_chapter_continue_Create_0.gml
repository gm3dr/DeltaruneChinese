choice_text[0] = (global.lang == "en") ? "Continue to Chapter 2" : "Chapter 2へ進む";
choice_text[1] = (global.lang == "en") ? "Keep Playing Chapter 1" : "このままChapter 1をプレイ";
choice_index = 0;
confirmed_selection = false;
text_alpha = 0;
move_noise = false;
select_noise = false;
base_text_ypos = __view_get(e__VW.YView, 0) + 180;
base_heart_ypos = __view_get(e__VW.YView, 0) + 195;
ypos_offset = 40;
init = 0;
snd_free_all();

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
