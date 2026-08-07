if (draw_lyrics && current_lyric != "" && i_ex(vocals) && lyric_count > 0)
{
    var _len = string_length(current_lyric);
    var _len2 = 0;
    
    if (string_pos("#", current_lyric) > 0)
    {
        _len = string_pos("#", current_lyric) - 1;
        _len2 = string_length(current_lyric) - (_len + 1);
    }
    
    var _textx = camerax() + 320;
    var _texty = cameray() + 420;
    var _maxlength = array_length(lyric_end);
    
    if (_maxlength == 0)
        exit;
    
    var _current_note = max(0, _maxlength - 1);
    var _lerp = 1;
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(scr_84_get_font("main"));
    
    if (update_lyrics)
    {
        var _lyric_start_time = max(0, lyric_time[lyrics_index - 1]);
        
        with (vocals)
        {
            for (i = other.lyric_start_index; i < maxnote; i++)
            {
                if ((_lyric_start_time + 0.03) < noteend[i])
                {
                    other.lyric_start_index = i;
                    break;
                }
            }
        }
        
        if (is_undefined(lyric_surface) || !surface_exists(lyric_surface))
            lyric_surface = surface_create(640, 100);
        
        var _hspace = 16;//(global.lang == "ja") ? 16 : 8;
        scr_draw_text_monospace(_textx, _texty, censored_lyric, _hspace, 18, _len, true, 2, 2, _len2);
        _maxlength = array_length(lyric_end);
        _current_note = max(0, _maxlength - 1);
        surface_set_target(lyric_surface);
        draw_clear(c_black);
        draw_set_color(c_white);
        scr_draw_text_monospace(320, 50, current_lyric, _hspace, 18, _len, false, 2, 2, _len2);
        surface_reset_target();
        lyric_sprite[0] = sprite_create_from_surface(lyric_surface, 0, 0, 640, 100, true, false, 320, 50);
        surface_set_target(lyric_surface);
        draw_clear(c_black);
        draw_set_color(c_white);
        scr_draw_text_monospace(320, 50, censored_lyric, _hspace, 18, _len, false, 2, 2, _len2);
        surface_reset_target();
        lyric_sprite[1] = sprite_create_from_surface(lyric_surface, 0, 0, 640, 100, true, false, 320, 50);
        update_lyrics = false;
    }
    
    with (vocals)
    {
        for (i = 0; i < _maxlength; i++)
        {
            var _index = i + other.lyric_start_index;
            
            if (_index >= maxnote)
                break;
            
            if (other.trackpos < noteend[_index])
            {
                _current_note = clamp(i, 0, _maxlength - 1);
                _lerp = clamp01(inverselerp(notetime[_index], noteend[_index], other.trackpos));
                scr_debug_print_persistent("lerp", string(notetime[_index]) + " - " + string(noteend[_index]) + " - " + string(_lerp));
                break;
            }
        }
    }
    
    var _progress = lerp(lyric_start[_current_note], lyric_end[_current_note], _lerp);
    
    if (_current_note == 0 && trackpos < vocals.notetime[lyric_start_index])
        _progress = _textx - 320;
    
    scr_draw_set_mask(false);
    ossafe_fill_rectangle(_textx - 320, _texty - 48, _textx + 320, _texty + 48);
    draw_set_alpha(1);
    
    if (_len2 > 0)
    {
        if (_current_note < line_switch)
        {
            ossafe_fill_rectangle(_progress, _texty - 48, _textx + 320, _texty);
            ossafe_fill_rectangle(_textx - 320, _texty, _textx + 320, _texty + 48);
        }
        else
        {
            ossafe_fill_rectangle(_progress, _texty, _textx + 320, _texty + 48);
        }
    }
    else
    {
        ossafe_fill_rectangle(_progress, _texty - 24, _textx + 320, _texty + 24);
    }
    
    scr_draw_in_mask_begin();
    draw_set_color(c_black);
    draw_sprite_ext(lyric_sprite[0], 0, _textx - 2, _texty, 1, 1, 0, c_black, 1);
    draw_sprite_ext(lyric_sprite[0], 0, _textx + 2, _texty, 1, 1, 0, c_black, 1);
    draw_sprite_ext(lyric_sprite[0], 0, _textx, _texty - 2, 1, 1, 0, c_black, 1);
    draw_sprite_ext(lyric_sprite[0], 0, _textx, _texty + 2, 1, 1, 0, c_black, 1);
    draw_sprite_ext(lyric_sprite[0], 0, _textx, _texty, 1, 1, 0, c_white, 1);
    scr_draw_in_mask_end();
    scr_draw_set_mask(false);
    ossafe_fill_rectangle(_textx - 320, _texty - 24, _textx + 320, _texty + 24);
    draw_set_alpha(1);
    
    if (_len2 > 0)
    {
        if (_current_note < line_switch)
        {
            ossafe_fill_rectangle(_textx - 320, _texty - 48, _progress, _texty);
        }
        else
        {
            ossafe_fill_rectangle(_textx - 320, _texty - 48, _textx + 320, _texty);
            ossafe_fill_rectangle(_textx - 320, _texty, _progress, _texty + 48);
        }
    }
    else
    {
        ossafe_fill_rectangle(_textx - 320, _texty - 24, _progress, _texty + 24);
    }
    
    scr_draw_in_mask_begin();
    draw_sprite_ext(lyric_sprite[1], 0, _textx - 2, _texty, 1, 1, 0, c_white, 1);
    draw_sprite_ext(lyric_sprite[1], 0, _textx + 2, _texty, 1, 1, 0, c_white, 1);
    draw_sprite_ext(lyric_sprite[1], 0, _textx, _texty - 2, 1, 1, 0, c_white, 1);
    draw_sprite_ext(lyric_sprite[1], 0, _textx, _texty + 2, 1, 1, 0, c_white, 1);
    draw_sprite_ext(lyric_sprite[1], 0, _textx, _texty, 1, 1, 0, c_blue, 1);
    scr_draw_in_mask_end();
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}
