xx = camerax();
yy = cameray();
var haveflowery = false;

if (global.chapter == 5)
{
    with (obj_caterpillar_generic)
    {
        if (name == "flowery")
            haveflowery = true;
    }
}

tpoff = (tp - tpy) + yy;
bpoff = -bp + bpy + yy;

if (drawchar == 1)
{
    draw_sprite_ext(spr_pxwhite, 0, xx - 10, (yy + 480) - bp - 1, 660, 21 + bp, 0, #010000, 1);
    draw_sprite_ext(spr_pxwhite, 0, xx - 10, yy + tp, 650, -tp - 10, 0, #010000, 1);
    scr_charbox();
    
    if (global.menuno == 0)
        deschaver = 0;
    
    if (deschaver == 0)
    {
        draw_sprite_ext(menu_sprite, global.menucoord[0], xx + 20, (yy + tp) - 56, 2, 2, 0, c_white, 1);
        msprite[0] = spr_darkitembt;
        msprite[1] = spr_darkequipbt;
        msprite[2] = spr_darktalkbt;
        msprite[3] = spr_darktechbt;
        msprite[4] = spr_darkconfigbt;
        
        for (var i = 0; i < 5; i += 1)
        {
            off = 1;
            
            if (global.menucoord[0] == i)
                off = 0;
            
            if ((global.menuno - 1) == i)
                off = 2;
            
            spritemx = 0;
            
            if (i >= 2)
                spritemx = -100;
            
            if (i != 2)
                draw_sprite_ext(msprite[i], off, xx + 120 + (i * 100) + spritemx, (yy + tp) - 60, 2, 2, 0, c_white, 1);
        }
        
        var drawmoney = 1;
        var moneyamt = string(global.gold);
        
        if (global.chapter == 5)
        {
            if (global.flag[1412] == 1)
                moneyamt = string(global.gold + global.flag[1411]);
            
            if ((global.flag[1412] == 2 || global.flag[1412] == 0) && global.flag[1411] > 0)
                drawmoney = 2;
            
            if (global.flag[1312] > 0)
            {
                if (drawmoney == 2)
                    drawmoney = 4;
                else
                    drawmoney = 3;
            }
        }
        
        var moneystring = string_hash_to_newline(stringsetsubloc("D$ ~1", moneyamt, "obj_darkcontroller_slash_Draw_0_gml_47_0"));
        var flowerydollarsstring = stringsetsubloc("F$ ~1", string(global.flag[1411]), "obj_darkcontroller_slash_Draw_0_gml_69_0");
        var pinkdollarsstring = stringsetsubloc("P$ ~1", string(global.flag[1312]), "obj_darkcontroller_slash_Draw_0_gml_70_0");
        
        if (drawmoney == 1)
        {
            draw_set_color(c_white);
            scr_84_set_draw_font("mainbig");
            draw_text(xx + 520, (yy + tp) - 60, moneystring);
        }
        
        if (drawmoney == 2)
        {
            scr_84_set_draw_font("mainbig");
            draw_set_color(c_white);
            draw_text(xx + 520, ((yy + tp) - 53) + 14, moneystring);
            draw_text(xx + 520, ((yy + tp) - 81) + 14, flowerydollarsstring);
        }
        
        if (drawmoney == 3)
        {
            scr_84_set_draw_font("mainbig");
            draw_set_color(c_white);
            draw_text(xx + 520, ((yy + tp) - 53) + 14, moneystring);
            draw_text(xx + 520, ((yy + tp) - 81) + 14, pinkdollarsstring);
        }
        
        if (drawmoney == 4 && tp > 0)
        {
            draw_sprite_ext(spr_pxwhite, 0, xx + 500, yy + tp, 140, 30, 0, c_black, 1);
            scr_84_set_draw_font("mainbig");
            draw_set_color(c_white);
            draw_text(xx + 520, ((yy + tp) - 25) + 14, moneystring);
            draw_text(xx + 520, ((yy + tp) - 53) + 14, pinkdollarsstring);
            draw_text(xx + 520, ((yy + tp) - 81) + 14, flowerydollarsstring);
        }
    }
}

if (global.menuno == 5)
{
    var lang_off = langopt([90, 410, 420], [85, 412, 422]);
    draw_set_color(c_black);
    ossafe_fill_rectangle(xx + 60, yy + lang_off[0], xx + 580, yy + lang_off[1], false);
    scr_darkbox(xx + 50, (yy + lang_off[0]) - 10, xx + 590, yy + lang_off[2]);
    
    if ((global.submenu >= 30 && global.submenu <= 33) || global.submenu == 36)
    {
        var _xPos = (global.lang == "en") ? (xx + 170) : (xx + 150);
        var _heartXPos = (global.lang == "en") ? (xx + 145) : (xx + 125);
        
        if (global.lang == "ja" && global.is_console)
        {
            _xPos -= 24;
            _heartXPos -= 24;
        }
        
        var _selectXPos = (global.lang == "ja" && global.is_console) ? (xx + 385) : (xx + 430);
        draw_set_color(c_white);
        draw_text(xx + 270, yy + 100, string_hash_to_newline(stringsetloc("CONFIG", "obj_darkcontroller_slash_Draw_0_gml_74_0")));
        audvol = string(round(abs(global.flag[17] * 100))) + "%";
        musvol = string(round(abs(global.flag[16] * 100))) + "%";
        runoff = stringsetloc("OFF", "obj_darkcontroller_slash_Draw_0_gml_82_0");
        
        if (global.flag[11] == 1)
            runoff = stringsetloc("ON", "obj_darkcontroller_slash_Draw_0_gml_82_1");
        
        flashoff = stringsetloc("OFF", "obj_darkcontroller_slash_Draw_0_gml_83_0");
        
        if (global.flag[8] == 1)
            flashoff = stringsetloc("ON", "obj_darkcontroller_slash_Draw_0_gml_83_1");
        
        shakeoff = stringsetloc("OFF", "obj_darkcontroller_slash_Draw_0_gml_84_0");
        
        if (global.flag[12] == 1)
            shakeoff = stringsetloc("ON", "obj_darkcontroller_slash_Draw_0_gml_84_1");
        
        var str_on = stringsetloc("ON", "obj_darkcontroller_slash_Draw_0_gml_140_0");
        var str_off = stringsetloc("OFF", "obj_darkcontroller_slash_Draw_0_gml_141_0");
        var ralseis = stringsetloc("Ralseis", "obj_darkcontroller_slash_Draw_0_gml_142_0");
        
        if (!global.is_console)
        {
            fullscreenoff = stringsetloc("OFF", "obj_darkcontroller_slash_Draw_0_gml_87_0");
            
            if (window_get_fullscreen())
                fullscreenoff = stringsetloc("ON", "obj_darkcontroller_slash_Draw_0_gml_87_1");
        }
        
        draw_sprite(spr_heart, 0, _heartXPos, yy + 160 + (global.submenucoord[30] * 35));
        
        if (global.submenu == 33)
            draw_set_color(c_yellow);
        
        draw_text(_xPos, yy + 150, string_hash_to_newline(stringsetloc("Master Volume", "obj_darkcontroller_slash_Draw_0_gml_86_0")));
        draw_text(_selectXPos, yy + 150, string_hash_to_newline(audvol));
        draw_set_color(c_white);
        draw_text(_xPos, yy + 185, string_hash_to_newline(stringsetloc("Controls", "obj_darkcontroller_slash_Draw_0_gml_91_0")));
        var simplifyvfx = true;
        
        if (global.chapter == 5)
            simplifyvfx = false;
        
        if (simplifyvfx)
        {
            draw_text(_xPos, yy + 220, string_hash_to_newline(stringsetloc("Simplify VFX", "obj_darkcontroller_slash_Draw_0_gml_92_0")));
            draw_text(_selectXPos, yy + 220, string_hash_to_newline(flashoff));
        }
        else
        {
            var __menuOpt = 0;
            
            if (global.flag[24] == 1)
                __menuOpt = 1;
            
            if (__menuOpt == 0)
            {
                var voicelines = stringsetloc("Voice Clips", "obj_darkcontroller_slash_Draw_0_gml_176_0");
                var thisstring = str_on;
                
                if (global.flag[1391] == 1)
                    thisstring = str_off;
                
                draw_text(_xPos, yy + 220, string_hash_to_newline(voicelines));
                draw_text(_selectXPos, yy + 220, thisstring);
            }
            
            if (__menuOpt == 1)
            {
                var feathstr = stringsetloc("Feather", "obj_darkcontroller_slash_Draw_0_gml_186_0");
                var feathSet0 = stringsetloc("Jump: Cancel\nAttack: Confirm", "obj_darkcontroller_slash_Draw_0_gml_188_0");
                var feathSet1 = stringsetloc("Jump: Confirm\nAttack: Cancel", "obj_darkcontroller_slash_Draw_0_gml_189_0");
                var st = [feathSet0, feathSet1];
                var col = 16777215;
                
                if (scr_flag_get_ext(1762, 0, 2) == 0)
                    col = 16776960;
                
                if (scr_flag_get_ext(1762, 0, 2) == 0)
                {
                    if (global.menuno == 5 && global.submenu == 30 && global.submenucoord[30] == 2)
                        scr_flag_set_ext(1762, 0, 1, 2);
                }
                else if (scr_flag_get_ext(1762, 0, 2) == 1)
                {
                    yellowed++;
                    var __endtime = 15;
                    
                    if (yellowed >= __endtime)
                    {
                        yellowed = 0;
                        scr_flag_set_ext(1762, 0, 2, 2);
                    }
                    else
                    {
                        col = merge_color(c_yellow, c_white, lerp_inout_cubic(0, 1, yellowed / __endtime));
                    }
                }
                
                draw_set_color(col);
                draw_text(_xPos, yy + 220, feathstr);
                var mem = 
                {
                    h: draw_get_halign(),
                    v: draw_get_valign(),
                    f: draw_get_font()
                };
                draw_set_halign(fa_left);
                draw_set_valign(fa_middle);
                draw_set_font(scr_84_get_font("main"));
                draw_text(_selectXPos, yy + 220 + 16, st[global.flag[25]]);
                draw_set_halign(mem.h);
                draw_set_valign(mem.v);
                draw_set_font(mem.f);
                draw_set_color(c_white);
                var cont = 0;
            }
        }
        
        if (global.is_console)
        {
            var drawautorun = true;
            
            if (global.chapter == 5)
            {
                if (global.tempflag[52] == 1)
                    drawautorun = false;
            }
            
            if (drawautorun)
            {
                draw_text(_xPos, yy + 255, string_hash_to_newline(autorun_text));
                draw_text(_selectXPos, yy + 255, string_hash_to_newline(runoff));
            }
            else
            {
                var thisstring = str_on;
                
                if (global.flag[1392] == 1)
                    thisstring = str_off;
                
                draw_text(_xPos, yy + 255, string_hash_to_newline(ralseis));
                draw_text(_selectXPos, yy + 255, string_hash_to_newline(thisstring));
            }
            
            if (global.submenu == 36)
                draw_set_color(c_yellow);
            else if (global.disable_border)
                draw_set_color(c_gray);
            
            draw_text(_xPos, yy + 290, stringsetloc("Border", "obj_darkcontroller_slash_Draw_0_gml_112_0"));
            draw_text(_selectXPos, yy + 290, border_options[selected_border]);
            draw_set_color(c_white);
            draw_text(_xPos, yy + 325, string_hash_to_newline(stringsetloc("Return to Title", "obj_darkcontroller_slash_Draw_0_gml_95_0")));
            draw_text(_xPos, yy + 360, string_hash_to_newline(back_text));
        }
        else
        {
            draw_text(_xPos, yy + 255, string_hash_to_newline(stringsetloc("Fullscreen", "obj_darkcontroller_slash_Draw_0_gml_93_0")));
            draw_text(xx + 430, yy + 255, string_hash_to_newline(fullscreenoff));
            var drawautorun = true;
            
            if (global.chapter == 5)
            {
                if (global.tempflag[52] == 1)
                    drawautorun = false;
            }
            
            if (drawautorun)
            {
                draw_text(_xPos, yy + 290, string_hash_to_newline(autorun_text));
                draw_text(xx + 430, yy + 290, string_hash_to_newline(runoff));
            }
            else
            {
                var thisstring = str_on;
                
                if (global.flag[1392] == 1)
                    thisstring = str_off;
                
                draw_text(_xPos, yy + 290, string_hash_to_newline(ralseis));
                draw_text(xx + 430, yy + 290, thisstring);
            }
            
            draw_text(_xPos, yy + 325, string_hash_to_newline(stringsetloc("Return to Title", "obj_darkcontroller_slash_Draw_0_gml_95_0")));
            draw_text(_xPos, yy + 360, string_hash_to_newline(back_text));
        }
    }
    
    if (global.submenu == 34)
    {
    }
    
    if (global.submenu == 35)
    {
        var is_dualshock = global.gamepad_type == "Sony DualShock 4" || global.gamepad_type == "DualSense Wireless Controller";
        var _yOffset = (global.lang == "en") ? 0 : -4;
        var _headerOffset = (is_dualshock && global.lang == "ja") ? -5 : 0;
        draw_set_color(c_white);
        draw_text(xx + 105, yy + 100 + _headerOffset, string_hash_to_newline(stringsetloc("Function", "obj_darkcontroller_slash_Draw_0_gml_113_0")));
        
        if (global.is_console)
        {
            var buttonXPos = (scr_is_switch_os() && global.lang == "en") ? (xx + 445) : (xx + 435);
            var buttonYPos = yy + 100 + _yOffset;
            draw_text(buttonXPos, buttonYPos, stringsetloc("Button", "obj_darkcontroller_slash_Draw_0_gml_147_0"));
        }
        else
        {
            draw_text(xx + 325, yy + 100 + _headerOffset, string_hash_to_newline(stringsetloc("Key", "obj_darkcontroller_slash_Draw_0_gml_114_0")));
            
            if (obj_gamecontroller.gamepad_active)
                draw_text(xx + 435, yy + 100 + _headerOffset, string_hash_to_newline(stringsetloc("Gamepad", "obj_darkcontroller_slash_Draw_0_gml_115_0")));
        }
        
        my_function[0] = stringsetloc("DOWN", "obj_darkcontroller_slash_Draw_0_gml_117_0");
        my_function[1] = stringsetloc("RIGHT", "obj_darkcontroller_slash_Draw_0_gml_118_0");
        my_function[2] = stringsetloc("UP", "obj_darkcontroller_slash_Draw_0_gml_119_0");
        my_function[3] = stringsetloc("LEFT", "obj_darkcontroller_slash_Draw_0_gml_120_0");
        my_function[4] = stringsetloc("CONFIRM", "obj_darkcontroller_slash_Draw_0_gml_121_0");
        my_function[5] = stringsetloc("CANCEL", "obj_darkcontroller_slash_Draw_0_gml_122_0");
        my_function[6] = stringsetloc("MENU", "obj_darkcontroller_slash_Draw_0_gml_123_0");
        my_function[7] = stringsetloc("Reset to default", "obj_darkcontroller_slash_Draw_0_gml_124_0");
        my_function[8] = stringsetloc("Finish", "obj_darkcontroller_slash_Draw_0_gml_125_0");
        var voff = langopt(0, -8);
        var vspacing = langopt(28, 30);
        
        if (global.is_console || is_dualshock)
        {
            var _heartYPos = (global.lang == "en") ? (yy + 146) : (yy + 144);
            var _heartHeight = (global.lang == "en") ? 29 : 30;
            draw_sprite(spr_heart, 0, xx + 80, _heartYPos + (global.submenucoord[35] * _heartHeight) + _yOffset);
        }
        else
        {
            var heart_offset = (global.lang == "en") ? 28 : 29;
            draw_sprite(spr_heart, 0, xx + 80, (yy + 150 + (global.submenucoord[35] * heart_offset) + _yOffset) - 2);
        }
        
        var line_padding = (global.lang == "ja") ? 1 : 0;
        
        for (var i = 0; i <= 8; i += 1)
        {
            draw_set_color(c_white);
            
            if (global.submenucoord[35] == i)
                draw_set_color(c_aqua);
            
            if (global.submenucoord[35] == i && control_select_con == 1)
                draw_set_color(c_red);
            
            if (i == 7 && control_flash_timer > 0)
                draw_set_color(merge_color(c_aqua, c_yellow, (control_flash_timer / 10) - 0.1));
            
            var _textYPos;
            
            if (is_dualshock)
            {
                var _textHeight = 29;
                _textYPos = (global.lang == "en") ? (yy + 137) : (yy + 136);
                draw_text(xx + 105, _textYPos + (i * (_textHeight + line_padding)) + _yOffset, string_hash_to_newline(my_function[i]));
            }
            else
            {
                draw_text(xx + 105, yy + 140 + (i * (28 + line_padding)) + _yOffset, string_hash_to_newline(my_function[i]));
            }
            
            if (i < 7)
            {
                if (is_dualshock)
                {
                    var _sprite = scr_getbuttonsprite(global.input_g[i], false);
                    var _sprite_height = 29;
                    var _xPos = xx + 465;
                    var _yPos = yy + 139;
                    
                    if (_sprite == button_ps4_dpad_up || _sprite == button_ps4_dpad_down || _sprite == button_ps4_dpad_left || _sprite == button_ps4_dpad_right)
                    {
                        _sprite_height = 30;
                        _yPos = _textYPos + 0.5;
                        _xPos = xx + 463;
                    }
                    else if (_sprite == button_ps4_options)
                    {
                        _sprite_height = 29.5;
                        _yPos = _textYPos + 0.5;
                        _xPos = xx + 460;
                    }
                    
                    draw_sprite_ext(_sprite, 0, _xPos, _yPos + (i * (_sprite_height + line_padding)) + _yOffset, 2, 2, 0, c_white, 1);
                    
                    if (!global.is_console)
                        draw_text(xx + 325, yy + voff + 140 + (i * vspacing), string_hash_to_newline(global.asc_def[global.input_k[i]]));
                }
                else if (global.is_console)
                {
                    if (obj_gamecontroller.gamepad_active)
                    {
                        var _sprite = (scr_getbuttonsprite(global.input_g[i], false) != noone) ? scr_getbuttonsprite(global.input_g[i], false) : button_switch_left_0;
                        var _xPos = (global.lang == "en") ? (xx + 475) : (xx + 465);
                        
                        if (_sprite == button_switch_lStickClick_0 || _sprite == button_switch_rStickClick_0)
                            _xPos -= 3;
                        
                        draw_sprite_ext(_sprite, 0, _xPos, yy + 144 + (i * (28 + line_padding)) + _yOffset, 2, 2, 0, c_white, 1);
                    }
                }
                else
                {
                    draw_text(xx + 325, yy + voff + 140 + (i * vspacing), string_hash_to_newline(global.asc_def[global.input_k[i]]));
                    
                    if (obj_gamecontroller.gamepad_active)
                    {
                        var _sprite = scr_getbuttonsprite(global.input_g[i], false);
                        var _xPos = (global.lang == "en") ? (xx + 475) : (xx + 465);
                        
                        if (sprite_get_width(_sprite) < 12)
                            _xPos += 2;
                        
                        draw_sprite_ext(_sprite, 0, _xPos, yy + 144 + (i * (28 + line_padding)) + _yOffset, 2, 2, 0, c_white, 1);
                    }
                }
            }
        }
    }
}

if (global.menuno == 4)
{
    var memxx = xx;
    
    if (global.lang == "ja")
        xx += -15;
    
    draw_set_color(c_black);
    ossafe_fill_rectangle(xx + 60, yy + 90, xx + langopt(580, 612), yy + 410, false);
    scr_darkbox(xx + 50, yy + 80, xx + langopt(590, 622), yy + 420);
    draw_set_color(c_white);
    var lhor = 
    {
        x: xx + 60,
        y: yy + 216,
        w: 521,
        h: 6
    };
    
    if (global.lang == "ja")
        lhor.w += 32;
    
    with (lhor)
        draw_sprite_ext(spr_pxwhite, 0, x, y, w, h, 0, c_white, 1);
    
    var mvert = 
    {
        x: xx + 294,
        y: yy + 218,
        w: 6,
        h: 193
    };
    
    with (mvert)
        draw_sprite_ext(spr_pxwhite, 0, x, y, w, h, 0, c_white, 1);
    
    draw_sprite_ext(scr_84_get_sprite("spr_dmenu_captions"), 0, xx + 124, yy + 84, 2, 2, 0, c_white, 1);
    draw_sprite_ext(scr_84_get_sprite("spr_dmenu_captions"), 4, xx + 124, yy + 210, 2, 2, 0, c_white, 1);
    draw_sprite_ext(scr_84_get_sprite("spr_dmenu_captions"), 5, xx + 380, yy + 210, 2, 2, 0, c_white, 1);
    
    if (global.lang == "ja")
        draw_sprite_ext(scr_84_get_sprite("spr_dmenu_captions"), 6, xx + 310, yy + 225, 1, 1, 0, c_white, 1);
    else
        draw_sprite_ext(scr_84_get_sprite("spr_dmenu_captions"), 6, xx + 340, yy + 225, 1, 1, 0, c_white, 1);
    
    coord = global.submenucoord[20];
    charcoord = global.char[coord];
    menusiner += 1;
    draw_set_color(c_white);
    scr_84_set_draw_font("mainbig");
    draw_text(xx + 130, yy + 105, string_hash_to_newline(global.charname[charcoord]));
    
    for (var i = 0; i < 3; i += 1)
    {
        chosen = 0.4;
        
        if (i == coord)
            chosen = 1;
        
        var headssprite = 4649;
        
        if (global.flag[1311] == 1)
            headssprite = 4646;
        
        var dodraw = true;
        
        if (i == 2 && haveflowery)
        {
            dodraw = false;
            draw_sprite_ext(spr_flowery_equipchar, 0, 90 + xx + (i * 50) + 6, (160 + yy) - 8, 2, 2, 0, c_white, chosen);
        }
        
        if (dodraw)
            draw_sprite_ext(headssprite, global.char[i], 90 + xx + (i * 50), 160 + yy, 2, 2, 0, c_white, chosen);
    }
    
    if (global.submenu == 20)
        draw_sprite(spr_heart_harrows, menusiner / 20, 100 + xx + (coord * 50), 141 + yy);
    
    var ch_yoff = yy + 230;
    var ch_vspace = langopt(25, 28);
    var falselv = "1";
    
    if (global.chapter == 2)
    {
        falselv = "2";
        
        if (global.plot >= 200)
            falselv = "3";
    }
    
    var ch_y;
    
    for (var ch_i = 0; ch_i < 6; ch_i++)
        ch_y[ch_i] = ch_yoff + (ch_i * ch_vspace);
    
    draw_set_color(c_white);
    draw_text(xx + 100, ch_y[0], string_hash_to_newline(stringsetloc("Attack: ", "obj_darkcontroller_slash_Draw_0_gml_207_0")));
    draw_item_icon(xx + 74, ch_y[0] + 6, 1);
    draw_text(xx + 100, ch_y[1], string_hash_to_newline(stringsetloc("Defense: ", "obj_darkcontroller_slash_Draw_0_gml_208_0")));
    draw_item_icon(xx + 74, ch_y[1] + 6, 4);
    draw_text(xx + 100, ch_y[2], string_hash_to_newline(stringsetloc("Magic: ", "obj_darkcontroller_slash_Draw_0_gml_209_0")));
    draw_item_icon(xx + 74, ch_y[2] + 6, 5);
    draw_text(xx + 100, ch_y[5], string_hash_to_newline(stringsetloc("Guts: ", "obj_darkcontroller_slash_Draw_0_gml_212_0")));
    draw_item_icon(xx + 74, ch_y[5] + 6, 9);
    char_desc = stringsetloc("LV1 ", "obj_darkcontroller_slash_Draw_0_gml_214_0");
    guts_amount = 0;
    fluff_amount = 0;
    asterisk_amount = 0;
    
    if (charcoord == 1)
    {
        guts_amount = 1;
        
        if (global.chapter == 2 || global.chapter == 3)
            guts_amount = 2;
        
        if (global.chapter == 5)
            guts_amount = 3;
        
        if (global.chapter < 3)
        {
            draw_set_color(c_dkgray);
            draw_text(xx + 100, ch_y[4], string_hash_to_newline(stringsetloc("???", "obj_darkcontroller_slash_Draw_0_gml_607_0_b")));
        }
        else if (global.chapter == 5)
        {
        }
        else
        {
            draw_set_color(c_white);
            
            if (global.flag[1255] > 0)
            {
                draw_text(xx + 100 + 130, ch_y[4], string(clamp(global.flag[1255], 0, 9999)));
                draw_text(xx + 74, ch_y[4], "*");
            }
            else
            {
                draw_set_color(c_dkgray);
                draw_text(xx + 100, ch_y[4], string_hash_to_newline(stringsetloc("???", "obj_darkcontroller_slash_Draw_0_gml_620_0")));
            }
        }
        
        var drawdog = false;
        
        if (dograndom >= 97)
        {
            draw_set_color(c_white);
            draw_text(xx + 100, ch_y[3], string_hash_to_newline(stringsetloc("Dog:", "obj_darkcontroller_slash_Draw_0_gml_231_0")));
            draw_sprite_ext(spr_dog_sleep, -threebuffer / 30, xx + 220, ch_y[3] + 5, 2, 2, 0, c_white, 1);
            drawdog = true;
        }
        else if (global.chapter == 5)
        {
        }
        else
        {
            draw_set_color(c_dkgray);
            draw_text(xx + 100, ch_y[3], string_hash_to_newline(stringsetloc("???", "obj_darkcontroller_slash_Draw_0_gml_236_0")));
        }
        
        draw_set_color(c_white);
        
        if (global.chapter == 5)
        {
            if (global.flag[24])
            {
                var str_jumps = stringsetloc("Jumps: ", "obj_darkcontroller_slash_Draw_0_gml_663_0");
                var str_slashes = stringsetloc("Slashes: ", "obj_darkcontroller_slash_Draw_0_gml_664_0");
                var targ = 131;
                
                if (!drawdog)
                {
                    draw_item_icon(xx + 74, ch_y[3] + 8, 28);
                    
                    if (global.lang == "ja")
                    {
                        var _scale = targ / string_width(str_jumps);
                        draw_text_transformed(xx + 100, ch_y[3], str_jumps, _scale, 1, 0);
                    }
                    else
                    {
                        draw_text(xx + 100, ch_y[3], str_jumps);
                    }
                    
                    var jumpcount = string(global.flag[1904]);
                    _wscale = min(60 / string_width(jumpcount), 1);
                    draw_text_transformed(xx + 230, ch_y[3], jumpcount, _wscale, 1, 0);
                }
                
                draw_item_icon(xx + 74, ch_y[4] + 6, 1);
                
                if (global.lang == "ja")
                {
                    var _scale = (targ - 2) / string_width(str_slashes);
                    draw_text_transformed(xx + 100, ch_y[4], str_slashes, _scale, 1, 0);
                }
                else
                {
                    draw_text(xx + 100, ch_y[4], str_slashes);
                }
                
                var slashcount = string(global.flag[1905]);
                var _wscale = min(60 / string_width(slashcount), 1);
                draw_text_transformed(xx + 230, ch_y[4], slashcount, _wscale, 1, 0);
            }
            else
            {
                draw_set_color(c_dkgray);
                
                if (!drawdog)
                    draw_text(xx + 100, ch_y[3], string_hash_to_newline(stringsetloc("???", "obj_darkcontroller_slash_Draw_0_gml_236_0")));
                
                draw_text(xx + 100, ch_y[4], string_hash_to_newline(stringsetloc("???", "obj_darkcontroller_slash_Draw_0_gml_236_0")));
                draw_set_color(-1);
            }
        }
        
        char_desc = stringsetloc("LV5 Blue Rose#Quiet, yet#flirtatious.", "obj_darkcontroller_slash_Draw_0_gml_638_0");
        
        if (global.plot >= 440)
            char_desc = stringsetloc("LV5 Dark Rose#Conveys#departure.", "obj_darkcontroller_slash_Draw_0_gml_641_0");
        
        if (scr_flag_get(1846) >= 2)
            char_desc = stringsetloc("LV5 Pink Rose#Flirtatious, and#flirtatious.", "obj_darkcontroller_slash_Draw_0_gml_646_0");
        
        if (scr_flag_get(1743) == 1)
            char_desc = stringsetloc("LV5 Shattered Rose#Only one knows#the rose's meaning.", "obj_darkcontroller_slash_Draw_0_gml_651_0");
        
        var moss_flags = [106, 922, 1078, 1592];
        var moss_title_active = true;
        
        for (var i = 0; i < array_length(moss_flags); i++)
        {
            if (scr_flag_get(moss_flags[i]) == 1)
                continue;
            
            moss_title_active = false;
            break;
        }
        
        if (global.plot >= 398 && moss_title_active)
            char_desc = stringsetloc("LV5 Last Moss#A mossliker's#final form.", "obj_darkcontroller_slash_Draw_0_gml_669_0");
        
        if (scr_flag_get_ext(1851, 0) == 1)
            char_desc = stringsetloc("LV5 Walkerstar#Starwalker's#walking buddy.", "obj_darkcontroller_slash_Draw_0_gml_674_0");
        
        if (instance_exists(obj_room_man))
            char_desc = stringsetloc("LV1", "obj_darkcontroller_slash_Draw_0_gml_677_0");
    }
    
    if (charcoord == 2)
    {
        guts_amount = 2;
        rude_amount = 100;
        
        if (global.chapter == 1)
        {
            if (global.plot >= 154)
                rude_amount = 99;
        }
        
        if (global.chapter == 2)
            rude_amount -= 11;
        
        if (global.chapter == 3)
            guts_amount = 3;
        
        if (global.chapter == 5)
            guts_amount = 4;
        
        draw_text(xx + 100, ch_y[3], string_hash_to_newline(stringsetloc("Rudeness ", "obj_darkcontroller_slash_Draw_0_gml_251_0")));
        draw_item_icon(xx + 74, ch_y[3] + 6, 13);
        draw_text(xx + 230, ch_y[3], string_hash_to_newline(rude_amount));
        char_desc = stringsetloc("LV5 Violent Violet#For that special#someone.", "obj_darkcontroller_slash_Draw_0_gml_710_0");
        
        if (global.plot >= 440)
            char_desc = stringsetloc("LV5 Dark Vine#Assists in sealing#the Fountain.", "obj_darkcontroller_slash_Draw_0_gml_714_0");
        
        if (global.chapter >= 4)
        {
            var showstat = false;
            var healcount = (global.mag[1] * 5) + 15 + (2 * global.flag[1045]);
            
            if (global.flag[1569] == 1)
                healcount = (global.mag[1] * 10) + (2 * global.flag[1045]);
            
            var healing = stringsetloc("Healing", "obj_darkcontroller_slash_Draw_0_gml_615_0_b");
            var readstring = healing;
            var numstring = string(healcount);
            
            if (healcount)
                showstat = true;
            
            if (!showstat)
            {
                draw_set_color(c_dkgray);
                draw_text(xx + 100, ch_y[4], "？？？");
                draw_set_color(-1);
            }
            else
            {
                draw_set_color(-1);
                draw_text(xx + 100, ch_y[4], readstring);
                draw_text(xx + 74, ch_y[4], "*");
                draw_text(xx + 100 + 130, ch_y[4], numstring);
            }
        }
    }
    
    if (charcoord == 3)
    {
        guts_amount = 0;
        fluff_amount = 1;
        kindness_amount = 100;
        kind_icon = 10;
        kind_text = stringsetloc("Kindness", "obj_darkcontroller_slash_Draw_0_gml_327_0");
        
        if (dograndom >= 97)
        {
            kind_icon = 11;
            kind_text = stringsetloc("Dogness", "obj_darkcontroller_slash_Draw_0_gml_331_0");
            kindness_amount = 1;
        }
        
        char_desc = stringsetloc("LV5 Artemisia#Goes well with tea.", "obj_darkcontroller_slash_Draw_0_gml_759_0");
        
        if (global.plot >= 440)
            char_desc = stringsetloc("LV5 Dark Vine#Watering their#own thorns.", "obj_darkcontroller_slash_Draw_0_gml_763_0");
        
        if (global.chapter == 5)
        {
            if (haveflowery)
                char_desc = stringsetloc("LV99 Roommate#Your dad's his#best friend.", "obj_darkcontroller_slash_Draw_0_gml_770_0");
        }
            __scale = 1;
        
        draw_text_transformed(xx + 100, ch_y[4], string_hash_to_newline(stringsetloc("Fluffiness", "obj_darkcontroller_slash_Draw_0_gml_286_0")), __scale, 1, 0);
        draw_item_icon(xx + 74, ch_y[4] + 6, 12);
        
        for (var i = 0; i < fluff_amount; i += 1)
            draw_item_icon(xx + 230 + (i * 20), ch_y[4] + 6, 12);
    }
    
    if (charcoord == 4)
    {
        guts_amount = 0;
        char_desc = stringsetloc("LV5 Mistletoe#Things got#serious today.", "obj_darkcontroller_slash_Draw_0_gml_790_0");
        var coldness_amount = clamp(47 + (global.flag[925] * 7), 47, 100);
        draw_text(xx + 100, ch_y[3], string_hash_to_newline(stringsetloc("Coldness ", "obj_darkcontroller_slash_Draw_0_gml_388_0")));
        draw_item_icon(xx + 74, ch_y[3] + 6, 17);
        draw_text(xx + 230, ch_y[3], string_hash_to_newline(coldness_amount));
        draw_text_transformed(xx + 100, ch_y[4], string_hash_to_newline(stringsetloc("Boldness", "obj_darkcontroller_slash_Draw_0_gml_391_0")), langopt(0.8, 1), 1, 0);
        draw_item_icon(xx + 74, ch_y[4] + 6, 16);
        var boldness_amount = min(-12 + ((global.plot - 70) * 3), 100);
        draw_text(xx + 230, ch_y[4], string_hash_to_newline(boldness_amount));
    }
    
    draw_text(xx + 320, yy + 105, string_hash_to_newline(char_desc));
    var guts_xoff = langopt(0, 16);
    
    for (var i = 0; i < guts_amount; i += 1)
        draw_item_icon(xx + 190 + (i * 20) + guts_xoff, ch_y[5] + 6, 9);
    
    atsum = global.at[global.char[coord]] + global.itemat[global.char[coord]][0] + global.itemat[global.char[coord]][1] + global.itemat[global.char[coord]][2];
    dfsum = global.df[global.char[coord]] + global.itemdf[global.char[coord]][0] + global.itemdf[global.char[coord]][1] + global.itemdf[global.char[coord]][2];
    magsum = global.mag[global.char[coord]] + global.itemmag[global.char[coord]][0] + global.itemmag[global.char[coord]][1] + global.itemmag[global.char[coord]][2];
    grazesum = global.grazeamt;
    sizesum = global.grazesize;
    
    for (var i = 0; i < 3; i += 1)
    {
        for (j = 0; j < 3; j += 1)
        {
            if (global.char[i] != 0)
            {
                grazesum += global.itemgrazeamt[global.char[i]][j];
                sizesum += global.itemgrazesize[global.char[i]][j];
            }
        }
    }
    
    if (haveflowery)
    {
        if (coord == 2)
        {
            if (global.submenu == 20 || global.submenu == 21)
            {
                atsum = 999;
                dfsum = 999;
                magsum = 999;
            }
        }
    }
    
    draw_text(xx + 230, ch_y[0], string_hash_to_newline(floor(atsum)));
    draw_text(xx + 230, ch_y[1], string_hash_to_newline(floor(dfsum)));
    draw_text(xx + 230, ch_y[2], string_hash_to_newline(floor(magsum)));
    var spell_xoff = langopt(0, -10);
    
    for (var i = 0; i < 6; i += 1)
    {
        if (global.spell[charcoord][i] > 0)
        {
            g = 0;
            
            if (global.spellusable[charcoord][i] == 0)
                g = 1;
            
            if (global.spellcost[charcoord][i] > global.tension)
                g = 1;
            
            if (g == 0)
                draw_set_color(c_white);
            
            if (g == 1)
                draw_set_color(c_gray);
            
            if (global.lang == "ja")
                draw_text_width(xx + 310, ch_y[i], string_hash_to_newline(string(round((global.spellcost[charcoord][i] / global.maxtension) * 100)) + "%"), 42);
            else
                draw_text(xx + 340, ch_y[i], string_hash_to_newline(string(round((global.spellcost[charcoord][i] / global.maxtension) * 100)) + "%"));
            
            var xloc = xx + 410;
            
            if (global.lang == "ja")
                xloc = xx + 390;
            
            draw_text(xloc + spell_xoff, ch_y[i], string_hash_to_newline(global.spellname[charcoord][i]));
        }
    }
    
    if (global.submenu == 21)
    {
        var jpxoff = 0;
        
        if (global.lang == "ja")
            jpxoff = 40;
        
        draw_sprite(spr_heart, 0, xx + 320 + jpxoff, yy + 240 + (global.submenucoord[21] * 25));
    }
    
    if (deschaver == 1)
    {
        draw_set_color(c_white);
        draw_text(xx + 20, yy + 10, string_hash_to_newline(global.spelldesc[charcoord][global.submenucoord[21]]));
    }
    
    xx = memxx;
}

if (global.menuno == 2)
{
    var memxx = xx;
    
    if (global.lang == "ja")
        xx -= 22;
    
    draw_set_color(c_black);
    var ch_vspace = langopt(27, 28);
    var ln_xoff1 = langopt(580, 626);
    var ln_xoff2 = langopt(590, 636);
    ossafe_fill_rectangle(xx + 60, yy + 90, xx + ln_xoff1, yy + 410, false);
    scr_darkbox(xx + 50, yy + 80, xx + ln_xoff2, yy + 420);
    draw_set_color(c_white);
    var vertlineTop = 
    {
        x: xx + 248 + 22,
        y: yy + 88,
        w: 6,
        h: 134
    };
    
    with (vertlineTop)
        draw_sprite_ext(spr_pxwhite, 0, x, y, w, h, 0, c_white, 1);
    
    var lhor = 
    {
        x: xx + 59,
        y: yy + 221,
        w: 522,
        h: 6
    };
    
    if (global.lang == "ja")
        lhor.w += 46;
    
    with (lhor)
        draw_sprite_ext(spr_pxwhite, 0, x, y, w, h, 0, c_white, 1);
    
    var midVer = 
    {
        x: xx + 301 + 22,
        y: yy + 222,
        w: 6,
        h: 189
    };
    
    with (midVer)
        draw_sprite_ext(spr_pxwhite, 0, x, y, w, h, 0, c_white, 1);
    
    draw_sprite_ext(scr_84_get_sprite("spr_dmenu_captions"), 0, xx + 118, yy + 86, 2, 2, 0, c_white, 1);
    draw_sprite_ext(scr_84_get_sprite("spr_dmenu_captions"), 1, xx + 376, yy + 86, 2, 2, 0, c_white, 1);
    
    if (global.submenucoord[11] == 1 || global.submenucoord[11] == 2)
        draw_sprite_ext(scr_84_get_sprite("spr_dmenu_captions"), 2, xx + 372, yy + 216, 2, 2, 0, c_white, 1);
    else
        draw_sprite_ext(scr_84_get_sprite("spr_dmenu_captions"), 3, xx + 372, yy + 216, 2, 2, 0, c_white, 1);
    
    draw_sprite_ext(scr_84_get_sprite("spr_dmenu_captions"), 4, xx + 116, yy + 216, 2, 2, 0, c_white, 1);
    coord = global.submenucoord[10];
    charcoord = global.char[coord];
    menusiner += 1;
    draw_set_color(c_white);
    scr_84_set_draw_font("mainbig");
    var charname_xoff = langopt(0, -25);
    draw_text(xx + 135 + charname_xoff, yy + 107, string_hash_to_newline(global.charname[charcoord]));
    
    for (var i = 0; i < 3; i += 1)
    {
        chosen = 0.4;
        
        if (i == coord)
            chosen = 1;
        
        var headssprite = 4649;
        
        if (global.flag[1311] == 1)
            headssprite = 4646;
        
        var dodraw = true;
        
        if (i == 2 && haveflowery)
        {
            dodraw = false;
            draw_sprite_ext(spr_flowery_equipchar, 0, 90 + xx + (i * 50) + 6, (160 + yy) - 8, 2, 2, 0, c_white, chosen);
        }
        
        if (dodraw)
            draw_sprite_ext(headssprite, global.char[i], 90 + xx + (i * 50), 160 + yy, 2, 2, 0, c_white, chosen);
    }
    
    if (global.submenu == 10)
        draw_sprite(spr_heart_harrows, menusiner / 20, 100 + xx + (coord * 50), 142 + yy);
    
    if (global.submenu != 11)
    {
        bicon = charcoord - 1;
        
        if (charcoord == 4)
            bicon = 5;
        
        draw_sprite_ext(spr_dmenu_equip, bicon, xx + 302, yy + 108, 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_dmenu_equip, 3, xx + 302, yy + 142, 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_dmenu_equip, 4, xx + 302, yy + 172, 2, 2, 0, c_white, 1);
    }
    
    if (global.submenu == 11)
    {
        bicon = charcoord - 1;
        
        if (charcoord == 4)
            bicon = 5;
        
        if (global.submenucoord[11] == 0)
            draw_sprite(spr_heart, 0, xx + 308, yy + 122);
        else
            draw_sprite_ext(spr_dmenu_equip, bicon, xx + 302, yy + 108, 2, 2, 0, c_white, 1);
        
        if (global.submenucoord[11] == 1)
            draw_sprite(spr_heart, 0, xx + 308, yy + 152);
        else
            draw_sprite_ext(spr_dmenu_equip, 3, xx + 302, yy + 142, 2, 2, 0, c_white, 1);
        
        if (global.submenucoord[11] == 2)
            draw_sprite(spr_heart, 0, xx + 308, yy + 182);
        else
            draw_sprite_ext(spr_dmenu_equip, 4, xx + 302, yy + 172, 2, 2, 0, c_white, 1);
    }
    
    if (charweaponname[charcoord] != " " || charweaponname[charcoord] != "")
    {
        draw_text(xx + 365, yy + 112, string_hash_to_newline(charweaponname[charcoord]));
        draw_item_icon(xx + 343, yy + 118, charweaponicon[charcoord]);
    }
    else
    {
        draw_set_color(c_dkgray);
        draw_text(xx + 365, yy + 112, string_hash_to_newline(stringsetloc("(Nothing)", "obj_darkcontroller_slash_Draw_0_gml_453_0")));
        draw_set_color(c_white);
    }
    
    if (global.chararmor1[charcoord] != 0)
    {
        draw_text(xx + 365, yy + 142, string_hash_to_newline(chararmor1name[charcoord]));
        draw_item_icon(xx + 343, yy + 148, chararmor1icon[charcoord]);
    }
    else
    {
        draw_set_color(c_dkgray);
        draw_text(xx + 365, yy + 142, string_hash_to_newline(stringsetloc("(Nothing)", "obj_darkcontroller_slash_Draw_0_gml_465_0")));
        draw_set_color(c_white);
    }
    
    if (global.chararmor2[charcoord] != 0)
    {
        draw_text(xx + 365, yy + 172, string_hash_to_newline(chararmor2name[charcoord]));
        draw_item_icon(xx + 343, yy + 178, chararmor2icon[charcoord]);
    }
    else
    {
        draw_set_color(c_dkgray);
        draw_text(xx + 365, yy + 172, string_hash_to_newline(stringsetloc("(Nothing)", "obj_darkcontroller_slash_Draw_0_gml_477_0")));
        draw_set_color(c_white);
    }
    
    var eq_xoff = langopt(0, -6);
    
    if (global.submenucoord[11] == 0)
    {
        j = 0;
        
        for (var i = pagemax[0]; i < (pagemax[0] + 6); i += 1)
        {
            g = 0;
            
            if (charcoord == 1 && weaponchar1[i] == 0)
                g = 1;
            
            if (charcoord == 2 && weaponchar2[i] == 0)
                g = 1;
            
            if (charcoord == 3 && weaponchar3[i] == 0)
                g = 1;
            
            if (charcoord == 4 && weaponchar4[i] == 0)
                g = 1;
            
            if (g == 0)
                draw_set_color(c_white);
            
            if (g == 1)
                draw_set_color(c_gray);
            
            draw_item_icon(xx + 364 + eq_xoff, yy + 236 + (j * ch_vspace), weaponicon[i]);
            
            if (global.weapon[i] != 0)
            {
                draw_text(xx + 384 + eq_xoff, yy + 230 + (j * ch_vspace), string_hash_to_newline(weaponname[i]));
            }
            else
            {
                draw_set_color(c_dkgray);
                draw_text(xx + 384 + eq_xoff, yy + 230 + (j * ch_vspace), string_hash_to_newline(stringsetloc("---------", "obj_darkcontroller_slash_Draw_0_gml_585_0")));
            }
            
            j += 1;
        }
    }
    
    if (global.submenucoord[11] == 1 || global.submenucoord[11] == 2)
    {
        j = 0;
        
        for (var i = pagemax[1]; i < (6 + pagemax[1]); i += 1)
        {
            g = 0;
            
            if (charcoord == 1 && armorchar1[i] == 0)
                g = 1;
            
            if (charcoord == 2 && armorchar2[i] == 0)
                g = 1;
            
            if (charcoord == 3 && armorchar3[i] == 0)
                g = 1;
            
            if (charcoord == 4 && armorchar4[i] == 0)
                g = 1;
            
            if (g == 0)
                draw_set_color(c_white);
            
            if (g == 1)
                draw_set_color(c_gray);
            
            draw_item_icon(xx + 364 + eq_xoff, yy + 236 + (j * ch_vspace), armoricon[i]);
            
            if (global.armor[i] != 0)
            {
                draw_text(xx + 384 + eq_xoff, yy + 230 + (j * ch_vspace), string_hash_to_newline(armorname[i]));
            }
            else
            {
                draw_set_color(c_dkgray);
                draw_text(xx + 384 + eq_xoff, yy + 230 + (j * ch_vspace), string_hash_to_newline(stringsetloc("---------", "obj_darkcontroller_slash_Draw_0_gml_609_0")));
            }
            
            j += 1;
        }
    }
    
    if (global.submenu == 12 || global.submenu == 13 || global.submenu == 14)
    {
        var __equipmenumax = 47;
        var scroll_xoff = langopt(0, 50);
        
        if (global.submenu == 12)
            pm = 0;
        else
            pm = 1;
        
        draw_sprite(spr_heart, 0, xx + 344 + eq_xoff, yy + 240 + ((global.submenucoord[global.submenu] - pagemax[pm]) * 27));
        draw_set_color(c_dkgray);
        ossafe_fill_rectangle(xx + 555 + scroll_xoff, yy + 260, xx + 560 + scroll_xoff, yy + 263 + 115, false);
        draw_set_color(c_white);
        ossafe_fill_rectangle(xx + 555 + scroll_xoff, (yy + 260 + (pagemax[pm] * 2.738095238095238)) - 1, xx + 560 + scroll_xoff, yy + 263 + (pagemax[pm] * 2.738095238095238) + 1, false);
        
        if (pagemax[pm] > 0)
            draw_sprite_ext(spr_morearrow, 0, xx + 551 + scroll_xoff, (yy + 250) - (sin(cur_jewel / 12) * 3), 1, -1, 0, c_white, 1);
        
        if ((5 + pagemax[pm]) < __equipmenumax)
            draw_sprite_ext(spr_morearrow, 0, xx + 551 + scroll_xoff, yy + 385 + (sin(cur_jewel / 12) * 3), 1, 1, 0, c_white, 1);
    }
    
    draw_set_color(c_white);
    var descoff = (global.lang == "en") ? 0 : 20;
    var txt = "";
    
    if (global.submenu == 11)
    {
        if (global.submenucoord[11] == 0)
            txt = charweapondesc[charcoord];
        
        if (global.submenucoord[11] == 1)
            txt = chararmor1desc[charcoord];
        
        if (global.submenucoord[11] == 2)
            txt = chararmor2desc[charcoord];
    }
    
    if (global.submenu == 12)
        txt = weapondesc[global.submenucoord[12]];
    
    if (global.submenu == 13 || global.submenu == 14)
        txt = armordesc[global.submenucoord[global.submenu]];
    
    if (txt != "")
        draw_text(xx + 20 + descoff, yy + 10, string_hash_to_newline(txt));
    
    draw_set_color(c_white);
    draw_text(xx + 100, yy + 230 + (ch_vspace * 0), string_hash_to_newline(stringsetloc("Attack: ", "obj_darkcontroller_slash_Draw_0_gml_586_0")));
    draw_item_icon(xx + 74, yy + 236 + (ch_vspace * 0), 1);
    draw_text(xx + 100, yy + 230 + (ch_vspace * 1), string_hash_to_newline(stringsetloc("Defense: ", "obj_darkcontroller_slash_Draw_0_gml_587_0")));
    draw_item_icon(xx + 74, yy + 236 + (ch_vspace * 1), 4);
    draw_text(xx + 100, yy + 230 + (ch_vspace * 2), string_hash_to_newline(stringsetloc("Magic: ", "obj_darkcontroller_slash_Draw_0_gml_588_0")));
    draw_item_icon(xx + 74, yy + 236 + (ch_vspace * 2), 5);
    atsum = global.at[global.char[coord]] + global.itemat[global.char[coord]][0] + global.itemat[global.char[coord]][1] + global.itemat[global.char[coord]][2];
    dfsum = global.df[global.char[coord]] + global.itemdf[global.char[coord]][0] + global.itemdf[global.char[coord]][1] + global.itemdf[global.char[coord]][2];
    magsum = global.mag[global.char[coord]] + global.itemmag[global.char[coord]][0] + global.itemmag[global.char[coord]][1] + global.itemmag[global.char[coord]][2];
    atsum = floor(atsum);
    dfsum = floor(dfsum);
    magsum = floor(magsum);
    grazesum = global.grazeamt;
    sizesum = global.grazesize;
    
    for (var i = 0; i < 3; i += 1)
    {
        for (j = 0; j < 3; j += 1)
        {
            if (global.char[i] != 0)
            {
                grazesum += global.itemgrazeamt[global.char[i]][j];
                sizesum += global.itemgrazesize[global.char[i]][j];
            }
        }
    }
    
    if (global.submenu == 12 || global.submenu == 13 || global.submenu == 14)
    {
        cur = global.submenucoord[global.submenu];
        g = 0;
        
        if (global.submenu == 12)
        {
            if (charcoord == 1 && weaponchar1[cur] == 0)
                g = 1;
            
            if (charcoord == 2 && weaponchar2[cur] == 0)
                g = 1;
            
            if (charcoord == 3 && weaponchar3[cur] == 0)
                g = 1;
            
            if (charcoord == 4 && weaponchar4[cur] == 0)
                g = 1;
        }
        
        if (global.submenu == 13 || global.submenu == 14)
        {
            if (charcoord == 1 && armorchar1[cur] == 0)
                g = 1;
            
            if (charcoord == 2 && armorchar2[cur] == 0)
                g = 1;
            
            if (charcoord == 3 && armorchar3[cur] == 0)
                g = 1;
            
            if (charcoord == 4 && armorchar4[cur] == 0)
                g = 1;
        }
        
        _abilitytext[0] = charweaponability[charcoord];
        _abilitytext[1] = chararmor1ability[charcoord];
        _abilitytext[2] = chararmor2ability[charcoord];
        _abilitycolor[0] = 4210752;
        _abilitycolor[1] = 4210752;
        _abilitycolor[2] = 4210752;
        _abilityicon[0] = charweaponabilityicon[charcoord];
        _abilityicon[1] = chararmor1abilityicon[charcoord];
        _abilityicon[2] = chararmor2abilityicon[charcoord];
        
        if (g == 0 && global.submenu == 12)
        {
            atup = weaponat[cur] - global.itemat[charcoord][0];
            dfup = weapondf[cur] - global.itemdf[charcoord][0];
            magup = weaponmag[cur] - global.itemmag[charcoord][0];
            styleup = weaponstyle[cur];
            grazeup = weapongrazeamt[cur] - global.itemgrazeamt[charcoord][0];
            sizeup = weapongrazesize[cur] - global.itemgrazesize[charcoord][0];
            _abilitycolor[0] = 16777215;
            _abilityicon[0] = weaponabilityicon[cur];
            
            if (weaponability[cur] != _abilitytext[0])
            {
                _abilitycolor[0] = 65535;
                
                if (weaponability[cur] == " " || weaponability[cur] == "")
                    _abilitycolor[0] = 255;
            }
            
            _abilitytext[0] = weaponability[cur];
            draw_set_color(c_white);
            var atupsign = "";
            
            if (atup > 0)
            {
                draw_set_color(c_yellow);
                atupsign = "+";
            }
            
            if (atup < 0)
                draw_set_color(c_red);
            
            var s1_string = langopt(string(atsum + atup) + "(" + atupsign + string(atup) + ")", string(atsum + atup));
            draw_text(xx + 230, yy + 230 + (ch_vspace * 0), string(s1_string));
            draw_set_color(c_white);
            
            if (dfup > 0)
                draw_set_color(c_yellow);
            
            if (dfup < 0)
                draw_set_color(c_red);
            
            draw_text(xx + 230, yy + 230 + (ch_vspace * 1), string(dfsum + dfup));
            draw_set_color(c_white);
            
            if (magup > 0)
                draw_set_color(c_yellow);
            
            if (magup < 0)
                draw_set_color(c_red);
            
            draw_text(xx + 230, yy + 230 + (ch_vspace * 2), string(magsum + magup));
        }
        
        if (g == 0)
        {
            if (global.submenu == 13 || global.submenu == 14)
            {
                arno = global.submenu - 12;
                atup = armorat[cur] - global.itemat[charcoord][arno];
                dfup = armordf[cur] - global.itemdf[charcoord][arno];
                magup = armormag[cur] - global.itemmag[charcoord][arno];
                grazeup = armorgrazeamt[cur] - global.itemgrazeamt[charcoord][arno];
                sizeup = armorgrazesize[cur] - global.itemgrazesize[charcoord][arno];
                _abilitycolor[arno] = 16777215;
                _abilityicon[arno] = armorabilityicon[cur];
                
                if (armorability[cur] != _abilitytext[arno])
                {
                    _abilitycolor[arno] = 65535;
                    
                    if (armorability[cur] == " " || armorability[cur] == "")
                        _abilitycolor[arno] = 255;
                }
                
                _abilitytext[arno] = armorability[cur];
                draw_set_color(c_white);
                
                if (atup > 0)
                    draw_set_color(c_yellow);
                
                if (atup < 0)
                    draw_set_color(c_red);
                
                draw_text(xx + 230, yy + 230 + (ch_vspace * 0), string(atsum + atup));
                draw_set_color(c_white);
                
                if (dfup > 0)
                    draw_set_color(c_yellow);
                
                if (dfup < 0)
                    draw_set_color(c_red);
                
                draw_text(xx + 230, yy + 230 + (ch_vspace * 1), string(dfsum + dfup));
                draw_set_color(c_white);
                
                if (magup > 0)
                    draw_set_color(c_yellow);
                
                if (magup < 0)
                    draw_set_color(c_red);
                
                draw_text(xx + 230, yy + 230 + (ch_vspace * 2), string(magsum + magup));
            }
        }
        
        if (g == 1)
        {
            draw_text(xx + 230, yy + 230 + (ch_vspace * 0), string(atsum));
            draw_text(xx + 230, yy + 230 + (ch_vspace * 1), string(dfsum));
            draw_text(xx + 230, yy + 230 + (ch_vspace * 2), string(magsum));
        }
        
        for (var i = 0; i < 3; i += 1)
        {
            if (_abilitytext[i] == " " || _abilitytext[i] == "")
            {
                draw_set_color(_abilitycolor[i]);
                draw_text(xx + 100, yy + 230 + (ch_vspace * (i + 3)), string_hash_to_newline(stringsetloc("(No ability.)", "obj_darkcontroller_slash_Draw_0_gml_766_0")));
            }
            else
            {
                draw_set_color(_abilitycolor[i]);
                draw_text(xx + 100, yy + 230 + (ch_vspace * (i + 3)), string_hash_to_newline(_abilitytext[i]));
                draw_set_color(c_orange);
                draw_item_icon(xx + 74, yy + 238 + (ch_vspace * (i + 3)), _abilityicon[i]);
            }
        }
    }
    else
    {
        draw_text(xx + 230, yy + 230 + (ch_vspace * 0), string(atsum));
        draw_text(xx + 230, yy + 230 + (ch_vspace * 1), string(dfsum));
        draw_text(xx + 230, yy + 230 + (ch_vspace * 2), string(magsum));
        _abilitytext[0] = charweaponability[charcoord];
        _abilitytext[1] = chararmor1ability[charcoord];
        _abilitytext[2] = chararmor2ability[charcoord];
        _abilitycolor[0] = 16777215;
        _abilitycolor[1] = 16777215;
        _abilitycolor[2] = 16777215;
        _abilityicon[0] = charweaponabilityicon[charcoord];
        _abilityicon[1] = chararmor1abilityicon[charcoord];
        _abilityicon[2] = chararmor2abilityicon[charcoord];
        
        for (var i = 0; i < 3; i += 1)
        {
            if (_abilitytext[i] == " " || _abilitytext[i] == "")
            {
                draw_set_color(c_dkgray);
                draw_text(xx + 100, yy + 230 + (ch_vspace * (i + 3)), string_hash_to_newline(stringsetloc("(No ability.)", "obj_darkcontroller_slash_Draw_0_gml_803_0")));
            }
            else
            {
                draw_set_color(_abilitycolor[i]);
                draw_text(xx + 100, yy + 230 + (ch_vspace * (i + 3)), string_hash_to_newline(_abilitytext[i]));
                draw_set_color(c_orange);
                draw_item_icon(xx + 74, yy + 238 + (ch_vspace * (i + 3)), _abilityicon[i]);
            }
        }
    }
    
    xx = memxx;
}

if (global.menuno == 1)
{
    if (evidencecheck == -1)
    {
        evidencecheck = scr_keyitemcheck(20) + scr_keyitemcheck(21) + scr_keyitemcheck(22) + scr_keyitemcheck(23) + scr_keyitemcheck(26) + scr_keyitemcheck(27) + scr_keyitemcheck(28);
        evidencecheck = clamp(evidencecheck, 0, 1);
    }
    
    draw_set_color(c_black);
    ossafe_fill_rectangle(xx + langopt(70, 46), yy + 90, xx + langopt(570, 594), yy + 360, false);
    scr_darkbox(xx + langopt(60, 36), yy + 80, xx + langopt(580, 604), yy + 370);
    scr_84_set_draw_font("mainbig");
    scr_itemname();
    var _xoff = 0;
    
    if (evidencecheck)
    {
        _xoff = -35;
        
        if (global.lang == "ja")
            _xoff = -35;
    }
    
    if (global.submenu == 1)
        draw_sprite(spr_heart, 0, xx + langopt(155, 134) + (120 * global.submenucoord[1]) + _xoff, yy + 120);
    
    draw_set_color(c_white);
    var itemoff = langopt([180, 300, 420], [158, 278, 398]);
    
    if (global.submenu > 1)
    {
        if (global.submenucoord[1] == 0)
            draw_set_color(c_orange);
        else
            draw_set_color(c_gray);
    }
    
    draw_text(xx + itemoff[0] + _xoff, yy + 110, string_hash_to_newline(stringsetloc("USE", "obj_darkcontroller_slash_Draw_0_gml_837_0")));
    
    if (global.submenu > 1)
    {
        if (global.submenucoord[1] == 1)
            draw_set_color(c_orange);
        else
            draw_set_color(c_gray);
    }
    
    draw_text(xx + itemoff[1] + _xoff, yy + 110, string_hash_to_newline(stringsetloc("TOSS", "obj_darkcontroller_slash_Draw_0_gml_839_0")));
    
    if (global.submenu > 1)
    {
        if (global.submenucoord[1] == 2)
            draw_set_color(c_orange);
        else
            draw_set_color(c_gray);
    }
    
    var keystring = stringsetloc("KEY", "obj_darkcontroller_slash_Draw_0_gml_841_0");
    
    if (evidencecheck)
        keystring = stringsetloc("EVIDENCE", "obj_darkcontroller_slash_Draw_0_gml_1419_0");
    
    draw_text(xx + itemoff[2] + _xoff, yy + 110, string_hash_to_newline(keystring));
    
    if (global.submenu >= 2 && global.submenu <= 6 && global.submenu != 4)
    {
        sm = global.submenucoord[2];
        yheart = (floor(sm / 2) * 30) + 162 + yy;
        xheart = langopt(120, 72) + xx;
        
        if (sm == 1 || sm == 3 || sm == 5 || sm == 7 || sm == 9 || sm == 11)
            xheart = langopt(330, 334) + xx;
        
        if (global.submenu == 2 || global.submenu == 3)
            draw_sprite(spr_heart, 0, xheart, yheart);
        
        draw_set_color(c_white);
        draw_text(xx + 20, yy + 10, string_hash_to_newline(itemdesc[global.submenucoord[2]]));
    }
    
    if (global.submenu == 7)
    {
        draw_set_color(c_white);
        draw_text(xx + 20, yy + 10, string_hash_to_newline(stringsetsubloc("Really throw away the#~1?", global.itemname[global.submenucoord[2]], "obj_darkcontroller_slash_Draw_0_gml_956_0")));
    }
    
    if (global.submenucoord[1] != 2)
    {
        draw_set_color(bcolor);
        
        for (var i = 0; i < 6; i += 1)
        {
            draw_text(xx + langopt(148, 94), yy + 154 + (30 * i), string_hash_to_newline(global.itemname[i * 2]));
            draw_text(xx + 358, yy + 154 + (30 * i), string_hash_to_newline(global.itemname[(i * 2) + 1]));
        }
        
        draw_set_color(c_white);
        
        if (global.submenu == 1)
            draw_set_color(c_gray);
        
        for (var i = 0; i < 6; i += 1)
        {
            draw_text(xx + langopt(146, 92), yy + 152 + (30 * i), string_hash_to_newline(global.itemname[i * 2]));
            draw_text(xx + 356, yy + 152 + (30 * i), string_hash_to_newline(global.itemname[(i * 2) + 1]));
        }
    }
    
    if (global.submenucoord[1] == 2)
    {
        scr_keyiteminfo_all();
        draw_set_color(bcolor);
        
        for (var i = 0; i < 6; i += 1)
        {
            draw_text(xx + langopt(148, 94), yy + 154 + (30 * i), string_hash_to_newline(keyitemname[i * 2]));
            draw_text(xx + 358, yy + 154 + (30 * i), string_hash_to_newline(keyitemname[(i * 2) + 1]));
        }
        
        draw_set_color(c_white);
        
        if (global.submenu == 1)
            draw_set_color(c_gray);
        
        for (var i = 0; i < 6; i += 1)
        {
            if (global.submenu == 4)
            {
                if (keyitemusable[i * 2] == 1)
                    draw_set_color(c_white);
                else
                    draw_set_color(c_ltgray);
            }
            
            draw_text(xx + langopt(146, 92), yy + 152 + (30 * i), string_hash_to_newline(keyitemname[i * 2]));
            
            if (global.submenu == 4)
            {
                if (keyitemusable[(i * 2) + 1] == 1)
                    draw_set_color(c_white);
                else
                    draw_set_color(c_ltgray);
            }
            
            draw_text(xx + 356, yy + 152 + (30 * i), string_hash_to_newline(keyitemname[(i * 2) + 1]));
        }
        
        if (global.submenu == 4)
        {
            sm = global.submenucoord[4];
            yheart = (floor(sm / 2) * 30) + 162 + yy;
            xheart = langopt(120, 72) + xx;
            
            if (sm == 1 || sm == 3 || sm == 5 || sm == 7 || sm == 9 || sm == 11)
                xheart = langopt(330, 334) + xx;
            
            draw_sprite(spr_heart, 0, xheart, yheart);
            draw_set_color(c_white);
            draw_text(xx + 20, yy + 10, string_hash_to_newline(keyitemdesc[global.submenucoord[4]]));
        }
    }
}

if (haveflowery)
{
    var alpha = 1;
    
    if (global.submenu == 10 || global.submenu == 20)
    {
        if (global.submenucoord[global.submenu] == 2)
        {
            var _box = 
            {
                x: xx + 71,
                y: yy + 110,
                w: 171,
                h: 26
            };
            
            if (global.lang == "ja")
            {
                _box = 
                {
                    x: xx + 52,
                    y: yy + 108,
                    w: 183,
                    h: 30
                };
                
                if (global.submenu == 20)
                {
                    _box = 
                    {
                        x: xx + 72,
                        y: yy + 108,
                        w: 193,
                        h: 30
                    };
                }
            }
            
            with (_box)
                draw_sprite_ext(spr_pxwhite, 0, x, y, w, h, 0, c_black, 1);
            
            draw_set_halign(fa_center);
            var flname = stringsetloc("Flowery", "obj_darkcontroller_slash_Draw_0_gml_1545_0");
            draw_set_color(c_white);
            scr_84_set_draw_font("mainbig");
            var fname = 
            {
                x: (xx + 176) - 11,
                y: (yy + 106) - 1
            };
            
            if (global.submenu == 10)
            {
                fname = 
                {
                    x: ((xx + 176) - 11) + 5,
                    y: ((yy + 106) - 1) + 2
                };
            }
            
            if (global.lang == "ja")
            {
                fname = 
                {
                    x: xx + 142,
                    y: yy + 106 + 1
                };
                
                if (global.submenu == 20)
                {
                    fname = 
                    {
                        x: xx + 142 + 28,
                        y: yy + 106
                    };
                }
            }
            
            draw_text(fname.x, fname.y, flname);
            draw_set_halign(fa_left);
        }
    }
    
    if ((global.submenu == 10 || global.submenu == 20) && coord == 2)
    {
        var boxwid = 222;
        
        if (global.submenu == 10)
            boxwid = 220;
        
        if (global.lang == "en")
        {
            draw_sprite_ext(spr_pxwhite, 0, xx + 70, yy + 233, boxwid, 168, 0, #010000, alpha);
        }
        else
        {
            var _box = 
            {
                x: xx + 46,
                y: yy + 230,
                w: 255,
                h: 171
            };
            
            if (global.submenu == 20)
            {
                _box = 
                {
                    x: xx + 53,
                    y: yy + 227,
                    w: 224,
                    h: 174
                };
            }
            
            draw_sprite_ext(spr_pxwhite, 0, _box.x, _box.y, _box.w, _box.h, 0, c_black, alpha);
        }
        
        var stat = [];
        stat[0] = stringsetloc("Attack:", "obj_darkcontroller_slash_Draw_0_gml_1535_0");
        stat[1] = stringsetloc("Defense:", "obj_darkcontroller_slash_Draw_0_gml_1536_0");
        stat[2] = stringsetloc("Magic:", "obj_darkcontroller_slash_Draw_0_gml_1537_0");
        stat[3] = stringsetloc("Flowers:", "obj_darkcontroller_slash_Draw_0_gml_1538_0");
        stat[4] = stringsetloc("Floweriness:", "obj_darkcontroller_slash_Draw_0_gml_1539_0");
        stat[5] = stringsetloc("Guts:", "obj_darkcontroller_slash_Draw_0_gml_1540_0");
        var statamt = [];
        statamt[0] = "99";
        statamt[1] = "99";
        statamt[2] = "99";
        statamt[3] = "99";
        statamt[4] = " ";
        statamt[5] = " ";
        var icon = [];
        icon[0] = [4393, 1, 16777215, 0];
        icon[1] = [4393, 4, 16777215, 0];
        icon[2] = [4393, 5, 16777215, 0];
        icon[3] = [4393, 21, -1, 2];
        icon[4] = [4393, 21, -1, 0];
        icon[5] = [4393, 21, -1, 0];
        var space = 27;
        
        if (global.submenu == 20)
            space = 25;
        
        if (global.lang == "ja")
        {
            if (global.submenu == 20)
                space = 28;
        }
        
        scr_84_set_draw_font("mainbig");
        
        for (var i = 0; i < array_length(stat); i++)
        {
            var scale = 1;
            var width = string_width(stat[i]);
            var maxwidth = 122;
            var _p = 
            {
                x1: xx + 100,
                y1: yy + 230,
                x2: xx + 100 + 130,
                y2: yy + 230
            };
            
            if (global.lang == "ja")
            {
                _p.x1 -= 15;
                maxwidth = 131;
                _p.x2 -= 15;
            }
            
            if (width > maxwidth)
                scale = maxwidth / width;
            
            draw_text_transformed(_p.x1, _p.y1 + (i * space), stat[i], scale, 1, 0);
            draw_text(_p.x2, _p.y2 + (i * space), statamt[i]);
            var __jxoff = 0;
            
            if (global.lang == "ja")
                __jxoff -= 15;
            
            draw_sprite_ext(icon[i][0], icon[i][1], xx + 74 + __jxoff, yy + 236 + (i * space) + icon[i][3], 2, 2, 0, icon[i][2], 1);
        }
        
        var f = 
        {
            x: xx + 228,
            x2: xx + 212,
            y: yy + 336
        };
        
        if (global.submenu == 10)
        {
            f = 
            {
                x: xx + 230,
                x2: xx + 214,
                y: yy + 336 + 8
            };
        }
        
        if (global.lang == "ja")
        {
            f = 
            {
                x: (xx + 228) - 13,
                x2: (xx + 212) - 15,
                y: yy + 336 + 12
            };
            
            if (global.submenu == 10)
            {
                f = 
                {
                    x: (xx + 230) - 15,
                    x2: (xx + 214) - 15,
                    y: yy + 336 + 8
                };
            }
        }
        
        for (var i = 0; i < 5; i++)
        {
            with (f)
            {
                if (i < 3)
                    draw_sprite_ext(spr_dmenu_items_floweryhead, 0, x + (16 * i), y, 2, 2, 0, -1, 1);
                
                draw_sprite_ext(spr_dmenu_items_floweryhead, 0, x2 + (16 * i), y + space, 2, 2, 0, -1, 1);
            }
        }
    }
    
    if (global.submenu == 10 && coord == 2)
    {
        var flbox = 
        {
            x: xx + 336,
            y: yy + 114,
            w: 234,
            h: 91
        };
        
        if (global.lang == "ja")
        {
            flbox = 
            {
                x: xx + 312,
                y: yy + 109,
                w: 285,
                h: 103
            };
        }
        
        with (flbox)
            draw_sprite_ext(spr_pxwhite, 0, x, y, w, h, 0, c_black, 1);
        
        var equipped = [stringsetloc("WinningSmile", "obj_darkcontroller_slash_Draw_0_gml_1584_0"), stringsetloc("PetalMantle", "obj_darkcontroller_slash_Draw_0_gml_1585_0"), stringsetloc("SundayBest", "obj_darkcontroller_slash_Draw_0_gml_1586_0")];
        var space = 30;
        var icon = [[4393, 21], [4393, 4], [4393, 4]];
        var loff = 0;
        
        if (global.lang == "ja")
            loff = -22;
        
        for (var i = 0; i < array_length(equipped); i++)
        {
            draw_text(xx + 365 + loff, ((yy + 120) - 8) + (i * space), equipped[i]);
            draw_sprite_ext(icon[i][0], icon[i][1], xx + 343 + loff, yy + 118 + (i * space), 2, 2, 0, c_white, 1);
        }
        
        draw_sprite_ext(spr_pxwhite, 0, xx + 297 + loff, (yy + 112) - 4, 36, 34, 0, #010000, 1);
        draw_sprite_ext(spr_dmenu_equip_flowery, 0, xx + 302 + loff, (yy + 112) - 4 - 6, 2, 2, 0, -1, 1);
    }
    
    if (global.submenu == 20 && coord == 2)
    {
        var _box = 
        {
            x: xx + 302,
            y: yy + 235,
            w: 273,
            h: 160
        };
        
        if (global.lang == "ja")
        {
            _box = 
            {
                x: xx + 287,
                y: yy + 234,
                w: 296,
                h: 161
            };
        }
        
        draw_sprite_ext(spr_pxwhite, 0, _box.x, _box.y, _box.w, _box.h, 0, #010000, alpha);
        var spell = [];
        spell[0] = stringsetloc("Sanfrandisco", "obj_darkcontroller_slash_Draw_0_gml_1607_0");
        spell[1] = stringsetloc("MyJarona", "obj_darkcontroller_slash_Draw_0_gml_1608_0");
        spell[2] = stringsetloc("Ez2Dance", "obj_darkcontroller_slash_Draw_0_gml_1609_0");
        spell[3] = stringsetloc("PrismRush", "obj_darkcontroller_slash_Draw_0_gml_1610_0");
        spell[4] = stringsetloc("Afinihug", "obj_darkcontroller_slash_Draw_0_gml_1611_0");
        spell[5] = stringsetloc("HoneyKiss", "obj_darkcontroller_slash_Draw_0_gml_1612_0");
        var cost = [];
        cost[1] = 0;
        cost[1] = 99;
        cost[2] = 22;
        cost[3] = 111;
        cost[4] = 222;
        cost[5] = 333;
        var space = 25;
        scr_84_set_draw_font("mainbig");
        
        for (var i = 0; i < 6; i++)
        {
            var scale = 1;
            var width = string_width(spell[i]);
            var maxwidth = 144;
            var _x = xx + 410;
            
            if (global.lang == "ja")
            {
                _x -= 45;
                space = 28;
                maxwidth = 212;
            }
            
            if (width > maxwidth)
                scale = maxwidth / width;
            
            draw_text_transformed(_x, yy + 230 + (i * space), spell[i], scale, 1, 0);
            draw_text_transformed(_x - 70, yy + 230 + (i * space), string(cost[i]) + "%", 1, 1, 0);
        }
    }
}
