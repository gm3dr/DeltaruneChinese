if (init == 0)
{
    global.charturn = 3;
    init = 1;
    healthprev = global.monsterhp[myself];
}

global.monstercomment[myself] = "";
var disgustingstr = stringsetloc("Disgusting./%", "obj_holywatercooler_enemy_slash_Step_0_gml_10_0");

if (amimissmizzle == true)
{
    sprite_index = spr_mizzle_idle_large;
    
    if (global.monsterstatus[myself] == 1)
        idlesprite = spr_mizzle_idle_large;
    else
        idlesprite = spr_mizzle_alarm_large;
    
    if (global.mercymod[myself] >= 100)
    {
        if (global.monsterstatus[myself] == 1)
            idlesprite = spr_mizzle_idle_large_pink;
        else
            idlesprite = spr_mizzle_alarm_large_pink;
        
        hurtsprite = spr_mizzle_hurt_large_pink;
    }
    
    sparedsprite = idlesprite;
}

if (global.monster[myself] == 1)
{
    if (introcon == 1)
    {
        introtimer++;
        
        if (introtimer == 1)
        {
            msgsetloc(0, "... What?&A battle?/%", "obj_holywatercooler_enemy_slash_Step_0_gml_36_0");
            global.typer = 50;
            balloon = scr_enemyblcon(x, global.monstery[myself] - 20, 10);
        }
        
        if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            introcon = 2;
            introtimer = 0;
            msgsetloc(0, "I merely wanted to&investigate the water&container.../%", "obj_holywatercooler_enemy_slash_Step_0_gml_47_0");
            global.typer = 50;
            balloon = scr_enemyblcon(x, global.monstery[myself] - 20, 10);
        }
    }
    
    if (introcon == 2)
    {
        introtimer++;
        
        if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            introcon = 3;
            introtimer = 0;
            msgsetloc(0, "And suddenly,&you have drawn&me into a battle?/%", "obj_holywatercooler_enemy_slash_Step_0_gml_63_0");
            global.typer = 50;
            balloon = scr_enemyblcon(x, global.monstery[myself] - 20, 10);
        }
    }
    
    if (introcon == 3)
    {
        introtimer++;
        
        if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            introcon = 4;
            introtimer = 0;
            msgsetloc(0, "You are brash,&young soldier!&If you seek&my love.../%", "obj_holywatercooler_enemy_slash_Step_0_gml_79_0");
            global.typer = 50;
            balloon = scr_enemyblcon(x, global.monstery[myself] - 20, 10);
        }
    }
    
    if (introcon == 4)
    {
        introtimer++;
        
        if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            introcon = 5;
            introtimer = 0;
            msgsetloc(0, "You must prove&yourself worthy&of a princess./%", "obj_holywatercooler_enemy_slash_Step_0_gml_94_0");
            global.typer = 50;
            balloon = scr_enemyblcon(x, global.monstery[myself] - 20, 10);
        }
    }
    
    if (introcon == 5)
    {
        introtimer++;
        
        if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            introcon = 0;
            introtimer = 0;
            global.charturn = 0;
        }
    }
    
    if (scr_isphase("enemytalk") && talked == 0 && transformationcon == 0 && introcon == 0)
    {
        scr_randomtarget();
        
        if (!hurtinit)
        {
            hurtinit = true;
            
            if (healthprev != global.monsterhp[myself])
                gothurtlastturn = true;
            else
                gothurtlastturn = false;
            
            healthprev = global.monsterhp[myself];
        }
        
        hurtinit = false;
        
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        
        global.typer = 50;
        rr++;
        
        if (amimissmizzle == false && global.mercymod[myself] >= 60)
        {
            msgsetloc(0, "Ah! What is this?&The chamber can&no longer hold me./%", "obj_holywatercooler_enemy_slash_Step_0_gml_133_0");
            ballooncon = 11;
            balloonend = 0;
        }
        else if (gothurtlastturn == true && amimissmizzle == false)
        {
            violenceturn++;
            
            if (violenceturn == 1)
            {
                msgsetloc(0, "Oh, you brutes!&You scoundrels!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_137_0");
                ballooncon = 1;
                balloonend = 0;
            }
            else if (violenceturn == 2)
            {
                msgsetloc(0, "What? You treat me&like an egg, that&you should break me,/%", "obj_holywatercooler_enemy_slash_Step_0_gml_138_0");
                ballooncon = 3;
                balloonend = 0;
            }
            else if (violenceturn == 3)
            {
                msgset(0, disgustingstr);
                ballooncon = 0;
                balloonend = 1;
            }
            else if (violenceturn == 4)
            {
                msgsetloc(0, "What have you done?&You have broken my&chamber!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_140_0");
                ballooncon = 6;
                balloonend = 0;
            }
            
            scr_enemyblcon(x, global.monstery[myself] - 20, 10);
        }
        else if (amimissmizzle == false && acttalked == false)
        {
            var random_vowel = /*choose("a", "e", "i", "o", "u", "u", "oo")*/choose("叭", "哔", "卟", "呗", "啵");
            
            if (global.lang == "ja")
                random_vowel = choose("パ", "ピ", "プ", "ぺ");
            
            if (rr == 1)
                msgsetloc(0, "Buble", "obj_holywatercooler_enemy_slash_Step_0_gml_145_0");
            else
                msgsetsubloc(0, "B~1b~2e", random_vowel, /*choose("i", "l")*/choose("卟", "啵"), "obj_holywatercooler_enemy_slash_Step_0_gml_146_0");
            
            global.msg[0] += "/%";
            scr_enemyblcon(x, global.monstery[myself] - 20, 10);
        }
        else if (acttalked == false)
        {
            msgsetloc(0, "Glory, glory./%", "obj_holywatercooler_enemy_slash_Step_0_gml_151_0");
            scr_enemyblcon(x, global.monstery[myself] - 20, 10);
        }
        
        acttalked = false;
        
        if (ballooncon == 0)
        {
            talked = 0.5;
            talktimer = 0;
        }
        else
        {
            talked = 0.6;
            talktimer = 0;
        }
        
        talktimer = 0;
        rtimer = 0;
    }
    
    if (talked == 0.5)
    {
        talktimer++;
        
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            alarm[6] = 1;
        }
    }
    
    if (talked == 0.6)
    {
        talktimer++;
        
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            if (ballooncon == 1)
            {
                msgsetloc(0, "Those who seek to&conquer hearts by&force shall find no&pure tincture,/%", "obj_holywatercooler_enemy_slash_Step_0_gml_190_0");
                ballooncon = 2;
                balloonend = 0;
            }
            else if (ballooncon == 2)
            {
                msgsetloc(0, "But instead a bitter&poison, of gnashing&teeth and regret./%", "obj_holywatercooler_enemy_slash_Step_0_gml_191_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 3)
            {
                msgsetloc(0, "To reveal some hidden&beauty in gold and&softened ivory./%", "obj_holywatercooler_enemy_slash_Step_0_gml_193_0");
                ballooncon = 4;
                balloonend = 0;
            }
            else if (ballooncon == 4)
            {
                msgsetloc(0, "Nay, for love is&made of eggshells,/%", "obj_holywatercooler_enemy_slash_Step_0_gml_194_0");
                ballooncon = 5;
                balloonend = 0;
            }
            else if (ballooncon == 5)
            {
                msgsetloc(0, "And should your love&be true, you would&already know what&lies inside./%", "obj_holywatercooler_enemy_slash_Step_0_gml_195_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 6)
            {
                msgsetloc(0, "Now I will seem as&all the others.../%", "obj_holywatercooler_enemy_slash_Step_0_gml_197_0");
                ballooncon = 7;
                balloonend = 0;
            }
            else if (ballooncon == 7)
            {
                msgsetloc(0, "Oh, young soldiers,&how cruel you are,&that in your quest&to make me yours,/%", "obj_holywatercooler_enemy_slash_Step_0_gml_198_0");
                ballooncon = 8;
                balloonend = 0;
            }
            else if (ballooncon == 8)
            {
                msgsetloc(0, "You would reduce&me to this terrible&state.../%", "obj_holywatercooler_enemy_slash_Step_0_gml_199_0");
                ballooncon = 9;
                balloonend = 0;
            }
            else if (ballooncon == 9)
            {
                msgsetloc(0, "...&Goodbye.../%", "obj_holywatercooler_enemy_slash_Step_0_gml_200_0");
                ballooncon = 0;
                balloonend = 1;
                turnintomizzle = 1;
            }
            else if (ballooncon == 11)
            {
                msgsetloc(0, "It seems your affection&has caused some change&in my form.../%", "obj_holywatercooler_enemy_slash_Step_0_gml_202_0");
                ballooncon = 12;
                balloonend = 0;
            }
            else if (ballooncon == 12)
            {
                msgsetloc(0, "Ah, it's breaking!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_203_0");
                ballooncon = 0;
                balloonend = 1;
                turnintomizzle = 1;
            }
            
            talked = 0.7;
            global.typer = 50;
            scr_enemyblcon(x, global.monstery[myself] - 20, 10);
            ralseitalks = 0;
            susietalks = 0;
            
            if (ballooncon == 0)
            {
                talked = 0.5;
                talktimer = 0;
            }
            else
            {
                talked = 0.6;
                talktimer = 0;
            }
            
            alarm[6] = 1;
        }
    }
    
    if (talked == 1 && scr_isphase("enemytalk") && transformationcon == 0 && amimissmizzle == false && turnintomizzle == 1 && !i_ex(obj_writer))
        transformationcon = 1;
    
    if (talked == 1 && scr_isphase("enemytalk") && transformationcon == 0 && !i_ex(obj_writer))
        global.mnfight = 1.5;
    
    if (global.mnfight == 1.5)
    {
        if (!begformercyskip)
        {
            if (!instance_exists(obj_growtangle))
                instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 170, obj_growtangle);
            
            instance_create(obj_growtangle.x - 10, obj_growtangle.y + 18, obj_heartmarker);
            
            if (!instance_exists(obj_moveheart))
                scr_moveheart();
            
            with (obj_heartmarker)
                instance_destroy();
        }
        
        global.mnfight = 2;
        scr_turntimer(200);
        
        if (amimissmizzle == true)
            scr_turntimer(260);
    }
    
    if (scr_isphase("bullets") && attacked == 0)
    {
        rtimer += 1;
        
        if (rtimer == 12)
        {
            if (!begformercyskip)
            {
                if (amimissmizzle == false)
                {
                    global.monsterattackname[myself] = "Rain";
                    dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                    dc.type = 135;
                    dc.special = 0;
                    
                    if (turns > 1 && (turns % 2) == 0)
                        dc.special = 1;
                    else if (turns > 1)
                        dc.special = 2;
                }
                else
                {
                    global.monsterattackname[myself] = "holywaterC";
                    dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                    dc.type = 471;
                    dc.special = difficulty;
                }
            }
            
            scr_turntimer(140);
            
            if (begformercyskip)
            {
                begformercyskip = false;
                global.turntimer = 1;
            }
            
            attackanim = true;
            turns += 1;
            noballoon = false;
            global.typer = 6;
            global.fc = 0;
            rr = choose(0, 1, 2, 3, 4);
            
            if (!amimissmizzle)
            {
                if (rr == 0)
                    global.battlemsg[0] = stringsetloc("* You feel a strong presence from the watercooler.", "obj_holywatercooler_enemy_slash_Step_0_gml_295_0");
                
                if (rr == 1)
                    global.battlemsg[0] = stringsetloc("* The watercooler babbles to itself sesquipedalianarily.", "obj_holywatercooler_enemy_slash_Step_0_gml_296_0");
                
                if (rr == 2)
                    global.battlemsg[0] = stringsetloc("* The watercooler considers the precise gemstone to compare its own hue to.", "obj_holywatercooler_enemy_slash_Step_0_gml_297_0");
                
                if (rr == 3)
                    global.battlemsg[0] = stringsetloc("* The watercooler stays its breath, too precious to waste... and keeps talking.", "obj_holywatercooler_enemy_slash_Step_0_gml_298_0");
                
                if (rr == 4)
                    global.battlemsg[0] = stringsetloc("* The watercooler emits an aura of magnanimous condescension.", "obj_holywatercooler_enemy_slash_Step_0_gml_299_0");
                
                if (random(100) < 4)
                    global.battlemsg[0] = stringsetloc("* Smells like water with holes in it.", "obj_holywatercooler_enemy_slash_Step_0_gml_300_0");
            }
            else
            {
                rr = choose(0, 1, 2);
                
                if (rr == 0)
                    global.battlemsg[0] = stringsetloc("* You hear the sound of raindrops.", "obj_holywatercooler_enemy_slash_Step_0_gml_304_0");
                
                if (rr == 1)
                    global.battlemsg[0] = stringsetloc("* You hear a distant thunder.", "obj_holywatercooler_enemy_slash_Step_0_gml_305_0");
                
                if (rr == 2)
                    global.battlemsg[0] = stringsetloc("* Waves crash far, far, far below.", "obj_holywatercooler_enemy_slash_Step_0_gml_306_0");
                
                if (random(100) < 4)
                    global.battlemsg[0] = stringsetloc("* Smells like a rainstorm.", "obj_holywatercooler_enemy_slash_Step_0_gml_307_0");
            }
            
            attacked = 1;
        }
    }
    
    if (global.mnfight == 2 && global.turntimer > 1)
    {
    }
}

if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        
        if (amimissmizzle == false)
        {
            msgsetloc(0, "* HOLYWATERCOOLER - Just seems like a Watercooler with an ego./%", "obj_holywatercooler_enemy_slash_Step_0_gml_334_0");
            scr_battletext_default();
        }
        else
        {
            msgsetloc(0, "* MISS MIZZLE - A Mizzle transformed with affection./%", "obj_holywatercooler_enemy_slash_Step_0_gml_339_0");
            scr_battletext_default();
        }
    }
    
    if (!hurtinit)
    {
        if (healthprev != global.monsterhp[myself])
            gothurtlastturn = true;
        else
            gothurtlastturn = false;
        
        healthprev = global.monsterhp[myself];
    }
    
    if (!amimissmizzle)
    {
        if (acting == 2 && actcon == 0)
        {
            flirtcount++;
            acttalked = true;
            msgsetloc(0, "* You FLIRTED with HolyWatercooler!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_359_0");
            scr_battletext_default();
            acting = 2.1;
        }
        
        if (acting == 2.1 && actcon == 0 && !i_ex(obj_writer))
        {
            msgsetloc(0, "Romantic are&your words.../%", "obj_holywatercooler_enemy_slash_Step_0_gml_367_0");
            acting = 0.6;
            
            if (previouslyflirted && flirtcount == 1)
                ballooncon = 1;
            
            if (!previouslyflirted && flirtcount == 1)
                ballooncon = 5;
            
            if (flirtcount == 2)
                ballooncon = 6;
            
            if (flirtcount == 3 || (previouslyflirted && flirtcount == 2))
            {
                failedflirting = true;
                msgset(0, disgustingstr);
                ballooncon = 0;
                balloonend = 1;
                actcon = 1;
                acting = 0;
                scr_mercyadd(myself, 5);
            }
            
            if (flirtcount > 3 || (previouslyflirted && flirtcount > 2))
            {
                failedflirting = true;
                msgset(0, disgustingstr);
                ballooncon = 0;
                balloonend = 1;
                actcon = 1;
                acting = 0;
            }
            
            global.typer = 50;
            scr_enemyblcon(x, global.monstery[myself] - 20, 10);
        }
        
        if (acting == 3 && actcon == 0)
        {
            begformercycount++;
            acttalked = true;
            msgsetloc(0, "* You begged for mercy.../%", "obj_holywatercooler_enemy_slash_Step_0_gml_402_0");
            scr_battletext_default();
            acting = 0.6;
            
            if (begformercycount == 1)
                ballooncon = 12;
            
            if (begformercycount == 2)
                ballooncon = 14;
            
            if (begformercycount == 3)
                ballooncon = 19;
            
            if (begformercycount > 3)
                ballooncon = 19.5;
        }
        
        if (acting == 4 && actcon == 0)
        {
            chatcount++;
            acttalked = true;
            var chatstring = stringsetloc("* Everyone chatted around the Watercooler!/", "obj_holywatercooler_enemy_slash_Step_0_gml_417_0");
            acting = 0.6;
            
            if (chatcount == 1)
            {
                msgset(0, chatstring + "%");
                ballooncon = 20;
            }
            
            if (chatcount == 2)
            {
                msgset(0, chatstring);
                msgnextloc("* (Seems like you should choose a topic...)/%", "obj_holywatercooler_enemy_slash_Step_0_gml_429_0");
                ballooncon = 23;
                balloonend = 0;
            }
            
            if (chatcount > 2)
            {
                msgset(0, chatstring);
                msgnextloc("* (Everyone talked around the watercooler, explicitly about watercoolers!)/%", "obj_holywatercooler_enemy_slash_Step_0_gml_437_0");
                ballooncon = 0;
                balloonend = 1;
                actcon = 1;
                acting = 0;
                
                if (chatcount == 3)
                    scr_mercyadd(myself, 12);
            }
            
            scr_battletext_default();
        }
    }
    
    if (amimissmizzle)
    {
        if (acting == 2 && actcon == 0)
        {
            acting = 2.1;
            timer = 0;
            msgsetloc(0, "* You DAZZLEd MISS MIZZLE!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_456_0");
            scr_battletext_default();
        }
        
        if (acting == 2.1 && actcon == 0)
        {
            timer++;
            
            if (timer == 1)
                scr_battle_sprite_set("kris", 1493, 1, 1);
            
            if (timer == 1)
                snd_play_x(snd_bell_bounce_short, 1, 1);
            
            if (timer == 11)
                snd_play_x(snd_bell_bounce_short, 1, 1.1);
            
            if (timer == 21)
                snd_play_x(snd_bell_bounce_short, 1, 1.2);
            
            if (timer == 23)
            {
                repeat (6)
                    instance_create_depth(obj_herokris.x + 40, obj_herokris.y + 20 + irandom(40), obj_herokris.depth + 1, obj_dazzle_particle);
            }
            
            if (timer >= 30)
            {
                timer = 0;
                actcon = 1;
                scr_mercyadd(myself, 8);
                scr_battle_sprite_reset("kris");
            }
        }
        
        if (acting == 3 && actcon == 0)
        {
            msgsetloc(0, "* Susie EMBEZZLED an item!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_490_0");
            scr_battletext_default();
            scr_battle_sprite_set("susie", 738, 1, 1);
            obj_herosusie.vspeed = -40;
            snd_play(snd_jump);
            acting = 3.1;
        }
        
        if (acting == 3.1 && actcon == 0)
        {
            timer++;
            
            if (timer == 20)
            {
                obj_herosusie.x = x + 20;
                obj_herosusie.y = cameray() - 100;
                obj_herosusie.vspeed = 30;
                obj_herosusie.depth = depth - 1;
            }
            
            if ((obj_herosusie.y + obj_herosusie.vspeed) > (y - 10) && timer > 20)
            {
                obj_herosusie.y = y - 10;
                obj_herosusie.vspeed = 0;
                snd_play(snd_bump);
                scr_battle_sprite_set("susie", 1210, 0, 1);
                scr_shakeobj();
                
                with (obj_herosusie)
                    scr_shakeobj();
                
                timer = 0;
                acting = 3.3;
            }
        }
        
        if (acting == 3.3 && actcon == 0)
        {
            scr_itemcheck_pocket(0);
            
            if (havestolenbefore)
            {
                snd_play(snd_cantselect);
                msgsetloc(0, "* But, there was nothing to steal!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_538_0");
            }
            else if (scr_inventoryspace() == 0 && itemcount == 0)
            {
                snd_play(snd_cantselect);
                msgsetloc(0, "* But, your items are full!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_543_0");
            }
            else if (irandom(100) < 65)
            {
                snd_play(snd_cantselect);
                msgsetloc(0, "* But, she failed!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_548_0");
            }
            else
            {
                havestolenbefore = true;
                snd_play(snd_item);
                msgsetloc(0, "* Stole BitterTear!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_554_0");
                scr_itemget_anytype(63, "item");
            }
            
            acting = 3.4;
            timer = 0;
            scr_mercyadd(myself, 8);
        }
        
        if (acting == 3.4 && actcon == 0)
        {
            timer++;
            
            if (timer == 20)
            {
                obj_herosusie.vspeed = -30;
                scr_battle_sprite_set("susie", 738, 1, 1);
                snd_stop(snd_jump);
                snd_play(snd_jump);
            }
            
            if (timer == 30)
            {
                obj_herosusie.x = obj_herosusie.xstart;
                obj_herosusie.vspeed = 30;
            }
            
            if (timer > 30 && (obj_herosusie.y + obj_herosusie.vspeed) > obj_herosusie.ystart)
            {
                obj_herosusie.vspeed = 0;
                obj_herosusie.x = obj_herosusie.xstart;
                obj_herosusie.y = obj_herosusie.ystart;
                scr_battle_sprite_reset("susie");
                
                with (obj_herosusie)
                    scr_shakeobj();
                
                snd_play(snd_bump);
                acting = 3.5;
                timer = 0;
            }
        }
        
        if (acting == 3.5 && actcon == 0 && !i_ex(obj_writer))
        {
            scr_battletext_default();
            acting = 3.6;
        }
        
        if (acting == 3.6 && actcon == 0 && !i_ex(obj_writer))
        {
            acting = 0;
            actcon = 1;
        }
        
        if (acting == 4 && actcon == 0)
        {
            msgsetloc(0, "* Ralsei NUZZLEd MISS MIZZLE!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_608_0");
            scr_battletext_default();
            acting = 4.1;
        }
        
        if (acting == 4.1 && actcon == 0)
        {
            timer++;
            
            if (timer == 1)
            {
                obj_heroralsei.x = x - 40;
                obj_heroralsei.y = y + 20;
                obj_heroralsei.depth = depth - 1;
                scr_battle_sprite_set("ralsei", 49, 2, 1);
                snd_play_x(snd_magicmarker, 1, 1);
            }
            
            if (timer < 31)
                obj_heroralsei.x += 0.1;
            
            if (timer > 31)
            {
                scr_battle_sprite_reset("ralsei");
                obj_heroralsei.x = obj_heroralsei.xstart;
                obj_heroralsei.y = obj_heroralsei.ystart;
                obj_heroralsei.image_xscale = 2;
                timer = 0;
                acting = 4.2;
            }
        }
        
        if (acting == 4.2 && actcon == 0 && !i_ex(obj_writer))
        {
            tiredcount++;
            
            if (tiredcount == 2)
                scr_monster_make_tired(myself);
            
            if (tiredcount == 1)
                msgsetloc(0, "* MISS MIZZLE got a little bit tired...!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_645_0");
            
            if (tiredcount > 1)
                msgsetloc(0, "* MISS MIZZLE became TIRED!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_646_0");
            
            scr_battletext_default();
            scr_mercyadd(myself, 8);
            actcon = 1;
        }
        
        if (acting == 5 && actcon == 0)
        {
            scr_battletext_default();
            acting = 5.1;
        }
        
        if (acting == 5.1 && actcon == 0 && !i_ex(obj_writer))
        {
            timer++;
            
            if (timer == 1)
            {
                with (obj_heroralsei)
                    x += 8;
                
                scr_battle_sprite_set("ralsei", 3261, 0.16666666666666666, 1);
                snd_play(snd_ralseising1);
            }
            
            if (timer == 61)
            {
                with (obj_herosusie)
                {
                    x -= 36;
                    y -= 12;
                }
                
                scr_battle_sprite_set("susie", 1092, 1, 1);
                snd_play(snd_suslaugh);
            }
            
            if (timer == 75)
            {
                scr_battle_sprite_set("ralsei", 2675, 1, 1);
                snd_stop(snd_ralseising1);
                
                with (obj_heroralsei)
                {
                    x += 10;
                    y += 10;
                    scr_shakeobj();
                }
            }
            
            if (timer > 120)
            {
                scr_battle_sprite_reset("ralsei");
                scr_battle_sprite_reset("susie");
                
                with (obj_herosusie)
                {
                    x = xstart;
                    y = ystart;
                }
                
                with (obj_heroralsei)
                {
                    x = xstart;
                    y = ystart;
                }
                
                timer = 0;
                acting = 5.2;
            }
        }
        
        if (acting == 5.2 && actcon == 0 && !i_ex(obj_writer))
        {
            scr_battletext_default();
            
            with (obj_monsterparent)
            {
                if (global.monsterstatus[myself] == 1)
                {
                    global.monsterstatus[myself] = 0;
                    global.monstercomment[myself] = "";
                    __tiredwriter = instance_create(global.monsterx[argument0], (global.monstery[argument0] - (global.hittarget[global.chartarget[argument0]] * 20)) + 20, obj_dmgwriter);
                    __tiredwriter.type = 14;
                    global.hittarget[global.chartarget[argument0]] += 1;
                    snd_play_x(snd_spellcast, 0.5, 1.2);
                    scr_mercyadd(myself, 50);
                }
                else
                {
                    scr_mercyadd(myself, 20);
                }
            }
            
            actcon = 1;
        }
    }
    
    if (acting == 0.5 && actcon == 0)
    {
        talktimer++;
        
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            alarm[7] = 1;
        }
    }
    
    if (acting == 0.6)
    {
        talktimer++;
        
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            if (ballooncon == 5.2)
            {
                if (global.choice == 0)
                {
                    ballooncon = 5.31;
                    balloonend = 0;
                }
                
                if (global.choice == 1)
                {
                    ballooncon = 5.41;
                    balloonend = 0;
                }
            }
            
            if (ballooncon == 23.11)
            {
                if (global.choice == 0)
                {
                    ballooncon = 23.21;
                    balloonend = 0;
                }
                
                if (global.choice == 1 && (flirtcount > 1 || failedflirting == true))
                {
                    ballooncon = 23.31;
                    balloonend = 0;
                }
                else if (global.choice == 1)
                {
                    ballooncon = 23.41;
                    balloonend = 0;
                }
                
                if (global.choice == 2)
                {
                    ballooncon = 23.51;
                    balloonend = 0;
                }
                
                if (global.choice == 3)
                {
                    ballooncon = 23.61;
                    balloonend = 0;
                }
            }
            
            if (ballooncon == 1)
            {
                msgsetloc(0, "Too romantic! Have&you FLIRTED with&another WaterCooler?/%", "obj_holywatercooler_enemy_slash_Step_0_gml_760_0");
                ballooncon = 2;
                balloonend = 0;
            }
            else if (ballooncon == 2)
            {
                msgsetloc(0, "Wipe your mouth&before you speak&with one as I,/%", "obj_holywatercooler_enemy_slash_Step_0_gml_761_0");
                ballooncon = 3;
                balloonend = 0;
            }
            else if (ballooncon == 3)
            {
                msgsetloc(0, "For your phrases,&soggy with&experience,/%", "obj_holywatercooler_enemy_slash_Step_0_gml_762_0");
                ballooncon = 4;
                balloonend = 0;
            }
            else if (ballooncon == 4)
            {
                msgsetloc(0, "Dribble like&shiny oil from&your lips./%", "obj_holywatercooler_enemy_slash_Step_0_gml_763_0");
                ballooncon = 0;
                balloonend = 1;
                scr_mercyadd(myself, 5);
            }
            else if (ballooncon == 5)
            {
                msgsetloc(0, "Young soldier,&your words are&sweet like honeydew.&Is it the first&time you have&spoken to a lady&such as I?/%", "obj_holywatercooler_enemy_slash_Step_0_gml_765_0");
                ballooncon = 5.1;
                balloonend = 0;
            }
            else if (ballooncon == 5.1)
            {
                global.choicemsg[0] = stringsetloc("#First time", "obj_holywatercooler_enemy_slash_Step_0_gml_768_0");
                global.choicemsg[1] = stringsetloc("I flirt#with everyone", "obj_holywatercooler_enemy_slash_Step_0_gml_769_0");
                ballooncon = 5.2;
                balloonend = 0;
                msgset(0, "\\C2 ");
            }
            else if (ballooncon == 5.31)
            {
                msgsetloc(0, "A young knight's&first love.../%", "obj_holywatercooler_enemy_slash_Step_0_gml_775_0");
                ballooncon = 5.32;
                balloonend = 0;
            }
            else if (ballooncon == 5.32)
            {
                msgsetloc(0, "No wellspring&may be so pure./%", "obj_holywatercooler_enemy_slash_Step_0_gml_776_0");
                ballooncon = 5.33;
                balloonend = 0;
            }
            else if (ballooncon == 5.33)
            {
                msgsetloc(0, "I shall accept your&affection from afar,/%", "obj_holywatercooler_enemy_slash_Step_0_gml_777_0");
                ballooncon = 5.34;
                balloonend = 0;
            }
            else if (ballooncon == 5.34)
            {
                msgsetloc(0, "And store it humbly&in a masonry jar./%", "obj_holywatercooler_enemy_slash_Step_0_gml_778_0");
                ballooncon = 5.35;
                balloonend = 0;
            }
            else if (ballooncon == 5.35)
            {
                msgsetloc(0, "On lonely eves, when&I hear naught&but the bubbling&of my heart,/%", "obj_holywatercooler_enemy_slash_Step_0_gml_779_0");
                ballooncon = 5.36;
                balloonend = 0;
            }
            else if (ballooncon == 5.36)
            {
                msgsetloc(0, "I should open it and&listen once more,/%", "obj_holywatercooler_enemy_slash_Step_0_gml_780_0");
                ballooncon = 5.37;
                balloonend = 0;
            }
            else if (ballooncon == 5.37)
            {
                msgsetloc(0, "To the tender whispers&of your kindness./%", "obj_holywatercooler_enemy_slash_Step_0_gml_781_0");
                ballooncon = 0;
                balloonend = 1;
                scr_mercyadd(myself, 20);
            }
            else if (ballooncon == 5.41)
            {
                msgsetloc(0, "You think then, that&I shall drink the words/%", "obj_holywatercooler_enemy_slash_Step_0_gml_783_0");
                ballooncon = 5.42;
                balloonend = 0;
            }
            else if (ballooncon == 5.42)
            {
                msgsetloc(0, "From those that would&flatter and cajole&and find them sweet?/%", "obj_holywatercooler_enemy_slash_Step_0_gml_784_0");
                ballooncon = 5.45;
                balloonend = 0;
            }
            else if (ballooncon == 5.45)
            {
                msgsetloc(0, "Nay! You would do well&to save such tangy powders&for a man or woman&of the tap./%", "obj_holywatercooler_enemy_slash_Step_0_gml_785_0");
                ballooncon = 0;
                balloonend = 1;
                scr_mercyadd(myself, 5);
                failedflirting = true;
            }
            else if (ballooncon == 6)
            {
                msgsetloc(0, "Young knight, your words&were accepted once before./%", "obj_holywatercooler_enemy_slash_Step_0_gml_787_0");
                ballooncon = 7;
                balloonend = 0;
            }
            else if (ballooncon == 7)
            {
                msgsetloc(0, "Already, they are&bottled up in a masonry jar,/%", "obj_holywatercooler_enemy_slash_Step_0_gml_788_0");
                ballooncon = 8;
                balloonend = 0;
            }
            else if (ballooncon == 8)
            {
                msgsetloc(0, "Where, aged with time,&they will one day&be opened in a far season&To blossom&with the whisper&of old grapes./%", "obj_holywatercooler_enemy_slash_Step_0_gml_789_0");
                ballooncon = 9;
                balloonend = 0;
            }
            else if (ballooncon == 9)
            {
                msgsetloc(0, "Continue babbling, and&the chalice shall overflow&into turbulence,&and lose all meaning./%", "obj_holywatercooler_enemy_slash_Step_0_gml_790_0");
                ballooncon = 0;
                balloonend = 1;
                scr_mercyadd(myself, 10);
                failedflirting = true;
            }
            else if (ballooncon == 12)
            {
                msgsetloc(0, "Blessed are those&who kneel to me,&for my waves shall&cleanse you./%", "obj_holywatercooler_enemy_slash_Step_0_gml_793_0");
                ballooncon = 13;
                balloonend = 0;
            }
            else if (ballooncon == 13)
            {
                msgsetloc(0, "Close your eyes,&for as long as you&adore my purity,&no harm shall&follow you./%", "obj_holywatercooler_enemy_slash_Step_0_gml_794_0");
                ballooncon = 13.5;
                balloonend = 0;
            }
            else if (ballooncon == 13.5)
            {
                msgsetloc(0, "* (HolyWatercooler took mercy on you!)/%", "obj_holywatercooler_enemy_slash_Step_0_gml_797_0");
                ballooncon = 0;
                balloonend = 1;
                scr_mercyadd(myself, 10);
                begformercyskip = true;
                
                with (obj_dmgwriter)
                {
                    if (delaytimer >= 1)
                        killactive = 1;
                }
                
                scr_healallitemspell(50);
                
                for (i = 0; i < 3; i++)
                {
                    with (global.charinstance[i])
                        tu--;
                }
                
                scr_battletext_default();
                alarm[7] = 1;
                exit;
            }
            else if (ballooncon == 14)
            {
                msgsetloc(0, "Again you pray!&With renewed vigor,/%", "obj_holywatercooler_enemy_slash_Step_0_gml_814_0");
                ballooncon = 15;
                balloonend = 0;
            }
            else if (ballooncon == 15)
            {
                msgsetloc(0, "But now your hands&shake with&carbonated nerves/%", "obj_holywatercooler_enemy_slash_Step_0_gml_815_0");
                ballooncon = 16;
                balloonend = 0;
            }
            else if (ballooncon == 16)
            {
                msgsetloc(0, "And fear&drips down your face&in painted horror./%", "obj_holywatercooler_enemy_slash_Step_0_gml_816_0");
                ballooncon = 17;
                balloonend = 0;
            }
            else if (ballooncon == 17)
            {
                msgsetloc(0, "You beg not&for salvation&by my purity, but/%", "obj_holywatercooler_enemy_slash_Step_0_gml_817_0");
                ballooncon = 18;
                balloonend = 0;
            }
            else if (ballooncon == 18)
            {
                msgsetloc(0, "For fear of some&ugliness you see&reflected&in the glass./%", "obj_holywatercooler_enemy_slash_Step_0_gml_818_0");
                ballooncon = 18.5;
                balloonend = 0;
            }
            else if (ballooncon == 18.5)
            {
                msgsetloc(0, "Once again&I shall show mercy,&but no more./%", "obj_holywatercooler_enemy_slash_Step_0_gml_819_0");
                ballooncon = 18.75;
                balloonend = 0;
            }
            else if (ballooncon == 18.75)
            {
                msgsetloc(0, "* (HolyWatercooler took mercy on you!)/%", "obj_holywatercooler_enemy_slash_Step_0_gml_822_0");
                ballooncon = 0;
                balloonend = 1;
                scr_mercyadd(myself, 10);
                begformercyskip = true;
                
                with (obj_dmgwriter)
                {
                    if (delaytimer >= 1)
                        killactive = 1;
                }
                
                scr_healallitemspell(50);
                
                for (i = 0; i < 3; i++)
                {
                    with (global.charinstance[i])
                        tu--;
                }
                
                scr_battletext_default();
                alarm[7] = 1;
                exit;
            }
            else if (ballooncon == 19)
            {
                msgset(0, disgustingstr);
                ballooncon = 0;
                balloonend = 1;
                scr_mercyadd(myself, 5);
            }
            else if (ballooncon == 19.5)
            {
                msgset(0, disgustingstr);
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 20)
            {
                msgsetloc(0, "All around me&did you chatter,&but your tepid words/%", "obj_holywatercooler_enemy_slash_Step_0_gml_843_0");
                ballooncon = 21;
                balloonend = 0;
            }
            else if (ballooncon == 21)
            {
                msgsetloc(0, "Have not once&been decantered&in my direction.&Your ignorance&bescorns me.../%", "obj_holywatercooler_enemy_slash_Step_0_gml_844_0");
                ballooncon = 22;
                balloonend = 0;
            }
            else if (ballooncon == 22)
            {
                msgsetloc(0, "Speak well of my nature,&and you shall be spared./%", "obj_holywatercooler_enemy_slash_Step_0_gml_845_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 23)
            {
                global.choicemsg[0] = stringsetloc("#Recruit", "obj_holywatercooler_enemy_slash_Step_0_gml_849_0");
                global.choicemsg[1] = stringsetloc("#Beauty", "obj_holywatercooler_enemy_slash_Step_0_gml_850_0");
                global.choicemsg[2] = stringsetloc("Cactuses are better", "obj_holywatercooler_enemy_slash_Step_0_gml_851_0");
                global.choicemsg[3] = stringsetloc("Flowers", "obj_holywatercooler_enemy_slash_Step_0_gml_852_0");
                ballooncon = 23.11;
                balloonend = 0;
                msgset(0, "\\C4");
            }
            else if (ballooncon == 23.21)
            {
                msgsetloc(0, "Ah, I see...&So you offer yourselves&to be my recruits./%", "obj_holywatercooler_enemy_slash_Step_0_gml_858_0");
                ballooncon = 23.22;
                balloonend = 0;
            }
            else if (ballooncon == 23.22)
            {
                msgsetloc(0, "Despite my stature,&I hardly hold a court here,/%", "obj_holywatercooler_enemy_slash_Step_0_gml_859_0");
                ballooncon = 23.23;
                balloonend = 0;
            }
            else if (ballooncon == 23.23)
            {
                msgsetloc(0, "For, given respect even&by Lightners, I have all&I could desire./%", "obj_holywatercooler_enemy_slash_Step_0_gml_860_0");
                ballooncon = 23.24;
                balloonend = 0;
            }
            else if (ballooncon == 23.24)
            {
                msgsetloc(0, "But, should you behave&with quiet dedication,/%", "obj_holywatercooler_enemy_slash_Step_0_gml_861_0");
                ballooncon = 23.25;
                balloonend = 0;
            }
            else if (ballooncon == 23.25)
            {
                msgsetloc(0, "There may be&some use for you yet.&Impress me!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_862_0");
                ballooncon = 0;
                balloonend = 1;
                scr_mercyadd(myself, 15);
            }
            else if (ballooncon == 23.31)
            {
                msgsetloc(0, "Again you court me,&but your words float thin&on your intentions&puddle-shallow./%", "obj_holywatercooler_enemy_slash_Step_0_gml_864_0");
                ballooncon = 23.32;
                balloonend = 0;
            }
            else if (ballooncon == 23.32)
            {
                msgsetloc(0, "The estate of a fairy&cannot be shared&with mortals&whose tongues&are cracked and dry!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_865_0");
                ballooncon = 0;
                balloonend = 1;
                scr_mercyadd(myself, 5);
            }
            else if (ballooncon == 23.41)
            {
                msgsetloc(0, "Remember me not&as a vainglory,/%", "obj_holywatercooler_enemy_slash_Step_0_gml_867_0");
                ballooncon = 23.415;
                balloonend = 0;
            }
            else if (ballooncon == 23.415)
            {
                msgsetloc(0, "Though my face, shining&back both sun and moon&is brighter and more&holy than all stars,/%", "obj_holywatercooler_enemy_slash_Step_0_gml_868_0");
                ballooncon = 23.42;
                balloonend = 0;
            }
            else if (ballooncon == 23.42)
            {
                msgsetloc(0, "And as such, my beauty&is more&of an objective science,&that cannot be denied./%", "obj_holywatercooler_enemy_slash_Step_0_gml_869_0");
                ballooncon = 23.43;
                balloonend = 0;
            }
            else if (ballooncon == 23.43)
            {
                msgsetloc(0, "Well said./%", "obj_holywatercooler_enemy_slash_Step_0_gml_870_0");
                ballooncon = 0;
                balloonend = 1;
                scr_mercyadd(myself, 15);
            }
            else if (ballooncon == 23.51)
            {
                msgset(0, disgustingstr);
                ballooncon = 0;
                balloonend = 1;
                scr_mercyadd(myself, 5);
            }
            else if (ballooncon == 23.61)
            {
                msgsetloc(0, "The Bluest Flower,&A disciple of my speech/%", "obj_holywatercooler_enemy_slash_Step_0_gml_874_0");
                ballooncon = 23.62;
                balloonend = 0;
            }
            else if (ballooncon == 23.62)
            {
                msgsetloc(0, "Shy to no camera,&And a specimen of/%", "obj_holywatercooler_enemy_slash_Step_0_gml_875_0");
                ballooncon = 23.63;
                balloonend = 0;
            }
            else if (ballooncon == 23.63)
            {
                msgsetloc(0, "Elegance and kindness./%", "obj_holywatercooler_enemy_slash_Step_0_gml_876_0");
                ballooncon = 23.64;
                balloonend = 0;
            }
            else if (ballooncon == 23.64)
            {
                msgsetloc(0, "Should you meet,&Please give my regards./%", "obj_holywatercooler_enemy_slash_Step_0_gml_877_0");
                ballooncon = 0;
                balloonend = 1;
                scr_mercyadd(myself, 15);
            }
            
            if (gothurtlastturn == true)
            {
                ballooncon = 0;
                balloonend = 1;
            }
            else
            {
                global.typer = 50;
                
                if (ballooncon == 24 || ballooncon == 5.2 || ballooncon == 23.11)
                    scr_battletext_default();
                else
                    scr_enemyblcon(x, global.monstery[myself] - 20, 10);
            }
            
            alarm[7] = 1;
        }
    }
    
    if (actingsus == 1 && actconsus == 1)
    {
        if (amimissmizzle)
        {
            var rand = choose(0, 1, 2);
            
            if (rand == 0)
                msgsetloc(0, "* Susie gargles loudly!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_896_0");
            
            if (rand == 1)
                msgsetloc(0, "* Susie breaks a wet floor sign!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_897_0");
            
            if (rand == 2)
                msgsetloc(0, "* Susie snores while awake!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_898_0");
            
            scr_mercyadd(myself, 4);
            scr_simultext("susie");
            
            if (simulordersus == 0)
                actconsus = 20;
            else
                actconsus = 0;
        }
        else
        {
            var _text = "_";
            var rand = choose(0, 1, 2);
            
            if (rand == 0)
                _text = stringsetloc("* Susie face-crushes a cup!!", "obj_watercooler_enemy_slash_Step_0_gml_313_0");
            
            if (rand == 1)
                _text = stringsetloc("* Susie puts cups on Ralsei!", "obj_watercooler_enemy_slash_Step_0_gml_314_0");
            
            if (rand == 2)
                _text = stringsetloc("* Susie puts cups on Kris's eyes!", "obj_watercooler_enemy_slash_Step_0_gml_315_0");
            
            if (simultotal == 1)
            {
                msgset(0, _text + "/%");
                scr_battletext_default();
                
                with (obj_face)
                    instance_destroy();
                
                actconsus = 20;
            }
            else
            {
                msgset(0, _text);
                scr_simultext("susie");
                
                if (simulordersus == 0)
                    actconsus = 20;
                else
                    actconsus = 0;
            }
            
            actingsus = 0;
            scr_mercyadd(myself, 4);
        }
    }
    
    if (actingral == 1 && actconral == 1)
    {
        if (amimissmizzle)
        {
            var rand = choose(0, 1, 2);
            
            if (rand == 0)
                msgsetloc(0, "* Ralsei sips politely!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_938_0");
            
            if (rand == 1)
                msgsetloc(0, "* Ralsei puts a wet floor sign!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_939_0");
            
            if (rand == 2)
                msgsetloc(0, "* Ralsei makes toothpaste!!!/%", "obj_holywatercooler_enemy_slash_Step_0_gml_940_0");
            
            scr_mercyadd(myself, 4);
            scr_simultext("ralsei");
            
            if (simulorderral == 0)
                actconral = 20;
            else
                actconral = 0;
        }
        else
        {
            var _text = "_";
            var rand = choose(0, 1, 2);
            
            if (rand == 0)
                _text = stringsetloc("* Ralsei absorbs trace calcium!", "obj_watercooler_enemy_slash_Step_0_gml_341_0");
            
            if (rand == 1)
                _text = stringsetloc("* Ralsei cleans Susie's spill!!", "obj_watercooler_enemy_slash_Step_0_gml_342_0");
            
            if (rand == 2)
                _text = stringsetloc("* Ralsei labels everyone's cups!!", "obj_watercooler_enemy_slash_Step_0_gml_343_0");
            
            if (simultotal == 1)
            {
                msgset(0, _text + "/%");
                scr_battletext_default();
                
                with (obj_face)
                    instance_destroy();
                
                actconral = 20;
            }
            else
            {
                msgset(0, _text);
                scr_simultext("ralsei");
                
                if (simulorderral == 0)
                    actconral = 20;
                else
                    actconral = 0;
            }
            
            actingral = 0;
            scr_mercyadd(myself, 4);
        }
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
        scr_nextact();
}

if (state == 3)
    scr_enemy_hurt();

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
