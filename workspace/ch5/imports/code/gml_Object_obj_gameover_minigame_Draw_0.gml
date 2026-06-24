if (room == room_board_1 || room == room_board_2)
{
    global.interact = 1;
}
if (drawblackbg)
{
    draw_sprite_ext(6488, 0, 0, 0, 640, 480, 0, 0, drawblackbg);
}
if (init == 0)
{
    instance_deactivate_layer("OBJECTS_MAIN");
    global.interact = 1;
    init = 1;
    if (replayversion == true && quitversion == false && replaywin == true)
    {
        if (room == room_dw_susiezilla && scr_flag_get(1220) != 0)
        {
        }
        else
        {
            minigametext = instance_create(x, y - 150, obj_tenna_enemy_minigametext);
            minigametext.mystring = /*"GAME CLEAR!"*/"游戏通关！";
            snd_play(180);
        }
    }
}
if (con == 0)
{
    timer++;
    if (timer == 1)
    {
        scr_lerpvar("tone_saturation", 1, 0.1, 30, 2, "out");
        scr_lerpvar("tone_factor", 0, 0.5, 30, 2, "out");
    }
    if (timer == 2)
    {
        scr_lerpvar("staticalpha", 0, 0.015, 15);
    }
    if (timer == 3)
    {
        scr_lerpvar("grayalpha", 0, 0.35, 15);
    }
    if (timer == 5 && quitversion == false && replayversion == false)
    {
        tenna = instance_create(camerax() + 320, cameray() + 480 + 280, 804);
        tenna.depth = depth - 10;
        tenna.auto_depth = 0;
        tenna.dropshadow = true;
        tenna.preset = 2;
    }
    if ((timer == 30 && !i_ex(238)) || (timer == 90 && i_ex(238)))
    {
        var gameover_state = 0;
        if (room == 108)
        {
            gameover_state = 1;
        }
        if (scr_debug())
        {
        }
        if (replayversion && replaywin == true)
        {
            con = 1;
            timer = 0;
            instance_create(0, 0, 217);
        }
        if ((replayversion && quitversion) || (replayversion && replaywin == false))
        {
            con = 1;
            timer = 0;
            quitcon = 1;
            mus_volume(global.currentsong[1], 0, 30);
            scr_fadeout(30);
            with (1308)
            {
                depth = other.depth - 9999;
            }
        }
        else if (gameover_state == 0)
        {
            var chef_fail = instance_create_depth(0, 0, 0, obj_gameover_chef);
            chef_fail.gameover_sequence = (scr_flag_get(1089) == 1) ? 1 : 2;
        }
        else if (gameover_state == 1)
        {
            var band_fail = instance_create(0, 0, 414);
            band_fail.gameover_sequence = (scr_flag_get(1096) == 1) ? 1 : 2;
        }
        else if (gameover_state == 2)
        {
            instance_create(0, 0, obj_gameover_cowboy);
        }
        else if (gameover_state == 3)
        {
            instance_create(0, 0, obj_gameover_susiezilla);
        }
        else if (gameover_state == 4)
        {
            with (instance_create(0, 0, obj_gameover_board))
            {
                inbattle = other.inbattle;
            }
        }
    }
}
if (scr_debug())
{
    if (keyboard_check_pressed(96))
    {
        con = 1;
        timer = 0;
    }
}
if (tenna_arrive)
{
    tenna_arrive_timer++;
    if (tenna_arrive_timer == 1 && replaywin == false)
    {
        tenna.gravity = -1.5;
    }
    if (tenna_arrive_timer == 19 && replaywin == false)
    {
        tenna.bounce = 1;
        tenna.gravity = 0;
        tenna.vspeed = 0;
    }
    if (tenna_arrive_timer == 30)
    {
        tenna_arrive = false;
        tenna_arrive_timer = 0;
    }
}
if (con == 1 && replayversion && !i_ex(217) && quitcon == 0)
{
    mus_volume(global.currentsong[1], 0, 30);
    scr_fadeout(30);
    with (1308)
    {
        depth = other.depth - 9999;
    }
    quitcon = 1;
}
if (con == 1 && !replayversion)
{
    timer++;
    if (timer == 1)
    {
        if (!boardfail)
        {
            scr_lerpvar("staticalpha", staticalpha, 1, 60, 2, "in");
        }
    }
    if (timer == 8)
    {
        if (!boardfail)
        {
            if (replayversion == false)
            {
                tenna.gravity = 1.5;
            }
            scr_lerpvar("blackalpha", 0, 1, 30);
        }
    }
    if (boardfail && timer == 37)
    {
        obj_board_deathevent.con = 9999;
    }
    if (timer == 38)
    {
        if (boardfail)
        {
            instance_destroy();
        }
        else
        {
            snd_play_pitch(456, 1);
            countdown = true;
            countdown_timer = 0;
            countdown_text = 3;
        }
    }
}
if (sprite_exists(global.screenshot))
{
    var lightColor = 13088418;
    var darkColor = 6242121;
    var is_rhythm_replaywin = room == 108 && replaywin;
    if (!quitversion && !replaywin)
    {
        tone_on(tone_saturation, tone_brightness, tone_factor, darkColor, lightColor);
    }
    if (!is_rhythm_replaywin)
    {
        draw_sprite_ext(global.screenshot, 0, camerax(), cameray(), 1, 1, 0, 16777215, 1);
    }
    if (!quitversion && !replaywin)
    {
        tone_off();
    }
    if (!quitversion && !replaywin)
    {
        draw_set_alpha(grayalpha);
        draw_set_color(8421504);
        ossafe_fill_rectangle(camerax(), cameray(), camerax() + 640, cameray() + 480, 0);
        draw_set_color(16777215);
        draw_set_alpha(1);
        staticindex += 0.25;
        draw_sprite_tiled_ext(5354, staticindex - 0.5, 0, 0, 2, 2, 16777215, staticalpha);
        draw_sprite_tiled_ext(5354, staticindex, 0, 0, 2, 2, 16777215, staticalpha);
        draw_set_alpha(blackalpha);
        draw_set_color(0);
        ossafe_fill_rectangle(camerax(), cameray(), camerax() + 640, cameray() + 480, 0);
        draw_set_color(16777215);
        draw_set_alpha(1);
    }
    if (countdown)
    {
        countdown_timer++;
        if ((countdown_timer % 30) == 0)
        {
            countdown_text--;
            if (countdown_text <= 0)
            {
                snd_play(288);
                countdown = false;
                retry_game = true;
                exit;
            }
            else
            {
                snd_play_pitch(456, 1 + (orchhit_pitch / 16));
                orchhit_pitch++;
            }
        }
        draw_set_halign(1);
        draw_text_ext_transformed(camerax() + (view_wport[0] / 2), (cameray() + (view_hport[0] / 2)) - 50, string(countdown_text), 4, 9999, 6, 6, 0);
        draw_set_halign(0);
    }
    if (retry_game)
    {
        retry_timer++;
        if (retry_timer >= 30)
        {
            room_restart();
            global.interact = 0;
            instance_destroy();
            exit;
        }
    }
}
if (quitcon == 1)
{
    quittimer++;
    if (quittimer == 32)
    {
        snd_free_all();
        inst = instance_create(0, 0, 1311);
        global.interact = 3;
        global.facing = 0;
    }
}
