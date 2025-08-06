scr_84_set_draw_font("main");

if (BGMADE == 1)
{
    ANIM_SINER += 1;
    ANIM_SINER_B += 1;
    BG_SINER += 1;
    
    if (BG_ALPHA < 0.5)
        BG_ALPHA += (0.04 - (BG_ALPHA / 14));
    
    if (BG_ALPHA > 0.5)
        BG_ALPHA = 0.5;
    
    __WAVEHEIGHT = 240;
    __WAVEWIDTH = 320;
    
    for (i = 0; i < (__WAVEHEIGHT - 50); i += 1)
    {
        __WAVEMINUS = BGMAGNITUDE * (i / __WAVEHEIGHT) * 1.3;
        
        if (__WAVEMINUS > BGMAGNITUDE)
            __WAVEMAG = 0;
        else
            __WAVEMAG = BGMAGNITUDE - __WAVEMINUS;
        
        draw_background_part_ext(IMAGE_MENU, 0, i, __WAVEWIDTH, 1, sin((i / 8) + (BG_SINER / 30)) * __WAVEMAG, (-10 + i) - (BG_ALPHA * 20), 1, 1, image_blend, BG_ALPHA * 0.8);
        draw_background_part_ext(IMAGE_MENU, 0, i, __WAVEWIDTH, 1, -sin((i / 8) + (BG_SINER / 30)) * __WAVEMAG, (-10 + i) - (BG_ALPHA * 20), 1, 1, image_blend, BG_ALPHA * 0.8);
    }
    
    T_SINER_ADD = (sin(ANIM_SINER_B / 10) * 0.6) - 0.25;
    
    if (T_SINER_ADD >= 0)
        TRUE_ANIM_SINER += T_SINER_ADD;
    
    draw_sprite_ext(IMAGE_MENU_ANIMATION, ANIM_SINER / 12, 0, ((10 - (BG_ALPHA * 20)) + __WAVEHEIGHT) - 70, 1, 1, 0, image_blend, BG_ALPHA * 0.46);
    draw_sprite_ext(IMAGE_MENU_ANIMATION, (ANIM_SINER / 12) + 0.4, 0, ((10 - (BG_ALPHA * 20)) + __WAVEHEIGHT) - 70, 1, 1, 0, image_blend, BG_ALPHA * 0.56);
    draw_sprite_ext(IMAGE_MENU_ANIMATION, (ANIM_SINER / 12) + 0.8, 0, ((10 - (BG_ALPHA * 20)) + __WAVEHEIGHT) - 70, 1, 1, 0, image_blend, BG_ALPHA * 0.7);
}

for (i = 0; i < 3; i += 1)
{
    CONT_THIS = 0;
    PREV_MENU = MENU_NO;
    
    if (MENU_NO == 1)
        PREV_MENU = 0;
    
    if (MENU_NO == 4)
        PREV_MENU = 3;
    
    if (MENU_NO == 6)
        PREV_MENU = 5;
    
    if (MENU_NO == 7)
        PREV_MENU = 5;
    
    if (MENUCOORD[0] == i && MENU_NO == 1)
        CONT_THIS = 1;
    
    if (MENUCOORD[3] == i && MENU_NO == 4)
        CONT_THIS = 4;
    
    if (MENUCOORD[5] == i && MENU_NO == 6)
        CONT_THIS = 6;
    
    if (MENUCOORD[5] == i && MENU_NO == 7)
        CONT_THIS = 7;
    
    BOX_X1 = 55;
    BOX_Y1 = 55 + ((YL + YS) * i);
    BOX_X2 = 55 + XL;
    BOX_Y2 = (55 + ((YL + YS) * i) + YL) - 1;
    draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(BOX_X1, BOX_Y1, BOX_X2, BOX_Y2, false);
    draw_set_alpha(1);
    draw_set_color(COL_A);
    
    if (MENUCOORD[PREV_MENU] == i)
        draw_set_color(COL_B);
    
    if (MENU_NO == 3 || MENU_NO == 4)
    {
        if (MENUCOORD[2] == i)
            draw_set_color(COL_PLUS);
    }
    
    if (MENU_NO == 7 && MENUCOORD[5] == i)
        draw_set_color(c_red);
    
    if (TYPE != 1)
    {
        var col = draw_get_color();
        var alf = draw_get_alpha();
        draw_sprite_ext(spr_pxwhite, 0, BOX_X1 - 1, BOX_Y1 - 1, XL + 2, 1, 0, col, alf);
        draw_sprite_ext(spr_pxwhite, 0, BOX_X1 - 1, BOX_Y1 + YL, XL + 2, 1, 0, col, alf);
        draw_sprite_ext(spr_pxwhite, 0, BOX_X1 - 1, BOX_Y1 - 1, 1, YL + 2, 0, col, alf);
        draw_sprite_ext(spr_pxwhite, 0, BOX_X1 + XL, BOX_Y1 - 1, 1, YL + 2, 0, col, alf);
    }
    
    if (TYPE == 1)
    {
        var col = draw_get_color();
        var alf = draw_get_alpha();
        draw_sprite_ext(spr_pxwhite, 0, BOX_X1 - 2, BOX_Y1 - 2, (BOX_X2 - BOX_X1) + 4, 2, 0, col, alf);
        draw_sprite_ext(spr_pxwhite, 0, BOX_X1 - 2, BOX_Y2, (BOX_X2 - BOX_X1) + 4, 2, 0, col, alf);
        draw_sprite_ext(spr_pxwhite, 0, BOX_X1 - 2, BOX_Y1 - 2, 2, (BOX_Y2 - BOX_Y1) + 4, 0, col, alf);
        draw_sprite_ext(spr_pxwhite, 0, BOX_X2, BOX_Y1 - 2, 2, (BOX_Y2 - BOX_Y1) + 4, 0, col, alf);
    }
    
    if (CONT_THIS < 4)
    {
        if (FILE[i] == 0)
            scr_84_set_draw_font("main");
        else if (INITLANG[i] == 0)
            draw_set_font(fnt_main);
        else if (INITLANG[i] == 1)
            draw_set_font(fnt_ja_main);
        
        draw_text_shadow(BOX_X1 + 25, BOX_Y1 + 5, NAME[i]);
        scr_84_set_draw_font("main");
        draw_set_halign(fa_right);
        draw_text_shadow(BOX_X1 + 180, BOX_Y1 + 5, TIME_STRING[i]);
        draw_set_halign(fa_left);
    }
    
    if (CONT_THIS >= 1)
    {
        if (TYPE == 0)
        {
            if (MENU_NO == 1)
            {
                SELTEXT_C = " ";
                SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_116_0");
                SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_116_1");
                
                if (FILE[MENUCOORD[0]] == 0)
                {
                    SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_117_0");
                    SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_117_1");
                }
            }
            
            if (MENU_NO == 4)
            {
                SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_119_0");
                SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_119_1");
                SELTEXT_C = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_119_2");
            }
            
            if (MENU_NO == 6)
            {
                SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_120_0");
                SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_120_1");
                SELTEXT_C = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_120_2");
            }
            
            if (MENU_NO == 7)
            {
                SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_121_0");
                SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_121_1");
                SELTEXT_C = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_121_2");
            }
        }
        else
        {
            if (MENU_NO == 1)
            {
                SELTEXT_C = " ";
                SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_128_0");
                SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_128_1");
                
                if (FILE[MENUCOORD[0]] == 0)
                {
                    SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_129_0");
                    SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_129_1");
                }
            }
            
            if (MENU_NO == 4)
            {
                SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_131_0");
                SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_131_1");
                SELTEXT_C = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_131_2");
            }
            
            if (MENU_NO == 6)
            {
                SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_132_0");
                SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_132_1");
                SELTEXT_C = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_132_2");
            }
            
            if (MENU_NO == 7)
            {
                SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_133_0");
                SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_133_1");
                SELTEXT_C = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_133_2");
            }
        }
        
        draw_set_color(COL_B);
        
        if (MENU_NO == 7)
            draw_set_color(c_red);
        
        draw_text_shadow(BOX_X1 + 25, BOX_Y1 + 5, SELTEXT_C);
        draw_set_color(COL_A);
        
        if (MENUCOORD[MENU_NO] == 0)
        {
            draw_set_color(COL_B);
            HEARTX = 75;
            HEARTY = 81 + ((YL + YS) * MENUCOORD[PREV_MENU]);
        }
        
        draw_text_shadow(BOX_X1 + 35, BOX_Y1 + 22, SELTEXT_A);
        draw_set_color(COL_A);
        
        if (MENUCOORD[MENU_NO] == 1)
        {
            draw_set_color(COL_B);
            HEARTX = 165;
            HEARTY = 81 + ((YL + YS) * MENUCOORD[PREV_MENU]);
        }
        
        draw_text_shadow(BOX_X1 + 125, BOX_Y1 + 22, SELTEXT_B);
    }
    else
    {
        draw_text_shadow(BOX_X1 + 25, BOX_Y1 + 22, PLACE[i]);
    }
}

if (MENU_NO >= 0)
{
    if (MENU_NO == 0 || MENU_NO == 2 || MENU_NO == 3 || MENU_NO == 5)
    {
        if (MENUCOORD[MENU_NO] >= 0 && MENUCOORD[MENU_NO] <= 2)
        {
            HEARTX = 65;
            HEARTY = 72 + ((YL + YS) * MENUCOORD[MENU_NO]);
        }
        
        if (MENUCOORD[MENU_NO] == 3)
        {
            HEARTX = /*40*/44;
            HEARTY = 195;
        }
        
        if (MENUCOORD[MENU_NO] == 4)
        {
            HEARTX = /*125*/124;
            HEARTY = 195;
        }
        
        if (MENUCOORD[MENU_NO] == 5)
        {
            HEARTX = /*190*/194;
            HEARTY = 195;
        }
        
        if (MENUCOORD[MENU_NO] == 6)
        {
            HEARTX = /*125*/124;
            HEARTY = 215;
        }
    }
    
    if (MENU_NO >= 2)
    {
        CANCELTEXT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_189_0");
        
        if (TYPE == 1)
            CANCELTEXT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_190_0");
        
        draw_set_color(COL_A);
        
        if (MENUCOORD[PREV_MENU] == 3)
            draw_set_color(COL_B);
        
        draw_text_shadow(80, 190, CANCELTEXT);
    }
    
    if (MENU_NO == 0 || MENU_NO == 1)
    {
        COPYTEXT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_199_0");
        ERASETEXT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_200_0");
        CHSELECTTEXT = /*(TYPE == 1) ? "Chapter Select" : "CHAPTER SELECT"*/"选择章节";
        
        // if (global.lang == "ja")
        // {
        //     CHSELECTTEXT = "チャプター選択";
        //     LANGUAGETEXT = "ENGLISH"";
            
        //     if (TYPE == 1)
        //         LANGUAGETEXT = "ENGLISH"";
        // }
        // else
        // {
        //     LANGUAGETEXT = "日本語";
            
        //     if (TYPE == 1)
        //         LANGUAGETEXT = "日本語";
        // }
        LANGUAGETEXT = global.names ? "保留人名" : "翻译人名";
        //
        if (TYPE == 1)
        {
            COPYTEXT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_201_0");
            ERASETEXT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_201_1");
        }
        
        draw_set_color(COL_A);
        
        if (MENUCOORD[0] == 3)
            draw_set_color(COL_B);
        
        draw_text_shadow(54, 190, COPYTEXT);
        draw_set_color(COL_A);
        
        if (MENUCOORD[0] == 4)
            draw_set_color(COL_B);
        
        draw_text_shadow(/*140*/135, 190, ERASETEXT);
        draw_set_color(COL_A);
        
        if (MENUCOORD[0] == 5)
            draw_set_color(COL_B);
        
        draw_text_shadow(204, 190, CHSELECTTEXT);
        
        if (!global.is_console)
        {
            QUITTEXT = /*"End Program"*/"退出程序";
            
            if (global.lang == "ja")
                QUITTEXT = "終了";
            
            if (TYPE == 0)
                QUITTEXT = string_upper(QUITTEXT);
            
            draw_set_color(COL_A);
            
            if (MENUCOORD[0] == 7)
                draw_set_color(COL_B);
            
            draw_text_shadow(204, 210, QUITTEXT);
        }
        
        draw_set_color(COL_A);
        
        if (MENUCOORD[0] == 6)
            draw_set_color(COL_B);
        
        var lang_offset = 0;
        
        // if (global.lang == "en")
        // {
        //     lang_offset -= 2;
        //     draw_set_font(fnt_ja_main);
        // }
        // else
        // {
            draw_set_font(fnt_main);
        // }
        
        draw_text_shadow(/*140*/135 + lang_offset, 210, LANGUAGETEXT);
        // scr_84_set_draw_font("main");
    }
    
    draw_set_font(fnt_main);
    
    if (names_countdown > 0)
    {
        draw_set_alpha(0.4);
        draw_set_color(c_white);
        
        if (global.names)
            draw_text_transformed(5, 230, "从现在起角色名称将会被翻译。", 0.5, 0.5, 0);
        else
            draw_text_transformed(5, 230, "从现在起角色名称将会保留原文不翻译。", 0.5, 0.5, 0);
    }
    //
    if (TYPE == 1)
    {
        draw_set_alpha(0.4);
        draw_set_color(c_white);
        draw_text_transformed(195, 230, "DELTARUNE " + version_text + "(C) Toby Fox 2018-2025 ", 0.5, 0.5, 0);
    }
    else
    {
        draw_set_color(COL_A);
        draw_text_transformed(248, 230, version_text, 0.5, 0.5, 0);
        draw_set_color(c_white);
    }
    
    scr_84_set_draw_font("main");
    draw_set_alpha(1);
    
    if (MESSAGETIMER <= 0)
    {
        if (TYPE == 0)
        {
            if (MENU_NO == 0 || MENU_NO == 1)
                TEMPCOMMENT = " ";
            
            if (MENU_NO == 2)
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_216_0");
            
            if (MENU_NO == 3)
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_217_0");
            
            if (MENU_NO == 4)
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_218_0");
            
            if (MENU_NO == 5 || MENU_NO == 6 || MENU_NO == 7)
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_219_0");
        }
        
        if (TYPE == 1)
        {
            if (MENU_NO == 0 || MENU_NO == 1)
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_223_0");
            
            if (MENU_NO == 2)
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_224_0");
            
            if (MENU_NO == 3)
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_225_0");
            
            if (MENU_NO == 4)
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_226_0");
            
            if (MENU_NO == 5 || MENU_NO == 6 || MENU_NO == 7)
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_227_0");
        }
    }
    
    draw_set_color(COL_B);
    draw_text_shadow(40, 30, TEMPCOMMENT);
    MESSAGETIMER -= 1;
    
    if (MENU_NO == 0)
    {
        if (MENUCOORD[0] == 7)
        {
            HEARTX = /*190*/194;
            HEARTY = 215;
        }
    }
}

if (abs(HEARTX - HEARTXCUR) <= 2)
    HEARTXCUR = HEARTX;

if (abs(HEARTY - HEARTYCUR) <= 2)
    HEARTYCUR = HEARTY;

HEARTXCUR += ((HEARTX - HEARTXCUR) / 2);
HEARTYCUR += ((HEARTY - HEARTYCUR) / 2);
draw_sprite(spr_heartsmall, 0, HEARTXCUR, HEARTYCUR);

if (TYPE == 1)
    draw_set_color(c_white);
else
    draw_set_color(COL_A);

draw_set_font(fnt_main);
draw_text_shadow(__view_get(e__VW.XView, 0) + 8, __view_get(e__VW.YView, 0) + 4, /*"CHAPTER 1"*/"第1章");
draw_set_color(c_white);

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
