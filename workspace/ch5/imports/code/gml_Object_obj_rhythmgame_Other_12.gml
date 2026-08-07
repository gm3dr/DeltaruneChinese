if (!song_done && draw_lyrics && current_lyric != "" && i_ex(vocals) && lyric_count > 0)
{
    var _len = string_length(current_lyric);
    var _len2 = 0;
    
    if (string_pos("#", current_lyric) > 0)
    {
        _len = string_pos("#", current_lyric) - 1;
        _len2 = string_length(current_lyric) - (_len + 1);
    }
    
    var _textx = camerax();
    var _texty = (cameray() + 420) - 50;
    var _maxlength = array_length(lyric_end);
    
    if (_maxlength == 0)
        exit;
    
    var _current_note = max(0, _maxlength - 1);
    var _lerp = 1;
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(scr_84_get_font("main"));
    var _refresh_surface = false;
    
    if (is_undefined(lyric_raw) || !surface_exists(lyric_raw) || array_length(lyric_surface) == 0 || is_undefined(lyric_surface[0]) || !surface_exists(lyric_surface[0]))
        _refresh_surface = true;
    
    if (update_lyrics || _refresh_surface)
    {
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
        }
        
        if (is_undefined(lyric_raw) || !surface_exists(lyric_raw))
            lyric_raw = surface_create(640, 100);
        
        if (array_length(lyric_surface) == 0 || is_undefined(lyric_surface[0]) || !surface_exists(lyric_surface[0]))
        {
            lyric_surface[0] = surface_create(640, 100);
            lyric_surface[1] = surface_create(640, 100);
        }
        
        var _hspace = 16;//(global.lang == "ja") ? 16 : 8;
        scr_draw_text_monospace(_textx, _texty, censored_lyric, _hspace, 18, _len, true, 2, 2, _len2);
        _maxlength = array_length(lyric_end);
        _current_note = max(0, _maxlength - 1);
        surface_set_target(lyric_raw);
        draw_clear_alpha(c_black, 0);
        draw_set_color(c_white);
        scr_draw_text_monospace(320, 50, current_lyric, _hspace, 18, _len, false, 2, 2, _len2);
        surface_reset_target();
        surface_set_target(lyric_surface[0]);
        draw_clear_alpha(c_black, 0);
        draw_surface_ext(lyric_raw, -2, 0, 1, 1, 0, c_black, 1);
        draw_surface_ext(lyric_raw, 2, 0, 1, 1, 0, c_black, 1);
        draw_surface_ext(lyric_raw, 0, -2, 1, 1, 0, c_black, 1);
        draw_surface_ext(lyric_raw, 0, 2, 1, 1, 0, c_black, 1);
        draw_surface_ext(lyric_raw, 0, 0, 1, 1, 0, c_white, 1);
        surface_reset_target();
        surface_set_target(lyric_raw);
        draw_clear_alpha(c_black, 0);
        draw_set_color(c_white);
        
        if (draw_lyrics)
            scr_draw_text_monospace(320, 50, censored_lyric, _hspace, 18, _len, false, 2, 2, _len2);
        else
            scr_draw_text_monospace(320, 50, current_lyric, _hspace, 18, _len, false, 2, 2, _len2);
        
        surface_reset_target();
        surface_set_target(lyric_surface[1]);
        draw_clear_alpha(c_black, 0);
        draw_surface_ext(lyric_raw, -2, 0, 1, 1, 0, c_white, 1);
        draw_surface_ext(lyric_raw, 2, 0, 1, 1, 0, c_white, 1);
        draw_surface_ext(lyric_raw, 0, -2, 1, 1, 0, c_white, 1);
        draw_surface_ext(lyric_raw, 0, 2, 1, 1, 0, c_white, 1);
        draw_surface_ext(lyric_raw, 0, 0, 1, 1, 0, c_blue, 1);
        surface_reset_target();
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
                break;
            }
        }
    }
    
    var _progress = lerp(lyric_start[_current_note], lyric_end[_current_note], _lerp) + 320;
    
    if (_current_note == 0 && trackpos < vocals.notetime[lyric_start_index])
        _progress = _textx;
    
    if ((_textx % 2) == 1)
        _progress = round_to_multiple(_progress + 1, 2) - 1;
    else
        _progress = round_to_multiple(_progress, 2);
    
    draw_set_alpha(1);
    draw_set_color(c_black);
    var _left = _progress - _textx;
    var _twidth = 640 - _left;
    draw_surface_part_ext(lyric_surface[0], _left, 0, _twidth, 100, _progress, _texty, 1, 1, 16777215, 1);
    draw_set_alpha(1);
    draw_surface_part_ext(lyric_surface[1], 0, 0, _left, 100, _textx, _texty, 1, 1, 16777215, 1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}
