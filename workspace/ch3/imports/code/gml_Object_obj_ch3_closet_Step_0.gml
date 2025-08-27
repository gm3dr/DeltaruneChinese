if (both_talk)
{
    if (both_talk_timer == 0 && d_ex())
        exit;
    
    both_talk_timer++;
    
    if (both_talk_timer == 1)
    {
        global.interact = 1;
        global.typer = 79;
        global.fc = 1;
        both_talk_con = (scr_flag_get(1039) == 2) ? 0 : 1;
        msgsetloc(0, "\\EK* (Why...)/%", "obj_ch3_closet_slash_Step_0_gml_16_0");
        
        if (both_talk_con == 1)
        {
            ralsei_face_marker.image_index = 22;
            msgsetloc(0, "\\EK* (Good...)/%", "obj_ch3_closet_slash_Step_0_gml_21_0");
        }
        
        both_writer = d_make();
    }
    
    if (both_talk_timer == 3)
        ralsei_face_marker.visible = 1;
    
    if (both_talk_timer >= 3 && !i_ex(obj_writer))
    {
        global.interact = 0;
        ralsei_face_marker.visible = 0;
        both_talk = false;
        both_talk_timer = 0;
    }
}

if (con < 0)
    exit;

if (con == 0 && global.interact == 0 && !d_ex())
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
}

if (con == 2)
{
    con = alt_scene ? 20 : 10;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    te = actor_count + 1;
    te_actor = instance_create(camerax() + view_wport[0] + 420, cameray() + 250, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_hurt;
    
    if (alt_scene)
    {
        sp = actor_count + 2;
        sp_actor = instance_create(camerax() + view_wport[0] + 420, cameray() + 250, obj_actor);
        scr_actor_setup(sp, sp_actor, "spamton");
        sp_actor.sprite_index = spr_spamton_jump_air_center;
        sp_actor.image_xscale = 0;
        sp_actor.image_yscale = 0;
        c_sel(sp);
        c_visible(0);
        spamton_flash = instance_create(sp_actor.x, sp_actor.y, obj_whiteout);
        var _target = sp_actor;
        
        with (spamton_flash)
            start_whiteout(1, _target, true);
    }
    
    c_sel(kr);
    c_walkdirect(312, 152, 5);
    c_delayfacing(6, "u");
    c_sel(su);
    c_walkdirect(360, 160, 15);
    c_delayfacing(16, "u");
    c_sel(ra);
    c_walkdirect_speed_wait(258, 164, 6);
    c_facing("u");
    c_wait(15);
    c_sound_play(168);
    c_var_instance(drawer, "image_index", 1);
    c_shakeobj_instance(drawer);
    c_wait(5);
    c_var_instance(id, "pipis_arrive", true);
    c_sel(kr);
    c_autowalk(0);
    c_sprite(spr_krisr_dark);
    c_imagespeed(0.2);
    c_walkdirect(255, 154, 8);
    c_delaycmd(9, "imagespeed", 0);
    c_delaycmd(9, "imageindex", 0);
    c_delayfacing(14, "d");
    c_sel(su);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect_speed(360, 220, 6);
    c_sel(ra);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect_speed_wait(258, 220, 6);
    c_halt();
    c_sel(su);
    c_halt();
    c_wait(60);
    c_sel(ra);
    c_autowalk(1);
    c_walkdirect_speed_wait(258, 214, 4);
    c_msgside("bottom");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EL* H-huh...? This is.../%", "obj_ch3_closet_slash_Step_0_gml_121_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_shock_r);
    c_shakeobj();
    c_emote("!", 30);
    c_wait(30);
    c_sel(ra);
    c_facing("r");
    c_sel(kr);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\EG* Damn^1, Tenna's coming^1! Split!/%", "obj_ch3_closet_slash_Step_0_gml_140_0");
    c_talk_wait();
    c_sel(kr);
    c_autowalk(1);
    c_walkdirect_speed(-70, 154, 15);
    c_sel(ra);
    c_autowalk(1);
    c_walkdirect_speed(-70, 214, 15);
    c_sel(su);
    c_autowalk(1);
    c_walkdirect_speed_wait(-70, 220, 15);
    c_wait(30);
    c_sound_play(155);
    c_var_lerp_instance(te_actor, "x", camerax() + view_wport[0] + 420, camerax() + 435, 15, -1, "out");
    c_wait(30);
    c_waitcustom();
}

if (con == 10 && customcon == 1)
{
    con = 30;
    customcon = 0;
    c_waitcustom_end();
    c_sel(te);
    c_shakeobj();
    c_msgside("bottom");
    c_speaker("tenna");
    c_msgsetloc(0, "* Wh..^1. What? How did this...!?/%", "obj_ch3_closet_slash_Step_0_gml_175_0");
    c_talk_wait();
    c_var_instance(te_actor, "sprite_index", spr_tenna_tie_adjust_a);
    c_tenna_preset(20);
    c_speaker("tenna");
    c_msgsetloc(0, "* I..^1. I don't know what this is!!!/%", "obj_ch3_closet_slash_Step_0_gml_185_0");
    c_talk_wait();
    c_tenna_preset(0);
    c_tenna_sprite(3963);
    c_tenna_preset(8);
    c_var_instance(id, "rabble_start", true);
    c_sound_play(39);
    c_wait(30);
    c_speaker("no_name");
    c_msgsetloc(0, "* Tenna^1, is that..^1. yours...?/", "obj_ch3_closet_slash_Step_0_gml_201_0");
    c_msgnextloc("* It's a shame^1, who knew Tenna was into this stuff?/", "obj_ch3_closet_slash_Step_0_gml_202_0");
    c_msgnextloc("* Gross.../%", "obj_ch3_closet_slash_Step_0_gml_203_0");
    c_talk_wait();
    c_wait(30);
    c_tenna_preset(0);
    c_wait(30);
    c_tenna_sprite(1991);
    c_wait(30);
    c_var_instance(id, "rabble_start", false);
    c_speaker("tenna");
    c_msgsetloc(0, "* S-so I saved one.../%", "obj_ch3_closet_slash_Step_0_gml_220_0");
    c_talk_wait();
    c_var_instance(id, "rabble_leave", true);
    c_var_instance(id, "rabble_leave_con", 0);
    c_wait(30);
    c_tenna_preset(12);
    c_speaker("tenna");
    c_msgsetloc(0, "* W-what's the big deal!? Everyone does it!!!/", "obj_ch3_closet_slash_Step_0_gml_232_0");
    c_msgnextloc("* C'mon^1, don't act like you've never had one before!!!/%", "obj_ch3_closet_slash_Step_0_gml_236_0");
    c_talk();
    c_wait_box(1);
    c_tenna_preset(13);
    c_var_instance(id, "rabble_leave_con", 1);
    c_wait_talk();
    c_wait(30);
    c_var_lerp_to_instance(te_actor, "x", camerax() + view_wport[0] + 220, 60, 4, "out");
    c_speaker("tenna");
    c_msgsetloc(0, "* C'MON!!!!/%", "obj_ch3_closet_slash_Step_0_gml_251_0");
    c_talk_wait();
    c_wait(60);
    c_var_instance(id, "rabble_leave", false);
    c_sel(kr);
    c_setxy(camerax() - 70, 191);
    c_sel(su);
    c_setxy(camerax() - 70, 176);
    c_sel(ra);
    c_setxy(camerax() - 70, 181);
    c_sel(kr);
    c_autowalk(1);
    c_walkdirect_speed(155, 191, 6);
    c_wait(15);
    c_sel(su);
    c_autowalk(1);
    c_walkdirect_speed(99, 176, 6);
    c_wait(15);
    c_sel(ra);
    c_autowalk(1);
    c_walkdirect_speed_wait(49, 181, 6);
    c_waitcustom();
}

if (con == 20 && customcon == 1)
{
    con = 30;
    customcon = 0;
    c_waitcustom_end();
    c_sel(te);
    c_shakeobj();
    c_msgside("bottom");
    c_speaker("tenna");
    c_msgsetloc(0, "* What the-- how did THIS get out here!?/%", "obj_ch3_closet_slash_Step_0_gml_326_0");
    c_talk_wait();
    c_tenna_preset(0);
    c_tenna_sprite(3963);
    c_tenna_preset(8);
    c_speaker("tenna");
    c_msgsetloc(0, "* My secret...^1! No^1! Everyone..^1. Everyone's gonna know I.../%", "obj_ch3_closet_slash_Step_0_gml_336_0");
    c_talk_wait();
    c_snd_play(168);
    c_tenna_preset(0);
    c_wait(1);
    c_sel(te);
    c_autowalk(0);
    c_sprite(spr_tenna_desperate);
    c_halt();
    c_shakeobj();
    c_speaker("tenna");
    c_msgsetloc(0, "* It's..^1. It's over./", "obj_ch3_closet_slash_Step_0_gml_351_0");
    c_msgnextloc("* I'm at my limit..^1. If only anyone was here for me.../", "obj_ch3_closet_slash_Step_0_gml_352_0");
    c_msgnextloc("* I'd even take that little mailman.../", "obj_ch3_closet_slash_Step_0_gml_353_0");
    c_facenext("no_name", 0);
    c_msgnextsubloc("* (Suddenly the \\cY[~1]\\cW came out of your inventory...!?)/%", item_name, "obj_ch3_closet_slash_Step_0_gml_355_0");
    c_talk();
    c_wait_box(1);
    c_imageindex(2);
    c_shakeobj();
    c_wait_box(2);
    c_imageindex(3);
    c_shakeobj();
    c_wait_box(3);
    c_snd_play(494);
    c_wait_talk();
    c_var_instance(item_marker, "x", camerax() - 40);
    c_var_instance(item_marker, "y", cameray() + 220);
    c_var_instance(item_marker, "visible", true);
    c_var_lerp_to_instance(item_marker, "x", 204, 60);
    c_sel(sp);
    c_setxy(204, cameray() + 220);
    c_wait(60);
    c_visible(1);
    c_var_instance(id, "item_transform", true);
    c_wait(15);
    c_wait_if(id, "item_transform", "=", false);
    c_wait(15);
    c_sel(sp);
    c_sprite(spr_spamton_idle);
    c_addxy(-24, -30);
    c_flip("x");
    c_snd_play(216);
    c_var_lerp_to_instance(sp_actor, "y", 205, 2);
    c_wait(2);
    c_shakeobj();
    c_wait(30);
    c_var_lerp("siner_amplitude0", 0, 2, 1);
    c_var("siner_add0", 2);
    c_speaker("spamton");
    c_msgsetloc(0, "* [Trash heap]!!^1! YOU KEPT IT!!^1! YOU REALLY DO CARE!!!/%", "obj_ch3_closet_slash_Step_0_gml_410_0");
    c_talk_wait();
    c_snd_play(155);
    c_sel(te);
    c_imageindex(4);
    c_emote("!", 30, 10, -150);
    c_wait(30);
    c_sel(sp);
    c_var("siner_amplitude0", 0);
    c_var("siner_add0", 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* WHAT THE...!?/%", "obj_ch3_closet_slash_Step_0_gml_427_0");
    c_talk_wait();
    c_sel(te);
    c_tenna_preset(36);
    c_lerp_var_instance(te_actor, "x", 470, 540, 10, 1, "out");
    c_wait(8);
    c_speaker("tenna");
    c_msgsetloc(0, "* HOW THE WHAT THE MAMA WHAT THE HECK THE %", "obj_ch3_closet_slash_Step_0_gml_441_0");
    mystring[0] = stringsetloc("MAMMA ", "obj_ch3_closet_slash_Step_0_gml_443_0");
    mystring[1] = stringsetloc("MAMA MIA ", "obj_ch3_closet_slash_Step_0_gml_444_0");
    mystring[2] = stringsetloc("MA ", "obj_ch3_closet_slash_Step_0_gml_445_0");
    mystring[3] = stringsetloc("WHAT THE ", "obj_ch3_closet_slash_Step_0_gml_446_0");
    mystring[4] = stringsetloc("WOAH ", "obj_ch3_closet_slash_Step_0_gml_447_0");
    mystring[5] = stringsetloc("WOH ", "obj_ch3_closet_slash_Step_0_gml_448_0");
    mystring[6] = stringsetloc("HEY ", "obj_ch3_closet_slash_Step_0_gml_449_0");
    mystring[7] = stringsetloc("HECK ", "obj_ch3_closet_slash_Step_0_gml_450_0");
    mystring[8] = stringsetloc("WHAT'S ", "obj_ch3_closet_slash_Step_0_gml_451_0");
    
    for (var __n = 0; __n < 15; __n++)
    {
        var funnystring = "* ";
        
        repeat (4 + 2 * floor(random(6))) // repeat (2 + floor(random(6)))
            funnystring += mystring[floor(random(9))];
        
        funnystring += "%";
        c_msgnext(funnystring);
    }
    
    c_msgnextloc("* MAMMA %%", "obj_ch3_closet_slash_Step_0_gml_463_0");
    c_talkwait();
    c_tenna_preset(0);
    c_wait(1);
    c_tenna_preset(-1);
    c_wait(1);
    c_sound_play(155);
    c_tenna_sprite(3839);
    c_imageindex(1);
    c_flip("x");
    c_addxy(80, 0);
    c_wait(45);
    c_tenna_preset(36);
    c_addxy(-80, 0);
    c_msgsetloc(0, "* HOW THE WHAT THE MAMA WHAT THE HECK THE %", "obj_ch3_closet_slash_Step_0_gml_481_0");
    mystring[0] = stringsetloc("MAMMA ", "obj_ch3_closet_slash_Step_0_gml_483_0");
    mystring[1] = stringsetloc("MAMA MIA ", "obj_ch3_closet_slash_Step_0_gml_484_0");
    mystring[2] = stringsetloc("MA ", "obj_ch3_closet_slash_Step_0_gml_485_0");
    mystring[3] = stringsetloc("WHAT THE ", "obj_ch3_closet_slash_Step_0_gml_486_0");
    mystring[4] = stringsetloc("WOAH ", "obj_ch3_closet_slash_Step_0_gml_487_0");
    mystring[5] = stringsetloc("WOH ", "obj_ch3_closet_slash_Step_0_gml_488_0");
    mystring[6] = stringsetloc("HEY ", "obj_ch3_closet_slash_Step_0_gml_489_0");
    mystring[7] = stringsetloc("HECK ", "obj_ch3_closet_slash_Step_0_gml_490_0");
    mystring[8] = stringsetloc("WHAT'S ", "obj_ch3_closet_slash_Step_0_gml_491_0");
    
    for (var __n = 0; __n < 5; __n++)
    {
        var funnystring = "* ";
        
        repeat (4 + 2 * floor(random(6))) // repeat (2 + floor(random(6)))
            funnystring += mystring[floor(random(9))];
        
        funnystring += "%";
        c_msgnext(funnystring);
    }
    
    c_flip("x");
    c_var_instance(te_actor, "reversal", 0);
    
    for (var __n = 0; __n < 5; __n++)
    {
        var funnystring = "* ";
        
        repeat (4 + 2 * floor(random(6))) // repeat (2 + floor(random(6)))
            funnystring += mystring[floor(random(9))];
        
        funnystring += "%";
        c_msgnext(funnystring);
    }
    
    c_msgnextloc("^4* MAMM^4A %%", "obj_ch3_closet_slash_Step_0_gml_515_0");
    c_talkwait();
    c_tenna_preset(37);
    c_speaker("tenna");
    c_msgsetloc(0, "* What the HECK is THAT THING!?/", "obj_ch3_closet_slash_Step_0_gml_525_0");
    c_msgnextloc("* Some kind of RAT!^2? Some kind of CREATURE!?/%", "obj_ch3_closet_slash_Step_0_gml_526_0");
    c_talk_wait();
    c_tenna_preset(0);
    c_wait(1);
    c_tenna_preset(-1);
    c_sel(sp);
    c_speaker("spamton");
    c_msgsetloc(0, "* DON'T YOU RECOGNIZE..^1.%%", "obj_ch3_closet_slash_Step_0_gml_536_0");
    c_talk();
    c_var_lerp_to_instance(sp_actor, "x", 254, 20, 3, "out");
    c_wait(15);
    c_waittalk();
    c_sndplay(155);
    c_speaker("tenna");
    c_tenna_sprite(105);
    c_sel(te);
    c_imageindex(0);
    c_msgsetloc(0, "* STAY AWAY FROM HER^1, you FIEND!!!/%", "obj_ch3_closet_slash_Step_0_gml_549_0");
    c_talkwait();
    c_tenna_sprite(1216);
    c_setxy(540, 228);
    c_snd_play(155);
    c_var_lerp_to_instance(te_actor, "x", 409, 20, 3, "out");
    c_wait(21);
    c_script_instance(id, snd_play_x, 15, 348, 1, 2);
    c_sel(sp);
    c_var_lerp("siner_amplitude1", 4, 0, 240, 3, "out");
    c_var_lerp("siner_add1", 4, 0, 240, 3, "out");
    c_autodepth(0);
    c_depth(100000);
    c_sprite(spr_spamton_foam);
    c_flip("x");
    c_imageindex(0);
    c_addxy(-50, 30);
    c_autowalk(0);
    c_var_instance(id, "spray_event", true);
    c_wait(15);
    c_wait_if(id, "spray_event", "=", false);
    c_script_instance_stop(id, snd_play_x);
    c_wait(60);
    c_snd_play(164);
    c_var_instance(pipis_marker, "visible", 0);
    c_sel(te);
    c_sprite(spr_tenna_hooray);
    c_addxy(0, 14);
    c_var_lerp_instance(te_actor, "image_index", 0, 3, 8);
    c_wait(7);
    c_var_instance(pipis_marker, "x", 376);
    c_var_instance(pipis_marker, "y", 42);
    c_var_instance(pipis_marker, "depth", 90000);
    c_var_instance(pipis_marker, "visible", 1);
    c_speaker("tenna");
    c_msgsetloc(0, "* Oh^1, my little darling^1! Are you okay!?/", "obj_ch3_closet_slash_Step_0_gml_610_0");
    c_msgnextloc("* Did that overly small weird unidentifiable thing hurt you!?/%", "obj_ch3_closet_slash_Step_0_gml_611_0");
    c_talk();
    c_wait_box(1);
    c_sel(te);
    c_flip("x");
    c_var_instance(pipis_marker, "x", 460);
    c_var_instance(id, "pipis_stick", true);
    c_wait_talk();
    c_speaker("tenna");
    c_msgsetloc(0, "* Don't worry^1! You're gonna go someplace SAFE!!!/%", "obj_ch3_closet_slash_Step_0_gml_627_0");
    c_talk_wait();
    c_snd_play(155);
    c_var_lerp_to_instance(te_actor, "x", camerax() + view_wport[0] + 300, 30, 3, "in");
    c_wait(90);
    c_sel(kr);
    c_setxy(camerax() - 70, 191);
    c_sel(su);
    c_setxy(camerax() - 70, 174);
    c_sel(ra);
    c_setxy(camerax() - 70, 181);
    c_sel(kr);
    c_autowalk(1);
    c_walkdirect_speed(127, 191, 3);
    c_wait(18);
    c_sel(su);
    c_autowalk(1);
    c_walkdirect_speed(65, 176, 3);
    c_wait(15);
    c_sel(ra);
    c_autowalk(1);
    c_walkdirect_speed_wait(15, 181, 3);
    c_wait(60);
    c_speaker("spamton");
    c_msgsetloc(0, "* KRIS./", "obj_ch3_closet_slash_Step_0_gml_668_0");
    c_msgnextloc("* I'M NEVER [Doing that] AGAIN./%", "obj_ch3_closet_slash_Step_0_gml_669_0");
    c_talk_wait();
    c_var_lerp_to_instance(sp_actor, "x", 155, 8);
    c_wait(4);
    c_var_instance(id, "spamton_absorb", true);
    c_wait(15);
    c_wait_if(id, "spamton_absorb", "=", false);
    c_wait(15);
    c_speaker("no_name");
    c_msgsetsubloc(0, "* (\\cY[~1]\\cW returned to your inventory.)/%", item_name, "obj_ch3_closet_slash_Step_0_gml_685_0");
    c_talk_wait();
    c_var_instance(pipis_marker, "visible", false);
    c_waitcustom();
}

if (spamton_absorb)
{
    spamton_absorb_timer++;
    
    if (spamton_absorb_timer == 1)
    {
        spamton_flash = instance_create(sp_actor.x, sp_actor.y, obj_whiteout);
        var _target = sp_actor;
        
        with (spamton_flash)
            start_whiteout(4, _target, true);
        
        kris_flash = instance_create(kr_actor.x, kr_actor.y, obj_whiteout);
        _target = kr_actor;
        
        with (kris_flash)
            start_whiteout(4, _target, true);
    }
    
    if (spamton_absorb_timer == 6)
    {
        snd_play(snd_hypnosis);
        scr_lerp_var_instance(sp_actor, "image_xscale", 2, 0, 4);
        scr_lerp_var_instance(sp_actor, "image_yscale", 2, 0, 4);
    }
    
    if (spamton_absorb_timer == 11)
    {
        with (spamton_flash)
            stop_whiteout(4);
        
        with (kris_flash)
            stop_whiteout(4);
    }
    
    if (spamton_absorb_timer == 15)
    {
        spamton_absorb = false;
        spamton_absorb_timer = 0;
    }
}

if (pipis_stick)
{
    pipis_stick = false;
    var _target = te_actor;
    
    with (pipis_marker)
        scr_stickto(_target, -10);
}

if (item_transform)
{
    item_transform_timer++;
    
    if (item_transform_timer == 1)
    {
        item_transform_counter++;
        
        if (item_transform_counter >= 1)
            item_transform_stop = true;
        
        if (item_flash == -4)
        {
            item_flash = instance_create(item_marker.x, item_marker.y, obj_whiteout);
            var _target = item_marker;
            
            with (item_flash)
                start_whiteout(4, _target, true);
        }
        
        scr_lerp_var_instance(item_marker, "image_xscale", 2, 0, 8);
        scr_lerp_var_instance(item_marker, "image_yscale", 2, 0, 8);
        scr_lerp_var_instance(sp_actor, "image_xscale", 0, 2, 8);
        scr_lerp_var_instance(sp_actor, "image_yscale", 0, 2, 8);
    }
    
    if (item_transform_timer == 9)
    {
        if (item_transform_stop)
        {
            with (item_marker)
                visible = false;
            
            with (item_flash)
                stop_whiteout(15);
            
            with (spamton_flash)
                stop_whiteout(15);
        }
        else
        {
            scr_lerp_var_instance(item_marker, "image_xscale", 0, 2, 8);
            scr_lerp_var_instance(item_marker, "image_yscale", 0, 2, 8);
            scr_lerp_var_instance(sp_actor, "image_xscale", 2, 0, 8);
            scr_lerp_var_instance(sp_actor, "image_yscale", 2, 0, 8);
        }
    }
    
    if (item_transform_timer == 18)
    {
        item_transform_timer = 0;
        
        if (item_transform_stop)
            item_transform = false;
    }
}

if (spray_event)
{
    depth = -20;
    var tx = te_actor.x - 124;
    var ty = te_actor.y - 38;
    var tangle = 220;
    var radius = 430;
    
    if (spray_event_con == 0)
    {
        spray_event_con = 1;
        remtennax = te_actor.x;
    }
    
    if (spray_event_con == 1)
    {
        te_actor.x = remtennax + random_range(-2, 2);
        var dustmarker = scr_marker(tx - 10, ty + 10, spr_ball);
        dustmarker.depth = te_actor.depth + 1;
        
        with (dustmarker)
        {
            direction = tangle + random_range(-30, 30);
            speed = 7;
            friction = 0.1;
            scr_doom(id, 60);
            scr_lerpvar("image_alpha", 0.6, 0, 60, 0);
        }
    }
    
    spray_event_timer++;
    
    if (spray_event_timer == 30)
    {
        with (sp_actor)
            image_index = 1;
    }
    
    if (spray_event_timer == 80)
    {
        with (sp_actor)
            image_index = 2;
    }
    
    if (spray_event_timer == 188)
    {
        with (sp_actor)
            image_index = 3;
    }
    
    if (spray_event_timer == 190)
    {
        with (sp_actor)
            image_index = 4;
    }
    
    if (spray_event_timer >= 240)
        spray_event = 0;
}

if (con == 30 && customcon == 1)
{
    con = 31;
    customcon = 0;
    c_waitcustom_end();
    c_wait(30);
    c_sel(ra);
    c_facing("d");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EK* Okay./%", "obj_ch3_closet_slash_Step_0_gml_289_0");
    c_talk_wait();
    c_sel(ra);
    c_facing("r");
    c_pannable(1);
    c_panobj(kr_actor, 15);
    c_wait(16);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}

if (con == 31 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
    snd_free_all();
    
    if (alt_scene)
    {
        scr_flag_set(1151, 1);
    }
    else
    {
        scr_flag_set(1039, 1);
        pipis_collider = instance_create(pipis_marker.x - 10, pipis_marker.y - 10, obj_solidblock);
        pipis_readable = instance_create(pipis_marker.x - 10, pipis_marker.y - 10, obj_readable_room1);
    }
}

if (pipis_arrive)
{
    pipis_arrive_timer++;
    
    if (pipis_arrive_timer == 1)
    {
        snd_play(snd_wing);
        pipis_marker.x = 330;
        pipis_marker.y = 200;
        pipis_marker.depth = drawer.depth - 10;
        
        with (pipis_marker)
        {
            vspeed = -10;
            gravity = 1;
            scr_lerpvar("image_angle", -25, 0, 24);
        }
    }
    
    if (pipis_arrive_timer == 25)
    {
        snd_play(snd_bump);
        
        with (pipis_marker)
        {
            vspeed = 0;
            gravity = 0;
            scr_shakeobj(id, 3, 1);
        }
    }
    
    if (pipis_arrive_timer >= 60)
        pipis_arrive = false;
}

if (rabble_start)
{
    rabble_timer++;
    
    if (rabble_timer == 1)
    {
        for (var i = 0; i < 20; i++)
        {
            var sprite = ((i % 3) == 0) ? 2822 : 4285;
            var y_offset = ((i % 4) == 0) ? 0 : 20;
            fg_markers[i] = scr_dark_marker(camerax() + (i * 40), cameray() + view_hport[0] + 100, sprite);
            var delay = ((i % 4) == 0) ? 0 : 5;
            
            with (fg_markers[i])
            {
                scr_lerpvar("y", ystart, cameray() + 260 + y_offset, 15 + delay, -1, "out");
                scr_depth();
                image_blend = c_black;
            }
            
            if ((i % 4) == 0)
            {
                with (fg_markers[i])
                {
                    scr_flip("x");
                    xstart = x;
                }
            }
        }
    }
    
    if (rabble_timer >= 25)
    {
        rabble_siner += 0.25;
        
        for (var i = 0; i < array_length(fg_markers); i++)
        {
            if ((i % 3) == 0)
                fg_markers[i].x = scr_even(fg_markers[i].xstart + (sin(rabble_siner) * 6));
            else if ((i % 2) == 0)
                fg_markers[i].x = scr_even(fg_markers[i].xstart + (sin(rabble_siner * 1.5) * 4));
            else
                fg_markers[i].x = scr_even(fg_markers[i].xstart + (sin(rabble_siner * 2) * 3));
            
            fg_markers[i].y = scr_even(fg_markers[i].y + (sin((rabble_siner / 1) + i) * 1.25));
        }
    }
    
    if ((rabble_timer % 80) == 1)
        snd_play(snd_crowd_ooh);
    
    if ((rabble_timer % 100) == 1)
        snd_play(snd_crowd_ouch);
}

if (rabble_leave)
{
    if (rabble_leave_con == 0)
    {
        rabble_leave_con = 99;
        
        for (var i = 0; i < array_length(fg_markers); i++)
        {
            if ((i % 3) == 1)
                scr_lerp_var_instance(fg_markers[i], "y", fg_markers[i].y, cameray() + view_hport[0] + 200, 240);
            else if ((i % 2) == 1)
                scr_lerp_var_instance(fg_markers[i], "y", fg_markers[i].y, cameray() + view_hport[0] + 200, 120);
        }
    }
    
    if (rabble_leave_con == 1)
    {
        rabble_leave_con = 99;
        
        for (var i = 0; i < array_length(fg_markers); i++)
        {
            if ((i % 3) == 0)
                scr_lerp_var_instance(fg_markers[i], "y", fg_markers[i].y, cameray() + view_hport[0] + 200, 240);
            else if ((i % 4) == 0)
                scr_lerp_var_instance(fg_markers[i], "y", fg_markers[i].y, cameray() + view_hport[0] + 200, 120);
            else
                scr_lerp_var_instance(fg_markers[i], "y", fg_markers[i].y, cameray() + view_hport[0] + 200, 60);
        }
    }
}
