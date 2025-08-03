if (i_ex(obj_titan_enemy))
{
    if (global.monsterhp[myself] < 1)
        global.monsterhp[myself] = 1;
}

hpprev = global.monsterhp[myself];

if (scr_debug() && keyboard_check(vk_numpad4))
{
    var _exp = instance_create(x + 200, y + 440, obj_titan_fight_explosion);
    _exp.depth = 1000310;
    _exp.minh = -8;
    _exp.maxh = -2;
}

if (scr_debug() && keyboard_check(vk_numpad6))
{
    var _exp = instance_create(x + 400, y + 440, obj_titan_fight_explosion);
    _exp.depth = 1000310;
    _exp.minh = 0;
    _exp.maxh = 6;
}

if (global.monsterhp[myself] <= (global.monstermaxhp[myself] * 0.5) && finalunleashphasedone == false)
{
    finalunleashphasedone = true;
    
    with (obj_spellphase)
    {
        scr_attackphase();
        
        with (spellwriter)
            instance_destroy();
        
        with (obj_face)
            instance_destroy();
        
        instance_destroy();
    }
    
    endingcon = 1;
    endingtimer = -50;
    myattackchoice = 20;
    talked = 0.1;
    talktimer = 0;
    phaseturn = 1;
    global.battlemsg[0] = stringsetloc("* ...", "obj_titan_enemy_slash_Step_0_gml_70_0");
}

if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0)
    {
        if (phase == 8 && global.monsterhp[myself] <= (global.monstermaxhp[myself] * 0.4))
        {
            myattackchoice = 20;
            difficulty = 0;
        }
        
        if (!instance_exists(obj_darkener) && myattackchoice != 20)
        {
            instance_create(0, 0, obj_darkener);
            
            with (obj_darkener)
                depth = other.depth - 1;
        }
        
        rtimer = 0;
        con = 0;
        setbattlemsg = false;
        turnswithoutunleash++;
        
        if (turnswithoutunleash == 4)
            tensionscaling = 1.5;
        
        if (turnswithoutunleash == 5)
            tensionscaling = 2;
        
        if (turnswithoutunleash == 7)
            tensionscaling = 3;
        
        var createballoon = false;
        
        if (finalunleashphasedone || phase == 7 || phase == 8)
            createballoon = true;
        
        if (!createballoon)
        {
            global.mnfight = 1.5;
        }
        else if (afterdualbusterused == true && susiesideaenabled == false)
        {
            with (obj_darkener)
                instance_destroy();
            
            endingcon = 29;
            endingtimer = 0;
            talked = 0.1;
            talktimer = 0;
        }
        else if (dualbusterused == true && susiesideaenabled == false)
        {
            with (obj_darkener)
                instance_destroy();
            
            endingcon = 23;
            endingtimer = 0;
            talked = 0.1;
            talktimer = 0;
        }
        else if (phase == 7 && phaseturn == 2)
        {
            with (obj_darkener)
                instance_destroy();
            
            endingcon = 4;
            endingtimer = 0;
            talked = 0.1;
            talktimer = 0;
        }
        else if (phase == 7 && phaseturn == 3)
        {
            with (obj_darkener)
                instance_destroy();
            
            endingcon = 8;
            endingtimer = 0;
            talked = 0.1;
            talktimer = 0;
        }
        else
        {
            global.mnfight = 1.5;
        }
    }
    
    phase8attack = false;
    
    if (talked == 1 && scr_isphase("enemytalk"))
        scr_blconskip(15);
    
    if (global.mnfight == 1.5)
    {
        if (instance_exists(obj_darkshape_blast) || instance_exists(obj_darkshape_star))
            exit;
        
        if (myattackchoice == 20)
        {
        }
        else
        {
            if (!instance_exists(obj_growtangle))
            {
                if (myattackchoice == 2 || myattackchoice == 3 || myattackchoice == 4)
                    instance_create(__view_get(e__VW.XView, 0) + 250, __view_get(e__VW.YView, 0) + 200, obj_growtangle);
                else
                    instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 170, obj_growtangle);
            }
            
            if (!instance_exists(obj_moveheart))
                scr_moveheart();
        }
        
        global.mnfight = 2;
        scr_turntimer(90);
    }
    
    if (scr_isphase("bullets") && attacked == 0)
    {
        rtimer += 1;
        
        if (rtimer == 12)
        {
            scr_turntimer(360);
            
            if (myattackchoice == 2)
                scr_turntimer(270);
            
            if (myattackchoice == 0)
            {
                global.monsterattackname[myself] = "darkshapeswithred";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 461;
                scr_turntimer(420);
            }
            
            if (myattackchoice == 1)
            {
                global.monsterattackname[myself] = "darkshapescentipedeharder";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 451;
            }
            
            if (myattackchoice == 2)
            {
                global.monsterattackname[myself] = "darkshapesbigshot";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 452;
            }
            
            if (myattackchoice == 3)
            {
                global.monsterattackname[myself] = "darkshapesbigshotdesperation";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 453;
                scr_turntimer(430);
            }
            
            if (myattackchoice == 4)
            {
                global.monsterattackname[myself] = "darkshapesbigshotaimed";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 454;
            }
            
            if (myattackchoice == 5)
            {
                global.monsterattackname[myself] = "darkshapescentipedehardest";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 470;
            }
            
            if (myattackchoice == 6)
            {
                global.monsterattackname[myself] = "darkshapesintro";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 456;
            }
            
            if (myattackchoice == 7)
            {
                global.monsterattackname[myself] = "darkshapescentipedeintro";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 457;
            }
            
            if (myattackchoice == 8)
            {
                global.monsterattackname[myself] = "darkshapesmine";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 458;
            }
            
            if (myattackchoice == 9)
            {
                global.monsterattackname[myself] = "thehands";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 459;
            }
            
            if (myattackchoice == 10)
            {
                global.monsterattackname[myself] = "thehandsfast";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 462;
            }
            
            if (myattackchoice == 11)
            {
                global.monsterattackname[myself] = "thehandsfastest";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 463;
            }
            
            if (myattackchoice == 12)
            {
                global.monsterattackname[myself] = "darkshapescentipedenoshapes";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 464;
            }
            
            if (myattackchoice == 13)
            {
                global.monsterattackname[myself] = "darkshapesbigshotdesperationshort";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 465;
                global.turntimer = 240;
            }
            
            if (myattackchoice == 14)
            {
                global.monsterattackname[myself] = "darkshapeharder";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 468;
                scr_turntimer(420);
            }
            
            if (myattackchoice == 15)
            {
                global.monsterattackname[myself] = "darkshapehardest";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 469;
                scr_turntimer(420);
            }
            
            if (myattackchoice == 16)
            {
                global.monsterattackname[myself] = "darkshapefinal";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 472;
                scr_turntimer(900);
            }
            
            if (myattackchoice == 20)
            {
                heal = instance_create(x, y, obj_titan_heal);
                
                if (phase == 8)
                {
                    heal.strongerheal = true;
                    heal.healamt = global.monstermaxhp[obj_titan_enemy.myself] * 0.5;
                }
            }
            
            turns += 1;
            attacked = 1;
            
            if (myattackchoice == 4 && phase == 8)
                global.turntimer = 240;
        }
    }
    
    if (global.mnfight == 2 && global.turntimer <= 1)
    {
        if (setbattlemsg == false)
        {
            global.typer = 6;
            global.fc = 0;
            scr_randomtarget();
            phaseturn++;
            event_user(0);
            light_radius = 48;
            brighten = 0;
            juststoppedbeingunleashed = 0;
            setbattlemsg = true;
            
            if (deunleash == true)
            {
                unleashed = false;
                
                if (finalunleashphasedone == true)
                    drawstate = "defense";
                else
                    starshootcon = 3;
            }
            
            deunleash = false;
            
            if ((phase == 1 || phase == 3 || phase == 5) && global.tension >= 200)
            {
                scr_speaker("no_name");
                global.battlemsg[0] = stringsetloc("* The atmosphere feels tense... (You can use \\cYUNLEASH\\c0!)", "obj_jackenstein_enemy_slash_Step_0_gml_340_0");
            }
            
            if (phase == 8 && (global.hp[1] < 1 || global.hp[2] < 1 || global.hp[3] < 1))
            {
                var _str = "";
                
                if (global.hp[1] < 1)
                    _str = stringsetloc("Kris", "obj_initializer_slash_Create_0_gml_48_0");
                
                if (global.hp[2] < 1)
                    _str = stringsetloc("Susie", "obj_initializer_slash_Create_0_gml_49_0");
                
                if (global.hp[3] < 1)
                    _str = stringsetloc("Ralsei", "obj_initializer_slash_Create_0_gml_50_0");
                
                var _andstr = /*" and "*/"和";
                
                if (global.lang == "ja")
                    _andstr = " と ";
                
                if (global.hp[1] < 1 && global.hp[2] < 1)
                    _str = stringsetloc("Kris", "obj_initializer_slash_Create_0_gml_48_0") + _andstr + stringsetloc("Susie", "obj_initializer_slash_Create_0_gml_49_0");
                
                if (global.hp[1] < 1 && global.hp[3] < 1)
                    _str = stringsetloc("Kris", "obj_initializer_slash_Create_0_gml_48_0") + _andstr + stringsetloc("Ralsei", "obj_initializer_slash_Create_0_gml_50_0");
                
                if (global.hp[2] < 1 && global.hp[3] < 1)
                    _str = stringsetloc("Susie", "obj_initializer_slash_Create_0_gml_49_0") + _andstr + stringsetloc("Ralsei", "obj_initializer_slash_Create_0_gml_50_0");
                
                global.battlemsg[0] = stringsetsubloc("* Old Man gave ~1 candy!", _str, "obj_titan_enemy_slash_Step_0_gml_395_0");
                gerson.sprite_index = spr_gerson_item;
                gerson.image_index = 0;
                gerson.image_speed = 1/3;
                global.charturn = 3;
            }
        }
    }
    
    if (endingcon == 1)
    {
        endingtimer++;
        
        if (endingtimer == -49)
            mus_fade(global.batmusic[1], 60);
        
        if (endingtimer == 41)
        {
            scr_fadein(10);
            
            with (obj_fadein)
            {
                image_blend = c_white;
                image_alpha = 0.6;
                depth = -99999;
                x = camerax();
                y = cameray();
            }
            
            var _exp = instance_create(x + 200, y + 440, obj_titan_fight_explosion);
            _exp.depth = 1000310;
            _exp.minh = -8;
            _exp.maxh = -2;
            pre_rumble = true;
            rumbler = 0;
            snd_play_x(snd_punchheavythunder, 1, 1.3);
        }
        
        if (endingtimer == 89)
        {
            shakepow = 0;
            rumble = true;
            pre_rumble = false;
        }
        
        if (endingtimer == 91)
        {
            rumble_sound = snd_loop(snd_rumble);
            rumble = true;
            rumbler = 3;
            shakepow = 2;
            hurttimer = random_range(30, 50);
            
            if (starshootcon == 0)
                starshootcon = 2;
            
            scr_fadein(10);
            
            with (obj_fadein)
            {
                image_blend = c_white;
                image_alpha = 0.7;
                depth = -99999;
                x = camerax();
                y = cameray();
            }
            
            snd_play_x(snd_punchheavythunder, 1, 1.3);
            var _exp = instance_create(x + 400, y + 440, obj_titan_fight_explosion);
            _exp.depth = 1000310;
            _exp.minh = 0;
            _exp.maxh = 6;
            bg_fade = instance_create(screenx(), screeny(), obj_screen_color);
            bg_fade.blend_mode = 3;
            bg_fade.image_blend = c_black;
            bg_fade.depth = obj_herokris.depth + 10;
            scr_lerp_imageblend(bg_fade, 0, 11184810, 90);
        }
        
        if (endingtimer >= 91)
        {
            if (hurt_index < 2)
                hurt_index += (1/3);
        }
        
        if (endingtimer == 180)
        {
            with (obj_dmgwriter)
            {
                if (delaytimer >= 1)
                    killactive = 1;
            }
            
            for (i = 0; i < 3; i++)
            {
                if (global.hp[i + 1] <= 0)
                {
                    var _hltarget = global.char[i];
                    var _curhp = global.hp[_hltarget];
                    var _healpower;
                    
                    if (_curhp <= 0)
                        _healpower = -_curhp + 5;
                    else
                        _healpower = 1;
                    
                    scr_heal(i, _healpower);
                    
                    with (global.charinstance[i])
                    {
                        ha = instance_create(x, y, obj_healanim);
                        ha.target = id;
                        dmgwr = scr_dmgwriter_selfchar();
                        
                        with (dmgwr)
                        {
                            delay = 8;
                            type = 3;
                            damage = _healpower;
                        }
                        
                        if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
                        {
                            with (dmgwr)
                                specialmessage = 3;
                        }
                        
                        tu += 1;
                    }
                }
            }
            
            for (i = 0; i < 3; i++)
            {
                with (global.charinstance[i])
                    tu--;
            }
            
            msgsetloc(0, "Did... Did&we do it...?/%", "obj_titan_enemy_slash_Step_0_gml_515_0");
            global.typer = 75;
            scr_heroblcon("susie");
            
            with (obj_herosusie)
                scr_shakeobj();
            
            scr_battle_sprite_set("susie", 3687, 0, 1);
            global.canact[myself][3] = 0;
            global.actname[myself][3] = "";
            global.actactor[myself][3] = 0;
            scr_spellmenu_setup();
        }
        
        if ((button3_p() && endingtimer > 195) || (!i_ex(obj_writer) && endingtimer >= 180))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 2;
            endingtimer = -80;
        }
    }
    
    if (endingcon == 2)
    {
        endingtimer++;
        
        if (endingtimer > -10)
        {
            if (hurt_index < 5)
                hurt_index += (1/3);
        }
        
        if (endingtimer == -70)
        {
            snd_volume(rumble_sound, 0, 30);
            
            with (obj_titan_fight_explosion)
                endless = false;
        }
        
        if (endingtimer == -55)
        {
            shakepow = 1;
            rumbler = 2;
        }
        
        if (endingtimer == -40)
        {
            shakepow = 0;
            rumbler = 1;
        }
        
        if (endingtimer == -25)
            rumbler = 0;
        
        if (endingtimer == -10)
        {
            snd_stop(rumble_sound);
            snd_free(rumble_sound);
            drawstate = "defense";
        }
        
        if (endingtimer == 20)
        {
            knightmus[0] = snd_init("mus_knightthought.ogg");
            knightmus[1] = mus_loop(knightmus[0]);
            mus_volume(knightmus[1], 0, 0);
            mus_volume(knightmus[1], 0.5, 150);
        }
        
        if (endingtimer == 70)
        {
            msgsetloc(0, "H-hey, wait!&What is it...&doing...?/%", "obj_titan_enemy_slash_Step_0_gml_593_0");
            global.typer = 75;
            scr_heroblcon("susie");
            
            with (obj_herosusie)
                scr_shakeobj();
            
            scr_battle_sprite_set("susie", 5029, 0, 1);
        }
        
        if ((button3_p() && endingtimer > 85) || (!i_ex(obj_writer) && endingtimer >= 70))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 3;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 3)
    {
        endingtimer++;
        
        if (endingtimer == 1)
            instance_create(x, y, obj_titan_heal);
        
        if (endingtimer == 160)
        {
            msgsetloc(0, "It's...&regenerating./%", "obj_titan_enemy_slash_Step_0_gml_617_0");
            global.typer = 74;
            scr_heroblcon("ralsei");
            
            with (obj_heroralsei)
                scr_shakeobj();
            
            scr_battle_sprite_set("ralsei", 1741, 0.16666666666666666, 1);
        }
        
        if ((button3_p() && endingtimer > 185) || (!i_ex(obj_writer) && endingtimer >= 170))
        {
            scr_battle_sprite_reset("susie");
            scr_battle_sprite_reset("ralsei");
            
            with (obj_writer)
                instance_destroy();
            
            endingcon = 0;
            endingtimer = 0;
            talked = 1;
            talktimer = 0;
            phaseturn = 1;
            phase = 7;
            
            with (obj_battlecontroller)
                scr_mnendturn();
        }
    }
    
    if (endingcon == 4)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "Hey, Ralsei,&how do we&stop it!?/%", "obj_titan_enemy_slash_Step_0_gml_649_0");
            global.typer = 75;
            scr_heroblcon("susie");
            
            with (obj_herosusie)
                scr_shakeobj();
            
            scr_battle_sprite_set("susie", 5029, 0, 1);
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 6;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 6)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "I.../%", "obj_titan_enemy_slash_Step_0_gml_671_0");
            global.typer = 74;
            scr_heroblcon("ralsei");
            
            with (obj_heroralsei)
                scr_shakeobj();
            
            scr_battle_sprite_set("ralsei", 1741, 0.16666666666666666, 1);
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 7;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 7)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "I don't&know.../%", "obj_titan_enemy_slash_Step_0_gml_693_0");
            global.typer = 74;
            scr_heroblcon("ralsei");
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            scr_battle_sprite_reset("susie");
            scr_battle_sprite_reset("ralsei");
            instance_create(x, y, obj_titan_heal);
            endingcon = 7.5;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 7.5)
    {
        endingtimer++;
        
        if (endingtimer >= 160 && !i_ex(obj_writer))
        {
            phaseturn = 3;
            endingcon = 0;
            endingtimer = 0;
            talked = 1;
            talktimer = 0;
            
            with (obj_battlecontroller)
                scr_mnendturn();
        }
    }
    
    if (endingcon == 8)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "It seems...&it seems we&were only.../%", "obj_titan_enemy_slash_Step_0_gml_735_0");
            global.typer = 74;
            scr_heroblcon("ralsei");
            
            with (obj_heroralsei)
                scr_shakeobj();
            
            scr_battle_sprite_set("ralsei", 1741, 0.16666666666666666, 1);
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 9;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 9)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "... damaging its&outer shell./%", "obj_titan_enemy_slash_Step_0_gml_758_0");
            global.typer = 74;
            scr_heroblcon("ralsei");
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 10;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 10)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "As long as&the inside is&intact.../%", "obj_titan_enemy_slash_Step_0_gml_777_0");
            global.typer = 74;
            scr_heroblcon("ralsei");
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 11;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 11)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "This battle...&will just keep.../%", "obj_titan_enemy_slash_Step_0_gml_796_0");
            global.typer = 74;
            scr_heroblcon("ralsei");
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 12;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 12)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, ".../%", "obj_titan_enemy_slash_Step_0_gml_815_0");
            global.typer = 75;
            scr_heroblcon("susie");
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 13;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 13)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            heal = instance_create(x, y, obj_titan_heal);
            heal.notext = true;
            heal.strongerheal = true;
            heal.healamt = global.monstermaxhp[obj_titan_enemy.myself] * 0.5;
            snd_pitch_time(knightmus[1], 0.9, 60);
        }
        
        if (endingtimer == 140)
        {
            drawstate = "undefense";
            drawstatetimer = 6;
            snd_play(snd_wingflap3);
            feathercon = 2;
        }
        
        if (endingtimer == 180)
        {
            msgsetloc(0, "I suppose.../%", "obj_titan_enemy_slash_Step_0_gml_852_0");
            global.typer = 74;
            scr_heroblcon("ralsei");
        }
        
        if ((button3_p() && endingtimer > 195) || (!i_ex(obj_writer) && endingtimer >= 180))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 14;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 14)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "We just have to...&keep on fighting./%", "obj_titan_enemy_slash_Step_0_gml_871_0");
            global.typer = 74;
            scr_heroblcon("ralsei");
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 15;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 15)
    {
        endingtimer++;
        
        if (endingtimer > 59)
        {
            endingcon = 16;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 16)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            hammer = instance_create(camerax() - 60, cameray() + 210, obj_titan_hammer);
            hammer.image_xscale = -2;
            hammer.image_yscale = 2;
            hammer.image_angle = 180;
            hammer.hspeed = 80;
        }
        
        if (endingtimer == 8)
        {
            snd_free_all();
            snd_play(snd_punchheavythunder);
            drawstate = "crack2";
            shakex = 9;
            state = 3;
            hurttimer = 30;
            hammer.hspeed = 0;
            scr_fadein(10);
            
            with (obj_fadein)
            {
                image_blend = c_white;
                image_alpha = 0.6;
                depth = -99999;
                x = camerax();
                y = cameray();
            }
            
            with (bg_fade)
                instance_destroy();
            
            with (obj_herokris)
                scr_shakeobj();
            
            with (obj_herosusie)
            {
                x += 25;
                scr_shakeobj();
            }
            
            with (obj_heroralsei)
            {
                x += 16;
                y += 10;
                scr_shakeobj();
            }
            
            scr_battle_sprite_set("susie", 719, 0, 1);
            scr_battle_sprite_set("ralsei", 2674, 0, 1);
            instance_create(x, y, obj_shake);
            var _x = camerax() + 500;
            var _y = cameray() + 300;
            anim = instance_create(_x, _y - 110, obj_animation);
            anim.sprite_index = spr_titan_shockwave_bullet_explosion;
            anim.image_speed = 0.5;
            anim.image_index = 1;
            
            repeat (30)
            {
                mark = instance_create((_x - 40) + random(80), (_y - 40) + random(80), obj_marker);
                mark.sprite_index = spr_gerson_item_throw;
                mark.image_blend = merge_color(c_white, c_black, 0.3);
                mark.image_speed = 0;
                mark.image_index = 3;
                mark.gravity = 1;
                mark.gravity_direction = 270;
                mark.vspeed = -4 - random(18);
                mark.hspeed = -6 + random(12);
                mark.depth = 10;
            }
        }
        
        if (endingtimer == 9)
            hammer.hspeed = 80;
        
        if (endingtimer == 100)
        {
            gerson.depth = obj_heroralsei.depth - 2;
            msgsetloc(0, "What're y'all&givin' up for?/%", "obj_titan_enemy_slash_Step_0_gml_966_0");
            global.typer = 86;
            balloon = scr_enemyblcon(camerax() + 90, cameray() + 105, 10);
            balloon.side = -1;
        }
        
        if ((button3_p() && endingtimer > 115) || (!i_ex(obj_writer) && endingtimer > 100))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 17;
            endingtimer = 0;
            camera_x_original = camerax();
        }
    }
    
    if (endingcon == 17)
    {
        endingtimer++;
        
        if (endingtimer < 88)
        {
            var _ease = lerp(camera_x_original, camera_x_original - 258, scr_ease_in(endingtimer / 87, 5));
            camerax_set(_ease);
            
            with (obj_tensionbar)
                x = _ease + 38;
        }
        
        if (endingtimer == 89)
        {
            instance_create(x, y, obj_shake);
            snd_play(snd_closet_impact);
        }
        
        if (endingtimer == 90)
        {
            with (obj_herokris)
            {
                image_xscale = -2;
                x += 46;
            }
            
            with (obj_herosusie)
            {
                image_xscale = -2;
                x += 32;
            }
            
            with (obj_heroralsei)
            {
                image_xscale = -2;
                x += 46;
            }
            
            msgsetloc(0, "You're not out&of ideas yet,&are ya?/%", "obj_titan_enemy_slash_Step_0_gml_1002_0");
            global.typer = 86;
            balloon = scr_enemyblcon(camerax() + 110, cameray() + 120, 10);
            balloon.side = 2;
            oldmus[0] = snd_init("oldman_helps_out.ogg");
            oldmus[1] = mus_loop(oldmus[0]);
            mus_volume(oldmus[1], 0, 0);
            mus_volume(oldmus[1], 0.8, 30);
        }
        
        if ((button3_p() && endingtimer > 105) || (!i_ex(obj_writer) && endingtimer > 90))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 18;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 18)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "Old... old man!&I thought you&were.../%", "obj_titan_enemy_slash_Step_0_gml_1027_0");
            global.typer = 75;
            var heroballoon = scr_enemyblcon(obj_herosusie.x + 45, obj_herosusie.y + 40, 10);
            heroballoon.side = -1;
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 19;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 19)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "I was lookin'&for a change a'&scenery.../%", "obj_titan_enemy_slash_Step_0_gml_1047_0");
            global.typer = 86;
            balloon = scr_enemyblcon(camerax() + 110, cameray() + 120, 10);
            balloon.side = 2;
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 20;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 20)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "But this is a&bit ridiculous./%", "obj_titan_enemy_slash_Step_0_gml_1067_0");
            global.typer = 86;
            balloon = scr_enemyblcon(camerax() + 110, cameray() + 140, 10);
            balloon.side = 2;
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 21;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 21)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            gerson.sprite_index = spr_gerson_pose2;
            gerson.image_speed = 1/3;
        }
        
        if (endingtimer == 16)
        {
            gerson.image_speed = 0;
            endingcon = 21.5;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 21.5)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "C'mon, let's&get this fellow!/%", "obj_titan_enemy_slash_Step_0_gml_1106_0");
            global.typer = 86;
            balloon = scr_enemyblcon(camerax() + 110, cameray() + 140, 10);
            balloon.side = 2;
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 22;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 22)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "... yeah!/%", "obj_titan_enemy_slash_Step_0_gml_1126_0");
            global.typer = 75;
            var heroballoon = scr_enemyblcon(obj_herosusie.x + 65, obj_herosusie.y + 40, 10);
            heroballoon.side = -1;
            scr_battle_sprite_reset("susie");
            scr_battle_sprite_reset("ralsei");
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 22.5;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 22.5)
    {
        if (endingtimer == 0)
        {
            with (gerson)
            {
                sprite_index = spr_gerson_idle;
                image_xscale = -2;
                x += 100;
                xstart += 100;
            }
        }
        
        if (endingtimer < 30)
        {
            camerax_set(camerax() + 8.7);
            
            with (obj_tensionbar)
                x += 8.7;
            
            gerson.x = lerp(gerson.xstart, gerson.xstart + 120 + 9, endingtimer / 30);
            gerson.y = lerp(gerson.ystart, gerson.ystart + 55, endingtimer / 30);
        }
        
        if (endingtimer == 30)
        {
            gerson.sprite_index = spr_gerson_idle;
            camerax_set(camerastartx);
            
            with (obj_herokris)
            {
                image_xscale = 2;
                x = xstart;
                y = ystart;
            }
            
            with (obj_herosusie)
            {
                image_xscale = 2;
                x = xstart;
                y = ystart;
            }
            
            with (obj_heroralsei)
            {
                image_xscale = 2;
                x = xstart;
                y = ystart;
            }
            
            gerson.xstart = gerson.x;
            gerson.ystart = gerson.y;
            talked = 1;
            talktimer = 0;
            endingtimer = 0;
            endingcon = 0;
            global.canact[myself][0] = 1;
            global.actname[myself][0] = stringsetloc("DualBuster", "obj_titan_enemy_slash_Step_0_gml_1207_0");
            
            if (global.lang == "en")
                global.actname[myself][0] = "        " + global.actname[myself][0];
            
            if (global.lang == "ja")
                global.actname[myself][0] = "    " + global.actname[myself][0];
            
            global.actactor[myself][0] = 2;
            global.actdesc[myself][0] = stringsetloc("Double#magic", "obj_titan_enemy_slash_Step_0_gml_1209_0");
            global.canact[myself][1] = 0;
            global.actname[myself][1] = "";
            global.actactor[myself][1] = 0;
            global.canact[myself][2] = 0;
            global.actname[myself][2] = "";
            global.actactor[myself][2] = 0;
            global.canact[myself][3] = 0;
            global.actname[myself][3] = "";
            global.actactor[myself][3] = 0;
            scr_spellmenu_setup();
            dualbusterenabled = true;
            forcehitralsei = 1;
            phase = 8;
            
            with (obj_battlecontroller)
                scr_mnendturn();
            
            global.battlemsg[0] = newact_str;
            myattackchoice = 15;
            difficulty = 0;
        }
        
        endingtimer++;
    }
    
    if (endingcon == 23)
    {
        endingtimer++;
        
        if (endingtimer == 20)
        {
            msgsetloc(0, "Geheh,&not bad!/%", "obj_titan_enemy_slash_Step_0_gml_1244_0");
            global.typer = 86;
            balloon = scr_enemyblcon(camerax() + 20, cameray() + 190, 10);
            balloon.side = 2;
            myattackchoice = 4;
            difficulty = 0;
        }
        
        if ((button3_p() && endingtimer > 35) || (!i_ex(obj_writer) && endingtimer > 20))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 24;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 24)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "Heheh,&right?/%", "obj_titan_enemy_slash_Step_0_gml_1264_0");
            global.typer = 75;
            scr_heroblcon("susie");
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 25;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 25)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "... still, we've&only harmed&the outside../%", "obj_titan_enemy_slash_Step_0_gml_1283_0");
            global.typer = 75;
            scr_heroblcon("susie");
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 26;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 26)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "Then ya&know what&to do,&right?/%", "obj_titan_enemy_slash_Step_0_gml_1302_0");
            global.typer = 86;
            balloon = scr_enemyblcon(camerax() + 20, cameray() + 150, 10);
            balloon.side = 2;
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 27;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 27)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, ".../%", "obj_titan_enemy_slash_Step_0_gml_1323_0");
            global.typer = 75;
            scr_heroblcon("susie");
        }
        
        if ((button3_p() && endingtimer > 16) || (!i_ex(obj_writer) && endingtimer > 1))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 0;
            endingtimer = 0;
            afterdualbusterused = true;
            
            with (obj_battlecontroller)
                scr_mnendturn();
        }
    }
    
    if (endingcon == 29)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "Kris! I got&an idea.../%", "obj_titan_enemy_slash_Step_0_gml_1346_0");
            global.typer = 75;
            scr_heroblcon("susie");
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 30;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 30)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "But, uh.../%", "obj_titan_enemy_slash_Step_0_gml_1365_0");
            global.typer = 75;
            scr_heroblcon("susie");
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 31;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 31)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "You're gonna&have to put&your life in&my hands./%", "obj_titan_enemy_slash_Step_0_gml_1384_0");
            global.typer = 75;
            scr_heroblcon("susie");
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 32;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 32)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "... kinda,&literally./%", "obj_titan_enemy_slash_Step_0_gml_1403_0");
            global.typer = 75;
            scr_heroblcon("susie");
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 33;
            endingtimer = 0;
        }
    }
    
    if (endingcon == 33)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "... damn, what&am I asking for!?/%", "obj_titan_enemy_slash_Step_0_gml_1422_0");
            global.typer = 75;
            scr_heroblcon("susie");
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 34;
            endingtimer = 0;
            
            with (obj_herosusie)
            {
                normalsprite = spr_susier_dark;
                idlesprite = spr_susieb_idle;
                defendsprite = spr_susieb_defend;
                hurtsprite = spr_susieb_hurt;
                actreadysprite = spr_susieb_actready;
                actsprite = spr_susieb_act;
                attackreadysprite = spr_susieb_attackready;
                attacksprite = spr_susieb_attack;
                
                if (global.charweapon[2] == 0)
                {
                    idlesprite = spr_susieb_idle_unarmed;
                    attackreadysprite = spr_susieb_attackready_unarmed;
                    attacksprite = spr_susieb_attack_unarmed;
                }
                
                itemsprite = spr_susieb_item;
                itemreadysprite = spr_susieb_itemready;
                spellreadysprite = spr_susieb_spellready;
                spellsprite = spr_susieb_spell;
                defeatsprite = spr_susieb_defeat;
            }
        }
    }
    
    if (endingcon == 34)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            msgsetloc(0, "We both know&I got this,&right!?&Let's go!!/%", "obj_titan_enemy_slash_Step_0_gml_1464_0");
            global.typer = 75;
            scr_heroblcon("susie");
        }
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            endingcon = 0;
            endingtimer = 0;
            talked = 1;
            talktimer = 0;
            susiesideaenabled = true;
            global.canact[myself][0] = 1;
            global.actname[myself][0] = stringsetloc("Susie's Idea", "obj_titan_enemy_slash_Step_0_gml_1491_0");
            global.actactor[myself][0] = 2;
            global.actdesc[myself][0] = "";
            scr_spellmenu_setup();
            
            with (obj_battlecontroller)
                scr_mnendturn();
            
            global.battlemsg[0] = newact_str;
        }
    }
}

if (global.myfight == 3)
{
    gersoncastanim = false;
    
    if (acting == 1 && actcon == 0 && !dualbusterenabled && !susiesideaenabled)
    {
        actcon = 1;
        
        if ((unleashed && drawstate != "defense end" && drawstate != "defense" && starshootcon > 0) || obj_titan_enemy.drawstate == "crack")
        {
            checkcount++;
            
            if (checkcount == 1)
            {
                msgsetloc(0, "* TITAN - AT 40 DF 0&* The fear of dark, which appears in many forms./", "obj_titan_enemy_slash_Step_0_gml_1525_0");
                scr_anyface_next("ralsei", 27);
                msgnextloc("\\EZ* Kris!! What are you doing!? Attack!!/", "obj_titan_enemy_slash_Step_0_gml_1527_0");
                msgnextloc("\\EZ* I'm... I'm sorry, but this is serious...!/%", "obj_titan_enemy_slash_Step_0_gml_1528_0");
            }
            else
            {
                msgsetloc(0, "* You wasted time looking at the Titan./%", "obj_titan_enemy_slash_Step_0_gml_1532_0");
            }
        }
        else if (phase > 6)
        {
            msgsetloc(0, "* TITAN - It seems capable of regenerating if not fatally wounded/%", "obj_titan_enemy_slash_Step_0_gml_1550_0");
        }
        else
        {
            msgsetloc(0, "* TITAN - AT 40 DF 800&* The fear of dark, which appears in many forms./", "obj_titan_enemy_slash_Step_0_gml_1537_0");
            
            if (global.tension >= 200)
            {
                msgnextloc("* The atmosphere feels tense...&* (You can use UNLEASH!)/%", "obj_titan_enemy_slash_Step_0_gml_1544_0");
            }
            else
            {
                msgnextloc("* Use ACTS to survive...&* Expose darkness to LIGHT... and gather COURAGE to gain TP./", "obj_titan_enemy_slash_Step_0_gml_1538_0");
                msgnextloc("* Then, use \"\\cYUNLEASH\\c0\" to reveal the WEAK POINT!/%", "obj_titan_enemy_slash_Step_0_gml_1539_0");
            }
        }
        
        scr_battletext_default();
    }
    
    if (acting == 1 && actcon == 0 && dualbusterenabled && !susiesideaenabled)
    {
        acting = 1.11;
        dualbusterused = true;
        msgsetloc(0, "* Your SOUL shone on the Old Man and Susie!/%", "obj_titan_enemy_slash_Step_0_gml_1549_0");
        scr_battletext_default();
        
        with (obj_titan_gerson_marker)
            scr_oflash();
        
        with (obj_herosusie)
            scr_oflash();
        
        with (obj_herokris)
            scr_oflash();
        
        snd_play(snd_boost);
        global.faceaction[1] = 2;
        heartanim = instance_create(obj_herokris.x + 30, obj_herokris.y + 50, obj_animation);
        
        with (heartanim)
        {
            depth = -20;
            image_index = 0;
            image_xscale = 2;
            image_yscale = 2;
            image_speed = 1;
            sprite_index = spr_soulshining;
        }
    }
    
    if (acting == 1.11 && actcon == 0 && !i_ex(obj_writer))
    {
        attack = instance_create(obj_herosusie.x, obj_herosusie.y, obj_rudebuster_anim);
        attack.damage = 1450 + irandom(100);
        attack.star = 0;
        attack.caster = 1;
        attack.target = global.monsterinstance[0];
        attack.dualbuster = true;
        attack.sprite_index = spr_susie_dualbuster;
        scr_battle_sprite_reset("susie");
        acting = 1.12;
    }
    
    if (acting == 1.12 && actcon == 0)
    {
        endingtimer++;
        
        if (endingtimer >= 90)
        {
            global.battlemsg[0] = newact_str;
            acting = 0;
            actcon = 1;
            endingtimer = 0;
            myattackchoice = 15;
        }
    }
    
    if (acting == 1 && actcon == 0 && susiesideaenabled)
    {
        msgsetsubloc(0, "* Press ~1 to throw!", scr_get_input_name(4), "obj_titan_enemy_slash_Step_0_gml_1600_0");
        scr_battletext_default();
        
        with (obj_herokris)
            visible = 0;
        
        with (obj_herosusie)
            visible = 0;
        
        throwsus = instance_create(obj_herosusie.x, obj_herosusie.y, obj_titan_throwkris);
        acting = 1.21;
        endingtimer = 0;
        snd_play(snd_grab);
    }
    else if (acting == 1.21 && actcon == 0)
    {
        endingtimer++;
        
        if (button1_p() && endingtimer >= 15)
        {
            with (obj_writer)
                instance_destroy();
            
            with (obj_titan_throwkris)
                instance_destroy();
            
            with (obj_herosusie)
                visible = 1;
            
            scr_battle_sprite_set("susie", 857, 0, 0);
            obj_herosusie.x += 14;
            obj_herosusie.y -= 40;
            snd_free_all();
            snd_play_x(snd_grab, 1, 0.7);
            msgsetloc(0, "... Nah screw it!/%", "obj_titan_enemy_slash_Step_0_gml_1627_0");
            global.typer = 75;
            scr_heroblcon("susie");
            acting = 1.22;
            endingtimer = 0;
        }
    }
    else if (acting == 1.22 && actcon == 0)
    {
        endingtimer++;
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            msgsetloc(0, "Get dunked on!!!/%", "obj_titan_enemy_slash_Step_0_gml_1643_0");
            global.typer = 75;
            scr_heroblcon("susie");
            acting = 1.23;
            endingtimer = 0;
        }
    }
    
    if (acting == 1.23 && actcon == 0)
    {
        endingtimer++;
        
        if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            acting = 1.24;
            endingtimer = 0;
        }
    }
    
    if (acting == 1.24 && actcon == 0)
    {
        endingtimer++;
        
        if (endingtimer == 1)
        {
            snd_play(snd_cymbal_reverse);
            scr_battle_sprite_set("susie", 5379, 0, 0);
            obj_herosusie.hspeed = 0;
            obj_herosusie.x -= 8;
            obj_herosusie.y -= 6;
        }
        
        if (endingtimer == 14)
        {
        }
        
        if (endingtimer == 24)
        {
            slowdowncon = 1;
            snd_play_x(snd_jump, 0.7, 0.8);
            instance_create_depth(obj_herosusie.x, obj_herosusie.y, obj_heroralsei.depth + 1, obj_titan_susiekris_jump);
            
            with (obj_herosusie)
                x -= 10000;
            
            instance_create(camerax() - 200, cameray() - 200, obj_titan_end_black_fade);
        }
        
        if (endingtimer == 61)
        {
            __fadeouter = instance_create(camerax() + 40, cameray() - 200, obj_fadeout);
            __fadeouter.fadespeed = 0.015;
            __fadeouter.depth = -9999998;
            __fadeouter.image_blend = c_white;
            __fadeouter.length = 99999;
            mus_volume(oldmus[1], 0, 100);
            snd_pitch_time(oldmus[1], 0.5, 200);
            acting = 1.25;
            endingtimer = 0;
            
            with (obj_border_controller)
                hide_border(0.025);
        }
    }
    
    if (acting == 1.25 && actcon == 0)
    {
        endingtimer++;
        
        if (endingtimer == 100)
        {
            __fadeouter = instance_create(camerax() + 40, cameray() - 200, obj_fadeout);
            __fadeouter.fadespeed = 0.01;
            __fadeouter.depth = -9999999;
            __fadeouter.image_blend = c_black;
            __fadeouter.length = 99999;
        }
        
        if (endingtimer == 210)
        {
            scr_losechar();
            room_goto(room_dw_churchc_insidetitan);
        }
    }
    
    if (acting == 2 && actcon == 0)
    {
        actcon = 1;
        msgsetloc(0, "* Your SOUL shone brighter!/%", "obj_titan_enemy_slash_Step_0_gml_1734_0");
        scr_battletext_default();
        brighten = 1;
        light_radius = 63;
        
        with (obj_heroralsei)
            scr_oflash();
        
        with (obj_herosusie)
            scr_oflash();
        
        with (obj_herokris)
            scr_oflash();
        
        snd_play(snd_boost);
        heartanim = instance_create(obj_herokris.x + 30, obj_herokris.y + 50, obj_animation);
        
        with (heartanim)
        {
            depth = -20;
            image_index = 0;
            image_xscale = 2;
            image_yscale = 2;
            image_speed = 1;
            sprite_index = spr_soulshining;
        }
    }
    
    if (acting == 3 && actcon == 0)
    {
        global.msg[0] = stringsetloc("* Your SOUL shined its power on RALSEI and SUSIE!/%", "obj_titan_enemy_slash_Step_0_gml_1759_0");
        scr_battletext_default();
        actcon = 20;
        acttimer = 0;
    }
    
    if (actcon == 20)
    {
        acttimer += 1;
        
        if (acttimer >= 10 || !instance_exists(obj_writer))
        {
            acttimer = 0;
            actcon = 21;
        }
    }
    
    if (actcon == 21)
    {
        scr_battle_sprite_set("susie", 5533, 1/3, 0);
        
        with (obj_herosusie)
        {
            x -= 28;
            y -= 25;
        }
        
        global.faceaction[1] = 2;
        global.faceaction[2] = 2;
        global.charaction[2] = 2;
        global.charspecial[2] = 6;
        global.chartarget[2] = 0;
        global.acting[2] = 0;
        snd_play(snd_boost);
        heartanim = instance_create(obj_herokris.x + 30, obj_herokris.y + 50, obj_animation);
        
        with (heartanim)
        {
            depth = -20;
            image_index = 0;
            image_xscale = 2;
            image_yscale = 2;
            image_speed = 1;
            sprite_index = spr_soulshining;
        }
        
        with (obj_heroralsei)
            scr_oflash();
        
        with (obj_herosusie)
            scr_oflash();
        
        with (obj_herokris)
            scr_oflash();
        
        actcon = 22;
    }
    
    if (actcon == 22)
    {
        acttimer += 1;
        
        if (acttimer >= 20)
        {
            with (obj_heroralsei)
                state = 0;
            
            scr_battle_sprite_set("susie", 3129, 1/3, 1);
            global.faceaction[1] = 2;
            actcon = 1;
            dualhealcon = 1;
        }
    }
    
    if (acting == 4 && actcon == 0)
    {
        if (unleashed)
        {
            var str5 = stringsetloc("\\EZ* Kris!! What are you doing!? Attack!!/", "obj_titan_enemy_slash_Step_0_gml_1527_0");
            scr_speaker("ralsei");
            msgset(0, str5 + "%");
            scr_battletext();
            acting = 0;
            actcon = 1;
        }
        else
        {
            msgsetloc(0, "* Your SOUL emitted a brilliant light!/%", "obj_titan_enemy_slash_Step_0_gml_1817_0");
            scr_battletext_default();
            acting = 4.1;
            turnswithoutunleash = 0;
            tensionscaling = 1;
            justusedunleash = true;
            unleashcount++;
        }
    }
    
    if (acting == 4.1 && actcon == 0 && !i_ex(obj_writer))
    {
        acting = 4.2;
        
        with (obj_herokris)
            scr_oflash();
        
        instance_create(obj_herokris.x + 30, obj_herokris.y + 50, obj_purify_event);
    }
    
    if (acting == 4.2 && actcon == 0 && !i_ex(obj_purify_event))
    {
        unleashed = true;
        
        if (phase == 1)
        {
            phase = 2;
        }
        else if (phase == 2)
        {
            phase = 4;
        }
        else if (phase == 3)
        {
            phase = 4;
        }
        else if (phase == 4)
        {
            phase = 6;
            
            if (drawstate == "defense" || drawstate == "defense end")
                drawstate = "undefense";
        }
        else if (phase == 5)
        {
            phase = 6;
            
            if (drawstate == "defense" || drawstate == "defense end")
                drawstate = "undefense";
        }
        else if (phase == 6)
        {
            phase = 6;
            
            if (drawstate == "defense" || drawstate == "defense end")
                drawstate = "undefense";
        }
        
        if (phase == 6)
        {
            global.canact[myself][3] = 0;
            global.actname[myself][3] = "";
            global.actactor[myself][3] = 0;
            scr_spellmenu_setup();
        }
        
        phaseturn = 1;
        event_user(0);
        phaseturn = 0;
        acting = 0;
        actcon = 1;
    }
    
    if (actingsus == 1 && actconsus == 1)
    {
        sactcount++;
        var _str = "";
        
        if (sactcount > 1)
            _str = "%";
        
        msgsetsubloc(0, "* Susie used Wake Up!/~1", _str, "obj_titan_enemy_slash_Step_0_gml_1864_0");
        
        if (sactcount == 1)
            msgnextloc("* Hey, dumbass! Get up!/%", "obj_titan_enemy_slash_Step_0_gml_1865_0");
        
        scr_battletext_default();
        actingsus = 2;
    }
    
    if (actingsus == 2 && actconsus == 1 && !i_ex(obj_writer))
    {
        scr_battle_sprite_set("susie", 1612, 1/3, 0);
        snd_play(snd_smallswing);
        snd_play(snd_damage);
        actingsus = 3;
        alarm[4] = 15;
        attack = instance_create(obj_herokris.x + 30, obj_herokris.y + 40, obj_animation);
        attack.sprite_index = spr_attack_slap1_purple;
        attack.maxindex = 4;
        attack.image_speed = 0.5;
        
        with (obj_herokris)
            scr_shakeobj();
    }
    
    if (actingsus == 3 && actconsus == 1 && con == 1)
    {
        scr_battle_sprite_reset("susie");
        
        if (global.hp[1] <= 0)
        {
            var starthp = global.hp[1];
            star = 0;
            reviveamt = abs(global.hp[1]) + 1;
            scr_healitemspell(reviveamt);
            global.hp[1] = 1;
            
            with (obj_dmgwriter)
            {
                if (type == 3 && delay == 8)
                    damage = abs(starthp - global.hp[1]);
            }
            
            actingsus = 0;
            actcon = 1;
        }
        else
        {
            msgsetloc(0, "* (But, Kris wasn't DOWNed...)/%", "obj_titan_enemy_slash_Step_0_gml_1904_0");
            scr_battletext_default();
            actingsus = 4;
        }
    }
    
    if (actingsus == 4 && actconsus == 1 && !i_ex(obj_writer))
    {
        actingsus = 0;
        actcon = 1;
    }
    
    if (actingral == 1 && actconral == 1)
    {
        ractcount++;
        msgsetloc(0, "* Ralsei used Reviver!/%", "obj_titan_enemy_slash_Step_0_gml_1919_0");
        scr_battletext_default();
        actingral = 2;
    }
    
    if (actingral == 2 && actconral == 1 && !i_ex(obj_writer))
    {
        scr_battle_sprite_set("ralsei", 1679, 0.5, 0);
        actingral = 2.5;
        instance_create(obj_herokris.x, obj_herokris.y, obj_ralsei_cherub);
    }
    
    if (actingral == 2.5)
    {
        racttimer++;
        
        if (racttimer == 58)
        {
            racttimer = 0;
            actingral = 3;
        }
    }
    
    if (actingral == 3 && actconral == 1)
    {
        var starthp = global.hp[1];
        star = 0;
        reviveamt = ceil(global.maxhp[1]) + abs(ceil(global.maxhp[1] / 3));
        ha = scr_healitemspell(reviveamt);
        
        if (starthp <= 0)
            global.hp[1] = ceil(global.maxhp[1] / 3);
        else
            global.hp[1] = starthp + ceil(global.maxhp[1] * 0.5);
        
        if (global.hp[1] > global.maxhp[1])
        {
            global.hp[1] = global.maxhp[1];
            
            with (obj_dmgwriter)
            {
                if (type == 3 && delay == 8 && mercytimer == 0)
                    specialmessage = 3;
            }
        }
        else
        {
            with (obj_dmgwriter)
            {
                if (type == 3 && delay == 8 && mercytimer == 0)
                    specialmessage = 0;
            }
        }
        
        with (obj_dmgwriter)
        {
            if (type == 3 && delay == 8 && mercytimer == 0)
                damage = abs(starthp - global.hp[1]);
        }
        
        actingral = 0;
        actcon = 1;
    }
    
    if (actcon == 20 || actconsus == 20 || actconral == 20)
    {
        if (scr_terminate_writer())
        {
            actconsus = -1;
            actconral = -1;
            actcon = 1;
        }
    }
    
    if (actcon == 1 && !instance_exists(obj_writer))
    {
        if (dualhealcon == 1)
            dualhealcon = 2;
        
        scr_nextact();
    }
}

if (dualhealcon == 2)
{
    dealhealtimer++;
    
    if (dealhealtimer >= 30)
    {
        dealhealtimer = 0;
        dualhealcon = 0;
        scr_battle_sprite_reset("susie");
        obj_herosusie.x = obj_herosusie.xstart;
        obj_herosusie.y = obj_herosusie.ystart;
    }
}

if (state == 3)
{
    scr_enemy_hurt();
    
    if (hurttimer == 29)
    {
        with (obj_border_controller)
            trigger_event("titan_hurt");
    }
}

if (acting == 20 || acting == 21 || acting == 22)
{
}

if (obj_heroralsei.thissprite == spr_ralsei_spell && obj_herosusie.state == 8 && obj_heroralsei.image_index == 3)
    scr_battle_sprite_set("susie", 1755, 1/3, 0);

if (obj_herosusie.sprite_index == spr_susie_heal_end && obj_herosusie.image_index > 13)
{
    scr_battle_sprite_reset("susie");
    obj_herosusie.x = obj_herosusie.xstart;
    obj_herosusie.y = obj_herosusie.ystart;
}

if (gerson.sprite_index == spr_gerson_rudebuster_ready && global.charturn == 0)
{
    scr_battle_sprite_reset("susie");
    gerson.sprite_index = spr_gerson_idle;
    gerson.image_index = 0;
    gerson.x = camerax() + 108.7;
    gerson.y = cameray() + 253.17;
    gersoncastanim = false;
}

if (gerson.sprite_index == spr_gerson_item && gerson.image_index == 8)
    event_user(1);

if (gerson.sprite_index == spr_gerson_item && gerson.image_index >= 13)
    gerson.sprite_index = spr_gerson_idle;

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
