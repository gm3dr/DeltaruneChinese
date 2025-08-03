function scr_rhythmgame_draw(arg0, arg1, arg2 = false)
{
    scr_rhythmgame_draw_backing(arg0, arg1, arg2);
    
    if (!arg2)
        scr_rhythmgame_draw_combo(arg1);
    
    scr_rhythmgame_draw_chart(arg0, arg1, arg2);
}

function scr_rhythmgame_draw_backing(arg0, arg1, arg2 = false, arg3 = 0)
{
    if (arg2)
        fade = 0;
    
    if (fade == 1 && brightness == 1)
        draw_set_color(c_gray);
    else
        draw_set_color(merge_color(c_black, c_gray, fade * brightness));
    
    var _gray = merge_color(c_black, c_gray, brightness);
    draw_set_color(c_black);
    var _flash = 0;
    
    if (invc > 0 && fade == 1)
        _flash = remap_clamped(0, 6, 0, 1, hurt_flash);
    
    draw_set_alpha(0.75);
    ossafe_fill_rectangle(arg1 - 40, bottomy - 200, arg1 + 40, bottomy + 50, false);
    draw_set_alpha(1);
    draw_set_blend_mode(bm_normal);
    var whitebar = -1;
    var linegap = arg0 * notespacing * 16;
    var linestart = (bottomy - linegap) + (((trackpos - startoffset) % notespacing) * arg0);
    var whitebarstart = (bottomy - linegap) + (((trackpos - startoffset) % (notespacing * 4)) * arg0);
    draw_set_color(_gray);
    
    for (var i = 0; i < 20; i++)
    {
        var liney = linestart + (notespacing * arg0 * i);
        
        if (!arg2 && (liney < (bottomy - 200) || liney > (bottomy + 50)))
            continue;
        
        draw_set_color(_gray);
        d_line(arg1 - 40, liney, arg1 + 40, liney);
    }
    
    var nextBar = floor(trackpos / meter);
    
    for (var i = 0; i < 5; i++)
    {
        var liney = whitebarstart + (notespacing * 4 * arg0 * i);
        
        if (arg2)
        {
            draw_text(arg1 - 70, liney - 1 - 8, (nextBar - i) + 4 + 1);
            draw_text(arg1 + 70, liney - 1 - 8, (((nextBar - i) + 4) * meter) - 0.01);
        }
        
        if (!arg2 && ((liney - 1) < (bottomy - 200) || (liney + 1) > (bottomy + 50)))
            continue;
        
        ossafe_fill_rectangle(arg1 - 40, liney - 1, arg1 + 40, liney + 1, false);
    }
    
    if (_flash > 0)
    {
        draw_set_blend_mode(bm_add);
        var _flashCol = merge_color(c_black, c_red, _flash * fade * brightness);
        ossafe_fill_rectangle_color(arg1 - 40, bottomy - 200, arg1 + 40, bottomy + 50, 0, 0, _flashCol, _flashCol, false);
        draw_set_blend_mode(bm_normal);
    }
    
    draw_set_color(c_white);
}

function scr_rhythmgame_draw_border(arg0, arg1 = false)
{
    var _bordercolor = note_color[1];
    
    if (invc > 0)
        _bordercolor = merge_color(note_color[1], c_red, scr_rhythmgame_damage_flash());
    
    draw_set_color(merge_color(c_black, _bordercolor, brightness));
    
    if (!arg1 && !demo_mode)
    {
        var _jp = global.lang == "ja";
        var _name, _hoff;
        
        if (instrument == 0)
        {
            _name = _jp ? 3182 : 3138;
            _hoff = 21;
        }
        else if (instrument == 1)
        {
            _name = _jp ? 3184 : 3142;
            _hoff = 24;
        }
        else if (instrument == 2)
        {
            _name = _jp ? 3183 : 3139;
            _hoff = 30;
        }
        
        draw_sprite_ext(_name, 0, arg0 - _hoff, bottomy - 230, 1, 1, 0, draw_get_color(), 1);
    }
    
    ossafe_fill_rectangle(arg0 - 40, bottomy - 200, arg0 + 40, bottomy + 50, true);
    ossafe_fill_rectangle(arg0 - 41, bottomy - 201, arg0 + 41, bottomy + 51, true);
    
    if (!arg1 && demo_mode)
    {
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_font(fnt_mainbig);
        draw_text_outline(arg0 + 2, bottomy - 100, /*"DEMO"*/"演示", 2, 2, 0);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
}

function scr_rhythmgame_draw_combo(arg0)
{
    if (combo > 0)
    {
        draw_set_halign(fa_center);
        draw_set_font(fnt_main);
        var _combotext = (combo > 999) ? stringsetloc("BIG", "scr_rhythmgame_draw_slash_scr_rhythmgame_draw_gml_125_0_b") : combo;
        draw_text_transformed_color(arg0 + 2, bottomy - 121, _combotext, (combo >= 100) ? 3.5 : 5, 5, 0, #666666, #666666, #BBBBBB, #BBBBBB, 0.25);
        draw_text_transformed_color(arg0 + 2, bottomy - 60, stringsetloc("COMBO", "scr_rhythmgame_draw_slash_scr_rhythmgame_draw_gml_127_0_b"), 2, 2, 0, #BBBBBB, #BBBBBB, #DDDDDD, #DDDDDD, 0.25);
        draw_set_halign(fa_left);
    }
}

function scr_rhythmgame_draw_chart(arg0, arg1, arg2 = false)
{
    var _hitspeed = !arg2 ? obj_rhythmgame.pitch : 1;
    
    if (!arg2 && obj_rhythmgame.lose_con == 2)
        _hitspeed = 0;
    
    var _xstart = (instrument == 2) ? 280 : 280;
    var _xwidth = (instrument == 2) ? 30 : 40;
    var _beam = 0;
    var _notecol = [];
    var _flash = 0;
    var _altcolor = 0;
    
    if (invc > 0)
        _flash = scr_rhythmgame_damage_flash();
    
    _notecol[0] = merge_color(note_color[0], c_red, _flash);
    _notecol[0] = merge_color(c_black, _notecol[0], brightness);
    _notecol[1] = merge_color(note_color[1], c_red, _flash);
    _notecol[1] = merge_color(c_black, _notecol[1], brightness);
    _notecol[2] = merge_color(note_color[2], c_red, _flash);
    _notecol[2] = merge_color(c_black, _notecol[2], brightness);
    var _yellow = merge_color(c_black, merge_color(c_yellow, c_red, _flash), brightness);
    var _gold = merge_color(c_black, #FFED72, brightness);
    var _orange = merge_color(c_black, merge_color(c_orange, c_red, _flash), brightness);
    var _white = merge_color(c_black, merge_color(c_white, c_red, _flash), brightness);
    var _gray = merge_color(c_black, merge_color(c_gray, c_red, _flash), brightness);
    
    if (instrument == 1 && !arg2)
    {
        draw_sprite_ext(spr_rhythmgame_button, 4, arg1 - 20, bottomy, 1, 1, 0, _notecol[0], 1);
        draw_sprite_ext(spr_rhythmgame_button, 4, arg1 + 20, bottomy, 1, 1, 0, _notecol[1], 1);
    }
    
    if (instrument == 2)
    {
        draw_set_color(c_black);
        ossafe_fill_rectangle(arg1 - 40, bottomy - 2, arg1 + 40, bottomy + 2, false);
        draw_set_color(_orange);
        ossafe_fill_rectangle(arg1 - 40, bottomy - 1, arg1 + 40, bottomy + 1, false);
    }
    
    if (instrument == 2 && !arg2 && obj_rhythmgame.song_id != 10)
    {
        var _maxbeam = 0;
        
        for (var i = 0; i < 3; i++)
        {
            _beam = scr_ease_in(note_hit_timer[i] / 5, 2);
            _maxbeam = max(_beam, _maxbeam);
            
            if (note_hit_timer[i] > 0)
            {
                draw_sprite_ext(spr_whitegradientdown_rhythm, 1, (arg1 - 30) + (30 * i), bottomy, _beam * 0.75, 1, 0, _gold, 1);
                draw_sprite_ext(spr_whitegradientdown_rhythm, 2, (arg1 - 30) + (30 * i), bottomy, _beam * 0.75, 1, 0, _white, 1);
                
                if (last_note != i && cooldown > 1)
                    notex = clamp01(last_note - i) * 6;
                else if (cooldown <= 1)
                    notex = 0;
                
                last_note = i;
                cooldown = 2;
            }
            
            note_hit_timer[i] -= _hitspeed;
        }
        
        if (cooldown > 0)
        {
            var _arrow = (cooldown == 2) ? _yellow : _white;
            draw_sprite_ext(spr_singing_arrow, 0, (arg1 - 30) + (30 * last_note) + notex, bottomy + 3, 1, 1, 0, _arrow, clamp01(cooldown));
            notex = scr_movetowards(notex, 0, 4);
            cooldown -= (1/15);
        }
    }
    else
    {
        for (var i = 0; i < 2; i++)
        {
            if (note_hit_timer[i] > 0)
            {
                _beam = scr_ease_in(note_hit_timer[i] / 5, 2);
                var _ease = note_hit_timer[i] / 5;
                var _col = _white;
                var _cool = false;
                var _side = (i * 2) - 1;
                var _cenx = arg1 + (20 * _side);
                var _score = 0;
                var _beamheight = 1;
                
                if (instrument == 0)
                {
                    _score = note_hit_score[i];
                    _cool = _score >= 100;
                    _col = _cool ? _gold : _white;
                }
                
                if (instrument == 2)
                    _score = 100;
                
                if (instrument == 1)
                {
                    if (auto_play)
                    {
                        _score = 100;
                        _cool = true;
                        _col = _gold;
                    }
                    
                    draw_sprite_ext(spr_rhythmgame_button, 3, _cenx, bottomy, 1, 1, 0, _white, note_hit_timer[i] / 5);
                }
                
                if (instrument == 2)
                {
                    _cool = true;
                    _col = _gold;
                    _cenx = arg1;
                    draw_set_color(_white);
                    draw_set_alpha(note_hit_timer[i] / 5);
                    ossafe_fill_rectangle(arg1 - 40, bottomy - 2, arg1 + 40, bottomy + 2, false);
                    draw_set_alpha(1);
                }
                
                if (!arg2 && obj_rhythmgame.fame >= 12000 && _score > 0)
                {
                    if (instrument != 2)
                    {
                        draw_sprite_ext(spr_rhythmgame_note_hit, (1 - _beam) * 2.9, _cenx + (_side * (1 - _ease) * 2), bottomy, 2 - _beam, 2 - _beam, 0, merge_color(_white, _col, 1 - _ease), _ease);
                    }
                    else
                    {
                        var _beam_scale = 1 - _beam;
                        draw_sprite_ext(spr_rhythmgame_note_hit_big, (1 - _beam) * 2.9, _cenx, bottomy, (_beam_scale * 0.5) + 1, (_beam_scale * 0.5) + 1, 0, merge_color(_white, _col, 1 - _ease), _ease);
                    }
                }
                
                if (instrument == 2)
                {
                    var _beam_scale = 1 - _beam;
                    draw_sprite_ext(spr_whitegradientdown_rhythm, 1, _cenx, bottomy, 2, _beam_scale + 0.25, 0, _gold, clamp01(_beam * 2));
                    draw_sprite_ext(spr_whitegradientdown_rhythm, 2, _cenx, bottomy, 2, _beam_scale + 0.25, 0, _white, clamp01(_beam * 2));
                }
                else if (_cool)
                {
                    draw_sprite_ext(spr_whitegradientdown_rhythm, 1, _cenx, bottomy, _beam, 1, 0, _gold, 1);
                    draw_sprite_ext(spr_whitegradientdown_rhythm, 2, _cenx, bottomy, _beam, 1, 0, _white, 1);
                }
                else
                {
                    draw_sprite_ext(spr_whitegradientdown_rhythm, 0, _cenx, bottomy, _beam, 1, 0, _white, 1);
                }
                
                note_hit_timer[i] -= _hitspeed;
            }
        }
    }
    
    if (!arg2 && !paused)
    {
        scr_draw_set_mask(true);
        ossafe_fill_rectangle(arg1 - 40, bottomy + 50, arg1 + 40, bottomy - 200, false);
        scr_draw_in_mask_begin();
    }
    
    var _looper = !arg2 && (loop || (chart_end > track_length && maxnote > 0 && notetime[0] < chart_start));
    var _loopcheck = false;
    var _averagetimeunit = ((trackpos - remtrackpos[0]) + (remtrackpos[0] - remtrackpos[1]) + (remtrackpos[1] - remtrackpos[2])) / 3;
    var _end_buffer = trackpos - (3.6 * _averagetimeunit);
    
    if (!arg2 && instrument == 0 && hardmode)
        _end_buffer = trackpos - (2.4 * _averagetimeunit);
    
    var notei = max(minnote - 8, 0);
    
    for (; notei < maxnote; notei++)
    {
        var _notetime = notetime[notei];
        var _notealive = notealive[notei];
        var _notescore = notescore[notei];
        var _noteend = noteend[notei];
        
        if (!arg2 && instrument != 1 && obj_rhythmgame.song_id == 0)
        {
            _notetime = scr_rhythmgame_noteskip(notetime[notei]);
            
            if (_noteend > 0)
                _noteend = scr_rhythmgame_noteskip(_noteend);
        }
        else if (_loopcheck)
        {
            _notetime = scr_rhythmgame_noteloop(notetime[notei]);
            
            if (_notetime > (track_length / 2))
            {
                _notealive = 1;
                _notescore = 0;
            }
            else
            {
                _notealive = 0;
                
                if (notei >= (maxnote - 5))
                    _notescore = last_score[notei - (maxnote - 5)];
            }
            
            if (_noteend > 0)
                _noteend = scr_rhythmgame_noteloop(_noteend);
        }
        
        var notey = (bottomy - (_notetime * arg0)) + (trackpos * arg0);
        var _topy = camy - 20;
        
        if (notey < _topy)
        {
            if (_looper && !_loopcheck && trackpos < 4 && maxnote > 9)
            {
                _loopcheck = true;
                notei = maxnote - 9;
                continue;
            }
            
            break;
        }
        
        if (notey >= _topy && (notei >= minnote || _notescore <= 0 || (_loopcheck && _notealive)))
        {
            _end_buffer = trackpos - 0.12000000000000001;
            
            if (!arg2 && instrument == 0 && hardmode)
                _end_buffer = trackpos - 0.08666666666666667;
            
            if (_loopcheck == 0 && _notetime < _end_buffer)
            {
                if (notescore[notei] <= 0 && notealive[notei] == 1 && fade == 1)
                {
                    missnotecon = 1;
                    
                    if (instrument == 0 && !arg2)
                        miss++;
                }
                
                notealive[notei] = 0;
                minnote = notei + 1;
            }
            
            if (_notealive == 1)
                draw_set_color(_notecol[notetype[notei]]);
            else
                draw_set_color(_gray);
            
            if (_notescore >= 100)
                draw_set_color(_yellow);
            else if (_notescore >= 30)
                draw_set_color(_orange);
            
            if (_notealive == 1 || _notescore <= 0)
            {
                if (_notescore < 0 && _noteend > 0 && _notealive == 0)
                {
                    _notetime -= notescore[notei];
                    notey = (bottomy - (_notetime * arg0)) + (trackpos * arg0);
                    _notescore = 0;
                }
                
                if (noteanim[notei] > 0 && arg2)
                {
                    var _oldcolor = draw_get_color();
                    draw_set_color(_yellow);
                    d_circle((arg1 - 20 - 15) + (notetype[notei] * 40), notey, 3, false);
                    d_circle((arg1 - 20) + 15 + (notetype[notei] * 40), notey, 3, false);
                    draw_set_color(_oldcolor);
                }
                
                if (instrument == 2 && _noteend == 0)
                    scr_rhythmgame_draw_note_clap(arg1, notey, notetype[notei]);
                else
                    scr_rhythmgame_draw_note(arg1, notey, notetype[notei]);
                
                if (arg2 && paused && do_refresh)
                {
                    var _xleft = arg1;
                    
                    if (instrument == 2)
                        _xleft -= 15;
                    else
                        _xleft += 5;
                    
                    var _node = instance_create((_xleft - _xwidth) + (notetype[notei] * _xwidth) + 15, notey, obj_rhythmgame_editor_note_node);
                    _node.depth = depth + 1;
                    _node.noteindex = notei;
                    
                    if (instrument == 2)
                        _node.image_xscale = 1.375;
                }
                
                if (_noteend > 0)
                {
                    var notelength = (_noteend - _notetime) * arg0;
                    scr_rhythmgame_draw_note_long(arg1, notey, notetype[notei], notelength, false);
                }
            }
        }
        
        if (_looper && !_loopcheck && (notei + 1) == maxnote && trackpos > (track_length - 4))
        {
            notei = -1;
            _loopcheck = true;
        }
    }
    
    var _note_count = (instrument == 0) ? 1 : 2;
    
    for (var i = 0; i <= _note_count; i++)
    {
        if (hold_end[i] > 0)
        {
            var note_end = (hold_end[i] - trackpos) * arg0;
            draw_set_color(_orange);
            scr_rhythmgame_draw_note_long(arg1, bottomy, i, note_end, true);
            draw_set_color(_yellow);
            scr_rhythmgame_draw_note(arg1, bottomy, i);
        }
    }
    
    if (!arg2 && !paused)
        scr_draw_in_mask_end();
}

function scr_rhythmgame_draw_note(arg0, arg1, arg2, arg3 = 0)
{
    if (instrument == 2)
    {
        arg0 = (arg0 - 30) + (arg2 * 30);
        
        if (paused)
            ossafe_fill_rectangle(arg0 - 10, arg1 - 3, arg0 + 10, arg1 + 3, false);
        else
            draw_sprite_ext(spr_rhythmgame_heldnote, 0, arg0, arg1, 1, 1, 0, draw_get_color(), 1);
    }
    else if (instrument == 1 && arg2 == 2)
    {
        ossafe_fill_rectangle(arg0 - 45, arg1 - 1, arg0 + 45, arg1 + 1, false);
    }
    else
    {
        arg0 = (arg0 - 20) + (arg2 * 40);
        draw_sprite_ext(spr_rhythmgame_note, 0, arg0, arg1, 1, 1, 0, draw_get_color(), 1);
    }
}

function scr_rhythmgame_draw_note_clap(arg0, arg1, arg2, arg3 = 0)
{
    draw_sprite_ext(spr_rhythmgame_note_big, 0, arg0, arg1, 1, 1, 0, draw_get_color(), 1);
}

function scr_rhythmgame_draw_note_long(arg0, arg1, arg2, arg3, arg4 = false)
{
    if (instrument == 2)
    {
        arg0 = (arg0 - 30) + (arg2 * 30);
        var _col = draw_get_color();
        draw_sprite_ext(spr_rhythmgame_heldnote, 0, arg0, arg1 - arg3, 1, 1, 0, _col, 1);
        draw_sprite_ext(spr_rhythmgame_heldnote, 0, arg0, arg1, 1, 1, 0, _col, 1);
    }
    else
    {
        arg0 = (arg0 - 20) + (arg2 * 40);
    }
    
    ossafe_fill_rectangle(arg0 - 3, arg1 - arg3, arg0 + 3, arg1, false);
    
    if (arg4)
    {
        var _endColor = merge_color(c_yellow, c_orange, clamp01(inverselerp(arg1, arg1 - 40, arg1 - arg3)));
        _endColor = merge_color(c_black, _endColor, brightness);
        var _startColor = merge_color(c_black, c_yellow, brightness);
        
        if (instrument == 2)
        {
            draw_set_color(_endColor);
            draw_sprite_ext(spr_rhythmgame_heldnote, 0, arg0, arg1 - arg3, 1, 1, 0, _endColor, 1);
        }
        
        ossafe_fill_rectangle_color(arg0 - 3, arg1 - arg3, arg0 + 3, arg1, _endColor, _endColor, _startColor, _startColor, false);
    }
}

function scr_rhythmgame_noteloop(arg0)
{
    if (arg0 < (track_length / 2))
        arg0 += scr_round_to_beat(track_length, bpm);
    else
        arg0 -= scr_round_to_beat(track_length, bpm);
    
    return arg0;
}

function scr_rhythmgame_noteskip(arg0)
{
    with (obj_rhythmgame)
    {
        if (solo_difficulty < 2)
        {
            var _skiplength = timestamp[3] - timestamp[solo_difficulty + 1];
            var _solodiff = timestamp[solo_difficulty + 1];
            
            if (trackpos <= _solodiff && arg0 >= timestamp[3])
                arg0 -= _skiplength;
            else if (trackpos >= timestamp[3] && arg0 <= _solodiff)
                arg0 += _skiplength;
        }
        
        if (solo_difficulty > 0)
        {
            var _skiplength = timestamp[solo_difficulty] - timestamp[0];
            var _solodiff = timestamp[solo_difficulty];
            
            if (trackpos <= timestamp[0] && arg0 >= _solodiff)
                arg0 -= _skiplength;
            else if (trackpos >= _solodiff && arg0 <= timestamp[0])
                arg0 += _skiplength;
        }
    }
    
    return arg0;
}

function scr_rhythmgame_damage_flash(arg0 = false)
{
    if (invc > 0)
    {
        var _flash;
        
        if (arg0)
            _flash = remap_clamped(0, 6, 0, 1, hurt_flash);
        else
            _flash = remap_clamped(0, 6, 0, 1, hurt_flash);
        
        return _flash;
    }
    else
    {
        return 0;
    }
}

function scr_rhythmgame_songlist()
{
    if (global.chapter == 3)
    {
        var _trackname = [];
        return _trackname;
    }
    else
    {
        var _trackname = [];
        _trackname[0] = stringsetloc("Rude Buster", "scr_rhythmgame_draw_slash_scr_rhythmgame_draw_gml_597_0");
        _trackname[1] = stringsetloc("Field of Hopes and Dreams", "scr_rhythmgame_draw_slash_scr_rhythmgame_draw_gml_598_0");
        _trackname[2] = stringsetloc("Knock You Down!!", "scr_rhythmgame_draw_slash_scr_rhythmgame_draw_gml_599_0");
        _trackname[3] = stringsetloc("Raise Up Your Bat", "scr_rhythmgame_draw_slash_scr_rhythmgame_draw_gml_600_0");
        _trackname[4] = stringsetloc("It's TV Time!", "scr_rhythmgame_draw_slash_scr_rhythmgame_draw_gml_601_0");
        return _trackname;
    }
}
