draw_set_color(c_white);
draw_set_alpha(1);

if (i_ex(obj_battlecontroller))
{
    depth = obj_battlecontroller.depth + 1;
    
    if (i_ex(obj_tensionbar))
        obj_tensionbar.depth = depth + 1;
}

if (!i_ex(obj_pink_enemy))
    exit;

draw_set_font(scr_84_get_font("mainbig"));

with (obj_marker)
{
    if (sprite_index == spr_pink_purple_arrow && image_alpha > 0 && direction == 90)
        image_alpha -= 0.04;
    
    if (sprite_index == spr_pink_purple_arrow && image_alpha > 0 && direction != 90)
        image_alpha -= 0.01;
    
    if (sprite_index == spr_pink_purple_arrow && image_alpha <= 0)
        instance_destroy();
}

var xx = camx;
var yy = camy;

if (i_ex(obj_shake))
{
    xx = camx + (obj_shake.shakex * obj_shake.shakesign);
    yy = camy + (obj_shake.shakey * obj_shake.shakesign);
}

if ((con == 0 || con == 7) && i_ex(obj_pink_enemy))
{
    if (!surface_exists(surface1))
        surface1 = surface_create(640, 480);
    
    surface_set_target(surface1);
    draw_clear(c_black);
}

bg_speed += bg_speed_max;
bg_speed_y += bg_speed_y_max;

if (bg_speed > 0)
    bg_speed -= 640;

if (bg_speed_y > -480)
    bg_speed_y -= 480;

if ((invertbgalpha >= 1 && obj_pink_enemy.datecount == 3) || diamondbg_alpha >= 1 || diamondbg_red_alpha >= 1)
{
}
else
{
    scr_draw_sprite_tiled_area(spr_diamond_loop, 0, camx + bg_speed, camy + bg_speed_y, camx + bg_speed, camy + bg_speed_y, camx + view_wport[0], camy + room_height, 2, 2, c_white, 1);
}

if (obj_pink_enemy.datecount == 3)
{
    if (diamondbg_alpha >= 1 || diamondbg_red_alpha >= 1)
    {
    }
    else if (invertbgalpha > 0)
    {
        scr_draw_sprite_tiled_area(spr_diamond_loop_inverted, 0, camx + bg_speed, camy + bg_speed_y, camx + bg_speed, camy + bg_speed_y, camx + view_wport[0], camy + room_height, 2, 2, c_white, invertbgalpha);
    }
    
    if (diamondbg_alpha > 0)
        scr_draw_sprite_tiled_area(spr_diamond_loop_inverted, 1, camx + bg_speed, camy + bg_speed_y, camx + bg_speed, camy + bg_speed_y, camx + view_wport[0], camy + room_height, 2, 2, c_white, diamondbg_alpha);
    
    if (diamondbg_red_alpha > 0)
        scr_draw_sprite_tiled_area(spr_diamond_loop_inverted, 2, camx + bg_speed, camy + bg_speed_y, camx + bg_speed, camy + bg_speed_y, camx + view_wport[0], camy + room_height, 2, 2, c_white, diamondbg_red_alpha);
}
else
{
    if (diamondbg_red_alpha >= 1)
    {
    }
    else if (diamondbg_alpha > 0)
    {
        scr_draw_sprite_tiled_area(spr_diamond_loop, 1, camx + bg_speed, camy + bg_speed_y, camx + bg_speed, camy + bg_speed_y, camx + view_wport[0], camy + room_height, 2, 2, c_white, diamondbg_alpha);
    }
    
    if (diamondbg_red_alpha > 0)
        scr_draw_sprite_tiled_area(spr_diamond_loop, 2, camx + bg_speed, camy + bg_speed_y, camx + bg_speed, camy + bg_speed_y, camx + view_wport[0], camy + room_height, 2, 2, c_white, diamondbg_red_alpha);
}

draw_sprite_ext(spr_datingsim_ui_bg, 0, xx + 106, yy + 24, 2, 2, 0, c_white, 1);

if (obj_pink_enemy.datecount == 3)
{
    wave_siner++;
    distortsiner++;
    var __offsetx = 110;
    var __offsety = -600;
    
    for (i = 0; i < 280; i += thickness)
        draw_sprite_part_ext(spr_datingsim_ui_bg_inverted_2x, 0, 0, i * thickness, 428, thickness + 2, (__offsetx - 10) + 1 + (sin((wave_siner + (i * 8)) / 30) * 3), (i * thickness) + __offsety + 620, 1, 1, c_white, invertbgalpha);
    
    draw_set_alpha(0.4);
    draw_set_color(c_black);
    d_rectangle(xx + 100, yy + 20, xx + 530, yy + 300, false);
    draw_set_color(c_white);
    draw_set_alpha(1);
}

if (con == 1 || con == 2)
{
    talktimer++;
    talktimer2++;
    
    if ((first_text != "" || multi_color_text_con == 1) && talktimer < 30)
    {
        pinkindex += portrait1_talkspeed;
    }
    else if (pinkportrait != 5571 && pinkportrait != 2588 && pinkportrait != 1086)
    {
        pinkindex = 0;
        portrait1_talkspeed = 0.16666666666666666;
    }
    
    if ((second_text != "" || multi_color_text_con == 1) && talktimer2 < 30)
    {
        pinkindex2 += portrait2_talkspeed;
    }
    else
    {
        pinkindex2 = 0;
        portrait2_talkspeed = 0.16666666666666666;
    }
}

date_text_char_number += 2;
date_text2_char_number += 2;

if (first_text != "" && string_length(first_text) < date_text_char_number)
    date_text_char_number = string_length(first_text);

if (second_text != "" && string_length(second_text) < date_text2_char_number)
    date_text2_char_number = string_length(second_text);

if ((first_text != "" && date_text_char_number == string_length(first_text)) || (second_text != "" && date_text2_char_number == string_length(second_text)))
    can_skip_timer++;
else
    can_skip_timer = 0;

var _first_text = string_copy(first_text, 1, date_text_char_number);
var _second_text = string_copy(second_text, 1, date_text2_char_number);
var portrait_offset_x;

if (i_ex(obj_pink_enemy) && obj_pink_enemy.datecount != 1)
{
    tailindex2 += 0.16666666666666666;
    portrait_offset_x = 10;
    var portrait_offset_y = 0;
    
    if (pinkportrait2 == 3985)
        portrait_offset_x += 25;
    
    if (portrait2visibility == true && (pinkportrait2 == 7504 || pinkportrait2 == 4851 || pinkportrait2 == 2077))
        portrait_offset_x += 4;
    
    if (pinkportrait2 == 5407)
        portrait_offset_y -= 20;
    
    if (pinkportrait2 == 2485 || pinkportrait2 == 7274)
    {
        if (portrait2_xscale == 2)
            draw_sprite_ext(spr_pinkghost_tail, tailindex2, xx + pinkportrait2_x, yy + 21 + portrait_offset_y, 2, 2, 0, c_white, pinkportraitalpha2 * 0.7);
        else if (portraitscon == 1)
            draw_sprite_ext(spr_pinkghost_tail, tailindex2, xx + pinkportrait2_x + 40, yy + 21 + portrait_offset_y, -2, 2, 0, c_white, pinkportraitalpha2 * 0.7);
    }
    
    draw_sprite_ext(pinkportrait2, pinkindex2, xx + pinkportrait2_x + portrait_offset_x, yy + pinkportrait2_y + portrait_offset_y, portrait2_xscale, 2, 0, c_white, pinkportraitalpha2 * 0.7);
    
    if (sweatcon2 == 1)
        draw_sprite_ext(spr_pinkspeaker_sweatdrop, sweatindex2, xx + pinkportrait2_x + portrait_offset_x, yy + pinkportrait2_y, portrait2_xscale, 2, 0, c_white, pinkportraitalpha2);
}

if (portrait2flash_timer > 0)
{
    if (ghost_fade_con == 1)
        ghost_fade_siner++;
    
    draw_sprite_ext(spr_pinkspeaker_tail, tailindex, xx + pinkportrait_x, yy + 21, portrait_xscale, 2, 0, c_white, (portrait2flash_timer / 4) + sin(ghost_fade_siner * 0.5 * 0.5));
    draw_sprite_ext(pinkportrait2, pinkindex, xx + pinkportrait_x + portrait_offset_x, yy + pinkportrait_y, portrait_xscale, 2, 0, c_white, (portrait2flash_timer / 4) + sin(ghost_fade_siner * 0.5 * 0.5));
    portrait2flash_timer--;
}

var _float_y;

if (i_ex(obj_pink_enemy))
{
    tailindex += 0.16666666666666666;
    
    if (pinkportrait == 1103)
    {
        _float_y = sin(tailindex * 1) * 2;
        portrait_offset_x = 10;
        var _handx = camx + 300;
        var _handy = camy + 84;
        draw_sprite_ext(spr_possessed_mewmew_greyscale_brighter, tailindex, xx + pinkportrait_x + 110 + portrait_offset_x, yy + pinkportrait_y + _float_y, 2, 2, 0, c_white, 0.95);
        draw_sprite_ext(spr_possessed_mewmew_purple, tailindex, xx + pinkportrait_x + 110 + portrait_offset_x, yy + pinkportrait_y + _float_y, 2, 2, 0, c_white, 0.7 + (sin(tailindex * 1) * 0.3));
        draw_sprite_ext(spr_possessed_mewmew_pink, tailindex, xx + pinkportrait_x + 110 + portrait_offset_x, yy + pinkportrait_y + _float_y, 2, 2, 0, c_white, 0.7 - (sin(tailindex * 1) * 0.3));
    }
    else
    {
        portrait_offset_x = 0;
        var portrait_offset_y = 0;
        
        if (portraitvisibility == true && (pinkportrait == 6742 || pinkportrait == 677 || pinkportrait == 5428 || pinkportrait == 2036))
            portrait_offset_x = 4;
        
        var _scale = 1;
        
        if (pinkportraitalpha2 > 0)
        {
            _scale = -1;
            portrait_offset_x += 224;
        }
        
        if (pinkportrait == 2588 || pinkportrait == 1086)
            pinkindex += 0.16666666666666666;
        
        if (pinkportrait == 5218 || pinkportrait == 7353 || pinkportrait == 6552 || pinkportrait == 200)
            draw_sprite_ext(spr_pinkspeaker_tail, tailindex, xx + pinkportrait_x + portrait_offset_x, yy + 21 + portrait_offset_y, portrait_xscale * _scale, 2, 0, c_white, pinkportraitalpha);
        
        draw_sprite_ext(pinkportrait, pinkindex, xx + pinkportrait_x + portrait_offset_x, yy + pinkportrait_y + portrait_offset_y, portrait_xscale * _scale, 2, 0, c_white, pinkportraitalpha);
        
        if (sweatcon == 1)
            draw_sprite_ext(spr_pinkspeaker_sweatdrop, sweatindex, xx + pinkportrait_x + portrait_offset_x, yy + pinkportrait_y, portrait_xscale * _scale, 2, 0, c_white, 1);
    }
}

if (portraitflash_timer > 0)
{
    draw_sprite_ext(spr_pinkspeaker_tail, tailindex, xx + pinkportrait_x, yy + 21, portrait_xscale, 2, 0, c_white, portraitflash_timer / 4);
    draw_sprite_ext(pinkportrait, pinkindex, xx + pinkportrait_x + portrait_offset_x, yy + pinkportrait_y, portrait_xscale, 2, 0, c_white, portraitflash_timer / 4);
    portraitflash_timer--;
}

draw_set_halign(fa_left);
draw_set_color(c_white);

if (show_intro_outro_surfaces == false)
{
    if (dialoguebox_alpha < 1 && minigame_won == false)
        dialoguebox_alpha += 0.2;
    
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex_color(xx + 106, (yy + 300) - 90, dialogueboxcolor, dialoguebox_alpha * 0.2);
    draw_vertex_color(xx + 106, (yy + 300) - 27, dialogueboxcolor, dialoguebox_alpha * 0.8);
    draw_vertex_color(xx + 106 + 420, (yy + 300) - 90, dialogueboxcolor, dialoguebox_alpha * 0.2);
    draw_vertex_color(xx + 106 + 420, (yy + 300) - 27, dialogueboxcolor, dialoguebox_alpha * 0.8);
    draw_primitive_end();
}

if (con == 4 || con == 5 || con == 6)
{
}
else
{
    var _body_x = camx + 120 + shaketext_x;
    var _body_y = camy + 208;
    var _w = 2;
    var __w = 320;
    
    if (multi_color_text_con == 0)
    {
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        
        if (obj_pink_enemy.datecount == 1 || obj_pink_enemy.datecount == 3 || (obj_pink_enemy.datecount == 2 && draw_box_timer < 530 && rr == 0))
        {
            _body_x = camx + 320 + shaketext_x;
            draw_set_halign(fa_center);
        }
        
        if (obj_pink_enemy.datecount == 2 || obj_pink_enemy.datecount == 3)
        {
            if (first_text == "" || second_text == "")
            {
            }
            else
            {
                __w = 180 + shaketext_x;
            }
        }
        
        draw_set_color(c_white);
        
        if (pinkportraitalpha2 != 0)
            draw_set_color(merge_color(c_black, c_gray, 0.1));
        
        var _sep = 28;
        
        if (global.lang == "ja")
            _sep = 30;
        
        draw_text_ext_transformed(_body_x - _w, _body_y, _first_text, _sep, __w, portraittextscale, 1, 0);
        draw_text_ext_transformed(_body_x - _w, _body_y - _w, _first_text, _sep, __w, portraittextscale, 1, 0);
        draw_text_ext_transformed(_body_x - _w, _body_y + _w, _first_text, _sep, __w, portraittextscale, 1, 0);
        draw_text_ext_transformed(_body_x + _w, _body_y, _first_text, _sep, __w, portraittextscale, 1, 0);
        draw_text_ext_transformed(_body_x + _w, _body_y + _w, _first_text, _sep, __w, portraittextscale, 1, 0);
        draw_text_ext_transformed(_body_x + _w, _body_y - _w, _first_text, _sep, __w, portraittextscale, 1, 0);
        draw_text_ext_transformed(_body_x, _body_y + _w, _first_text, _sep, __w, portraittextscale, 1, 0);
        draw_text_ext_transformed(_body_x, _body_y - _w, _first_text, _sep, __w, portraittextscale, 1, 0);
        draw_set_color(merge_color(c_black, c_gray, 0.1));
        
        if (pinkportraitalpha2 != 0)
            draw_set_color(make_color_rgb(255, 138, 144));
        
        draw_text_ext_transformed(_body_x, _body_y, _first_text, _sep, __w, portraittextscale, 1, 0);
        draw_set_halign(fa_right);
        draw_set_font(scr_84_get_font("mainbig"));
        draw_set_color(merge_color(c_black, c_gray, 0.1));
        var _ghost_x = xx + 510;
        var _ghost_y = yy + 208;
        draw_text_ext_transformed(_ghost_x - _w, _ghost_y, _second_text, _sep, __w, portraittextscale, 1, 0);
        draw_text_ext_transformed(_ghost_x - _w, _ghost_y - _w, _second_text, _sep, __w, portraittextscale, 1, 0);
        draw_text_ext_transformed(_ghost_x - _w, _ghost_y + _w, _second_text, _sep, __w, portraittextscale, 1, 0);
        draw_text_ext_transformed(_ghost_x + _w, _ghost_y, _second_text, _sep, __w, portraittextscale, 1, 0);
        draw_text_ext_transformed(_ghost_x + _w, _ghost_y + _w, _second_text, _sep, __w, portraittextscale, 1, 0);
        draw_text_ext_transformed(_ghost_x + _w, _ghost_y - _w, _second_text, _sep, __w, portraittextscale, 1, 0);
        draw_text_ext_transformed(_ghost_x, _ghost_y + _w, _second_text, _sep, __w, portraittextscale, 1, 0);
        draw_text_ext_transformed(_ghost_x, _ghost_y - _w, _second_text, _sep, __w, portraittextscale, 1, 0);
        draw_set_color(make_color_rgb(199, 185, 215));
        draw_text_ext_transformed(_ghost_x, _ghost_y, _second_text, _sep, __w, portraittextscale, 1, 0);
    }
    
    if (multi_color_text_con == 1)
    {
        _body_x = camx + 160 + shaketext_x;
        write_string = stringsetloc("Then, how about a choice that means both!?", "obj_date_controller_slash_Draw_0_gml_173_0");
        
        if (obj_pink_enemy.datecount == 3)
        {
            write_string = stringset(first_text);
            _body_x = camx + 241 + shaketext_x;
            
            if (date3con == 1 && global.lang != "ja")
                _body_x = camx + 252 + shaketext_x;
            
            if (date3con == 1 && global.lang == "ja")
                _body_x = camx + 221 + shaketext_x;
            
            if (date3con == 2)
                _body_x = camx + 261 + shaketext_x;
        }
        
        var _colorpurple = make_color_rgb(255, 138, 144);
        var _colorpink = make_color_rgb(199, 185, 215);
        var _colormerge1 = merge_color(_colorpurple, _colorpink, 0.5 + (sin(tailindex) * 0.5));
        var _colormerge2 = merge_color(_colorpink, _colorpurple, 0.5 + (sin(tailindex) * 0.5));
        var _shakex = 0;
        var _shakey = 0;
        var draw_chr = "";
        var __l = 0;
        
        for (var ltr = 1; ltr <= string_length(write_string); ltr += 1)
        {
            if (obj_pink_enemy.datecount == 3)
            {
                _shakex = -1 + random(2);
                _shakey = -1 + random(2);
            }
            
            draw_chr = string_char_at(write_string, ltr);
            
            if (draw_chr == "\n")
            {
                //
                var remaining_string_length = string_length(write_string) - ltr;
                var __writestring = string_copy(write_string, ltr, remaining_string_length);
                
                if (date3con == 1)
                    _body_x = (camx + (camwidth / 2)) - (string_width(__writestring) / 2) - 8;
                else if (date3con == 2)
                    _body_x = (camx + (camwidth / 2)) - (string_width(__writestring) / 2) - 0;
                else
                    _body_x = (camx + (camwidth / 2)) - (string_width(__writestring) / 2) - 10;
                
                // _body_y += 30;
                _body_y += 28;
                //
            }
            else if (__l == 0)
            {
                draw_set_color(merge_color(c_black, c_gray, 0.1));
                draw_text((_body_x - _w) + _shakex, _body_y + _shakey, draw_chr);
                draw_text((_body_x - _w) + _shakex, (_body_y - _w) + _shakey, draw_chr);
                draw_text((_body_x - _w) + _shakex, _body_y + _w + _shakey, draw_chr);
                draw_text(_body_x + _w + _shakex, _body_y + _shakey, draw_chr);
                draw_text(_body_x + _w + _shakex, _body_y + _w + _shakey, draw_chr);
                draw_text(_body_x + _w + _shakex, (_body_y - _w) + _shakey, draw_chr);
                draw_text(_body_x + _shakex, _body_y + _w + _shakey, draw_chr);
                draw_text(_body_x + _shakex, (_body_y - _w) + _shakey, draw_chr);
                draw_set_color(_colorpurple);
                
                if (obj_pink_enemy.datecount == 3)
                    draw_set_color(_colormerge1);
                
                draw_text(_body_x + _shakex, _body_y + _shakey, draw_chr);
                __l = 1;
            }
            else
            {
                draw_set_color(merge_color(c_black, c_gray, 0.1));
                draw_text((_body_x - _w) + _shakex, _body_y + _shakey, draw_chr);
                draw_text((_body_x - _w) + _shakex, (_body_y - _w) + _shakey, draw_chr);
                draw_text((_body_x - _w) + _shakex, _body_y + _w + _shakey, draw_chr);
                draw_text(_body_x + _w + _shakex, _body_y + _shakey, draw_chr);
                draw_text(_body_x + _w + _shakex, _body_y + _w + _shakey, draw_chr);
                draw_text(_body_x + _w + _shakex, (_body_y - _w) + _shakey, draw_chr);
                // draw_text((_body_x - _w) + _shakex, _body_y + _w + _shakey, draw_chr);
                // draw_text((_body_x - _w) + _shakex, (_body_y - _w) + _shakey, draw_chr);
                draw_text(_body_x + _shakex, _body_y + _w + _shakey, draw_chr);
                draw_text(_body_x + _shakex, (_body_y - _w) + _shakey, draw_chr);
                draw_set_color(_colorpink);
                
                if (obj_pink_enemy.datecount == 3)
                    draw_set_color(_colormerge2);
                
                draw_text(_body_x + _shakex, _body_y + _shakey, draw_chr);
                __l = 0;
            }
            
            _body_x += (string_width(draw_chr) + 1);
            
            if (draw_chr == "\n" && global.lang == "ja")
            {
                var remaining_string_length = string_length(write_string) - ltr;
                var __writestring = string_copy(write_string, ltr, remaining_string_length);
                
                if (date3con == 1)
                    _body_x = (camx + (camwidth / 2)) - (string_width(__writestring) / 2) - 8;
                else if (date3con == 2)
                    _body_x = (camx + (camwidth / 2)) - (string_width(__writestring) / 2) - 0;
                else
                    _body_x = (camx + (camwidth / 2)) - (string_width(__writestring) / 2) - 10;
                
                _body_y += 30;
            }
            
            if (ltr == 24 && date3con == 0 && global.lang != "ja")
            {
                _body_x = camx + 200;
                _body_y += 24;
            }
            
            if (ltr == 12 && date3con == 1 && global.lang != "ja")
            {
                _body_x = camx + 220;
                _body_y += 24;
            }
            
            if (ltr == 12 && date3con == 2 && global.lang != "ja")
            {
                _body_x = camx + 230;
                _body_y += 24;
            }
        }
        
        draw_set_color(c_white);
    }
}

draw_set_halign(fa_left);
draw_set_color(c_white);
draw_sprite_ext(spr_datingsim_ui_nodiamonds, 0, xx, yy, 2, 2, 0, c_white, 1);
var __a = 2;

if (obj_pink_enemy.datecount == 3 || obj_pink_enemy.datecount == 4)
    __a = 4;

draw_sprite_ext(spr_datingsim_ui_nodiamonds, __a, camx, yy, 2, 2, 0, c_white, ui_alpha);

if (obj_pink_enemy.datecount == 3)
{
    draw_sprite_ext(spr_datingsim_ui_nodiamonds_inverted, 0, xx, yy, 2, 2, 0, c_white, invertbgalpha);
    draw_sprite_ext(spr_datingsim_ui_nodiamonds_inverted, 2, camx, yy, 2, 2, 0, c_white, invertbgalpha);
}

if (hero_state == "idle")
{
    draw_sprite_ext(spr_ralsei_down, 0, xx + 40, yy + 48, 2, 2, 0, c_white, ui_alpha);
    draw_sprite_ext(spr_susied_dark, 0, xx + 8, yy + 46, 2, 2, 0, c_white, ui_alpha);
    draw_sprite_ext(spr_krisd_dark, 0, xx + 26, yy + 76, 2, 2, 0, c_white, ui_alpha);
}

if (hero_state == "fail")
{
    hero_state_timer++;
    
    if (hero_state_timer == 1)
        xx += 4;
    
    if (hero_state_timer == 2)
        xx -= 3;
    
    if (hero_state_timer == 3)
        xx += 2;
    
    if (hero_state_timer == 4)
        xx -= 1;
    
    draw_sprite_ext(spr_ralsei_hurt_pink_date, 0, xx + 40, yy + 48, 2, 2, 0, c_white, ui_alpha);
    draw_sprite_ext(spr_susieb_hurt_dateui, 0, xx + 8, yy + 46, 2, 2, 0, c_white, ui_alpha);
    draw_sprite_ext(spr_krisb_hurt_dateui, 0, xx + 24, yy + 76, 2, 2, 0, c_white, ui_alpha);
    
    if (hero_state_timer == 20)
    {
        hero_state = "idle";
        hero_state_timer = 0;
    }
}

if (hero_state == "choose")
{
    draw_sprite_ext(spr_ralsei_point_forward, 0, xx + 36, yy + 48, 2, 2, 0, c_white, ui_alpha);
    draw_sprite_ext(spr_susie_point_forward, 0, xx + 8, yy + 46, 2, 2, 0, c_white, ui_alpha);
    draw_sprite_ext(spr_kris_point_forward, 1, xx + 24, yy + 76, 2, 2, 0, c_white, ui_alpha);
    
    if (hero_state_timer == 20)
    {
        hero_state = "idle";
        hero_state_timer = 0;
    }
}

if (hero_state == "success")
{
    draw_sprite_ext(spr_ralsei_point_forward, 0, xx + 40, yy + 48, 2, 2, 0, c_white, ui_alpha);
    draw_sprite_ext(spr_susie_point_forward, 0, xx + 8, yy + 46, 2, 2, 0, c_white, ui_alpha);
    draw_sprite_ext(spr_kris_point_forward, 1, xx + 24, yy + 76, 2, 2, 0, c_white, ui_alpha);
    
    if (hero_state_timer == 20)
    {
        hero_state = "idle";
        hero_state_timer = 0;
    }
}

if (con == 2 && draw_box_con != 2)
{
    arrow_siner++;
    
    if (i_ex(obj_pink_enemy) && obj_pink_enemy.datecount == 2 && questioncount == 3)
    {
    }
    else if ((arrow_siner % 15) == 0)
    {
        inst = instance_create(319, 375, obj_marker);
        inst.sprite_index = spr_pink_purple_arrow;
        inst.image_angle = 90;
        inst.speed = 1.3;
        inst.direction = 90;
        inst.image_blend = c_purple;
        
        if ((questioncount == 0 && obj_pink_enemy.datecount == 1) || obj_pink_enemy.datecount == 4)
        {
        }
        else
        {
            inst = instance_create(309, 385, obj_marker);
            inst.sprite_index = spr_pink_purple_arrow;
            inst.image_angle = 180;
            inst.speed = 2;
            inst.direction = 180;
            inst.image_blend = c_purple;
            inst = instance_create(329, 385, obj_marker);
            inst.sprite_index = spr_pink_purple_arrow;
            inst.image_angle = 0;
            inst.speed = 2;
            inst.direction = 0;
            inst.image_blend = c_purple;
        }
    }
}

var __b = 3;

if (obj_pink_enemy.datecount == 3 || obj_pink_enemy.datecount == 4)
    __b = 5;

draw_sprite_ext(spr_datingsim_ui_nodiamonds, 1, xx, yy, 2, 2, 0, c_white, 1);
draw_sprite_ext(spr_datingsim_ui_nodiamonds, __b, xx, yy, 2, 2, 0, c_white, ui_alpha);

if (obj_pink_enemy.datecount == 3)
{
    draw_sprite_ext(spr_datingsim_ui_nodiamonds_inverted, 1, xx, yy, 2, 2, 0, c_white, invertbgalpha);
    draw_sprite_ext(spr_datingsim_ui_nodiamonds_inverted, 3, xx, yy, 2, 2, 0, c_white, invertbgalpha);
}

draw_set_alpha(date4darknessalpha);
d_rectangle_color(camx, camy, camx + camwidth, camy + camheight, 0, 0, 0, 0, false);
draw_set_alpha(1);

if (obj_pink_enemy.datecount == 3 || obj_pink_enemy.datecount == 4)
{
}
else
{
    draw_sprite_ext(spr_datingsim_time_bar, 0, camx + 186, camy + 416, lerp(0, 300, datetimeleft / datetimeleftmax), 2, 0, c_white, ui_alpha);
}

if (questioncount == 0)
{
    draw_sprite_ext(spr_datingsim_ui_heart, 8, xx + 14 + 0, yy + 170 + 0, 1, 1, 0, c_white, ui_alpha);
    draw_sprite_ext(spr_datingsim_ui_heart, 8, xx + 14 + 22, yy + 170 + 0, 1, 1, 0, c_white, ui_alpha);
    draw_sprite_ext(spr_datingsim_ui_heart, 8, xx + 14 + 44, yy + 170 + 0, 1, 1, 0, c_white, ui_alpha);
}

if (questioncount == 1)
{
    draw_sprite_ext(spr_datingsim_ui_heart, 0, xx + 14 + 0, yy + 170 + 0, 1, 1, 0, c_white, ui_alpha);
    draw_sprite_ext(spr_datingsim_ui_heart, 8, xx + 14 + 22, yy + 170 + 0, 1, 1, 0, c_white, ui_alpha);
    draw_sprite_ext(spr_datingsim_ui_heart, 8, xx + 14 + 44, yy + 170 + 0, 1, 1, 0, c_white, ui_alpha);
}

if (questioncount == 2)
{
    draw_sprite_ext(spr_datingsim_ui_heart, 0, xx + 14 + 0, yy + 170 + 0, 1, 1, 0, c_white, ui_alpha);
    draw_sprite_ext(spr_datingsim_ui_heart, 0, xx + 14 + 22, yy + 170 + 0, 1, 1, 0, c_white, ui_alpha);
    draw_sprite_ext(spr_datingsim_ui_heart, 8, xx + 14 + 44, yy + 170 + 0, 1, 1, 0, c_white, ui_alpha);
}

if (questioncount == 3)
{
    draw_sprite_ext(spr_datingsim_ui_heart, 0, xx + 14 + 0, yy + 170 + 0, 1, 1, 0, c_white, ui_alpha);
    draw_sprite_ext(spr_datingsim_ui_heart, 0, xx + 14 + 22, yy + 170 + 0, 1, 1, 0, c_white, ui_alpha);
    draw_sprite_ext(spr_datingsim_ui_heart, 0, xx + 14 + 44, yy + 170 + 0, 1, 1, 0, c_white, ui_alpha);
}

if (questioncount == 4)
{
    draw_sprite_ext(spr_datingsim_ui_heart, 0, xx + 14 + 0, yy + 170 + 0, 1, 1, 0, c_white, ui_alpha);
    draw_sprite_ext(spr_datingsim_ui_heart, 0, xx + 14 + 22, yy + 170 + 0, 1, 1, 0, c_white, ui_alpha);
    draw_sprite_ext(spr_datingsim_ui_heart, 0, xx + 14 + 44, yy + 170 + 0, 1, 1, 0, c_white, ui_alpha);
}

scr_84_set_draw_font("main");
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if ((con == 4 || con == 5 || con == 6) && timer >= 10)
{
    if (con == 4 || con == 5)
    {
        idiot1.x = xx + idiottext_x;
        idiot1.y = yy + idiottext_y;
        
        with (idiot1)
            visible = true;
    }
    
    if ((con == 4 || con == 6) && obj_pink_enemy.datecount > 1)
    {
        idiot2.x = xx + idiottext2_x;
        idiot2.y = yy + idiottext2_y;
        
        with (idiot2)
            visible = true;
    }
}
else
{
    with (obj_idiot_text)
        visible = false;
}

var _almost_black = darkestpurple;
var _text_outline = true;
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (con == 0 || con == 7)
    surface_reset_target();

if (con >= 2 && con != 7 && con != 8 && show_intro_outro_surfaces == false && minigame_won == false)
{
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    scr_84_set_draw_font("main");
    
    if (global.lang == "ja")
        scr_84_set_draw_font("mainbig");
    
    var _distance_between_boxes = 200;
    var _box_x = xx + 233 + drawn_box_x_offset;
    var _box_y = yy + 285 + 6;
    var _draw_box_selected = 0;
    var _newblackcolor = merge_color(c_black, c_gray, 0.75);
    var left_edge_x = camx + 70;
    var right_edge_x = camx + 570;
    var _radius = 240;
    var _ogradius = 970;
    var _offscreen_offset = 165;
    var _centeroffset = 312;
    var ___x = 85;
    var ___y = (drawn_box_y[2] + 100) - 6;
    var __o = 0;
    __a = 160;
    var _text_xscale = 3;
    var _text_yscale = 3;
    var _text_y_offset = 28;
    drawn_box_y[0] = _box_y;
    drawn_box_y[1] = _box_y;
    drawn_box_y[2] = _box_y;
    drawn_box_y[3] = _box_y;
    drawn_box_y[4] = _box_y;
    drawn_box_y[5] = _box_y;
    drawn_box_y[6] = _box_y;
    var _box_alpha = 0;
    
    if (i_ex(obj_date_heart))
        _box_alpha = obj_date_heart.image_alpha;
    
    draw_set_alpha(_box_alpha);
    
    if (global.lang == "ja")
    {
    }
    else if (obj_pink_enemy.datecount == 2 || obj_pink_enemy.datecount == 4)
    {
        choicetextxscale[0] = 3;
        choicetextxscale[1] = 3;
        choicetextxscale[2] = 3;
        
        if (string_width(choicetext[0]) > 30)
            choicetextxscale[0] = lerp(3, 0, real(string_width(choicetext[0])) / 200);
        
        if (string_width(choicetext[1]) > 30)
            choicetextxscale[1] = lerp(3, 0, real(string_width(choicetext[1])) / 200);
        
        if (string_width(choicetext[2]) > 30)
            choicetextxscale[2] = lerp(3, 0, real(string_width(choicetext[2])) / 200);
        
        var __rr = 0;
        
        repeat (10)
        {
            if (choicetextxscale[__rr] > 3)
                choicetextxscale[__rr] = 3;
            
            __rr++;
        }
    }
    
    var _w = 2;
    var _scale_adjust = 1;
    var _xscale5, _yscale5, _text5, _xscale6, _yscale6, _text6, _xscale1, _yscale1, _text1, _xscale3, _yscale3, _text3, _xscale4, _yscale4, _text4, _xscale0, _yscale0, _text0, _xscale2, _yscale2, _text2;
    
    repeat (7)
    {
        _draw_box_selected = draw_box_selected - 3;
        
        if (_draw_box_selected == -1)
            _draw_box_selected = boxcount - 1;
        
        if (_draw_box_selected == -2)
            _draw_box_selected = boxcount - 2;
        
        if (_draw_box_selected == -3)
            _draw_box_selected = boxcount - 3;
        
        _text5 = drawn_box_text[_draw_box_selected];
        _xscale5 = choicetextxscale[_draw_box_selected];
        _yscale5 = choicetextyscale[_draw_box_selected];
        _draw_box_selected = draw_box_selected - 2;
        
        if (_draw_box_selected == -1)
            _draw_box_selected = boxcount - 1;
        
        if (_draw_box_selected == -2)
            _draw_box_selected = boxcount - 2;
        
        _text3 = drawn_box_text[_draw_box_selected];
        _xscale3 = choicetextxscale[_draw_box_selected];
        _yscale3 = choicetextyscale[_draw_box_selected];
        _draw_box_selected = draw_box_selected - 1;
        
        if (_draw_box_selected == -1)
            _draw_box_selected = boxcount - 1;
        
        _text4 = drawn_box_text[_draw_box_selected];
        _xscale4 = choicetextxscale[_draw_box_selected];
        _yscale4 = choicetextyscale[_draw_box_selected];
        _draw_box_selected = draw_box_selected;
        _text0 = drawn_box_text[_draw_box_selected];
        _xscale0 = choicetextxscale[_draw_box_selected];
        _yscale0 = choicetextyscale[_draw_box_selected];
        _draw_box_selected = draw_box_selected + 1;
        
        if (_draw_box_selected == boxcount)
            _draw_box_selected = 0;
        
        _text1 = drawn_box_text[_draw_box_selected];
        _xscale1 = choicetextxscale[_draw_box_selected];
        _yscale1 = choicetextyscale[_draw_box_selected];
        _draw_box_selected = draw_box_selected + 2;
        
        if (_draw_box_selected == boxcount)
            _draw_box_selected = 0;
        
        if (_draw_box_selected == (boxcount + 1))
            _draw_box_selected = 1;
        
        _text2 = drawn_box_text[_draw_box_selected];
        _xscale2 = choicetextxscale[_draw_box_selected];
        _yscale2 = choicetextyscale[_draw_box_selected];
        _draw_box_selected = draw_box_selected + 3;
        
        if (_draw_box_selected == boxcount)
            _draw_box_selected = 0;
        
        if (_draw_box_selected == (boxcount + 1))
            _draw_box_selected = 1;
        
        if (_draw_box_selected == (boxcount + 2))
            _draw_box_selected = 2;
        
        _text6 = drawn_box_text[_draw_box_selected];
        _xscale6 = choicetextxscale[_draw_box_selected];
        _yscale6 = choicetextyscale[_draw_box_selected];
    }
    
    var _drawn_box_x5, _drawn_box_x5_right, _drawn_box_x6, _drawn_box_x6_right, _drawn_box_x3, _drawn_box_x3_right, _drawn_box_x4, _drawn_box_x4_right, _drawn_box_x1, _drawn_box_x1_right;
    
    if ((questioncount == 0 && obj_pink_enemy.datecount == 1) || con != 2)
    {
    }
    else
    {
        drawn_box_x[5] = _box_x - (_distance_between_boxes * 3);
        var _angle5 = lerp(0, 180, (drawn_box_x[5] + _offscreen_offset + __o) / _ogradius);
        _drawn_box_x5 = lengthdir_x(_radius, _angle5) + _centeroffset;
        var _angle5_right = lerp(0, 180, ((drawn_box_x[5] + _offscreen_offset + __a) - __o) / _ogradius);
        _drawn_box_x5_right = lengthdir_x(_radius, _angle5_right) + _centeroffset;
        var _textxscale5 = lerp(0, _xscale5 * _scale_adjust, abs(_drawn_box_x5 - _drawn_box_x5_right) / 170);
        var _textyscale5 = _yscale5;
        
        if (drawn_box_x[5] > -366)
        {
            d_rectangle_color(_drawn_box_x5, drawn_box_y[5], _drawn_box_x5_right, drawn_box_y[5] + 60, 16777215, 16777215, 16777215, 16777215, false);
            d_rectangle_color(_drawn_box_x5 - _w, drawn_box_y[5] + _w, _drawn_box_x5_right + _w, (drawn_box_y[5] + 60) - _w, 0, 0, 0, 0, false);
            
            if (minigame_won == false)
            {
                if (_text_outline == true)
                    draw_text_transformed_outline((_drawn_box_x5 + _drawn_box_x5_right) / 2, drawn_box_y[0] + _text_y_offset, _text5, _textxscale5, _textyscale5, _almost_black);
                else
                    draw_text_transformed_color((_drawn_box_x5 + _drawn_box_x5_right) / 2, drawn_box_y[0] + _text_y_offset, _text5, _textxscale5, _textyscale5, 0, c_white, c_white, c_white, c_white, true);
            }
        }
        
        drawn_box_x[6] = _box_x + (_distance_between_boxes * 3);
        var _angle6 = lerp(0, 180, (drawn_box_x[6] + _offscreen_offset + __o) / _ogradius);
        _drawn_box_x6 = lengthdir_x(_radius, _angle6) + _centeroffset;
        var _angle6_right = lerp(0, 180, (drawn_box_x[6] + _offscreen_offset + __a + __o) / _ogradius);
        _drawn_box_x6_right = lengthdir_x(_radius, _angle6_right) + _centeroffset;
        var _textxscale6 = lerp(0, _xscale6 * _scale_adjust, abs(_drawn_box_x6 - _drawn_box_x6_right) / 170);
        var _textyscale6 = _yscale6;
        
        if (drawn_box_x[6] < 832)
        {
            d_rectangle_color(_drawn_box_x6, drawn_box_y[6], _drawn_box_x6_right, drawn_box_y[6] + 60, 16777215, 16777215, 16777215, 16777215, false);
            d_rectangle_color(_drawn_box_x6 - _w, drawn_box_y[6] + _w, _drawn_box_x6_right + _w, (drawn_box_y[2] + 60) - _w, 0, 0, 0, 0, false);
            
            if (minigame_won == false)
            {
                if (_text_outline == true)
                    draw_text_transformed_outline((_drawn_box_x6 + _drawn_box_x6_right) / 2, drawn_box_y[0] + _text_y_offset, _text6, _textxscale6, _textyscale6, _almost_black);
                else
                    draw_text_transformed_color((_drawn_box_x6 + _drawn_box_x6_right) / 2, drawn_box_y[0] + _text_y_offset, _text6, _textxscale6, _textyscale6, 0, c_white, c_white, c_white, c_white, true);
            }
        }
        
        drawn_box_x[1] = _box_x + _distance_between_boxes;
        var _angle1 = lerp(0, 180, (drawn_box_x[1] + _offscreen_offset + __o) / _ogradius);
        _drawn_box_x1 = lengthdir_x(_radius, _angle1) + _centeroffset;
        var _angle1_right = lerp(0, 180, (drawn_box_x[1] + _offscreen_offset + __a + __o) / _ogradius);
        _drawn_box_x1_right = lengthdir_x(_radius, _angle1_right) + _centeroffset;
        var _textxscale1 = lerp(0, _xscale1 * _scale_adjust, abs(_drawn_box_x1 - _drawn_box_x1_right) / 170);
        var _textyscale1 = _yscale1;
        d_rectangle_color(_drawn_box_x1, drawn_box_y[1], _drawn_box_x1_right, drawn_box_y[1] + 60, 16777215, 16777215, 16777215, 16777215, false);
        d_rectangle_color(_drawn_box_x1 - _w, drawn_box_y[1] + _w, _drawn_box_x1_right + _w, (drawn_box_y[1] + 60) - _w, 0, 0, 0, 0, false);
        
        if (minigame_won == false)
        {
            if (_text_outline == true)
                draw_text_transformed_outline((_drawn_box_x1 + _drawn_box_x1_right) / 2, drawn_box_y[0] + _text_y_offset, _text1, _textxscale1, _textyscale1, _almost_black);
            else
                draw_text_transformed_color((_drawn_box_x1 + _drawn_box_x1_right) / 2, drawn_box_y[0] + _text_y_offset, _text1, _textxscale1, _textyscale1, 0, c_white, c_white, c_white, c_white, true);
        }
        
        drawn_box_x[3] = _box_x - (_distance_between_boxes * 2);
        var _angle3 = lerp(0, 180, (drawn_box_x[3] + _offscreen_offset + __o) / _ogradius);
        _drawn_box_x3 = lengthdir_x(_radius, _angle3) + _centeroffset;
        var _angle3_right = lerp(0, 180, ((drawn_box_x[3] + _offscreen_offset + __a) - __o) / _ogradius);
        _drawn_box_x3_right = lengthdir_x(_radius, _angle3_right) + _centeroffset;
        var _textxscale3 = lerp(0, _xscale3 * _scale_adjust, abs(_drawn_box_x3 - _drawn_box_x3_right) / 170);
        var _textyscale3 = _yscale3;
        
        if (drawn_box_x[3] > -330)
        {
            d_rectangle_color(_drawn_box_x3, drawn_box_y[3], _drawn_box_x3_right, drawn_box_y[3] + 60, 16777215, 16777215, 16777215, 16777215, false);
            d_rectangle_color(_drawn_box_x3 - _w, drawn_box_y[3] + _w, _drawn_box_x3_right + _w, (drawn_box_y[3] + 60) - _w, 0, 0, 0, 0, false);
            
            if (minigame_won == false)
            {
                if (_text_outline == true)
                    draw_text_transformed_outline((_drawn_box_x3 + _drawn_box_x3_right) / 2, drawn_box_y[0] + _text_y_offset, _text3, _textxscale3, _textyscale3, _almost_black);
                else
                    draw_text_transformed_color((_drawn_box_x3 + _drawn_box_x3_right) / 2, drawn_box_y[0] + _text_y_offset, _text3, _textxscale3, _textyscale3, 0, c_white, c_white, c_white, c_white, true);
            }
        }
        
        drawn_box_x[4] = _box_x - _distance_between_boxes;
        var _angle4 = lerp(0, 180, (drawn_box_x[4] + _offscreen_offset + __o) / _ogradius);
        _drawn_box_x4 = lengthdir_x(_radius, _angle4) + _centeroffset;
        var _angle4_right = lerp(0, 180, ((drawn_box_x[4] + _offscreen_offset + __a) - __o) / _ogradius);
        _drawn_box_x4_right = lengthdir_x(_radius, _angle4_right) + _centeroffset;
        var _textxscale4 = lerp(0, _xscale4 * _scale_adjust, abs(_drawn_box_x4 - _drawn_box_x4_right) / 170);
        var _textyscale4 = _yscale4;
        d_rectangle_color(_drawn_box_x4, drawn_box_y[4], _drawn_box_x4_right, drawn_box_y[4] + 60, 16777215, 16777215, 16777215, 16777215, false);
        d_rectangle_color(_drawn_box_x4 - _w, drawn_box_y[4] + _w, _drawn_box_x4_right + _w, (drawn_box_y[4] + 60) - _w, 0, 0, 0, 0, false);
        
        if (minigame_won == false)
        {
            if (_text_outline == true)
                draw_text_transformed_outline((_drawn_box_x4 + _drawn_box_x4_right) / 2, drawn_box_y[0] + _text_y_offset, _text4, _textxscale4, _textyscale4, _almost_black);
            else
                draw_text_transformed_color((_drawn_box_x4 + _drawn_box_x4_right) / 2, drawn_box_y[0] + _text_y_offset, _text4, _textxscale4, _textyscale4, 0, c_white, c_white, c_white, c_white, true);
        }
    }
    
    drawn_box_x[0] = _box_x;
    var _angle0 = lerp(0, 180, (drawn_box_x[0] + _offscreen_offset) / _ogradius);
    var _drawn_box_x0 = lengthdir_x(_radius, _angle0) + _centeroffset;
    var _angle0_right = lerp(0, 180, (drawn_box_x[0] + _offscreen_offset + __a) / _ogradius);
    var _drawn_box_x0_right = lengthdir_x(_radius, _angle0_right) + _centeroffset;
    draw_set_color(c_red);
    draw_set_color(c_white);
    var _textxscale0 = lerp(0, _xscale0 * _scale_adjust, abs(_drawn_box_x0 - _drawn_box_x0_right) / 170);
    var _textyscale0 = _yscale0;
    d_rectangle_color(_drawn_box_x0, drawn_box_y[0], _drawn_box_x0_right, drawn_box_y[0] + 60, 16777215, 16777215, 16777215, 16777215, false);
    d_rectangle_color(_drawn_box_x0 - _w, drawn_box_y[0] + _w, _drawn_box_x0_right + _w, (drawn_box_y[0] + 60) - _w, 0, 0, 0, 0, false);
    
    if (minigame_won == false)
    {
        if (_text_outline == true)
            draw_text_transformed_outline((_drawn_box_x0 + _drawn_box_x0_right) / 2, drawn_box_y[0] + _text_y_offset + 0, _text0, _textxscale0, _textyscale0, _almost_black);
        else
            draw_text_transformed_color((_drawn_box_x0 + _drawn_box_x0_right) / 2, drawn_box_y[0] + _text_y_offset + 0, _text0, _textxscale0, _textyscale0, 0, c_white, c_white, c_white, c_white, 1);
    }
    
    var _drawn_box_x2, _drawn_box_x2_right;
    
    if ((questioncount == 0 && obj_pink_enemy.datecount == 1) || con != 2)
    {
    }
    else
    {
        drawn_box_x[2] = _box_x + (_distance_between_boxes * 2);
        var _angle2 = lerp(0, 180, (drawn_box_x[2] + _offscreen_offset + __o) / _ogradius);
        _drawn_box_x2 = lengthdir_x(_radius, _angle2) + _centeroffset;
        var _angle2_right = lerp(0, 180, (drawn_box_x[2] + _offscreen_offset + __a + __o) / _ogradius);
        _drawn_box_x2_right = lengthdir_x(_radius, _angle2_right) + _centeroffset;
        var _textxscale2 = lerp(0, _xscale2 * _scale_adjust, abs(_drawn_box_x2 - _drawn_box_x2_right) / 170);
        var _textyscale2 = _yscale2;
        d_rectangle_color(_drawn_box_x2, drawn_box_y[2], _drawn_box_x2_right, drawn_box_y[2] + 60, 16777215, 16777215, 16777215, 16777215, false);
        d_rectangle_color(_drawn_box_x2 - _w, drawn_box_y[2] + _w, _drawn_box_x2_right + _w, (drawn_box_y[2] + 60) - _w, 0, 0, 0, 0, false);
        
        if (minigame_won == false)
        {
            if (_text_outline == true)
                draw_text_transformed_outline((_drawn_box_x2 + _drawn_box_x2_right) / 2, drawn_box_y[0] + _text_y_offset, _text2, _textxscale2, _textyscale2, _almost_black);
            else
                draw_text_transformed_color((_drawn_box_x2 + _drawn_box_x2_right) / 2, drawn_box_y[0] + _text_y_offset, _text2, _textxscale2, _textyscale2, 0, c_white, c_white, c_white, c_white, true);
        }
        
        drawn_box_x[1] = _box_x + _distance_between_boxes;
        var _angle1 = lerp(0, 180, (drawn_box_x[1] + _offscreen_offset + __o) / _ogradius);
        _drawn_box_x1 = lengthdir_x(_radius, _angle1) + _centeroffset;
        var _angle1_right = lerp(0, 180, (drawn_box_x[1] + _offscreen_offset + __a + __o) / _ogradius);
        _drawn_box_x1_right = lengthdir_x(_radius, _angle1_right) + _centeroffset;
        var _textxscale1 = lerp(0, _xscale1 * _scale_adjust, abs(_drawn_box_x1 - _drawn_box_x1_right) / 170);
        var _textyscale1 = _yscale1;
        d_rectangle_color(_drawn_box_x1, drawn_box_y[1], _drawn_box_x1_right, drawn_box_y[1] + 60, 16777215, 16777215, 16777215, 16777215, false);
        d_rectangle_color(_drawn_box_x1 - _w, drawn_box_y[1] + _w, _drawn_box_x1_right + _w, (drawn_box_y[1] + 60) - _w, 0, 0, 0, 0, false);
        
        if (minigame_won == false)
        {
            if (_text_outline == true)
                draw_text_transformed_outline((_drawn_box_x1 + _drawn_box_x1_right) / 2, drawn_box_y[0] + _text_y_offset, _text1, _textxscale1, _textyscale1, _almost_black);
            else
                draw_text_transformed_color((_drawn_box_x1 + _drawn_box_x1_right) / 2, drawn_box_y[0] + _text_y_offset, _text1, _textxscale1, _textyscale1, 0, c_white, c_white, c_white, c_white, true);
        }
    }
    
    if (con == 2)
        d_line_width_color((_drawn_box_x0 + 2 + _drawn_box_x0_right) / 2, ___y, (_drawn_box_x0 + 2 + _drawn_box_x0_right) / 2, drawn_box_y[3] + 61, 2, 8388736, 8388736);
    
    if ((questioncount == 0 && obj_pink_enemy.datecount == 1) || con != 2)
    {
    }
    else
    {
        d_line_width_color((_drawn_box_x5 + _drawn_box_x5_right) / 2, ___y, (_drawn_box_x6 + _drawn_box_x6_right) / 2, ___y, 2, 8388736, 8388736);
        d_line_width_color((_drawn_box_x6 + _drawn_box_x6_right) / 2, ___y, (_drawn_box_x6 + _drawn_box_x6_right) / 2, drawn_box_y[3] + 61, 2, 8388736, 8388736);
        d_circle_color(((_drawn_box_x6 + _drawn_box_x6_right) / 2) - 1, ___y, 4, 8388736, 8388736, false);
        
        if (drawn_box_x[3] > -330)
            d_line_width_color((_drawn_box_x3 + _drawn_box_x3_right) / 2, ___y, (_drawn_box_x3 + _drawn_box_x3_right) / 2, drawn_box_y[3] + 61, 2, 8388736, 8388736);
        
        d_line_width_color((_drawn_box_x4 + _drawn_box_x4_right) / 2, ___y, (_drawn_box_x4 + _drawn_box_x4_right) / 2, drawn_box_y[3] + 61, 2, 8388736, 8388736);
        d_line_width_color((_drawn_box_x1 + _drawn_box_x1_right) / 2, ___y, (_drawn_box_x1 + _drawn_box_x1_right) / 2, drawn_box_y[3] + 61, 2, 8388736, 8388736);
        d_line_width_color((_drawn_box_x2 + _drawn_box_x2_right) / 2, ___y, (_drawn_box_x2 + _drawn_box_x2_right) / 2, drawn_box_y[3] + 61, 2, 8388736, 8388736);
        d_line_width_color((_drawn_box_x3 + _drawn_box_x3_right) / 2, ___y, (_drawn_box_x4 + _drawn_box_x4_right) / 2, ___y, 2, 8388736, 8388736);
        d_line_width_color((_drawn_box_x4 + _drawn_box_x4_right) / 2, ___y, (_drawn_box_x0 + _drawn_box_x0_right) / 2, ___y, 2, 8388736, 8388736);
        d_line_width_color((_drawn_box_x0 + _drawn_box_x0_right) / 2, ___y, (_drawn_box_x1 + _drawn_box_x1_right) / 2, ___y, 2, 8388736, 8388736);
        d_line_width_color((_drawn_box_x1 + _drawn_box_x1_right) / 2, ___y, (_drawn_box_x2 + _drawn_box_x2_right) / 2, ___y, 2, 8388736, 8388736);
        
        if (drawn_box_x[3] > -330)
            d_circle_color(((_drawn_box_x3 + _drawn_box_x3_right) / 2) - 1, ___y, 4, 8388736, 8388736, false);
        
        d_circle_color(((_drawn_box_x4 + _drawn_box_x4_right) / 2) - 1, ___y, 4, 8388736, 8388736, false);
        d_circle_color(((_drawn_box_x0 + _drawn_box_x0_right) / 2) - 1, ___y, 4, 8388736, 8388736, false);
        d_circle_color(((_drawn_box_x1 + _drawn_box_x1_right) / 2) - 1, ___y, 4, 8388736, 8388736, false);
        d_circle_color(((_drawn_box_x2 + _drawn_box_x2_right) / 2) - 1, ___y, 4, 8388736, 8388736, false);
    }
    
    draw_set_alpha(1);
}

draw_set_valign(fa_top);

if (i_ex(obj_purplecontrols))
{
    var _targetalpha = 0.5;
    
    if (obj_purplecontrols.difficulty == 0)
        _targetalpha = 0;
    
    if (obj_purplecontrols.difficulty == 1)
        _targetalpha = 0.2;
    
    if (obj_purplecontrols.difficulty == 1)
        _targetalpha = 0.4;
    
    if (obj_purplecontrols.difficulty == 2)
        _targetalpha = 0.6;
    
    if (obj_purplecontrols.difficulty == 3)
        _targetalpha = 0.8;
    
    if (obj_purplecontrols.difficulty == 4)
        _targetalpha = 0;
    
    difficulty_prev = obj_purplecontrols.difficulty;
    date3darkner_alpha = lerp(date3darkner_alpha, _targetalpha, 0.4);
    draw_set_color(c_black);
    draw_set_alpha(date3darkner_alpha);
    d_rectangle(camx, camy, camx + camwidth, camy + camheight, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (show_intro_outro_surfaces == true && con == 0)
{
    gpu_set_fog(1, c_white, 0, 0);
    draw_set_alpha(intro_outro_surfaces_whiteness_alpha);
    
    if (bugfix_depth_con == 0)
    {
        bugfix_depth_con++;
    }
    else
    {
        d_rectangle(camx + surface1_x, camy, camx + (camwidth / 2) + surface1_x, camy + camheight, false);
        d_rectangle(camx + surface2_x + 1, camy, camx + (camwidth / 2) + surface2_x + 1, camy + camheight, false);
    }
    
    draw_set_alpha(1);
    gpu_set_fog(0, c_white, 0, 0);
    tailindex += 0.16666666666666666;
    portrait_offset_x = 0;
    
    if (pinkportrait == 5428)
        portrait_offset_x = 5;
    
    if (pinkportrait == 6742 || pinkportrait == 677)
        pinkportrait = 2036;
    
    portrait_offset_x = 4;
    
    if (pinkportrait == 5218)
        draw_sprite_ext(spr_pinkspeaker_tail, tailindex, xx + pinkportrait_x, yy + 21, portrait_xscale, 2, 0, c_white, pinkportraitalpha);
    
    draw_sprite_ext(pinkportrait, pinkindex, xx + pinkportrait_x + portrait_offset_x, yy + pinkportrait_y, portrait_xscale, 2, 0, c_white, pinkportraitalpha);
    
    if (sweatcon == 1)
        draw_sprite_ext(spr_pinkspeaker_sweatdrop, sweatindex, xx + pinkportrait_x + portrait_offset_x, yy + pinkportrait_y, portrait_xscale, 2, 0, c_white, 1);
    
    var _body_y = camy + 208;
    var _w = 2;
    var __w = 320;
    var _body_x = camx + 320;
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_set_font(scr_84_get_font("mainbig"));
    draw_set_alpha(pinkportraitalpha);
    draw_text_ext(_body_x - _w, _body_y, _first_text, 28, __w);
    draw_text_ext(_body_x - _w, _body_y - _w, _first_text, 28, __w);
    draw_text_ext(_body_x - _w, _body_y + _w, _first_text, 28, __w);
    draw_text_ext(_body_x + _w, _body_y, _first_text, 28, __w);
    draw_text_ext(_body_x + _w, _body_y + _w, _first_text, 28, __w);
    draw_text_ext(_body_x + _w, _body_y - _w, _first_text, 28, __w);
    draw_text_ext(_body_x, _body_y + _w, _first_text, 28, __w);
    draw_text_ext(_body_x, _body_y - _w, _first_text, 28, __w);
    draw_set_color(merge_color(c_black, c_gray, 0.1));
    draw_text_ext(_body_x, _body_y, _first_text, 28, __w);
    draw_set_halign(fa_left);
    draw_set_alpha(1);
}

if (con == 7 && minigame_con != 2)
{
    draw_surface_part(surface1, camx, camy, camwidth / 2, camheight, surface1_x, camy);
    draw_surface_part(surface1, camx + 320, camy, camwidth / 2, camheight, surface2_x, camy);
}

if (minigame_won == true)
{
    if (minigame_con == 1)
    {
        minigame_won_alpha += 0.05;
        
        if (minigame_won_alpha > 1.2)
        {
            minigame_con = 2;
            
            if (date3endingcon >= 1)
            {
                with (obj_fadeout)
                    instance_destroy();
                
                inst = scr_fadein(30);
                inst.image_blend = c_white;
                inst.depth = -999999999;
            }
        }
    }
    
    if (minigame_con == 2)
    {
        minigame_won_alpha -= 0.05;
        
        if (minigame_won_alpha <= 0)
        {
            instance_destroy();
            
            with (obj_pink_enemy)
            {
                phaseturns = 0;
                looping = false;
                doki = 0;
                explosioncon = 1;
                idlesprite = spr_pink_shocked;
                explode_after_date = true;
            }
        }
    }
    
    draw_set_alpha(minigame_won_alpha);
    d_rectangle(camx, camy, camx + camwidth, camy + camheight, false);
    draw_set_alpha(1);
}

if (pinkportrait == 1103 && draw_box_timer > 20)
{
    if (con != 7)
    {
        if (minigame_won == false && eyeshaft_alpha < 1)
            eyeshaft_alpha += 0.1;
        
        if (minigame_won == true && eyeshaft_alpha > 0)
            eyeshaft_alpha -= 0.1;
    }
    else
    {
        eyeshaft_alpha -= 0.1;
    }
    
    draw_set_alpha(eyeshaft_alpha);
    var _handx = camx + 210;
    var _handy = camy + 395;
    d_line_color(_handx - 105, _handy - 250, (_handx - 15) + 9, (_handy - 193) + _float_y, 65280, 65280);
    d_line_color(_handx - 105, _handy - 150, (_handx - 27) + 9, (_handy - 176) + _float_y, 65280, 65280);
    d_line_color(_handx - 105, _handy - 130, (_handx - 22) + 9, (_handy - 168) + _float_y, 65280, 65280);
    d_line_color(_handx - 60, _handy - 124, (_handx - 16) + 9, (_handy - 160) + _float_y, 65280, 65280);
    d_line_color(_handx - 14, _handy - 124, (_handx - 3) + 9, (_handy - 156) + _float_y, 65280, 65280);
    d_line_color(_handx + 240, _handy - 124, _handx + 218 + 9, (_handy - 156) + _float_y, 65280, 65280);
    d_line_color(_handx + 280, _handy - 124, _handx + 230 + 9, (_handy - 160) + _float_y, 65280, 65280);
    d_line_color(_handx + 315, _handy - 132, _handx + 239 + 9, (_handy - 168) + _float_y, 65280, 65280);
    d_line_color(_handx + 315, _handy - 152, _handx + 239 + 9, (_handy - 176) + _float_y, 65280, 65280);
    d_line_color(_handx + 315, _handy - 250, _handx + 229 + 9, (_handy - 193) + _float_y, 65280, 65280);
    eyeshafttimer++;
    
    if (eyeshafttimer == 10)
    {
        eyeshafttimer = 0;
        idiot2 = -1 + random(2);
    }
    
    xx = eyeshaft_x;
    
    if (changecolorcon == 1)
    {
        colortarget2 = make_color_hsv(irandom(255), 250, 255);
        
        if (changecolorcount == 5)
            colortarget2 = 16777215;
        
        changecolorcon = 2;
    }
    
    if (changecolorcon == 2)
    {
        changecolortimer++;
        eye_shaft_blend = merge_color(colortarget, colortarget2, changecolortimer / 3);
        
        if (changecolortimer == 3)
        {
            colortarget = colortarget2;
            changecolorcount++;
            changecolorcon = 1;
            changecolortimer = 0;
            
            if (changecolorcount == 6)
            {
                eye_shaft_blend = 16777215;
                changecolorcount = 0;
                changecolorcon = 0;
            }
        }
    }
    
    if (changecolorcon == 1 || changecolorcon == 2)
        draw_sprite_ext(spr_possessed_mewmew_greyscale_brighter, tailindex, ((xx + pinkportrait_x + 110 + portrait_offset_x) - 8) + irandom(16), yy + pinkportrait_y + _float_y, 2, 2, 0, c_white, changecolortimer / 10);
    
    draw_sprite_ext(spr_possessed_mewmew_eyes2, tailindex * 1, xx + pinkportrait_x + 110 + portrait_offset_x, yy + pinkportrait_y + _float_y, 2, 2, 0, eye_shaft_blend, (eyeshaft_alpha * 0.7) - (sin(tailindex * 1) * 0.3));
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
