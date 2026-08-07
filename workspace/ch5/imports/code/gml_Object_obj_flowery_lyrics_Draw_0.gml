x = camerax() + 320;
y = cameray() + 30;

if ((lyrics_index + 1) < lyric_count && trackpos >= lyric_time[lyrics_index + 1])
{
    lyrics_index++;
    
    while ((lyrics_index + 1) < lyric_count && trackpos >= lyric_time[lyrics_index + 1])
        lyrics_index++;
    
    current_lyric = lyrics[lyrics_index];
    display_lyric = current_lyric;
    timed_lyric = current_lyric;
    update_lyrics = true;
    started = true;
    current_lyric = string_replace_all(current_lyric, "-", "");
    current_lyric = string_replace_all(current_lyric, "<", "");
    current_lyric = string_replace_all(current_lyric, ">", "");
    current_lyric = string_replace_all(current_lyric, "＜", "");
    current_lyric = string_replace_all(current_lyric, "＞", "");
    current_lyric = string_replace_all(current_lyric, "+", "");
    current_lyric = string_replace_all(current_lyric, "＋", "");
}
else if (lyrics_index > 0 && trackpos < lyric_time[1])
{
    current_lyric = lyrics[0];
    timed_lyric = lyrics[0];
    display_lyric = lyrics[0];
    lyrics_index = 0;
    lyric_start_index = 0;
    update_lyrics = true;
    noteindex = 0;
}

if (scr_debug() && keyboard_check_pressed(ord("D")))
{
    lyric_start = [];
    lyric_start[0] = 0;
    lyric_end = [];
    lyric_end[0] = 0;
    noteindex = 0;
    lyrics_index = 0;
    lyric_start_index = 0;
    current_lyric = "";
    timed_lyric = "";
    audio_sound_set_track_position(global.batmusic[1], 20);
    trackpos = 20;
    
    with (obj_flowery_towery_pillars)
        trackpos = 20;
}

if (scr_debug() && keyboard_check_pressed(ord("E")))
{
    lyric_start = [];
    lyric_start[0] = 0;
    lyric_end = [];
    lyric_end[0] = 0;
    noteindex = 0;
    lyrics_index = 0;
    lyric_start_index = 0;
    current_lyric = "";
    timed_lyric = "";
    audio_sound_set_track_position(global.batmusic[1], 94);
    trackpos = 94;
    
    with (obj_flowery_towery_pillars)
        trackpos = 94;
}

if (image_alpha == 0)
    exit;

var _refresh_surface = false;

if (!surface_exists(lyric_surface[0]))
{
    lyric_surface[0] = surface_create(640, 100);
    lyric_surface[1] = surface_create(640, 100);
    _refresh_surface = true;
}

if (!surface_exists(render_surf))
    render_surf = surface_create(640, 100);

if (current_lyric != "" && lyric_count > 0)
{
    var _len = string_length(current_lyric);
    var _len2 = 0;
    
    if (string_pos("#", current_lyric) > 0)
    {
        _len = string_pos("#", current_lyric) - 1;
        _len2 = string_length(current_lyric) - (_len + 1);
    }
    
    var _textx = 320;
    var _texty = 50;
    var _maxlength = array_length(lyric_end);
    
    if (_maxlength == 0)
        exit;
    
    var _current_note = max(0, _maxlength - 1);
    var _lerp = 1;
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(scr_84_get_font("main"));
    
    if (update_lyrics || _refresh_surface)
    {
        if (update_lyrics)
        {
            var _lyric_start_time = max(0, lyric_time[lyrics_index]);
            
            for (var i = lyric_start_index; i < maxnote; i++)
            {
                if ((_lyric_start_time + 0.03) < noteend[i])
                {
                    lyric_start_index = i;
                    break;
                }
            }
        }
        
        var _hspace = 16;//(global.lang == "ja") ? 16 : 8;
        scr_draw_text_monospace(_textx, _texty, timed_lyric, _hspace, 18, _len, true, 2, 2, _len2);
        _maxlength = array_length(lyric_end);
        _current_note = clamp(_current_note, 0, _maxlength - 1);
        surface_set_target(lyric_surface[0]);
        draw_clear_alpha(c_black, 0);
        draw_set_alpha(1);
        draw_set_color(c_white);
        scr_draw_text_monospace(320, 50, current_lyric, _hspace, 18, _len, false, 2, 2, _len2);
        surface_reset_target();
        surface_set_target(lyric_surface[1]);
        draw_clear_alpha(c_black, 0);
        draw_set_color(c_white);
        scr_draw_text_monospace(320, 50, timed_lyric, _hspace, 18, _len, false, 2, 2, _len2);
        surface_reset_target();
        update_lyrics = false;
    }
    
    for (var i = 0; i < _maxlength; i++)
    {
        var _index = i + lyric_start_index;
        
        if (_index >= maxnote)
            break;
        
        if (trackpos < noteend[_index])
        {
            _current_note = clamp(i, 0, _maxlength - 1);
            _lerp = clamp01(inverselerp(notetime[_index], noteend[_index], trackpos));
            break;
        }
    }
    
    var _progress = lerp(lyric_start[_current_note], lyric_end[_current_note], _lerp);
    
    if (_current_note == 0 && trackpos < notetime[lyric_start_index])
        _progress = _textx - 320;
    
    if ((_textx % 2) == 1)
        _progress = round_to_multiple(_progress + 1, 2) - 1;
    else
        _progress = round_to_multiple(_progress, 2);
    
    surface_set_target(render_surf);
    draw_clear_alpha(c_black, 0);
    var _left = 0;
    var _width = _progress;
    var _top = 0;
    draw_set_color(c_black);
    draw_surface_ext(lyric_surface[0], _left - 2, _top, 1, 1, 0, c_black, 1);
    draw_surface_ext(lyric_surface[0], _left + 2, _top, 1, 1, 0, c_black, 1);
    draw_surface_ext(lyric_surface[0], _left, _top - 2, 1, 1, 0, c_black, 1);
    draw_surface_ext(lyric_surface[0], _left, _top + 2, 1, 1, 0, c_black, 1);
    draw_surface_ext(lyric_surface[0], _left, _top, 1, 1, 0, c_yellow, 1);
    var _textcol = 32768;
    var _extra_pow = 0;
    _top += 2;
    
    if (lyrics_index == 18 || lyrics_index == 37)
    {
        var _glowstart = 71;
        
        if (lyrics_index == 37)
            _glowstart = 191;
        
        _extra_pow = clamp01(trackpos - _glowstart);
        _textcol = merge_color(c_green, c_white, _extra_pow);
    }
    
    draw_surface_part_ext(lyric_surface[1], _left, _top, _width - 2, 100, _left + 2, _top, 1, 1, 16777215, 1);
    draw_surface_part_ext(lyric_surface[1], _left, _top, _width + 2, 100, _left - 2, _top, 1, 1, 16777215, 1);
    draw_surface_part_ext(lyric_surface[1], _left, _top, _width, 100, _left, _top - 2, 1, 1, 16777215, 1);
    draw_surface_part_ext(lyric_surface[1], _left, _top, _width, 100, _left, _top + 2, 1, 1, 16777215, 1);
    draw_surface_part_ext(lyric_surface[1], _left, _top, _width, 100, _left, _top, 1, 1, _textcol, 1);
    surface_reset_target();
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    
    if (trackpos >= 166 || (trackpos >= 46 && trackpos < 120))
        strength = scr_movetowards(strength, 1, 0.015);
    else if (strength > 0)
        strength = 0;
    
    var _alpha = lerp(0.6, 1, strength);
    draw_surface_centered_ext(render_surf, x, y, 1, 1, 0, 16777215, image_alpha * _alpha);
    
    if (strength > 0)
    {
        var _count = 8;
        gpu_set_blendmode(bm_add);
        
        for (var i = 0; i < _count; i++)
        {
            var _pow = (i + 1) / _count;
            var _scale = 1 + ((strength * _pow) / 2) + (beat / 10);
            draw_surface_centered_ext(render_surf, x, y, _scale, _scale, 0, 16777215, ((0.2 * strength * (1 - _pow)) + (_extra_pow / 5)) * image_alpha * _alpha);
        }
        
        gpu_set_blendmode(bm_normal);
    }
}
else if (strength > 0)
{
    draw_surface_centered_ext(render_surf, x, y, 1, 1, 0, 16777215, image_alpha * strength);
    var _count = 8;
    gpu_set_blendmode(bm_add);
    
    for (var i = 0; i < _count; i++)
    {
        var _pow = (i + 1) / _count;
        var _scale = 1 + ((strength * _pow) / 2) + (beat / 10);
        draw_surface_centered_ext(render_surf, x, y, _scale, _scale, 0, 16777215, clamp01(0.4 * strength * (1 - _pow) * image_alpha));
    }
    
    gpu_set_blendmode(bm_normal);
    strength -= 0.05;
}
