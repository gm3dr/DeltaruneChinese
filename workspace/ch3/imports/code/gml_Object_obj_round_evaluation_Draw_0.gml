if (shakeobj == 0 || !i_ex(shakeobj))
{
    shakeobj = scr_marker_ext(0, 0, 412);
    
    with (shakeobj)
        visible = 0;
}

with (obj_caterpillarchara)
    x = 0;

with (obj_caterpillarchara)
    y = 0;

with (obj_mainchara)
    x = 0;

with (obj_mainchara)
    y = 0;

var totalscore = stringsetloc("TOTAL SCORE", "obj_round_evaluation_slash_Draw_0_gml_21_0");
var pointsgained = stringsetloc("POINTS GAINED", "obj_round_evaluation_slash_Draw_0_gml_23_0");
var evaluation = stringsetloc("EVALUATION", "obj_round_evaluation_slash_Draw_64_gml_164_0");
var _physicalchallenge = stringsetloc("PHYS. CHALLENGE", "obj_round_evaluation_slash_Draw_64_gml_195_0");

if (boardnumber == 1)
    _physicalchallenge = stringsetloc("CHEF SCORE", "obj_round_evaluation_slash_Draw_0_gml_26_0");

if (boardnumber == 2)
    _physicalchallenge = stringsetloc("CONCERT SCORE", "obj_round_evaluation_slash_Draw_0_gml_27_0");

var pressanybutton = stringsetloc("PRESS ANY BUTTON", "obj_round_evaluation_slash_Draw_0_gml_29_0");
var secretbonus = stringsetloc("SECRET BONUS", "obj_round_evaluation_slash_Draw_64_gml_304_0");
var _norank = stringset("NO RANK");
var _zrank = stringsetloc("Z-RANK", "obj_round_evaluation_slash_Draw_0_gml_33_0");
var _crank = stringsetloc("C-RANK", "obj_round_evaluation_slash_Draw_0_gml_34_0");
var _brank = stringsetloc("B-RANK", "obj_round_evaluation_slash_Draw_0_gml_35_0");
var _arank = stringsetloc("A-RANK", "obj_round_evaluation_slash_Draw_0_gml_36_0");
var _srank = stringsetloc("S-RANK", "obj_round_evaluation_slash_Draw_0_gml_37_0");
var _trank = stringsetloc("T-RANK", "obj_round_evaluation_slash_Draw_0_gml_38_0");
var _zlet = stringsetloc("Z", "obj_round_evaluation_slash_Draw_0_gml_41_0");
var _clet = stringsetloc("C", "obj_round_evaluation_slash_Draw_0_gml_42_0");
var _blet = stringsetloc("B", "obj_round_evaluation_slash_Draw_0_gml_43_0");
var _alet = stringsetloc("A", "obj_round_evaluation_slash_Draw_0_gml_44_0");
var _slet = stringsetloc("S", "obj_round_evaluation_slash_Draw_0_gml_45_0");
var _tlet = stringsetloc("T", "obj_round_evaluation_slash_Draw_0_gml_46_0");
lettergrade = _zlet;
var shadcolor = 3934982;
var shadalph = 0.65;
var shadoff = 2;
var _y_extra = 0;

if (boardnumber == 2 && room != room_ch3_gameshowroom)
    _y_extra = 100;

if (con == 0)
{
    timer++;
    
    if (timer > 10 && button3_h())
        timer = 60;
    
    bg_y = ease_out_bounce(timer, -640, 640, 60);
    star_anim += star_anim_speed;
    bg_x_extra -= 3;
    var _x = 0;
    var _y = 0;
    
    repeat (6)
    {
        repeat (5)
        {
            draw_sprite_ext(spr_dw_tv_starbgtile, star_anim, (camerax() + (_x * 160) + bg_x_extra) - 0, (cameray() + (_y * 160) + bg_y) - 320, 2, 2, 0, c_white, 1);
            _y++;
        }
        
        _x++;
        _y = 0;
    }
    
    bouncebuff--;
    
    if (bg_y > -6)
    {
        if (bouncebuff <= 0)
        {
            bouncecount++;
            snd_play_x(snd_impact, 1 - (bouncecount / 8), 1);
        }
        
        bouncebuff = 3;
    }
    
    if (timer >= 60)
    {
        con = 0.5;
        timer = 0;
        bg_speed -= 20;
        bg_speed_y -= 8;
    }
}

if (con == 0.5)
{
    timer++;
    checkskip(1, 24);
    
    if (timer >= 24)
    {
        con = 1;
        timer = 0;
    }
    
    var _x = 0;
    var _y = 0;
    star_anim += star_anim_speed;
    bg_speed -= bg_speed_max;
    bg_speed_y += bg_speed_y_max;
    
    if (bg_speed < -640)
        bg_speed += 640;
    
    if (bg_speed_y > -480)
        bg_speed_y -= 480;
    
    scr_draw_sprite_tiled_area(spr_dw_tv_starbgtile, star_anim, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + view_wport[0], cameray() + room_height, 2, 2, c_white, 1);
}

if (con >= 1)
{
    draw_set_alpha(1);
    star_anim += star_anim_speed;
    bg_speed -= bg_speed_max;
    bg_speed_y += bg_speed_y_max;
    
    if (bg_speed < -640)
        bg_speed += 640;
    
    if (bg_speed_y > -480)
        bg_speed_y -= 480;
    
    scr_draw_sprite_tiled_area(spr_dw_tv_starbgtile, star_anim, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + bg_speed, cameray() + bg_speed_y, camerax() + view_wport[0], cameray() + room_height, 2, 2, c_white, 1);
    draw_set_color(c_white);
    draw_set_alpha(1);
    var yy, mspace, leftx, rightx, midx;
    
    if (replayversion)
    {
        rtimer++;
        
        if (rtimer == 1)
        {
            snd_play(snd_closet_impact);
            scr_shakeobj(shakeobj, 12);
        }
        
        draw_set_font(fnt_8bit);
        yy = cameray() + 96 + yyscroll;
        var horizontalmargin = 140;
        var indent = 40;
        leftx = round(camerax()) + horizontalmargin + shakeobj.x;
        rightx = ((round(camerax()) + 640) - horizontalmargin) + shakeobj.x;
        midx = camerax() + 320 + shakeobj.x;
        mspace = 32;
        draw_set_valign(fa_top);
    }
    
    if (replayversion && boardnumber == 3)
    {
        draw_set_font(fnt_8bit);
        var title = stringsetloc("SUSIEZILLA RESULTS", "obj_round_evaluation_slash_Draw_0_gml_311_0");
        draw_set_halign(fa_center);
        sp_draw_text(camerax() + 320 + shakeobj.x, yy + (mspace * 0), title);
        draw_sprite_ext(spr_pxwhite, 0, ((camerax() + 320 + shakeobj.x) - round((string_width(title) / 2) + 10)) + shadoff, yy + (mspace * 0) + 6 + shadoff, -80, 2, 0, shadcolor, shadalph);
        draw_sprite_ext(spr_pxwhite, 0, ((camerax() + 320 + shakeobj.x + round((string_width(title) / 2) + 10)) - 2) + shadoff, yy + (mspace * 0) + 6 + shadoff, 80, 2, 0, shadcolor, shadalph);
        draw_sprite_ext(spr_pxwhite, 0, (camerax() + 320 + shakeobj.x) - round((string_width(title) / 2) + 10), yy + (mspace * 0) + 6, -80, 2, 0, c_white, 1);
        draw_sprite_ext(spr_pxwhite, 0, (camerax() + 320 + shakeobj.x + round((string_width(title) / 2) + 10)) - 2, yy + (mspace * 0) + 6, 80, 2, 0, c_white, 1);
        draw_set_halign(fa_left);
        draw_set_font(scr_84_get_font("8bit_mixed"));
        var _col = 16777215;
        rcheckskip(1, 28);
        
        if (rtimer == 28)
            snd_play(snd_punchmed);
        
        if (rtimer > 28)
        {
            var cleartime_sec = global.susie_cleartime_sec;
            var _cleartime = stringsetloc("CLEAR TIME", "obj_round_evaluation_slash_Draw_0_gml_335_0");
            draw_set_font(fnt_8bit);
            draw_set_halign(fa_left);
            sp_draw_text(leftx, yy + (mspace * 1), _cleartime);
            draw_set_font(scr_84_get_font("8bit_mixed"));
            draw_set_halign(fa_right);
            sp_draw_text(rightx, yy + (mspace * 1), scr_timedisp(global.susie_cleartime_sec * 30));
            draw_set_halign(fa_left);
        }
        
        rcheckskip(28, 42);
        
        if (rtimer == 42)
            snd_play(snd_punchmed);
        
        if (rtimer > 42)
        {
            draw_set_halign(fa_left);
            draw_set_font(fnt_8bit);
            sp_draw_text(leftx, yy + (mspace * 2), totalscore);
            draw_set_font(scr_84_get_font("8bit_mixed"));
        }
        
        rcheckskip(42, 56);
        
        if (rtimer == 56)
            snd_play(snd_punchmed);
        
        if (rtimer > 56)
        {
            if (currentphyspoints < physicalchallengepoints)
            {
                currentphyspoints += 20;
                
                if ((currentphyspoints % 100) == 0)
                {
                    snd_stop(snd_bump);
                    snd_play(snd_bump);
                }
            }
            
            if (currentphyspoints > physicalchallengepoints)
                currentphyspoints = physicalchallengepoints;
            
            draw_set_halign(fa_right);
            sp_draw_text(rightx, yy + (mspace * 2), string(round(currentphyspoints)));
        }
        
        rcheckskip(56, 70);
        
        if (rtimer > 70)
        {
            if (currentphyspoints < physicalchallengepoints)
            {
                currentphyspoints += 20;
                
                if ((currentphyspoints % 100) == 0)
                {
                    snd_stop(snd_bump);
                    snd_play(snd_bump);
                }
                
                if ((button3_h() && currentphyspoints > 100) || button1_p())
                    currentphyspoints = physicalchallengepoints;
            }
            
            currentphyspoints = clamp(currentphyspoints, 0, physicalchallengepoints);
        }
        
        draw_set_halign(fa_right);
        
        if (rtimer > 84)
        {
            if (currentphyspoints == physicalchallengepoints && gradecon == 0)
            {
                gradecon = 0.05;
                var del = 14;
                
                if (button3_h())
                    del = 1;
                
                scr_delay_var("gradecon", 0.1, del);
            }
        }
        
        if (gradecon == 0.1)
        {
            var drumrolldelay = 40;
            var del = drumrolldelay + 28;
            
            if (button3_h())
            {
                drumrolldelay = 1;
                del = 2;
            }
            
            scr_delay_var("gradecon", 1, drumrolldelay);
            scr_delay_var("gradecon", 2, del);
            snd_play_delay(90, del + 1, 1, 1);
            snd_stop(snd_applause_single);
            snd_play(snd_drumroll);
            gradecon = 0.2;
        }
        
        if (gradecon >= 1)
        {
            _col = c_pink;
            
            if (currentphyspoints == physicalchallengepoints)
                _col = 65535;
            
            if (currentphyspoints < 350 && !madesound)
            {
                currentphysgrade = _zrank;
                currentphychallengerank = 0;
                madesound = true;
                snd_play(snd_splat);
            }
            
            if (currentphyspoints >= 350 && currentphyspoints < 400 && !madesound)
            {
                currentphysgrade = _crank;
                currentphychallengerank = 1;
                madesound = true;
                snd_play(snd_splat);
            }
            
            if (currentphyspoints >= 400 && currentphyspoints < 450 && !madesound)
            {
                currentphysgrade = _brank;
                currentphychallengerank = 2;
                madesound = true;
                snd_play(snd_coin);
            }
            
            if (currentphyspoints >= 450 && currentphyspoints < 600 && !madesound)
            {
                currentphysgrade = _arank;
                currentphychallengerank = 3;
                madesound = true;
                snd_play(snd_coin);
            }
            
            if (currentphyspoints >= 600 && currentphyspoints < 800 && !madesound)
            {
                currentphysgrade = _srank;
                currentphychallengerank = 4;
                madesound = true;
                snd_play(snd_punchmed);
                snd_play(snd_applause_single);
            }
            
            if (currentphyspoints >= 800 && !madesound)
            {
                currentphysgrade = _trank;
                currentphychallengerank = 5;
                madesound = true;
                snd_play(snd_punchmed);
                snd_play(snd_applause_single);
            }
            
            draw_set_font(fnt_8bit);
            draw_set_halign(fa_center);
            draw_text_transformed_color(midx + shadoff, yy + (mspace * 4) + 20 + shadoff, currentphysgrade, 4, 4, 0, shadcolor, shadcolor, shadcolor, shadcolor, shadalph);
            draw_text_transformed_color(midx, yy + (mspace * 4) + 20, currentphysgrade, 4, 4, 0, _col, _col, c_white, c_white, 1);
            draw_set_font(scr_84_get_font("8bit_mixed"));
        }
        
        if (gradecon >= 2)
        {
            reachedend_draw_triangle_siner += 0.3;
            var _flashcol = merge_color(c_white, c_yellow, 0.4 + (sin(reachedend_draw_triangle_siner) / 3));
            draw_set_halign(fa_center);
            draw_set_font(fnt_8bit);
            sp_draw_text(midx, yy + (mspace * 6) + 82, pressanybutton);
            draw_set_color(_flashcol);
            draw_text(midx, yy + (mspace * 6) + 82, pressanybutton);
            draw_set_color(c_white);
            draw_set_font(scr_84_get_font("8bit_mixed"));
        }
        
        draw_set_halign(fa_left);
        
        if (gradecon >= 2 && musicstarted == false)
        {
            snd_free_all();
            
            if (currentphysgrade == _zrank)
            {
                global.currentsong[0] = snd_init("tv_changingroom.ogg");
                global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
            }
            
            if (currentphysgrade != _zrank)
            {
                global.currentsong[0] = snd_init("nes_intro_extended_part2.ogg");
                global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
                snd_play(snd_crowd_cheer_single);
            }
            
            musicstarted = true;
        }
        
        if (gradecon >= 2)
        {
            if (!sndplayed)
            {
                if (button1_p() || button2_p() || button3_p())
                {
                    con++;
                    snd_free_all();
                    snd_play(snd_explosion_mmx);
                    
                    if (global.flag[1197] < physicalchallengepoints)
                    {
                        global.flag[1197] = physicalchallengepoints;
                        global.flag[1198] = currentphychallengerank;
                        global.flag[1234] = global.susie_cleartime_sec;
                    }
                    
                    sndplayed = true;
                }
            }
        }
    }
    
    if (replayversion && boardnumber == 2)
    {
        draw_set_font(fnt_8bit);
        var title = stringsetloc("CONCERT RESULTS", "obj_round_evaluation_slash_Draw_0_gml_528_0");
        draw_set_halign(fa_center);
        sp_draw_text(midx, yy + (mspace * 0), title);
        draw_set_font(scr_84_get_font("8bit_mixed"));
        var _width = 240;
        draw_sprite_ext(spr_pxwhite, 0, (midx - round((_width / 2) + 10)) + shadoff, yy + (mspace * 0) + 6 + shadoff, -80, 2, 0, shadcolor, shadalph);
        draw_sprite_ext(spr_pxwhite, 0, ((midx + round((_width / 2) + 10)) - 2) + shadoff, yy + (mspace * 0) + 6 + shadoff, 80, 2, 0, shadcolor, shadalph);
        draw_sprite_ext(spr_pxwhite, 0, midx - round((_width / 2) + 10), yy + (mspace * 0) + 6, -80, 2, 0, c_white, 1);
        draw_sprite_ext(spr_pxwhite, 0, (midx + round((_width / 2) + 10)) - 2, yy + (mspace * 0) + 6, 80, 2, 0, c_white, 1);
        draw_set_halign(fa_left);
        rcheckskip(1, 28);
        
        if (rtimer == 28)
            snd_play(snd_punchmed);
        
        if (rtimer > 28)
        {
            draw_set_font(fnt_8bit);
            draw_set_color(#FF3396);
            var misnot = stringsetloc("MISSED NOTES", "obj_round_evaluation_slash_Draw_0_gml_549_0");
            draw_set_halign(fa_left);
            sp_draw_text(leftx, yy + (mspace * 1), misnot);
            draw_set_halign(fa_right);
            sp_draw_text(rightx, yy + (mspace * 1), string(round(missednotes)));
            draw_set_halign(fa_left);
            draw_set_font(scr_84_get_font("8bit_mixed"));
        }
        
        draw_set_color(c_white);
        rcheckskip(28, 42);
        
        if (rtimer == 42)
            snd_play(snd_punchmed);
        
        if (rtimer > 42)
        {
            draw_set_font(fnt_8bit);
            var normnotes = stringsetloc("NORMAL NOTES", "obj_round_evaluation_slash_Draw_0_gml_564_0");
            draw_set_halign(fa_left);
            sp_draw_text(leftx, yy + (mspace * 2), normnotes);
            draw_set_halign(fa_right);
            sp_draw_text(rightx, yy + (mspace * 2), string(round(normalnotes)));
            draw_set_halign(fa_left);
            draw_set_font(scr_84_get_font("8bit_mixed"));
        }
        
        rcheckskip(42, 56);
        draw_set_color(c_yellow);
        
        if (rtimer == 56)
            snd_play(snd_punchmed);
        
        if (rtimer > 56)
        {
            draw_set_font(fnt_8bit);
            var golno = stringsetloc("GOLD NOTES", "obj_round_evaluation_slash_Draw_0_gml_579_0");
            draw_set_halign(fa_left);
            sp_draw_text(leftx, yy + (mspace * 3), golno);
            draw_set_halign(fa_right);
            sp_draw_text(rightx, yy + (mspace * 3), string(round(goldnotes)));
            draw_set_halign(fa_left);
            draw_set_font(scr_84_get_font("8bit_mixed"));
        }
        
        rcheckskip(56, 70);
        draw_set_color(c_white);
        
        if (rtimer == 70)
            snd_play(snd_punchmed);
        
        if (rtimer > 70)
        {
            draw_set_font(fnt_8bit);
            var longcom = stringsetloc("LONGEST COMBO", "obj_round_evaluation_slash_Draw_0_gml_596_0");
            draw_set_halign(fa_left);
            sp_draw_text(leftx, yy + (mspace * 4), longcom);
            draw_set_halign(fa_right);
            sp_draw_text(rightx, yy + (mspace * 4), string(round(maxcombo)));
            draw_set_halign(fa_left);
            draw_set_font(scr_84_get_font("8bit_mixed"));
        }
        
        rcheckskip(70, 84);
        draw_set_color(c_white);
        var _col = 16777215;
        
        if (rtimer == 84)
            snd_play(snd_punchmed);
        
        if (rtimer > 84)
        {
            draw_set_font(fnt_8bit);
            draw_set_halign(fa_left);
            sp_draw_text(leftx, yy + (mspace * 5), totalscore);
            draw_set_font(scr_84_get_font("8bit_mixed"));
        }
        
        rcheckskip(84, 98);
        
        if (rtimer > 98)
        {
            if (currentphyspoints < physicalchallengepoints)
            {
                currentphyspoints += 200;
                
                if ((currentphyspoints % 400) == 0)
                {
                    snd_stop(snd_bump);
                    snd_play(snd_bump);
                }
                
                if ((button3_h() && currentphyspoints > 100) || button1_p())
                    currentphyspoints = physicalchallengepoints;
            }
            
            draw_set_halign(fa_right);
            
            if (currentphyspoints > physicalchallengepoints)
                currentphyspoints = physicalchallengepoints;
            
            sp_draw_text(rightx, yy + (mspace * 5), string(round(currentphyspoints)));
            draw_set_halign(fa_left);
        }
        
        rcheckskip(98, 112);
        
        if (rtimer > 112)
        {
            if (currentphyspoints == physicalchallengepoints && gradecon == 0)
            {
                gradecon = 0.05;
                var del = 14;
                
                if (button3_h())
                    del = 1;
                
                scr_delay_var("gradecon", 0.1, del);
            }
        }
        
        if (gradecon == 0.1)
        {
            var drumrolldelay = 40;
            var del = drumrolldelay + 28;
            
            if (button3_h())
            {
                drumrolldelay = 1;
                del = 2;
            }
            
            scr_delay_var("gradecon", 1, drumrolldelay);
            scr_delay_var("gradecon", 2, del);
            snd_play_delay(90, del + 1, 1, 1);
            snd_stop(snd_applause_single);
            snd_play(snd_drumroll);
            gradecon = 0.2;
        }
        
        if (gradecon >= 1)
        {
            _col = c_pink;
            
            if (currentphyspoints == physicalchallengepoints)
                _col = 65535;
            
            if (!madesound)
            {
                if (currentphyspoints >= 28000)
                {
                    currentphysgrade = _trank;
                    currentphychallengerank = 5;
                    madesound = true;
                    snd_play(snd_punchmed);
                    snd_play(snd_applause_single);
                }
                else if (currentphyspoints >= 25000)
                {
                    currentphysgrade = _srank;
                    currentphychallengerank = 4;
                    madesound = true;
                    snd_play(snd_punchmed);
                    snd_play(snd_applause_single);
                }
                else if (currentphyspoints >= 22000)
                {
                    currentphysgrade = _arank;
                    currentphychallengerank = 3;
                    madesound = true;
                    snd_play(snd_coin);
                }
                else if (currentphyspoints >= 18000)
                {
                    currentphysgrade = _brank;
                    currentphychallengerank = 2;
                    madesound = true;
                    snd_play(snd_coin);
                }
                else if (currentphyspoints >= 14500)
                {
                    currentphysgrade = _crank;
                    currentphychallengerank = 1;
                    madesound = true;
                    snd_play(snd_splat);
                }
                else if (currentphyspoints >= 1)
                {
                    currentphysgrade = _zrank;
                    currentphychallengerank = 0;
                    madesound = true;
                    snd_play(snd_splat);
                }
                else
                {
                    currentphysgrade = _norank;
                    currentphychallengerank = 0;
                    madesound = true;
                    snd_play(snd_splat);
                }
            }
            
            draw_set_font(fnt_8bit);
            draw_set_halign(fa_center);
            draw_text_transformed_color(320 + shadoff, yy + (mspace * 6) + shadoff + 10, currentphysgrade, 3, 3, 0, shadcolor, shadcolor, shadcolor, shadcolor, shadalph);
            draw_text_transformed_color(320, yy + (mspace * 6) + 10, currentphysgrade, 3, 3, 0, _col, _col, c_white, c_white, 1);
            draw_set_font(scr_84_get_font("8bit_mixed"));
        }
        
        if (gradecon >= 2)
        {
            reachedend_draw_triangle_siner += 0.3;
            var _flashcol = merge_color(c_white, c_yellow, 0.4 + (sin(reachedend_draw_triangle_siner) / 3));
            draw_set_font(fnt_8bit);
            draw_set_halign(fa_center);
            draw_text_transformed_color(320 + shadoff, yy + (mspace * 8.5) + shadoff, pressanybutton, 1, 1, 0, shadcolor, shadcolor, shadcolor, shadcolor, shadalph);
            draw_text_transformed_color(320, yy + (mspace * 8.5), pressanybutton, 1, 1, 0, _flashcol, _flashcol, _flashcol, _flashcol, 1);
            draw_set_halign(fa_left);
            draw_set_font(scr_84_get_font("8bit_mixed"));
        }
        
        if (gradecon >= 2 && musicstarted == false)
        {
            snd_free_all();
            
            if (currentphysgrade == _zrank || currentphysgrade == _norank)
            {
                global.currentsong[0] = snd_init("tv_changingroom.ogg");
                global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
            }
            else
            {
                global.currentsong[0] = snd_init("nes_intro_extended_part2.ogg");
                global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
                snd_play(snd_crowd_cheer_single);
            }
            
            musicstarted = true;
            
            if (currentphysgrade != _zrank && currentphysgrade != _norank)
            {
                with (obj_event_manager)
                    trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_21);
            }
        }
        
        if (gradecon >= 2)
        {
            if (!sndplayed)
            {
                if (button1_p() || button2_p() || button3_p())
                {
                    con++;
                    snd_free_all();
                    snd_play(snd_explosion_mmx);
                    
                    if (global.band_difficulty == 1)
                    {
                        if (global.flag[1279] < physicalchallengepoints)
                        {
                            global.flag[1279] = physicalchallengepoints;
                            global.flag[1280] = currentphychallengerank;
                        }
                    }
                    else if (global.flag[1195] < physicalchallengepoints)
                    {
                        global.flag[1195] = physicalchallengepoints;
                        global.flag[1196] = currentphychallengerank;
                    }
                    
                    sndplayed = true;
                }
            }
        }
    }
    
    if (replayversion && boardnumber == 1)
    {
        draw_set_font(fnt_8bit);
        mspace = 24;
        var hspace = 8;
        var _xx = 360;
        var _yy = 55 + yyscroll;
        yy = cameray() + 42 + 56 + yyscroll;
        var horizontalmargin = 120;
        draw_set_font(fnt_8bit);
        var title = stringsetloc("CHEF RESULTS", "obj_round_evaluation_slash_Draw_0_gml_777_0");
        draw_set_halign(fa_center);
        sp_draw_text(midx, yy + (mspace * 0), title);
        draw_set_font(scr_84_get_font("8bit_mixed"));
        var _width = 240;
        draw_sprite_ext(spr_pxwhite, 0, (midx - round((_width / 2) + 10)) + shadoff, yy + (mspace * 0) + 6 + shadoff, -80, 2, 0, shadcolor, shadalph);
        draw_sprite_ext(spr_pxwhite, 0, ((midx + round((_width / 2) + 10)) - 2) + shadoff, yy + (mspace * 0) + 6 + shadoff, 80, 2, 0, shadcolor, shadalph);
        draw_sprite_ext(spr_pxwhite, 0, midx - round((_width / 2) + 10), yy + (mspace * 0) + 6, -80, 2, 0, c_white, 1);
        draw_sprite_ext(spr_pxwhite, 0, (midx + round((_width / 2) + 10)) - 2, yy + (mspace * 0) + 6, 80, 2, 0, c_white, 1);
        var _col = 16777215;
        draw_set_halign(fa_center);
        rcheckskip(1, 14);
        
        if (rtimer == 14)
        {
            snd_play(snd_punchmed);
            
            if (tallestever)
                snd_play_delay(453, 5, 1, 1);
        }
        
        if (rtimer > 14)
        {
            draw_set_halign(fa_left);
            draw_set_font(fnt_8bit);
            sp_draw_text(leftx, yy + (mspace * 1), /*"TALLEST STACK"*/"最高的堆叠");
            draw_set_font(scr_84_get_font("8bit_mixed"));
            draw_set_halign(fa_right);
            sp_draw_text(rightx, yy + (mspace * 1), string(maxstack));
            
            if (tallestever)
            {
                draw_set_color(c_yellow);
                draw_text(rightx, yy + (mspace * 1), string(maxstack));
                draw_set_color(c_white);
            }
        }
        
        rcheckskip(14, 28);
        
        if (rtimer == 28)
        {
            snd_play(snd_punchmed);
            
            if (foodwasted == 0)
                snd_play_delay(453, 5, 1, 1);
        }
        
        if (rtimer > 28)
        {
            draw_set_halign(fa_left);
            draw_set_font(fnt_8bit);
            sp_draw_text(leftx, yy + (mspace * 2), /*"FOODS WASTED"*/"浪费的食物");
            draw_set_font(scr_84_get_font("8bit_mixed"));
            draw_set_halign(fa_right);
            sp_draw_text(rightx, yy + (mspace * 2), string(foodwasted));
        }
        
        rcheckskip(28, 42);
        
        if (rtimer == 42)
            snd_play(snd_punchmed);
        
        if (rtimer > 42)
        {
            draw_set_halign(fa_left);
            draw_set_font(fnt_8bit);
            sp_draw_text(leftx, yy + (mspace * 3), /*"HAPPY CUSTOMERS"*/"满意的顾客");
            draw_set_font(scr_84_get_font("8bit_mixed"));
            draw_set_halign(fa_right);
            sp_draw_text(rightx, yy + (mspace * 3), string(customersfed));
        }
        
        rcheckskip(42, 56);
        
        if (rtimer == 56)
            snd_play(snd_punchmed);
        
        if (rtimer > 56)
        {
            draw_set_font(fnt_8bit);
            draw_set_halign(fa_left);
            sp_draw_text(leftx, yy + (mspace * 4), totalscore);
            draw_set_font(scr_84_get_font("8bit_mixed"));
        }
        
        rcheckskip(56, 70);
        
        if (rtimer == 70)
            snd_play(snd_punchmed);
        
        if (rtimer > 70)
        {
            if (currentphyspoints < physicalchallengepoints)
            {
                currentphyspoints += 20;
                
                if ((currentphyspoints % 100) == 0)
                {
                    snd_stop(snd_bump);
                    snd_play(snd_bump);
                }
                
                if ((button3_h() && currentphyspoints > 100) || button1_p())
                    currentphyspoints = physicalchallengepoints;
            }
            
            currentphyspoints = clamp(currentphyspoints, 0, physicalchallengepoints);
            draw_set_halign(fa_right);
            sp_draw_text(rightx, yy + (mspace * 4), string(round(currentphyspoints)));
        }
        
        draw_set_halign(fa_right);
        
        if (rtimer > 84)
        {
            if (currentphyspoints == physicalchallengepoints && gradecon == 0)
            {
                gradecon = 0.05;
                var del = 14;
                
                if (button3_h())
                    del = 1;
                
                scr_delay_var("gradecon", 0.1, del);
            }
        }
        
        if (gradecon == 0.1)
        {
            var drumrolldelay = 40;
            var del = drumrolldelay + 28;
            
            if (button3_h())
            {
                drumrolldelay = 1;
                del = 3;
            }
            
            scr_delay_var("gradecon", 1, drumrolldelay);
            scr_delay_var("gradecon", 2, del);
            snd_play_delay(90, del + 1, 1, 1);
            snd_stop(snd_applause_single);
            snd_play(snd_drumroll);
            gradecon = 0.2;
        }
        
        if (gradecon >= 1)
        {
            _col = c_pink;
            
            if (currentphyspoints == physicalchallengepoints)
                _col = 65535;
            
            if (currentphyspoints < 200 && !madesound)
            {
                currentphysgrade = _zrank;
                currentphychallengerank = 0;
                madesound = true;
                snd_play(snd_splat);
            }
            
            if (currentphyspoints >= 200 && currentphyspoints < 300 && !madesound)
            {
                currentphysgrade = _crank;
                currentphychallengerank = 1;
                madesound = true;
                snd_play(snd_splat);
            }
            
            if (currentphyspoints >= 300 && currentphyspoints < 380 && !madesound)
            {
                currentphysgrade = _brank;
                currentphychallengerank = 2;
                madesound = true;
                snd_play(snd_coin);
            }
            
            if (currentphyspoints >= 380 && currentphyspoints < 450 && !madesound)
            {
                currentphysgrade = _arank;
                currentphychallengerank = 3;
                madesound = true;
                snd_play(snd_coin);
            }
            
            if (currentphyspoints >= 450 && currentphyspoints < 640 && !madesound)
            {
                currentphysgrade = _srank;
                currentphychallengerank = 4;
                madesound = true;
                snd_play(snd_punchmed);
                snd_play(snd_applause_single);
            }
            
            if ((currentphyspoints >= 640 || chef_rank_letter == "T") && !madesound)
            {
                currentphysgrade = _trank;
                currentphychallengerank = 5;
                madesound = true;
                snd_play(snd_punchmed);
                snd_play(snd_applause_single);
            }
            
            draw_set_font(fnt_8bit);
            draw_set_halign(fa_center);
            draw_text_transformed_color(midx + shadoff, yy + (mspace * 5.5) + shadoff, currentphysgrade, 3, 3, 0, shadcolor, shadcolor, shadcolor, shadcolor, shadalph);
            draw_text_transformed_color(midx, yy + (mspace * 5.5), currentphysgrade, 3, 3, 0, c_yellow, c_yellow, c_white, c_white, 1);
            draw_set_halign(fa_left);
            draw_set_font(scr_84_get_font("8bit_mixed"));
        }
        
        if (gradecon >= 2)
        {
            reachedend_draw_triangle_siner += 0.3;
            var _flashcol = merge_color(c_white, c_yellow, 0.4 + (sin(reachedend_draw_triangle_siner) / 3));
            draw_set_halign(fa_center);
            draw_text_transformed_color(midx + shadoff, 12 + yy + (mspace * 8) + shadoff, pressanybutton, 1, 1, 0, shadcolor, shadcolor, shadcolor, shadcolor, shadalph);
            draw_text_transformed_color(midx, 12 + yy + (mspace * 8), pressanybutton, 1, 1, 0, _flashcol, _flashcol, _flashcol, _flashcol, 1);
        }
        
        draw_set_halign(fa_left);
        
        if (gradecon >= 2 && musicstarted == false)
        {
            snd_free_all();
            
            if (currentphysgrade == _zrank)
            {
                global.currentsong[0] = snd_init("tv_changingroom.ogg");
                global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
            }
            
            if (currentphysgrade != _zrank)
            {
                global.currentsong[0] = snd_init("nes_intro_extended_part2.ogg");
                global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
                snd_play(snd_crowd_cheer_single);
            }
            
            if (currentphysgrade != _zrank)
            {
                with (obj_event_manager)
                    trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_20);
            }
            
            musicstarted = true;
        }
        
        if (gradecon >= 2)
        {
            if (!sndplayed)
            {
                if (button1_p() || button2_p() || button3_p())
                {
                    con++;
                    snd_free_all();
                    snd_play(snd_explosion_mmx);
                    
                    if (global.flag[1193] < physicalchallengepoints)
                    {
                        global.flag[1193] = physicalchallengepoints;
                        global.flag[1194] = currentphychallengerank;
                    }
                    
                    sndplayed = true;
                }
            }
        }
    }
    
    if (!replayversion)
    {
        if (currentgradetotal <= 7 && currentgradetotal > 3)
        {
            lettergrade = _clet;
            gradenumber = 1;
        }
        
        if (currentgradetotal <= 16 && currentgradetotal > 7)
        {
            lettergrade = _blet;
            gradenumber = 2;
        }
        
        if (currentgradetotal <= 24 && currentgradetotal > 16)
        {
            lettergrade = _alet;
            gradenumber = 3;
        }
        
        if (currentgradetotal <= 40 && currentgradetotal > 24)
        {
            lettergrade = _slet;
            gradenumber = 4;
        }
        
        if ((boardnumber == 1 && currentgradetotal >= 32 && extrakeycount >= 1 && currentphychallengerank == 5) || (boardnumber == 1 && currentgradetotal >= 40) || (boardnumber == 1 && currentgradetotal >= 32 && extrakeycount >= 2 && currentbattlerank == 5 && currenttotalpointsrank == 5 && currentphychallengerank >= 4) || (boardnumber == 2 && currentgradetotal >= 32 && (mossfound || extrapicturecount) && currentphychallengerank == 5) || (boardnumber == 2 && currentgradetotal >= 40) || (boardnumber == 2 && currentgradetotal >= 32 && (mossfound && extrapicturecount) && currentbattlerank == 5 && currenttotalpointsrank == 5 && currentphychallengerank >= 4))
        {
            lettergrade = _tlet;
            gradenumber = 5;
        }
        
        var rep = 1;
        
        if (button1_h() || button3_h())
            rep = 5;
        
        repeat (rep)
        {
            if (gradecon < 10 && rtimer > 14.01)
            {
            }
            else if (currenttotalpoints < totalpoints && rtimer > 28.01)
            {
            }
            else if (currentphyspoints < physicalchallengepoints && rtimer > 42.01)
            {
            }
            else if (rtimer <= 14)
            {
                rtimer += 0.16666666666666666;
                
                if (rtimer == 0.16666666666666666)
                {
                    snd_play(snd_closet_impact);
                    scr_shakeobj(shakeobj, 12);
                }
                
                if (rtimer == 7)
                    snd_play(snd_drumroll);
            }
            else if (rtimer >= 70 && rtimer < 112)
            {
                rtimer += 2;
            }
            else if (rtimer >= 112)
            {
                rtimer += 0.2;
            }
            else
            {
                rtimer++;
                rtimer = round(rtimer);
            }
            
            if (rtimer == 14 || rtimer == 28 || rtimer == 42)
                snd_play(snd_punchmed);
            
            if (rtimer == 42 && secretitemfound == false && !mossfound)
                rtimer = 112.5;
            
            if ((rtimer == 56 && secretitemfound == true) || (rtimer == 56 && mossfound) || (rtimer == 70 && extrapicturecount && mossfound))
            {
                snd_stop(snd_applause_single);
                snd_play(snd_applause_single);
                
                if (rtimer == 56)
                {
                    if (secretitemfound && mossfound)
                    {
                    }
                    else
                    {
                        rtimer = 84;
                    }
                }
                
                if (rtimer == 70)
                    rtimer = 84;
            }
            
            if (rtimer == 126)
            {
                snd_stop(snd_applause_single);
                snd_play(snd_drumroll);
            }
            
            if (rtimer == 140)
            {
                if (gradenumber == 0)
                {
                    snd_play(snd_splat);
                    snd_play(snd_crowd_laughter_single);
                }
                
                if (gradenumber == 1)
                {
                    snd_play(snd_splat);
                    snd_play(snd_crowd_laughter_single);
                }
                
                if (gradenumber == 2)
                {
                    snd_play(snd_heavyswing);
                    snd_play(snd_applause_single);
                }
                
                if (gradenumber == 3)
                {
                    snd_play(snd_heavyswing);
                    snd_play(snd_applause_single);
                }
                
                if (gradenumber == 4)
                {
                    snd_play(snd_heavyswing);
                    snd_play(snd_applause_single);
                }
                
                if (gradenumber == 5)
                {
                    snd_play_x(snd_spell_pacify, 1, 1.2);
                    snd_play(snd_heavyswing);
                    snd_play(snd_applause_single);
                }
            }
            
            if (rtimer == 150)
                snd_play(snd_board_text_main_end);
        }
        
        if (rtimer > 150 && con == 1)
        {
            if (button1_p())
            {
                con++;
                snd_play(snd_board_text_main_end);
                
                if (boardnumber == 1)
                {
                    if (global.flag[1193] < physicalchallengepoints)
                    {
                        global.flag[1193] = physicalchallengepoints;
                        global.flag[1194] = currentphychallengerank;
                    }
                }
                
                if (boardnumber == 2)
                {
                    if (global.flag[1195] < physicalchallengepoints)
                    {
                        global.flag[1195] = physicalchallengepoints;
                        global.flag[1196] = currentphychallengerank;
                    }
                }
            }
        }
        
        draw_set_font(fnt_8bit);
        draw_set_font(scr_84_get_font("8bit_mixed"));
        mspace = 24;
        var hspace = 8;
        var _xx = 360;
        var _yy = 55 + yyscroll;
        yy = cameray() + 56 + yyscroll;
        var horizontalmargin = 80;
        var indent = 40;
        leftx = round(camerax()) + horizontalmargin + shakeobj.x;
        rightx = ((round(camerax()) + 640) - horizontalmargin) + shakeobj.x;
        midx = camerax() + 374 + shakeobj.x;
        mspace = 32;
        var title = evaluation;
        draw_set_valign(fa_top);
        draw_set_halign(fa_center);
        sp_draw_text(camerax() + 320 + shakeobj.x, yy + (mspace * 0), title);
        draw_set_halign(fa_right);
        draw_sprite_ext(spr_pxwhite, 0, ((camerax() + 320 + shakeobj.x) - round((string_width(title) / 2) + 10)) + shadoff, yy + (mspace * 0) + 6 + shadoff, -80, 2, 0, shadcolor, shadalph);
        draw_sprite_ext(spr_pxwhite, 0, ((camerax() + 320 + shakeobj.x + round((string_width(title) / 2) + 10)) - 2) + shadoff, yy + (mspace * 0) + 6 + shadoff, 80, 2, 0, shadcolor, shadalph);
        draw_sprite_ext(spr_pxwhite, 0, (camerax() + 320 + shakeobj.x) - round((string_width(title) / 2) + 10), yy + (mspace * 0) + 6, -80, 2, 0, c_white, 1);
        draw_sprite_ext(spr_pxwhite, 0, (camerax() + 320 + shakeobj.x + round((string_width(title) / 2) + 10)) - 2, yy + (mspace * 0) + 6, 80, 2, 0, c_white, 1);
        draw_set_halign(fa_left);
        
        if (rtimer > 14)
        {
            var battles = stringsetloc("BATTLES", "obj_round_evaluation_slash_Draw_64_gml_177_0");
            sp_draw_text(leftx, yy + (mspace * 1), battles);
        }
        
        if (rtimer > 14)
        {
            var finalgrade = "";
            
            if (boardnumber == 1)
                finalgrade = global.battlegrade[0 + gradecon];
            
            if (boardnumber == 2)
                finalgrade = global.battlegrade[10 + gradecon];
            
            if (gradecon < 10)
            {
                var totalincreaseamount = 1;
                
                if (totalbattles == 2)
                    totalincreaseamount = 1.5;
                
                _rep = 1;
                
                if (button3_h())
                    _rep = 5;
                
                repeat (_rep)
                {
                    gradetimer++;
                    
                    if (gradetimer == 2)
                        _battlegrade[gradecon] = "F";
                    
                    if (gradetimer == 4)
                        _battlegrade[gradecon] = "Z";
                    
                    if (gradetimer == 6)
                    {
                        if (finalgrade != "Z")
                        {
                            _battlegrade[gradecon] = "C";
                            currentbattlerank = 1;
                            currentgradetotal += totalincreaseamount;
                        }
                        else
                        {
                            gradetimer = 45;
                        }
                    }
                    
                    if (gradetimer == 8)
                    {
                        if (finalgrade != "Z" && finalgrade != "C")
                        {
                            _battlegrade[gradecon] = "B";
                            currentbattlerank = 2;
                            currentgradetotal += totalincreaseamount;
                        }
                        else
                        {
                            gradetimer = 45;
                        }
                    }
                    
                    if (gradetimer == 10)
                    {
                        if (finalgrade != "Z" && finalgrade != "C" && finalgrade != "B")
                        {
                            _battlegrade[gradecon] = "A";
                            currentbattlerank = 3;
                            currentgradetotal += totalincreaseamount;
                        }
                        else
                        {
                            gradetimer = 45;
                        }
                    }
                    
                    if (gradetimer == 12)
                    {
                        if (finalgrade != "Z" && finalgrade != "C" && finalgrade != "B" && finalgrade != "A")
                        {
                            _battlegrade[gradecon] = "S";
                            currentbattlerank = 4;
                            currentgradetotal += totalincreaseamount;
                        }
                        else
                        {
                            gradetimer = 45;
                        }
                    }
                    
                    if (gradetimer == 14)
                    {
                        if (finalgrade != "Z" && finalgrade != "C" && finalgrade != "B" && finalgrade != "A" && finalgrade != "S")
                        {
                            _battlegrade[gradecon] = "T";
                            currentbattlerank = 5;
                            currentgradetotal += totalincreaseamount;
                        }
                        
                        gradetimer = 45;
                    }
                    
                    if ((gradetimer % 2) == 0 && gradetimer < 15 && gradetimer > 0)
                    {
                        snd_stop(snd_bump);
                        snd_play(snd_bump);
                    }
                    
                    if (gradetimer == 45)
                    {
                        gradetimer = 0;
                        gradecon++;
                        
                        if (totalbattles == gradecon)
                        {
                            gradecon = 10;
                            battlegrade = _zrank;
                            
                            if (currentgradetotal >= 2)
                                battlegrade = _crank;
                            
                            if (currentgradetotal >= 5)
                                battlegrade = _brank;
                            
                            if (currentgradetotal >= 8)
                                battlegrade = _arank;
                            
                            if (currentgradetotal >= 11)
                                battlegrade = _srank;
                            
                            if (currentgradetotal >= 14)
                                battlegrade = _trank;
                            
                            savebattlepoints = currentgradetotal;
                            currentbattlegrade = battlegrade;
                            
                            if (currentbattlerank == 0)
                                snd_play(snd_splat);
                            
                            if (currentbattlerank == 1)
                                snd_play(snd_splat);
                            
                            if (currentbattlerank == 2)
                                snd_play(snd_coin);
                            
                            if (currentbattlerank == 3)
                                snd_play(snd_coin);
                            
                            if (currentbattlerank == 4)
                            {
                                snd_play(snd_punchmed);
                                snd_play(snd_applause_single);
                            }
                            
                            if (currentbattlerank == 5)
                            {
                                snd_play(snd_punchmed);
                                snd_play(snd_applause_single);
                            }
                        }
                    }
                }
            }
            
            draw_set_font(fnt_8bit);
            var offset = round((16 * totalbattles) / 2);
            
            for (var i = 0; i < totalbattles; i++)
                sp_draw_text((midx - offset) + (i * 20), yy + (mspace * 1), _battlegrade[i]);
            
            draw_set_font(scr_84_get_font("8bit_mixed"));
        }
        
        var _col = 16777215;
        draw_set_halign(fa_right);
        
        if (rtimer > 14)
        {
            if (currentbattlegrade == battlegrade)
                _col = c_pink;
            
            draw_set_color(_col);
            draw_set_font(fnt_8bit);
            sp_draw_text(rightx, yy + (mspace * 1), currentbattlegrade);
            draw_set_color(c_white);
            draw_set_font(scr_84_get_font("8bit_mixed"));
        }
        
        _yy += 12;
        draw_set_halign(fa_left);
        
        if (rtimer > 28)
            sp_draw_text(leftx, yy + (mspace * 2), pointsgained);
        
        if (rtimer > 28)
        {
            _rep = 1;
            
            if (button3_h())
                _rep = 5;
            
            repeat (_rep)
            {
                if (currenttotalpoints < totalpoints)
                {
                    currenttotalpoints += 20;
                    
                    if ((currenttotalpoints % 100) == 0)
                    {
                        snd_stop(snd_bump);
                        snd_play(snd_bump);
                    }
                }
                
                if (currenttotalpoints > totalpoints)
                    currenttotalpoints = totalpoints;
                
                if (currenttotalpoints < (rank1total * 0.42))
                    currenttotalgrade = _zrank;
                
                if (currenttotalpoints >= (rank1total * 0.42) && currenttotalgrade == _zrank)
                {
                    currenttotalgrade = _crank;
                    currenttotalpointsrank = 1;
                    currentgradetotal += 2;
                }
                
                if (currenttotalpoints >= (rank1total * 0.5) && currenttotalgrade == _crank)
                {
                    currenttotalgrade = _brank;
                    currenttotalpointsrank = 2;
                    currentgradetotal += 2;
                }
                
                if (currenttotalpoints >= (rank1total * 0.66) && currenttotalgrade == _brank)
                {
                    currenttotalgrade = _arank;
                    currenttotalpointsrank = 3;
                    currentgradetotal += 2;
                }
                
                if (currenttotalpoints >= (rank1total * 0.8) && currenttotalgrade == _arank)
                {
                    currenttotalgrade = _srank;
                    currenttotalpointsrank = 4;
                    currentgradetotal += 2;
                }
                
                if (currenttotalpoints >= (rank1total * 1) && currenttotalgrade == _srank)
                {
                    currenttotalgrade = _trank;
                    currenttotalpointsrank = 5;
                    currentgradetotal += 2;
                }
                
                if (currenttotalpoints == totalpoints && gradecon == 10)
                {
                    savetotalpoints = currentgradetotal - savebattlepoints;
                    gradecon = 11;
                    snd_stop(snd_applause_single);
                    
                    if (currenttotalpointsrank == 0)
                        snd_play(snd_splat);
                    
                    if (currenttotalpointsrank == 1)
                        snd_play(snd_splat);
                    
                    if (currenttotalpointsrank == 2)
                        snd_play(snd_coin);
                    
                    if (currenttotalpointsrank == 3)
                        snd_play(snd_coin);
                    
                    if (currenttotalpointsrank == 4)
                    {
                        snd_play(snd_punchmed);
                        snd_play(snd_applause_single);
                    }
                    
                    if (currenttotalpointsrank == 5)
                    {
                        snd_play(snd_punchmed);
                        snd_play(snd_applause_single);
                    }
                }
                
                draw_set_halign(fa_center);
                draw_set_font(fnt_8bit);
                sp_draw_text(midx, yy + (mspace * 2), currenttotalpoints);
                draw_set_font(scr_84_get_font("8bit_mixed"));
                draw_set_halign(fa_left);
            }
        }
        
        _col = 16777215;
        draw_set_halign(fa_right);
        
        if (rtimer > 28)
        {
            if (currenttotalpoints == totalpoints)
                _col = c_pink;
            
            draw_set_color(_col);
            draw_set_font(fnt_8bit);
            sp_draw_text(rightx, yy + (mspace * 2), currenttotalgrade);
            draw_set_font(scr_84_get_font("8bit_mixed"));
            draw_set_halign(fa_left);
            draw_set_color(c_white);
        }
        
        _yy += 12;
        _col = 16777215;
        draw_set_halign(fa_left);
        
        if (rtimer > 42)
            sp_draw_text(leftx, yy + (mspace * 3), _physicalchallenge);
        
        var _rep = 1;
        
        if (button3_h())
            _rep = 10;
        
        repeat (_rep)
        {
            if (rtimer > 42)
            {
                if (currentphyspoints < physicalchallengepoints)
                {
                    if (boardnumber == 2)
                    {
                        currentphyspoints += 200;
                        
                        if ((currentphyspoints % 400) == 0)
                        {
                            snd_stop(snd_bump);
                            snd_play(snd_bump);
                        }
                    }
                    else
                    {
                        currentphyspoints += 20;
                        
                        if ((currentphyspoints % 100) == 0)
                        {
                            snd_stop(snd_bump);
                            snd_play(snd_bump);
                        }
                    }
                }
                
                if (currentphyspoints > physicalchallengepoints)
                    currentphyspoints = physicalchallengepoints;
                
                if (currentphyspoints == physicalchallengepoints && gradecon == 11)
                {
                    gradecon = 12;
                    snd_stop(snd_applause_single);
                    
                    if (currentphychallengerank == 0)
                        snd_play(snd_splat);
                    
                    if (currentphychallengerank == 1)
                        snd_play(snd_splat);
                    
                    if (currentphychallengerank == 2)
                        snd_play(snd_coin);
                    
                    if (currentphychallengerank == 3)
                        snd_play(snd_coin);
                    
                    if (currentphychallengerank == 4)
                    {
                        snd_play(snd_punchmed);
                        snd_play(snd_applause_single);
                    }
                    
                    if (currentphychallengerank == 5)
                    {
                        snd_play(snd_punchmed);
                        snd_play(snd_applause_single);
                    }
                    
                    savephypoints = currentgradetotal - savetotalpoints - savebattlepoints;
                }
                
                draw_set_halign(fa_center);
                draw_set_font(fnt_8bit);
                sp_draw_text(midx, yy + (mspace * 3), round(currentphyspoints));
                draw_set_font(scr_84_get_font("8bit_mixed"));
                draw_set_halign(fa_left);
                draw_set_halign(fa_right);
                
                if (currentphyspoints == physicalchallengepoints)
                    _col = c_pink;
                
                if (boardnumber == 1)
                {
                    if (chef_rank_letter == "T" && tchefvar == false)
                    {
                        currentphysgrade = _trank;
                        currentphychallengerank = 5;
                        currentgradetotal += 15;
                        tchefvar = true;
                    }
                    else if (tchefvar == false)
                    {
                        if (currentphyspoints <= 210)
                        {
                            currentphysgrade = _zrank;
                            currentphychallengerank = 0;
                        }
                        
                        if (currentphyspoints > 210 && currentphysgrade == _zrank)
                        {
                            currentphysgrade = _crank;
                            currentphychallengerank = 1;
                            currentgradetotal += 3;
                        }
                        
                        if (currentphyspoints > 300 && currentphysgrade == _crank)
                        {
                            currentphysgrade = _brank;
                            currentphychallengerank = 2;
                            currentgradetotal += 3;
                        }
                        
                        if (currentphyspoints > 380 && currentphysgrade == _brank)
                        {
                            currentphysgrade = _arank;
                            currentphychallengerank = 3;
                            currentgradetotal += 3;
                        }
                        
                        if (currentphyspoints > 450 && currentphysgrade == _arank)
                        {
                            currentphysgrade = _srank;
                            currentphychallengerank = 4;
                            currentgradetotal += 3;
                        }
                        
                        if (currentphyspoints >= 640 && currentphysgrade == _srank)
                        {
                            currentphysgrade = _trank;
                            currentphychallengerank = 5;
                            currentgradetotal += 3;
                            tchefvar = true;
                        }
                    }
                    
                    if (!trophy_active && currentphysgrade != _zrank)
                    {
                        trophy_active = true;
                        
                        with (obj_event_manager)
                            trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_20);
                    }
                }
                
                if (boardnumber == 2)
                {
                    if (currentphyspoints < 14500)
                    {
                        currentphysgrade = _zrank;
                        currentphychallengerank = 0;
                    }
                    
                    if (currentphyspoints >= 14500 && currentphysgrade == _zrank)
                    {
                        currentphysgrade = _crank;
                        currentphychallengerank = 1;
                        currentgradetotal += 3;
                    }
                    
                    if (currentphyspoints >= 18000 && currentphysgrade == _crank)
                    {
                        currentphysgrade = _brank;
                        currentphychallengerank = 2;
                        currentgradetotal += 3;
                    }
                    
                    if (currentphyspoints >= 22000 && currentphysgrade == _brank)
                    {
                        currentphysgrade = _arank;
                        currentphychallengerank = 3;
                        currentgradetotal += 3;
                    }
                    
                    if (currentphyspoints >= 25000 && currentphysgrade == _arank)
                    {
                        currentphysgrade = _srank;
                        currentphychallengerank = 4;
                        currentgradetotal += 3;
                    }
                    
                    if (currentphyspoints >= 28000 && currentphysgrade == _srank)
                    {
                        currentphysgrade = _trank;
                        currentphychallengerank = 5;
                        currentgradetotal += 3;
                    }
                    
                    if (!trophy_active && currentphysgrade != _zrank)
                    {
                        trophy_active = true;
                        
                        with (obj_event_manager)
                            trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_21);
                    }
                }
                
                draw_set_color(_col);
                draw_set_font(fnt_8bit);
                sp_draw_text(rightx, yy + (mspace * 3), currentphysgrade);
                draw_set_font(scr_84_get_font("8bit_mixed"));
                draw_set_color(c_white);
            }
        }
        
        _yy += 12;
        
        if (rtimer > 56)
        {
            if (boardnumber == 1 && extrakeycount > 0)
            {
                if (secretset1 == 0)
                {
                    secretset1 = 1;
                    var savecurrent = currentgradetotal;
                    
                    if (currentgradetotal <= 24)
                        currentgradetotal += 4;
                    else if (currentgradetotal > 24 && currentgradetotal < 32)
                        currentgradetotal = 32;
                    else if (currentgradetotal >= 32 && currentgradetotal <= 38)
                        currentgradetotal = 39;
                    
                    savekey1 = currentgradetotal - savecurrent;
                }
                
                if (secretset1 == 1 && extrakeycount == 2)
                {
                    secretset1 = 2;
                    var savecurrent = currentgradetotal;
                    
                    if (currentgradetotal <= 24)
                        currentgradetotal += 4;
                    else if (currentgradetotal > 24 && currentgradetotal < 32)
                        currentgradetotal = 32;
                    else if (currentgradetotal >= 32 && currentgradetotal <= 38)
                        currentgradetotal = 39;
                    
                    savekey2 = currentgradetotal - savecurrent;
                }
                
                currentsecretcount++;
                draw_set_halign(fa_left);
                draw_set_font(scr_84_get_font("8bit_mixed"));
                sp_draw_text(leftx + indent, yy + (mspace * 4), secretbonus);
                draw_set_font(scr_84_get_font("8bit_mixed"));
                draw_set_halign(fa_right);
                keystring = stringsetloc("EXTRA KEY!", "obj_round_evaluation_slash_Draw_0_gml_1378_0");
                
                if (extrakeycount == 2)
                    keystring += " x2";
                
                draw_set_font(fnt_8bit);
                sp_draw_text(rightx, yy + (mspace * 4), keystring);
                draw_set_font(scr_84_get_font("8bit_mixed"));
                draw_set_halign(fa_left);
                _yy += 36;
                _xx -= 10;
            }
            
            if (boardnumber == 2 && (mossfound || extrapicturecount))
            {
                if (secretset2 == 0)
                {
                    var savecurrent = currentgradetotal;
                    secretset2 = 1;
                    
                    if (currentgradetotal <= 24)
                        currentgradetotal += 4;
                    else if (currentgradetotal > 24 && currentgradetotal < 32)
                        currentgradetotal = 32;
                    else if (currentgradetotal >= 32 && currentgradetotal <= 38)
                        currentgradetotal = 39;
                    
                    savekey1 = currentgradetotal - savecurrent;
                }
                
                currentsecretcount++;
                draw_set_halign(fa_left);
                var bonuscount = extrapicturecount + mossfound;
                var extraphoto = stringsetloc("EXTRA PHOTO!", "obj_round_evaluation_slash_Draw_0_gml_1403_0");
                var atemoss = stringsetloc("ATE MOSS!", "obj_round_evaluation_slash_Draw_0_gml_1404_0");
                btext[0] = "none";
                btext[1] = "none";
                
                if (extrapicturecount)
                    btext[0] = extraphoto;
                
                if (mossfound)
                {
                    if (btext[0] == "none")
                        btext[0] = atemoss;
                    else
                        btext[1] = atemoss;
                }
                
                if (btext[1] != "none" && secretset2 == 1)
                {
                    var savecurrent = currentgradetotal;
                    secretset2 = 2;
                    
                    if (currentgradetotal <= 24)
                        currentgradetotal += 4;
                    else if (currentgradetotal > 24 && currentgradetotal < 32)
                        currentgradetotal = 32;
                    else if (currentgradetotal >= 32 && currentgradetotal <= 38)
                        currentgradetotal = 39;
                    
                    savekey2 = currentgradetotal - savecurrent;
                }
                
                if (yyscroll == 0)
                {
                    for (var i = 0; i < 2; i++)
                    {
                        var cont = true;
                        
                        if (i == 1 && rtimer < 70)
                            cont = false;
                        
                        draw_set_font(fnt_8bit);
                        
                        if (btext[i] != "none" && cont)
                        {
                            draw_set_halign(fa_right);
                            sp_draw_text(rightx, yy + (mspace * (4 + i)), btext[i]);
                            draw_set_halign(fa_left);
                            draw_set_font(scr_84_get_font("8bit_mixed"));
                            sp_draw_text(leftx + indent, yy + (mspace * (4 + i)), secretbonus);
                            draw_set_font(scr_84_get_font("8bit_mixed"));
                        }
                        
                        draw_set_font(scr_84_get_font("8bit_mixed"));
                    }
                }
            }
        }
        
        var _waittime = 0;
        
        if (boardnumber == 2 && (extrapicturecount || mossfound))
            _waittime = 2;
        
        draw_set_font(fnt_8bit);
        midx = camerax() + 320 + shakeobj.x;
        var roundcompletetext1 = stringsetloc("ROUND COMPLETE!!", "obj_round_evaluation_slash_Draw_0_gml_1456_0");
        draw_set_halign(fa_center);
        var str = string_hash_to_newline(roundcompletetext1);
        draw_set_font(scr_84_get_font("8bit_mixed"));
        
        if (rtimer > 126)
        {
            draw_set_font(fnt_8bit);
            sp_draw_text(midx, yy + (mspace * 7), roundcompletetext1);
            sp_draw_text(midx, yy + (mspace * 7) + /*18*/20, stringsetloc("YOU GOT", "obj_round_evaluation_slash_Draw_0_gml_1457_0"));
            draw_set_font(scr_84_get_font("8bit_mixed"));
        }
        
        if (rtimer > 140 && musicstarted == false)
        {
            snd_free_all();
            global.currentsong[0] = snd_init("nes_intro_extended_part2.ogg");
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
            musicstarted = true;
        }
        
        if (rtimer > 140)
        {
            var desiredletter = lettergrade;
            
            if (_lettergrade != "")
                desiredletter = _lettergrade;
            
            var rankstring = desiredletter + "-" + roundcompletetext2;
            draw_set_font(fnt_8bit);
            draw_set_halign(fa_center);
            draw_set_color(shadcolor);
            draw_set_alpha(shadalph);
            draw_text_transformed(midx + shadoff, yy + (mspace * 7) + /*36*/40 + shadoff, rankstring + "!!", 2, 2, 0);
            draw_set_color(c_white);
            draw_set_alpha(1);
            var col = 65535;
            draw_text_transformed_color(midx, yy + (mspace * 7) + /*36*/40, rankstring + "!!", 2, 2, 0, col, col, c_white, c_white, 1);
            draw_set_color(c_white);
            draw_set_font(scr_84_get_font("8bit_mixed"));
        }
        
        draw_set_halign(fa_left);
        
        if (rtimer > 150 && con == 1)
        {
            reachedend_draw_triangle_siner++;
            
            if (reachedend_draw_triangle_siner < 20)
                draw_sprite_ext(spr_custommenu_arrow_nooutline, 0, board_tilex(13), board_tiley(11.5) + _y_extra, 2, 2, 0, c_white, 1);
            
            if (reachedend_draw_triangle_siner >= 30)
                reachedend_draw_triangle_siner = 0;
        }
    }
    
    var endy = -175;
    
    if (con == 2 && _lettergrade == "")
    {
        if (replayversion)
        {
            con = 3;
            
            with (obj_gameover_minigame)
                quitcon = 1;
            
            timer = 0;
            scr_fadeout(30);
            
            with (obj_fadeout)
            {
                depth = other.depth - 9999;
                
                if (room == room_dw_rhythm)
                {
                    x = -640;
                    y = -480;
                    length = 9999999;
                    height = 9999999;
                }
            }
        }
        else
        {
            if (!setboardranking)
            {
                if (boardnumber == 1)
                    global.flag[1173] = gradenumber;
                
                if (boardnumber == 2)
                    global.flag[1174] = gradenumber;
                
                setboardranking = true;
            }
            
            if (yyscroll > endy)
            {
                yyscroll -= 8;
            }
            else
            {
                yscroll = endy;
                instance_create(x, y, obj_round_evaluation_fg);
                persistent = true;
                _lettergrade = lettergrade;
            }
        }
    }
}

if (tv_vignette)
    draw_sprite_ext(spr_dw_gameshow_screen_vignette, 0, camerax() + 124, cameray() + 48, 1, 1, 0, c_white, tv_vignette_alpha);

if (white_overlay)
{
    draw_set_color(c_white);
    draw_set_alpha(white_overlay_alpha);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + view_wport[0], cameray() + view_hport[0], false);
    draw_set_alpha(1);
}

if (scr_debug() && keyboard_check_pressed(ord("P")))
{
    con = 0;
    timer = 0;
    rtimer = 0;
    yyscroll = 0;
    star_anim = 0;
    star_anim_speed = 0.5;
    bg_speed = 1;
    bg_speed_y = 1;
    bg_speed_max = 3;
    bg_speed_y_max = 3;
    x = xstart;
    y = start_y;
    bg_y_extra = 0;
    bg_x_extra = 0;
    gradetimer = -8;
    gradecon = 0;
    musicstarted = false;
    currentphyspoints = 0;
    bouncecount = 0;
    currentgraderank = 5;
    currentbattlerank = 5;
    currenttotalpointsrank = 5;
    currentphychallengerank = -1;
    currentsecretcount = 0;
    currentgradetotal = 0;
    currenttotalpoints = 0;
    currentphyspoints = 0;
    gradenumber = 0;
    lettergrade = "";
    savebattlepoints = -1;
    savetotalpoints = -1;
    savephypoints = -1;
    secretset1 = 0;
    secretset2 = 0;
    savekey1 = -1;
    savekey2 = -1;
    madesound = false;
    snd_free_all();
}

if (scr_debug() && con >= 1 && !replayversion)
{
    var debugbarsize = lerp(1, 5, currentgradetotal / currentgradetotalmax);
    draw_set_color(c_red);
    ossafe_fill_rectangle(camerax() + 100, (cameray() + cameraheight()) - 40, camerax() + 550, (cameray() + cameraheight()) - 20, false);
    draw_set_color(c_green);
    ossafe_fill_rectangle(camerax() + 100, (cameray() + cameraheight()) - 40, camerax() + (debugbarsize * 110), (cameray() + cameraheight()) - 20, false);
    draw_set_color(c_white);
    draw_text(camerax() + 100, (cameray() + cameraheight()) - 58, "rank:" + string(currentgradetotal) + "/" + string(currentgradetotalmax) + " : " + string(lettergrade));
    var a = lerp(1, 5, 7 / currentgradetotalmax);
    draw_line(camerax() + (a * 110), (cameray() + cameraheight()) - 41, camerax() + (a * 110), (cameray() + cameraheight()) - 20);
    a = lerp(1, 5, 16 / currentgradetotalmax);
    draw_line(camerax() + (a * 110), (cameray() + cameraheight()) - 41, camerax() + (a * 110), (cameray() + cameraheight()) - 20);
    a = lerp(1, 5, 24 / currentgradetotalmax);
    draw_line(camerax() + (a * 110), (cameray() + cameraheight()) - 41, camerax() + (a * 110), (cameray() + cameraheight()) - 20);
    a = lerp(1, 5, 32 / currentgradetotalmax);
    draw_line(camerax() + (a * 110), (cameray() + cameraheight()) - 41, camerax() + (a * 110), (cameray() + cameraheight()) - 20);
    
    if (savebattlepoints != -1)
        draw_text(camerax() + 576, cameray() + 88, "(" + string(savebattlepoints) + ")");
    
    if (savetotalpoints != -1)
        draw_text(camerax() + 576, cameray() + 120, "(" + string(savetotalpoints) + ")");
    
    if (savephypoints != -1)
        draw_text(camerax() + 576, cameray() + 152, "(" + string(savephypoints) + ")");
    
    if (savekey1 != -1)
        draw_text(camerax() + 576, cameray() + 184, "(" + string(savekey1) + ")");
    
    if (savekey2 != -1)
        draw_text(camerax() + 576, cameray() + 216, "(" + string(savekey2) + ")");
}

enum UnknownEnum
{
    Value_0,
    Value_20 = 20,
    Value_21
}
