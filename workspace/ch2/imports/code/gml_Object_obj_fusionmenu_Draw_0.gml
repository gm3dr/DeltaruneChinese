if (init)
    event_inherited();

if (type == 2 && init == 1)
{
    draw_set_color(c_white);
    var topbary = 206;
    draw_rectangle(camerax() + 110, cameray() + topbary, (camerax() + 640) - 110, cameray() + topbary + 2, 0);
}

if (type == 1 && init == 1)
{
    draw_set_color(c_white);
    var topbary = 179;
    var botbary = 278;
    draw_rectangle((camerax() + 110) - 20, cameray() + topbary, ((camerax() + 640) - 110) + 20, cameray() + topbary + 2, 0);
    draw_rectangle((camerax() + 110) - 20, cameray() + botbary, ((camerax() + 640) - 110) + 20, cameray() + botbary + 2, 0);
    draw_set_halign(fa_right);
    
    if (global.lang == "ja")
        draw_text_transformed(((camerax() + 640) - 110) + 20 + 40, 346, string((floor(menuScrollCurrent[0]) / 2) + 1) + " / " + string(ceil(menuMaximumID[0] / 2)), /*0.5*/1, 1, 0);
    else
        draw_text_transformed(((camerax() + 640) - 110) + 20 + 40, 346, stringsetloc("Page ", "obj_fusionmenu_slash_Draw_0_gml_171_0") + string((floor(menuScrollCurrent[0]) / 2) + 1) + " / " + string(ceil(menuMaximumID[0] / 2)), /*0.5*/1, 1, 0);
    
    draw_set_halign(fa_left);
}

if (type == 3 && init == 1)
{
    if (menu == 0)
    {
        scr_84_set_draw_font("mainbig");
        draw_set_color(c_white);
        draw_text(xx + 80, yy + 30, stringsetloc("Recruits", "obj_fusionmenu_slash_Draw_0_gml_14_0"));
        
        if (alternateMenu == 0)
        {
            draw_rectangle(xx + 330, yy + 10, xx + 620, yy + 440, false);
            draw_set_color(c_black);
            draw_rectangle(xx + 334, yy + 14, (xx + 620) - 4, (yy + 440) - 4, false);
        }
        
        reccolor = c_black;
        
        if (recruitChapter[menuCoord[0]] == 1)
            reccolor = c_purple;
        
        if (recruitChapter[menuCoord[0]] == 2)
            reccolor = c_aqua;
        
        draw_rectangle_color(xx + 370, yy + 75, xx + 370 + 205, yy + 75 + 150, c_black, c_black, reccolor, reccolor, false);
        draw_set_color(c_white);
        draw_rectangle(xx + 370, yy + 75, xx + 370 + 205, yy + 75 + 150, true);
        recruitspriteheight = sprite_get_height(recruitSprite[menuCoord[0]]);
        recruitspritewidth = sprite_get_width(recruitSprite[menuCoord[0]]);
        rx = ((sprite_get_xoffset(recruitSprite[menuCoord[0]]) * 2) - recruitspritewidth) + (recruitSpriteX[menuCoord[0]] * 2);
        ry = ((sprite_get_yoffset(recruitSprite[menuCoord[0]]) * 2) - (recruitspriteheight * 2)) + (recruitSpriteY[menuCoord[0]] * 2);
        animer += 0.25;
        draw_sprite_ext(recruitSprite[menuCoord[0]], animer, xx + 470 + rx, yy + 220 + ry, 2, 2, 0, c_white, 1);
        
        if (recruitSprite[menuCoord[0]] == spr_werewire_idle)
        {
            draw_sprite_ext(spr_werewire_wire_curve, 0, (xx + 470 + rx) - 20, (yy + 220 + ry) - 12, 2, 2, 0, c_white, 1);
            draw_sprite_ext(spr_werewire_wire_vertical, 0, (xx + 470 + rx) - 20, (yy + 220 + ry) - 12 - 31, 2, 8, 0, c_white, 1);
        }
        
        draw_set_halign(fa_center);
        draw_text(xx + 473, yy + 240, recruitName[menuCoord[0]]);
        draw_set_halign(fa_left);
        draw_text_transformed(xx + 368, yy + 280, stringsetloc("CHAPTER ", "obj_fusionmenu_slash_Draw_0_gml_47_0") + string(recruitChapter[menuCoord[0]]) + "章", 1, 1, 0);
        draw_set_halign(fa_right);
        draw_text_transformed(xx + 576, yy + 280, stringsetloc("LV ", "obj_fusionmenu_slash_Draw_0_gml_48_0") + string(recruitLevel[menuCoord[0]]), 1, 1, 0);
        draw_set_halign(fa_left);
        
        if (alternateMenu == 0)
        {
            if (global.is_console || obj_gamecontroller.gamepad_active)
            {
                draw_sprite_ext(scr_getbuttonsprite(global.input_g[4], false), 0, xx + 380, yy + 323, 2, 2, 0, c_white, 1);
                draw_sprite_ext(scr_getbuttonsprite(global.input_g[5], false), 0, xx + 380, yy + 353, 2, 2, 0, c_white, 1);
                draw_text(xx + 414, yy + 320, string_hash_to_newline(stringsetloc("More Info", "obj_fusionmenu_slash_Draw_0_gml_70_0")));
                draw_text(xx + 414, yy + 350, string_hash_to_newline(stringsetloc("Quit", "obj_fusionmenu_slash_Draw_0_gml_71_0")));
            }
            else
            {
                draw_text(xx + 380, yy + 320, string_hash_to_newline(stringsetsubloc("~1: More Info#~2: Quit", scr_get_input_name(4), scr_get_input_name(5), "obj_fusionmenu_slash_Draw_0_gml_50_0")));
            }
        }
        else if (global.is_console || obj_gamecontroller.gamepad_active)
        {
            draw_sprite_ext(scr_getbuttonsprite(global.input_g[4], false), 0, xx + 380, yy + 323, 2, 2, 0, c_white, 1);
            draw_sprite_ext(scr_getbuttonsprite(global.input_g[5], false), 0, xx + 380, yy + 353, 2, 2, 0, c_white, 1);
            draw_text(xx + 414, yy + 320, string_hash_to_newline(stringsetloc("More Info", "obj_fusionmenu_slash_Draw_0_gml_83_0")));
            draw_text(xx + 414, yy + 350, string_hash_to_newline(stringsetloc("Quit", "obj_fusionmenu_slash_Draw_0_gml_84_0_b")));
        }
        else
        {
            draw_text(xx + 380, yy + 320, string_hash_to_newline(stringsetsubloc("~1: More Info#~2: Quit", scr_get_input_name(4), scr_get_input_name(5), "obj_fusionmenu_slash_Draw_0_gml_51_0")));
        }
        
        if (alternateMenu)
        {
            draw_set_halign(fa_center);
            draw_set_color(c_lime);
            draw_text_transformed(xx + 298, yy + 30, stringsetloc("PROGRESS", "obj_fusionmenu_slash_Draw_0_gml_56_0"), squished, 1, 0);
            draw_set_halign(fa_left);
        }
    }
    
    if (menu == 1)
    {
        reccolor = c_black;
        
        if (recruitChapter[menuCoord[1]] == 1)
            reccolor = c_purple;
        
        if (recruitChapter[menuCoord[1]] == 2)
            reccolor = c_aqua;
        
        draw_rectangle_color(xx + 80, yy + 70, xx + 80 + 205, yy + 70 + 150, c_black, c_black, reccolor, reccolor, false);
        draw_set_color(c_white);
        draw_rectangle(xx + 80, yy + 70, xx + 80 + 205, yy + 70 + 150, true);
        recruitspriteheight = sprite_get_height(recruitSprite[menuCoord[1]]);
        recruitspritewidth = sprite_get_width(recruitSprite[menuCoord[1]]);
        rx = ((sprite_get_xoffset(recruitSprite[menuCoord[1]]) * 2) - recruitspritewidth) + (recruitSpriteX[menuCoord[1]] * 2);
        ry = ((sprite_get_yoffset(recruitSprite[menuCoord[1]]) * 2) - (recruitspriteheight * 2)) + (recruitSpriteY[menuCoord[1]] * 2);
        animer += 0.25;
        draw_sprite_ext(recruitSprite[menuCoord[1]], animer, xx + 180 + rx, yy + 215 + ry, 2, 2, 0, c_white, 1);
        
        if (recruitSprite[menuCoord[1]] == spr_werewire_idle)
        {
            draw_sprite_ext(spr_werewire_wire_curve, 0, (xx + 180 + rx) - 20, (yy + 215 + ry) - 12, 2, 2, 0, c_white, 1);
            draw_sprite_ext(spr_werewire_wire_vertical, 0, (xx + 180 + rx) - 20, (yy + 215 + ry) - 12 - 31, 2, 8, 0, c_white, 1);
        }
        
        draw_set_color(c_white);
        draw_text(xx + 300, yy + 70, recruitName[menuCoord[1]]);
        draw_set_halign(fa_right);
        draw_text_transformed(xx + 590, yy + 30, string(menuCoord[menu] + 1) + "/" + string(menuMaximumID[menu] + 1), squished, 1, 0);
        draw_set_halign(fa_left);
        draw_text_transformed(xx + 300, yy + 30, stringsetloc("CHAPTER ", "obj_fusionmenu_slash_Draw_0_gml_84_0") + string(recruitChapter[menuCoord[1]]) + "章", squished, 1, 0);
        var ymod = 120;
        
        if (jp)
            ymod = 104;
        
        var memfont = draw_get_font();
        
        if (!jp)
        {
            draw_set_font(fnt_dotumche);
            draw_text_ext_transformed(xx + 300, yy + ymod, string_hash_to_newline(recruitDesc[menuCoord[1]]), 20, 280, 1, 1, 0);
        }
        else
        {
            draw_set_font(fnt_ja_kakugo);
            draw_text_ext_transformed(xx + 300, yy + 120, string_hash_to_newline(recruitDesc[menuCoord[1]]), 25, 280, 1, 1, 0);
        }
        
        draw_set_font(memfont);
        stringl[0] = stringsetloc("LIKE", "obj_fusionmenu_slash_Draw_0_gml_87_0");
        stringl[1] = stringsetloc("DISLIKE", "obj_fusionmenu_slash_Draw_0_gml_88_0");
        stringl[2] = stringsetloc("?????", "obj_fusionmenu_slash_Draw_0_gml_89_0");
        stringl[3] = stringsetloc("?????", "obj_fusionmenu_slash_Draw_0_gml_90_0");
        stringm[0] = recruitLike[menuCoord[1]];
        stringm[1] = recruitDislike[menuCoord[1]];
        stringm[2] = stringsetloc("?????????", "obj_fusionmenu_slash_Draw_0_gml_93_0");
        stringm[3] = stringsetloc("?????????", "obj_fusionmenu_slash_Draw_0_gml_94_0");
        stringn[0] = stringsetloc("LEVEL", "obj_fusionmenu_slash_Draw_0_gml_95_0");
        stringn[1] = stringsetloc("ATTACK", "obj_fusionmenu_slash_Draw_0_gml_96_0");
        stringn[2] = stringsetloc("DEFENSE", "obj_fusionmenu_slash_Draw_0_gml_97_0");
        stringn[3] = stringsetloc("ELEMENT  ", "obj_fusionmenu_slash_Draw_0_gml_98_0");
        stringo[0] = string(recruitLevel[menuCoord[1]]);
        stringo[1] = string(recruitAttack[menuCoord[1]]);
        stringo[2] = string(recruitDefense[menuCoord[1]]);
        stringo[3] = recruitElement[menuCoord[1]];
        stringel = stringn[3] + stringo[3];
        
        for (i = 0; i < 4; i++)
        {
            stringlscale = 1;
            stringmscale = 1;
            
            if (!jp)
            {
                if (string_width(string_hash_to_newline(stringl[i])) >= 60)
                    stringlscale = 80 / string_width(string_hash_to_newline(stringl[i]));
            }
            
            if (string_width(string_hash_to_newline(stringm[i])) >= 290)
                stringmscale = 290 / string_width(string_hash_to_newline(stringm[i]));
            
            draw_set_halign(fa_left);
            draw_text_transformed(xx + 80, yy + 240 + (i * 40), string_hash_to_newline(stringl[i]), stringlscale, 1, 0);
            draw_text_transformed(xx + 80 + 100, yy + 240 + (i * 40), string_hash_to_newline(stringm[i]), stringmscale, 1, 0);
            draw_set_halign(fa_right);
            
            if (i != 3)
            {
                draw_text_transformed(xx + 560, yy + 240 + (i * 40), string_hash_to_newline(stringn[i]), squished, 1, 0);
                draw_text_transformed(xx + 590, yy + 240 + (i * 40), string_hash_to_newline(stringo[i]), squished, 1, 0);
            }
            else
            {
                draw_text_transformed(xx + 590, yy + 240 + (i * 40), string_hash_to_newline(stringel), squished, 1, 0);
            }
            
            draw_set_halign(fa_left);
        }
        
        if (alternateMenu == 0)
        {
            if (recruitPlaceable[menuCoord[1]])
            {
                if (global.is_console || obj_gamecontroller.gamepad_active)
                {
                    draw_sprite_ext(scr_getbuttonsprite(global.input_g[4], false), 0, xx + 80, yy + 402, 2, 2, 0, c_white, 1);
                    draw_text(xx + 114, yy + 400, stringsetloc("Place", "obj_fusionmenu_slash_Draw_0_gml_169_0"));
                }
                else
                {
                    draw_text(xx + 80, yy + 400, stringsetsubloc("~1: Place", scr_get_input_name(4), "obj_fusionmenu_slash_Draw_0_gml_125_0"));
                }
            }
            else
            {
                draw_set_color(c_gray);
                draw_text(xx + 80, yy + 400, stringsetloc("Cannot Place", "obj_fusionmenu_slash_Draw_0_gml_129_0"));
            }
            
            draw_set_color(c_white);
            
            if (global.is_console || obj_gamecontroller.gamepad_active)
            {
                draw_sprite_ext(scr_getbuttonsprite(global.input_g[5], false), 0, xx + 320, yy + 402, 2, 2, 0, c_white, 1);
                draw_text(xx + 354, yy + 400, stringsetloc("Return", "obj_fusionmenu_slash_Draw_0_gml_186_0"));
            }
            else
            {
                draw_text(xx + 320, yy + 400, stringsetsubloc("~1: Return", scr_get_input_name(5), "obj_fusionmenu_slash_Draw_0_gml_132_0"));
            }
        }
        else if (global.is_console || obj_gamecontroller.gamepad_active)
        {
            var button_x = (global.lang == "en") ? (xx + 165) : (xx + 84);
            draw_sprite_ext(scr_getbuttonsprite(global.input_g[5], false), 0, button_x, yy + 402, 2, 2, 0, c_white, 1);
            var x_offset = (global.lang == "en") ? 0 : 38;
            draw_text(xx + 80 + x_offset, yy + 400, string_hash_to_newline(stringsetloc("Press         to Return", "obj_fusionmenu_slash_Draw_0_gml_199_0")));
        }
        else
        {
            draw_text(xx + 80, yy + 400, stringsetsubloc("Press ~1 to Return", scr_get_input_name(5), "obj_fusionmenu_slash_Draw_0_gml_136_0"));
        }
    }
}

if (type == 4 && init == 1)
{
    scr_84_set_draw_font("mainbig");
    
    if (menu == 0)
        draw_set_color(c_ltgray);
    else
        draw_set_color(c_dkgray);
    
    if (jp)
    {
        var memfont = draw_get_font();
        draw_set_font(fnt_ja_kakugo);
        draw_text_transformed(xx + 60, yy + 140, stringsetloc("HELD", "obj_fusionmenu_slash_Draw_0_gml_154_0"), 1, 1, 0);
        draw_set_font(memfont);
    }
    else
    {
        draw_set_font(scr_84_get_font("dotumche"));
        draw_text_transformed(xx + 60, yy + 140, stringset(/*"POCKET"*/"口袋"), 1, 1, 0);
    }
    
    if (menu == 1)
        draw_set_color(c_ltgray);
    
    if (menu < 1)
        draw_set_color(c_dkgray);
    
    if (jp)
    {
        var memfont = draw_get_font();
        draw_set_font(fnt_ja_kakugo);
        draw_text_transformed(xx + 60, yy + 290, stringsetloc("RESERVE", "obj_fusionmenu_slash_Draw_0_gml_159_0"), 1, 1, 0);
        draw_set_font(memfont);
    }
    else
    {
        draw_text_transformed(xx + 60, yy + 290, /*"STORAGE"*/"库存", 1, 1, 0);
    }
    
    if (jp)
    {
        var memfont = draw_get_font();
        draw_set_font(fnt_ja_kakugo);
        draw_text_transformed(xx + 60, yy + 360 + 14, stringsetloc("Page ", "obj_fusionmenu_slash_Draw_0_gml_161_0"), 1, 1, 0);
        draw_text_transformed(xx + 60, yy + 380 + 14, string((floor(menuScrollCurrent[1]) / 12) + 1) + "/" + string(floor(global.flag[64] / 12)), 1, 1, 0);
        draw_set_font(memfont);
    }
    else
    {
        draw_text_transformed(xx + 60, yy + 360, stringsetloc("Page ", "obj_fusionmenu_slash_Draw_0_gml_161_0"), 1, 1, 0);
        draw_text_transformed(xx + 60, yy + 380, string((floor(menuScrollCurrent[1]) / 12) + 1) + "/" + string(floor(global.flag[64] / 12)), 1, 1, 0);
    }
}

if (type == 5 && init == 1)
{
    draw_set_font(fnt_mainbig);
    draw_set_color(c_ltgray);
    draw_text_transformed(480, 280, stringsetloc("Page ", "obj_fusionmenu_slash_Draw_0_gml_171_0") + string((floor(menuScrollCurrent[0]) / 6) + 1) + " / " + string(ceil(menuMaximumID[0] / 6)), 1, 1, 0);
    tickerTimer++;
    scr_84_set_draw_font("dotumche");
    draw_text_transformed(440, 375, stringsetloc("Left / Right: \nChange Pages.", "obj_fusionmenu_slash_Draw_0_gml_181_0"), 1, 1, 0);
    
    if (subtype == 1)
        draw_text_transformed(440, 410, stringsetloc("The song you play\nwill be the town\nBGM.", "obj_fusionmenu_slash_Draw_0_gml_182_0"), 1, 1, 0);
    else
        draw_text_transformed(440, 410, stringsetloc("Play songs\nfreely.", "obj_fusionmenu_slash_Draw_0_gml_183_0"), 1, 1, 0);
    
    var tempSongName = chosenSongName + "    ";
    var songNameLength = string_length(tempSongName);
    var tickerSongName;
    
    if (songNameLength >= 24)
    {
        var tickerCount = max(0, floor((tickerTimer - 60) / 3)) % songNameLength;
        var tickerSongNamePrep = tempSongName + chosenSongName;
        tickerSongName = string_copy(tickerSongNamePrep, 1 + tickerCount, 20);
    }
    else
    {
        tickerSongName = tempSongName;
    }
    
    draw_set_color(c_lime);
    draw_text_transformed(440, 320, stringsetloc("Now Playing", "obj_fusionmenu_slash_Draw_0_gml_194_0"), 1, 1, 0);
    draw_text_transformed(440, 345, tickerSongName, 1, 1, 0);
}
