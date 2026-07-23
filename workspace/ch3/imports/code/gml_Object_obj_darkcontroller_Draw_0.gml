xx = __view_get(e__VW.XView, 0);
yy = __view_get(e__VW.YView, 0);
tpoff = (tp - tpy) + yy;
bpoff = -bp + bpy + yy;

if (global.chapter == 3 && i_ex(obj_tenna_enemy))
    exit;

if (drawchar == 1)
{
    draw_set_color(c_black);
    draw_rectangle(xx - 10, (yy + 480) - bp - 1, xx + 650, yy + 500, false);
    draw_set_color(c_black);
    draw_rectangle(xx - 10, yy + tp, xx + 650, yy - 10, false);
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
        
        for (i = 0; i < 5; i += 1)
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
        
        var ymod = 0;
        
        if (global.flag[1044] > 0 && global.chapter == 3)
            ymod = -7;
        
        draw_set_color(c_white);
        scr_84_set_draw_font("mainbig");
        draw_text(xx + 520, ((yy + tp) - 60) + ymod, string_hash_to_newline(stringsetsubloc("D$ ~1", string(global.gold), "obj_darkcontroller_slash_Draw_0_gml_47_0")));
        
        if (ymod != 0)
            draw_text(xx + 520, ((yy + tp) - 32) + ymod, string_hash_to_newline(stringsetsubloc("PTs ~1", string(global.flag[1044]), "obj_darkcontroller_slash_Draw_0_gml_58_0")));
    }
}

if (global.menuno == 5)
{
    var lang_off = langopt([90, 410, 420], [85, 412, 422]);
    draw_set_color(c_black);
    draw_rectangle(xx + 60, yy + lang_off[0], xx + 580, yy + lang_off[1], false);
    scr_darkbox(xx + 50, (yy + lang_off[0]) - 10, xx + 590, yy + lang_off[2]);
    
    if ((global.submenu >= 30 && global.submenu <= 33) || global.submenu == 36)
    {
        var _xPos = (global.lang == "en") ? (xx + 170) : (xx + 150);
        var _heartXPos = (global.lang == "en") ? (xx + 145) : (xx + 125);
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
        draw_text(_xPos, yy + 220, string_hash_to_newline(stringsetloc("Simplify VFX", "obj_darkcontroller_slash_Draw_0_gml_92_0")));
        draw_text(_selectXPos, yy + 220, string_hash_to_newline(flashoff));
        
        if (global.is_console)
        {
            draw_text(_xPos, yy + 255, string_hash_to_newline(autorun_text));
            draw_text(_selectXPos, yy + 255, string_hash_to_newline(runoff));
            
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
            draw_text(_xPos, yy + 290, string_hash_to_newline(autorun_text));
            draw_text(xx + 430, yy + 290, string_hash_to_newline(runoff));
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
        
        for (i = 0; i <= 8; i += 1)
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
    draw_rectangle(xx + 60, yy + 90, xx + langopt(580, 612), yy + 410, false);
    scr_darkbox(xx + 50, yy + 80, xx + langopt(590, 622), yy + 420);
    draw_set_color(c_white);
    draw_rectangle(xx + 60, yy + 216, xx + 60 + langopt(520, 552), yy + 216 + 5, false);
    draw_rectangle(xx + 294, yy + 220, xx + 294 + 5, (yy + 220 + 195) - 4, false);
    
    if (global.lang == "ja")
        draw_rectangle(xx + 60, yy + 216, xx + 60 + 552, yy + 216 + 5, false);
    
    draw_sprite_ext(_spr_dmenu_captions, 0, xx + 124, yy + 84, 2, 2, 0, c_white, 1);
    draw_sprite_ext(_spr_dmenu_captions, 4, xx + 124, yy + 210, 2, 2, 0, c_white, 1);
    draw_sprite_ext(_spr_dmenu_captions, 5, xx + 380, yy + 210, 2, 2, 0, c_white, 1);
    
    if (global.lang == "ja")
        draw_sprite_ext(_spr_dmenu_captions, 6, xx + 310, yy + 225, 1, 1, 0, c_white, 1);
    else
        draw_sprite_ext(_spr_dmenu_captions, 6, xx + 340, yy + 225, 1, 1, 0, c_white, 1);
    
    coord = global.submenucoord[20];
    charcoord = global.char[coord];
    menusiner += 1;
    draw_set_color(c_white);
    scr_84_set_draw_font("mainbig");
    draw_text(xx + 130, yy + 105, string_hash_to_newline(global.charname[charcoord]));
    
    for (i = 0; i < 3; i += 1)
    {
        chosen = 0.4;
        
        if (i == coord)
            chosen = 1;
        
        draw_sprite_ext(spr_equipchar_ch2, global.char[i], 90 + xx + (i * 50), 160 + yy, 2, 2, 0, c_white, chosen);
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
        
        if (global.chapter < 3)
        {
            draw_set_color(c_dkgray);
            draw_text(xx + 100, ch_y[4], string_hash_to_newline(stringsetloc("???", "obj_darkcontroller_slash_Draw_0_gml_226_0")));
        }
        else
        {
            draw_set_color(c_white);
            
            if (global.flag[1255] > 0)
            {
                draw_text(xx + 100 + 130, ch_y[4], string(clamp(global.flag[1255], 0, 9999)));
                var memfont = draw_get_font();
                draw_set_font(fnt_mainbig);
                draw_text((xx + 100) - 26, ch_y[4], "*");
                draw_set_font(memfont);
            }
            else
            {
                draw_set_color(c_dkgray);
                draw_text(xx + 100, ch_y[4], string_hash_to_newline(stringsetloc("???", "obj_darkcontroller_slash_Draw_0_gml_416_0")));
            }
        }
        
        if (dograndom >= 97)
        {
            draw_set_color(c_white);
            draw_text(xx + 100, ch_y[3], string_hash_to_newline(stringsetloc("Dog:", "obj_darkcontroller_slash_Draw_0_gml_231_0")));
            draw_sprite_ext(spr_dog_sleep, -threebuffer / 30, xx + 220, ch_y[3] + 5, 2, 2, 0, c_white, 1);
        }
        else
        {
            draw_set_color(c_dkgray);
            draw_text(xx + 100, ch_y[3], string_hash_to_newline(stringsetloc("???", "obj_darkcontroller_slash_Draw_0_gml_236_0")));
        }
        
        draw_set_color(c_white);
        
        if (global.chapter >= 3)
        {
            char_desc = stringsetloc("LV3 Tactician#Commands the party#by ACTs.", "obj_darkcontroller_slash_Draw_0_gml_448_0");
            
            if (global.plot >= 250)
                char_desc = stringsetloc("LV3 Director#Moves the actors#around.", "obj_darkcontroller_slash_Draw_0_gml_451_0");
            
            if (scr_flag_get(1078) > 0)
                char_desc = stringsetloc("LV3 Moss Mystery#Intermediate moss#skills.", "obj_darkcontroller_slash_Draw_0_gml_456_0");
            
            if (scr_flag_get(1055) == 1)
                char_desc = stringsetloc("LV3 Blazer#Specializes in#sword attacks.", "obj_darkcontroller_slash_Draw_0_gml_461_0");
            
            if (scr_flag_get(1055) == 3)
                char_desc = stringsetloc("LV3 Ice Blazer#Specializes in#sword attacks.", "obj_darkcontroller_slash_Draw_0_gml_466_0");
            
            if (scr_flag_get(1055) == 6)
                char_desc = stringsetloc("LV3 Sheath#Breath quickens#around swords.", "obj_darkcontroller_slash_Draw_0_gml_471_0");
            
            if (scr_keyitemcheck(2))
                char_desc = stringsetloc("LV3 Enjoying#the youthful#days.", "obj_darkcontroller_slash_Draw_0_gml_476_0");
        }
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
        
        draw_text(xx + 100, ch_y[3], string_hash_to_newline(stringsetloc("Rudeness ", "obj_darkcontroller_slash_Draw_0_gml_251_0")));
        draw_item_icon(xx + 74, ch_y[3] + 6, 13);
        draw_text(xx + 230, ch_y[3], string_hash_to_newline(rude_amount));
        
        if (global.chapter == 3)
        {
            char_desc = stringsetloc("LV3 Dark Knight#Does damage using#dark energy.", "obj_darkcontroller_slash_Draw_0_gml_528_0");
            
            if (global.plot >= 250)
                char_desc = stringsetloc("LV3 Dark Actor#Participates in#occult ACTs.", "obj_darkcontroller_slash_Draw_0_gml_532_0");
            
            if (global.flag[1256] <= 0)
            {
                draw_set_color(c_dkgray);
                draw_text(xx + 100, ch_y[4], string_hash_to_newline(stringsetloc("??? ", "obj_darkcontroller_slash_Draw_0_gml_536_0")));
                draw_set_color(c_white);
            }
            else
            {
                var grasstime = (round(get_timer()) / 1000000) * 4;
                draw_sprite_ext(spr_board_grabbablegrass, grasstime, xx + 66, ch_y[4] + 2, 2, 2, 0, c_white, 1);
                draw_text(xx + 100, ch_y[4], stringsetloc("Plucked", "obj_darkcontroller_slash_Draw_0_gml_552_0"));
                draw_text(xx + 230, ch_y[4], string(clamp(global.flag[1256], 0, 99)));
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
        
        if (global.chapter == 3)
        {
            guts_amount = 1;
            char_desc = stringsetloc("LV3 Dark Prince#Dark-World being.#Has friends, but...", "obj_darkcontroller_slash_Draw_0_gml_598_0");
            
            if (global.plot >= 250)
                char_desc = stringsetloc("LV3 Dark Actor#Has issues with#method acting.", "obj_darkcontroller_slash_Draw_0_gml_602_0");
            
            if (room == room_dw_teevie_cowboy_zone_02_after)
            {
                if (scr_flag_get(1152) == 0)
                    char_desc = stringsetloc("LV3 Horse#Is a horse.", "obj_darkcontroller_slash_Draw_0_gml_609_0_b");
            }
            
            if (scr_flag_get(1152) == 1)
                char_desc = stringsetloc("LV3 Ex-Horse#Was a horse at#some point.", "obj_darkcontroller_slash_Draw_0_gml_615_0");
            
            if (global.plot >= 320)
                char_desc = stringsetloc("LV3 Dark Prince#Dark-World being.#Has friends.", "obj_darkcontroller_slash_Draw_0_gml_620_0");
            
            if (global.flag[1257] == 0)
            {
                draw_set_color(c_dkgray);
                draw_text(xx + 100, ch_y[3], string_hash_to_newline(stringsetloc("??? ", "obj_darkcontroller_slash_Draw_0_gml_624_0")));
                draw_set_color(c_white);
            }
            else
            {
                var ary = ch_y[3] + 14;
                draw_sprite_ext(spr_custommenu_arrow_nooutline, 0, xx + 44 + 38, ary, 2, 2, 180, c_white, 1);
                draw_sprite_ext(spr_pxwhite, 0, (xx + 44 + 38) - 12, ary + 4, 24, 8, 0, c_black, 1);
                draw_sprite_ext(spr_pxwhite, 0, (xx + 44 + 38) - 4, ary + 4, 8, 8, 0, c_white, 1);
                draw_text(xx + 100, ch_y[3], stringsetloc("Carried", "obj_darkcontroller_slash_Draw_0_gml_651_0"));
                draw_text(xx + 230, ch_y[3], string(clamp(global.flag[1257], 0, 99)));
            }
        }
        
        var __scale = 0.8;
        
        if (global.lang == "ja")
            __scale = 1;
        
        draw_text_transformed(xx + 100, ch_y[4], string_hash_to_newline(stringsetloc("Fluffiness", "obj_darkcontroller_slash_Draw_0_gml_286_0")), __scale, 1, 0);
        draw_item_icon(xx + 74, ch_y[4] + 6, 12);
        
        for (i = 0; i < fluff_amount; i += 1)
            draw_item_icon(xx + 230 + (i * 20), ch_y[4] + 6, 12);
    }
    
    if (charcoord == 4)
    {
        guts_amount = 0;
        char_desc = stringsetloc("LV1 Snowcaster#Might be able to#use some cool moves.", "obj_darkcontroller_slash_Draw_0_gml_382_0");
        
        if (global.flag[925] > 0)
            char_desc = stringsetsubloc("LV~1 Frostmancer#Freezes the enemy.", falselv, "obj_darkcontroller_slash_Draw_0_gml_383_0");
        
        if (global.charweapon[4] == 13)
            char_desc = stringsetsubloc("LV~1 Ice Trancer#Receives pain to#become stronger.", falselv, "obj_darkcontroller_slash_Draw_0_gml_384_0");
        
        if (global.flag[921] == 1 && scr_sideb_get_phase() == 0)
            char_desc = stringsetsubloc("LV~1 Moss Neutral#Neither chaotic nor#lawful to moss.", falselv, "obj_darkcontroller_slash_Draw_0_gml_385_0");
        
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
    
    for (i = 0; i < guts_amount; i += 1)
        draw_item_icon(xx + 190 + (i * 20) + guts_xoff, ch_y[5] + 6, 9);
    
    atsum = global.at[global.char[coord]] + global.itemat[global.char[coord]][0] + global.itemat[global.char[coord]][1] + global.itemat[global.char[coord]][2];
    dfsum = global.df[global.char[coord]] + global.itemdf[global.char[coord]][0] + global.itemdf[global.char[coord]][1] + global.itemdf[global.char[coord]][2];
    magsum = global.mag[global.char[coord]] + global.itemmag[global.char[coord]][0] + global.itemmag[global.char[coord]][1] + global.itemmag[global.char[coord]][2];
    grazesum = global.grazeamt;
    sizesum = global.grazesize;
    
    for (i = 0; i < 3; i += 1)
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
    
    draw_text(xx + 230, ch_y[0], string_hash_to_newline(floor(atsum)));
    draw_text(xx + 230, ch_y[1], string_hash_to_newline(floor(dfsum)));
    draw_text(xx + 230, ch_y[2], string_hash_to_newline(floor(magsum)));
    var spell_xoff = langopt(0, -10);
    
    for (i = 0; i < 6; i += 1)
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
            
            if (g == 0)
                draw_set_color(c_white);
            
            if (global.lang == "ja")
                draw_text_width(xx + 310, ch_y[i], string_hash_to_newline(string(round((global.spellcost[charcoord][i] / global.maxtension) * 100)) + "%"), 42);
            else
                draw_text(xx + 340, ch_y[i], string_hash_to_newline(string(round((global.spellcost[charcoord][i] / global.maxtension) * 100)) + "%"));
            
            if (global.lang == "ja")
                draw_text(xx + 390 + spell_xoff, ch_y[i], string_hash_to_newline(global.spellname[charcoord][i]));
            else
                draw_text(xx + 410 + spell_xoff, ch_y[i], string_hash_to_newline(global.spellname[charcoord][i]));
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
    draw_rectangle(xx + 60, yy + 90, xx + ln_xoff1, yy + 410, false);
    scr_darkbox(xx + 50, yy + 80, xx + ln_xoff2, yy + 420);
    draw_set_color(c_white);
    draw_rectangle(xx + 270, yy + 91, xx + 275, yy + 91 + 135, false);
    var __off = 0;
    
    if (global.lang != "ja")
        __off = -4;
    
    draw_rectangle(xx + 59, yy + 221, xx + langopt(584, 628) + __off, yy + 221 + 5, false);
    draw_rectangle(xx + 323, yy + 221, xx + 323 + 5, yy + 221 + 190, false);
    draw_sprite_ext(_spr_dmenu_captions, 0, xx + 118, yy + 86, 2, 2, 0, c_white, 1);
    draw_sprite_ext(_spr_dmenu_captions, 1, xx + 376, yy + 86, 2, 2, 0, c_white, 1);
    
    if (global.submenucoord[11] == 1 || global.submenucoord[11] == 2)
        draw_sprite_ext(_spr_dmenu_captions, 2, xx + 372, yy + 216, 2, 2, 0, c_white, 1);
    else
        draw_sprite_ext(_spr_dmenu_captions, 3, xx + 372, yy + 216, 2, 2, 0, c_white, 1);
    
    draw_sprite_ext(_spr_dmenu_captions, 4, xx + 116, yy + 216, 2, 2, 0, c_white, 1);
    coord = global.submenucoord[10];
    charcoord = global.char[coord];
    menusiner += 1;
    draw_set_color(c_white);
    scr_84_set_draw_font("mainbig");
    var charname_xoff = langopt(0, -25);
    draw_text(xx + 135 + charname_xoff, yy + 107, string_hash_to_newline(global.charname[charcoord]));
    
    for (i = 0; i < 3; i += 1)
    {
        chosen = 0.4;
        
        if (i == coord)
            chosen = 1;
        
        draw_sprite_ext(spr_equipchar_ch2, global.char[i], 90 + xx + (i * 50), 160 + yy, 2, 2, 0, c_white, chosen);
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
    
    if (charweaponname[charcoord] != " ")
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
        
        for (i = pagemax[0]; i < (pagemax[0] + 6); i += 1)
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
        
        for (i = pagemax[1]; i < (6 + pagemax[1]); i += 1)
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
        draw_rectangle(xx + 555 + scroll_xoff, yy + 260, xx + 560 + scroll_xoff, yy + 263 + 115, false);
        draw_set_color(c_white);
        draw_rectangle(xx + 555 + scroll_xoff, (yy + 260 + (pagemax[pm] * 2.738095238095238)) - 1, xx + 560 + scroll_xoff, yy + 263 + (pagemax[pm] * 2.738095238095238) + 1, false);
        
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
    
    for (i = 0; i < 3; i += 1)
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
                
                if (weaponability[cur] == " ")
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
                    
                    if (armorability[cur] == " ")
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
        
        for (i = 0; i < 3; i += 1)
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
        
        for (i = 0; i < 3; i += 1)
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
    draw_set_color(c_black);
    draw_rectangle(xx + langopt(70, 46), yy + 90, xx + langopt(570, 594), yy + 360, false);
    scr_darkbox(xx + langopt(60, 36), yy + 80, xx + langopt(580, 604), yy + 370);
    scr_84_set_draw_font("mainbig");
    scr_itemname();
    
    if (global.submenu == 1)
        draw_sprite(spr_heart, 0, xx + langopt(155, 134) + (120 * global.submenucoord[1]), yy + 120);
    
    draw_set_color(c_white);
    var itemoff = langopt([180, 300, 420], [158, 278, 398]);
    
    if (global.submenu > 1)
    {
        if (global.submenucoord[1] == 0)
            draw_set_color(c_orange);
        else
            draw_set_color(c_gray);
    }
    
    draw_text(xx + itemoff[0], yy + 110, string_hash_to_newline(stringsetloc("USE", "obj_darkcontroller_slash_Draw_0_gml_837_0")));
    
    if (global.submenu > 1)
    {
        if (global.submenucoord[1] == 1)
            draw_set_color(c_orange);
        else
            draw_set_color(c_gray);
    }
    
    draw_text(xx + itemoff[1], yy + 110, string_hash_to_newline(stringsetloc("TOSS", "obj_darkcontroller_slash_Draw_0_gml_839_0")));
    
    if (global.submenu > 1)
    {
        if (global.submenucoord[1] == 2)
            draw_set_color(c_orange);
        else
            draw_set_color(c_gray);
    }
    
    draw_text(xx + itemoff[2], yy + 110, string_hash_to_newline(stringsetloc("KEY", "obj_darkcontroller_slash_Draw_0_gml_841_0")));
    
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
        
        for (i = 0; i < 6; i += 1)
        {
            draw_text(xx + langopt(148, 94), yy + 154 + (30 * i), string_hash_to_newline(global.itemname[i * 2]));
            draw_text(xx + 358, yy + 154 + (30 * i), string_hash_to_newline(global.itemname[(i * 2) + 1]));
        }
        
        draw_set_color(c_white);
        
        if (global.submenu == 1)
            draw_set_color(c_gray);
        
        for (i = 0; i < 6; i += 1)
        {
            draw_text(xx + langopt(146, 92), yy + 152 + (30 * i), string_hash_to_newline(global.itemname[i * 2]));
            draw_text(xx + 356, yy + 152 + (30 * i), string_hash_to_newline(global.itemname[(i * 2) + 1]));
        }
    }
    
    if (global.submenucoord[1] == 2)
    {
        scr_keyiteminfo_all();
        draw_set_color(bcolor);
        
        for (i = 0; i < 6; i += 1)
        {
            draw_text(xx + langopt(148, 94), yy + 154 + (30 * i), string_hash_to_newline(keyitemname[i * 2]));
            draw_text(xx + 358, yy + 154 + (30 * i), string_hash_to_newline(keyitemname[(i * 2) + 1]));
        }
        
        draw_set_color(c_white);
        
        if (global.submenu == 1)
            draw_set_color(c_gray);
        
        for (i = 0; i < 6; i += 1)
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

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
