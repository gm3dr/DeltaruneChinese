exit;

if (scr_debug())
    draw_text_debug(10, 10, "speedfactor: " + string(speedfactor));

draw_sprite_ext(spr_shootout_ui, 0, 0, 480, 2, 2, 0, c_white, 1);
draw_set_color(#4C4539);
draw_set_font(fnt_mainbig);
draw_set_halign(fa_left);
var _xx = 448;
var _yy = 392;
draw_text(_xx, _yy + 24, /*"SCORE: "*/"分数: " + string_replace_all(string_format(points, 4, 0), " ", "0"));
var _time = 0;

switch (state)
{
    case "main":
        _time = (wave_duration - timer) div 30;
        break;
    
    case "intro":
    case "wave_intro":
        _time = wave_duration div 30;
        break;
    
    case "wave_outro":
        _time = 0;
        break;
}

draw_text(_xx, _yy + 50, /*"TIME LEFT: "*/"剩余时间: " + string_replace_all(string_format(_time, 2, 0), " ", "0") + /*"s"*/"秒");

if (state == "wave_intro")
{
    if ((timer div 5) % 2)
    {
        draw_set_font(fnt_main);
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        draw_set_color(c_white);
        draw_text_transformed_outline(320, 200, stringsetloc("WAVE COMPLETE", "obj_shootout_controller_slash_Draw_64_gml_49_0"), 2, 2);
        draw_set_halign(fa_left);
    }
}
