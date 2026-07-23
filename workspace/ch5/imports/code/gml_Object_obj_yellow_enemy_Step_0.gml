if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0)
    {
        scr_randomtarget();
        setbattlemsg = false;
        event_user(1);
        myattackpriority = 0;
        scr_attackpriority(myattackpriority - 1);
        
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        
        talk_var = choose(0, 1, 2, 3);
        
        if ((fail_counter > 1 || (fail_counter && trial_counter == 3)) && just_failed)
        {
            switch (trial_counter)
            {
                case 0:
                    talk_var = 4;
                    break;
                
                case 1:
                    talk_var = 5;
                    break;
                
                case 2:
                    talk_var = 6;
                    break;
                
                case 3:
                    talk_var = 7;
                    break;
            }
        }
        
        if (fail_counter == 0 && just_succeeded)
        {
            switch (trial_counter)
            {
                case 1:
                    talk_var = 8;
                    break;
                
                case 2:
                    talk_var = 9;
                    break;
                
                case 3:
                    talk_var = 10;
                    break;
            }
        }
        
        just_failed = false;
        just_succeeded = false;
        
        if (talk_var == 0)
            msgset_add(stringsetloc("Got it?&We're puttin' you&in a cent.../%", "obj_yellow_enemy_slash_Step_0_gml_97_0"), x - 20, y + 55, 10, 50);
        
        if (talk_var == 1)
            msgset_add(stringsetloc("But they's a&pretty good shot./%", "obj_yellow_enemy_slash_Step_0_gml_98_0"), x - 20, y + 55, 10, 50);
        
        if (talk_var == 2)
            msgset_add(stringsetloc("And finally put&it behind bars./%", "obj_yellow_enemy_slash_Step_0_gml_99_0"), x - 20, y + 55, 10, 50);
        
        if (talk_var == 3)
            msgset_add(stringsetloc("Blue's a revolver?&Guess I do&like gun's.../%", "obj_yellow_enemy_slash_Step_0_gml_100_0"), x - 20, y + 55, 10, 50);
        
        if (talk_var == 4)
            msgset_add(stringsetloc("Who's nerdy&enough to&have that?/%", "obj_yellow_enemy_slash_Step_0_gml_103_0"), x - 20, y + 55, 10, 50);
        
        if (talk_var == 5)
            msgset_add(stringsetloc("It does smell&mighty yummy.../%", "obj_yellow_enemy_slash_Step_0_gml_104_0"), x - 20, y + 55, 10, 50);
        
        if (talk_var == 6)
            msgset_add(stringsetloc("By the way, did&I miss a bloods&scene?/%", "obj_yellow_enemy_slash_Step_0_gml_105_0"), x - 20, y + 55, 10, 50);
        
        if (talk_var == 7)
            msgset_add(stringsetloc("I know you's&sickened&criminells did it!&Admit it!/%", "obj_yellow_enemy_slash_Step_0_gml_106_0"), x - 20, y + 55, 10, 50);
        
        if (talk_var == 8)
            msgset_add(stringsetloc("\"Playin' Smash\"&ain't ever right./%", "obj_yellow_enemy_slash_Step_0_gml_108_0"), x - 20, y + 55, 10, 50);
        
        if (talk_var == 9)
            msgset_add(stringsetloc("Well... I did&wanna taste that&shirt./%", "obj_yellow_enemy_slash_Step_0_gml_109_0"), x - 20, y + 55, 10, 50);
        
        if (talk_var == 10)
            msgset_add(stringsetloc("Huh! Didn't&know holes&was food.../%", "obj_yellow_enemy_slash_Step_0_gml_110_0"), x - 20, y + 55, 10, 50);
        
        yellow_balloon();
    }
    
    if (talked == 1 && scr_isphase("enemytalk"))
        scr_blconskip(15);
    
    if (global.mnfight == 1.5)
    {
        if (scr_attackpriority(myattackpriority))
        {
            instance_exists(obj_growtangle);
            instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 170, obj_growtangle);
            
            if (!instance_exists(obj_moveheart))
                scr_moveheart();
            
            global.mnfight = 2;
            scr_turntimer(90);
        }
    }
    
    if (scr_isphase("bullets") && attacked == 0)
    {
        rtimer++;
        
        if (fight_type == "blue&yellow")
        {
            if (rtimer == 12)
            {
                turns++;
                global.typer = 6;
                global.fc = 0;
                
                if (scr_messagepriority(999))
                {
                    var substring = string(myself);
                    global.battlemsg[0] = stringsetsubloc("* Smells like flowers.", substring, "obj_yellow_enemy_slash_Step_0_gml_156_0");
                    
                    if (global.actcost[myself][1] == 2497.5)
                        global.battlemsg[0] = stringsetsubloc("* You feel a strange lack of EVIDENCE.", substring, "obj_yellow_enemy_slash_Step_0_gml_160_0");
                    
                    if (global.actcost[myself][1] != 2497.5 && global.tension >= 100)
                        global.battlemsg[0] = stringsetsubloc("* The trial is ready!&* Use Yellow's JUSTICE act to begin!", substring, "obj_yellow_enemy_slash_Step_0_gml_164_0");
                    
                    if (fail_counter > 1)
                    {
                        switch (trial_counter)
                        {
                            case 0:
                                global.battlemsg[0] = stringsetsubloc("* Seth glances nervously at books...", substring, "obj_yellow_enemy_slash_Step_0_gml_171_0");
                                break;
                            
                            case 1:
                                global.battlemsg[0] = stringsetsubloc("* Green conspiciously oils the popcorn pan...", substring, "obj_yellow_enemy_slash_Step_0_gml_175_0");
                                break;
                            
                            case 2:
                                global.battlemsg[0] = stringsetsubloc("* Aqua laughs obviously about how red her ribbon is.", substring, "obj_yellow_enemy_slash_Step_0_gml_179_0");
                                break;
                            
                            case 3:
                                global.battlemsg[0] = stringsetsubloc("* Blue looks wistfully at the string and sighs.", substring, "obj_yellow_enemy_slash_Step_0_gml_183_0");
                                break;
                        }
                    }
                }
                
                attacked = 1;
            }
        }
    }
}

if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    
    if (acting == 1 && actcon == 0)
    {
        global.writerimg[0] = spr_yellow_check1;
        global.writerimg[1] = spr_yellow_check2;
        global.writerimg[2] = spr_blue_check1;
        global.writerimg[3] = spr_blue_check2;
        msgsetloc(0, "* YELLOW - AT \\I0 DF \\I1&A cowboy with his own peculiar&brand of justice./", "obj_yellow_enemy_slash_Step_0_gml_210_0");
        msgnextloc("* BLUE - AT \\I2 DF \\I3&A dancer who believes love to&be integral to life./%", "obj_yellow_enemy_slash_Step_0_gml_211_0");
        scr_battletext_default();
        actcon = 1;
    }
    
    if (acting == 2 && actcon == 0)
    {
        if (trial_done[trial_counter])
            actcon = 0.1;
        else
            actcon = 0.05;
        
        msgsetloc(0, "* You began the trial!/%", "obj_yellow_enemy_slash_Step_0_gml_226_0");
        
        if (outfit)
            scr_battle_sprite_set("kris", spr_kris_lawyer, 0.16666666666666666, true);
        else
            scr_battle_sprite_set("kris", spr_kris_lawyer_alt, 0.16666666666666666, true);
        
        outfit = 1 - outfit;
        scr_battle_sprite_set("susie", spr_susie_lawyer, 0.16666666666666666, true);
        scr_battle_sprite_set("ralsei", spr_ralsei_lawyer, 0.16666666666666666, true);
        scr_battle_sprite_actflash("kris");
        scr_battle_sprite_actflash("susie");
        scr_battle_sprite_actflash("ralsei");
        scr_battletext();
        
        with (instance_create(0, 0, obj_yellow_trial_manager))
        {
            trial_id = other.trial_counter;
            
            if (other.evidence_obtained[0])
                ds_list_add(evidence_list, variable_struct_get(other.trial_evid, other.evidence_key[0]));
            
            if (other.evidence_obtained[4])
                ds_list_add(evidence_list, variable_struct_get(other.trial_evid, other.evidence_key[4]));
            
            if (other.evidence_obtained[2])
                ds_list_add(evidence_list, variable_struct_get(other.trial_evid, other.evidence_key[2]));
            
            if (other.evidence_obtained[1])
                ds_list_add(evidence_list, variable_struct_get(other.trial_evid, other.evidence_key[1]));
            
            if (other.evidence_obtained[5])
                ds_list_add(evidence_list, variable_struct_get(other.trial_evid, other.evidence_key[5]));
            
            if (other.evidence_obtained[3])
                ds_list_add(evidence_list, variable_struct_get(other.trial_evid, other.evidence_key[3]));
            
            if (other.evidence_obtained[6])
                ds_list_add(evidence_list, variable_struct_get(other.trial_evid, other.evidence_key[6]));
            
            if (ds_list_size(evidence_list) == 0)
                ds_list_add(evidence_list, other.trial_evid.annoyingdog);
            
            if (scr_keyitemcheck(2))
                ds_list_add(evidence_list, other.trial_evid.egg);
            
            global.faceaction[0] = 6;
            global.faceaction[1] = 6;
            global.faceaction[2] = 6;
            global.charaction[0] = 6;
            global.charaction[1] = 6;
            global.charaction[2] = 6;
        }
    }
    
    if (actcon == 0.05)
    {
        if (!i_ex(obj_writer))
        {
            trial_done[trial_counter] = true;
            
            switch (trial_counter)
            {
                case 0:
                    var flor_x = camerax() + (camerawidth() * 0.5) + 25;
                    var flor_y = (cameray() + (cameraheight() * 0.45)) - 25;
                    msgset_add_func(function()
                    {
                        with (instance_create(camerax() + (camerawidth() * 0.5), cameray() + (cameraheight() * 0.45), obj_marker))
                        {
                            scr_darksize();
                            sprite_index = spr_floradin_postflattened;
                            image_speed = 0;
                            depth = 100;
                            victim_marker = true;
                        }
                        
                        with (instance_create(camerax() + (camerawidth() * 0.5), cameray() + (cameraheight() * 0.45), obj_marker))
                        {
                            scr_darksize();
                            x -= 6;
                            y += 46;
                            image_xscale *= -1;
                            sprite_index = spr_trial_podium;
                            image_speed = 0;
                            depth = 99;
                            victim_marker = true;
                        }
                    });
                    msgset_add(stringsetloc("State yer case, victum!/%", "obj_yellow_enemy_slash_Step_0_gml_304_0"), x - 25, y + 25, 10, 50);
                    msgset_add(stringsetloc("I was crushed flat^3&without permission./%", "obj_yellow_enemy_slash_Step_0_gml_305_0"), flor_x, flor_y, 13, 50);
                    msgset_add(stringsetloc("It's cool though./%", "obj_yellow_enemy_slash_Step_0_gml_306_0"), flor_x, flor_y, 13, 50, function()
                    {
                    });
                    msgset_add(stringsetloc("COOL AND ILLEGAL!!!^3&What criminells could&do such a crime!!^2&Find 'em!!/%", "obj_yellow_enemy_slash_Step_0_gml_308_0"), x - 20, y + 55, 10, 50, function()
                    {
                        with (obj_marker)
                        {
                            if (variable_instance_exists(id, "victim_marker"))
                                instance_destroy();
                        }
                    });
                    break;
                
                case 1:
                    msgset_add(stringsetloc("I'll be victum&this time!/%", "obj_yellow_enemy_slash_Step_0_gml_316_0"), x - 20, y + 55, 10, 50);
                    msgset_add(stringsetloc("My favoritest&yellerest shirt&done was&vandalismed!/%", "obj_yellow_enemy_slash_Step_0_gml_317_0"), x - 20, y + 55, 10, 50);
                    msgset_add(stringsetloc("Half of it's&all black and&smelly!/%", "obj_yellow_enemy_slash_Step_0_gml_318_0"), x - 20, y + 55, 10, 50);
                    msgset_add(stringsetloc("What kinda sick&criminell messes&with a man's shirt!?^2&Find 'em!/%", "obj_yellow_enemy_slash_Step_0_gml_319_0"), x - 20, y + 55, 10, 50);
                    break;
                
                case 2:
                    msgset_add_func(function()
                    {
                        with (instance_create(camerax() + (camerawidth() * 0.5), cameray() + (cameraheight() * 0.45), obj_marker))
                        {
                            y -= 30;
                            scr_darksize();
                            sprite_index = spr_enemy_green_walk;
                            image_speed = 0;
                            depth = 100;
                            victim_marker = true;
                        }
                        
                        with (instance_create(camerax() + (camerawidth() * 0.5), cameray() + (cameraheight() * 0.45), obj_marker))
                        {
                            scr_darksize();
                            x -= 6;
                            y += 46;
                            image_xscale *= -1;
                            sprite_index = spr_trial_podium;
                            image_speed = 0;
                            depth = 99;
                            victim_marker = true;
                        }
                    });
                    msgset_add(stringsetloc("Green, state yer&case!!/%", "obj_yellow_enemy_slash_Step_0_gml_347_0"), x - 20, y + 25, 10, 50);
                    msgset_add_func(function()
                    {
                        talked = -1;
                        scr_var_delay("talked", 1, 10);
                    });
                    msgset_add("/%", -99999, -99999, 0, 36, function()
                    {
                        with (obj_marker)
                        {
                            if (sprite_index == spr_enemy_green_walk)
                            {
                                sprite_index = scr_84_get_sprite("spr_green_sign_big");
                                
                                image_index = 0;
                                image_speed = 0;
                            }
                        }
                        
                        talked = -1;
                        scr_var_delay("talked", 1, 45);
                    });
                    msgset_add(stringsetloc("A stealer, huh!?^2&You better find 'em!!/%", "obj_yellow_enemy_slash_Step_0_gml_364_0"), x - 20, y + 55, 10, 50, function()
                    {
                        with (obj_marker)
                        {
                            if (variable_instance_exists(id, "victim_marker"))
                                instance_destroy();
                        }
                    });
                    break;
                
                case 3:
                    msgset_add(stringsetloc("What!?^1 I'm victum again!?^1&My secretest petals done&was STOLENED?!/%", "obj_yellow_enemy_slash_Step_0_gml_372_0"), x - 20, y + 40, 10, 50, function()
                    {
                        idlesprite = spr_yellow_shock_left;
                    });
                    msgset_add(stringsetloc("How could that be!?&I done never told&nobody 'bout those!/%", "obj_yellow_enemy_slash_Step_0_gml_375_0"), x - 20, y + 40, 10, 50, function()
                    {
                        idlesprite = spr_yellow_embarassed;
                    });
                    msgset_add(stringsetloc("Those was for someone&SPECIAL... rrrggghhh!!/%", "obj_yellow_enemy_slash_Step_0_gml_378_0"), x - 20, y + 40, 10, 50, function()
                    {
                        idlesprite = spr_yellow_hat_down;
                    });
                    msgset_add(stringsetloc("I'll NEVER FORGIVE&who did this!!^1&NEVER!!/%", "obj_yellow_enemy_slash_Step_0_gml_381_0"), x - 20, y + 40, 10, 50);
                    break;
            }
            
            msgset_add_func(function()
            {
                idlesprite = spr_yellow_idle;
                actcon = 0.1;
            });
            yellow_balloon();
            actcon = 0.075;
        }
    }
    
    if (actcon == 0.075)
    {
        if (talked == 1 && cantalk)
            yellow_balloon_control();
    }
    
    if (actcon == 0.1)
    {
        if (!i_ex(obj_writer))
        {
            actcon = 0.2;
            
            with (obj_yellow_trial_manager)
                begin_trial();
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

if (blockcon == 1)
{
    blocktimer++;
    
    if (blocktimer == 30)
    {
        x = xstart;
        y = ystart;
        hurtsprite = spr_yellow_dumbfounded;
        global.monsterx[myself] = obj_yellow_enemy.x;
        global.monstery[myself] = obj_yellow_enemy.y;
        blockcon = 0;
        blocktimer = 0;
        state = 0;
    }
}

if (healingraincon == 1)
{
    with (obj_writer)
        instance_destroy();
    
    msgsetloc(0, "* BLUE cast HEALING RAIN on YELLOW!/%", "obj_yellow_enemy_slash_Step_0_gml_445_0");
    scr_battletext_default();
    healingraincon = 2;
    idlesprite = spr_yellow_looksup;
    instance_create(obj_blue_enemy.x, obj_blue_enemy.y, obj_healing_rain);
}

if (healingraincon == 2)
{
    global.turntimer = 999;
    
    if (!instance_exists(obj_writer) && !i_ex(obj_healing_rain))
    {
        idlesprite = spr_yellow_idle;
        healingraincon = 0;
        healingraintimer = 0;
        global.turntimer = 2;
        global.fc = 0;
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
