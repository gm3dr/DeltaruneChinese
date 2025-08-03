if (view_current == 0)
{
    button1 = 0;
    button2 = 0;
    button3 = 0;
    miniface_drawn = -1;
    
    if (button1_p() == 1 && prevent_mash_buffer <= 0)
        button1 = 1;
    
    if (button2_h() == 1 && prevent_mash_buffer <= 0)
        button2 = 1;
    
    if (global.flag[10] == 1 || scr_debug())
    {
        if (button3_h() == 1)
        {
            prevent_mash_buffer = 3;
            
            if (automash_timer == 0)
                automash_timer = 1;
            else
                automash_timer = 0;
            
            if (automash_timer == 0)
                button1 = 1;
            
            if (automash_timer == 1)
                button2 = 1;
        }
    }
    
    if (forcebutton1)
        button1 = 1;
    
    prevent_mash_buffer--;
    
    if (i_ex(obj_rouxls_ch3_enemy) && obj_rouxls_ch3_enemy.vspacechange)
        vspace = 33;
    
    if (dialoguer == 1 && formatted == 0)
    {
        if (global.fc == 0)
        {
            charline = originalcharline;
            writingx = x;
        }
        else
        {
            charline = 26;
            
            if (global.fc == 22)
            {
                charline = 30;
                vspace = 28;
                
                if (i_ex(obj_writer))
                    vspace = 30;
            }
            
            writingx = x + (58 * f);
        }
        
        if (instance_exists(obj_dialoguer))
        {
            if (obj_dialoguer.zurasucon == 2)
            {
                writingx = camerax() + obj_dialoguer.remwriterx;
                
                if (global.fc > 0)
                    writingx = camerax() + obj_dialoguer.remwriterx + (58 * f);
            }
        }
    }
    
    if (formatted == 0)
        event_user(5);
    
    accept = 0;
    wx = writingx;
    wy = writingy;
    colorchange = 0;
    draw_set_font(myfont);
    draw_set_color(mycolor);
    
    if (fadeonend != 0)
    {
        if (reachedend == 1)
        {
            textalphagain = -abs(fadeonend);
            
            if (textalpha <= 0)
                instance_destroy();
        }
    }
    
    if (textalphagain != 0)
        textalpha = clamp(textalpha + textalphagain, 0, 1);
    
    if (textalpha != 1)
        draw_set_alpha(textalpha);
    
    if (halt == 0 && button2 == 1 && pos < length && skippable == 1)
        skipme = 1;
    
    if (skipme == 1)
    {
        pos = string_length(mystring) + 1;
        reachedend = 1;
        alarm[0] = -1;
        alarm[1] = -1;
    }
    
    for (n = 1; n < pos; n += 1)
    {
        accept = 1;
        mychar = string_char_at(mystring, n);
        
        if (mychar == "`")
        {
            n++;
            mychar = string_char_at(mystring, n);
        }
        else if (mychar == "&" || mychar == "\n")
        {
            accept = 0;
            wx = writingx;
            
            if (wxskip == 1)
                wx = writingx + 58;
            
            wy += vspace;
        }
        else if (mychar == "|")
        {
            accept = 0;
            wx += hspace;
        }
        else if (mychar == "^")
        {
            accept = 0;
            n += 1;
        }
        else if (mychar == "/")
        {
            halt = 1;
            
            if (string_char_at(mystring, n + 1) == "%")
                halt = 2;
            
            reachedend = 1;
            accept = 0;
        }
        else if (mychar == "%")
        {
            accept = 0;
            
            if (string_char_at(mystring, n - 1) == "/")
                halt = 2;
            
            if (string_char_at(mystring, n + 1) == "%")
                instance_destroy();
            else if (halt != 2)
                scr_nextmsg();
        }
        else if (mychar == "\\")
        {
            nextchar = string_char_at(mystring, n + 1);
            nextchar2 = string_char_at(mystring, n + 2);
            
            if (nextchar == "E")
            {
                __nextface = ord(nextchar2);
                
                if (__nextface >= 48 && __nextface <= 57)
                    global.fe = real(nextchar2);
                else if (__nextface >= 65 && __nextface <= 90)
                    global.fe = __nextface - 55;
                else if (__nextface >= 97 && __nextface <= 122)
                    global.fe = __nextface - 61;
            }
            
            if (nextchar == "F")
            {
                if (nextchar2 == "0")
                    global.fc = 0;
                
                if (nextchar2 == "S")
                    global.fc = 1;
                
                if (nextchar2 == "R")
                    global.fc = 2;
                
                if (nextchar2 == "N")
                    global.fc = 3;
                
                if (nextchar2 == "T")
                    global.fc = 4;
                
                if (nextchar2 == "L")
                    global.fc = 5;
                
                if (nextchar2 == "s")
                    global.fc = 6;
                
                if (nextchar2 == "A")
                    global.fc = 10;
                
                if (nextchar2 == "a")
                    global.fc = 11;
                
                if (nextchar2 == "B")
                    global.fc = 12;
                
                if (nextchar2 == "b")
                    global.fc = 19;
                
                if (nextchar2 == "r")
                    global.fc = 15;
                
                if (nextchar2 == "u")
                    global.fc = 18;
                
                if (nextchar2 == "U")
                    global.fc = 9;
                
                if (nextchar2 == "K")
                    global.fc = 20;
                
                if (nextchar2 == "Q")
                    global.fc = 21;
                
                if (dialoguer == 1)
                {
                    if (global.fc == 0)
                    {
                        charline = originalcharline;
                        wx = x;
                    }
                    else
                    {
                        charline = 26;
                        wx = x + (58 * f);
                    }
                }
            }
            
            if (nextchar == "f" && faced == 0)
            {
                fam = 0;
                fam = real(nextchar2);
                
                if (!i_ex(global.sminstance[fam]))
                {
                    global.sminstance[fam] = instance_create(global.smxx[fam], global.smyy[fam], obj_smallface);
                    smallface = global.sminstance[fam];
                    
                    if (i_ex(smallface))
                    {
                        smallface.x += x;
                        smallface.y += y;
                        smallface.speed = global.smspeed[fam];
                        smallface.direction = global.smdir[fam];
                        smallface.type = global.smtype[fam];
                        smallface.sprite_index = global.smsprite[fam];
                        smallface.image_speed = global.smimagespeed[fam];
                        smallface.image_index = global.smimage[fam];
                        smallface.alarm[0] = global.smalarm[fam];
                        smallface.mystring = global.smstring[fam];
                        smallface.mycolor = global.smcolor[fam];
                        smallface.writergod = id;
                    }
                }
            }
            
            if (nextchar == "*")
            {
                wx = round(wx);
                var _sprite = scr_getbuttonsprite(nextchar2, true);
                var y_offset = 0;
                var x_offset = 0;
                
                if (global.typer == 50 || global.typer == 70 || global.typer == 71)
                {
                    x_offset = -3;
                    y_offset = -9;
                }
                
                if (global.typer == 100)
                {
                    x_offset = 3;
                    y_offset = -10;
                }
                
                if (special == 5)
                {
                    x_offset = -3;
                    y_offset = -6;
                }
                
                draw_sprite_ext(_sprite, 0, wx + x_offset, wy + 2 + y_offset, 2, 2, 0, c_white, 1);
                
                if (_sprite == button_ps4_options || _sprite == button_ps5_options)
                    wx += 8;
                
                if (global.lang == "ja")
                {
                    if (_sprite == button_ps4_dpad_up || _sprite == button_ps4_dpad_down || _sprite == button_ps4_dpad_left || _sprite == button_ps4_dpad_right || _sprite == button_ps5_dpad_up || _sprite == button_ps5_dpad_down || _sprite == button_ps5_dpad_left || _sprite == button_ps5_dpad_right)
                        wx += 4;
                }
            }
            
            if (nextchar == "T")
            {
                if (nextchar2 == "0")
                {
                    global.typer = 5;
                    
                    if (global.darkzone == 1)
                        global.typer = 6;
                    
                    scr_texttype();
                }
                
                if (nextchar2 == "1")
                {
                    global.typer = 2;
                    scr_texttype();
                }
                
                if (nextchar2 == "A")
                {
                    global.typer = 18;
                    scr_texttype();
                }
                
                if (nextchar2 == "a")
                {
                    global.typer = 20;
                    scr_texttype();
                }
                
                if (nextchar2 == "N")
                {
                    global.typer = 12;
                    
                    if (global.darkzone == 1)
                        global.typer = 56;
                    
                    if (global.fighting == 1)
                        global.typer = 59;
                    
                    scr_texttype();
                }
                
                if (nextchar2 == "n")
                {
                    global.typer = 23;
                    scr_texttype();
                }
                
                if (nextchar2 == "B")
                {
                    global.typer = 13;
                    
                    if (global.darkzone == 1)
                        global.typer = 57;
                    
                    if (global.fighting == 1)
                        global.typer = 77;
                    
                    scr_texttype();
                }
                
                if (nextchar2 == "S")
                {
                    global.typer = 10;
                    
                    if (global.darkzone == 1)
                    {
                        global.typer = 30;
                        
                        if (global.fighting == 1)
                            global.typer = 47;
                    }
                    
                    scr_texttype();
                }
                
                if (nextchar2 == "R")
                {
                    global.typer = 31;
                    
                    if (global.fighting == 1)
                        global.typer = 45;
                    
                    if (global.flag[30] == 1)
                        global.typer = 6;
                    
                    scr_texttype();
                }
                
                if (nextchar2 == "L")
                {
                    global.typer = 32;
                    
                    if (global.fighting == 1)
                        global.typer = 46;
                    
                    scr_texttype();
                }
                
                if (nextchar2 == "X")
                {
                    global.typer = 40;
                    scr_texttype();
                }
                
                if (nextchar2 == "r")
                {
                    global.typer = 55;
                    scr_texttype();
                }
                
                if (nextchar2 == "T")
                {
                    global.typer = 7;
                    scr_texttype();
                }
                
                if (nextchar2 == "J")
                {
                    global.typer = 35;
                    scr_texttype();
                }
                
                if (nextchar2 == "K")
                {
                    global.typer = 33;
                    
                    if (global.chapter == 1)
                    {
                        if (global.plot < 235)
                            global.typer = 36;
                    }
                    
                    if (global.fighting == 1)
                        global.typer = 48;
                    
                    scr_texttype();
                }
                
                if (nextchar2 == "q")
                {
                    global.typer = 62;
                    scr_texttype();
                }
                
                if (nextchar2 == "Q")
                {
                    global.typer = 58;
                    scr_texttype();
                }
                
                if (nextchar2 == "s")
                {
                    global.typer = 14;
                    scr_texttype();
                }
                
                if (nextchar2 == "U")
                {
                    global.typer = 17;
                    scr_texttype();
                }
                
                if (nextchar2 == "p")
                {
                    global.typer = 67;
                    scr_texttype();
                }
                
                if (nextchar2 == "v")
                {
                    global.typer = 80;
                    
                    if (global.fighting == 1)
                        global.typer = 81;
                    
                    scr_texttype();
                }
                
                if (dialoguer == 1)
                {
                    if (global.fc == 0)
                    {
                        charline = originalcharline;
                        wx = x;
                    }
                    else
                    {
                        wxskip = 1;
                    }
                }
            }
            
            if (nextchar == "s")
            {
                if (nextchar2 == "0")
                    skippable = 0;
                
                if (nextchar2 == "1")
                    skippable = 1;
            }
            
            if (nextchar == "c")
            {
                colorchange = 1;
                
                if (nextchar2 == "R")
                    xcolor = c_red;
                
                if (nextchar2 == "B")
                    xcolor = c_blue;
                
                if (nextchar2 == "Y")
                    xcolor = c_yellow;
                
                if (nextchar2 == "G")
                    xcolor = c_lime;
                
                if (nextchar2 == "W")
                    xcolor = c_white;
                
                if (nextchar2 == "X")
                    xcolor = c_black;
                
                if (nextchar2 == "P")
                    xcolor = c_purple;
                
                if (nextchar2 == "M")
                    xcolor = c_maroon;
                
                if (nextchar2 == "S")
                    xcolor = #FF80FF;
                
                if (nextchar2 == "V")
                    xcolor = #80FF80;
                
                if (nextchar2 == "I")
                    xcolor = #81C0FF;
                
                if (nextchar2 == "0")
                    xcolor = mycolor;
            }
            
            if (nextchar == "C")
            {
                if (nextchar2 == "1")
                {
                    if (instance_exists(obj_choicer_old) == false)
                        choicer = instance_create(0, 0, obj_choicer_old);
                    
                    halt = 5;
                }
                
                if (nextchar2 == "2" || nextchar2 == "3" || nextchar2 == "4")
                {
                    if (instance_exists(obj_choicer_neo) == false)
                    {
                        choicer = instance_create(0, 0, obj_choicer_neo);
                        choicer.choicetotal = real(nextchar2) - 1;
                    }
                    
                    halt = 5;
                }
            }
            
            if (nextchar == "M")
            {
                if (nextchar2 == "0")
                    global.flag[20] = 0;
                
                if (nextchar2 == "1")
                    global.flag[20] = 1;
                
                if (nextchar2 == "2")
                    global.flag[20] = 2;
                
                if (nextchar2 == "3")
                    global.flag[20] = 3;
                
                if (nextchar2 == "4")
                    global.flag[20] = 4;
                
                if (nextchar2 == "5")
                    global.flag[20] = 5;
                
                if (nextchar2 == "6")
                    global.flag[20] = 6;
                
                if (nextchar2 == "7")
                    global.flag[20] = 7;
                
                if (nextchar2 == "8")
                    global.flag[20] = 8;
                
                if (nextchar2 == "9")
                    global.flag[20] = 9;
            }
            
            if (nextchar == "S")
            {
                if (sound_played == 0)
                {
                    for (i = 0; i < 10; i += 1)
                    {
                        if (nextchar2 == string(i) && sound_played == 0)
                        {
                            snd_play(global.writersnd[i]);
                            sound_played = 1;
                        }
                    }
                }
            }
            
            if (nextchar == "I")
            {
                for (i = 0; i < 10; i += 1)
                {
                    if (nextchar2 == string(i))
                        draw_sprite(global.writerimg[i], 0, wx, wy + 4);
                }
            }
            
            if (nextchar == "m")
            {
                drawaster = 0;
                
                for (i = 0; i < 10; i += 1)
                {
                    if (nextchar2 == string(i))
                    {
                        if (n >= miniface_current_pos)
                        {
                            miniface_image = miniface_pos / 4;
                            miniface_current_pos = n;
                        }
                        else
                        {
                            miniface_image = 0;
                        }
                        
                        draw_sprite_ext(global.writerimg[i], miniface_image, writingx - 8, wy - 4, 2, 2, 0, mycolor, 1);
                        miniface_drawn = i;
                    }
                }
            }
            
            if (nextchar == "O")
            {
                var nextchar2var = real(nextchar2);
                
                if (object_made[nextchar2var] == 0)
                {
                    var writerobj = instance_create(wx + global.writerobjx[nextchar2var], wy + global.writerobjy[nextchar2var], global.writerobj[nextchar2var]);
                    writerobj.sprite_index = global.writerimg[nextchar2var];
                    writerobj.settinga = global.writerobjsettinga[nextchar2var];
                    writerobj.settingb = global.writerobjsettingb[nextchar2var];
                    object_made[nextchar2var] = 1;
                }
                
                if (object_made[nextchar2var] == 1)
                {
                    if (global.writerobj[nextchar2var] == 1532)
                        wx += sprite_get_width(global.writerimg[nextchar2var]);
                }
            }
            
            accept = 0;
            n += 2;
        }
        
        if (accept == 1)
        {
            if (drawaster == 0 && mychar == "*")
                mychar = " ";
            
            if (colorchange == 1)
                draw_set_color(xcolor);
            
            if (mychar == "#")
            {
                if (string_char_at(mystring, n - 1) != "`")
                    mychar = string_hash_to_newline(mychar);
            }
            
            if (jpspecial == 1)
            {
                if (scr_kana_check(mychar))
                {
                    draw_set_font(fnt_ja_mainbig);
                    jpused = 1;
                }
                
                if (!scr_kana_check(mychar))
                {
                    draw_set_font(myfont);
                    jpused = 0;
                }
            }
            
            if (special == 0)
                draw_text_transformed(wx + random(shake), wy + random(shake), mychar, textscale, textscale, 0);
            
            if (special >= 1)
            {
                if (special == 1)
                {
                    if (draw_get_color() != 16777215 && draw_get_color() != 0)
                    {
                        draw_text_color(wx + random(shake) + 1, wy + random(shake) + 1, mychar, xcolor, xcolor, xcolor, xcolor, 0.3);
                        draw_text_color(wx + random(shake), wy + random(shake), mychar, c_white, c_white, xcolor, xcolor, 1);
                    }
                    else
                    {
                        draw_text_color(wx + random(shake) + 1, wy + random(shake) + 1, mychar, c_dkgray, c_dkgray, c_navy, c_navy, 1);
                        draw_text(wx + random(shake), wy + random(shake), mychar);
                    }
                }
                
                if (special == 2)
                {
                    draw_set_alpha(1 * specfade);
                    draw_text(wx, wy, mychar);
                    draw_set_alpha((0.3 + (sin(siner / 14) * 0.1)) * specfade);
                    draw_text(wx + 1, wy, mychar);
                    draw_text(wx - 1, wy, mychar);
                    draw_text(wx, wy + 1, mychar);
                    draw_text(wx, wy - 1, mychar);
                    draw_set_alpha((0.08 + (sin(siner / 14) * 0.04)) * specfade);
                    draw_text(wx + 1, wy + 1, mychar);
                    draw_text(wx - 1, wy - 1, mychar);
                    draw_text(wx - 1, wy + 1, mychar);
                    draw_text(wx + 1, wy - 1, mychar);
                    draw_set_alpha(1);
                }
                
                if (special == 3)
                {
                    draw_set_color(c_white);
                    draw_set_alpha(1);
                    draw_text(wx + sin(siner / 4), wy + cos(siner / 4), mychar);
                    draw_set_alpha(0.5);
                    draw_text(wx + sin(siner / 5), wy + cos(siner / 5), mychar);
                    draw_text(wx + sin(siner / 7), wy + cos(siner / 7), mychar);
                    draw_text(wx + sin(siner / 9), wy + cos(siner / 9), mychar);
                    
                    for (i = 0; i < 7; i += 1)
                    {
                        ddir = 315 + random(15);
                        
                        if (n == 1)
                        {
                            specx[i] += lengthdir_x(2, ddir);
                            specy[i] += lengthdir_y(2, ddir);
                            
                            if (specx[i] >= 40)
                            {
                                specx[i] = 0;
                                specy[i] = 0;
                            }
                        }
                        
                        draw_set_alpha(((40 - specx[i]) / 40) * 0.7);
                        draw_text(wx + specx[i], wy + specy[i], mychar);
                    }
                    
                    draw_set_alpha(1);
                }
                
                if (special == 5)
                {
                    draw_set_alpha(0.25);
                    draw_set_color(shadcolor);
                    draw_text(wx + random(shake), wy + 1 + random(shake), mychar);
                    draw_text(wx + 1 + random(shake), wy + random(shake), mychar);
                    draw_text(wx + 1 + random(shake), wy + 1 + random(shake), mychar);
                    draw_set_alpha(1);
                    draw_set_color(c_black);
                    draw_text(wx + random(shake), wy + random(shake), mychar);
                }
            }
            // wx += hspace;
            if (ord(mychar) > 505)
                wx += ((hspace * 7) div 4);
            else
                wx += hspace;
            //
            if (global.lang == "ja")
            {
                if (ord(mychar) < 256 || (ord(mychar) >= 65377 && ord(mychar) <= 65439))
                    wx -= (hspace / 2);
            }
            
            if (global.lang == "en")
            {
                if (myfont == 8)
                {
                    if (mychar == "w")
                        wx += 2;
                    
                    if (mychar == "m")
                        wx += 3;
                    
                    if (mychar == "i")
                        wx -= 2;
                    
                    if (mychar == "l")
                        wx -= 2;
                    
                    if (mychar == "s")
                        wx -= 1;
                    
                    if (mychar == "j")
                        wx -= 1;
                }
                
                if (jpused == 1)
                    wx += 16;
            }
        }
    }
    
    if (reachedend_sound_play)
    {
        if (reachedend == 1 && reachedend_sound_played == 0)
        {
            snd_stop(reachedend_sound);
            snd_play(reachedend_sound);
            reachedend_sound_played = 1;
        }
    }
    
    if (halt != 0 && button1 == 1 && siner > 0)
    {
        if (halt == 1)
        {
            scr_nextmsg();
            
            with (obj_smallface)
                instance_destroy();
        }
        
        if (halt == 2)
        {
            with (obj_smallface)
                instance_destroy();
            
            if (facer == 1)
            {
                with (obj_face)
                    instance_destroy();
            }
            
            instance_destroy();
        }
    }
    
    skipme = 0;
    siner += 1;
    
    if (textalpha != 1)
        draw_set_alpha(1);
}
