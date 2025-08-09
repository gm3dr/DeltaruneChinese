function scr_charbox()
{
    for (c = 0; c < 4; c += 1)
    {
        if (havechar[c] == 1)
        {
            if (c == 0)
                charcolor = hpcolor[0];
            
            if (c == 1)
                charcolor = hpcolor[1];
            
            if (c == 2)
                charcolor = hpcolor[2];
            
            if (c == 3)
                charcolor = hpcolor[3];
            
            gc = global.charturn;
            xchunk = 0;
            
            if (charpos[c] == 0 && chartotal == 3)
                xchunk = 0;
            
            if (charpos[c] == 1 && chartotal == 3)
                xchunk = 213;
            
            if (charpos[c] == 2 && chartotal == 3)
                xchunk = 426;
            
            if (charpos[c] == 0 && chartotal == 2)
                xchunk = 108;
            
            if (charpos[c] == 1 && chartotal == 2)
                xchunk = 322;
            
            if (charpos[c] == 0 && chartotal == 1)
                xchunk = 213;
            
            if (gc == charpos[c])
            {
                if (rouxlsgridenabled == false)
                {
                    if (mmy[c] > -32)
                        mmy[c] -= 2;
                    
                    if (mmy[c] > -24)
                        mmy[c] -= 4;
                    
                    if (mmy[c] > -16)
                        mmy[c] -= 6;
                    
                    if (mmy[c] > -8)
                        mmy[c] -= 8;
                    
                    if (mmy[c] < -32)
                        mmy[c] = -64;
                }
                else
                {
                    if (mmy[c] > -170)
                        mmy[c] -= 2;
                    
                    if (mmy[c] > -160)
                        mmy[c] -= 4;
                    
                    if (mmy[c] > -150)
                        mmy[c] -= 6;
                    
                    if (mmy[c] > -140)
                        mmy[c] -= 12;
                    
                    if (mmy[c] > -32)
                        mmy[c] -= 32;
                }
            }
            else if (rouxlsgridenabled == false)
            {
                if (mmy[c] < -14)
                    mmy[c] += 15;
                else
                    mmy[c] = 0;
            }
            else
            {
                if (mmy[c] < -14)
                    mmy[c] += 32;
                
                if (mmy[c] > -14)
                    mmy[c] = 0;
            }
            
            if (rouxlsgridenabled && mmy[c] != 0)
            {
                draw_set_color(c_black);
                draw_rectangle(xx + xchunk + 2, (480 - bp - 1) + yy + mmy[c], xx + xchunk + 210, (480 - bp) + yy + 0 + 33, false);
            }
            
            if (gc == charpos[c])
            {
                if (global.myfight == 0)
                {
                    if (rouxlsgridenabled == false)
                    {
                        scr_selectionmatrix(xx + xchunk, (480 - bp) + yy);
                    }
                    else
                    {
                        draw_rectangle(xx + xchunk, (480 - bp - 3) + yy + mmy[c], xx + xchunk + 212, 480 - bp, false);
                        draw_set_color(c_black);
                        draw_rectangle(xx + xchunk + 2, (480 - bp - 1) + yy + mmy[c], xx + xchunk + 210, 480 - bp, false);
                        slmxx = xx + xchunk;
                        slmyy = (480 - bp) + yy;
                        s_siner += 2;
                        draw_set_color(charcolor);
                        draw_rectangle(slmxx, (480 - bp) + 40 + yy + mmy[c], slmxx + 212, (480 - bp) + 43 + yy + mmy[c], false);
                        
                        for (i = 0; i < 12; i += 1)
                        {
                            myxx = s_siner + (i * (10 * pi));
                            draw_set_alpha(sin(myxx / 60));
                            draw_line_width(slmxx, (slmyy - 3) + (mmy[c] * 0.75), slmxx, slmyy + 33, 2);
                            draw_line_width(slmxx + 210 + 1, (slmyy - 3) + (mmy[c] * 0.75), slmxx + 210 + 1, slmyy + 33, 2);
                            
                            if (mmy[c] < -140)
                            {
                                if (cos(myxx / 60) < 0)
                                {
                                    draw_set_alpha(lerp(0, sin(myxx / 60), (abs(mmy[c]) - 140) / 30));
                                    draw_line_width((slmxx - (sin(myxx / 60) * 30)) + 30, slmyy + (mmy[c] * 0.75), (slmxx - (sin(myxx / 60) * 30)) + 30, slmyy + 33, 2);
                                    draw_line_width((slmxx + 210 + (sin(myxx / 60) * 30)) - 30, slmyy + (mmy[c] * 0.75), (slmxx + 210 + (sin(myxx / 60) * 30)) - 30, slmyy + 33, 2);
                                }
                            }
                        }
                        
                        draw_set_alpha(1);
                    }
                }
            }
            
            btc[0] = 0;
            btc[1] = 0;
            btc[2] = 0;
            btc[3] = 0;
            btc[4] = 0;
            
            if (i_ex(obj_rouxls_ch3_enemy))
            {
                var rep = 5;
                
                repeat (20)
                {
                    btc[rep] = 0;
                    rep++;
                }
            }
            
            if (gc == charpos[c])
                btc[global.bmenucoord[0][global.charturn] + (rouxlsbuttoncount_y * 5)] = 1;
            
            if (global.fighting == 1)
            {
                spare_glow = 0;
                
                for (sglowi = 0; sglowi < 3; sglowi += 1)
                {
                    if (global.monster[sglowi] == 1 && global.mercymod[sglowi] >= 100)
                        spare_glow = 1;
                }
                
                pacify_glow = 0;
                
                if (c == 2 || c == 3)
                {
                    for (sglowi = 0; sglowi < 3; sglowi += 1)
                    {
                        var tensionamount = 40;
                        
                        if (c == 3)
                            tensionamount = 80;
                        
                        if (global.monster[sglowi] == 1 && global.monsterstatus[sglowi] == 1 && global.tension >= tensionamount)
                            pacify_glow = 1;
                        
                        if (global.encounterno == 31)
                            pacify_glow = 0;
                    }
                }
                
                var icon_offset = 5;
                
                if (obj_battlecontroller.oopsallacts == 1 && (i_ex(obj_rouxls_ch3_enemy) || i_ex(obj_tenna_board4_enemy)))
                {
                    var _rouxls_sprite = scr_84_get_sprite("spr_btrouxls")
                    var _spadesprite = scr_84_get_sprite("spr_btspade");
                    var _heartsprite = 3110;
                    var _actsprite = scr_84_get_sprite("spr_btact");
                    
                    if (global.lang == "ja")
                        _actsprite = 1245;
                    
                    if (dogcon == 1)
                        _spadesprite = 2836;
                    
                    if (dogcon == 2)
                    {
                        _spadesprite = 2836;
                        _heartsprite = 2836;
                        _actsprite = 2836;
                    }
                    
                    if (rouxlserrorcon == 1 && dogcon < 1)
                    {
                        rouxlstelegraphtimer++;
                        
                        if (global.lang == "ja")
                        {
                            if (rouxlstelegraphtimer >= 1 && rouxlstelegraphtimer <= 4)
                                _rouxls_sprite = 4093;
                            
                            if (rouxlstelegraphtimer >= 5 && rouxlstelegraphtimer <= 8)
                                _rouxls_sprite = 3332;
                        }
                        else
                        {
                            if (rouxlstelegraphtimer >= 1 && rouxlstelegraphtimer <= 4)
                                _rouxls_sprite = 3428;
                            
                            if (rouxlstelegraphtimer >= 5 && rouxlstelegraphtimer <= 8)
                                _rouxls_sprite = 1915;
                        }
                        
                        if (rouxlstelegraphtimer == 8)
                            rouxlstelegraphtimer = 0;
                    }
                    
                    if (rouxlstelegraphcon == 1 && dogcon < 1)
                    {
                        if (!audio_is_playing(snd_bombfall))
                            snd_play(snd_bombfall);
                        
                        rouxlstelegraphtimer++;
                        
                        if (rouxlstelegraphtimer >= 1 && rouxlstelegraphtimer <= 4)
                            _rouxls_sprite = 4432;
                        
                        if (rouxlstelegraphtimer >= 5 && rouxlstelegraphtimer <= 8)
                            _rouxls_sprite = 4054;
                        
                        if (rouxlstelegraphtimer == 8)
                            rouxlstelegraphtimer = 0;
                    }
                    
                    if (spadetelegraphcon == 1 && dogcon < 1)
                    {
                        spadetelegraphtimer++;
                        
                        if (spadetelegraphtimer >= 1 && spadetelegraphtimer <= 4)
                            _spadesprite = 4024;
                        
                        if (spadetelegraphtimer >= 5 && spadetelegraphtimer <= 8)
                            _spadesprite = 4054;
                        
                        if (spadetelegraphtimer == 8)
                            spadetelegraphtimer = 0;
                    }
                    
                    if (spadesuccesscon == 1 && heartsuccesscon == 0)
                    {
                        spadetelegraphtimer++;
                        
                        if (spadetelegraphtimer >= 1 && spadetelegraphtimer <= 4)
                        {
                            if (spadefail == true)
                            {
                                _actsprite = 3939;
                                
                                if (global.lang == "ja")
                                    _actsprite = 898;
                            }
                            else
                            {
                                _spadesprite = 2247;
                                
                                if (dogcon == 1)
                                {
                                    _spadesprite = 2359;
                                    _actsprite = 2359;
                                }
                                
                                if (dogcon == 2)
                                {
                                    _spadesprite = 2359;
                                    _actsprite = 2359;
                                }
                            }
                        }
                        
                        if (spadetelegraphtimer >= 5 && spadetelegraphtimer <= 8)
                        {
                            if (spadefail == true)
                            {
                                _actsprite = 1396;
                                
                                if (global.lang == "ja")
                                    _actsprite = 1977;
                            }
                            else
                            {
                                _spadesprite = 798;
                                
                                if (dogcon == 1)
                                {
                                    _spadesprite = 4948;
                                    _actsprite = 4948;
                                }
                                
                                if (dogcon == 2)
                                {
                                    _spadesprite = 4948;
                                    _actsprite = 4948;
                                }
                            }
                        }
                        
                        if (spadetelegraphtimer == 8)
                            spadetelegraphtimer = 0;
                    }
                    
                    if (heartsuccesscon == 1)
                    {
                        heartsuccesstimer++;
                        
                        if (heartsuccesstimer >= 1 && heartsuccesstimer <= 4)
                            _heartsprite = 4860;
                        
                        if (heartsuccesstimer >= 5 && heartsuccesstimer <= 8)
                            _heartsprite = 1671;
                        
                        if (heartsuccesstimer == 8)
                            heartsuccesstimer = 0;
                    }
                    
                    if (i_ex(obj_rouxls_ch3_enemy) && obj_rouxls_ch3_enemy.intro == 2)
                    {
                        obj_rouxls_ch3_enemy.introtimer++;
                        
                        if (obj_rouxls_ch3_enemy.introtimer == 1)
                            snd_play(snd_petrify);
                        
                        var alpha;
                        
                        if (obj_rouxls_ch3_enemy.introtimer < 30)
                        {
                            draw_sprite(scr_84_get_sprite("spr_btfight"), 0, xx + xchunk + 15 + icon_offset, (485 - bp) + yy);
                            
                            if (global.lang == "ja")
                                draw_sprite(spr_ja_btact_tenna, 0, xx + xchunk + 50 + icon_offset, (485 - bp) + yy);
                            else
                                draw_sprite(scr_84_get_sprite("spr_btact"), 0, xx + xchunk + 50 + icon_offset, (485 - bp) + yy);
                            
                            draw_sprite(scr_84_get_sprite("spr_bttech"), 0, xx + xchunk + 85 + icon_offset, (485 - bp) + yy);
                            draw_sprite(scr_84_get_sprite("spr_btitem"), 0, xx + xchunk + 120 + icon_offset, (485 - bp) + yy);
                            draw_sprite(scr_84_get_sprite("spr_btspare"), 0, xx + xchunk + 155 + icon_offset, (485 - bp) + yy);
                            alpha = lerp(0, 1.2, obj_rouxls_ch3_enemy.introtimer / 29);
                            
                            if (obj_rouxls_ch3_enemy.introtimer < 0)
                                alpha = 0;
                        }
                        
                        if (obj_rouxls_ch3_enemy.introtimer >= 30)
                        {
                            if (global.lang == "ja")
                            {
                                draw_sprite(spr_ja_btact_tenna, 0, xx + xchunk + 15 + icon_offset, (485 - bp) + yy);
                                draw_sprite(spr_ja_btact_tenna, 0, xx + xchunk + 50 + icon_offset, (485 - bp) + yy);
                                draw_sprite(spr_ja_btact_tenna, 0, xx + xchunk + 85 + icon_offset, (485 - bp) + yy);
                                draw_sprite(spr_ja_btact_tenna, 0, xx + xchunk + 120 + icon_offset, (485 - bp) + yy);
                                draw_sprite(spr_ja_btact_tenna, 0, xx + xchunk + 155 + icon_offset, (485 - bp) + yy);
                            }
                            else
                            {
                                draw_sprite(scr_84_get_sprite("spr_btact"), 0, xx + xchunk + 15 + icon_offset, (485 - bp) + yy);
                                draw_sprite(scr_84_get_sprite("spr_btact"), 0, xx + xchunk + 50 + icon_offset, (485 - bp) + yy);
                                draw_sprite(scr_84_get_sprite("spr_btact"), 0, xx + xchunk + 85 + icon_offset, (485 - bp) + yy);
                                draw_sprite(scr_84_get_sprite("spr_btact"), 0, xx + xchunk + 120 + icon_offset, (485 - bp) + yy);
                                draw_sprite(scr_84_get_sprite("spr_btact"), 0, xx + xchunk + 155 + icon_offset, (485 - bp) + yy);
                            }
                            
                            alpha = lerp(1, 0, (obj_rouxls_ch3_enemy.introtimer - 30) / 30);
                        }
                        
                        draw_sprite_ext(spr_btact_rouxls_white, 0, xx + xchunk + 15 + icon_offset, (485 - bp) + yy, 1, 1, 0, c_white, alpha);
                        draw_sprite_ext(spr_btact_rouxls_white, 0, xx + xchunk + 50 + icon_offset, (485 - bp) + yy, 1, 1, 0, c_white, alpha);
                        draw_sprite_ext(spr_btact_rouxls_white, 0, xx + xchunk + 85 + icon_offset, (485 - bp) + yy, 1, 1, 0, c_white, alpha);
                        draw_sprite_ext(spr_btact_rouxls_white, 0, xx + xchunk + 120 + icon_offset, (485 - bp) + yy, 1, 1, 0, c_white, alpha);
                        draw_sprite_ext(spr_btact_rouxls_white, 0, xx + xchunk + 155 + icon_offset, (485 - bp) + yy, 1, 1, 0, c_white, alpha);
                        
                        if (obj_rouxls_ch3_enemy.introtimer == 60)
                            obj_rouxls_ch3_enemy.intro = 3;
                    }
                    else if (i_ex(obj_tenna_board4_enemy) && obj_tenna_board4_enemy.intro == 1)
                    {
                        obj_tenna_board4_enemy.introtimer++;
                        
                        if (obj_tenna_board4_enemy.introtimer == 1)
                            snd_play(snd_petrify);
                        
                        var alpha;
                        
                        if (obj_tenna_board4_enemy.introtimer < 30)
                        {
                            draw_sprite(scr_84_get_sprite("spr_btfight"), 0, xx + xchunk + 15 + icon_offset, (485 - bp) + yy);
                            
                            if (global.lang == "ja")
                                draw_sprite(spr_ja_btact_tenna, 0, xx + xchunk + 50 + icon_offset, (485 - bp) + yy);
                            else
                                draw_sprite(scr_84_get_sprite("spr_btact"), 0, xx + xchunk + 50 + icon_offset, (485 - bp) + yy);
                            
                            draw_sprite(scr_84_get_sprite("spr_bttech"), 0, xx + xchunk + 85 + icon_offset, (485 - bp) + yy);
                            draw_sprite(scr_84_get_sprite("spr_btitem"), 0, xx + xchunk + 120 + icon_offset, (485 - bp) + yy);
                            draw_sprite(scr_84_get_sprite("spr_btspare"), 0, xx + xchunk + 155 + icon_offset, (485 - bp) + yy);
                            alpha = lerp(0, 1.2, obj_tenna_board4_enemy.introtimer / 29);
                            
                            if (obj_tenna_board4_enemy.introtimer < 0)
                                alpha = 0;
                        }
                        
                        if (obj_tenna_board4_enemy.introtimer >= 30)
                        {
                            if (global.lang == "ja")
                            {
                                draw_sprite(spr_ja_btact_tenna, 0, xx + xchunk + 15 + icon_offset, (485 - bp) + yy);
                                draw_sprite(spr_ja_btact_tenna, 0, xx + xchunk + 50 + icon_offset, (485 - bp) + yy);
                                draw_sprite(spr_ja_btact_tenna, 0, xx + xchunk + 85 + icon_offset, (485 - bp) + yy);
                                draw_sprite(spr_ja_btact_tenna, 0, xx + xchunk + 120 + icon_offset, (485 - bp) + yy);
                                draw_sprite(spr_ja_btact_tenna, 0, xx + xchunk + 155 + icon_offset, (485 - bp) + yy);
                            }
                            else
                            {
                                draw_sprite(scr_84_get_sprite("spr_btact"), 0, xx + xchunk + 15 + icon_offset, (485 - bp) + yy);
                                draw_sprite(scr_84_get_sprite("spr_btact"), 0, xx + xchunk + 50 + icon_offset, (485 - bp) + yy);
                                draw_sprite(scr_84_get_sprite("spr_btact"), 0, xx + xchunk + 85 + icon_offset, (485 - bp) + yy);
                                draw_sprite(scr_84_get_sprite("spr_btact"), 0, xx + xchunk + 120 + icon_offset, (485 - bp) + yy);
                                draw_sprite(scr_84_get_sprite("spr_btact"), 0, xx + xchunk + 155 + icon_offset, (485 - bp) + yy);
                            }
                            
                            alpha = lerp(1, 0, (obj_tenna_board4_enemy.introtimer - 30) / 30);
                            global.bmenucoord[0][0] = 2;
                            global.bmenucoord[0][1] = 2;
                            global.bmenucoord[0][2] = 2;
                        }
                        
                        draw_sprite_ext(spr_btact_rouxls_white, 0, xx + xchunk + 15 + icon_offset, (485 - bp) + yy, 1, 1, 0, c_white, alpha);
                        draw_sprite_ext(spr_btact_rouxls_white, 0, xx + xchunk + 50 + icon_offset, (485 - bp) + yy, 1, 1, 0, c_white, alpha);
                        draw_sprite_ext(spr_btact_rouxls_white, 0, xx + xchunk + 85 + icon_offset, (485 - bp) + yy, 1, 1, 0, c_white, alpha);
                        draw_sprite_ext(spr_btact_rouxls_white, 0, xx + xchunk + 120 + icon_offset, (485 - bp) + yy, 1, 1, 0, c_white, alpha);
                        draw_sprite_ext(spr_btact_rouxls_white, 0, xx + xchunk + 155 + icon_offset, (485 - bp) + yy, 1, 1, 0, c_white, alpha);
                    }
                    else
                    {
                        var y_extra = 0;
                        var rep = 1;
                        var _actsprite2 = _actsprite;
                        
                        if (rouxlsgridenabled == true)
                        {
                            y_extra = 0;
                            rep = 5;
                        }
                        
                        if (gc == charpos[c])
                        {
                            repeat (rep)
                            {
                                var __y2 = lerp(140, 0, abs(mmy[c] / 170));
                                var __y = (y_extra * 32) + (mmy[c] * 0.75) + __y2;
                                
                                if (rep == 1)
                                    __y += 32;
                                
                                if (__y > 0)
                                    __y = 0;
                                
                                if (y_extra != 4 && rouxlsgridenabled == true)
                                    _actsprite = 484;
                                
                                if (y_extra != 4 && rouxlsgridenabled == true && global.lang == "ja")
                                    _actsprite = 3819;
                                
                                if (rouxlsbuttoncount == (1 + (y_extra * 5)))
                                    draw_sprite(_rouxls_sprite, btc[0 + (y_extra * 5)], xx + xchunk + 15 + icon_offset, (485 - bp) + yy + __y);
                                else if (rouxlsbuttoncount2 == (1 + (y_extra * 5)))
                                    draw_sprite(_rouxls_sprite, btc[0 + (y_extra * 5)], xx + xchunk + 15 + icon_offset, (485 - bp) + yy + __y);
                                else if (spadebuttoncount == (1 + (y_extra * 5)))
                                    draw_sprite(_spadesprite, btc[0 + (y_extra * 5)], xx + xchunk + 15 + icon_offset, (485 - bp) + yy + __y);
                                else if (heartbuttoncount == (1 + (y_extra * 5)))
                                    draw_sprite(_heartsprite, btc[0 + (y_extra * 5)], xx + xchunk + 15 + icon_offset, (485 - bp) + yy + __y);
                                else
                                    draw_sprite(_actsprite, btc[0 + (y_extra * 5)], xx + xchunk + 15 + icon_offset, (485 - bp) + yy + __y);
                                
                                if (rouxlsbuttoncount == (2 + (y_extra * 5)))
                                    draw_sprite(_rouxls_sprite, btc[1 + (y_extra * 5)], xx + xchunk + 50 + icon_offset, (485 - bp) + yy + __y);
                                else if (rouxlsbuttoncount2 == (2 + (y_extra * 5)))
                                    draw_sprite(_rouxls_sprite, btc[1 + (y_extra * 5)], xx + xchunk + 50 + icon_offset, (485 - bp) + yy + __y);
                                else if (spadebuttoncount == (2 + (y_extra * 5)))
                                    draw_sprite(_spadesprite, btc[1 + (y_extra * 5)], xx + xchunk + 50 + icon_offset, (485 - bp) + yy + __y);
                                else if (heartbuttoncount == (2 + (y_extra * 5)))
                                    draw_sprite(_heartsprite, btc[1 + (y_extra * 5)], xx + xchunk + 50 + icon_offset, (485 - bp) + yy + __y);
                                else
                                    draw_sprite(_actsprite, btc[1 + (y_extra * 5)], xx + xchunk + 50 + icon_offset, (485 - bp) + yy + __y);
                                
                                if (rouxlsbuttoncount == (3 + (y_extra * 5)))
                                    draw_sprite(_rouxls_sprite, btc[2 + (y_extra * 5)], xx + xchunk + 85 + icon_offset, (485 - bp) + yy + __y);
                                else if (rouxlsbuttoncount2 == (3 + (y_extra * 5)))
                                    draw_sprite(_rouxls_sprite, btc[2 + (y_extra * 5)], xx + xchunk + 85 + icon_offset, (485 - bp) + yy + __y);
                                else if (spadebuttoncount == (3 + (y_extra * 5)))
                                    draw_sprite(_spadesprite, btc[2 + (y_extra * 5)], xx + xchunk + 85 + icon_offset, (485 - bp) + yy + __y);
                                else if (heartbuttoncount == (3 + (y_extra * 5)))
                                    draw_sprite(_heartsprite, btc[2 + (y_extra * 5)], xx + xchunk + 85 + icon_offset, (485 - bp) + yy + __y);
                                else
                                    draw_sprite(_actsprite, btc[2 + (y_extra * 5)], xx + xchunk + 85 + icon_offset, (485 - bp) + yy + __y);
                                
                                if (rouxlsbuttoncount == (4 + (y_extra * 5)))
                                    draw_sprite(_rouxls_sprite, btc[3 + (y_extra * 5)], xx + xchunk + 120 + icon_offset, (485 - bp) + yy + __y);
                                else if (rouxlsbuttoncount2 == (4 + (y_extra * 5)))
                                    draw_sprite(_rouxls_sprite, btc[3 + (y_extra * 5)], xx + xchunk + 120 + icon_offset, (485 - bp) + yy + __y);
                                else if (spadebuttoncount == (4 + (y_extra * 5)))
                                    draw_sprite(_spadesprite, btc[3 + (y_extra * 5)], xx + xchunk + 120 + icon_offset, (485 - bp) + yy + __y);
                                else if (heartbuttoncount == (4 + (y_extra * 5)))
                                    draw_sprite(_heartsprite, btc[3 + (y_extra * 5)], xx + xchunk + 120 + icon_offset, (485 - bp) + yy + __y);
                                else
                                    draw_sprite(_actsprite, btc[3 + (y_extra * 5)], xx + xchunk + 120 + icon_offset, (485 - bp) + yy + __y);
                                
                                if (rouxlsbuttoncount == (5 + (y_extra * 5)))
                                    draw_sprite(_rouxls_sprite, btc[4 + (y_extra * 5)], xx + xchunk + 155 + icon_offset, (485 - bp) + yy + __y);
                                else if (rouxlsbuttoncount2 == (5 + (y_extra * 5)))
                                    draw_sprite(_rouxls_sprite, btc[4 + (y_extra * 5)], xx + xchunk + 155 + icon_offset, (485 - bp) + yy + __y);
                                else if (spadebuttoncount == (5 + (y_extra * 5)))
                                    draw_sprite(_spadesprite, btc[4 + (y_extra * 5)], xx + xchunk + 155 + icon_offset, (485 - bp) + yy + __y);
                                else if (heartbuttoncount == (5 + (y_extra * 5)))
                                    draw_sprite(_heartsprite, btc[4 + (y_extra * 5)], xx + xchunk + 155 + icon_offset, (485 - bp) + yy + __y);
                                else
                                    draw_sprite(_actsprite, btc[4 + (y_extra * 5)], xx + xchunk + 155 + icon_offset, (485 - bp) + yy + __y);
                                
                                y_extra++;
                                _actsprite = _actsprite2;
                            }
                        }
                    }
                }
                else
                {
                    draw_sprite(scr_84_get_sprite("spr_btfight"), btc[0], xx + xchunk + 15 + icon_offset, (485 - bp) + yy);
                    
                    if (c == 0)
                        draw_sprite(scr_84_get_sprite("spr_btact"), btc[1], xx + xchunk + 50 + icon_offset, (485 - bp) + yy);
                    else if (disablesusieact == 1 && c == 1)
                        draw_sprite(spr_ja_bttech_grey, btc[1], xx + xchunk + 50 + icon_offset, (485 - bp) + yy);
                    else
                        draw_sprite(scr_84_get_sprite("spr_bttech"), btc[1], xx + xchunk + 50 + icon_offset, (485 - bp) + yy);
                    
                    draw_sprite(scr_84_get_sprite("spr_btitem"), btc[2], xx + xchunk + 85 + icon_offset, (485 - bp) + yy);
                    draw_sprite(scr_84_get_sprite("spr_btspare"), btc[3], xx + xchunk + 120 + icon_offset, (485 - bp) + yy);
                    draw_sprite(scr_84_get_sprite("spr_btdefend"), btc[4], xx + xchunk + 155 + icon_offset, (485 - bp) + yy);
                    
                    if (spare_glow == 1 && gc == charpos[c])
                        draw_sprite_ext(scr_84_get_sprite("spr_btspare"), 2, xx + xchunk + 120 + icon_offset, (485 - bp) + yy, 1, 1, 0, c_white, 0.4 + (sin(global.time / 6) * 0.4));
                    
                    if (pacify_glow == 1 && gc == charpos[c])
                        draw_sprite_ext(scr_84_get_sprite("spr_bttech"), 2, xx + xchunk + 50 + icon_offset, (485 - bp) + yy, 1, 1, 0, c_white, 0.4 + (sin(global.time / 6) * 0.4));
                }
            }
            
            if (gc == charpos[c])
                draw_set_color(charcolor);
            else
                draw_set_color(bcolor);
            
            if (global.charselect == charpos[c] || global.charselect == 3)
                draw_set_color(charcolor);
            
            if (rouxlsgridenabled == false)
            {
                draw_rectangle(xx + xchunk, (480 - bp - 3) + yy + mmy[c], xx + xchunk + 212, ((480 - bp) + yy) - 2, false);
                draw_set_color(c_black);
                draw_rectangle(xx + xchunk + 2, (480 - bp - 1) + yy + mmy[c], xx + xchunk + 210, (480 - bp) + yy + mmy[c] + 33, false);
            }
            else
            {
                draw_rectangle(xx + xchunk, (480 - bp - 3) + yy + mmy[c], xx + xchunk + 212, (480 - bp - 2) + yy + mmy[c], false);
                
                if (mmy[c] < -32)
                {
                    draw_rectangle(xx + xchunk, (480 - bp - 3) + yy + mmy[c], xx + xchunk + 1, bpoff + b_offset + 39 + mmy[c], false);
                    draw_rectangle(xx + xchunk + 211, (480 - bp - 3) + yy + mmy[c], xx + xchunk + 212, bpoff + b_offset + 39 + mmy[c], false);
                }
                
                draw_set_color(c_black);
                
                if (gc != charpos[c] && mmy[c] != 0)
                    draw_rectangle(xx + xchunk + 2, (480 - bp - 1) + yy + mmy[c], xx + xchunk + 210, (480 - bp) + yy + 0 + 33, false);
                else
                    draw_rectangle(xx + xchunk + 2, (480 - bp - 1) + yy + mmy[c], xx + xchunk + 210, (480 - bp) + yy + mmy[c] + 33, false);
            }
            
            b_offset = 480;
            
            if (global.fighting == 0)
                b_offset = 430;
            
            if (global.fighting == 1)
                b_offset = 336;
            
            if (c == 0)
            {
                draw_sprite(spr_headkris, global.faceaction[charpos[c]], xx + 13 + xchunk, bpoff + b_offset + mmy[c]);
                draw_sprite(scr_84_get_sprite("spr_bnamekris"), 0, xx + 51 + xchunk, bpoff + b_offset + 3 + mmy[c]);
            }
            
            if (c == 1)
            {
                draw_sprite(spr_headsusie, global.faceaction[charpos[c]], xx + 13 + xchunk, bpoff + b_offset + mmy[c]);
                draw_sprite(scr_84_get_sprite("spr_bnamesusie"), 0, xx + 51 + xchunk, bpoff + b_offset + 3 + mmy[c]);
            }
            
            if (c == 2)
            {
                draw_sprite(spr_headralsei, global.faceaction[charpos[c]], xx + 13 + xchunk, bpoff + b_offset + mmy[c]);
                draw_sprite(scr_84_get_sprite("spr_bnameralsei"), 0, xx + 51 + xchunk, bpoff + b_offset + 3 + mmy[c]);
            }
            
            if (c == 3)
            {
                draw_sprite(spr_headnoelle, global.faceaction[charpos[c]], xx + 13 + xchunk, bpoff + b_offset + mmy[c]);
                draw_sprite(scr_84_get_sprite("spr_bnamenoelle"), 0, xx + 51 + xchunk, bpoff + b_offset + 3 + mmy[c]);
            }
            
            draw_sprite(spr_hpname, 0, xx + 109 + xchunk, bpoff + b_offset + 11 + mmy[c]);
            draw_set_color(c_white);
            draw_set_font(global.hpfont);
            
            if ((global.hp[c + 1] / global.maxhp[c + 1]) <= 0.25)
                draw_set_color(c_yellow);
            
            if (global.hp[c + 1] <= 0)
                draw_set_color(c_red);
            
            draw_set_halign(fa_right);
            draw_text(xx + 160 + xchunk, ((bpoff + b_offset) - 2) + mmy[c], string_hash_to_newline(global.hp[c + 1]));
            draw_sprite(spr_hpslash, 0, xx + 159 + xchunk, ((bpoff + b_offset) - 4) + mmy[c]);
            draw_text(xx + 205 + xchunk, ((bpoff + b_offset) - 2) + mmy[c], string_hash_to_newline(global.maxhp[c + 1]));
            draw_set_halign(fa_left);
            draw_set_color(c_maroon);
            draw_rectangle(xx + 128 + xchunk, bpoff + b_offset + 11 + mmy[c], xx + 203 + xchunk, bpoff + b_offset + 19 + mmy[c], false);
            
            if (global.hp[c + 1] > 0 && global.maxhp[c + 1] > 0)
            {
                draw_set_color(charcolor);
                draw_rectangle(xx + 128 + xchunk, bpoff + b_offset + 11 + mmy[c], xx + xchunk + 128 + ceil((global.hp[c + 1] / global.maxhp[c + 1]) * 75), bpoff + b_offset + 19 + mmy[c], false);
            }
        }
    }
}
