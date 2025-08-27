if (global.chapter == 3)
{
    if (i_ex(obj_shadowman_sharpshoot_cursor) && obj_shadowman_sharpshoot_cursor.disablesbattleui == true)
        exit;
    
    if (instance_exists(obj_knight_enemy) && obj_knight_enemy.end_cutscene_version > 0)
        exit;
    
    if (i_ex(obj_actor_tenna) && obj_actor_tenna.threepartmode == 1 && i_ex(obj_lightemup_controller))
    {
    }
    else if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanityintro)
    {
    }
    else
    {
        if (i_ex(obj_susiezilla_gamecontroller))
            exit;
        
        if (i_ex(obj_chefs_game))
            exit;
        
        if (i_ex(obj_rhythmgame))
            exit;
        
        if (i_ex(obj_tenna_minigame_ui) && obj_tenna_minigame_ui.enabled == true)
            exit;
        
        if (i_ex(obj_shootout_controller) && i_ex(obj_tenna_enemy))
            exit;
        
        if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.con == 0 && sprite_exists(obj_tenna_zoom.screenshot))
            exit;
    }
    
    if (room == room_board_1 || room == room_board_2 || room == room_board_3)
    {
        if ((instance_exists(obj_tennabattleconvo_controller) && obj_tennabattleconvo_controller.introcon < 2) || (instance_exists(obj_elnina_lanino_controller) && obj_elnina_lanino_controller.intro < 4))
        {
        }
        else
        {
            battletimer++;
        }
        
        if (battletimer == 30)
        {
            battletimer = 0;
            battleseconds++;
            
            if (battleseconds == 60)
            {
                battleseconds = 0;
                battleminutes++;
            }
        }
        
        var _first_digit = battleseconds div 10;
        var _second_digit = battleseconds % 10;
        var _col = merge_color(c_red, c_red, 1);
        var _xx = 310;
        var _yy = 20;
        
        if (!i_ex(obj_shadowman_sharpshoot_cursor) && !i_ex(obj_elnina_lanino_controller))
        {
            if (battleminutes < 3)
            {
            }
            else
            {
            }
        }
    }
}

xx = __view_get(e__VW.XView, 0);
yy = __view_get(e__VW.YView, 0);

if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanityintro)
{
    ypostenna = lerp(ypostenna, 58, 0.4);
    yy = __view_get(e__VW.YView, 0) + ypostenna;
    depth = -999999999;
}

tpoff = (tp - tpy) + yy;
bpoff = -bp + bpy + yy;
var spell_offset = langopt(500, 496);

if (intro == 1)
{
    if (bp < (bpy - 1))
    {
        if ((bpy - bp) < 40)
            bp += round((bpy - bp) / 2.5);
        else
            bp += 30;
    }
    else
    {
        bp = bpy;
    }
    
    if (bp == bpy)
        intro = 0;
}

if (intro == 2)
{
    if (bp > 0)
    {
        if (round((bpy - bp) / 5) > 15)
            bp -= round((bpy - bp) / 2.5);
        else
            bp -= 30;
    }
    else
    {
        bp = 0;
    }
}

if (global.chapter == 3 && i_ex(obj_rouxls_ch3_enemy) && obj_rouxls_ch3_enemy.intro >= 2 && spadebuttonenabled == true && global.bmenuno == 0 && global.myfight == 0)
{
    var lowhealth = false;
    
    if (global.hp[1] < (global.maxhp[1] / 3))
        lowhealth = true;
    
    if (global.hp[2] < (global.maxhp[2] / 3))
        lowhealth = true;
    
    if (global.hp[3] < (global.maxhp[3] / 3))
        lowhealth = true;
    
    if ((global.hp[1] + global.hp[2] + global.hp[3]) < ((global.maxhp[1] + global.maxhp[2] + global.maxhp[3]) / 2))
        lowhealth = true;
    
    if (rouxlserrorcon == 0 && rouxlstelegraphcon == 0 && rouxlsbuttoncount > 0 && (rouxlsbuttoncount - 1) == (global.bmenucoord[0][global.charturn] + (rouxlsbuttoncount_y * 5)))
    {
        rouxlserrorcon = 1;
        snd_play(snd_error);
    }
    
    if (rouxlserrorcon == 0 && rouxlstelegraphcon == 0 && rouxlsbuttoncount2 > 0 && (rouxlsbuttoncount2 - 1) == (global.bmenucoord[0][global.charturn] + (rouxlsbuttoncount_y * 5)))
    {
        rouxlserrorcon = 1;
        snd_play(snd_error);
    }
    
    if (rouxlserrorcon == 1)
    {
        rouxlserrortimer++;
        
        if (rouxlserrortimer >= 10)
        {
            spadesuccesscon = 0;
            spadebuttontimer = 0;
            rouxlserrortimer = 0;
            rouxlserrorcon = 0;
            global.bmenuno = 0;
            scr_nexthero();
            global.bmenucoord[0][0] = 2;
            global.bmenucoord[0][1] = 2;
            global.bmenucoord[0][2] = 2;
            
            if (rouxlsgridenabled == true)
            {
                rouxlsbuttoncount_y = 4;
                buttonorder = 0;
                rouxlsbuttoncount = choose(0, -1, -3, -4);
            }
            
            if (obj_rouxls_ch3_enemy.phase > 1)
            {
                rouxlsbuttondirection = choose(0, 90, 180, 270);
                rouxlsbuttondirection = 270;
                
                if (rouxlsbuttondirection == 0)
                    rouxlsbuttoncount = choose(6, 11, 16);
                
                if (rouxlsbuttondirection == 90)
                    rouxlsbuttoncount = choose(21, 22, 23, 24, 25);
                
                if (rouxlsbuttondirection == 180)
                    rouxlsbuttoncount = choose(5, 10, 15, 20, 25);
                
                if (rouxlsbuttondirection == 270)
                    rouxlsbuttoncount = rouxlsbuttoncount == choose(0, -1, -3, -4);
            }
        }
        
        if (rouxlsbuttoncount == 1 && (heartbuttoncount == 1 || heartbuttoncount == 6 || heartbuttoncount == 11 || heartbuttoncount == 16 || heartbuttoncount == 21 || heartbuttoncount == 26))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 2 && (heartbuttoncount == 2 || heartbuttoncount == 7 || heartbuttoncount == 12 || heartbuttoncount == 17 || heartbuttoncount == 22 || heartbuttoncount == 27))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 3 && (heartbuttoncount == 3 || heartbuttoncount == 8 || heartbuttoncount == 13 || heartbuttoncount == 18 || heartbuttoncount == 23 || heartbuttoncount == 28))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 4 && (heartbuttoncount == 4 || heartbuttoncount == 9 || heartbuttoncount == 14 || heartbuttoncount == 19 || heartbuttoncount == 24 || heartbuttoncount == 29))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 5 && (heartbuttoncount == 5 || heartbuttoncount == 10 || heartbuttoncount == 15 || heartbuttoncount == 20 || heartbuttoncount == 25 || heartbuttoncount == 30))
            rouxlsbuttoncount = 1;
        
        if (rouxlsbuttoncount == 1 && (spadebuttoncount == 1 || spadebuttoncount == 6 || spadebuttoncount == 11 || spadebuttoncount == 16 || spadebuttoncount == 21 || spadebuttoncount == 26))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 2 && (spadebuttoncount == 2 || spadebuttoncount == 7 || spadebuttoncount == 12 || spadebuttoncount == 17 || spadebuttoncount == 22 || spadebuttoncount == 27))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 3 && (spadebuttoncount == 3 || spadebuttoncount == 8 || spadebuttoncount == 13 || spadebuttoncount == 18 || spadebuttoncount == 23 || spadebuttoncount == 28))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 4 && (spadebuttoncount == 4 || spadebuttoncount == 9 || spadebuttoncount == 14 || spadebuttoncount == 19 || spadebuttoncount == 24 || spadebuttoncount == 29))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 5 && (spadebuttoncount == 5 || spadebuttoncount == 10 || spadebuttoncount == 15 || spadebuttoncount == 20 || spadebuttoncount == 25 || spadebuttoncount == 30))
            rouxlsbuttoncount = 1;
    }
    
    if (rouxlserrorcon == 0)
    {
        spadebuttontimer++;
        
        if (obj_rouxls_ch3_enemy.phase > 1)
            rouxlsbuttontimer++;
    }
    
    if (!lowhealth)
        heartbuttoncount = -6;
    else if (lowhealth == true && obj_rouxls_ch3_enemy.phase > 1)
        heartbuttontimer++;
    
    if (spadebuttontimer >= 10 && spadetelegraphcon == 1)
    {
        spadetelegraphcon = 0;
        spadebuttontimer = 0;
    }
    else if (spadebuttontimer >= 10 && spadesuccesscon == 1)
    {
        norouxlsbutton = false;
        rouxlserrortimer = 0;
        rouxlserrorcon = 0;
        spadesuccesscon = 0;
        spadesuccesstimer = 0;
        global.bmenucoord[0][0] = 2;
        global.bmenucoord[0][1] = 2;
        global.bmenucoord[0][2] = 2;
        
        if (rouxlsgridenabled == true)
        {
            rouxlsbuttoncount_y = 4;
            buttonorder = 0;
            rouxlsbuttoncount = choose(0, -1, -3, -4);
            spadebuttoncount = -6;
        }
        
        spadefail = false;
        
        if (rouxlsbuttonendcon == 0)
        {
            scr_nexthero();
        }
        else
        {
            global.charturn = 0;
            global.bmenuno = 0;
        }
    }
    else if (((spadebuttontimer >= 7 && buttonspeed == 0) || (spadebuttontimer >= 5 && buttonspeed == 1) || (spadebuttontimer >= 3 && buttonspeed == 2)) && spadetelegraphcon == 0 && spadesuccesscon == 0)
    {
        spadebuttontimer = 0;
        
        if (dogcon != 2 && spadebuttoncount != -6)
            snd_play_x(snd_menumove, 0.6, 1.4);
        
        if (spadebuttondirection == 0)
            spadebuttoncount++;
        
        if (spadebuttondirection == 90)
            spadebuttoncount -= 5;
        
        if (spadebuttondirection == 180)
            spadebuttoncount--;
        
        if (spadebuttondirection == 270 && spadebuttoncount != -6)
            spadebuttoncount += 5;
        
        if (rouxlsgridenabled == false && spadebuttoncount > 5)
        {
            spadebuttoncount = 1;
        }
        else if ((spadebuttondirection == 0 && (spadebuttoncount == 6 || spadebuttoncount == 11 || spadebuttoncount == 16 || spadebuttoncount == 21 || spadebuttoncount == 26)) || (spadebuttondirection == 90 && (spadebuttoncount == -4 || spadebuttoncount == -3 || spadebuttoncount == -2 || spadebuttoncount == -1 || spadebuttoncount == 0)) || (spadebuttondirection == 180 && (spadebuttoncount == 0 || spadebuttoncount == 5 || spadebuttoncount == 10 || spadebuttoncount == 15 || spadebuttoncount == 20)) || (spadebuttondirection == 270 && (spadebuttoncount == 26 || spadebuttoncount == 27 || spadebuttoncount == 28 || spadebuttoncount == 29 || spadebuttoncount == 30)))
        {
            buttonorder = 0;
            spadebuttoncount = -6;
            rouxlsbuttondirection = 270;
            rouxlsbuttoncount = choose(1, 2, 3, 4, 5);
            rouxlsbuttontimer = 0;
        }
        
        if (rouxlsbuttoncount == 1 && (heartbuttoncount == 1 || heartbuttoncount == 6 || heartbuttoncount == 11 || heartbuttoncount == 16 || heartbuttoncount == 21 || heartbuttoncount == 26))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 2 && (heartbuttoncount == 2 || heartbuttoncount == 7 || heartbuttoncount == 12 || heartbuttoncount == 17 || heartbuttoncount == 22 || heartbuttoncount == 27))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 3 && (heartbuttoncount == 3 || heartbuttoncount == 8 || heartbuttoncount == 13 || heartbuttoncount == 18 || heartbuttoncount == 23 || heartbuttoncount == 28))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 4 && (heartbuttoncount == 4 || heartbuttoncount == 9 || heartbuttoncount == 14 || heartbuttoncount == 19 || heartbuttoncount == 24 || heartbuttoncount == 29))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 5 && (heartbuttoncount == 5 || heartbuttoncount == 10 || heartbuttoncount == 15 || heartbuttoncount == 20 || heartbuttoncount == 25 || heartbuttoncount == 30))
            rouxlsbuttoncount = 1;
        
        if (rouxlsbuttoncount == 1 && (spadebuttoncount == 1 || spadebuttoncount == 6 || spadebuttoncount == 11 || spadebuttoncount == 16 || spadebuttoncount == 21 || spadebuttoncount == 26))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 2 && (spadebuttoncount == 2 || spadebuttoncount == 7 || spadebuttoncount == 12 || spadebuttoncount == 17 || spadebuttoncount == 22 || spadebuttoncount == 27))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 3 && (spadebuttoncount == 3 || spadebuttoncount == 8 || spadebuttoncount == 13 || spadebuttoncount == 18 || spadebuttoncount == 23 || spadebuttoncount == 28))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 4 && (spadebuttoncount == 4 || spadebuttoncount == 9 || spadebuttoncount == 14 || spadebuttoncount == 19 || spadebuttoncount == 24 || spadebuttoncount == 29))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 5 && (spadebuttoncount == 5 || spadebuttoncount == 10 || spadebuttoncount == 15 || spadebuttoncount == 20 || spadebuttoncount == 25 || spadebuttoncount == 30))
            rouxlsbuttoncount = 1;
    }
    
    if (heartbuttontimer >= 10 && heartsuccesscon == 1)
    {
        caster = 1;
        
        for (i = 0; i < 3; i += 1)
        {
            with (global.charinstance[i])
            {
                var _heal = round(global.maxhp[global.char[myself]] / 2);
                ha = instance_create(x, y, obj_healanim);
                ha.target = id;
                dmgwr = scr_dmgwriter_selfchar();
                dmgwr.damage = _heal;
                scr_heal(other.i, _heal);
                
                with (dmgwr)
                {
                    delay = 8;
                    type = 3;
                }
                
                if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
                {
                    with (dmgwr)
                        specialmessage = 3;
                }
                
                tu += 1;
            }
        }
        
        heartsuccesscon = 0;
        buttonorder = 0;
        spadebuttoncount = -6;
        rouxlsbuttondirection = 270;
        rouxlsbuttoncount = choose(1, 2, 3, 4, 5);
        
        if (rouxlsbuttoncount == 1 && (heartbuttoncount == 1 || heartbuttoncount == 6 || heartbuttoncount == 11 || heartbuttoncount == 16 || heartbuttoncount == 21 || heartbuttoncount == 26))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 2 && (heartbuttoncount == 2 || heartbuttoncount == 7 || heartbuttoncount == 12 || heartbuttoncount == 17 || heartbuttoncount == 22 || heartbuttoncount == 27))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 3 && (heartbuttoncount == 3 || heartbuttoncount == 8 || heartbuttoncount == 13 || heartbuttoncount == 18 || heartbuttoncount == 23 || heartbuttoncount == 28))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 4 && (heartbuttoncount == 4 || heartbuttoncount == 9 || heartbuttoncount == 14 || heartbuttoncount == 19 || heartbuttoncount == 24 || heartbuttoncount == 29))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 5 && (heartbuttoncount == 5 || heartbuttoncount == 10 || heartbuttoncount == 15 || heartbuttoncount == 20 || heartbuttoncount == 25 || heartbuttoncount == 30))
            rouxlsbuttoncount = 1;
        
        if (rouxlsbuttoncount == 1 && (spadebuttoncount == 1 || spadebuttoncount == 6 || spadebuttoncount == 11 || spadebuttoncount == 16 || spadebuttoncount == 21 || spadebuttoncount == 26))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 2 && (spadebuttoncount == 2 || spadebuttoncount == 7 || spadebuttoncount == 12 || spadebuttoncount == 17 || spadebuttoncount == 22 || spadebuttoncount == 27))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 3 && (spadebuttoncount == 3 || spadebuttoncount == 8 || spadebuttoncount == 13 || spadebuttoncount == 18 || spadebuttoncount == 23 || spadebuttoncount == 28))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 4 && (spadebuttoncount == 4 || spadebuttoncount == 9 || spadebuttoncount == 14 || spadebuttoncount == 19 || spadebuttoncount == 24 || spadebuttoncount == 29))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 5 && (spadebuttoncount == 5 || spadebuttoncount == 10 || spadebuttoncount == 15 || spadebuttoncount == 20 || spadebuttoncount == 25 || spadebuttoncount == 30))
            rouxlsbuttoncount = 1;
        
        heartsuccesscon = 0;
        heartsuccesstimer = 0;
        global.bmenucoord[0][0] = 2;
        global.bmenucoord[0][1] = 2;
        global.bmenucoord[0][2] = 2;
        
        if (rouxlsgridenabled == true)
        {
            rouxlsbuttoncount_y = 4;
            buttonorder = 0;
            rouxlsbuttoncount = choose(0, -1, -3, -4);
            spadebuttoncount = -6;
        }
    }
    else if (heartbuttontimer >= 7 && spadetelegraphcon == 0 && spadesuccesscon == 0)
    {
        heartbuttontimer = 0;
        
        if (dogcon != 2 && heartbuttoncount != -6)
            snd_play_x(snd_menumove, 0.6, 1.4);
        
        if (heartbuttondirection == 0)
            heartbuttoncount++;
        
        if (heartbuttondirection == 90)
            heartbuttoncount -= 5;
        
        if (heartbuttondirection == 180)
            heartbuttoncount--;
        
        if (heartbuttondirection == 270)
            heartbuttoncount += 5;
        
        if (rouxlsgridenabled == false && heartbuttoncount > 5)
        {
            heartbuttoncount = 1;
        }
        else if ((heartbuttondirection == 0 && (heartbuttoncount == 6 || heartbuttoncount == 11 || heartbuttoncount == 16 || heartbuttoncount == 21 || heartbuttoncount == 26)) || (heartbuttondirection == 90 && (heartbuttoncount == -4 || heartbuttoncount == -3 || heartbuttoncount == -2 || heartbuttoncount == -1 || heartbuttoncount == 0)) || (heartbuttondirection == 180 && (heartbuttoncount == 0 || heartbuttoncount == 5 || heartbuttoncount == 10 || heartbuttoncount == 15 || heartbuttoncount == 20)) || (heartbuttondirection == 270 && (heartbuttoncount == 26 || heartbuttoncount == 27 || heartbuttoncount == 28 || heartbuttoncount == 29 || heartbuttoncount == 30)))
        {
            heartbuttoncount = -6;
            heartbuttondirection = 270;
            heartbuttoncount = choose(1, 2, 3, 4, 5);
        }
        
        if (heartbuttoncount == 1 && (rouxlsbuttoncount == 1 || rouxlsbuttoncount == 6 || rouxlsbuttoncount == 11 || rouxlsbuttoncount == 16 || rouxlsbuttoncount == 21 || rouxlsbuttoncount == 26))
            heartbuttoncount++;
        
        if (heartbuttoncount == 2 && (rouxlsbuttoncount == 2 || rouxlsbuttoncount == 7 || rouxlsbuttoncount == 12 || rouxlsbuttoncount == 17 || rouxlsbuttoncount == 22 || rouxlsbuttoncount == 27))
            heartbuttoncount++;
        
        if (heartbuttoncount == 3 && (rouxlsbuttoncount == 3 || rouxlsbuttoncount == 8 || rouxlsbuttoncount == 13 || rouxlsbuttoncount == 18 || rouxlsbuttoncount == 23 || rouxlsbuttoncount == 28))
            heartbuttoncount++;
        
        if (heartbuttoncount == 4 && (rouxlsbuttoncount == 4 || rouxlsbuttoncount == 9 || rouxlsbuttoncount == 14 || rouxlsbuttoncount == 19 || rouxlsbuttoncount == 24 || rouxlsbuttoncount == 29))
            heartbuttoncount++;
        
        if (heartbuttoncount == 5 && (rouxlsbuttoncount == 5 || rouxlsbuttoncount == 10 || rouxlsbuttoncount == 15 || rouxlsbuttoncount == 20 || rouxlsbuttoncount == 25 || rouxlsbuttoncount == 30))
            heartbuttoncount = 1;
        
        if (heartbuttoncount == 1 && (spadebuttoncount == 1 || spadebuttoncount == 6 || spadebuttoncount == 11 || spadebuttoncount == 16 || spadebuttoncount == 21 || spadebuttoncount == 26))
            heartbuttoncount++;
        
        if (heartbuttoncount == 2 && (spadebuttoncount == 2 || spadebuttoncount == 7 || spadebuttoncount == 12 || spadebuttoncount == 17 || spadebuttoncount == 22 || spadebuttoncount == 27))
            heartbuttoncount++;
        
        if (heartbuttoncount == 3 && (spadebuttoncount == 3 || spadebuttoncount == 8 || spadebuttoncount == 13 || spadebuttoncount == 18 || spadebuttoncount == 23 || spadebuttoncount == 28))
            heartbuttoncount++;
        
        if (heartbuttoncount == 4 && (spadebuttoncount == 4 || spadebuttoncount == 9 || spadebuttoncount == 14 || spadebuttoncount == 19 || spadebuttoncount == 24 || spadebuttoncount == 29))
            heartbuttoncount++;
        
        if (heartbuttoncount == 5 && (spadebuttoncount == 5 || spadebuttoncount == 10 || spadebuttoncount == 15 || spadebuttoncount == 20 || spadebuttoncount == 25 || spadebuttoncount == 30))
            heartbuttoncount = 1;
        
        if (heartbuttoncount == rouxlsbuttoncount || heartbuttoncount == spadebuttoncount)
            heartbuttoncount++;
        
        if (heartbuttoncount > 30)
            heartbuttoncount = 26;
    }
    
    if (rouxlsbuttontimer >= 20 && rouxlstelegraphcon == 1)
    {
        rouxlstelegraphcon = 0;
        rouxlsbuttontimer = 0;
    }
    else if (((rouxlsbuttontimer >= 7 && buttonspeed == 0) || (rouxlsbuttontimer >= 5 && buttonspeed == 1) || (rouxlsbuttontimer >= 3 && buttonspeed == 2)) && rouxlstelegraphcon == 0 && spadesuccesscon == 0)
    {
        rouxlsbuttontimer = 0;
        
        if (rouxlsbuttoncount != -6)
            snd_play_x(snd_menumove, 0.6, 1.4);
        
        if (rouxlsbuttondirection == 0)
            rouxlsbuttoncount++;
        
        if (rouxlsbuttondirection == 90)
            rouxlsbuttoncount -= 5;
        
        if (rouxlsbuttondirection == 180)
            rouxlsbuttoncount--;
        
        if (rouxlsbuttondirection == 270 && rouxlsbuttoncount != -6)
            rouxlsbuttoncount += 5;
        
        if (rouxlsbuttondirection == 270 && (rouxlsbuttoncount == 26 || rouxlsbuttoncount == 27 || rouxlsbuttoncount == 28 || rouxlsbuttoncount == 29 || rouxlsbuttoncount == 30))
        {
            buttonorder++;
            
            if ((buttonorder < 2 && obj_rouxls_ch3_enemy.phase == 2) || (buttonorder < 4 && obj_rouxls_ch3_enemy.phase == 3))
            {
                rouxlsbuttondirection = 270;
                rouxlsbuttoncount = choose(1, 2, 3, 4, 5);
            }
            else
            {
                rouxlsbuttoncount = -6;
                spadebuttontimer = 0;
                spadebuttondirection = 270;
                spadebuttoncount = choose(1, 2, 3, 4, 5);
            }
        }
        
        if (rouxlsbuttoncount == 1 && (heartbuttoncount == 1 || heartbuttoncount == 6 || heartbuttoncount == 11 || heartbuttoncount == 16 || heartbuttoncount == 21 || heartbuttoncount == 26))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 2 && (heartbuttoncount == 2 || heartbuttoncount == 7 || heartbuttoncount == 12 || heartbuttoncount == 17 || heartbuttoncount == 22 || heartbuttoncount == 27))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 3 && (heartbuttoncount == 3 || heartbuttoncount == 8 || heartbuttoncount == 13 || heartbuttoncount == 18 || heartbuttoncount == 23 || heartbuttoncount == 28))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 4 && (heartbuttoncount == 4 || heartbuttoncount == 9 || heartbuttoncount == 14 || heartbuttoncount == 19 || heartbuttoncount == 24 || heartbuttoncount == 29))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 5 && (heartbuttoncount == 5 || heartbuttoncount == 10 || heartbuttoncount == 15 || heartbuttoncount == 20 || heartbuttoncount == 25 || heartbuttoncount == 30))
            rouxlsbuttoncount = 1;
        
        if (rouxlsbuttoncount == 1 && (spadebuttoncount == 1 || spadebuttoncount == 6 || spadebuttoncount == 11 || spadebuttoncount == 16 || spadebuttoncount == 21 || spadebuttoncount == 26))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 2 && (spadebuttoncount == 2 || spadebuttoncount == 7 || spadebuttoncount == 12 || spadebuttoncount == 17 || spadebuttoncount == 22 || spadebuttoncount == 27))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 3 && (spadebuttoncount == 3 || spadebuttoncount == 8 || spadebuttoncount == 13 || spadebuttoncount == 18 || spadebuttoncount == 23 || spadebuttoncount == 28))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 4 && (spadebuttoncount == 4 || spadebuttoncount == 9 || spadebuttoncount == 14 || spadebuttoncount == 19 || spadebuttoncount == 24 || spadebuttoncount == 29))
            rouxlsbuttoncount++;
        
        if (rouxlsbuttoncount == 5 && (spadebuttoncount == 5 || spadebuttoncount == 10 || spadebuttoncount == 15 || spadebuttoncount == 20 || spadebuttoncount == 25 || spadebuttoncount == 30))
            rouxlsbuttoncount = 1;
        
        if (spadebuttoncount == 1 && (heartbuttoncount == 1 || heartbuttoncount == 6 || heartbuttoncount == 11 || heartbuttoncount == 16 || heartbuttoncount == 21 || heartbuttoncount == 26))
            spadebuttoncount++;
        
        if (spadebuttoncount == 2 && (heartbuttoncount == 2 || heartbuttoncount == 7 || heartbuttoncount == 12 || heartbuttoncount == 17 || heartbuttoncount == 22 || heartbuttoncount == 27))
            spadebuttoncount++;
        
        if (spadebuttoncount == 3 && (heartbuttoncount == 3 || heartbuttoncount == 8 || heartbuttoncount == 13 || heartbuttoncount == 18 || heartbuttoncount == 23 || heartbuttoncount == 28))
            spadebuttoncount++;
        
        if (spadebuttoncount == 4 && (heartbuttoncount == 4 || heartbuttoncount == 9 || heartbuttoncount == 14 || heartbuttoncount == 19 || heartbuttoncount == 24 || heartbuttoncount == 29))
            spadebuttoncount++;
        
        if (spadebuttoncount == 5 && (heartbuttoncount == 5 || heartbuttoncount == 10 || heartbuttoncount == 15 || heartbuttoncount == 20 || heartbuttoncount == 25 || heartbuttoncount == 30))
            spadebuttoncount = 1;
        
        if (spadebuttoncount == 1 && (rouxlsbuttoncount == 1 || rouxlsbuttoncount == 6 || rouxlsbuttoncount == 11 || rouxlsbuttoncount == 16 || rouxlsbuttoncount == 21 || rouxlsbuttoncount == 26))
            spadebuttoncount++;
        
        if (spadebuttoncount == 2 && (rouxlsbuttoncount == 2 || rouxlsbuttoncount == 7 || rouxlsbuttoncount == 12 || rouxlsbuttoncount == 17 || rouxlsbuttoncount == 22 || rouxlsbuttoncount == 27))
            spadebuttoncount++;
        
        if (spadebuttoncount == 3 && (rouxlsbuttoncount == 3 || rouxlsbuttoncount == 8 || rouxlsbuttoncount == 13 || rouxlsbuttoncount == 18 || rouxlsbuttoncount == 23 || rouxlsbuttoncount == 28))
            spadebuttoncount++;
        
        if (spadebuttoncount == 4 && (rouxlsbuttoncount == 4 || rouxlsbuttoncount == 9 || rouxlsbuttoncount == 14 || rouxlsbuttoncount == 19 || rouxlsbuttoncount == 24 || rouxlsbuttoncount == 29))
            spadebuttoncount++;
        
        if (spadebuttoncount == 5 && (rouxlsbuttoncount == 5 || rouxlsbuttoncount == 10 || rouxlsbuttoncount == 15 || rouxlsbuttoncount == 20 || rouxlsbuttoncount == 25 || rouxlsbuttoncount == 30))
            spadebuttoncount = 1;
    }
}
else
{
    rouxlserrortimer = 0;
    rouxlstelegraphcon = 0;
}

draw_set_color(c_black);
draw_rectangle(xx - 10, 481 + yy, xx + 700, ((480 - bp) + yy) - 4, false);
draw_set_color(bcolor);
draw_rectangle(xx - 10, (480 - bp - 3) + yy, xx + 700, (480 - bp - 2) + yy, false);
draw_set_color(bcolor);
draw_rectangle(xx - 10, (480 - bp) + 34 + yy, xx + 700, (480 - bp) + 36 + yy, false);
scr_charbox();

if (global.bmenuno == 1 || global.bmenuno == 3 || global.bmenuno == 11 || global.bmenuno == 12 || global.bmenuno == 13)
{
    if (global.myfight == 0)
    {
        draw_sprite(spr_heart, 0, xx + 55, yy + 385 + (global.bmenucoord[global.bmenuno][global.charturn] * 30));
        scr_84_set_draw_font("mainbig");
        namewidthb[0] = string_width(string_hash_to_newline(global.monstername[0]));
        namewidthb[1] = string_width(string_hash_to_newline(global.monstername[1]));
        namewidthb[2] = string_width(string_hash_to_newline(global.monstername[2]));
        var namewidthmax = 0;
        
        for (i = 0; i < 3; i++)
        {
            if (namewidthb[i] > namewidthmax)
                namewidthmax = namewidthb[i];
        }
        
        for (i = 0; i < 3; i += 1)
        {
            with (global.monsterinstance[global.bmenucoord[global.bmenuno][global.charturn]])
            {
                if (flash == 0)
                    fsiner = 0;
                
                flash = 1;
                becomeflash = 1;
            }
            
            if (global.monster[i] == 1)
            {
                draw_set_color(c_white);
                mercydraw = 0;
                tireddraw = 0;
                mnamecolor1 = 16777215;
                mnamecolor2 = 16777215;
                aqcolor = merge_color(c_aqua, c_blue, 0.3);
                
                if (global.charturn == 2)
                {
                    var _aqcolor = merge_color(c_aqua, c_blue, 0.3);
                    aqcolor = merge_color(_aqcolor, c_white, 0.5 + (sin(t_siner / 4) * 0.5));
                }
                
                if (global.monsterstatus[i] == 1)
                    tireddraw = 1;
                
                if (global.mercymod[i] >= global.mercymax[i])
                    mercydraw = 1;
                
                namewidth = string_width(string_hash_to_newline(global.monstername[i]));
                
                if (tireddraw == 1)
                {
                    if (global.encounterno != 31)
                    {
                        draw_set_color(aqcolor);
                        mnamecolor1 = aqcolor;
                        mnamecolor2 = aqcolor;
                    }
                    
                    draw_sprite(spr_tiredmark, 0, xx + 80 + namewidth + 40, yy + 385 + (i * 30));
                }
                
                if (mercydraw == 1)
                {
                    draw_set_color(c_yellow);
                    mnamecolor1 = 65535;
                    
                    if (tireddraw == 0)
                        mnamecolor2 = 65535;
                    
                    if (hidemercy == 0)
                        draw_sprite(spr_sparestar, 0, xx + 80 + namewidth + 20, yy + 385 + (i * 30));
                }
                
                draw_text_colour(xx + 80, yy + 375 + (i * 30), string_hash_to_newline(global.monstername[i]), mnamecolor1, mnamecolor2, mnamecolor2, mnamecolor1, 1);
                var __drawstatus = 0;
                
                if (global.bmenuno == 13)
                    __drawstatus = 1;
                
                if (__drawstatus == 0)
                {
                    draw_set_color(c_gray);
                    
                    if (global.lang != "ja")
                        draw_text(xx + 80 + namewidth + 60, yy + 375 + (i * 30), string_hash_to_newline(global.monstercomment[i]));
                    else if ((80 + namewidth + 60 + (string_width(global.monstercomment[i]) / 2)) < 415)
                        draw_text_transformed(xx + 80 + namewidth + 60, yy + 375 + (i * 30), string_hash_to_newline(global.monstercomment[i]), 0.5, 1, 0);
                    
                    draw_set_color(c_maroon);
                    draw_rectangle(xx + 420, yy + 380 + (i * 30), xx + 500, yy + 380 + (i * 30) + 15, false);
                    draw_set_color(c_lime);
                    draw_rectangle(xx + 420, yy + 380 + (i * 30), xx + 420 + ((global.monsterhp[i] / global.monstermaxhp[i]) * 80), yy + 380 + (i * 30) + 15, false);
                    draw_set_color(c_white);
                    draw_text_transformed(xx + 424, yy + 364, stringsetloc("HP", "obj_battlecontroller_slash_Draw_0_gml_173_0"), 1, 0.5, 0);
                    
                    if (global.chapter == 3 && i_ex(obj_knight_enemy))
                        draw_text_transformed(xx + 424, yy + 380 + (i * 30), "???", 1, 0.5, 0);
                    else
                        draw_text_transformed(xx + 424, yy + 380 + (i * 30), string(ceil((global.monsterhp[i] / global.monstermaxhp[i]) * 100)) + "%", 1, 0.5, 0);
                }
                else
                {
                    var __actname = stringsetloc("Standard", "obj_battlecontroller_slash_Draw_0_gml_172_0");
                    var __plainactname = __actname;
                    
                    if (global.char[global.charturn] == 2)
                        __actname = global.actnamesus[i][global.bmenucoord[2][global.charturn]];
                    
                    if (global.char[global.charturn] == 3)
                        __actname = global.actnameral[i][global.bmenucoord[2][global.charturn]];
                    
                    if (global.char[global.charturn] == 4)
                        __actname = global.actnamenoe[i][global.bmenucoord[2][global.charturn]];
                    
                    if (__actname == "S-Action")
                        __actname = __plainactname;
                    
                    if (__actname == "R-Action")
                        __actname = __plainactname;
                    
                    if (__actname == "N-Action")
                        __actname = __plainactname;
                    
                    draw_set_color(hpcolorsoft[global.char[global.charturn] - 1]);
                    draw_text_width(xx + 80 + namewidthmax + 60, yy + 375 + (i * 30), string_hash_to_newline(__actname), 514 - (80 + namewidthmax + 60));
                }
                
                mercyamt = global.mercymod[i];
                
                if (mercyamt >= 100)
                    mercyamt = 100;
                
                if (hidemercy == 0)
                {
                    var mercypercent = ceil((global.mercymod[i] / global.mercymax[i]) * 100);
                    
                    if (mercypercent > 100)
                        mercypercent = 100;
                    
                    draw_set_color(merge_color(c_orange, c_red, 0.5));
                    draw_rectangle(xx + 520, yy + 380 + (i * 30), xx + 600, yy + 380 + (i * 30) + 15, false);
                    draw_set_color(c_yellow);
                    
                    if (mercyamt > 0 && cantspare[i] == 0)
                        draw_rectangle(xx + 520, yy + 380 + (i * 30), xx + 520 + (mercypercent * 0.8), yy + 380 + (i * 30) + 15, false);
                    
                    draw_set_color(c_white);
                    var mercywidth = 1;
                    
                    if (global.lang == "ja")
                        mercywidth = 0.5;
                    
                    draw_text_transformed(xx + 524, yy + 364, stringsetloc("MERCY", "obj_battlecontroller_slash_Draw_0_gml_208_0"), mercywidth, 0.5, 0);
                    draw_set_color(c_maroon);
                    
                    if (cantspare[i] == 0)
                        draw_text_transformed(xx + 524, yy + 380 + (i * 30), string(mercypercent) + "%", 1, 0.5, 0);
                    
                    if (cantspare[i] == 1)
                    {
                        draw_line_width_color((xx + 520) - 1, yy + 380 + (i * 30), xx + 600, yy + 380 + (i * 30) + 15, 2, c_maroon, c_maroon);
                        draw_line_width_color((xx + 520) - 1, yy + 380 + (i * 30) + 15, xx + 600, yy + 380 + (i * 30), 2, c_maroon, c_maroon);
                    }
                }
            }
        }
    }
}

if (global.bmenuno == 2 && global.myfight == 0 && global.flag[34] == 1)
{
    thischar = global.char[global.charturn];
    spellcoord = global.bmenucoord[2][global.charturn];
    page = 0;
    
    if (spellcoord > 5)
    {
        page = 1;
        spellcoord -= 6;
    }
    
    icx = 10;
    icy = 385;
    
    if (spellcoord == 1 || spellcoord == 3 || spellcoord == 5)
        icx = 230;
    
    if (spellcoord > 1 && spellcoord < 4)
        icy = 415;
    
    if (spellcoord > 3)
        icy = 445;
    
    draw_sprite(spr_heart, 0, xx + icx, yy + icy);
    scr_84_set_draw_font("mainbig");
    
    for (i = 0; i < 3; i += 1)
    {
        var currentspell = global.spell[thischar][(page * 6) + (i * 2)];
        draw_set_color(c_white);
        
        if (global.tension < global.spellcost[thischar][(page * 6) + (i * 2)])
        {
            draw_set_color(c_gray);
        }
        else if (currentspell == 3 || currentspell == 8)
        {
            pacify_glow = 0;
            
            for (sglowi = 0; sglowi < 3; sglowi += 1)
            {
                if (global.monster[sglowi] == 1 && global.monsterstatus[sglowi] == 1)
                {
                    if (global.encounterno != 31)
                        pacify_glow = 1;
                }
            }
            
            if (pacify_glow == 1)
                draw_set_color(merge_color(c_aqua, c_blue, 0.3));
        }
        
        draw_text(xx + 30, yy + 375 + (i * 30), string_hash_to_newline(global.spellnameb[thischar][(page * 6) + (i * 2)]));
        draw_set_color(c_white);
        
        if (global.tension < global.spellcost[thischar][(page * 6) + (i * 2) + 1])
            draw_set_color(c_gray);
        
        draw_text(xx + 260, yy + 375 + (i * 30), string_hash_to_newline(global.spellnameb[thischar][(page * 6) + (i * 2) + 1]));
    }
    
    draw_set_color(c_gray);
    draw_text(xx + spell_offset, yy + 375, string_hash_to_newline(global.spelldescb[thischar][(page * 6) + spellcoord]));
    thiscost = floor((global.spellcost[thischar][(page * 6) + spellcoord] / global.maxtension) * 100);
    draw_set_color(c_orange);
    draw_text(xx + spell_offset, yy + 440, string_hash_to_newline(string(thiscost) + "% TP"));
}

var havejeviltail = false;

if (global.chararmor1[1] == 7 || global.chararmor2[1] == 7 || global.chararmor1[2] == 7 || global.chararmor2[2] == 7 || global.chararmor1[3] == 7 || global.chararmor2[3] == 7)
    havejeviltail = true;

if (global.bmenuno == 2 && global.myfight == 0 && global.flag[34] == 0)
{
    thischar = global.charturn;
    spellcoord = global.bmenucoord[2][global.charturn];
    page = 0;
    
    if (spellcoord > 5)
    {
        page = 1;
        spellcoord -= 6;
    }
    
    icx = 10;
    icy = 385;
    
    if (spellcoord == 1 || spellcoord == 3 || spellcoord == 5)
        icx = 230;
    
    if (spellcoord > 1 && spellcoord < 4)
        icy = 415;
    
    if (spellcoord > 3)
        icy = 445;
    
    var _cant = 0;
    draw_sprite(spr_heart, 0, xx + icx, yy + icy);
    scr_84_set_draw_font("mainbig");
    
    for (i = 0; i < 3; i += 1)
    {
        var __n = 0;
        var __isact = 0;
        
        repeat (2)
        {
            draw_set_color(c_white);
            
            if (global.battlespellspecial[thischar][(page * 6) + (i * 2) + __n] >= 1)
                draw_set_color(hpcolorsoft[global.char[thischar] - 1]);
            
            _cant = 0;
            
            if (i_ex(obj_pippins_enemy) && global.battlespellname[thischar][(page * 6) + (i * 2) + __n] == global.actnamesus[obj_pippins_enemy.myself][1] && global.flag[1044] < 150)
                _cant = 1;
            
            if (!havejeviltail == true && i_ex(obj_tenna_enemy_bg) && i_ex(obj_tenna_enemy) && global.battlespellname[thischar][(page * 6) + (i * 2) + __n] == global.actnamesus[obj_tenna_enemy.myself][1] && obj_tenna_enemy_bg.myscore < 20)
                _cant = 1;
            
            if (havejeviltail == true && i_ex(obj_tenna_enemy_bg) && i_ex(obj_tenna_enemy) && global.battlespellname[thischar][(page * 6) + (i * 2) + __n] == global.actnamesus[obj_tenna_enemy.myself][1] && obj_tenna_enemy_bg.myscore < 30)
                _cant = 1;
            
            if (global.tension < global.battlespellcost[thischar][(page * 6) + (i * 2) + __n] || _cant == 1)
            {
                draw_set_color(c_gray);
            }
            else if (global.battlespell[thischar][(page * 6) + (i * 2) + __n] == 3 || global.battlespell[thischar][(page * 6) + (i * 2) + __n] == 8)
            {
                pacify_glow = 0;
                
                for (sglowi = 0; sglowi < 3; sglowi += 1)
                {
                    if (global.monster[sglowi] == 1 && global.monsterstatus[sglowi] == 1)
                    {
                        if (global.encounterno != 31)
                            pacify_glow = 1;
                    }
                }
                
                if (pacify_glow == 1)
                {
                    var _aqcolor = merge_color(c_aqua, c_blue, 0.3);
                    var _aqcolor2 = merge_color(_aqcolor, c_white, 0.5 + (sin(t_siner / 4) * 0.5));
                    draw_set_color(_aqcolor2);
                }
            }
            
            draw_text(xx + 30 + (__n * 230), yy + 375 + (i * 30), string_hash_to_newline(global.battlespellname[thischar][(page * 6) + (i * 2) + __n]));
            __n++;
        }
    }
    
    draw_set_color(c_gray);
    draw_text(xx + spell_offset, yy + 375, string_hash_to_newline(global.battlespelldesc[thischar][(page * 6) + spellcoord]));
    thiscost = floor((global.battlespellcost[thischar][(page * 6) + spellcoord] / global.maxtension) * 100);
    draw_set_color(c_orange);
    
    if (thiscost > 0)
        draw_text(xx + spell_offset, yy + 440, string_hash_to_newline(string(thiscost) + "% TP"));
}

if (global.bmenuno == 4 && global.myfight == 0)
{
    itemcoord = global.bmenucoord[4][global.charturn];
    page = 0;
    
    if (itemcoord > 5)
    {
        page = 1;
        itemcoord -= 6;
    }
    
    icx = 10;
    icy = 385;
    
    if (itemcoord == 1 || itemcoord == 3 || itemcoord == 5)
        icx = langopt(230, 240);
    
    if (itemcoord > 1 && itemcoord < 4)
        icy = 415;
    
    if (itemcoord > 3)
        icy = 445;
    
    draw_sprite(spr_heart, 0, xx + icx, yy + icy);
    scr_84_set_draw_font("mainbig");
    
    for (i = 0; i < 3; i += 1)
    {
        var s1 = string_hash_to_newline(tempitemnameb[(page * 6) + (i * 2)][global.charturn]);
        var s2 = string_hash_to_newline(tempitemnameb[(page * 6) + (i * 2) + 1][global.charturn]);
        var s1_width = string_width(s1);
        var s2_width = string_width(s2);
        var s1_xscale = min(1, 200 / s1_width);
        var s2_xscale = min(1, 200 / s2_width);
        draw_set_color(c_white);
        draw_text_transformed(xx + 30, yy + 375 + (i * 30), s1, s1_xscale, 1, 0);
        draw_text_transformed(xx + 260, yy + 375 + (i * 30), s2, s2_xscale, 1, 0);
    }
    
    if (page == 0 && global.item[6] != 0)
        draw_sprite(spr_morearrow, 0, xx + 470, yy + 445 + (sin(s_siner / 10) * 2));
    
    if (page == 1)
        draw_sprite_ext(spr_morearrow, 0, xx + 470, (yy + 395) - (sin(s_siner / 10) * 2), 1, -1, 0, c_white, 1);
    
    draw_set_color(c_gray);
    draw_text(xx + spell_offset, yy + 375, string_hash_to_newline(tempitemdescb[(page * 6) + itemcoord][global.charturn]));
}

if (global.bmenuno == 9 && global.myfight == 0)
{
    actcoord = global.bmenucoord[9][global.charturn];
    
    for (__acti = 0; __acti < 6; __acti++)
    {
        canact[__acti] = 0;
        
        if (global.char[global.charturn] == 1)
        {
            canact[__acti] = global.canact[thisenemy][__acti];
            acttpcost[__acti] = global.actcost[thisenemy][__acti];
            actsimul[__acti] = global.actsimul[thisenemy][__acti];
            actname[__acti] = global.actname[thisenemy][__acti];
            actdesc[__acti] = global.actdesc[thisenemy][__acti];
        }
        
        if (global.char[global.charturn] == 2)
        {
            canact[__acti] = global.canactsus[thisenemy][__acti];
            acttpcost[__acti] = global.actcostsus[thisenemy][__acti];
            actsimul[__acti] = global.actsimulsus[thisenemy][__acti];
            actname[__acti] = global.actnamesus[thisenemy][__acti];
            actdesc[__acti] = global.actdescsus[thisenemy][__acti];
        }
        
        if (global.char[global.charturn] == 3)
        {
            canact[__acti] = global.canactral[thisenemy][__acti];
            acttpcost[__acti] = global.actcostral[thisenemy][__acti];
            actsimul[__acti] = global.actsimulral[thisenemy][__acti];
            actname[__acti] = global.actnameral[thisenemy][__acti];
            actdesc[__acti] = global.actdescral[thisenemy][__acti];
        }
        
        if (global.char[global.charturn] == 4)
        {
            canact[__acti] = global.canactnoe[thisenemy][__acti];
            acttpcost[__acti] = global.actcostnoe[thisenemy][__acti];
            actsimul[__acti] = global.actsimulnoe[thisenemy][__acti];
            actname[__acti] = global.actnamenoe[thisenemy][__acti];
            actdesc[__acti] = global.actdescnoe[thisenemy][__acti];
        }
    }
    
    page = 0;
    icx = 10;
    icy = 385;
    
    if (actcoord == 1 || actcoord == 3 || actcoord == 5)
        icx = 230;
    
    if (actcoord > 1 && actcoord < 4)
        icy = 415;
    
    if (actcoord > 3)
        icy = 445;
    
    if (tripticket)
    {
        if (actcoord == 2)
        {
            if (left_h())
                triptickettimer++;
            else
                triptickettimer = max(0, triptickettimer - 1);
        }
        else
        {
            triptickettimer = 0;
        }
    }
    
    if (triptickettimer > 0)
    {
        draw_sprite(spr_heartgtfo, triptickettimer / 4, (xx + icx) - triptickettimer, yy + icy);
        
        if (triptickettimer > 28)
        {
            global.bmenuno = -999;
            tripticketcon = 1;
        }
    }
    else
    {
        draw_sprite(spr_heart, 0, xx + icx, yy + icy);
    }
    
    scr_84_set_draw_font("mainbig");
    
    for (i = 0; i < 6; i += 1)
    {
        cant = 0;
        chartime = 0;
        
        if (global.char[global.charturn] == 1)
            chartime = global.actactor[global.bmenucoord[11][global.charturn]][i];
        
        charoffset = 0;
        xoffset = 0;
        
        if (i == 1 || i == 3 || i == 5)
            xoffset = 230;
        
        yoffset = 0;
        
        if (i == 2 || i == 3)
            yoffset = 30;
        
        if (i == 4 || i == 5)
            yoffset = 60;
        
        drawsus = 0;
        drawral = 0;
        drawnoe = 0;
        susblend = 16777215;
        ralblend = 16777215;
        noeblend = 16777215;
        
        if (chartime == 2 || chartime == 4)
        {
            drawsus = 1;
            
            if (havechar[1] == 0 || global.hp[2] <= 0)
            {
                susblend = 8421504;
                cant = 1;
            }
            
            charoffset = 30;
        }
        
        if (chartime == 3 || chartime == 4)
        {
            drawral = 1;
            
            if (havechar[2] == 0 || global.hp[3] <= 0)
            {
                ralblend = 8421504;
                cant = 1;
            }
            
            charoffset = 30;
        }
        
        if (chartime == 5)
        {
            drawnoe = 1;
            
            if (havechar[3] == 0 || global.hp[4] <= 0)
            {
                noeblend = 8421504;
                cant = 1;
            }
            
            charoffset = 30;
        }
        
        if (global.tension < acttpcost[i])
            cant = 1;
        
        if (i == 3 && global.monstertype[thisenemy] == 59 && global.flag[1044] < 150)
            cant = 1;
        
        if (global.monstertype[thisenemy] == 103 && global.char[global.charturn] == 2)
        {
            if (!havejeviltail == true)
            {
                if (i == 1 && i_ex(obj_tenna_enemy_bg) && obj_tenna_enemy_bg.myscore < 20)
                    cant = 1;
            }
            
            if (havejeviltail == true)
            {
                if (i == 1 && i_ex(obj_tenna_enemy_bg) && obj_tenna_enemy_bg.myscore < 30)
                    cant = 1;
            }
        }
        
        if (chartime == 4)
            charoffset *= 2;
        
        draw_set_color(c_white);
        
        if (cant == 1)
            draw_set_color(c_gray);
        
        if (chartime == 2)
            draw_sprite_ext(spr_headsusie, 0, xx + 30 + xoffset, yy + 375 + yoffset, 1, 1, 0, susblend, 1);
        
        if (chartime == 3)
            draw_sprite_ext(spr_headralsei, 0, xx + 30 + xoffset, yy + 375 + yoffset, 1, 1, 0, susblend, 1);
        
        if (chartime == 4)
        {
            draw_sprite_ext(spr_headsusie, 0, xx + 30 + xoffset, yy + 375 + yoffset, 1, 1, 0, susblend, 1);
            draw_sprite_ext(spr_headralsei, 0, xx + 60 + xoffset, yy + 375 + yoffset, 1, 1, 0, susblend, 1);
        }
        
        if (chartime == 5)
            draw_sprite_ext(spr_headnoelle, 0, xx + 30 + xoffset, yy + 375 + yoffset, 1, 1, 0, noeblend, 1);
        
        var s1 = string_hash_to_newline(actname[i]);
        var s1_width = max(1, string_width(s1));
        var s1_xscale = (206 - charoffset) / s1_width;
        
        if (s1_xscale > 1)
            s1_xscale = 1;
        
        if (s1_xscale < 0.5)
            s1_xscale = 0.5;
        
        draw_text_transformed(xx + 30 + charoffset + xoffset, yy + 375 + yoffset, string_hash_to_newline(actname[i]), s1_xscale, 1, 0);
    }
    
    draw_set_color(c_gray);
    draw_text(xx + 500, yy + 375, string_hash_to_newline(actdesc[actcoord]));
    
    if (global.tensionselect > 0)
    {
        thiscost = round((acttpcost[actcoord] / global.maxtension) * 100);
        draw_set_color(c_orange);
        draw_text(xx + 500, yy + 440, string_hash_to_newline(string(thiscost) + "% TP"));
    }
    
    with (global.monsterinstance[global.bmenucoord[11][global.charturn]])
    {
        if (flash == 0)
            fsiner = 0;
        
        flash = 1;
        becomeflash = 1;
    }
    
    if (tripticket)
    {
        var xstring = stringsetloc("X", "obj_battlecontroller_slash_Draw_0_gml_819_0");
        draw_set_color(c_red);
        var offset = /*0*/-14;
        
        if (global.lang == "ja")
            offset = 14;
        
        draw_text(xx + 158 + offset, yy + 405, xstring);
        draw_set_color(-1);
    }
}

if (global.bmenuno == 7 || global.bmenuno == 8)
{
    if (global.myfight == 0)
    {
        draw_sprite(spr_heart, 0, xx + 55, yy + 385 + (global.bmenucoord[global.bmenuno][global.charturn] * 30));
        scr_84_set_draw_font("mainbig");
        
        for (i = 0; i < 3; i += 1)
        {
            if (global.char[i] != 0)
            {
                with (global.charinstance[global.bmenucoord[global.bmenuno][global.charturn]])
                {
                    if (flash == 0)
                        fsiner = 0;
                    
                    flash = 1;
                    becomeflash = 1;
                }
                
                draw_set_color(c_white);
                draw_text(xx + 80, yy + 375 + (i * 30), string_hash_to_newline(global.charname[global.char[i]]));
                draw_set_color(c_maroon);
                draw_rectangle(xx + 400, yy + 380 + (i * 30), xx + 500, yy + 380 + (i * 30) + 15, false);
                draw_set_color(c_lime);
                var _hp = (global.hp[global.char[i]] / global.maxhp[global.char[i]]) * 100;
                
                if (_hp <= -100)
                    _hp = -100;
                
                draw_rectangle(xx + 400, yy + 380 + (i * 30), xx + 400 + _hp, yy + 380 + (i * 30) + 15, false);
            }
        }
    }
}

if (scr_debug())
{
    if (sunkus_kb_check(65))
    {
        if (global.flag[34] == 0 && global.myfight == 0)
        {
            if (global.bmenuno == 11 || global.bmenuno == 13 || global.bmenuno == 2)
            {
                var remfont = draw_get_font();
                
                for (i = 0; i < 3; i++)
                {
                    var __y = 0;
                    var __x = 0;
                    var __offsetx = 0;
                    var __offsety = 0;
                    
                    if (global.monster[i])
                    {
                        with (global.monsterinstance[i])
                        {
                            __offsetx = sactionboxx;
                            __offsety = sactionboxy;
                        }
                        
                        scr_84_set_draw_font("main");
                        
                        if (scr_havechar(2))
                        {
                            for (var __n = 0; __n < 3; __n++)
                            {
                                draw_set_color(hpcolorsoft[1]);
                                
                                if (global.canactsus[i][__n] == 1)
                                {
                                    var __actnamestring = global.actnamesus[i][__n];
                                    var __actnamestringwidth = string_width(__actnamestring);
                                    
                                    if ((__actnamestringwidth - 45) > __x)
                                        __x = __actnamestringwidth - 45;
                                    
                                    if (__actnamestring != "S-Action")
                                        draw_text((global.monsterx[i] - 200) + __offsetx, global.monstery[i] + __y + __offsety, "S-Action - " + __actnamestring);
                                    else
                                        draw_text((global.monsterx[i] - 200) + __offsetx, global.monstery[i] + __y + __offsety, __actnamestring);
                                    
                                    __y += 18;
                                }
                            }
                        }
                        
                        if (scr_havechar(3))
                        {
                            for (var __n = 0; __n < 3; __n++)
                            {
                                draw_set_color(hpcolorsoft[2]);
                                
                                if (global.canactral[i][__n] == 1)
                                {
                                    var __actnamestring = global.actnameral[i][__n];
                                    var __actnamestringwidth = string_width(__actnamestring);
                                    
                                    if ((__actnamestringwidth - 45) > __x)
                                        __x = __actnamestringwidth - 45;
                                    
                                    if (global.actnameral[i][__n] != "R-Action")
                                        draw_text((global.monsterx[i] - 200) + __offsetx, global.monstery[i] + __y + __offsety, "R-Action - " + global.actnameral[i][__n]);
                                    else
                                        draw_text((global.monsterx[i] - 200) + __offsetx, global.monstery[i] + __y + __offsety, "R-Action - Standard");
                                    
                                    __y += 18;
                                }
                            }
                        }
                        
                        if (scr_havechar(4))
                        {
                            for (var __n = 0; __n < 3; __n++)
                            {
                                draw_set_color(hpcolorsoft[3]);
                                
                                if (global.canactnoe[i][__n] == 1)
                                {
                                    var __actnamestring = global.actnamenoe[i][__n];
                                    var __actnamestringwidth = string_width(__actnamestring);
                                    
                                    if ((__actnamestringwidth - 45) > __x)
                                        __x = __actnamestringwidth - 45;
                                    
                                    if (global.actnamenoe[i][__n] != "N-Action")
                                        draw_text((global.monsterx[i] - 200) + __offsetx, global.monstery[i] + __y + __offsety, "N-Action - " + global.actnamenoe[i][__n]);
                                    else
                                        draw_text((global.monsterx[i] - 200) + __offsetx, global.monstery[i] + __y + __offsety, "N-Action - Standard");
                                    
                                    __y += 18;
                                }
                            }
                        }
                        
                        draw_set_color(c_fuchsia);
                        
                        if (__y > 0)
                            draw_rectangle((global.monsterx[i] - 210) + __offsetx, global.monstery[i] + __offsety, (global.monsterx[i] - 80) + __x + __offsetx, global.monstery[i] + __y + __offsety, true);
                    }
                }
                
                draw_set_font(remfont);
            }
        }
    }
}

if (global.myfight == 0 && global.chapter == 2 && instance_exists(obj_queen_enemy) && (global.bmenuno == 1 || global.bmenuno == 3 || global.bmenuno == 11 || global.bmenuno == 12 || global.bmenuno == 13))
{
    if (i_ex(obj_berdlyplug_enemy))
    {
        draw_set_color(c_gray);
        draw_text_ext_transformed(__view_get(e__VW.XView, 0) + 80, __view_get(e__VW.YView, 0) + 407, stringsetloc("Berdly", "obj_battlecontroller_slash_Draw_0_gml_653_0"), 9999, 9999, 1, 1, 0);
        draw_set_color(c_white);
        draw_healthbar(__view_get(e__VW.XView, 0) + 520, __view_get(e__VW.YView, 0) + 418, __view_get(e__VW.XView, 0) + 600, __view_get(e__VW.YView, 0) + 433, obj_queen_enemy.bardlymercy, c_gray, c_yellow, c_yellow, 0, 1, 0);
    }
    else
    {
        draw_set_color(c_gray);
        draw_text_ext_transformed(__view_get(e__VW.XView, 0) + 80, __view_get(e__VW.YView, 0) + 407, stringsetloc("Shield", "obj_queen_enemy_slash_Draw_0_gml_67_0"), 9999, 9999, 1, 1, 0);
        draw_set_color(c_white);
        draw_healthbar(__view_get(e__VW.XView, 0) + 520, __view_get(e__VW.YView, 0) + 418, __view_get(e__VW.XView, 0) + 600, __view_get(e__VW.YView, 0) + 433, (obj_queen_enemy.shieldacthp / obj_queen_enemy.shieldactmaxhp) * 10, c_gray, c_yellow, c_yellow, 0, 1, 0);
    }
    
    var xx2 = 0;
    
    if (global.charturn > 0 && global.bmenuno == 13)
        xx2 = 100;
    
    if (global.lang != "ja")
    {
        if (obj_queen_enemy.shieldhp > 1)
            draw_text_ext_transformed(__view_get(e__VW.XView, 0) + 210 + xx2, __view_get(e__VW.YView, 0) + 376, stringsetloc("(Protected)", "obj_queen_enemy_slash_Draw_0_gml_78_0"), 9999, 9999, 1, 1, 0);
        else
            draw_text_ext_transformed(__view_get(e__VW.XView, 0) + 210 + xx2, __view_get(e__VW.YView, 0) + 376, stringsetloc("(Defenseless)", "obj_queen_enemy_slash_Draw_0_gml_82_0"), 9999, 9999, 1, 1, 0);
    }
}

if (global.chapter == 3)
{
    if (tripticketcon == 1)
    {
        snd_free_all();
        snd_play(snd_escaped);
        msgsetloc(0, "* Escaped...", "obj_battlecontroller_slash_Draw_0_gml_1003_0");
        scr_battletext_default();
        var fadeout = scr_fadeout(90);
        fadeout.depth = -1000;
        triptickettimer = 0;
        tripticketcon = 2;
        
        with (obj_border_controller)
            hide_border(0.01);
    }
    
    if (tripticketcon == 2)
    {
        triptickettimer++;
        
        if (triptickettimer >= 120)
        {
            global.fighting = 0;
            global.interact = 3;
            instance_create(0, 0, obj_persistentfadein);
            global.entrance = 0;
            scr_losechar();
            global.facing = 3;
            scr_keyitemremove(18);
            room_goto(room_dw_ch3_man);
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
