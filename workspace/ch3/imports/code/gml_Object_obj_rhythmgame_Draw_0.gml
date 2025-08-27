if (freeplay < 0)
{
    var _textspacing = 16;
    draw_set_color(c_white);
    _ystart = 80;
    draw_text(230, _ystart - _textspacing, /*"TRACK SELECT"*/"曲目选择");
    var _difficulty = "";
    
    for (i = 0; i < array_length(tracklist); i++)
    {
        if (i == song_id)
        {
            draw_set_color(hardmode ? c_orange : c_yellow);
            
            if (hardmode)
                _difficulty = /*" (Hard)" */"（困难）";
        }
        
        draw_text(210, _ystart + (_textspacing * i), string_format_zero(i, 2, 0) + " - " + tracklist[i] + _difficulty);
        
        if (i == song_id)
        {
            _difficulty = "";
            draw_set_color(c_white);
        }
    }
    
    draw_sprite(spr_heart, 0, 190, _ystart + (song_id * _textspacing));
    exit;
}

camy = cameray();
camx = camerax();

with (obj_rhythmgame_chart)
{
    camy = other.camy;
    camx = other.camx;
}

if (tenna_boss)
{
    draw_set_color(c_black);
    ossafe_fill_rectangle(camx, camy, camx + camerawidth(), camy + 100);
    draw_set_color(c_white);
}

bg_timer++;

if (palette_active)
{
    palette_pos = scr_movetowards(palette_pos, 1 - bg_con, 0.1);
    pal_swap_set(4779, palette_pos, false);
    draw_sprite_ext(spr_rhythmgame_bg, 1, x, y + 100, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    pal_swap_reset();
    
    if (palette_pos == 0)
        palette_active = false;
}
else
{
    draw_sprite_ext(spr_rhythmgame_bg, bg_con, x, y + 100, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_set_blend_mode(bm_add);
    draw_sprite_ext(spr_rhythmgame_bg, bg_con, x, y + 100, image_xscale, image_yscale, image_angle, image_blend, 0.1 + (sin(bg_timer / 6) * 0.1 * (kchart_ease * 0.65)));
    draw_set_blend_mode(bm_normal);
    draw_sprite_ext(spr_rhythmgame_bg_mask, 1, x, y + 100, image_xscale, image_yscale, image_angle, image_blend, image_alpha * (kchart_ease * 0.65));
}

var _silhouette = false;
var _floor = y + 394;

with (obj_rhythmgame_performer)
{
    if (silhouette)
    {
        if (!_silhouette)
        {
            _silhouette = true;
            
            if (!surface_exists(other.silhouette_surf))
                other.silhouette_surf = surface_create(640, 480);
            
            surface_set_target(other.silhouette_surf);
            draw_clear_alpha(c_black, 0);
        }
        
        var _floorb = _floor + 2;
        
        if (name == "susie")
            _floorb -= 8;
        
        if (marker != -4)
        {
            with (marker)
            {
                scr_perspective_shadow_ext(id, 350, _floor - 78, _floor, true, 0, 120);
                scr_perspective_shadow_ext(id, 290, _floor - 78, _floor, true, 0, 120);
            }
        }
        
        scr_perspective_shadow_ext(id, 350, _floor - 90, _floorb, true, 0, 120);
        scr_perspective_shadow_ext(id, 290, _floor - 90, _floorb, true, 0, 120);
    }
}

if (_silhouette)
{
    gpu_set_blendmode(bm_subtract);
    draw_sprite_ext(spr_rhythmgame_bg_overlay, 0, x, y + 100, image_xscale, image_yscale, image_angle, image_blend, 1);
    gpu_set_blendmode(bm_normal);
    surface_reset_target();
    draw_surface(silhouette_surf, x, 0);
}

if (stage_con >= 1)
{
    draw_sprite_ext(spr_rhythmgame_bg_mask, 0, x, y + 100, image_xscale, image_yscale, image_angle, spotlight_color[3], ((image_alpha * (stage_con - 1)) / 2) + 0.25);
    stage_con = scr_movetowards(stage_con, 1, 0.05);
}

if ((miss_timer > 0 || fame <= 2000) && tutorial < 7)
{
    draw_set_blend_mode(bm_add);
    red_glow = miss_timer / 20;
    
    if (fame <= 2000)
    {
        if (lose_con < 2)
            siner++;
        
        red_glow += ((sin((siner / 20) * pi) * 0.25) + 0.25);
    }
    
    draw_sprite_ext(spr_rhythmgame_bg_mask, 0, x, y + 100, image_xscale, image_yscale, 0, spotlight_color[1], red_glow);
    draw_set_blend_mode(bm_normal);
}
else if (red_glow > 0)
{
    red_glow = 0;
}

var _inv_ease = chart_ease - 1;
var _ystart = y + 100 + (16 * image_yscale);
draw_sprite_ext(spr_rhythmgame_spotlight, bg_con, x + (16 * image_xscale), _ystart - (50 * chart_ease), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_rhythmgame_spotlight, bg_con, (x + camerawidth()) - (16 * image_xscale), _ystart - (50 * chart_ease), -image_xscale, image_yscale, image_angle, image_blend, image_alpha);

if (chart_ease > 0)
{
    draw_set_halign(fa_center);
    draw_set_color(spotlight_color[2]);
    draw_set_font(fnt_main);
    draw_text_transformed(x + 60 + (110 * _inv_ease), _ystart - 60 - 30, stringsetloc("POPU", "obj_rhythmgame_slash_Draw_0_gml_38_0"), 2, 2, 0);
    draw_text_transformed((x + camerawidth()) - 60 - (110 * _inv_ease), _ystart - 60 - 30, stringsetloc("LARITY", "obj_rhythmgame_slash_Draw_0_gml_39_0"), 2, 2, 0);
    draw_set_halign(fa_left);
    draw_sprite_ext(spr_rhythmgame_spotlight, bg_con, x + (16 * image_xscale) + (110 * _inv_ease), (_ystart + 60) - (30 * chart_ease), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_rhythmgame_spotlight, bg_con, (x + camerawidth()) - (16 * image_xscale) - (110 * _inv_ease), (_ystart + 60) - (30 * chart_ease), -image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_rhythmgame_spotlight, bg_con, x + (16 * image_xscale) + (220 * _inv_ease), (_ystart + 120) - (10 * chart_ease), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_rhythmgame_spotlight, bg_con, (x + camerawidth()) - (16 * image_xscale) - (220 * _inv_ease), (_ystart + 120) - (10 * chart_ease), -image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    var _col = spotlight_col(0);
    draw_sprite_ext(spr_rhythmgame_spotlight, 5, x + (16 * image_xscale), _ystart - (50 * chart_ease), image_xscale, image_yscale, image_angle, _col, image_alpha);
    draw_sprite_ext(spr_rhythmgame_spotlight, 5, (x + camerawidth()) - (16 * image_xscale), _ystart - (50 * chart_ease), -image_xscale, image_yscale, image_angle, _col, image_alpha);
    
    if (fame >= 12000)
    {
        draw_set_blend_mode(bm_add);
        draw_sprite_ext(spr_rhythmgame_spotlight, 6, x + (16 * image_xscale), _ystart - (50 * chart_ease), image_xscale, image_yscale, image_angle, _col, 0.1);
        draw_sprite_ext(spr_rhythmgame_spotlight, 6, (x + camerawidth()) - (16 * image_xscale), _ystart - (50 * chart_ease), -image_xscale, image_yscale, image_angle, _col, 0.1);
        draw_set_blend_mode(bm_normal);
    }
    
    _col = spotlight_col(1);
    draw_sprite_ext(spr_rhythmgame_spotlight, 5, x + (16 * image_xscale) + (110 * _inv_ease), (_ystart + 60) - (30 * chart_ease), image_xscale, image_yscale, image_angle, _col, image_alpha);
    draw_sprite_ext(spr_rhythmgame_spotlight, 5, (x + camerawidth()) - (16 * image_xscale) - (110 * _inv_ease), (_ystart + 60) - (30 * chart_ease), -image_xscale, image_yscale, image_angle, _col, image_alpha);
    
    if (fame >= 10000)
    {
        draw_set_blend_mode(bm_add);
        draw_sprite_ext(spr_rhythmgame_spotlight, 6, x + (16 * image_xscale) + (110 * _inv_ease), (_ystart + 60) - (30 * chart_ease), image_xscale, image_yscale, image_angle, _col, 0.1);
        draw_sprite_ext(spr_rhythmgame_spotlight, 6, (x + camerawidth()) - (16 * image_xscale) - (110 * _inv_ease), (_ystart + 60) - (30 * chart_ease), -image_xscale, image_yscale, image_angle, _col, 0.1);
        draw_set_blend_mode(bm_normal);
    }
    
    _col = spotlight_col(2);
    draw_sprite_ext(spr_rhythmgame_spotlight, 5, x + (16 * image_xscale) + (220 * _inv_ease), (_ystart + 120) - (10 * chart_ease), image_xscale, image_yscale, image_angle, _col, image_alpha);
    draw_sprite_ext(spr_rhythmgame_spotlight, 5, (x + camerawidth()) - (16 * image_xscale) - (220 * _inv_ease), (_ystart + 120) - (10 * chart_ease), -image_xscale, image_yscale, image_angle, _col, image_alpha);
    
    if (fame >= 8000)
    {
        draw_set_blend_mode(bm_add);
        draw_sprite_ext(spr_rhythmgame_spotlight, 6, x + (16 * image_xscale) + (220 * _inv_ease), (_ystart + 120) - (10 * chart_ease), image_xscale, image_yscale, image_angle, _col, 0.1);
        draw_sprite_ext(spr_rhythmgame_spotlight, 6, (x + camerawidth()) - (16 * image_xscale) - (220 * _inv_ease), (_ystart + 120) - (10 * chart_ease), -image_xscale, image_yscale, image_angle, _col, 0.1);
        draw_set_blend_mode(bm_normal);
    }
    
    draw_set_font(fnt_main);
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_set_color(note_color[0]);
    draw_text_outline(x + 110 + (300 * _inv_ease), y + 467, stringsetloc("SCORE", "obj_rhythmgame_slash_Draw_0_gml_220_0"), 0);
    draw_set_font(fnt_mainbig);
    draw_text_outline(x + 20 + (200 * _inv_ease), y + 470, string_format_zero(points + hold_score, 6, 0), 0);
    draw_set_font(fnt_main);
    draw_set_color(note_color[1]);
    draw_set_halign(fa_right);
    draw_text_outline((x + 530) - (300 * _inv_ease), y + 467, stringsetloc("MAX COMBO", "obj_rhythmgame_slash_Draw_0_gml_227_0"), 0);
    draw_set_font(fnt_mainbig);
    draw_text_outline((x + 620) - (200 * _inv_ease), y + 470, string_format_zero(max_combo, 6, 0), 0);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    draw_set_font(fnt_main);
    draw_set_color(c_white);
    
    if (miss_timer > 0)
    {
        _col = spotlight_color[1];
        draw_set_blend_mode(bm_add);
        draw_sprite_ext(spr_rhythmgame_spotlight, 6, x + (16 * image_xscale), _ystart - (50 * chart_ease), image_xscale, image_yscale, image_angle, _col, miss_timer / 20);
        draw_sprite_ext(spr_rhythmgame_spotlight, 6, (x + camerawidth()) - (16 * image_xscale), _ystart - (50 * chart_ease), -image_xscale, image_yscale, image_angle, _col, miss_timer / 20);
        draw_sprite_ext(spr_rhythmgame_spotlight, 6, x + (16 * image_xscale) + (110 * _inv_ease), (_ystart + 60) - (30 * chart_ease), image_xscale, image_yscale, image_angle, _col, miss_timer / 20);
        draw_sprite_ext(spr_rhythmgame_spotlight, 6, (x + camerawidth()) - (16 * image_xscale) - (110 * _inv_ease), (_ystart + 60) - (30 * chart_ease), -image_xscale, image_yscale, image_angle, _col, miss_timer / 20);
        draw_sprite_ext(spr_rhythmgame_spotlight, 6, x + (16 * image_xscale) + (220 * _inv_ease), (_ystart + 120) - (10 * chart_ease), image_xscale, image_yscale, image_angle, _col, miss_timer / 20);
        draw_sprite_ext(spr_rhythmgame_spotlight, 6, (x + camerawidth()) - (16 * image_xscale) - (220 * _inv_ease), (_ystart + 120) - (10 * chart_ease), -image_xscale, image_yscale, image_angle, _col, miss_timer / 20);
        draw_set_blend_mode(bm_normal);
        miss_timer--;
    }
}

_inv_ease = kchart_ease - 1;
bottomy = 240 + y + (300 * _inv_ease);
var _centerx = 320;
var _flashOnly = false;
var _notespeed;

if ((song_initialized && intro_con >= 2) || kchart_ease > 0)
{
    _notespeed = notespeed;
    var _whiteness = 16777215;
    
    if (invc > 0)
        _whiteness = merge_color(c_white, c_red, scr_rhythmgame_damage_flash());
    
    _whiteness = merge_color(c_black, c_white, brightness);
    scr_rhythmgame_draw_backing(_notespeed, _centerx);
    draw_sprite_ext(spr_rhythmgame_button, 0, _centerx - 20, bottomy, 1, 1, 0, _whiteness, 1);
    draw_sprite_ext(spr_rhythmgame_button, 1, _centerx + 20, bottomy, 1, 1, 0, _whiteness, 1);
    d3d_set_fog(true, _whiteness, 0, 1);
    draw_sprite_ext(spr_rhythmgame_button, 0, _centerx - 20, bottomy, 1, 1, 0, c_white, note_hit_timer[0] / 5);
    draw_sprite_ext(spr_rhythmgame_button, 1, _centerx + 20, bottomy, 1, 1, 0, c_white, note_hit_timer[1] / 5);
    d3d_set_fog(false, c_black, 0, 0);
    draw_set_color(c_white);
    var _xstart = (instrument == 2) ? 270 : 280;
    var _xwidth = (instrument == 2) ? 30 : 40;
    scr_rhythmgame_draw_combo(_centerx);
    scr_rhythmgame_draw_chart(_notespeed, _centerx, false);
    scr_rhythmgame_draw_border(_centerx);
    draw_set_color(c_white);
    
    if (tutorial > 0)
    {
        if (tutorial >= 4)
        {
            if (timer > 0)
                timer -= 0.1;
        }
        else if (tutorial >= 2)
        {
            if (timer < 1)
                timer += 0.1;
        }
        
        var _buttonalpha = clamp01(timer);
        
        if (chart_lerp < 1 && _buttonalpha > 0)
        {
            var _sin = sin((trackpos / meter) * pi * 2) * 12;
            draw_set_halign(fa_center);
            var _chart_extra = (1 - chart_lerp) * _buttonalpha;
            draw_set_alpha(_chart_extra);
            draw_set_font(scr_84_get_font("main"));
            var _played = note_hit_timer[0] > 0;
            var _col = _played ? 65535 : 16777215;
            draw_set_color(_col);
            draw_set_halign(fa_right);
            draw_set_valign(fa_bottom);
            var _pressmsg = string_hash_to_newline(stringsetloc("THIS IS#THE BUTTON#YOU WOULD#PRESS IN#THE REAL#SONG BUT#THIS IS#AN AUTO-#MATICALLY#PLAYING#DEMO", "obj_rhythmgame_slash_Draw_0_gml_313_0"));
            draw_text_transformed(_centerx - 52, bottomy - 10, _pressmsg, 1, 1, 0);
            draw_sprite_ext(spr_sneo_bullet_arrow, 0, _centerx - 54 - (abs(_sin) * (1 - _played)), bottomy - 2, 2, 2, 0, _col, _chart_extra);
            _played = note_hit_timer[1] > 0;
            _col = _played ? 65535 : 16777215;
            draw_set_color(_col);
            draw_set_halign(fa_left);
            draw_text_transformed(_centerx + 52, bottomy - 10, _pressmsg, 1, 1, 0);
            draw_sprite_ext(spr_sneo_bullet_arrow, 0, _centerx + 56 + (abs(_sin) * (1 - _played)), bottomy - 2, -2, 2, 0, _col, _chart_extra);
            _col = 16777215;
            draw_set_alpha(1);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
        }
        
        draw_rhythm_buttons(_centerx, _whiteness, _buttonalpha);
        
        if (tutorial >= 4)
        {
            if (tutorial >= 5)
            {
                fade = scr_movetowards(fade, 0, 0.05);
                draw_set_color(merge_color(c_gray, c_black, fade));
                draw_set_blend_mode(bm_subtract);
                ossafe_fill_rectangle(_centerx - 40, bottomy - 200, _centerx + 40, bottomy + 50);
                draw_set_blend_mode(bm_normal);
                
                if (fade <= 0 || (fade % 0.25) > 0.125)
                    draw_sprite_ext(spr_rhythmgame_mute, 0, _centerx, bottomy - 75, 1, 1, 0, merge_color(c_black, c_white, brightness), 1);
            }
            
            if (fame <= 2000)
            {
                if (tutorial == 6 && fame > 0)
                {
                    if (invc <= 0)
                        missnotecon = 1;
                }
                else
                {
                    _flashOnly = true;
                    
                    if (tutorial == 5)
                        invc = 0;
                }
            }
        }
    }
    else if (button_alpha > 0)
    {
        var _buttonalpha = 1;
        
        if (button_alpha > 0)
            button_alpha -= 0.05;
        
        _buttonalpha = max(0, button_alpha);
        draw_rhythm_buttons(_centerx, 16777215, _buttonalpha);
    }
    
    if (tenna_boss && speed_modifier >= 2)
    {
        var _shake = max(0, (speed_modifier - 2) * 1.5);
        var _sx = random_range(-1, 1) * _shake;
        var _sy = random_range(-1, 1) * _shake;
        draw_set_color(#330000);
        draw_text_transformed(_centerx + 50 + 2 + _sx, bottomy + 15 + 2 + _sy, string_format_auto(speed_modifier, 1) + "x", 2, 2, 0);
        draw_text_transformed(_centerx + 50 + 2 + _sx, bottomy + 40 + 2 + _sy, stringsetloc("SPEED", "obj_rhythmgame_slash_Draw_0_gml_415_0"), 1, 1, 0);
        draw_set_color(c_red);
        draw_text_transformed(_centerx + 50 + _sx, bottomy + 15 + _sy, string_format_auto(speed_modifier, 1) + "x", 2, 2, 0);
        draw_text_transformed(_centerx + 50 + _sx, bottomy + 40 + _sy, stringsetloc("SPEED", "obj_rhythmgame_slash_Draw_0_gml_418_0"), 1, 1, 0);
    }
    
    if (lose_con >= 1)
    {
        fade = scr_movetowards(fade, 0, 0.05);
        draw_set_color(merge_color(c_gray, c_black, fade));
        draw_set_blend_mode(bm_subtract);
        ossafe_fill_rectangle(_centerx - 40, bottomy - 200, _centerx + 40, bottomy + 50);
        draw_set_blend_mode(bm_normal);
        
        if (fade <= 0 || (fade % 0.25) > 0.125)
            draw_sprite_ext(spr_rhythmgame_mute, 0, _centerx, bottomy - 75, 1, 1, 0, merge_color(c_black, c_white, brightness), 0);
    }
    
    _inv_ease = chart_ease - 1;
    bottomy = 240 + y + (300 * _inv_ease);
    
    if (brightness != target_brightness)
        brightness = scr_movetowards(brightness, target_brightness, 0.025);
    
    with (obj_rhythmgame_chart)
    {
        if (brightness != target_brightness)
            brightness = scr_movetowards(brightness, target_brightness, 0.025);
    }
    
    if (tutorial == 3)
    {
        target_brightness = 0.5;
    }
    else if (tutorial == 4 || tutorial == 5)
    {
        with (obj_rhythmgame_chart)
        {
            if (instrument == 2)
                target_brightness = 0.5;
        }
        
        target_brightness = 1;
    }
    else if (tutorial == 6)
    {
        with (obj_rhythmgame_chart)
        {
            if (instrument == 1)
                target_brightness = 1;
            else
                target_brightness = 0.5;
        }
        
        target_brightness = 0.5;
    }
    else if (tutorial > 0)
    {
        with (obj_rhythmgame_chart)
            target_brightness = 1;
        
        target_brightness = 1;
    }
    
    with (obj_rhythmgame_chart)
    {
        bottomy = other.bottomy;
        trackpos = other.trackpos;
        scr_rhythmgame_draw(_notespeed, 170 + ((instrument - 1) * 300));
    }
}

with (obj_rhythmgame_chart)
{
    if (other.tutorial == 6 && other.fame <= 0)
        fade = scr_movetowards(fade, 0, 0.05);
    
    bottomy = other.bottomy;
    var _cen = 170 + ((instrument - 1) * 300);
    
    if (instrument == 1 && fade < 1 && (other.song_id <= 1 || other.tutorial > 0) && trackpos > 0)
    {
        draw_set_color(merge_color(c_gray, c_black, fade));
        draw_set_blend_mode(bm_subtract);
        ossafe_fill_rectangle(_cen - 40, bottomy - 200, _cen + 40, bottomy + 50);
        draw_set_blend_mode(bm_normal);
        
        if (fade <= 0 || (fade % 0.25) > 0.125)
            draw_sprite_ext(spr_rhythmgame_mute, 0, _cen, bottomy - 75, 1, 1, 0, merge_color(c_black, c_white, brightness), 1);
    }
    
    if (other.intro_con >= 2 || other.kchart_ease > 0 || other.tutorial > 0)
        scr_rhythmgame_draw_border(_cen);
}

_inv_ease = kchart_ease - 1;
bottomy = 240 + y + (300 * _inv_ease);

if (!song_initialized && !tutorial)
    exit;

if (tutorial > 0 && tutorial <= 3)
    missnotecon = 0;

if (missnotecon == 1 && lose_con == 0)
{
    var _susie = fixed_penalty != 0;
    
    if (invc <= 0)
    {
        if (!_flashOnly && !_susie)
            snd_play_x(snd_hurt1, 0.6, 0.9);
        
        if (_susie && fixed_penalty > 0)
        {
            if (fade < 1 || fame > 2000 || song_id == 1)
            {
                fame -= fixed_penalty;
                total_fame -= fixed_penalty;
            }
        }
        else if (!_flashOnly)
        {
            var _penalty = ((fame <= 2000) ? 100 : 200) * difficulty * fame_mul;
            
            if (_susie && fade == 1)
            {
                if (fame <= 2000)
                    _penalty = 0;
                else
                    _penalty = min(_penalty, fame - 2000);
            }
            
            fame -= _penalty;
            total_fame -= _penalty;
            
            if (fame < 0)
                event_user(5);
        }
    }
    
    if (!_susie)
        combo = 0;
    
    if (tenna_boss)
    {
    }
    else if (!_susie && !tenna_boss)
    {
        if (oneAtATime)
            mus_volume(track1_main, 1, 0);
        
        mus_volume(track2_main, 0, 0);
    }
    
    missnotecon = 2;
    missnotetimer = 0;
    
    if (_susie)
    {
        miss_timer = 10;
    }
    else if (invc <= 0 && !_flashOnly)
    {
        if (tenna_boss && i_ex(obj_tenna_zoom) && obj_tenna_zoom.con > 1)
        {
        }
        
        if (tenna_boss)
        {
            global.inv = -1;
            obj_tenna_enemy.minigamefailcount++;
            
            if (obj_tenna_enemy.minigamefailcount > 2 && obj_tenna_zoom.con != 2 && obj_tenna_zoom.minigameinsanity == false)
            {
                with (obj_tenna_zoom)
                {
                    con = 2;
                    timer = -30;
                }
            }
        }
        
        hurt_counter++;
        miss_timer = 10;
        
        if (fade == 1)
            hurt_flash = 12;
        
        with (performer)
            shakeamt = 10;
        
        if (tenna_boss || hardmode)
            invc = 20;
        else
            invc = tutorial ? 6 : 60;
    }
    
    fixed_penalty = 0;
}
else if (invc > 0)
{
    invc--;
    hurt_flash--;
}

if (scr_debug())
{
    if (keyboard_check_pressed(ord("Z")))
        lineA = trackpos;
    
    if (keyboard_check_pressed(ord("X")))
        lineB = trackpos;
}

if (scr_debug() && show_debug)
{
    if (lineA > 0)
    {
        var lineA_line = bottomy + ((trackpos - lineA) * _notespeed);
        ossafe_fill_rectangle(250, lineA_line - 1, 310, lineA_line + 1);
    }
    
    if (lineB > 0)
    {
        var lineB_line = bottomy + ((trackpos - lineB) * _notespeed);
        ossafe_fill_rectangle(320, lineB_line - 1, 380, lineB_line + 1);
    }
    
    draw_set_color(c_red);
    draw_text(0, 0, "track pos: " + string(trackpos) + " / " + string(track_length));
    draw_text(0, 30, "fame: " + string(fame) + " / 12600");
    draw_text(0, 60, notetime[0]);
    draw_text(0, 90, trackpos / meter);
}

if (scr_debug() && global.chemg_show_val)
{
    draw_set_alpha(1);
    draw_set_color(c_white);
    
    if (fps < 30)
        draw_set_color(c_red);
    
    var cx = camerax() + 268;
    var cy = cameray() + 290;
    draw_text_outline(cx, cy, "FPS: " + string(fps));
    draw_text_outline(cx, cy + 12, "FPS_real: " + string(fps_real));
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
