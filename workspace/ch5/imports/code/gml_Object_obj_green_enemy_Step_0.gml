if (global.monsterhp[myself] < (global.monstermaxhp[myself] * 0.5))
    global.monsterhp[myself] = global.monstermaxhp[myself] * 0.5;

if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0)
    {
        scr_randomtarget();
        talked = 1;
        talktimer = 0;
        rtimer = 0;
    }
}

if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        global.writerimg[0] = spr_green_check1;
        global.writerimg[1] = spr_green_check2;
        msgsetloc(0, "* GREEN - AT \\I0 DF \\I1 &A chef whose kindness precedes.&Seemingly no interest in speaking./%", "obj_green_enemy_slash_Step_0_gml_26_0");
        scr_battletext_default();
    }
    
    if (acting == 2 && actcon == 0)
    {
        acting = 2.1;
        msgsetloc(0, "* Everyone ate Green's FEAST!/%", "obj_green_enemy_slash_Step_0_gml_91_0");
        scr_battletext();
    }
    
    if (acting == 2.1 && actcon == 0 && !i_ex(obj_writer))
    {
        timerb++;
        
        if (timerb == 1)
        {
            feastcount++;
            
            if (feastcount > 4)
                feastcount = 4;
            
            if ((i_ex(obj_orange_enemy) && global.mercymod[obj_orange_enemy.myself] >= 80) || (i_ex(obj_green_enemy) && global.mercymod[obj_green_enemy.myself] >= 75))
                feastcount = 4;
            
            if (global.hp[1] > 0)
            {
                with (obj_herokris)
                    scr_move_to_point_over_time(camerax() + 160, cameray() + 95, 5);
            }
            
            if (global.hp[2] > 0)
            {
                with (obj_herosusie)
                    scr_move_to_point_over_time(camerax() + 243, cameray() + 84, 5);
            }
            
            if (global.hp[3] > 0)
            {
                with (obj_heroralsei)
                    scr_move_to_point_over_time(camerax() + 315, cameray() + 81, 5);
            }
            
            with (obj_orange_enemy)
                scr_move_to_point_over_time(camerax() + 383, cameray() + 140, 5);
            
            scr_move_to_point_over_time(camerax() + 433, cameray() + 131, 5);
            table_marker = instance_create(camerax() + 170, cameray() + 166, obj_marker);
            table_marker.sprite_index = spr_green_at_table_empty;
            table_marker.image_xscale = 2;
            table_marker.image_yscale = 2;
            table_marker.image_speed = 0;
            
            if (feastcount == 3)
            {
                with (obj_herokris)
                    visible = false;
            }
        }
        
        if (timerb == 6)
        {
            with (obj_herokris)
                visible = false;
            
            with (obj_herosusie)
                visible = false;
            
            with (obj_heroralsei)
                visible = false;
            
            with (obj_orange_enemy)
                visible = false;
            
            table_marker.sprite_index = spr_green_at_table_full;
            
            if (feastcount == 3)
                table_marker.sprite_index = spr_green_at_table_no_kris;
        }
        
        if (timerb == 31)
        {
            snd_play(snd_item);
            
            if (feastcount == 1)
            {
                food1_marker = instance_create(camerax() + 195, cameray() + 162, obj_marker);
                food1_marker.sprite_index = choose(spr_green_curry, spr_green_friedegg, spr_green_omurice);
                food1_marker.image_speed = 0;
                food1_marker.image_xscale = 2;
                food1_marker.image_yscale = 2;
                food1_marker.depth = -999;
                food3_marker = instance_create(camerax() + 313, cameray() + 162, obj_marker);
                food3_marker.sprite_index = choose(spr_green_curry, spr_green_friedegg, spr_green_omurice);
                food3_marker.image_speed = 0;
                food3_marker.image_xscale = 2;
                food3_marker.image_yscale = 2;
                food3_marker.depth = -999;
                food2_marker = instance_create(camerax() + 253, cameray() + 162, obj_marker);
                food2_marker.sprite_index = choose(spr_green_curry, spr_green_friedegg, spr_green_omurice);
                food2_marker.image_speed = 0;
                food2_marker.image_xscale = 2;
                food2_marker.image_yscale = 2;
                food2_marker.depth = -999;
                food4_marker = instance_create(camerax() + 368, cameray() + 162, obj_marker);
                food4_marker.sprite_index = choose(spr_green_curry, spr_green_friedegg, spr_green_omurice);
                food4_marker.image_speed = 0;
                food4_marker.image_xscale = 2;
                food4_marker.image_yscale = 2;
                food4_marker.depth = -999;
                
                if (global.hp[2] > 0)
                {
                    thanks2_marker = instance_create(camerax() + 245, cameray() + 69, obj_marker);
                    // thanks2_marker.sprite_index = spr_battleblcon_v_thanks_green;
                    
                    // if (global.lang == "ja")
                    //     thanks2_marker.sprite_index = spr_battleblcon_v_thanks_green_ja_susie;
                    thanks2_marker.sprite_index = scr_84_get_sprite("spr_battleblcon_v_thanks_green");

                }
                
                if (global.hp[3] > 0)
                {
                    thanks3_marker = instance_create(camerax() + 306, cameray() + 76, obj_marker);
                    // thanks3_marker.sprite_index = spr_battleblcon_v_thanks_green;
                    
                    // if (global.lang == "ja")
                    //     thanks3_marker.sprite_index = spr_battleblcon_v_thanks_green_ja_ralsei;
                    thanks2_marker.sprite_index = scr_84_get_sprite("spr_battleblcon_v_thanks_green");
                }
                
                table_marker.image_index = 1;
            }
            
            if (feastcount == 2)
            {
                food2_marker = instance_create(camerax() + 253, cameray() + 162, obj_marker);
                food2_marker.sprite_index = choose(spr_green_curry, spr_green_friedegg, spr_green_omurice);
                food2_marker.image_speed = 0;
                food2_marker.image_xscale = 2;
                food2_marker.image_yscale = 2;
                food2_marker.depth = -999;
                table_marker.image_index = 1;
            }
            
            if (feastcount == 3)
            {
                food1_marker = instance_create(camerax() + 195, cameray() + 162, obj_marker);
                food1_marker.sprite_index = spr_green_icecream;
                food1_marker.image_speed = 0;
                food1_marker.image_xscale = 2;
                food1_marker.image_yscale = 2;
                food1_marker.depth = -999;
                food2_marker = instance_create(camerax() + 253, cameray() + 162, obj_marker);
                food2_marker.sprite_index = spr_green_icecream;
                food2_marker.image_speed = 0;
                food2_marker.image_xscale = 2;
                food2_marker.image_yscale = 2;
                food2_marker.depth = -999;
                food3_marker = instance_create(camerax() + 313, cameray() + 162, obj_marker);
                food3_marker.sprite_index = spr_green_icecream_cherry;
                food3_marker.image_speed = 0;
                food3_marker.image_xscale = 2;
                food3_marker.image_yscale = 2;
                food3_marker.depth = -999;
                food4_marker = instance_create(camerax() + 368, cameray() + 162, obj_marker);
                food4_marker.sprite_index = spr_green_icecream;
                food4_marker.image_speed = 0;
                food4_marker.image_xscale = 2;
                food4_marker.image_yscale = 2;
                food4_marker.depth = -999;
                
                if (global.hp[2] > 0)
                {
                    thanks2_marker = instance_create(camerax() + 245, cameray() + 69, obj_marker);
                    // thanks2_marker.sprite_index = spr_battleblcon_v_thanks_green;
                    
                    // if (global.lang == "ja")
                    //     thanks2_marker.sprite_index = spr_battleblcon_v_thanks_green_ja_susie;
                    thanks2_marker.sprite_index = scr_84_get_sprite("spr_battleblcon_v_thanks_green");
                }
                
                if (global.hp[3] > 0)
                {
                    thanks3_marker = instance_create(camerax() + 306, cameray() + 76, obj_marker);
                    // thanks3_marker.sprite_index = spr_battleblcon_v_thanks_green;
                    
                    // if (global.lang == "ja")
                    //     thanks3_marker.sprite_index = spr_battleblcon_v_thanks_green_ja_ralsei;
                    thanks2_marker.sprite_index = scr_84_get_sprite("spr_battleblcon_v_thanks_green");
                }
                
                table_marker.image_index = 2;
            }
            
            if (feastcount == 4)
            {
                food1_marker = instance_create((camerax() + 195) - 8, cameray() + 162, obj_marker);
                food1_marker.sprite_index = spr_green_plate;
                food1_marker.image_speed = 0;
                food1_marker.image_xscale = 2;
                food1_marker.image_yscale = 2;
                food1_marker.depth = -999;
                food3_marker = instance_create((camerax() + 313) - 8, cameray() + 162, obj_marker);
                food3_marker.sprite_index = spr_green_plate;
                food3_marker.image_speed = 0;
                food3_marker.image_xscale = 2;
                food3_marker.image_yscale = 2;
                food3_marker.depth = -999;
                food2_marker = instance_create((camerax() + 253) - 8, cameray() + 162, obj_marker);
                food2_marker.sprite_index = spr_green_plate;
                food2_marker.image_speed = 0;
                food2_marker.image_xscale = 2;
                food2_marker.image_yscale = 2;
                food2_marker.depth = -999;
                food4_marker = instance_create((camerax() + 368) - 8, cameray() + 162, obj_marker);
                food4_marker.sprite_index = spr_green_plate;
                food4_marker.image_speed = 0;
                food4_marker.image_xscale = 2;
                food4_marker.image_yscale = 2;
                food4_marker.depth = -999;
                table_marker.image_index = 1;
            }
        }
        
        if (timerb >= 60 && !i_ex(obj_writer))
        {
            if (feastcount == 1)
            {
                acting = 3.1;
                timer = 0;
                msgsetloc(0, "(Why do they&get food^1, too...?)/%", "obj_green_enemy_slash_Step_0_gml_276_0");
                global.typer = 50;
                scr_enemyblcon(camerax() + 385, cameray() + 77, 13);
            }
            
            if (feastcount == 2)
            {
                acting = 3.2;
                timer = 0;
                msgsetloc(0, "G-Green!!&Look!!&LOOK!!/%", "obj_green_enemy_slash_Step_0_gml_285_0");
                global.typer = 50;
                scr_enemyblcon(camerax() + 385, cameray() + 102, 13);
                table_marker.image_index = 6;
            }
            
            if (feastcount == 3)
            {
                acting = 3.3;
                timer = 0;
                thanks2_marker.sprite_index = spr_nothing;
                thanks3_marker.sprite_index = spr_nothing;
                msgsetloc(0, "W-wait^1, why did&HE get a cherry!?/%", "obj_green_enemy_slash_Step_0_gml_298_0");
                global.typer = 50;
                scr_enemyblcon(camerax() + 385, cameray() + 110, 13);
                idlesprite = spr_green_guilty;
            }
            
            if (feastcount == 4)
            {
                acting = 3.41;
                timer = 0;
                mus_volume(global.batmusic[1], 0, 60);
                msgsetloc(0, "What!^1? Green^1, this&time you made my&favorite...?/%", "obj_green_enemy_slash_Step_0_gml_310_0");
                global.typer = 50;
                scr_enemyblcon(camerax() + 385, cameray() + 102, 13);
            }
        }
    }
    
    if (acting == 3.1 && !i_ex(obj_writer))
    {
        acting = 0;
        scr_mercyadd(myself, 25);
        
        with (obj_orange_enemy)
            scr_mercyadd(myself, 20);
        
        with (obj_herokris)
        {
            x = xstart;
            y = ystart;
            visible = true;
        }
        
        with (obj_herosusie)
        {
            x = xstart;
            y = ystart;
            visible = true;
        }
        
        with (obj_heroralsei)
        {
            x = xstart;
            y = ystart;
            visible = true;
        }
        
        with (obj_orange_enemy)
        {
            x = xstart;
            y = ystart;
            visible = true;
        }
        
        x = xstart;
        y = ystart;
        idlesprite = spr_green_together;
        sparedsprite = spr_green_together;
        
        with (table_marker)
            instance_destroy();
        
        if (global.hp[2] > 0)
        {
            with (thanks2_marker)
                instance_destroy();
        }
        
        if (global.hp[3] > 0)
        {
            with (thanks3_marker)
                instance_destroy();
        }
        
        with (food1_marker)
            instance_destroy();
        
        with (food2_marker)
            instance_destroy();
        
        with (food3_marker)
            instance_destroy();
        
        with (food4_marker)
            instance_destroy();
        
        table_sound_con = 0;
        timerb = 0;
        actcon = 1;
    }
    
    if (acting == 3.2)
    {
        timer++;
        
        if ((button3_p() && timer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            acting = 3.21;
            timer = 0;
            msgsetloc(0, "Susie took seconds even though&she didn't eat firsts!!/%", "obj_green_enemy_slash_Step_0_gml_357_0");
            global.typer = 50;
            scr_enemyblcon(camerax() + 385, cameray() + 102, 13);
        }
    }
    
    if (acting == 3.21 && !i_ex(obj_writer))
    {
        timer++;
        
        if ((button3_p() && timer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            
            acting = 3.22;
            timer = 0;
            msgsetloc(0, "And^1, um^1, Ralsei didn't&wash his hands!/%", "obj_green_enemy_slash_Step_0_gml_371_0");
            global.typer = 50;
            scr_enemyblcon(camerax() + 385, cameray() + 102, 13);
        }
    }
    
    if (acting == 3.22 && !i_ex(obj_writer))
    {
        timer++;
        
        if ((button3_p() && timer > 15) || !i_ex(obj_writer))
        {
            acting = 3.23;
            timer = 0;
            msgsetloc(0, "H-huh^1? Ummm^1, you&didn't either.../%", "obj_green_enemy_slash_Step_0_gml_384_0");
            global.typer = 50;
            scr_enemyblcon(camerax() + 330, cameray() + 102, 13);
        }
    }
    
    if (acting == 3.23 && !i_ex(obj_writer))
    {
        timer++;
        
        if ((button3_p() && timer > 15) || !i_ex(obj_writer))
        {
            acting = 3.1;
            timer = 0;
            msgsetloc(0, "That's 'cause I'm&wearing gloves^1, dummy!/%", "obj_green_enemy_slash_Step_0_gml_398_0");
            global.typer = 50;
            scr_enemyblcon(camerax() + 385, cameray() + 110, 13);
        }
    }
    
    if (acting == 3.3 && !i_ex(obj_writer))
    {
        timer++;
        
        if ((button3_p() && timer > 15) || !i_ex(obj_writer))
        {
            acting = 3.31;
            timer = 0;
            msgsetloc(0, "Ratboy^1, trade!!/%", "obj_green_enemy_slash_Step_0_gml_411_0");
            global.typer = 50;
            scr_enemyblcon(camerax() + 385, cameray() + 110, 13);
        }
    }
    
    if (acting == 3.31)
    {
        timer++;
        
        if ((button3_p() && timer > 15) || !i_ex(obj_writer))
        {
            acting = 3.32;
            timer = 0;
            msgsetloc(0, "I don't want to trade&if you call me Ratboy./%", "obj_green_enemy_slash_Step_0_gml_424_0");
            global.typer = 74;
            scr_enemyblcon(camerax() + 330, cameray() + 100, 13);
        }
    }
    
    if (acting == 3.32)
    {
        timer++;
        
        if ((button3_p() && timer > 15) || !i_ex(obj_writer))
        {
            table_marker.sprite_index = spr_green_at_table_full;
            table_marker.image_index = 5;
            acting = 3.33;
            timer = 0;
            msgsetloc(0, "Green!!^1! Tell him&he has to trade!!!/%", "obj_green_enemy_slash_Step_0_gml_439_0");
            global.typer = 50;
            scr_enemyblcon(camerax() + 385, cameray() + 110, 13);
        }
    }
    
    if (acting == 3.33)
    {
        timer++;
        
        if ((button3_p() && timer > 15) || !i_ex(obj_writer))
        {
            acting = 3.335;
            timer = 0;
            table_marker.sprite_index = spr_green_at_table_passing_scraps;
            table_marker.image_index = 0;
            table_marker.image_speed = 0.1;
            table_sound_con = 1;
            snd_play(snd_item);
        }
    }
    
    if (acting == 3.335)
    {
        timer++;
        
        if (timer >= 30)
        {
            timer = 0;
            acting = 3.34;
        }
    }
    
    if (table_sound_con == 1)
    {
        table_sound_timer++;
        
        if (table_sound_timer >= 20)
        {
            snd_play(snd_coaster_kiss, 1, 1);
            table_sound_timer = 0;
        }
    }
    
    if (acting == 3.34 && !i_ex(obj_writer))
    {
        idlesprite = spr_green_shrug_right;
        sparedsprite = spr_green_shrug_right;
        acting = 3.1;
        timer = 0;
        
        if (scr_keyitemcheck(24))
            msgsetloc(0, "AND!^1! HIM AND SUSIE&ARE LOOKING AT BROMIDES&UNDER THE TABLE!!!/%", "obj_green_enemy_slash_Step_0_gml_489_0");
        else
            msgsetloc(0, "AND!^1! HIM AND SUSIE&ARE GIVING KRIS SCRAPS&UNDER THE TABLE!!!/%", "obj_green_enemy_slash_Step_0_gml_490_0");
        
        global.typer = 50;
        scr_enemyblcon(camerax() + 385, cameray() + 102, 13);
    }
    
    if (acting == 3.4 && !i_ex(obj_writer))
    {
        table_marker.image_index = 2;
        timer++;
        
        if ((button3_p() && timer > 15) || !i_ex(obj_writer))
        {
            acting = 3.41;
            timer = 0;
            msgsetloc(0, "What!^1? Green,&this time&you made my&favorite...?/%", "obj_green_enemy_slash_Step_0_gml_503_0");
            scr_enemyblcon(camerax() + 385, cameray() + 102, 13);
            idlesprite = spr_green_together;
            sparedsprite = spr_green_together;
            snd_resume(global.batmusic[0]);
        }
    }
    
    if (acting == 3.41)
    {
        timer++;
        
        if ((button3_p() && timer > 15) || !i_ex(obj_writer))
        {
            acting = 3.411;
            timer = 0;
            idlesprite = spr_green_nods_left;
            sparedsprite = spr_green_nods_left;
        }
    }
    
    if (acting == 3.411)
    {
        timer++;
        
        if (timer == 30)
        {
            snd_play(snd_item);
            
            with (food1_marker)
            {
                x += 4;
                sprite_index = spr_tea_party_cake;
            }
            
            with (food2_marker)
            {
                x += 4;
                sprite_index = spr_tea_party_cake;
            }
            
            with (food3_marker)
            {
                x += 4;
                sprite_index = spr_tea_party_cake;
            }
            
            with (food4_marker)
            {
                x += 4;
                sprite_index = spr_tea_party_cake;
            }
            
            acting = 3.42;
            timer = 0;
        }
    }
    
    if (acting == 3.42 && !i_ex(obj_writer))
    {
        timer++;
        
        if (timer >= 15)
        {
            idlesprite = spr_green_together;
            sparedsprite = spr_green_together;
            table_marker.sprite_index = spr_green_at_table_ralsei_laughs;
            table_marker.image_speed = 0.16666666666666666;
            acting = 3.43;
            timer = 0;
            msgsetloc(0, "Oooo^1! Cheesecake!&You're the best^1, Green!/%", "obj_green_enemy_slash_Step_0_gml_555_0");
            scr_enemyblcon(camerax() + 385, cameray() + 102, 13);
            scr_battle_sprite_set("ralsei", spr_ralsei_laugh, 0.16666666666666666, true);
        }
    }
    
    if (acting == 3.43 && !i_ex(obj_writer))
    {
        timer++;
        
        if (timer >= 15)
        {
            acting = 3.44;
            timer = 0;
            msgsetloc(0, "Pffft.../%", "obj_green_enemy_slash_Step_0_gml_568_0");
            global.typer = 74;
            scr_enemyblcon(camerax() + 330, cameray() + 86, 13);
            scr_guardpeek(obj_heroralsei);
            table_marker.image_index = 2;
        }
    }
    
    if (acting == 3.44 && !i_ex(obj_writer))
    {
        timer++;
        
        if (timer >= 15)
        {
            acting = 3.45;
            timer = 0;
            msgsetloc(0, "Wh..^1. what?/%", "obj_green_enemy_slash_Step_0_gml_584_0");
            global.typer = 50;
            scr_enemyblcon(camerax() + 385, cameray() + 102, 13);
        }
    }
    
    if (acting == 3.45 && !i_ex(obj_writer))
    {
        timer++;
        
        if (timer >= 15)
        {
            acting = 3.46;
            timer = 0;
            msgsetloc(0, "CHEESEcake...?/%", "obj_green_enemy_slash_Step_0_gml_597_0");
            global.typer = 74;
            scr_enemyblcon(camerax() + 330, cameray() + 76, 13);
            scr_guardpeek(obj_heroralsei);
        }
    }
    
    if (acting == 3.46 && !i_ex(obj_writer))
    {
        timer++;
        
        if (timer >= 15)
        {
            acting = 3.47;
            timer = 0;
            msgsetloc(0, "Wh..^1. what does that mean,&why are you laughing?/%", "obj_green_enemy_slash_Step_0_gml_611_0");
            global.typer = 50;
            scr_enemyblcon(camerax() + 385, cameray() + 102, 13);
            table_marker.image_index = 3;
        }
    }
    
    if (acting == 3.47 && !i_ex(obj_writer))
    {
        timer++;
        
        if (timer >= 15)
        {
            acting = 3.48;
            timer = 0;
            msgsetloc(0, "Nothing^1! It's wonderful&that's your favorite food!/%", "obj_green_enemy_slash_Step_0_gml_626_0");
            global.typer = 74;
            scr_enemyblcon(camerax() + 330, cameray() + 100, 13);
            scr_guardpeek(obj_heroralsei);
        }
    }
    
    if (acting == 3.48 && !i_ex(obj_writer))
    {
        timer++;
        
        if (timer >= 15)
        {
            acting = 3.49;
            timer = 0;
            msgsetloc(0, "Y-you're BULLYing me,&aren't you!?/%", "obj_green_enemy_slash_Step_0_gml_640_0");
            global.typer = 50;
            scr_enemyblcon(camerax() + 385, cameray() + 102, 13);
            table_marker.sprite_index = spr_green_at_table_ralsei_laughs_sad;
        }
    }
    
    if (acting == 3.49 && !i_ex(obj_writer))
    {
        timer++;
        
        if (timer >= 15)
        {
            scr_battle_sprite_reset("ralsei");
            acting = 3.1;
            timer = 0;
        }
    }
    
    if (actingsus == 1 && actconsus == 1)
    {
        snd_stop(snd_boost);
        snd_play(snd_boost);
        msgsetloc(0, "* Susie cooked up some TP!", "obj_green_enemy_slash_Step_0_gml_665_0");
        scr_simultext("susie");
        scr_tensionheal(30);
        global.flag[1888] = 1;
        
        if (global.lang == "ja")
            scr_act_charsprite_scale("susie", 8352, 1, 1);
        else
            scr_act_charsprite_scale("susie", 3965, 1, 1);
        
        if (simulordersus == 0)
            actconsus = 20;
        else
            actconsus = 0;
    }
    
    if (actingral == 1 && actconral == 1)
    {
        snd_stop(snd_boost);
        snd_play(snd_boost);
        msgsetloc(0, "* Ralsei cooked up some TP!", "obj_green_enemy_slash_Step_0_gml_680_0");
        scr_simultext("ralsei");
        scr_tensionheal(30);
        global.flag[1888] = 1;
        scr_act_charsprite("ralsei", spr_ralsei_cook, 1, 1);
        
        if (simulorderral == 0)
            actconral = 20;
        else
            actconral = 0;
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
        scr_act_charsprite_end();
        
        with (obj_orange_enemy)
            scr_act_charsprite_end();
        
        scr_nextact();
    }
}

if (state == 3)
{
    hurttimer -= 1;
    
    if (hurttimer < 0)
    {
        state = 0;
    }
    else
    {
        hurtshake += 1;
        
        if (hurtshake > 1)
        {
            if (shakex > 0)
                shakex -= 1;
            
            if (shakex < 0)
                shakex += 1;
            
            shakex = -shakex;
            hurtshake = 0;
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
