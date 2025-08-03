// 回退到旧版
xx = __view_get(e__VW.XView, 0);
yy = __view_get(e__VW.YView, 0);
scr_84_set_draw_font("mainbig");
draw_set_halign(fa_left);
var yoff = 60;
var mwidth = 580;
var mheight = 344;
var mx = 30;

if (mic_max > 11)
    yoff = 30;

var my = 12 + yoff;
var myy = 40;
var volx = (camerax() + mx + mwidth) - 140;
var volx2 = camerax() + mx + 80;
var voly = cameray() + my + 280;
var volw = 419;
scr_darkbox_black(camerax() + mx, cameray() + my, camerax() + mx + mwidth, cameray() + my + mheight);
mic_reload -= 1;

if (mic_reload < 0)
{
    if (instance_number(obj_mike_controller) > 0)
    {
        with (obj_mike_controller)
            other.microphone_volume += ((microphone_volume - other.microphone_volume) * 0.25);
    }
}

if (act != 0)
{
    if (selected < array_length(mic_name))
    {
        var _n = ds_map_find_value(mic_name[selected], "name");
        _n = string_replace(_n, "Microphone ", "");
        _n = string_replace(_n, "(", "");
        _n = string_replace(_n, ")", "");
        var shortened = false;
        
        while (string_width(_n) > 600)
        {
            _n = string_copy(_n, 1, string_length(_n) - 1);
            shortened = true;
        }
        
        if (shortened)
            _n = _n + "...";
        
        draw_set_colour(c_gray);
        draw_set_font(scr_84_get_font("main"));
        draw_text(camerax() + mx + 48, (cameray() + mheight + my) - 48, stringsetloc("* Current Microphone:  ", "obj_micmenu_slash_Draw_0_gml_53_0") + string(_n));
        draw_set_font(scr_84_get_font("mainbig"));
        draw_set_colour(c_white);
    }
    
    draw_set_colour(merge_colour(c_aqua, c_black, 0.5));
    d_line_width(volx2, voly, volx2 + (volw * 0.1), voly, 4);
    draw_set_colour(merge_colour(c_lime, c_black, 0.5));
    d_line_width(volx2 + (volw * 0.1), voly, volx2 + (volw * 0.6), voly, 4);
    draw_set_colour(merge_colour(c_yellow, c_black, 0.5));
    d_line_width(volx2 + (volw * 0.6), voly, volx2 + (volw * 0.9), voly, 4);
    draw_set_colour(merge_colour(c_red, c_black, 0.5));
    d_line_width(volx2 + (volw * 0.9), voly, volx2 + volw, voly, 4);
    var vol_colour = 16776960;
    
    if (microphone_volume > 10)
        vol_colour = 65280;
    
    if (microphone_volume > 60)
        vol_colour = 65535;
    
    if (microphone_volume > 90)
        vol_colour = 255;
    
    draw_set_colour(vol_colour);
    d_line_width(volx2, voly, volx2 + ((microphone_volume / 100) * volw), voly, 4);
    draw_set_colour(c_white);
}

if (act == -1)
{
    for (i = 0; i <= 2; i++)
    {
        if (i == current)
            draw_sprite(spr_heart_centered, 0, camerax() + mx + 32, cameray() + my + myy + 40 + (i * 30));
        
        var str = string(option[i]);
        draw_text(camerax() + mx + 48, cameray() + my + myy + 24 + (i * 30), str);
    }
}

if (act == 0)
{
    draw_set_colour(c_gray);
    draw_set_halign(fa_right);
    draw_text(volx + 80, cameray() + my + 20, stringsetloc("Volume", "obj_micmenu_slash_Draw_0_gml_92_0"));
    draw_set_halign(fa_left);
    draw_text(camerax() + mx + 48, cameray() + my + 20, stringsetloc("Microphone", "obj_micmenu_slash_Draw_0_gml_94_0"));
    var menu_y = 0;
    
    for (i = 0; i < menu_max; i++)
    {
        var _str = "";
        menu_y = max(min(current - 5, menu_max - 8), 0);
        
        if (i >= menu_y && i < (menu_y + 8))
        {
            if (!global.right_click_mic)
            {
                if (selected == i && array_length(mic_name) > 0)
                {
                    draw_set_colour(#FFFF40);
                    
                    if (global.lang == "ja")
                        _str = " ";
                    else
                        _str = "   ";
                    
                    draw_sprite(spr_sparestar, 0, camerax() + mx + 46, (cameray() + my + myy + 32 + (i * 30)) - (menu_y * 30));
                }
                else
                {
                    draw_set_colour(c_white);
                }
            }
            else if (i == (menu_max - 3) && global.right_click_mic == 1)
            {
                draw_set_colour(#FFFF40);
                
                if (global.lang == "ja")
                    _str = " ";
                else
                    _str = "   ";
                
                draw_sprite(spr_sparestar, 0, camerax() + mx + 46, (cameray() + my + myy + 32 + (i * 30)) - (menu_y * 30));
            }
            else if (i == (menu_max - 2) && global.right_click_mic == 2)
            {
                draw_set_colour(#FFFF40);
                
                if (global.lang == "ja")
                    _str = " ";
                else
                    _str = "   ";
                
                draw_sprite(spr_sparestar, 0, camerax() + mx + 46, (cameray() + my + myy + 32 + (i * 30)) - (menu_y * 30));
            }
            else
            {
                draw_set_color(c_white);
            }
            
            if (i == (menu_max - 1))
            {
                if (i == current)
                    draw_sprite(spr_heart_centered, 0, camerax() + mx + 32, (cameray() + my + myy + 56 + (i * 30)) - (menu_y * 30));
                
                draw_text(camerax() + mx + 48, (cameray() + my + myy + 40 + (i * 30)) - (menu_y * 30), string(_str) + stringsetloc("Done", "obj_micmenu_slash_Draw_0_gml_116_0"));
            }
            else if (i == (menu_max - 3) && is_pc)
            {
                if (i == current)
                    draw_sprite(spr_heart_centered, 0, camerax() + mx + 32, (cameray() + my + myy + 40 + (i * 30)) - (menu_y * 30));
                
                draw_text(camerax() + mx + 48, (cameray() + my + myy + 24 + (i * 30)) - (menu_y * 30), string(_str) + stringsetloc("Mouse Right-Click [Not Recommended]", "obj_micmenu_slash_Draw_0_gml_141_0"));
            }
            else if (i == (menu_max - 2) && is_pc)
            {
                if (i == current)
                    draw_sprite(spr_heart_centered, 0, camerax() + mx + 32, (cameray() + my + myy + 40 + (i * 30)) - (menu_y * 30));
                
                var inputname = scr_get_input_name(5);
                
                if (obj_gamecontroller.gamepad_active)
                {
                    if (global.lang == "ja")
                        inputname = " ";
                    else
                        inputname = "    ";
                    
                    var _sprite = scr_getbuttonsprite(global.input_g[5], false);
                    var xoffset = 0;
                    
                    if (i == (menu_max - 2) && global.right_click_mic == 2)
                        xoffset = 18;
                    
                    draw_sprite_ext(_sprite, 0, camerax() + mx + 46 + xoffset, (cameray() + my + myy + 27 + (i * 30)) - (menu_y * 30), 2, 2, 0, c_white, 1);
                }
                
                draw_text(camerax() + mx + 48, (cameray() + my + myy + 24 + (i * 30)) - (menu_y * 30), string(_str) + stringsetsubloc("~1 [Also Not Recommended]", inputname, "obj_micmenu_slash_Draw_0_gml_172_0"));
            }
            else
            {
                var _n;
                
                if (mic_on[i])
                {
                    _n = ds_map_find_value(mic_name[i], "name");
                    _n = string_replace(_n, "Microphone ", "");
                    _n = string_replace(_n, "(", "");
                    _n = string_replace(_n, ")", "");
                    var shortened = false;
                    
                    while (string_width(_n) > 300)
                    {
                        _n = string_copy(_n, 1, string_length(_n) - 1);
                        shortened = true;
                    }
                    
                    if (shortened)
                        _n = _n + "...";
                }
                else
                {
                    _n = mic_name2[i];
                }
                
                if (i == current)
                    draw_sprite(spr_heart_centered, 0, camerax() + mx + 32, (cameray() + my + myy + 40 + (i * 30)) - (menu_y * 30));
                
                draw_text(camerax() + mx + 48, (cameray() + my + myy + 24 + (i * 30)) - (menu_y * 30), string(_str) + string(_n));
            }
            
            if ((!is_pc && i < (menu_max - 1)) || (is_pc && i < (menu_max - 3)))
            {
                if (i == current)
                {
                    if (mic_reload < 0)
                    {
                        draw_set_colour(merge_colour(c_aqua, c_black, 0.5));
                        d_line_width(volx, (cameray() + my + myy + 40 + (i * 30)) - (menu_y * 30), volx + 8, (cameray() + my + myy + 40 + (i * 30)) - (menu_y * 30), 4);
                        draw_set_colour(merge_colour(c_lime, c_black, 0.5));
                        d_line_width(volx + 8, (cameray() + my + myy + 40 + (i * 30)) - (menu_y * 30), volx + 48, (cameray() + my + myy + 40 + (i * 30)) - (menu_y * 30), 4);
                        draw_set_colour(merge_colour(c_yellow, c_black, 0.5));
                        d_line_width(volx + 48, (cameray() + my + myy + 40 + (i * 30)) - (menu_y * 30), volx + 72, (cameray() + my + myy + 40 + (i * 30)) - (menu_y * 30), 4);
                        draw_set_colour(merge_colour(c_red, c_black, 0.5));
                        d_line_width(volx + 72, (cameray() + my + myy + 40 + (i * 30)) - (menu_y * 30), volx + 80, (cameray() + my + myy + 40 + (i * 30)) - (menu_y * 30), 4);
                        var vol_colour = 16776960;
                        
                        if (microphone_volume > 10)
                            vol_colour = 65280;
                        
                        if (microphone_volume > 60)
                            vol_colour = 65535;
                        
                        if (microphone_volume > 90)
                            vol_colour = 255;
                        
                        draw_set_colour(vol_colour);
                        d_line_width(volx, (cameray() + my + myy + 40 + (i * 30)) - (menu_y * 30), volx + ((microphone_volume / 100) * 80), (cameray() + my + myy + 40 + (i * 30)) - (menu_y * 30), 4);
                    }
                    else
                    {
                        draw_set_colour(c_white);
                        draw_set_font(scr_84_get_font("main"));
                        draw_set_halign(fa_center);
                        draw_set_halign(fa_center);
                        draw_text(volx + 40, (cameray() + my + myy + 32 + (i * 30)) - (menu_y * 30), stringsetloc("Loading...", "obj_micmenu_slash_Draw_0_gml_165_0"));
                        draw_set_font(scr_84_get_font("mainbig"));
                        draw_set_halign(fa_left);
                        draw_set_halign(fa_left);
                    }
                }
                else
                {
                    draw_set_colour(c_dkgray);
                    d_line_width(volx, (cameray() + my + myy + 40 + (i * 30)) - (menu_y * 30), volx + 80, (cameray() + my + myy + 40 + (i * 30)) - (menu_y * 30), 4);
                }
            }
        }
    }
    
    if (menu_max > 8)
    {
        draw_set_color(c_dkgray);
        ossafe_fill_rectangle((camerax() + mx + mwidth) - 29, cameray() + my + 70, (camerax() + mx + mwidth) - 25, cameray() + my + 292, 0);
        draw_set_color(c_white);
        var nn = menu_max - 7;
        var pagey = (menu_y / nn) * 222;
        var pageh = 222 / max(1, menu_max - 7);
        ossafe_fill_rectangle((camerax() + mx + mwidth) - 29, cameray() + my + 70 + pagey, (camerax() + mx + mwidth) - 25, cameray() + my + 70 + pageh + pagey, 0);
        
        if (menu_y > 0)
            draw_sprite_ext(spr_morearrow, 0, (camerax() + mx + mwidth) - 33, (cameray() + my + 64) - (sin(cur_jewel / 12) * 3), 1, -1, 0, c_white, 1);
        
        if (menu_y < (menu_max - 8))
            draw_sprite_ext(spr_morearrow, 0, (camerax() + mx + mwidth) - 33, cameray() + my + 298 + (sin(cur_jewel / 12) * 3), 1, 1, 0, c_white, 1);
    }
}

if (act == 1)
{
    draw_set_halign(fa_center);
    draw_set_colour(c_white);
    draw_text(camerax() + mx + (mwidth / 2), cameray() + my + 30, stringsetloc("Adjust Sensitivity", "obj_micmenu_slash_Draw_0_gml_213_0"));
    var ly = cameray() + my + (mheight / 2) + 32;
    var lw = point_distance(camerax() + mx + 96, 0, (camerax() + mx + mwidth) - 96, 0);
    var lx = camerax() + mx + 96 + (lw * (global.mic_sensitivity / 4));
    draw_set_colour(c_dkgray);
    d_triangle(camerax() + mx + 86, ly, (camerax() + mx + mwidth) - 96, ly, (camerax() + mx + mwidth) - 96, ly - 16, 0);
    var _str = "";
    
    if (current == 0)
    {
        var col = merge_colour(c_white, c_yellow, clamp(sin(current_time / 200) + 0.5, 0, 1));
        draw_set_colour(col);
        draw_sprite_ext(spr_morearrow, 0, camerax() + mx + 88, ly, -1, 1, -90, c_white, 1);
        draw_sprite_ext(spr_morearrow, 0, (camerax() + mwidth + mx) - 88, ly, 1, 1, 90, c_white, 1);
    }
    else
    {
        draw_set_colour(c_white);
    }
    
    ossafe_fill_rectangle(lx - 2, ly - 24, lx + 2, ly + 8, 0);
}

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
