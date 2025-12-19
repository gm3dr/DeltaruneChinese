if (init)
{
    draw_set_alpha(1);
    draw_set_color(gameshowblue);
    
    if (board4 && (!i_ex(quizzler) || quizzler.con == 0))
        ossafe_fill_rectangle(128, 4, 511, 259, false);
    else if (!i_ex(quizzler) || quizzler.con < 4)
        ossafe_fill_rectangle(128, 64, 511, 319, false);
    
    draw_set_color(c_white);
    draw_set_font(fnt_8bit);
    
    if (con == 0 && (!i_ex(quizzler) || quizzler.con == 0 || con == 6))
    {
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(gameshowblue);
        quizstring = stringsetloc("QUIZ!", "obj_quizsequence_slash_Draw_0_gml_43_0");
        var _tx = 332;
        var _ty = board4 ? 140 : 194;
        var _scale = scr_ease_in(clamp01(remap(0, 9, 1, 0, timer)), -1) + 1;
        draw_text_transformed((1 + _tx) - (6 * _scale), _ty, string_hash_to_newline(quizstring), 3 * _scale, 3 * _scale, 0);
        draw_text_transformed(1 + _tx, _ty - (6 * _scale), string_hash_to_newline(quizstring), 3 * _scale, 3 * _scale, 0);
        draw_text_transformed(1 + _tx + (6 * _scale), _ty, string_hash_to_newline(quizstring), 3 * _scale, 3 * _scale, 0);
        draw_text_transformed(1 + _tx, _ty + (6 * _scale), string_hash_to_newline(quizstring), 3 * _scale, 3 * _scale, 0);
        draw_set_color(c_white);
        draw_text_transformed(_tx, _ty, string_hash_to_newline(quizstring), 3 * _scale, 3 * _scale, 0);
        draw_set_color(gameshowblue);
    }
    
    if (board4 && i_ex(quizzler) && quizzler.con == 1)
        depth = newdepth;
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    if (con == 7)
    {
        draw_sprite_ext(spr_quiz_results, 0, camerax() + 320, cameray() + 112 + 10, 2, 2, 0, c_white, 1);
        drawquestion = 0;
        timer++;
        
        if (timer == 1)
        {
            xloc = 256;
            yloc = 242;
            
            if (!i_ex(hurtmarker_su))
                hurtmarker_su = scr_board_marker(xloc + 0, yloc, 486, 0, depth - 5, 2);
            
            if (!i_ex(hurtmarker_kr))
                hurtmarker_kr = scr_board_marker(xloc + 48, yloc, 4778, 0, depth - 5, 2);
            
            if (!i_ex(hurtmarker_ra))
                hurtmarker_ra = scr_board_marker(xloc + 96, yloc, 2318, 0, depth - 5, 2);
            
            mus_fade(global.currentsong[1], 60);
            instance_destroy(questionwriter);
        }
        
        var hSpace = 22;
        var _rate = 8;
        var _starttime = 24;
        var xloc = 200;
        var _so = 8465906;
        var _sx = _so;
        var _ko = 12566278;
        var _kx = _ko;
        var _ro = 7328275;
        var _rx = _ro;
        draw_sprite_ext(spr_whitepx, 0, 0, 168, 640, 22, 0, c_white, 1);
        
        if (timer >= (_starttime + (_rate * 0)))
            draw_sprite_ext(spr_quiz_answer_cursor, 18 - su_answer[0], xloc + (hSpace * 0), 170, 2, 2, 0, su_answer[0] ? _so : _sx, 1);
        
        if (timer >= (_starttime + (_rate * 1)))
            draw_sprite_ext(spr_quiz_answer_cursor, 18 - kr_answer[0], xloc + (hSpace * 1), 170, 2, 2, 0, kr_answer[0] ? _ko : _kx, 1);
        
        if (timer >= (_starttime + (_rate * 2)))
            draw_sprite_ext(spr_quiz_answer_cursor, 18 - ra_answer[0], xloc + (hSpace * 2), 170, 2, 2, 0, ra_answer[0] ? _ro : _rx, 1);
        
        draw_sprite_ext(spr_quiz_answer_cursor, 19, xloc + (hSpace * 3), 170, 2, 2, 0, gameshowblue, 1);
        
        if (timer >= (_starttime + (_rate * 3)))
            draw_sprite_ext(spr_quiz_answer_cursor, 18 - su_answer[1], xloc + (hSpace * 4), 170, 2, 2, 0, su_answer[1] ? _so : _sx, 1);
        
        if (timer >= (_starttime + (_rate * 4)))
            draw_sprite_ext(spr_quiz_answer_cursor, 18 - kr_answer[1], xloc + (hSpace * 5), 170, 2, 2, 0, kr_answer[1] ? _ko : _kx, 1);
        
        if (timer >= (_starttime + (_rate * 5)))
            draw_sprite_ext(spr_quiz_answer_cursor, 18 - ra_answer[1], xloc + (hSpace * 6), 170, 2, 2, 0, ra_answer[1] ? _ro : _rx, 1);
        
        draw_sprite_ext(spr_quiz_answer_cursor, 19, xloc + (hSpace * 7), 170, 2, 2, 0, gameshowblue, 1);
        
        if (timer >= (_starttime + (_rate * 6)))
            draw_sprite_ext(spr_quiz_answer_cursor, 18 - su_answer[2], xloc + (hSpace * 8), 170, 2, 2, 0, su_answer[2] ? _so : _sx, 1);
        
        if (timer >= (_starttime + (_rate * 7)))
            draw_sprite_ext(spr_quiz_answer_cursor, 18 - kr_answer[2], xloc + (hSpace * 9), 170, 2, 2, 0, kr_answer[2] ? _ko : _kx, 1);
        
        if (timer >= (_starttime + (_rate * 8)))
            draw_sprite_ext(spr_quiz_answer_cursor, 18 - ra_answer[2], xloc + (hSpace * 10), 170, 2, 2, 0, ra_answer[2] ? _ro : _rx, 1);
        
        if (timer == (_starttime + (_rate * 0)))
        {
            if (su_answer[0] == 0)
                snd_play(snd_hurt1);
            else
                snd_play(snd_coin);
        }
        
        if (timer == (_starttime + (_rate * 1)))
        {
            if (kr_answer[0] == 0)
                snd_play(snd_hurt1);
            else
                snd_play(snd_coin);
        }
        
        if (timer == (_starttime + (_rate * 2)))
        {
            if (ra_answer[0] == 0)
                snd_play(snd_hurt1);
            else
                snd_play(snd_coin);
        }
        
        if (timer == (_starttime + (_rate * 3)))
        {
            if (su_answer[1] == 0)
                snd_play(snd_hurt1);
            else
                snd_play(snd_coin);
        }
        
        if (timer == (_starttime + (_rate * 4)))
        {
            if (kr_answer[1] == 0)
                snd_play(snd_hurt1);
            else
                snd_play(snd_coin);
        }
        
        if (timer == (_starttime + (_rate * 5)))
        {
            if (ra_answer[1] == 0)
                snd_play(snd_hurt1);
            else
                snd_play(snd_coin);
        }
        
        if (timer == (_starttime + (_rate * 6)))
        {
            if (su_answer[2] == 0)
                snd_play(snd_hurt1);
            else
                snd_play(snd_coin);
        }
        
        if (timer == (_starttime + (_rate * 7)))
        {
            if (kr_answer[2] == 0)
                snd_play(snd_hurt1);
            else
                snd_play(snd_coin);
        }
        
        if (timer == (_starttime + (_rate * 8)))
        {
            if (ra_answer[2] == 0)
                snd_play(snd_hurt1);
            else
                snd_play(snd_coin);
        }
        
        var resultstime = _starttime + (_rate * 9);
        
        if (timer == 1)
        {
            mus_fade(global.currentsong[1], 30);
            correctAnswers = 0;
            
            for (var i = 0; i < quiz_length; i++)
            {
                result_krcount += kr_answer[i];
                result_racount += ra_answer[i];
                result_sucount += su_answer[i];
            }
            
            correctAnswers = result_krcount + result_racount + result_sucount;
            global.flag[1019] = correctAnswers;
            bonus_total = 0;
            
            if (correctAnswers < 4)
                bonus_total = -1;
            else if (correctAnswers == 4)
                bonus_total = 0;
            else if (correctAnswers == 5)
                bonus_total = 25;
            else
                bonus_total = correctAnswers * 25;
            
            if (correctAnswers == (quiz_length * 3))
            {
                bonus_total = 300;
                perfect = true;
            }
            
            if (bonus_total == -1)
            {
                if (result_krcount == 0)
                    hurt_kr = true;
                
                if (result_racount == 0)
                    hurt_ra = true;
                
                if (result_sucount == 0)
                    hurt_su = true;
                
                if (!hurt_kr && !hurt_ra && !hurt_su)
                    bonus_total = 0;
            }
        }
        
        var resultsdelay = 5 + resultstime;
        var resultsrate = 10;
        var xxloc = 320;
        draw_set_halign(fa_center);
        
        if (timer > (resultsdelay + (resultsrate * 0)))
        {
            draw_text(xxloc, 198, bonusstring);
            var _width = 80;
            draw_sprite_ext(spr_whitepx, 0, xxloc - (_width / 2), /*214*/217, _width - 2, 2, 0, c_white, 1);
        }
        
        if (timer == (resultsdelay + (resultsrate * 0)))
            snd_play(snd_drumroll);
        
        if (timer > (resultsdelay + (resultsrate * 3)))
        {
            var finalbonusString = "+" + string(bonus_total);
            
            if (bonus_total == -1)
                finalbonusString = painstring;
            
            draw_text(xxloc, 218, finalbonusString);
        }
        
        xloc = 256;
        yloc = 242;
        
        if (timer == (resultsdelay + (resultsrate * 5)))
        {
            if (hurt_su == true)
            {
                scr_board_marker(xloc + 0 + 16, (yloc + 32) - 4, 1811, 1, depth - 4, 2, 1);
                scr_shakeobj(hurtmarker_su);
                hurtmarker_su.sprite_index = spr_board_susie_hurt;
                snd_play(snd_board_playerhurt);
                
                with (obj_mainchara_board)
                {
                    if (name == "susie")
                    {
                        myhealth -= 2;
                        
                        if (myhealth < 1)
                            myhealth = 1;
                        
                        with (obj_board_healthbar)
                        {
                            if (target == other.id)
                            {
                                scr_shakeobj();
                                scr_delay_var("mycolor", mycolor, 2);
                                mycolor = c_red;
                            }
                        }
                    }
                }
            }
            else
            {
                timer += resultsrate;
            }
        }
        
        if (timer == (resultsdelay + (resultsrate * 6)))
        {
            if (hurt_kr == true)
            {
                scr_board_marker(xloc + 48 + 16, (yloc + 32) - 4, 1811, 1, depth - 4, 2, 1);
                scr_shakeobj(hurtmarker_kr);
                hurtmarker_kr.sprite_index = spr_board_kris_hurt;
                snd_play(snd_board_playerhurt);
                
                with (obj_mainchara_board)
                {
                    if (name == "kris")
                    {
                        myhealth -= 2;
                        
                        if (myhealth < 1)
                            myhealth = 1;
                        
                        with (obj_board_healthbar)
                        {
                            if (target == other.id)
                            {
                                scr_shakeobj();
                                scr_delay_var("mycolor", mycolor, 2);
                                mycolor = c_red;
                            }
                        }
                    }
                }
            }
            else
            {
                timer += resultsrate;
            }
        }
        
        if (timer == (resultsdelay + (resultsrate * 7)))
        {
            if (hurt_ra == true)
            {
                scr_board_marker(xloc + 96 + 16, (yloc + 32) - 4, 1811, 1, depth - 4, 2, 1);
                scr_shakeobj(hurtmarker_ra);
                hurtmarker_ra.sprite_index = spr_board_ralsei_hurt;
                snd_play(snd_board_playerhurt);
                
                with (obj_mainchara_board)
                {
                    if (name == "ralsei")
                    {
                        myhealth -= 2;
                        
                        if (myhealth < 1)
                            myhealth = 1;
                        
                        with (obj_board_healthbar)
                        {
                            if (target == other.id)
                            {
                                scr_shakeobj();
                                scr_delay_var("mycolor", mycolor, 2);
                                mycolor = c_red;
                            }
                        }
                    }
                }
            }
            else
            {
                timer += resultsrate;
            }
        }
        
        draw_set_halign(fa_left);
        var finalresultstime = resultsdelay + (resultsrate * 9);
        
        if (timer == (resultsdelay + (resultsrate * 3)))
        {
            var _start_depth = quizzler.bg.depth;
            
            if (bonus_total > 0)
            {
                snd_play(snd_cymbal);
                var confetti_amount = correctAnswers;
                
                if (perfect)
                    confetti_amount += 10;
                
                var _popper = scr_confetti(camerax() - 10, cameray() + 440, 20, confetti_amount * 3);
                _popper.topdrop = 1;
                _popper.maxDepth = _start_depth - 10;
                _popper.start_depth = _start_depth;
                _popper = scr_confetti(camerax() + 640 + 10, cameray() + 440, 160, confetti_amount * 3);
                _popper.topdrop = 1;
                _popper.maxDepth = _start_depth - 10;
                _popper.start_depth = _start_depth;
            }
            else
            {
                snd_play(snd_error);
                var _popper;
                
                if (choose(0, 1))
                    _popper = scr_confetti(camerax() - 10, cameray() + 400, 20, 1);
                else
                    _popper = scr_confetti(camerax() + 640 + 10, cameray() + 400, 160, 1);
                
                _popper.topdrop = 1;
                _popper.maxDepth = _start_depth - 10;
                _popper.start_depth = _start_depth;
            }
        }
        
        if (timer > finalresultstime)
        {
            total_correct = scorrect + kcorrect + rcorrect;
            result_string = result_notbad;
            
            if (bonus_total > 25)
                result_string = result_decent;
            
            if (bonus_total == 25)
                result_string = result_notbad;
            
            if (bonus_total == 0)
                result_string = result_notgreat;
            
            if (bonus_total == -1)
                result_string = (correctAnswers == 0) ? result_worst : result_terrible;
            
            if (perfect)
                result_string = result_perfect;
            
            if (timer >= 75 && (timer % 30) >= 15)
            {
                draw_set_font(scr_84_get_font("8bit"));
                draw_set_halign(fa_center);
                draw_text(320, 282, result_string);
                draw_set_halign(fa_left);
            }
        }
        
        if (timer == finalresultstime)
        {
            if (bonus_total > 0)
                scr_board_score(bonus_total);
            
            snd_free_all();
            
            if (bonus_total > 0)
            {
                global.currentsong[0] = snd_init("baci_perugina.ogg");
            }
            else
            {
                global.currentsong[0] = snd_init("tv_results_screen.ogg");
                
                if (i_ex(grandaddy))
                    grandaddy.completed = false;
            }
            
            global.currentsong[1] = mus_loop(global.currentsong[0]);
        }
        
        if (timer == (finalresultstime + 120) || (timer > (finalresultstime + 10) && button1_p() && resultsskip == 0))
        {
            resultsskip = 1;
            timer = finalresultstime + 120;
            quizzler.con++;
        }
        
        if (timer == (finalresultstime + 130))
        {
            timer = 0;
            con = 8;
        }
        
        draw_set_halign(fa_left);
    }
    
    if ((con >= 3 && con <= 6) || timer_delay > 0)
    {
        if (con == 3 || con == 4 || timer_delay > 0)
        {
            draw_set_alpha(1);
            
            if (countdown <= 75)
                draw_set_color(c_red);
            else if (countdown <= 150)
                draw_set_color(c_yellow);
            else
                draw_set_color(c_white);
            
            var cx = camerax();
            var cy = cameray();
            var _barx = 160;
            ossafe_fill_rectangle(cx + _barx, cy + 300, cx + _barx + (round((countdown / timelimit) * 173) * 2), cy + 320, false);
            draw_sprite_ext(spr_quiz_bottomtimebar, 1, camerax() + _barx, cameray() + 300, 2, 2, 0, gameshowblue, 1);
            draw_sprite_ext(spr_quiz_bottomtimebar, 0, camerax() + _barx, cameray() + 300, 2, 2, 0, c_white, 1);
            var clockx = 132;
            var clocky = (cameray() + 300) - 10;
            var _clock_time = countdown;
            
            if (timer_delay > 0)
            {
                var _clockease = scr_ease_out(1 - clamp01(timer_delay / 20), 4);
                clockx = lerp(280, 132, _clockease);
                clocky = cameray() + lerp(190, 290, _clockease);
                
                if (timer_delay <= 15)
                    _clock_time = 0;
                else
                    _clock_time = (1 - ((timer_delay - 15) / 15)) * timelimit;
                
                timer_delay--;
            }
            
            var bouncer = round(abs(sin(_clock_time / 4) * 2)) * 2;
            
            if (timelimit < 200)
                bouncer = round(abs(sin(_clock_time / 2) * 2)) * 2;
            
            draw_sprite_ext(spr_whitepx, 0, clockx + 10, (clocky - 10) + bouncer + 4, 8, 2, 0, c_white, 1);
            draw_sprite_ext(spr_quiz_hud_timer, 28 - ((_clock_time / timelimit) * 28), clockx, clocky, 2, 2, 0, c_white, 1);
            
            if (paused)
                draw_sprite_ext(spr_quiz_hud_timer_pause, 0, clockx, clocky, 2, 2, 0, c_white, 1);
        }
        
        if (con >= 3 && con <= 6 && timer_delay <= 0)
        {
            draw_set_blend_mode(bm_normal);
            var _coordOffset = 0;
            var _iconyoff = 0;
            
            if (global.lang == "ja")
                _iconyoff = 4;
            
            draw_set_blend_mode((paused || con >= 4 || myanswer >= 0) ? bm_add : bm_normal);
            draw_sprite_ext(spr_quiz_selectionicons, 0, 200, 190 + (menucoord[menu] * 26) + _iconyoff, 2, 2, 0, c_white, 1);
            
            if (menucoord[menu] == susiecoord)
                _coordOffset = -20;
            
            draw_set_blend_mode(ssel ? bm_add : bm_normal);
            draw_sprite_ext(spr_quiz_selectionicons, 1, 200 + _coordOffset, 190 + (susiecoord * 26) + _iconyoff, 2, 2, 0, c_white, 1);
            _coordOffset = 0;
            
            if (menucoord[menu] == ralseicoord)
                _coordOffset = -20;
            
            if (ralseicoord == susiecoord)
                _coordOffset += -20;
            
            draw_set_blend_mode(rsel ? bm_add : bm_normal);
            draw_sprite_ext(spr_quiz_selectionicons, 2, 200 + _coordOffset, 190 + (ralseicoord * 26) + _iconyoff, 2, 2, 0, c_white, 1);
            draw_set_blend_mode(bm_normal);
            
            if (subcon >= 1)
                draw_sprite_ext(spr_quiz_answer_cursor, (rsel && rresult) ? 0 : 1, 200 + _coordOffset, 190 + (ralseicoord * 26) + _iconyoff, 2, 2, 0, c_white, 1);
            
            if (menucoord[menu] == susiecoord)
                _coordOffset = -20;
            else
                _coordOffset = 0;
            
            if (subcon >= 2)
                draw_sprite_ext(spr_quiz_answer_cursor, (ssel && sresult) ? 0 : 1, 200 + _coordOffset, 190 + (susiecoord * 26) + _iconyoff, 2, 2, 0, c_white, 1);
            
            if (subcon >= 3)
                draw_sprite_ext(spr_quiz_answer_cursor, (myanswer > -1 && correct) ? 0 : 1, 200, 190 + (menucoord[menu] * 26) + _iconyoff, 2, 2, 0, c_white, 1);
        }
        
        if (con == 5 && timer <= 72)
        {
            flashtimer += 1;
            
            if (flashtimer >= 24)
                flashtimer = 0;
        }
        
        if (menu == 0)
        {
            draw_set_font(scr_84_get_font("8bit_mixed"));
            var _xscale = 1;
            var _yscale = 1;
            
            for (var i = 0; i < 4; i += 1)
            {
                _xscale = 1;
                _yscale = 1;
                var _answeroption;
                
                if (string_char_at(answeroption[i], 1) == "~")
                {
                    if (string_char_at(answeroption[i], 2) == "~")
                    {
                        _yscale = 0.5;
                        _answeroption = substr(answeroption[i], 3);
                    }
                    else
                    {
                        _answeroption = substr(answeroption[i], 2);
                    }
                    
                    _xscale = 0.5;
                }
                else
                {
                    _answeroption = answeroption[i];
                }
                
                draw_set_color(c_white);
                
                if (con == 5)
                {
                    if (i == myanswer || (rsel && i == ralseicoord) || (ssel && i == susiecoord))
                    {
                        if (correctanswer == 4)
                            draw_set_color(c_yellow);
                        else
                            draw_set_color(c_red);
                    }
                    
                    if (quizid == "whattime")
                    {
                        if (i != 3)
                            draw_set_color(c_yellow);
                    }
                    else if (quizid == "ralseiplush")
                    {
                        if (i == 0 || i == 3)
                            draw_set_color(c_yellow);
                    }
                    else if (i == correctanswer)
                    {
                        draw_set_color(c_yellow);
                    }
                    
                    if (flashtimer < 12)
                        draw_text_transformed(224, 192 + (i * 26), string_hash_to_newline(_answeroption), _xscale, _yscale, 0);
                }
                else
                {
                    draw_text_transformed(224, 192 + (i * 26), string_hash_to_newline(_answeroption), _xscale, _yscale, 0);
                }
            }
        }
    }
    
    if (i_ex(questionwriter))
        draw_sprite_ext(spr_quiz_questionbox, 0, camerax() + board_tilex(0) + 2, cameray() + board_tiley(0) + 2, 2, 2, 0, c_white, 1);
    
    if (sprite != -4 && con >= 2)
    {
        if (sprite_timer > 0)
            sprite_timer--;
        
        if (quizid == "cable")
        {
            draw_sprite_ext(sprite, (con >= 3) ? 1 : 0, camerax() + board_tilex(0) + spritex, cameray() + board_tiley(0) + spritey, 2, 2, 0, c_white, 1);
        }
        else if (quizid == "pippins")
        {
            draw_sprite_ext(sprite, timer / 2, camerax() + board_tilex(0) + spritex, cameray() + board_tiley(0) + spritey, 2, 2, 0, c_white, 1);
        }
        else if (quizid == "button")
        {
            draw_set_font(fnt_8bit);
            var powerstring = stringsetloc("OFF", "obj_quizsequence_slash_Draw_0_gml_503_0");
            draw_set_halign(fa_right);
            var xloc = camerax() + 336;
            yloc = cameray() + 138;
            var bgcol = 2237064;
            var swid = scr_even(string_width(powerstring));
            var shei = scr_even(string_height(powerstring));
            var bord = 8;
            draw_sprite_ext(spr_pxwhite, 0, xloc - swid - bord, yloc - 2, swid + bord + 4, shei, 0, bgcol, 1);
            draw_set_color(#FFE42C);
            draw_text(xloc, yloc, powerstring);
            draw_set_halign(fa_left);
            draw_set_color(c_white);
            draw_sprite_ext(sprite, timer / 2, camerax() + board_tilex(0) + spritex, cameray() + board_tiley(0) + spritey, 2, 2, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(sprite, 0, camerax() + board_tilex(0) + spritex + sprite_timer, cameray() + board_tiley(0) + spritey, 2, 2, 0, c_white, 1);
        }
    }
    
    if (i_ex(extra_obj) && quizid == "thrash" && con >= 2)
    {
        with (extra_obj)
            event_user(0);
    }
    
    with (questionwriter)
        event_user(0);
    
    if (paused)
    {
        draw_set_color(c_black);
        draw_set_alpha(0.5);
        ossafe_fill_rectangle(camerax(), cameray(), camerax() + 600, cameray() + 400, false);
        draw_set_color(c_white);
        draw_set_alpha(1);
    }
}

var yloc = board_tiley(3);
var space = 10;
