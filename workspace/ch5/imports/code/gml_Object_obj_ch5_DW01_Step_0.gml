if (con < 0)
    exit;

if (con == 0 && global.interact == 0)
{
    if (scr_trigcheck("cutscene"))
        con = 1;
}

if (con == 1 && global.interact == 0)
{
    con = 2;
    alarm[0] = 1;
    global.interact = 1;
}

if (con == 3)
{
    con = 4;
    
    if (scr_get_video_ini_value() == 1)
        con = 5;
    
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    var aspos1 = findspriteinfo(spr_asgore_walk_right_dw, undefined);
    as = actor_count + 1;
    asgore_actor = scr_actor_quick_setup(aspos1, as, "asgoredw");
    c_pannable(1);
    c_sel(kr);
    c_facing("r");
    c_sel(su);
    c_facing("u");
    c_msgruncheck(true);
    c_speaker("susie");
    c_msgsetloc(0, "\\EI* Kris!^1! Up there!^1! Isn't that.../", "obj_ch5_DW01_slash_Step_0_gml_119_0");
    c_msgnextloc("\\EJ* Your dad!?/%", "obj_ch5_DW01_slash_Step_0_gml_120_0");
    c_talk();
    c_wait_box(1);
    c_sprite(spr_susie_shocked_behind);
    c_shakeobj();
    c_wait_talk();
    c_sel(kr);
    c_facing("u");
    c_customfunc(function()
    {
        if (snd_is_playing(global.currentsong[1]))
            snd_volume(global.currentsong[1], 0, 60);
    });
    var campos1 = scr_heromarker("gen", "cut1");
    c_pan(camerax(), campos1[1], 30);
    c_msgside("bottom");
    c_wait(30);
    c_speaker("asgore");
    c_msgsetloc(0, "\\Ec* Oh^1, ha ha!^1! It's so nice to see you again!/", "obj_ch5_DW01_slash_Step_0_gml_143_0");
    c_facenext("susie", "C");
    c_msgnextloc("\\EC* (It looks like he's talking to someone?)/", "obj_ch5_DW01_slash_Step_0_gml_145_0");
    c_msgnextloc("\\Ed* (W-wait^1, that guy is...)/", "obj_ch5_DW01_slash_Step_0_gml_146_0");
    c_msgnextloc("\\EJ* (They're coming this way!)/%", "obj_ch5_DW01_slash_Step_0_gml_147_0");
    c_talk_wait();
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 30);
    c_wait(30);
    c_customfunc(function()
    {
        if (snd_is_playing(global.currentsong[1]))
        {
            snd_stop(global.currentsong[1]);
            snd_volume(global.currentsong[1], 1, 0);
        }
    });
    c_waitcustom();
}

if (con == 4 && customcon == 1 && !d_ex())
{
    con = -1;
    scr_set_video_ini_value(1);
    room_goto(room_dw_garden_video);
    exit;
}

if (con == 5 && customcon == 1 && !d_ex())
{
    con = 6;
    alarm[0] = 30;
}

if (con == 7 && customcon == 1 && !d_ex())
{
    con = 8;
    
    with (blackall)
        depth = 5000;
    
    camerax_set(0);
    cameray_set(0);
    global.choice = -1;
    global.choicemsg[0] = stringsetloc("Skip the#intro", "obj_ch5_DW01_slash_Step_0_gml_202_0");
    global.choicemsg[1] = stringsetloc("Try and#watch anyway", "obj_ch5_DW01_slash_Step_0_gml_203_0");
    global.choicemsg[2] = stringset("");
    global.choicemsg[3] = stringset("");
    scr_speaker("flowery");
    global.fe = 0;
    global.fc = 0;
    msgsetloc(0, "* What^1, got a trouble seeing a handsome guy?/", "obj_ch5_DW01_slash_Step_0_gml_210_0");
    msgnextloc("* Heh..^1. guess I'll SPARE you the introductions./", "obj_ch5_DW01_slash_Step_0_gml_211_0");
    msgnext("\\C2 ");
    var d = d_make();
    d.zurasu = 0;
}

if (con == 8 && global.choice != -1)
{
    k_d();
    
    if (global.choice == 0)
    {
        global.tempflag[50] = 1;
        room_restart();
        exit;
    }
    else
    {
        con = -1;
        scr_var_delay("con", 4, 30);
    }
}

if (con == 10)
{
    con = 11;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_floweryvoiceclip(0);
    scr_maincharacters_actors();
    bell_volume = 1;
    var flpos1 = findspriteinfo(spr_flowery_fmv_pose, undefined);
    fl = actor_count + 1;
    flowery_actor = scr_actor_quick_setup(flpos1, fl, "flowery_jacket");
    flowery_actor.sprite_index = spr_flowery_idle;
    
    with (flowery_actor)
    {
        other.flowery_marker = instance_create_depth(x, y, depth, obj_marker);
        other.flowery_marker.image_xscale = image_xscale;
        other.flowery_marker.image_yscale = image_yscale;
    }
    
    other.flowery_marker.visible = false;
    var _sparkler = instance_create(x, y, obj_flowery_sparkler);
    _sparkler.target = flowery_actor;
    var bushpos = findspriteinfo(spr_susie_bush);
    bush[0] = instance_create_depth(bushpos.x, bushpos.y, bushpos.depth, obj_marker);
    
    with (bush[0])
    {
        visible = false;
        image_speed = 0;
        scr_spritematch(bushpos);
        scr_depth_alt();
    }
    
    var _bushpivot = scr_getspritepoint(bush[0], 0, 1);
    instance_create_depth(_bushpivot.x, _bushpivot.y, bushpos.depth, obj_bush_leaf_manager);
    bushpos = findspriteinfo(spr_kris_bush);
    bush[1] = instance_create_depth(bushpos.x, bushpos.y, bushpos.depth, obj_marker);
    
    with (bush[1])
    {
        visible = false;
        image_speed = 0;
        scr_spritematch(bushpos);
        scr_depth_alt();
        depth += 10;
    }
    
    _bushpivot = scr_getspritepoint(bush[1], 0, 1);
    instance_create_depth(_bushpivot.x, _bushpivot.y, bushpos.depth, obj_bush_leaf_manager);
    glow = instance_create(room_width - camerawidth(), cameray(), obj_dazzle_effect);
    glow.depth = su_actor.depth + 1000;
    glow.image_alpha = 0;
    super = instance_create(flowery_actor.x, flowery_actor.y, obj_super_bloom_effect);
    super.target = flowery_actor;
    super.depth = flowery_actor.depth - 2000;
    super.visible = false;
    var aspos2 = findspriteinfo(spr_asgore_walk_left_dw, undefined);
    as = actor_count + 2;
    asgore_actor = scr_actor_quick_setup(aspos2, as, "asgoredw");
    var krpos1 = findspriteinfo(spr_krisr_dark, undefined);
    var supos1 = findspriteinfo(spr_susie_walk_right_dw, undefined);
    var krpos2 = findspriteinfo(spr_krisr_dark, undefined, c_yellow);
    var supos2 = findspriteinfo(spr_susie_walk_right_dw_unhappy, undefined, c_yellow);
    var krdist1 = scr_returnwait_instance(kr_actor, krpos1, 4);
    var sudist1 = scr_returnwait_instance(su_actor, supos1, 4);
    c_sel(kr);
    c_setxy(700, 560);
    c_facing("r");
    c_sel(su);
    c_setxy(620, 574);
    c_facing("r");
    c_pannable(1);
    c_pan(425, 400, 1);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 30);
    c_var_lerp_instance(498, "volume", 0, 1, 30);
    c_wait(50);
    c_sprite(spr_susie_shock_r);
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\EF* H..^1. how'd you suddenly get over --/", "obj_ch5_DW01_slash_Step_0_gml_298_0");
    c_facenext("flowery", "0");
    c_msgnextloc("\\E0\\V1* Howdy./%", "obj_ch5_DW01_slash_Step_0_gml_300_0");
    c_talk();
    c_wait_box(1);
    c_sel(fl);
    c_sprite(spr_flowery_pose_point_cooler);
    c_mus2("initloop", "flowery.ogg", 0);
    c_mus2("volume", 0.8, 0);
    c_var_lerp_instance(498, "volume", 1, 0, 60);
    c_wait_talk();
    c_sel(fl);
    c_walkto_actor(kr, 36, 0, 20);
    c_wait(20);
    c_visible(false);
    c_sprite(spr_flowery_idle2);
    c_sel(kr);
    c_autowalk(false);
    c_sprite(spr_flowery_rufflekrishair);
    c_wait(1);
    c_imagespeed(0.25);
    c_speaker("flowery");
    c_msgsetloc(0, "\\E0\\VX* Kris^1. You've grown so much^1, haven't you?/%", "obj_ch5_DW01_slash_Step_0_gml_323_0");
    c_talk_wait();
    c_autowalk(true);
    c_imageindex(0);
    c_wait(1);
    c_sprite(spr_krisr_dark);
    c_sel(fl);
    c_visible(true);
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_sel(fl);
    c_walkto_actor(flowery_actor, 80, 20, 20);
    c_wait(24);
    c_var_add("x", 16);
    c_sprite(spr_flowery_gestureup_right);
    c_wait(4);
    c_speaker("flowery");
    c_msgsetloc(0, "\\E0\\VT* Asgore must be so proud of you./%", "obj_ch5_DW01_slash_Step_0_gml_341_0");
    c_talk_wait();
    c_wait(40);
    c_sel(su);
    c_sprite(spr_susie_flowergrow);
    c_snd_play(snd_whip_crack_only);
    c_speaker("susie");
    c_msgsetloc(0, "\\E5* Who the HELL are you though./%", "obj_ch5_DW01_slash_Step_0_gml_350_0");
    c_talk_wait();
    c_sel(fl);
    c_var_add("x", -16);
    c_facing("l");
    c_speaker("flowery");
    
    if (global.lang == "ja")
    {
        c_customfunc(function()
        {
            global.writersnd[0] = snd_flowery_voiceclip_sorrytokeepyouwaiting3_ja;
        });
        c_msgset(0, "\\E2\\Vz＊ おっとっと^1。これは\n　 大変失礼しました^1　お嬢さま。/%");
    }
    else
    {
        c_msgset(0, "\\E2\\VO* 啊^1，抱歉^1，我的大小姐。/%");
    }
    
    c_talk_wait();
    c_sprite(spr_flowery_lookup);
    c_speaker("flowery");
    c_msgsetloc(0, "\\E0\\VG* My name's Flowery./", "obj_ch5_DW01_slash_Step_0_gml_364_0");
    c_msgnextloc("\\E0\\V0* Star sign: the Flower^1. Golden eyes^1. Blood type: SSS./", "obj_ch5_DW01_slash_Step_0_gml_365_0");
    c_msgnextloc("\\E0\\VT* Asgore's college roommate.../%", "obj_ch5_DW01_slash_Step_0_gml_366_0");
    c_talk_wait();
    c_autowalk(false);
    c_imageindex(0);
    c_wait(6);
    c_imageindex(1);
    c_wait(6);
    c_speaker("flowery");
    
    if (global.lang == "ja")
    {
        c_customfunc(function()
        {
            global.writersnd[0] = snd_flowery_voiceclip_yourdadsmybestfriend2_ja;
        });
        c_msgset(0, "\\E0\\Vz＊ …親友だった。/");
    }
    else
    {
        c_msgset(0, "\\E0\\VH* ..^1. 也是他最好的朋友。/");
    }
    
    c_facenext("susie", "E");
    c_msgnextloc("\\EE* .../", "obj_ch5_DW01_slash_Step_0_gml_378_0");
    c_msgnextloc("\\EH* AND?????/", "obj_ch5_DW01_slash_Step_0_gml_379_0");
    c_facenext("flowery", "2");
    c_msgnextloc("\\E2\\V7* Oh^1, I'm sorry^1. Right./%", "obj_ch5_DW01_slash_Step_0_gml_381_0");
    c_talk();
    c_wait_box(3);
    c_sel(su);
    c_shakeobj();
    c_sprite(spr_susie_pointright_lean);
    c_wait_box(4);
    c_sel(fl);
    c_imageindex(0);
    c_wait_talk();
    c_sprite(spr_flowery_pose_point_cooler);
    c_speaker("flowery");
    c_msgsetloc(0, "\\E0\\VA* I shouldn't keep a princess in waiting./%", "obj_ch5_DW01_slash_Step_0_gml_395_0");
    c_talk_wait();
    c_wait(2);
    c_sprite(spr_flowery_pose);
    c_var_instance(super, "visible", true);
    c_wait(26);
    c_sprite(spr_flowery_shrug_downleft);
    c_var_instance(id, "slider", 0);
    c_snd_play_x(snd_spearappear_choppy, 1, 1.2);
    c_waitcustom();
    c_sel(kr);
    c_facing("d");
    c_sel(fl);
    c_visible(false);
    c_sel(su);
    c_sprite(spr_susie_flowery_greeting_nojacket);
    c_snd_play(snd_whip_crack_only);
    c_autowalk(false);
    c_imageindex(1);
    c_var_instance(id, "screen_effect", true);
    c_wait(20);
    c_imageindex(2);
    c_var_instance(glow, "visible", true);
    c_snd_play_x(snd_sparkle_glock, 1, 1);
    c_var_lerp_instance(glow, "image_alpha", 0, 1, 20, 2, "out");
    c_var_instance(id, "sparkles", 1);
    c_wait(40);
    c_var_lerp_instance(glow, "image_alpha", 1, 0, 20, 2, "in");
    c_wait(20);
    c_var_instance(glow, "visible", false);
    c_imageindex(0);
    c_sprite(spr_susie_handout);
    c_sel(fl);
    c_autowalk(true);
    c_visible(true);
    c_autofacing(false);
    c_facing("l");
    c_walk(0, 4, 24);
    c_wait(40);
    c_sel(su);
    c_sprite(spr_susie_handout_what);
    c_shakeobj();
    c_speaker("susie");
    c_msgsetloc(0, "\\Eq* What the hell did you do to my--/%", "obj_ch5_DW01_slash_Step_0_gml_440_0");
    c_talk_wait();
    c_wait(2);
    c_snd_play(snd_harp_strum);
    c_sprite(spr_susie_handout_flowergrow);
    c_animate(0, 8, 1/3);
    c_wait(20);
    c_speaker("susie");
    c_msgsetloc(0, "\\EE* A..^1. a flower's growing out of my hand!?/%", "obj_ch5_DW01_slash_Step_0_gml_449_0");
    c_talk_wait();
    c_sel(fl);
    c_sprite(spr_flowery_walk_right_jacket_hand_up);
    c_walk(0, 4, 10);
    c_sel(su);
    c_sprite(spr_susie_handout_flowerbloom);
    c_animate(0, 3, 1/3);
    c_wait(6);
    c_snd_play_x(snd_sparkle_glock, 0.75, 1.2);
    c_var_instance(id, "sparkles", 2);
    c_wait(6);
    var sustring = stringsetloc("It... has your face on it!?", "obj_ch5_DW01_slash_Step_0_gml_465_0");
    var sf = 
    {
        x: 190,
        y: "bottom"
    };
    
    if (global.lang == "ja")
    {
        sf = 
        {
            x: 232,
            y: 52
        };
    }
    
    scr_smallface(0, "susie", 14, 190, "bottom", sustring);
    c_speaker("flowery");
    c_msgsetloc(0, "\\E0\\V6* Those are for you.\\f0/%", "obj_ch5_DW01_slash_Step_0_gml_469_0");
    c_talk_wait();
    c_sprite(spr_susie_retracthand);
    c_animate(0, 2, 1/3);
    c_sel(fl);
    c_walk(0, 4, 30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* Just wait a -/%", "obj_ch5_DW01_slash_Step_0_gml_479_0");
    c_talk_wait();
    c_speaker("asgore");
    c_msgsetloc(0, "\\E0* Flowery!/%", "obj_ch5_DW01_slash_Step_0_gml_485_0");
    c_talk_wait();
    c_sel(kr);
    c_facing("r");
    c_sel(fl);
    c_customfunc(function()
    {
        with (obj_bush_leaf_manager)
            active = true;
    });
    c_sprite(spr_flowery_idle2);
    c_pan_wait(room_width - camerawidth(), cameray(), 20);
    c_customfunc(function()
    {
        with (obj_bush_leaf_manager)
            active = false;
    });
    c_speaker("asgore");
    c_msgsetloc(0, "\\E4* Ah^1! There you are^1, old friend!/", "obj_ch5_DW01_slash_Step_0_gml_510_0");
    c_msgnextloc("\\E6* I lost you when you were walking down the^1, er^1, city streets./", "obj_ch5_DW01_slash_Step_0_gml_511_0");
    c_facenext("flowery", "0");
    
    if (global.lang == "ja")
        c_msgnext("\\E0\\VO＊ へへっ^1。\n　 お待たせしちゃって\n　 ゴメンゴメン。/");
    else
        c_msgnext("\\E0\\V1* 呵^1。抱歉久等了^1，\n老伙计。/");
    
    c_facenext("asgore", "5");
    c_msgnextloc("\\E5* Oh^1, it's no trouble at all!/", "obj_ch5_DW01_slash_Step_0_gml_515_0");
    c_msgnextloc("\\E2* ..^1. Who were you talking to^1, by-the-by?/%", "obj_ch5_DW01_slash_Step_0_gml_516_0");
    c_talk();
    c_sel(as);
    c_wait_box(1);
    c_sprite(spr_asgore_sad);
    c_wait_box(3);
    c_facing("l");
    c_wait_talk();
    c_sel(fl);
    c_sprite(spr_flowery_pose_point_cooler_right);
    c_speaker("flowery");
    c_msgsetloc(0, "\\E0\\VS* Heh^1, nothing more than the transient winds^1. OK^1, Gorey?/%", "obj_ch5_DW01_slash_Step_0_gml_529_0");
    c_talk_wait();
    c_sprite(spr_flowery_walk_right_jacket_hand_up);
    c_walkto_actor(as, 4, 0, 70);
    c_delaywalk(70, 0, 1, 320);
    c_sel(as);
    c_delaywalk(70, 0, 1, 320);
    c_autowalk(false);
    c_var_instance(id, "shaker_wait", 70);
    c_speaker("flowery");
    c_msgsetloc(0, "\\E0\\VQ* Now^1, let's make like a tree and have some fun./%", "obj_ch5_DW01_slash_Step_0_gml_544_0");
    c_talk();
    c_wait(70);
    c_wait_talk();
    c_sprite(spr_asgore_clap_dw);
    c_imagespeed(1/3);
    c_speaker("asgore");
    c_msgsetloc(0, "\\Ec* Ha ha^1! Oh^1, Flowery^1, you always were such a scamp!/%", "obj_ch5_DW01_slash_Step_0_gml_560_0");
    c_talk_wait();
    c_sel(kr);
    c_visible(false);
    c_facing("r");
    c_setxy(bush[1].x, bush[1].y);
    c_sel(su);
    c_visible(false);
    c_facing("r");
    c_setxy(bush[0].x, bush[0].y);
    c_var_instance(bush[0], "visible", true);
    c_var_instance(bush[1], "visible", true);
    c_mus2("volume", 0, 240);
    c_pan_wait(495, cameray(), 30);
    c_wait(42);
    c_var_instance(id, "shaker", -1);
    c_snd_play(snd_wing);
    c_sel(kr);
    c_autowalk(true);
    c_walkdirect(krpos2.x - 20, bush[1].y, 7);
    c_delaywalkdirect(7, krpos2.x - 20, krpos2.y, 10);
    c_delaywalkdirect(17, krpos2.x, krpos2.y, 10);
    c_var_instance(id, "leaves", true);
    c_visible(true);
    c_sel(su);
    c_autowalk(true);
    c_visible(true);
    c_var_instance(su_actor, "dsprite", 580);
    c_var_instance(su_actor, "rsprite", 591);
    c_var_instance(su_actor, "lsprite", 584);
    c_walkdirect(supos2.x, bush[0].y, 30);
    c_wait(7);
    c_wait(15);
    c_wait(25);
    c_sel(kr);
    c_facing("r");
    c_sel(su);
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* Who..^1. who the hell is that guy!?/%", "obj_ch5_DW01_slash_Step_0_gml_611_0");
    c_sprite(spr_susie_exasperated);
    c_shakeobj();
    c_talk_wait();
    c_speaker("susie");
    c_msgsetloc(0, "\\E5* Why's he look like one of those human --%%", "obj_ch5_DW01_slash_Step_0_gml_617_0");
    c_talk_wait();
    c_flip("x");
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* Why did he call me a princess and --%%", "obj_ch5_DW01_slash_Step_0_gml_621_0");
    c_talk_wait();
    c_flip("x");
    c_speaker("susie");
    c_msgsetloc(0, "\\E5* Why is your dad --%%", "obj_ch5_DW01_slash_Step_0_gml_625_0");
    c_talk_wait();
    c_sprite(spr_susie_exasperated_shock);
    c_customfunc(function()
    {
        var susie = -4;
        
        with (obj_actor)
        {
            if (name == "susie")
                susie = id;
        }
        
        with (scr_marker_ext(scr_even(susie.x + (susie.sprite_width / 2)), scr_even(susie.y) - 20, spr_exc, 2, 2, undefined, undefined, undefined, susie.depth - 1))
        {
            scr_limitval_upper(id, "y", y);
            vspeed = -6;
            gravity = 2;
            scr_doom(id, 40);
        }
    });
    c_wait(40);
    c_facing("l");
    c_sprite(spr_susie_shock);
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* Kris^1, your dad^1! He..^1. he can't be here!/%", "obj_ch5_DW01_slash_Step_0_gml_646_0");
    c_talk_wait();
    c_sel(kr);
    c_delayfacing(10, "r");
    c_sel(su);
    c_walkdirect(krpos2.x - 54, bush[0].y, 22);
    c_delaywalkdirect(22, krpos2.x - 54, supos2.y, 10);
    c_wait(32);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\EJ* C'mon^1, let's go after him!/%", "obj_ch5_DW01_slash_Step_0_gml_656_0");
    c_talk_wait();
    c_pannable(0);
    c_customfunc(function()
    {
        snd_free(global.currentsong[0]);
        global.tempflag[50] = 0;
    });
    c_mus2("initloop", "birds_ch5.ogg", 0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}

if (con == 11 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 210;
    con = -1;
}

if (slider >= 0)
{
    if (slider == 0)
    {
        fl_start_x = flowery_actor.x;
        fl_start_y = flowery_actor.y;
    }
    
    var _length = 20;
    flowery_actor.x = lerp(fl_start_x, su_actor.x + 50, scr_ease_out(slider / _length, 3));
    
    with (flowery_actor)
    {
        var _col = make_color_hsv(((other.slider / 14) * 255) % 255, 255, 255);
        var _afim = scr_afterimage_fog(undefined, _col, 4);
        _afim.depth = depth + 100;
        _afim.fadespeed = 0.2;
    }
    
    slider++;
    
    if (slider >= _length)
    {
        slider = -1;
        c_waitcustom_end();
    }
}

if (shaker_wait > 0)
{
    shaker_wait--;
    
    if (shaker_wait <= 0)
        shaker = 1;
}

if (shaker > 0)
{
    flowery_marker.visible = true;
    flowery_actor.visible = false;
    flowery_marker.x = flowery_actor.x + irandom_range(-2, 2);
    flowery_marker.y = flowery_actor.y - ((shaker % 2) * 2);
    flowery_marker.sprite_index = flowery_actor.sprite_index;
    flowery_marker.image_index = flowery_actor.image_index;
    shaker++;
}

if (shaker < 0)
{
    flowery_marker.visible = false;
    flowery_actor.visible = true;
    shaker = 0;
}

if (sparkles > 0)
{
    var _xx = su_actor.x + 60;
    var _yy = su_actor.y + 42;
    var _scale = 2;
    
    if (sparkles == 2)
    {
        _yy = su_actor.y + 16;
        _scale = 1;
    }
    
    var _depth = su_actor.depth - 2;
    
    if (sparkles <= 2)
    {
        for (var i = 0; i < 12; i++)
        {
            var _sparkle = instance_create(_xx, _yy, obj_afterimage);
            _sparkle.direction = (i * 30) + random_range(-13, 13);
            _sparkle.image_index = irandom(3);
            _sparkle.sprite_index = (sparkles == 1) ? spr_bellsparkle : spr_tinysparkle_x;
            _sparkle.image_angle = choose(0, 90);
            _sparkle.speed = 5;
            _sparkle.friction = 0.2;
            _sparkle.image_alpha = 1;
            _sparkle.image_xscale = 2;
            _sparkle.image_yscale = 2;
            _sparkle.image_speed = random_range(0.25, 0.5);
            _sparkle.depth = su_actor.depth - 2;
        }
    }
    else
    {
        _xx = flowery_actor.x + 60;
        _yy = flowery_actor.y + 42;
        
        for (var i = 0; i < 8; i++)
        {
            var _sparkle = instance_create(_xx, _yy + (i * 2), obj_afterimage);
            _sparkle.direction = 0;
            _sparkle.sprite_index = spr_tinysparkle_x;
            _sparkle.speed = random_range(2, 10);
            _sparkle.friction = 0.2;
            _sparkle.image_alpha = 1;
            _sparkle.image_xscale = 2;
            _sparkle.image_yscale = 2;
            _sparkle.image_speed = random_range(0.25, 0.5);
            _sparkle.depth = flowery_actor.depth - 2;
        }
    }
    
    sparkles = 0;
}

if (screen_effect)
{
    glow.x = camerax();
    glow.y = cameray();
    screen_effect = false;
}

if (rumbler == 1)
{
    rumble = snd_loop(snd_rumble);
    snd_pitch(rumble, 2);
    snd_volume(rumble, 0.25, 0);
    rumbler = 0;
}

if (rumbler < 0)
{
    rumbler++;
    
    if (rumbler == 0)
    {
        snd_stop(rumble);
    }
    else
    {
        var _vol = remap_clamped(-20, 0, 0.25, 0, rumbler);
        snd_volume(rumble, _vol, 0);
    }
}

if (leaves)
{
    var _leaf_spawner = instance_create(bush[0].x + 14, bush[0].y, obj_leaf_confetti);
    var _bush = bush[0];
    
    with (_leaf_spawner)
        scr_spritematch(_bush);
    
    _leaf_spawner.visible = false;
    _leaf_spawner.strength = 1.2;
    _leaf_spawner.depth = _bush.depth + 100;
    _leaf_spawner = instance_create(bush[1].x + 14, bush[1].y, obj_leaf_confetti);
    _bush = bush[1];
    _leaf_spawner.strength = 0.7;
    
    with (_leaf_spawner)
        scr_spritematch(_bush);
    
    _leaf_spawner.visible = false;
    _leaf_spawner.depth = _bush.depth + 100;
    leaves = false;
}
