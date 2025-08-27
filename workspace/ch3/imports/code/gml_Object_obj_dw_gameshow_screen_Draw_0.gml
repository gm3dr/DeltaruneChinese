if (i_ex(obj_round_evaluation))
    exit;

depth = 990000;
crttimer = (crttimer + 0.5) % 3;
var _vig = crt_glitch ? (0.2 + random(clamp(crt_glitch / 200, 0, 0.1))) : 0;
var _vigint = power(1.5, 1.5 - _vig) * 18;
var _chrom_scale = crt_glitch ? (irandom_range(-4, 4) * clamp(crt_glitch / 5, 1, 5)) : chromStrength;

if (_chrom_scale == 0)
    _chrom_scale = 1;

var _filteramount = 0.1 + min(crt_glitch / 100, 0.1);
shader_set(shd_crt);
shader_set_uniform_f(shader_get_uniform(shd_crt, "texel"), 1 / screenwidth, 1 / screenheight);
shader_set_uniform_f(shader_get_uniform(shd_crt, "vignette_scale"), _vig);
shader_set_uniform_f(shader_get_uniform(shd_crt, "vignette_intensity"), _vigint);
shader_set_uniform_f(shader_get_uniform(shd_crt, "chromatic_scale"), _chrom_scale);
shader_set_uniform_f(shader_get_uniform(shd_crt, "filter_amount"), _filteramount);
shader_set_uniform_f(shader_get_uniform(shd_crt, "time"), crttimer);

if (screen_state != current_screen_state)
{
    current_screen_state = screen_state;
    star_bg_active = is_bg_active(current_screen_state);
}

if (star_bg_active)
{
    star_anim += star_anim_speed;
    bg_speed -= bg_speed_max;
    bg_speed_y += bg_speed_y_max;
    
    if (bg_speed < -640)
        bg_speed += 640;
    
    if (bg_speed_y > -480)
        bg_speed_y -= 480;
    
    scr_draw_sprite_tiled_area(spr_dw_tv_starbgtile, star_anim, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + view_wport[0], cameray() + room_height, 2, 2, c_white, 1);
}

if (screen_state == "desert_board")
{
    draw_sprite_ext(spr_gameshow_screen_pyramid, 0, camerax() + 10, cameray() - 40, 2, 2, 0, c_white, 1);
}
else if (screen_state == "game_controller")
{
    var version = 2;
    
    if (version == 0)
        draw_sprite_ext(spr_gameshow_screen_controller_sized1x, 0, camerax() + 116 + 4, cameray() + 24 + 20, 2, 2, 0, c_white, 1);
    
    if (version == 1)
        draw_sprite_ext(spr_gameshow_screen_controller_sized_full, 0, camerax() + 116 + 4, cameray() + 24 + 20, 1, 1, 0, c_white, 1);
    
    if (version == 2)
        draw_sprite_ext(spr_gameshow_screen_controller, 0, camerax() + 116, cameray() + 24, 1, 1, 0, c_white, 1);
}
else if (screen_state == "dark_fountain")
{
    screen_anim += screen_anim_speed;
    draw_sprite_ext(spr_gameshow_screen_dark_fountain, screen_anim, camerax() + 120, cameray() + 48, 2, 2, 0, c_white, 1);
}
else if (screen_state == "tv_fallen")
{
    draw_sprite_ext(spr_gameshow_screen_tv, 0, camerax() + 120, cameray() + 46, 2, 2, 0, c_white, 1);
}
else if (screen_state == "tv_sepia")
{
    draw_sprite_ext(spr_gameshow_screen_tv_sepia, 0, camerax() + 120, cameray() + 46, 2, 2, 0, c_white, 1);
}
else if (screen_state == "city_board")
{
    draw_sprite_ext(spr_gameshow_screen_city, 0, camerax() + 128, cameray() + 48, 2, 2, 0, c_white, 1);
}
else if (screen_state == "island_board")
{
    draw_sprite_ext(spr_gameshow_screen_island, 0, camerax() + 116, cameray() + 34, 2, 2, 0, c_white, 1);
}
else if (screen_state == "city_ruined")
{
    var ver = 1;
    
    if (ver == 0)
        draw_sprite_ext(spr_gameshow_screen_city_ruined, 0, camerax() + 146, cameray() - 6, 1, 1, 0, c_white, 1);
    
    if (ver == 1)
    {
        if (!variable_instance_exists(id, "__rtimer"))
            __rtimer = 0;
        
        __rtimer++;
        var maxalph = 0.3;
        var amt = maxalph - abs(sin(__rtimer / 30) * maxalph);
        draw_sprite_ext(spr_gameshow_screen_city_ruined_scaled, 0, camerax() + 124, cameray() + 0, 2, 2, 0, c_white, 1);
        draw_set_blend_mode(bm_add);
        draw_sprite_ext(spr_gameshow_screen_city_ruined_scaled, 0, camerax() + 124, cameray() + 0, 2, 2, 0, c_white, round(amt * 8) / 8);
        draw_set_blend_mode(bm_normal);
    }
}

if (is_logo_active(current_screen_state))
{
    screen_anim += screen_anim_speed;
    draw_sprite_ext(spr_gameshow_screen_logo, screen_anim, camerax() + 160, cameray() + 64, 2, 2, 0, merge_color(c_white, c_blue, 0.5), 0.5);
}
//
var mspace = 20;
//
if (screen_state == "round_complete")
{
    var shadcolor = 3934982;
    var shadalph = 0.65;
    var shadoff = 2;
    draw_set_font(fnt_8bit);
    draw_set_halign(fa_left);
    // var _offset = (global.lang == "ja") ? 30 : 0;
    var _offset = 30;
    //
    var _base_x_pos = camerax() + (view_wport[0] / 2);
    var _base_y_pos = (cameray() + (view_hport[0] / 2)) - 140;
    var xx = (_base_x_pos - 80 - 48) + _offset;
    var yy = _base_y_pos + 4;
    var roundtext = stringsetloc("ROUND", "obj_dw_gameshow_screen_slash_Draw_0_gml_127_0");
    var compltext = stringsetloc("COMPLETE!!", "obj_dw_gameshow_screen_slash_Draw_0_gml_128_0");
    var roundcompletetext15 = stringsetloc("YOU GOT", "obj_dw_gameshow_screen_slash_Draw_0_gml_129_0");
    var squishamt = 12;
    custom_text_timer++;
    var coltime = 15;
    var _col = merge_color(c_white, c_yellow, abs(sin(custom_text_timer / coltime)));
    var _col2 = merge_color(c_yellow, c_white, abs(sin((custom_text_timer + (coltime / 2)) / coltime)));
    var round_offset_x = 0;
    var round_offset_y = 0;
    draw_text_transformed_color(xx + 76 + shadoff + round_offset_x, (yy - 14) + shadoff + round_offset_y, round_text, 2, 2, 0, shadcolor, shadcolor, shadcolor, shadcolor, shadalph);
    draw_text_transformed_color(xx + 76 + round_offset_x, (yy - 14) + round_offset_y, round_text, 2, 2, 0, _col, _col, _col2, _col2, 1);
    draw_text_transformed_color((xx + shadoff) - squishamt, yy + shadoff, roundtext, 1, 1, 0, shadcolor, shadcolor, shadcolor, shadcolor, shadalph);
    draw_set_color(c_white);
    draw_text(xx - squishamt, yy, roundtext);
    draw_text_transformed_color(xx + 96 + shadoff + squishamt, yy + shadoff, compltext, 1, 1, 0, shadcolor, shadcolor, shadcolor, shadcolor, shadalph);
    draw_set_color(c_white);
    draw_text(xx + 96 + squishamt, yy, compltext);
    
    if (screen_sub_state == "next_board_2")
    {
        // var mspace = 18;
        var complete_offset_x = 0;
        var complete_offset_y = 0;
        draw_text_transformed_color(xx + 72 + shadoff + complete_offset_x, yy + (mspace * 1) + shadoff + complete_offset_y, text_next, 1, 1, 0, shadcolor, shadcolor, shadcolor, shadcolor, shadalph);
        draw_set_color(c_white);
        draw_text(xx + 72 + complete_offset_x, yy + (mspace * 1) + complete_offset_y, text_next);
        var _xloc = xx;
        var _yloc = yy + /*36*/mspace * 2;
        draw_text_transformed_color(_xloc + shadoff, _yloc + shadoff, text_round + " 2", 2, 2, 0, shadcolor, shadcolor, shadcolor, shadcolor, shadalph);
        draw_text_transformed_color(_xloc, _yloc, text_round + " 2", 2, 2, 0, _col2, _col, _col2, _col, 1);
    }
    else
    {
        // var mspace = 18;
        var complete_offset_x = 0;
        var complete_offset_y = 0;
        draw_text_transformed_color(xx + 72 + shadoff + complete_offset_x, yy + (mspace * 1) + shadoff + complete_offset_y, roundcompletetext15, 1, 1, 0, shadcolor, shadcolor, shadcolor, shadcolor, shadalph);
        draw_set_color(c_white);
        draw_text(xx + 72 + complete_offset_x, yy + (mspace * 1) + complete_offset_y, roundcompletetext15);
        var _xloc = xx;
        var _yloc = yy + /*36*/mspace * 2;
        draw_text_transformed_color(_xloc + shadoff, _yloc + shadoff, rank_text + "!!", 2, 2, 0, shadcolor, shadcolor, shadcolor, shadcolor, shadalph);
        draw_text_transformed_color(_xloc, _yloc, rank_text + "!!", 2, 2, 0, c_yellow, c_yellow, c_white, c_white, 1);
    }
    
    if (screen_sub_state == "breaking")
    {
        news_speed -= news_speed_max;
        
        if (news_speed < -700)
            news_speed += 700;
        
        scr_draw_sprite_tiled_area(spr_dw_gameshow_screen_news, 0, camerax() + 120 + news_speed, cameray() + 48, camerax() + 120, cameray() + 48, camerax() + 532, cameray() + 48 + 16, 1, 1, c_white, 1);
        scr_draw_sprite_tiled_area(spr_dw_gameshow_screen_news, 0, camerax() + 120 + news_speed, cameray() + 212, camerax() + 120, cameray() + 212, camerax() + 532, cameray() + 212 + 16, 1, 1, c_white, 1);
    }
    
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

if (screen_state == "round_complete_2")
{
    draw_set_font(fnt_8bit);
    draw_set_valign(fa_top);
    draw_set_halign(fa_center);
    var _base_x_pos = camerax() + (view_wport[0] / 2);
    var _base_y_pos = (cameray() + (view_hport[0] / 2)) - 140;
    var xx = _base_x_pos;
    var yy = _base_y_pos + 4;
    var shadcolor = 3934982;
    var shadalph = 0.65;
    var shadoff = 2;
    var roundcompletetext1 = stringsetloc("ROUND COMPLETE!!", "obj_dw_gameshow_screen_slash_Draw_0_gml_238_0");
    var roundcompletetext15 = stringsetloc("YOU GOT", "obj_dw_gameshow_screen_slash_Draw_0_gml_239_0");
    draw_text_transformed_color(xx + shadoff, yy + shadoff, roundcompletetext1, 1, 1, 0, shadcolor, shadcolor, shadcolor, shadcolor, shadalph);
    draw_text_transformed_color(xx + shadoff, yy + shadoff + /*18*/mspace, roundcompletetext15, 1, 1, 0, shadcolor, shadcolor, shadcolor, shadcolor, shadalph);
    draw_set_color(c_white);
    draw_text(xx, yy, roundcompletetext1);
    draw_text(xx, yy +  /*18*/mspace, roundcompletetext15);
    draw_set_color(c_white);
    
    if (screen_sub_state == "bonus_board")
    {
        draw_set_halign(fa_center);
        draw_text_transformed_color(xx + shadoff, yy + /*36*/mspace * 2 + shadoff, text_bonus_round, 1, 1, 0, shadcolor, shadcolor, shadcolor, shadcolor, shadalph);
        
        if (!sprite_exists(bonus_sprite))
        {
            if (!surface_exists(bg_surface))
                bg_surface = surface_create(camera_get_view_width(0), camera_get_view_height(0));
            
            surface_set_target(bg_surface);
            draw_set_color(c_white);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            draw_text_transformed(xx, yy + /*36*/mspace * 2, text_bonus_round, 1, 1, 0);
            surface_reset_target();
            bonus_sprite = sprite_create_from_surface(bg_surface, x, y, x + 180, y + 54, false, true, 0, 0);
            surface_free(bg_surface);
        }
        else
        {
            shader_set(shd_rainbow);
            _uniUV = shader_get_uniform(shd_rainbow, "u_uv");
            _uniTime = shader_get_uniform(shd_rainbow, "u_time");
            _uniSpeed = shader_get_uniform(shd_rainbow, "u_speed");
            _time -= 0.025;
            var uv = sprite_get_uvs(bonus_sprite, 0);
            shader_set_uniform_f(_uniUV, uv[0], uv[2]);
            shader_set_uniform_f(_uniSpeed, _speed);
            shader_set_uniform_f(_uniTime, _time);
            draw_text_transformed(xx, yy + /*36*/mspace * 2, text_bonus_round, 1, 1, 0);
            shader_reset();
        }
        
        custom_text_timer++;
        var coltime = 15;
        var _col = merge_color(c_white, c_yellow, abs(sin(custom_text_timer / coltime)));
        var _col2 = merge_color(c_yellow, c_white, abs(sin((custom_text_timer + (coltime / 2)) / coltime)));
        draw_text_transformed_color(xx + shadoff, yy + /*54*/mspace * 3 + shadoff, text_round + " 3", 2, 2, 0, shadcolor, shadcolor, shadcolor, shadcolor, shadalph);
        draw_text_transformed_color(xx, yy + /*54*/mspace * 3, text_round + " 3", 2, 2, 0, _col2, _col, _col2, _col, 1);
        
        if (cancelled)
            draw_sprite_ext(scr_84_get_sprite("spr_dw_tv_cancelled"), 0, xx, yy + 60, 1, 1, 0, c_white, 1);
    }
    else
    {
        draw_set_halign(fa_center);
        draw_text_transformed_color(xx + shadoff, yy + /*36*/mspace * 2 + shadoff, rank_text + " !!", 2, 2, 0, shadcolor, shadcolor, shadcolor, shadcolor, shadalph);
        draw_text_transformed_color(xx, yy + /*36*/mspace * 2, rank_text + " !!", 2, 2, 0, c_yellow, c_yellow, c_white, c_white, 1);
        draw_set_halign(fa_left);
    }
    
    if (screen_sub_state == "breaking")
    {
        news_speed -= news_speed_max;
        
        if (news_speed < -700)
            news_speed += 700;
        
        scr_draw_sprite_tiled_area(spr_dw_gameshow_screen_news, 0, camerax() + 120 + news_speed, cameray() + 48, camerax() + 120, cameray() + 48, camerax() + 532, cameray() + 48 + 16, 1, 1, c_white, 1);
        scr_draw_sprite_tiled_area(spr_dw_gameshow_screen_news, 0, camerax() + 120 + news_speed, cameray() + 212, camerax() + 120, cameray() + 212, camerax() + 532, cameray() + 212 + 16, 1, 1, c_white, 1);
    }
    
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

if (screen_state == "board_bonus")
{
    draw_set_font(scr_84_get_font("8bit"));
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    var _base_x_pos = (camerax() + (view_wport[0] / 2)) - 20;
    var _base_y_pos = (cameray() + (view_hport[0] / 2)) - 140;
    draw_text_transformed(_base_x_pos, _base_y_pos, text_round + "3", 1.6, 1.3, 0);
    draw_text_transformed(_base_x_pos, _base_y_pos + 26, text_complete, 1.6, 1.3, 0);
    draw_sprite_ext(spr_board_battle_results_exclamation, 0, _base_x_pos + 106, _base_y_pos + 10.1, 3, 3, 0, c_white, 1);
    draw_set_halign(fa_center);
    draw_text_transformed(_base_x_pos + 12, _base_y_pos + 54, text_tv_time, 1.6, 1.3, 0);
    draw_text_transformed(_base_x_pos, _base_y_pos + 54 + 26, text_the_end, 1.6, 1.3, 0);
    draw_set_font(scr_84_get_font("mainbig"));
    draw_sprite_ext(spr_board_battle_results_exclamation, 0, _base_x_pos + 94, _base_y_pos + 54 + 10.1, 3, 3, 0, c_white, 1);
    draw_sprite_ext(spr_board_battle_results_exclamation, 0, _base_x_pos + 94 + 20, _base_y_pos + 54 + 10.1, 3, 3, 0, c_white, 1);
    draw_sprite_ext(spr_board_battle_results_exclamation, 0, _base_x_pos + 94 + 20 + 20, _base_y_pos + 54 + 10.1, 3, 3, 0, c_white, 1);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

if (screen_state == "board_bonus_bonus")
{
    if (!sprite_exists(bonus_confirmed_sprite))
    {
        if (!surface_exists(bg_surface))
            bg_surface = surface_create(camera_get_view_width(0), camera_get_view_height(0));
        
        surface_set_target(bg_surface);
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        draw_text_transformed(x, y, text_bonus, 1.6, 1.3, 0);
        draw_text_transformed(x, y + /*18*/mspace, text_bonus_round, 1.6, 1.3, 0);
        draw_text_transformed(x, y + /*36*/mspace * 2, text_confirmed, 1.6, 1.3, 0);
        
        for (var i = 0; i < 7; i++)
            draw_sprite_ext(spr_board_battle_results_exclamation, 0, (x - 44) + (14 * i), y + 40 + 8 + 10.1, 2, 2, 0, c_white, 1);
        
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        surface_reset_target();
        bonus_confirmed_sprite = sprite_create_from_surface(bg_surface, x - string_width(text_bonus_round), y, x + string_width(text_bonus_round), y + 54, false, true, 0, 0);
        sprite_set_offset(bonus_confirmed_sprite, (sprite_get_width(bonus_confirmed_sprite) / 2) - 10, sprite_get_height(bonus_confirmed_sprite) / 2);
        surface_free(bg_surface);
    }
    else
    {
        shader_set(shd_rainbow);
        _uniUV = shader_get_uniform(shd_rainbow, "u_uv");
        _uniTime = shader_get_uniform(shd_rainbow, "u_time");
        _uniSpeed = shader_get_uniform(shd_rainbow, "u_speed");
        _time -= bonus_color_speed;
        var uv = sprite_get_uvs(bonus_confirmed_sprite, 0);
        shader_set_uniform_f(_uniUV, uv[0], uv[2]);
        shader_set_uniform_f(_uniSpeed, _speed);
        shader_set_uniform_f(_uniTime, _time);
        bonus_wiggle_timer += bonus_wiggle_speed;
        draw_sprite_ext(bonus_confirmed_sprite, 0, x + 240, y + 116, 2 + abs(sin(bonus_wiggle_timer / 8)), 2, sin(bonus_wiggle_timer / 8) * 2, c_white, 1);
        shader_reset();
    }
}

if (screen_state == "bonus_confirmed")
{
    if (!sprite_exists(bonus_confirmed_sprite))
    {
        if (!surface_exists(bg_surface))
            bg_surface = surface_create(camera_get_view_width(0), camera_get_view_height(0));
        
        surface_set_target(bg_surface);
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        draw_text_transformed(x, y, text_bonus_round, 1.6, 1.3, 0);
        draw_text_transformed(x, y + 24, text_confirmed, 1.6, 1.3, 0);
        
        for (var i = 0; i < 7; i++)
            draw_sprite_ext(spr_board_battle_results_exclamation, 0, (x - 44) + (14 * i), y + 40 + 10.1, 2, 2, 0, c_white, 1);
        
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        surface_reset_target();
        bonus_confirmed_sprite = sprite_create_from_surface(bg_surface, x - string_width(text_bonus_round), y, x + string_width(text_bonus_round), y + 54, false, true, 0, 0);
        sprite_set_offset(bonus_confirmed_sprite, (sprite_get_width(bonus_confirmed_sprite) / 2) - 10, sprite_get_height(bonus_confirmed_sprite) / 2);
        surface_free(bg_surface);
    }
    else
    {
        shader_set(shd_rainbow);
        _uniUV = shader_get_uniform(shd_rainbow, "u_uv");
        _uniTime = shader_get_uniform(shd_rainbow, "u_time");
        _uniSpeed = shader_get_uniform(shd_rainbow, "u_speed");
        _time -= 0.025;
        var uv = sprite_get_uvs(bonus_confirmed_sprite, 0);
        shader_set_uniform_f(_uniUV, uv[0], uv[2]);
        shader_set_uniform_f(_uniSpeed, _speed);
        shader_set_uniform_f(_uniTime, _time);
        siner++;
        draw_sprite_ext(bonus_confirmed_sprite, 0, x + 240, y + 112, 2 + abs(sin(siner / 8)), 2, sin(siner / 8) * 2, c_white, 1);
        shader_reset();
    }
}

if (white_overlay)
{
    draw_set_color(c_white);
    draw_set_alpha(white_overlay_alpha);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + view_wport[0], cameray() + view_hport[0], false);
    draw_set_alpha(1);
}

shader_reset();
draw_sprite_ext(spr_dw_gameshow_bg, 0, 0, 0, 2, 2, 0, c_white, 1);
draw_sprite_ext(spr_dw_gameshow_screen_vignette, 0, x + 18, y + 18, 1, 1, 0, c_white, 1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
