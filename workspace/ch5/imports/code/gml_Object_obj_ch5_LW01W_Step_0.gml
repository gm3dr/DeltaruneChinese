if (con < 0)
    exit;

if (con == 0)
{
    con = 1;
    customcon = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_visible(0);
    c_var_instance(id, "drip_move", true);
    c_var_instance(drip_marker, "x", camerax() + (view_wport[0] / 4));
    c_var_instance(drip_marker, "y", cameray() + (view_hport[0] / 4));
    c_var_lerp_instance(drip_marker, "image_alpha", 0, 1, 300);
    c_wait(300);
    c_wait(60);
    c_customfunc(function()
    {
        scr_speaker("noelle");
        global.fe = 0;
        global.fc = 0;
        msgsetloc(0, " T H A N K   Y O U", "obj_ch5_LW01W_slash_Step_0_gml_29_0");
        instance_create(90/**/ + 28/**/, 120, obj_writer);
        
        with (obj_writer)
        {
            skippable = 0;
            rate = 16;
            shake = 1;
            preventcskip = true;
            autocenter = 1;
            disablebutton1 = 1;
        }
    });
    c_waitcustom();
}

if (con == 1 && i_ex(obj_writer) && customcon == 1)
{
    with (obj_writer)
        skippable = 0;
    
    if (obj_writer.reachedend == 1)
        con = 2;
}

if (drip_move)
{
    drip_siner++;
    drip_marker.x = camerax() + (view_wport[0] / 4) + (sin(drip_siner / 62) * 3);
    drip_marker.y = cameray() + 100 + (cos(drip_siner / 25) * 2.4);
}

if (con == 2 && customcon == 1)
{
    con = 90;
    customcon = 0;
    c_waitcustom_end();
    c_customfunc(function()
    {
        with (_kris_escape)
            visible = 1;
    });
    c_wait(60);
    c_wait(15);
    c_customfunc(function()
    {
        drip_move = false;
        
        with (drip_marker)
            instance_destroy();
        
        with (obj_writer)
            instance_destroy();
        
        with (blackall)
            instance_destroy();
        
        if (!snd_is_playing(global.currentsong[1]))
        {
            global.currentsong[0] = snd_init("mus_birdnoise.ogg");
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
        }
        
        with (_kris_escape)
            start();
    });
    c_wait(90);
    c_customfunc(function()
    {
        with (_convo_controller)
            start_convo();
    });
    c_wait_if(id, "_escape_finished", "=", true);
    c_wait(15);
    c_sel(kr);
    c_setxy(185, 94);
    c_autowalk(0);
    c_sprite(spr_kris_unslouch);
    c_halt();
    c_visible(1);
    c_var_lerp("image_index", 0, 3, 20);
    c_var_instance(_kris_escape, "visible", 0);
    c_wait(20);
    c_wait_if(_convo_controller, "convo_finished", "=", true);
    c_waitcustom();
}

if (con == 90 && !d_ex() && customcon == 1)
{
    con = 100;
    customcon = 0;
    global.facing = 0;
    c_waitcustom_end();
    c_sel(kr);
    c_autowalk(1);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}

if (con == 100 && !d_ex() && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.plot = 5;
    
    with (obj_room_krisroom)
        create_room_readables();
}
