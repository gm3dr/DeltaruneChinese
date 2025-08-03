if (con == 1)
{
    logotimer++;
    draw_sprite_ext(IMAGE_LOGO_CENTER, 0, 160, 100, 1, 1, 0, c_white, 1);
    
    if ((logotimer % 15) == 1)
    {
        if (max_logo_pieces < array_length(logo_piece))
        {
            if (max_logo_pieces == 0)
            {
                snd_stop(snd_tv_static);
                snd_loop(snd_tv_static);
            }
            
            max_logo_pieces++;
        }
        
        if (max_logo_pieces > 1 && revealed_pieces < array_length(logo_piece))
        {
            revealed_pieces++;
            
            if (revealed_pieces == array_length(logo_piece))
                snd_stop(snd_tv_static);
        }
    }
    
    if (logotimer == 190)
        play_cheer();
    
    if (logotimer >= 190)
    {
        draw_set_font(fnt_mainbig);
        draw_set_color(c_white);
        draw_text_ext(camerax() + /*105*/130, cameray() + 120, /*"CHAPTER 3"*/"第3章", 10, 900);
        scr_84_set_draw_font("mainbig");
    }
    
    if (logotimer == 280)
        fade_out();
    
    if (logotimer == 370)
        exit_screen();
    
    draw_set_alpha(1);
    scr_draw_set_mask(true, true);
    
    for (var i = revealed_pieces; i < array_length(logo_piece); i++)
    {
        var _xx = logo_piece[i][0];
        var _char_width = logo_piece[i][1];
        var _yy_offset = logo_piece[i][2];
        ossafe_fill_rectangle(_xx, char_y_pos + _yy_offset, _xx + _char_width, char_y_pos + char_height);
    }
    
    scr_draw_in_mask_begin();
    static_anim += 0.4;
    draw_sprite_ext(spr_static_effect, static_anim, 40, 0, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_static_effect, static_anim, 150, 0, 1, 1, 0, c_white, 1);
    scr_draw_in_mask_end();
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_color(c_black);
    
    for (var i = max_logo_pieces; i < array_length(logo_piece); i++)
    {
        var _xx = logo_piece[i][0];
        var _char_width = logo_piece[i][1];
        var _yy_offset = logo_piece[i][2];
        ossafe_fill_rectangle(_xx, char_y_pos + _yy_offset, _xx + _char_width, char_y_pos + char_height);
    }
}

draw_set_alpha(fade_alpha);
ossafe_fill_rectangle(-10, -10, room_width + 10, room_height + 10);
draw_set_alpha(1);
draw_set_color(c_white);
