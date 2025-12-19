function scr_rhythmgame_add_lyric(arg0, arg1, arg2 = "")
{
    with (obj_rhythmgame)
    {
        if (arg2 == "")
        {
            arg2 = arg1;
            arg1 = string_replace_all(arg1, "-", "");
            arg1 = string_replace_all(arg1, "<", "");
            arg1 = string_replace_all(arg1, ">", "");
            arg1 = string_replace_all(arg1, "＜", "");
            arg1 = string_replace_all(arg1, "＞", "");
            arg1 = string_replace_all(arg1, "+", "");
            arg1 = string_replace_all(arg1, "＋", "");
        }
        
        lyric_time[lyric_count] = arg0;
        lyrics[lyric_count] = arg1;
        censored_lyrics[lyric_count] = arg2;
        lyric_count++;
    }
}

function scr_rhythmgame_clear_lyric(arg0)
{
    with (obj_rhythmgame)
    {
        lyric_time[lyric_count] = arg0;
        lyrics[lyric_count] = "";
        censored_lyrics[lyric_count] = "";
        lyric_count++;
    }
}

function scr_rhythmgame_clear_all_lyrics()
{
    with (obj_rhythmgame)
    {
        lyric_time = [];
        lyrics = [];
        censored_lyrics = [];
        lyric_start = [];
        lyric_start[0] = 0;
        lyric_end = [];
        lyric_end[0] = 0;
        lyric_count = 0;
        current_lyric = "";
        censored_lyric = "";
    }
}

function scr_rhythmgame_parse_lyrics(arg0)
{
    with (obj_rhythmgame)
    {
        array_resize(string_index, 0);
        string_index[0] = 0;
        var _char_count = 0;
        var _space = true;
        
        for (i = 0; i < string_length(_mainstring); i++)
        {
            var _letter = string_char_at(_mainstring, i);
            
            if (_space && _letter != " " && _letter != "　")
            {
                string_index[_char_count] = i;
                _space = false;
                _char_count++;
            }
            else if ((_letter == " " || _letter == "　") && !_space)
            {
                string_index[_char_count] = i;
                _space = true;
                _char_count++;
            }
        }
        
        if (!_space)
        {
            string_index[_char_count] = string_length(_mainstring) - 1;
            char_count++;
        }
    }
}

function scr_rhythmgame_draw_lyrics(arg0, arg1, arg2)
{
    if (is_undefined(lyrics_base_surface) || !surface_exists(lyrics_base_surface))
        lyrics_base_surface = surface_create(400, 100);
    
    if (is_undefined(lyrics_main_surface) || !surface_exists(lyrics_main_surface))
        lyrics_main_surface = surface_create(400, 100);
    
    var _xx = 200;
    var _yy = 50;
    surface_set_target(lyrics_main_surface);
    draw_clear_alpha(c_black, 0);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_black);
    var _scale = arg2;
    scr_draw_text_monospace(_xx - _scale, _yy, arg0);
    scr_draw_text_monospace(_xx + _scale, _yy, arg0);
    scr_draw_text_monospace(_xx, _yy - _scale, arg0);
    scr_draw_text_monospace(_xx, _yy + _scale, arg0);
    draw_set_color(c_white);
    scr_draw_text_monospace(200, _yy, arg0);
    surface_reset_target();
    
    if (is_undefined(lyrics_sung_surface) || !surface_exists(lyrics_sung_surface))
        lyrics_sung_surface = surface_create(400, 100);
    
    surface_set_target(lyrics_sung_surface);
    var _len = string_length(arg0);
    scr_draw_text_monospace(_xx - _scale, _yy, arg1, 8, 18, _len);
    scr_draw_text_monospace(_xx + _scale, _yy, arg1, 8, 18, _len);
    scr_draw_text_monospace(_xx, _yy - _scale, arg1, 8, 18, _len);
    scr_draw_text_monospace(_xx, _yy + _scale, arg1, 8, 18, _len);
    draw_set_color(c_blue);
    scr_draw_text_monospace(_xx, _yy, arg1, 8, 18, _len, true);
    draw_set_color(c_white);
    surface_reset_target();
}

function scr_draw_text_monospace(arg0, arg1, arg2, arg3 = 8, arg4 = 18, arg5 = -1, arg6 = false, arg7 = 2, arg8 = 2, arg9 = -1)
{
    arg3 *= arg7;
    arg4 *= arg8;
    var _length = (arg5 > 0) ? arg5 : string_length(arg2);
    var _width = _length * arg3;
    var _writex = arg0;
    var _writey = arg1;
    var _hspace = arg3;
    var _vspace = arg4;
    var _linebreak = string_pos("#", arg2);
    var _chiisai = "ゃょゅャュョぁぃぅぇぉァィゥェォゎヮ";
    var _timesyntax = "-<>+~＜＞＋～";
    // var _ja = global.lang == "ja";
    var _ja = true;
    //
    var _syllables = 0;
    var _single = false;
    var _kanji_substring = false;
    var _chiisai_count = 0;
    
    if (_linebreak > 0)
    {
        _writey -= ((_vspace / 2) - 6);
        
        if (arg5 == 0)
            _length--;
        
        if (arg9 == 0)
            _width = (_linebreak - 1) * arg3;
    }
    
    var _timing = arg6;
    
    if (_timing)
    {
        array_resize(lyric_start, 0);
        array_resize(lyric_end, 0);
        line_switch = 0;
    }
    
    var _index = 0;
    var _midword = false;
    
    if (draw_get_halign() == 1)
        _writex += ((-_width / 2) + (arg3 / 2));
    else if (draw_get_halign() == 2)
        _writex += (-_width + arg3);
    
    var _scale = 1;
    var _prealign = true;
    
    for (i = 1; i <= string_length(arg2); i++)
    {
        var _letter = string_char_at(arg2, i);
        
        if (_prealign)
        {
            if (_letter == " " || _letter == "　")
            {
                _length--;
                _writex -= arg3;
                continue;
            }
            else
            {
                _prealign = false;
            }
        }
        
        if (_letter == "[")
        {
            i++;
            var _subscale = real(string_digits(string_char_at(arg2, i)));
            i += 2;
            var _subcount = 0;
            
            for (i2 = i; i2 <= string_length(arg2); i2++)
            {
                var _subletter = string_char_at(arg2, i2);
                
                if (_subletter == "]")
                    break;
                else if (string_pos(_subletter, _timesyntax) <= 0)
                    _subcount++;
            }
            
            _scale = _subscale / _subcount;
            _hspace = arg3 * _scale;
            _writex += ((-arg3 / 2) + (_hspace / 2));
            _letter = string_char_at(arg2, i);
        }
        else if (_letter == "]")
        {
            _scale = 1;
            _writex += ((-_hspace / 2) + (arg3 / 2));
            _hspace = arg3;
            continue;
        }
        
        if (_letter == " " || _letter == "　")
        {
            if (_midword && _timing)
            {
                if (_ja && _syllables > 0 && !_kanji_substring)
                {
                    _index = scr_rhythmgame_kanji_timing(_index, _syllables, _writex, _hspace);
                    _syllables = 0;
                }
                else
                {
                    lyric_end[_index] = (_writex - (_hspace / 2)) + 2;
                    _index++;
                }
                
                _midword = false;
            }
        }
        else if (_ja && (_letter == "<" || _letter == "＜"))
        {
            if (_timing)
            {
                _single = true;
                
                if (_midword)
                {
                    lyric_end[_index] = (_writex - (_hspace / 2)) + 2;
                    _index++;
                    _midword = false;
                }
                
                _kanji_substring = true;
            }
            
            continue;
        }
        else if (_ja && (_letter == "+" || _letter == "＋" || _letter == "～" || _letter == "~"))
        {
            if (_timing)
            {
                if (_kanji_substring)
                    _single = false;
                
                // if (!_kanji_substring && _syllables == 0)
                //     _syllables += 2;
                // else
                    _syllables++;
            }
            
            continue;
        }
        else if (_ja && (_letter == ">" || _letter == "＞"))
        {
            if (_timing)
            {
                if (_single)
                {
                    _syllables = 1;
                    _single = false;
                }
                
                if (_syllables > 0)
                {
                    _index = scr_rhythmgame_kanji_timing(_index, _syllables, _writex, _hspace);
                    _syllables = 0;
                }
                
                _kanji_substring = false;
                _midword = false;
            }
            
            continue;
        }
        else if (_letter == "-")
        {
            if (_timing)
            {
                lyric_end[_index] = (_writex - (_hspace / 2)) + 2;
                _index++;
                lyric_start[_index] = (_writex - (_hspace / 2)) + 2;
            }
            
            continue;
        }
        else if (_letter == "#")
        {
            if (_timing)
            {
                if (_midword)
                {
                    _midword = false;
                    lyric_end[_index] = (_writex - (_hspace / 2)) + 2;
                    _index++;
                }
                
                line_switch = _index;
            }
            
            _writey = arg1 + ((_vspace / 2) - 6);
            
            if (arg9 > 0)
                _length = arg9;
            else
                _length = ((arg5 > 0) ? arg5 : string_length(arg2)) - _linebreak;
            
            _width = _length * arg3;
            _writex = (arg0 - (_width / 2)) + (arg3 / 2);
            continue;
        }
        else
        {
            if (_ja)
            {
                if (_timing)
                {
                    var _is_chiisai = string_pos(_letter, _chiisai) > 0;
                    
                    if (_is_chiisai)
                        _chiisai_count++;
                    
                    if (!_midword && _is_chiisai)
                        debug_print("WARNING! chiisai STARTED A STRING");
                    
                    if (_kanji_substring)
                    {
                        _syllables++;
                    }
                    else if (_midword && _syllables > 0 && !_kanji_substring)
                    {
                        _index = scr_rhythmgame_kanji_timing(_index, _syllables, _writex, _hspace);
                        _syllables = 0;
                        _midword = false;
                    }
                    else if (_midword && !_is_chiisai)
                    {
                        lyric_end[_index] = _writex - (_hspace / 2) - 2;
                        _index++;
                        _midword = false;
                    }
                    
                    if (!_midword)
                    {
                        lyric_start[_index] = _writex - (_hspace / 2) - 2;
                        _midword = true;
                    }
                }
            }
            else if (!_midword && _timing)
            {
                lyric_start[_index] = _writex - (_hspace / 2) - 2;
                _midword = true;
            }
            
            if (!_timing)
                draw_text_transformed(_writex, _writey, _letter, _scale * arg7, arg8, 0);
        }
        
        _writex += _hspace;
    }
    
    if (_midword && _timing)
    {
        if (_ja && _syllables > 0)
        {
            _index = scr_rhythmgame_kanji_timing(_index, _syllables, _writex, _hspace);
            _syllables = 0;
        }
        else
        {
            lyric_end[_index] = (_writex - (arg3 / 2)) + 2;
        }
    }
    
    if (array_length(lyric_start) != array_length(lyric_end))
        debug_print("WARNING!!! Lyric start/end array mismatch!!");
}

function scr_rhythmgame_kanji_timing(arg0, arg1, arg2, arg3)
{
    var _substart = lyric_start[arg0];
    var _subend = (arg2 - (arg3 / 2)) + 2;
    var _subpos = 0;
    
    for (var _sylb = 1; _sylb <= arg1; _sylb++)
    {
        _subpos = round_to_multiple(lerp(_substart, _subend, _sylb / arg1), 2);
        lyric_end[arg0] = _subpos;
        arg0++;
        
        if (_sylb < arg1)
            lyric_start[arg0] = round(_subpos);
    }
    
    return arg0;
}
