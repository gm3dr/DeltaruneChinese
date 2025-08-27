if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    x_offset = -58;
    kris_marker = scr_dark_marker(1930, 862, spr_krisr_dark);
    susie_marker = scr_dark_marker(2100 + x_offset, 850, spr_susie_ralsei_hand_push);
    susie_marker.image_index = 1;
    susie_hand_marker = scr_dark_marker(2224 + x_offset, cameray() - 40, spr_susie_ralsei_grab_hand);
    
    with (susie_hand_marker)
        scr_depth();
    
    global.interact = 1;
    global.facing = 1;
}

if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    ra = actor_count + 1;
    ra_actor = instance_create(2164 + x_offset, cameray() - 200, obj_actor);
    scr_actor_setup(ra, ra_actor, "ralsei");
    ra_actor.sprite_index = spr_ralsei_walk_left_sad;
    su = actor_count + 2;
    su_actor = instance_create(susie_marker.x, susie_marker.y, obj_actor);
    scr_actor_setup(su, su_actor, "susie");
    su_actor.sprite_index = susie_marker.sprite_index;
    c_sel(su);
    c_autowalk(0);
    c_imageindex(1);
    c_sel(kr);
    c_facing("r");
    c_setxy(kris_marker.x, kris_marker.y);
    c_var_instance(kris_marker, "visible", 0);
    c_var_instance(susie_marker, "visible", 0);
    c_speaker("susie");
    c_msgsetloc(0, "\\EU* But Ralsei^1, how can you say you're not real!?/", "obj_ch3_PGS01F_slash_Step_0_gml_54_0");
    c_msgnextloc("\\ED* I can see you..^1. I can feel you..^1. I can hear you.../", "obj_ch3_PGS01F_slash_Step_0_gml_55_0");
    c_msgnextloc("\\EU* \"Normal objects\" don't have..^1. feelings and stuff!/%", "obj_ch3_PGS01F_slash_Step_0_gml_56_0");
    c_talk_wait();
    c_wait(60);
    c_sel(su);
    c_autowalk(0);
    c_imageindex(2);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E8* That's right^1, Susie./%", "obj_ch3_PGS01F_slash_Step_0_gml_68_0");
    c_talk_wait();
    c_sel(su);
    c_imageindex(3);
    c_wait(8);
    c_imageindex(4);
    c_wait(8);
    c_imageindex(5);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_unhappy);
    c_setxy(ra_actor.x, 850);
    c_autowalk(0);
    c_imagespeed(0.25);
    c_walkdirect(ra_actor.x + 46, 850, 16);
    c_delaycmd(17, "imagespeed", 0);
    c_delaycmd(17, "imageindex", 0);
    c_wait(30);
    c_sel(ra);
    c_sprite(spr_ralsei_head_down_smile_left);
    c_sel(su);
    c_sprite(spr_susie_look_back);
    c_halt();
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ea* They..^1. shouldn't./%", "obj_ch3_PGS01F_slash_Step_0_gml_99_0");
    c_talk_wait();
    c_wait(30);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ec* That's why..^1. I don't want you and Kris.../", "obj_ch3_PGS01F_slash_Step_0_gml_105_0");
    c_msgnextloc("\\Ee* ..^1. to worry too much about us^1, OK?/%", "obj_ch3_PGS01F_slash_Step_0_gml_106_0");
    c_talk_wait();
    c_wait(15);
    c_sel(ra);
    c_facing("r");
    c_wait(50);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ea* It's funny^1, I was..^1. overjoyed to make friends./", "obj_ch3_PGS01F_slash_Step_0_gml_119_0");
    c_msgnextloc("\\Ee* Then^1, selfishly^1, I..^1. started feeling sad^1, too./", "obj_ch3_PGS01F_slash_Step_0_gml_120_0");
    c_msgnextloc("\\EB* Sad I couldn't be your friend in real life^1, Susie./", "obj_ch3_PGS01F_slash_Step_0_gml_121_0");
    c_msgnextloc("\\EB* That I CAN'T do your homework^1. That I can't go with you./", "obj_ch3_PGS01F_slash_Step_0_gml_122_0_b");
    c_msgnextloc("\\Ee* That I..^1. can't be there to help you when you really need me./", "obj_ch3_PGS01F_slash_Step_0_gml_122_0");
    c_facenext("susie", "R");
    c_msgnextloc("\\ER* Ralsei.../", "obj_ch3_PGS01F_slash_Step_0_gml_124_0");
    c_facenext("ralsei", "8");
    c_msgnextloc("\\E8* I'm sorry. That's why I..^1. If^1, you know^1, me^1, Lancer.../", "obj_ch3_PGS01F_slash_Step_0_gml_126_0");
    c_msgnextloc("\\Ec* We can't do it all^1. So..^1. if you ever feel like we're not enough.../%", "obj_ch3_PGS01F_slash_Step_0_gml_127_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_right_sad);
    c_wait_box(2);
    c_sel(ra);
    c_sprite(spr_ralsei_head_down_smile_right);
    c_sel(su);
    c_sprite(spr_susie_look_react);
    c_halt();
    c_wait_box(5);
    c_sel(su);
    c_sprite(spr_susie_look_down_right_smile);
    c_addxy(0, -4);
    c_halt();
    c_wait_talk();
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_look_react);
    c_addxy(0, 4);
    c_halt();
    c_sel(ra);
    c_facing("u");
    c_wait(30);
    c_sprite(spr_ralsei_look_up);
    c_wait(30);
    c_imageindex(1);
    c_wait(10);
    c_imageindex(2);
    c_wait(10);
    c_imageindex(3);
    c_wait(30);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ee* Just forget about us and make some real friends^1, okay?/", "obj_ch3_PGS01F_slash_Step_0_gml_171_0");
    c_facenext("susie", "V");
    c_msgnextloc("\\EV* ..^1. Ralsei..^1. you.../%", "obj_ch3_PGS01F_slash_Step_0_gml_173_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_look_down);
    c_imagespeed(0.3);
    c_wait_talk();
    c_sel(su);
    c_walkdirect_wait(su_actor.x + 34, 850, 3);
    c_autowalk(0);
    c_sprite(spr_susie_ralsei_grab);
    c_halt();
    c_sel(su);
    c_imagespeed(0);
    c_imageindex(0);
    c_wait(1);
    c_imageindex(1);
    c_wait(1);
    c_imageindex(2);
    c_wait(1);
    c_imageindex(3);
    c_sound_play(164);
    c_sel(ra);
    c_visible(0);
    c_wait(1);
    c_sel(su);
    c_imageindex(4);
    c_wait(1);
    c_imageindex(5);
    c_wait(1);
    c_imageindex(6);
    c_wait(1);
    c_imageindex(7);
    c_wait(1);
    c_var_instance(susie_hand_marker, "depth", 90500);
    c_var_instance(susie_hand_marker, "y", 888);
    c_var_instance(susie_hand_marker, "image_speed", 0.25);
    c_speaker("susie");
    c_msgsetloc(0, "\\EJ* You idiot^1! How can you SAY that?!/", "obj_ch3_PGS01F_slash_Step_0_gml_221_0");
    c_msgnextloc("\\Eb* You think I could just FORGET you!?/", "obj_ch3_PGS01F_slash_Step_0_gml_222_0");
    c_msgnextloc("\\EI* Forget Lancer!? Forget everyone!?/", "obj_ch3_PGS01F_slash_Step_0_gml_223_0");
    c_msgnextloc("\\Ec* I don't care what you say you are.../", "obj_ch3_PGS01F_slash_Step_0_gml_225_0");
    c_msgnextloc("\\Ed* You're real to me^1, OK!?/", "obj_ch3_PGS01F_slash_Step_0_gml_226_0");
    c_facenext("ralsei", "b");
    c_msgnextloc("\\Eb* .../", "obj_ch3_PGS01F_slash_Step_0_gml_228_0");
    c_msgnextloc("\\E8* Susie^1, I.../", "obj_ch3_PGS01F_slash_Step_0_gml_229_0");
    c_msgnextloc("\\Ea* I'm happy to hear that^1, but.../", "obj_ch3_PGS01F_slash_Step_0_gml_230_0");
    c_facenext("susie", "b");
    c_msgnextloc("\\Eb* SHUT UP and listen to me!/", "obj_ch3_PGS01F_slash_Step_0_gml_234_0");
    c_msgnextloc("\\EI* No matter what you say.../", "obj_ch3_PGS01F_slash_Step_0_gml_235_0");
    c_msgnextloc("\\Eb* No matter what you are.../", "obj_ch3_PGS01F_slash_Step_0_gml_236_0");
    c_msgnextloc("\\Ec* Me..^1. you..^1. Kris..^1. We're a TEAM^1, alright?/", "obj_ch3_PGS01F_slash_Step_0_gml_237_0");
    c_msgnextloc("\\Ed* None of us are gonna forget each other!/", "obj_ch3_PGS01F_slash_Step_0_gml_238_0");
    c_msgnextloc("\\Eb* So please.../", "obj_ch3_PGS01F_slash_Step_0_gml_243_0");
    c_msgnextloc("\\Ec* Just.../", "obj_ch3_PGS01F_slash_Step_0_gml_244_0");
    c_msgnextloc("\\Ed* ..^1. just.../%", "obj_ch3_PGS01F_slash_Step_0_gml_245_0");
    c_talk();
    c_wait_box(3);
    c_var_instance(susie_hand_marker, "visible", 0);
    c_sel(su);
    c_sound_play(155);
    c_sprite(spr_susie_ralsei_shake);
    c_setxy(2138, 850);
    c_animate(0, 1, 0.25);
    c_wait(6);
    c_var_instance(susie_hand_marker, "visible", 1);
    c_wait_box(7);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_ralsei_grab_look_away_01);
    c_setxy(2076, 850);
    c_wait_box(8);
    c_sel(su);
    c_sprite(spr_susie_ralsei_grab_look_away_smile);
    c_wait_box(10);
    c_var_instance(susie_hand_marker, "visible", 0);
    c_sel(su);
    c_sound_play(216);
    c_sprite(spr_susie_ralsei_grab_look_away_01_shake);
    c_animate(0, 1, 0.25);
    c_wait(6);
    c_var_instance(susie_hand_marker, "visible", 1);
    c_wait_box(11);
    c_sprite(spr_susie_ralsei_grab_look_away_01);
    c_wait_box(15);
    c_var_instance(susie_hand_marker, "visible", 1);
    c_var_instance(susie_hand_marker, "image_speed", 0.15);
    c_sel(su);
    c_sprite(spr_susie_ralsei_grab_plead);
    c_halt();
    c_var_instance(susie_hand_marker, "visible", 0);
    c_wait_box(16);
    c_sel(su);
    c_imageindex(1);
    c_wait_talk();
    c_wait(60);
    c_sel(kr);
    c_autodepth(0);
    c_depth(spotlight_fx.depth + 10);
    c_var_instance(spotlight_fx, "visible", 1);
    c_soundplay(snd_locker);
    c_soundplay(snd_impact);
    c_sel(su);
    c_sprite(spr_susie_ralsei_grab_plead_shock);
    c_wait(60);
    c_mus2("initloop", "berdly_audience.ogg", 0);
    c_mus2("volume", 0, 0);
    c_wait(1);
    c_mus2("volume", 1, 30);
    c_var_instance(id, "confetti_pop", true);
    scr_funnytext_init(0, 8, -58, scr_84_get_sprite("spr_funnytext_amazing_01"), 0, 0);
    scr_funnytext_init(1, 0, 0, scr_84_get_sprite("spr_funnytext_tears"), 0, 0);
    scr_funnytext_init(2, 0, 0, scr_84_get_sprite("spr_funnytext_tears"), 0, 0);
    c_speaker("tenna");
    c_msgsetloc(0, "* Wow^1, what an \\O0&                 performance!!!/", "obj_ch3_PGS01F_slash_Step_0_gml_325_0");
    c_msgnextloc("* The audience has been brought to \\O1^1, folks!/%", "obj_ch3_PGS01F_slash_Step_0_gml_326_0");
    c_talk_wait();
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_ralsei_grab_exasperated);
    c_shakeobj();
    c_soundplay(snd_grab);
    c_wait(30);
    c_var_instance(id, "both_talk", true);
    c_wait(30);
    c_waitcustom();
}

if (con == 3 && customcon == 1 && !d_ex())
{
    con = 4;
    customcon = 0;
    
    if (scr_get_vhs_ini_value() == 1)
        con = 10;
    
    c_waitcustom_end();
    c_mus2("volume", 0, 15);
    c_speaker("tenna");
    c_msgsetloc(0, "* Haha^1, I was hoping you'd ask!/", "obj_ch3_PGS01F_slash_Step_0_gml_354_0");
    c_msgnextloc("* MIKE^1, PLAY THE VHS!!!/%", "obj_ch3_PGS01F_slash_Step_0_gml_356_0");
    c_talk_wait();
    c_pannable(1);
    c_var_instance(id, "camera_pan", true);
    c_wait(30);
    c_var_instance(id, "show_border", true);
    c_lerp_var_instance(blackall, "image_alpha", 0, 1, 30);
    c_mus("free_all");
    c_wait(60);
    c_pannable(0);
    c_waitcustom();
}

if (con == 4 && customcon == 1)
{
    con = 20;
    customcon = 0;
    c_waitcustom_end();
    c_sel(kr);
    c_facing("d");
    c_var_instance(spotlight_fx, "visible", 0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}

if (con == 10 && customcon == 1 && !d_ex())
{
    con = 11;
    
    with (spotlight_fx)
        instance_destroy();
    
    with (blackall)
        depth = 5000;
    
    camerax_set(0);
    cameray_set(0);
    global.choice = -1;
    global.choicemsg[0] = (global.lang == "ja") ? "#VTRを#スキップ" : /*"#Skip the#video"*/"#跳过#视频";
    global.choicemsg[1] = (global.lang == "ja") ? "#それでも#まだ見る" : /*"#Try and#watch anyway"*/"#再次尝试#播放";
    global.choicemsg[2] = stringset("");
    global.choicemsg[3] = stringset("");
    var prompt_text = (global.lang == "ja") ? "＊ おーっとぉ！&　 VTRの様子がおかしいぞ！/" : /*"* W-Wait^1! The VHS isn't working!/"*/"* 等等^1! 录像带播放不了!/";
    scr_speaker("tenna");
    msgset(0, prompt_text);
    msgnext("\\C2 ");
    var d = d_make();
    d.zurasu = 0;
}

if (con == 11 && global.choice != -1)
{
    k_d();
    
    if (global.choice == 0)
    {
        con = 15;
    }
    else
    {
        con = 4;
        c_waitcustom_end();
        c_wait(30);
        c_waitcustom();
    }
}

if (con == 15 && !d_ex())
{
    con = 99;
    global.plot = 50;
    room_goto(room_dw_tv_cutscene1g);
    exit;
}

if (con == 20 && !i_ex(obj_cutscene_master))
{
    global.plot = 50;
    scr_set_vhs_ini_value(1);
    con = 99;
    room_goto(room_dw_couch_video);
}

if (both_talk)
{
    both_talk_timer++;
    
    if (both_talk_timer == 1)
    {
        global.typer = 79;
        global.fc = 1;
        msgsetloc(0, "\\EH* Who the HECK&are you!?/%", "obj_ch3_PGS01F_slash_Step_0_gml_403_0");
        both_writer = d_make();
        both_writer.stay = 20;
    }
    
    if (both_talk_timer == 3)
        ralsei_face_marker.visible = 1;
    
    if (both_talk_timer >= 3 && !i_ex(obj_writer))
    {
        ralsei_face_marker.visible = 0;
        both_talk = false;
    }
}

if (confetti_pop)
{
    confetti_pop = false;
    var confetti_popper = scr_confetti(camerax(), cameray() + 300, 15, 80, 100, 890, 950, 1, 1);
    confetti_popper.miny = 870;
    confetti_popper.maxy = 968;
    confetti_popper.topdrop = -1;
    confetti_popper.bottomdrop = -1;
    confetti_popper.fade = 1;
    confetti_popper = scr_confetti(camerax() + view_wport[0], cameray() + 300, 165, 80, 100, 890, 950, 1, 1);
    confetti_popper.miny = 870;
    confetti_popper.maxy = 968;
    confetti_popper.topdrop = -1;
    confetti_popper.bottomdrop = -1;
    confetti_popper.fade = 1;
}

if (camera_pan)
{
    camera_pan_timer++;
    
    if (camera_pan_timer == 1)
        scr_lerpvar("camera_y_pos", cameray(), -500, 60, 3, "in");
    
    camera_set_view_pos(view_get_camera(0), camerax(), camera_y_pos);
}

if (show_border)
{
    show_border = false;
    
    with (obj_border_controller)
        show_border();
}
