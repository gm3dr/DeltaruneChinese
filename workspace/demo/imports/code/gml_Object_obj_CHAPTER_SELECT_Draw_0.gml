if (global.is_console)
{
    if (chapter_is_loading)
    {
        draw_set_font(fnt_mainbig);
        draw_set_halign(fa_center);
        draw_text(320, 250, "LOADING...");
    }
}

if (!audio_group_is_loaded(1))
    exit;

if (!init_loaded)
    exit;

draw_set_font(text_font);
draw_set_halign(fa_center);
draw_set_color(c_gray);
draw_set_halign(fa_left);
draw_set_color(c_white);

if (timer < 20)
    timer++;

if (con == "init")
{
    if (timer == 1)
        loop = audio_play_sound(AUDIO_DRONE, 15, 1);
    
    if (timer == 15)
        con = "start";
}

if (con == "start")
{
    file_found = false;
    
    if (ossafe_file_exists("dr.ini"))
    {
        ossafe_ini_open("dr.ini");
        ossafe_ini_close();
    }
    
    for (var i = 0; i < 7; i++)
    {
        var filename = "filech" + string(i) + "_";
        
        if (ossafe_file_exists(filename + string(3)) || ossafe_file_exists(filename + string(4)) || ossafe_file_exists(filename + string(5)))
            highestCompletedChapter = i;
        
        if (highestCompletedChapter > 0)
            file_found = true;
    }
    
    show_debug_message("highestCompletedChapter:" + string(highestCompletedChapter));
    
    for (var i = 0; i < 7; i++)
    {
        var filename = "filech" + string(i) + "_";
        
        if (ossafe_file_exists(filename + string(0)) || ossafe_file_exists(filename + string(1)) || ossafe_file_exists(filename + string(2)))
            highestUncompletedChapter = i;
        
        if (highestUncompletedChapter > 0)
            file_found = true;
    }
    
    show_debug_message("highestUncompletedChapter:" + string(highestUncompletedChapter));
    
    if (file_found == false)
    {
        con = "nofile";
        fade = fademax;
        timer = 0;
        mpos = 0;
    }
    else
    {
        con = "filefound";
        fade = fademax;
        timer = 0;
        mpos = 0;
    }
}

if (con == "nofile")
{
    if (fade != 0)
        fade = lerp(fade, 0, 0.125);
    
    xx = 160 * scale;
    yy = 110 * scale;
    mspace = 20 * scale;
    fadescaled = fade * scale;
    drawcolor = merge_color(c_white, c_black, fade / fademax);
    draw_set_color(drawcolor);
    my_stringset = (global.lang == "en") ? "你想从第1章开始玩吗？" : "Chapter 1から始めますか？";
    draw_set_font(text_font);
    draw_set_halign(fa_center);
    draw_text_transformed(xx, yy - fadescaled, my_stringset, scale, scale, 0);
    draw_set_color(c_white);
    
    if (mpos == 0)
        draw_set_color(c_yellow);
    else
        draw_set_color(c_white);
    
    draw_text_transformed(xx, (((20 * scale) + yy) - fadescaled) + (mspace * 0), yes, scale, scale, 0);
    
    if (mpos == 1)
        draw_set_color(c_yellow);
    else
        draw_set_color(c_white);
    
    draw_text_transformed(xx, (((20 * scale) + yy) - fadescaled) + (mspace * 1), no, scale, scale, 0);
    
    if (mpos == 0)
        draw_sprite_ext(spr_heart_launcher, 0, xx - ((string_width(yes) / 2) * scale) - (13 * scale), (((20 * scale) + yy) - fadescaled) + (mspace * mpos) + (4 * scale), scale / 2, scale / 2, 0, c_white, (fademax - fade) / fademax);
    
    if (mpos == 1)
        draw_sprite_ext(spr_heart_launcher, 0, xx - ((string_width(no) / 2) * scale) - (13 * scale), (((20 * scale) + yy) - fadescaled) + (mspace * mpos) + (4 * scale), scale / 2, scale / 2, 0, c_white, (fademax - fade) / fademax);
    
    if (up_p())
    {
        mpos--;
        move_noise = true;
    }
    
    if (down_p())
    {
        mpos++;
        move_noise = true;
    }
    
    mpos = clamp(mpos, 0, 1);
    
    if (button1_p() && timer > 10)
    {
        select_noise = true;
        
        switch (mpos)
        {
            case 0:
                chaptertoload = 1;
                con = "gameload";
                break;
            
            case 1:
                mpos = 0;
                con = "chapterselect";
                break;
        }
    }
}

if (con == "filefound")
{
    fade = fademax;
    mpos = 0;
    timer = 0;
    
    if (highestCompletedChapter == highestUncompletedChapter)
        con = "startNextChapter";
    else
        con = "continueChapter";
}

if (con == "startNextChapter")
{
    if (highestCompletedChapter >= latestAvailableChapter)
    {
        con = "chapterselect";
        exit;
    }
    
    if (fade != 0)
        fade = lerp(fade, 0, 0.125);
    
    xx = 160 * scale;
    yy = 110 * scale;
    mspace = 20 * scale;
    fadescaled = fade * scale;
    drawcolor = merge_color(c_white, c_black, fade / fademax);
    draw_set_color(drawcolor);
    my_stringset = "已通关第" + string(highestCompletedChapter) + "章。";
    stringset2 = "游玩第" + string(highestCompletedChapter + 1) + "章";
    
    if (global.lang == "ja")
    {
        my_stringset = "Chapter " + string(highestCompletedChapter) + "はクリア済みです。";
        stringset2 = "Chapter " + string(highestCompletedChapter + 1) + "をプレイ";
    }
    
    draw_set_font(text_font);
    draw_set_halign(fa_center);
    draw_text_transformed(xx, (yy - fadescaled) + (mspace * 0), my_stringset, scale, scale, 0);
    
    if (mpos == 0)
        draw_set_color(c_yellow);
    else
        draw_set_color(c_white);
    
    draw_text_transformed(xx, (yy - fadescaled) + (mspace * 1), stringset2, scale, scale, 0);
    
    if (mpos == 1)
        draw_set_color(c_yellow);
    else
        draw_set_color(c_white);
    
    var select_text = (global.lang == "en") ? "选择章节" : "チャプター選択";
    draw_text_transformed(xx, (yy - fadescaled) + (mspace * 2), select_text, scale, scale, 0);
    
    if (mpos == 0)
        draw_sprite_ext(spr_heart_launcher, 0, xx - ((string_width(stringset2) / 2) * scale) - (13 * scale), (yy - fadescaled) + (mspace * 1) + (4 * scale), scale / 2, scale / 2, 0, c_white, (fademax - fade) / fademax);
    
    if (mpos == 1)
        draw_sprite_ext(spr_heart_launcher, 0, xx - ((string_width(select_text) / 2) * scale) - (13 * scale), (yy - fadescaled) + (mspace * 2) + (4 * scale), scale / 2, scale / 2, 0, c_white, (fademax - fade) / fademax);
    
    if (up_p())
    {
        mpos--;
        move_noise = true;
    }
    
    if (down_p())
    {
        mpos++;
        move_noise = true;
    }
    
    mpos = clamp(mpos, 0, 1);
    
    if (button1_p() && timer > 10)
    {
        select_noise = true;
        
        switch (mpos)
        {
            case 0:
                chaptertoload = highestCompletedChapter + 1;
                con = "gameload";
                break;
            
            case 1:
                timer = 0;
                mpos = 0;
                con = "chapterselect";
                break;
        }
    }
}

if (con == "continueChapter")
{
    if (highestUncompletedChapter == 0 || highestUncompletedChapter > latestAvailableChapter || highestCompletedChapter > latestAvailableChapter)
    {
        show_debug_message("highestUncompletedChapter=" + string(highestUncompletedChapter));
        show_debug_message("highestCompletedChapter=" + string(highestCompletedChapter));
        con = "nofile";
        exit;
    }
    
    if (fade != 0)
        fade = lerp(fade, 0, 0.125);
    
    xx = 160 * scale;
    yy = 110 * scale;
    mspace = 20 * scale;
    fadescaled = fade * scale;
    drawcolor = merge_color(c_white, c_black, fade / fademax);
    draw_set_color(drawcolor);
    my_stringset = "从第" + string(highestUncompletedChapter) + "章继续？";
    
    if (global.lang == "ja")
        my_stringset = "Chapter " + string(highestUncompletedChapter) + "から続けますか？";
    
    draw_set_font(text_font);
    draw_set_halign(fa_center);
    draw_text_transformed(xx, (yy - fadescaled) + (mspace * 0), my_stringset, scale, scale, 0);
    
    if (mpos == 0)
        draw_set_color(c_yellow);
    else
        draw_set_color(c_white);
    
    draw_text_transformed(xx, (yy - fadescaled) + (mspace * 1), yes, scale, scale, 0);
    
    if (mpos == 1)
        draw_set_color(c_yellow);
    else
        draw_set_color(c_white);
    
    draw_text_transformed(xx, (yy - fadescaled) + (mspace * 2), no, scale, scale, 0);
    
    if (mpos == 0)
        draw_sprite_ext(spr_heart_launcher, 0, xx - ((string_width(yes) / 2) * scale) - (13 * scale), (yy - fadescaled) + (mspace * 1) + (mspace * mpos) + (4 * scale), scale / 2, scale / 2, 0, c_white, (fademax - fade) / fademax);
    
    if (mpos == 1)
        draw_sprite_ext(spr_heart_launcher, 0, xx - ((string_width(no) / 2) * scale) - (13 * scale), (yy - fadescaled) + (mspace * 1) + (mspace * mpos) + (4 * scale), scale / 2, scale / 2, 0, c_white, (fademax - fade) / fademax);
    
    if (up_p())
    {
        mpos--;
        move_noise = true;
    }
    
    if (down_p())
    {
        mpos++;
        move_noise = true;
    }
    
    mpos = clamp(mpos, 0, 1);
    
    if (button1_p() && timer > 10)
    {
        timer = 0;
        select_noise = true;
        
        switch (mpos)
        {
            case 0:
                chaptertoload = highestUncompletedChapter;
                con = "gameload";
                break;
            
            case 1:
                timer = 0;
                mpos = 0;
                con = "chapterselect";
                break;
        }
    }
}

if (con == "chapterselect")
{
    quit = (global.lang == "en") ? "退出" : "とじる";
    chapterstring = "第";
    
    if (chapterselectinit == 0)
    {
        fade = fademax;
        chapterselectinit = 1;
        timer = 0;
        mpos = highestCompletedChapter;
        
        if (mpos > (latestAvailableChapter - 1))
            mpos = latestAvailableChapter - 1;
    }
    
    if (fade != 0)
        fade = lerp(fade, 0, 0.125);
    
    fadescaled = fade * scale;
    space = 30 * scale;
    
    for (var i = 0; i < 6; i++)
        draw_sprite_ext(spr_horzBar, 0, 0, (36 * scale) + (space * i) + (fadescaled / 2), scale, scale, 0, c_white, 1 - (fade / fademax));
    
    draw_set_halign(fa_center);
    
    if (up_p())
    {
        move_noise = true;
        mpos--;
        
        if (mpos > (latestAvailableChapter - 1))
            mpos = latestAvailableChapter - 1;
    }
    
    if (down_p())
    {
        move_noise = true;
        mpos++;
        
        if (mpos > (latestAvailableChapter - 1))
            mpos = global.is_console ? 1 : 7;
    }
    
    if (console)
        mpos = clamp(mpos, 0, 6);
    else
        mpos = clamp(mpos, 0, 7);
    
    xx = 35 * scale;
    yy = 10 * scale;
    mspace = 30 * scale;
    var max_options = 7;
    
    for (var i = 0; i < max_options; i++)
    {
        var mycolor = c_gray;
        
        if (i < latestAvailableChapter)
            mycolor = c_white;
        
        if (mpos == i)
            mycolor = c_yellow;
        
        mycolor = merge_color(mycolor, c_black, fade / fademax);
        draw_sprite_ext(spr_chapterIcon, i, xx + (234 * scale), -fadescaled + yy + (i * 30 * scale), scale, scale, 0, mycolor, 1 - (fade / fademax));
        draw_set_color(mycolor);
        draw_set_halign(fa_left);
        draw_set_font(fnt_main);
        draw_text_transformed(xx, -fadescaled + yy + (mspace * i) + (3 * scale), chapterstring + string(i + 1) + "章", scale, scale, 0);
        draw_set_font(text_font);
        draw_set_halign(fa_center);
        draw_text_transformed(176 * scale, -fadescaled + yy + (mspace * i) + (3 * scale), chapname[i + 1], scale, scale, 0);
        draw_set_halign(fa_left);
        draw_set_color(c_white);
    }
    
    var heart_xpos = xx - (15 * scale);
    var heart_ypos = -fadescaled + yy + (7 * scale) + (mpos * (30 * scale));
    
    if (mpos == 7)
    {
        heart_ypos -= (5 * scale);
        heart_xpos = 130 * scale;
    }
    
    draw_sprite_ext(spr_heart_launcher, 0, heart_xpos, heart_ypos, scale / 2, scale / 2, 1, c_white, (fademax - fade) / fademax);
    
    if (!console)
    {
        var mycolor = c_white;
        
        if (mpos == 7)
            mycolor = c_yellow;
        
        mycolor = merge_color(mycolor, c_black, fade / fademax);
        draw_set_color(mycolor);
        draw_set_halign(fa_center);
        draw_text_transformed(160 * scale, -fadescaled + (218 * scale), quit, scale, scale, 0);
        draw_set_halign(fa_left);
    }
    
    if (button1_p() && timer > 12)
    {
        select_noise = true;
        timer = 0;
        
        if (mpos == 7)
        {
            game_end();
        }
        else
        {
            con = "gameloadConfirm";
            confirm_choice_index = 0;
            chaptertoload = mpos + 1;
        }
    }
}
else if (con == "gameloadConfirm")
{
    stringPlay = (global.lang == "en") ? "游玩" : "プレイする";
    stringDoNot = (global.lang == "en") ? "返回" : "しない";
    space = 30 * scale;
    
    for (var i = 0; i < 6; i++)
        draw_sprite_ext(spr_horzBar, 0, 0, (36 * scale) + (space * i) + (fadescaled / 2), scale, scale, 0, c_white, 1 - (fade / fademax));
    
    draw_set_halign(fa_center);
    
    if (console)
        mpos = clamp(mpos, 0, 6);
    else
        mpos = clamp(mpos, 0, 7);
    
    xx = 35 * scale;
    yy = 10 * scale;
    mspace = 30 * scale;
    
    if (left_p())
    {
        move_noise = true;
        confirm_choice_index = ((confirm_choice_index - 1) < 0) ? 1 : 0;
    }
    
    if (right_p())
    {
        move_noise = true;
        confirm_choice_index = ((confirm_choice_index + 1) > 1) ? 0 : 1;
    }
    
    var heart_xpos = (116 * scale) + (confirm_choice_index * 75 * scale);
    
    if (global.lang == "ja")
        heart_xpos = (106 * scale) + (confirm_choice_index * 95 * scale);
    
    var heart_ypos = yy + (7 * scale) + (mpos * 30 * scale);
    draw_sprite_ext(spr_heart_launcher, 0, heart_xpos, heart_ypos, scale / 2, scale / 2, 0, c_white, (fademax - fade) / fademax);
    var max_options = 7;
    
    for (var i = 0; i < max_options; i++)
    {
        var mycolor = c_gray;
        
        if (i < latestAvailableChapter)
            mycolor = c_white;
        
        if (mpos == i)
            mycolor = c_yellow;
        
        mycolor = merge_color(mycolor, c_black, fade / fademax);
        draw_sprite_ext(spr_chapterIcon, i, xx + (234 * scale), (-fade * scale) + yy + (i * 30 * scale), scale, scale, 0, mycolor, 1 - (fade / fademax));
        draw_set_color(mycolor);
        draw_set_halign(fa_left);
        draw_set_font(fnt_main);
        draw_text_transformed(xx, -fade + yy + (mspace * i) + (3 * scale), chapterstring + string(i + 1) + "章", scale, scale, 0);
        draw_set_font(text_font);
        draw_set_halign(fa_center);
        
        if (mpos == i)
        {
            var play_color = (confirm_choice_index == 0) ? c_yellow : c_white;
            draw_set_color(play_color);
            
            if (global.lang == "en")
                draw_text_transformed(146 * scale, (-fade * scale) + yy + (mspace * i) + (3 * scale), stringPlay, scale, scale, 0);
            else
                draw_text_transformed(156 * scale, (-fade * scale) + yy + (mspace * i) + (3 * scale), stringPlay, scale, scale, 0);
            
            var not_color = (confirm_choice_index == 1) ? c_yellow : c_white;
            draw_set_color(not_color);
            
            if (global.lang == "en")
                draw_text_transformed(226 * scale, (-fade * scale) + yy + (mspace * i) + (3 * scale), stringDoNot, scale, scale, 0);
            else
                draw_text_transformed(236 * scale, (-fade * scale) + yy + (mspace * i) + (3 * scale), stringDoNot, scale, scale, 0);
        }
        else
        {
            draw_text_transformed(176 * scale, -fade + yy + (mspace * i) + (3 * scale), chapname[i + 1], scale, scale, 0);
        }
        
        draw_set_halign(fa_left);
        draw_set_color(c_white);
    }
    
    if (!console)
    {
        var mycolor = c_white;
        
        if (mpos == 7)
            mycolor = c_yellow;
        
        mycolor = merge_color(mycolor, c_black, fade / fademax);
        draw_set_color(mycolor);
        draw_set_halign(fa_center);
        draw_text_transformed(160 * scale, (-fade * scale) + (218 * scale), quit, scale, scale, 0);
        draw_set_halign(fa_left);
    }
    
    if (button1_p() && timer > 12)
    {
        timer = 0;
        select_noise = true;
        
        if (confirm_choice_index == 0)
            con = "gameload";
        else
            con = "chapterselect";
    }
    
    if (button2_p() && timer > 12)
    {
        timer = 0;
        select_noise = true;
        con = "chapterselect";
    }
}

if (con == "gameload")
{
    if (spr_aftereffect == 0)
    {
        spr_aftereffect = sprite_create_from_surface(application_surface, 0, 0, room_width, room_height, false, false, 0, 0);
        sprite_set_offset(spr_aftereffect, room_width / 2, room_height / 2);
        yy = room_height / 2;
    }
    
    if (chaptertoload != 0)
    {
        audio_sound_gain(loop, 0, 500);
        
        switch (chaptertoload)
        {
            case 1:
                audio_play_sound(AUDIO_APPEARANCE, 50, 0);
                break;
            
            case 2:
                audio_play_sound(snd_queen_bitcrushlaugh, 50, 0);
                break;
        }
        
        chaptertoload_temp = chaptertoload;
        chaptertoload = 0;
        alarm[2] = 60;
        alarm[3] = 50;
    }
    
    draw_sprite_ext(spr_aftereffect, 0, room_width / 2, yy, xscale, yscale, 0, c_white, fadeout);
    fadeout = lerp(fadeout, 0, 0.125);
    xscale *= 0.95;
    yscale *= 0.99;
    yy *= 0.99;
}

if (move_noise)
{
    move_noise = false;
    audio_play_sound(snd_menumove, 50, 0);
}

if (select_noise)
{
    select_noise = false;
    audio_play_sound(snd_select, 50, 0);
}
