button1 = 0;
button2 = 0;
button3 = 0;

if (button1_p_ch1() == 1)
    button1 = 1;

if (button2_h_ch1() == 1)
    button2 = 1;

if (global.flag[10] == 1 || scr_debug_ch1())
{
    if (button3_h_ch1() == 1)
    {
        if (automash_timer == 0)
            automash_timer = 1;
        else
            automash_timer = 0;
        
        if (automash_timer == 0)
        {
            button1 = 1;
            button2 = 1;
        }
    }
}

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
        writingx = x + (58 * f);
        
        if (global.lang == "ja")
            writingx -= 8;
    }
}

if (formatted == 0)
{
    length = string_length(mystring);
    charpos = -1;
    remspace = -1;
    remchar = -1;
    linecount = 0;
    stringmax = 0;
    aster = 0;
    textalignment = "";
    
    for (i = 0; i < (length + 1); i += 1)
    {
        skip = 0;
        thischar = string_char_at(mystring, i);
        
        if (thischar == "/" || thischar == "%")
        {
            if (charpos > -1)
                charpos -= 1;
        }
        
        if (thischar == "^")
        {
            if (charpos > -1)
                charpos -= 2;
        }
        
        if (thischar == "\\")
        {
            if (charpos > -1)
                charpos -= 3;
            
            nextchar = string_char_at(mystring, i + 1);
            nextchar2 = string_char_at(mystring, i + 2);
            
            if (dialoguer == 1)
            {
                if (nextchar == "E")
                {
                    if (nextchar2 == "0")
                        global.fe = 0;
                    
                    if (nextchar2 == "1")
                        global.fe = 1;
                    
                    if (nextchar2 == "2")
                        global.fe = 2;
                    
                    if (nextchar2 == "3")
                        global.fe = 3;
                    
                    if (nextchar2 == "4")
                        global.fe = 4;
                    
                    if (nextchar2 == "5")
                        global.fe = 5;
                    
                    if (nextchar2 == "6")
                        global.fe = 6;
                    
                    if (nextchar2 == "7")
                        global.fe = 7;
                    
                    if (nextchar2 == "8")
                        global.fe = 8;
                    
                    if (nextchar2 == "9")
                        global.fe = 9;
                    
                    if (nextchar2 == "A")
                        global.fe = 10;
                    
                    if (nextchar2 == "B")
                        global.fe = 11;
                    
                    if (nextchar2 == "C")
                        global.fe = 12;
                    
                    if (nextchar2 == "D")
                        global.fe = 13;
                    
                    if (nextchar2 == "E")
                        global.fe = 14;
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
                    
                    if (nextchar2 == "A")
                        global.fc = 10;
                    
                    if (nextchar2 == "a")
                        global.fc = 11;
                    
                    if (nextchar2 == "B")
                        global.fc = 12;
                    
                    if (nextchar2 == "r")
                        global.fc = 15;
                    
                    if (nextchar2 == "u")
                        global.fc = 18;
                    
                    if (nextchar2 == "K")
                        global.fc = 20;
                    
                    if (global.fc == 0)
                    {
                        charline = originalcharline;
                        writingx = x;
                    }
                    else
                    {
                        charline = 26;
                        writingx = x + (58 * f);
                        
                        if (global.lang == "ja")
                            writingx -= 8;
                    }
                }
            }
            
            if (nextchar == "a")
                textalignment = nextchar2;
        }
        
        if (thischar == "&" || thischar == "\n")
        {
            if (charpos > stringmax)
                stringmax = charpos;
            
            remspace = -1;
            charpos = 0;
            linecount += 1;
            skip = 1;
            nextchar = string_char_at(mystring, i + 1);
            
            if (aster == 1 && autoaster == 1 && nextchar != "*" && global.lang != "ja")
            {
                charpos = 2;
                length += 2;
                mystring = string_insert(scr_84_get_lang_string_ch1("obj_writer_slash_Draw_0_gml_147_0"), mystring, i + 1);
                i += 2;
            }
        }
        
        if (skip == 0)
        {
            if (thischar == " ")
            {
                remspace = i;
                remchar = charpos;
            }
            
            if (thischar == "*")
                aster = 1;
            
            if (charpos >= charline)
            {
                if (remspace > 2)
                {
                    mystring = string_delete(mystring, remspace, 1);
                    mystring = string_insert("&", mystring, remspace);
                    i = remspace + 1;
                    
                    if (remchar > stringmax)
                        stringmax = remchar;
                    
                    remspace = -1;
                    charpos = 1;
                    linecount += 1;
                    scr_asterskip_ch1();
                }
                else
                {
                    if (charpos > stringmax)
                        stringmax = charpos;
                    
                    mystring = string_insert("&", mystring, i);
                    length += 1;
                    charpos = 1;
                    remspace = -1;
                    linecount += 1;
                    i += 1;
                    scr_asterskip_ch1();
                }
            }
            else
            {
                if (ord(thischar) > 505 || ord(thischar) == 183)
                    charpos += 1.75;
                else
                    charpos += 1;
            }
        }
    }
    
    if (charpos > stringmax)
        stringmax = charpos;
    
    formatted = 1;
    
    if (textalignment == "c")
    {
        var xxx = __view_get(e__VW.XView, 0);
        writingx = (xxx + 320) - ((stringmax * hspace) / 2);
    }
}

accept = 0;
wx = writingx;
wy = writingy;
colorchange = 0;
draw_set_font(myfont);
draw_set_color(mycolor);

if (halt == 0 && button2 == 1 && pos < length && skippable == 1)
    skipme = 1;

if (skipme == 1)
{
    pos = string_length(mystring) + 1;
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
    
    if (mychar == "|")
    {
        accept = 0;
        wx += hspace;
    }
    
    if (mychar == "^")
    {
        accept = 0;
        n += 1;
    }
    
    if (mychar == "/")
    {
        halt = 1;
        
        if (string_char_at(mystring, n + 1) == "%")
            halt = 2;
        
        accept = 0;
    }
    
    if (mychar == "%")
    {
        accept = 0;
        
        if (string_char_at(mystring, n - 1) == "/")
            halt = 2;
        
        if (string_char_at(mystring, n + 1) == "%")
            instance_destroy();
        else if (halt != 2)
            scr_nextmsg_ch1();
    }
    
    if (mychar == "\\")
    {
        nextchar = string_char_at(mystring, n + 1);
        nextchar2 = string_char_at(mystring, n + 2);
        
        if (nextchar == "E")
        {
            if (nextchar2 == "0")
                global.fe = 0;
            
            if (nextchar2 == "1")
                global.fe = 1;
            
            if (nextchar2 == "2")
                global.fe = 2;
            
            if (nextchar2 == "3")
                global.fe = 3;
            
            if (nextchar2 == "4")
                global.fe = 4;
            
            if (nextchar2 == "5")
                global.fe = 5;
            
            if (nextchar2 == "6")
                global.fe = 6;
            
            if (nextchar2 == "7")
                global.fe = 7;
            
            if (nextchar2 == "8")
                global.fe = 8;
            
            if (nextchar2 == "9")
                global.fe = 9;
            
            if (nextchar2 == "A")
                global.fe = 10;
            
            if (nextchar2 == "B")
                global.fe = 11;
            
            if (nextchar2 == "C")
                global.fe = 12;
            
            if (nextchar2 == "D")
                global.fe = 13;
            
            if (nextchar2 == "E")
                global.fe = 14;
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
            
            if (nextchar2 == "A")
                global.fc = 10;
            
            if (nextchar2 == "a")
                global.fc = 11;
            
            if (nextchar2 == "B")
                global.fc = 12;
            
            if (nextchar2 == "r")
                global.fc = 15;
            
            if (nextchar2 == "u")
                global.fc = 18;
            
            if (nextchar2 == "K")
                global.fc = 20;
            
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
            faced = 1;
            smallface = instance_create_ch1(global.smxx[fam], global.smyy[fam], obj_smallface_ch1);
            
            if (instance_exists(smallface))
            {
                smallface.x += x;
                smallface.y += y;
                smallface.speed = global.smspeed[fam];
                smallface.direction = global.smdir[fam];
                smallface.type = global.smtype[fam];
                smallface.sprite_index = global.smsprite[fam];
                smallface.alarm[0] = global.smalarm[fam];
                smallface.mystring = global.smstring[fam];
                smallface.mycolor = global.smcolor[fam];
                smallface.writergod = id;
            }
        }
        
        if (nextchar == "*")
        {
            wx = round(wx);
            var _sprite = scr_getbuttonsprite_ch1(nextchar2, true);
            draw_sprite_ext(_sprite, 0, wx + 2, wy + 2, 2, 2, 0, c_white, 1);
        }
        
        if (nextchar == "T")
        {
            if (nextchar2 == "0")
            {
                global.typer = 5;
                
                if (global.darkzone == 1)
                {
                    global.typer = 6;
                    
                    if (global.fighting == 1)
                        global.typer = 4;
                }
                
                scr_texttype_ch1();
            }
            
            if (nextchar2 == "1")
            {
                global.typer = 2;
                scr_texttype_ch1();
            }
            
            if (nextchar2 == "A")
            {
                global.typer = 18;
                scr_texttype_ch1();
            }
            
            if (nextchar2 == "a")
            {
                global.typer = 20;
                scr_texttype_ch1();
            }
            
            if (nextchar2 == "N")
            {
                global.typer = 12;
                scr_texttype_ch1();
            }
            
            if (nextchar2 == "n")
            {
                global.typer = 23;
                scr_texttype_ch1();
            }
            
            if (nextchar2 == "B")
            {
                global.typer = 13;
                scr_texttype_ch1();
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
                
                scr_texttype_ch1();
            }
            
            if (nextchar2 == "R")
            {
                global.typer = 31;
                
                if (global.fighting == 1)
                    global.typer = 45;
                
                if (global.flag[30] == 1)
                    global.typer = 6;
                
                scr_texttype_ch1();
            }
            
            if (nextchar2 == "L")
            {
                global.typer = 32;
                
                if (global.fighting == 1)
                    global.typer = 46;
                
                scr_texttype_ch1();
            }
            
            if (nextchar2 == "X")
            {
                global.typer = 40;
                scr_texttype_ch1();
            }
            
            if (nextchar2 == "r")
            {
                global.typer = 55;
                scr_texttype_ch1();
            }
            
            if (nextchar2 == "T")
            {
                global.typer = 7;
                scr_texttype_ch1();
            }
            
            if (nextchar2 == "J")
            {
                global.typer = 35;
                scr_texttype_ch1();
            }
            
            if (nextchar2 == "K")
            {
                global.typer = 33;
                
                if (global.plot < 235)
                    global.typer = 36;
                
                if (global.fighting == 1)
                    global.typer = 48;
                
                scr_texttype_ch1();
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
            
            if (nextchar2 == "0")
                xcolor = mycolor;
        }
        
        if (nextchar == "C")
        {
            if (nextchar2 == "1")
            {
                if (instance_exists(obj_choicer_old_ch1) == false)
                    choicer = instance_create_ch1(0, 0, obj_choicer_old_ch1);
                
                halt = 5;
            }
            
            if (nextchar2 == "2" || nextchar2 == "3" || nextchar2 == "4")
            {
                if (instance_exists(obj_choicer_neo_ch1) == false)
                {
                    choicer = instance_create_ch1(0, 0, obj_choicer_neo_ch1);
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
                        snd_play_ch1(global.writersnd[i]);
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
        
        accept = 0;
        n += 2;
    }
    
    if (accept == 1)
    {
        if (colorchange == 1)
            draw_set_color(xcolor);
        
        if (special == 0)
            draw_text_transformed(wx + random(shake), wy + random(shake), string_hash_to_newline(mychar), textscale, textscale, 0);
        
        if (special >= 1)
        {
            if (special == 1)
            {
                if (draw_get_color() != 16777215 && draw_get_color() != 0)
                {
                    draw_text_color(wx + random(shake) + 1, wy + random(shake) + 1, string_hash_to_newline(mychar), xcolor, xcolor, xcolor, xcolor, 0.3);
                    draw_text_color(wx + random(shake), wy + random(shake), string_hash_to_newline(mychar), c_white, c_white, xcolor, xcolor, 1);
                }
                else
                {
                    draw_text_color(wx + random(shake) + 1, wy + random(shake) + 1, string_hash_to_newline(mychar), c_dkgray, c_dkgray, c_navy, c_navy, 1);
                    draw_text(wx + random(shake), wy + random(shake), string_hash_to_newline(mychar));
                }
            }
            
            if (special == 2)
            {
                draw_set_alpha(1 * specfade);
                draw_text(wx, wy, string_hash_to_newline(mychar));
                draw_set_alpha((0.3 + (sin(siner / 14) * 0.1)) * specfade);
                draw_text(wx + 1, wy, string_hash_to_newline(mychar));
                draw_text(wx - 1, wy, string_hash_to_newline(mychar));
                draw_text(wx, wy + 1, string_hash_to_newline(mychar));
                draw_text(wx, wy - 1, string_hash_to_newline(mychar));
                draw_set_alpha((0.08 + (sin(siner / 14) * 0.04)) * specfade);
                draw_text(wx + 1, wy + 1, string_hash_to_newline(mychar));
                draw_text(wx - 1, wy - 1, string_hash_to_newline(mychar));
                draw_text(wx - 1, wy + 1, string_hash_to_newline(mychar));
                draw_text(wx + 1, wy - 1, string_hash_to_newline(mychar));
                draw_set_alpha(1);
            }
            
            if (special == 3)
            {
                draw_set_color(c_white);
                draw_set_alpha(1);
                draw_text(wx + sin(siner / 4), wy + cos(siner / 4), string_hash_to_newline(mychar));
                draw_set_alpha(0.5);
                draw_text(wx + sin(siner / 5), wy + cos(siner / 5), string_hash_to_newline(mychar));
                draw_text(wx + sin(siner / 7), wy + cos(siner / 7), string_hash_to_newline(mychar));
                draw_text(wx + sin(siner / 9), wy + cos(siner / 9), string_hash_to_newline(mychar));
                
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
                    draw_text(wx + specx[i], wy + specy[i], string_hash_to_newline(mychar));
                }
                
                draw_set_alpha(1);
            }
        }
        if (ord(mychar) > 505 || ord(mychar) == 183)
            wx += ((hspace * 7) div 4);
        else
            wx += hspace;
        
        if (global.lang == "ja")
        {
            if (ord(mychar) < 256 || (ord(mychar) >= 65377 && ord(mychar) <= 65439))
                wx -= (hspace / 2);
        }
        
        if (global.lang == "en")
        {
            if (myfont == 4)
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
        }
    }
}

if (halt != 0 && button1 == 1 && siner > 0)
{
    if (halt == 1)
    {
        scr_nextmsg_ch1();
        
        if (faced == 1)
        {
            with (smallface)
            {
                if (getrid == 0)
                    getrid = 1;
            }
            
            faced = 0;
        }
    }
    
    if (halt == 2)
    {
        if (faced == 1)
        {
            with (smallface)
                instance_destroy();
            
            faced = 0;
        }
        
        if (facer == 1)
        {
            with (obj_face_ch1)
                instance_destroy();
        }
        
        instance_destroy();
    }
}

skipme = 0;
siner += 1;

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
