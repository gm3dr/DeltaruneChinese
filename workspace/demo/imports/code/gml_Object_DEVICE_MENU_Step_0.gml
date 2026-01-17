if (!input_enabled)
    exit;

if (MENU_NO == 1 || MENU_NO == 4 || MENU_NO == 6 || MENU_NO == 7 || MENU_NO == 11)
{
    if (left_p())
    {
        if (MENUCOORD[MENU_NO] == 1)
        {
            MENUCOORD[MENU_NO] = 0;
            MOVENOISE = 1;
        }
    }
    
    if (right_p())
    {
        if (MENUCOORD[MENU_NO] == 0)
        {
            MENUCOORD[MENU_NO] = 1;
            MOVENOISE = 1;
        }
    }
    
    if (button1_p() && ONEBUFFER < 0)
    {
        ONEBUFFER = 2;
        TWOBUFFER = 2;
        SELNOISE = 1;
        
        if (MENUCOORD[MENU_NO] == 0)
        {
            if (MENU_NO == 1 || MENU_NO == 11)
            {
                var FILECHECK = 0;
                var FILESLOT = 0;
                var DONAMING = 0;
                
                if (MENU_NO == 1)
                    FILESLOT = MENUCOORD[0];
                
                if (MENU_NO == 11)
                    FILESLOT = MENUCOORD[10];
                
                if (MENU_NO == 1 && FILE[MENUCOORD[0]] == 1)
                    FILECHECK = 1;
                
                if (MENU_NO == 11)
                {
                    if (INCOMPLETE_LOAD)
                    {
                        if (INCOMPLETEFILE_PREV[FILESLOT] == 1)
                            FILECHECK = 1;
                        else
                            FILECHECK = -1;
                    }
                    else if (COMPLETEFILE_PREV[FILESLOT] == 1)
                    {
                        FILECHECK = 1;
                    }
                    else
                    {
                        FILECHECK = -1;
                    }
                }
                
                if (FILECHECK)
                {
                    global.filechoice = FILESLOT;
                    snd_free_all();
                    f = instance_create(0, 0, obj_persistentfadein);
                    f.image_xscale = 1000;
                    f.image_yscale = 1000;
                    
                    if (ossafe_file_exists("keyconfig_" + string(global.filechoice) + ".ini"))
                    {
                        ossafe_ini_open("keyconfig_" + string(global.filechoice) + ".ini");
                        
                        for (i = 0; i < 10; i += 1)
                        {
                            readval = ini_read_real("KEYBOARD_CONTROLS", string(i), -1);
                            
                            if (readval != -1)
                                global.input_k[i] = readval;
                        }
                        
                        for (i = 0; i < 10; i += 1)
                        {
                            readval = ini_read_real("GAMEPAD_CONTROLS", string(i), -1);
                            
                            if (readval != -1)
                                global.input_g[i] = readval;
                        }
                        
                        if (!global.is_console)
                        {
                            ini_close();
                        }
                        else
                        {
                            readval = ini_read_real("SHOULDERLB_REASSIGN", "SHOULDERLB_REASSIGN", obj_gamecontroller.gamepad_shoulderlb_reassign);
                            
                            if (readval != -1)
                                obj_gamecontroller.gamepad_shoulderlb_reassign = readval;
                            
                            global.button0 = global.input_g[4];
                            global.button1 = global.input_g[5];
                            global.button2 = global.input_g[6];
                            global.screen_border_id = ini_read_string("BORDER", "TYPE", "Dynamic");
                            var _disable_border = global.screen_border_id == "None" || global.screen_border_id == "なし";
                            scr_enable_screen_border(!_disable_border);
                            ossafe_ini_close();
                            ossafe_savedata_save();
                        }
                    }
                    
                    if (MENU_NO == 1)
                    {
                        scr_load();
                        exit;
                    }
                    
                    if (MENU_NO == 11)
                    {
                        if (INCOMPLETE_LOAD == 0)
                        {
                            global.filechoice += 3;
                            scr_load_chapter1();
                            global.filechoice -= 3;
                        }
                        else
                        {
                            scr_load_chapter1();
                        }
                        
                        if (global.flag[914] == 0)
                            global.flag[914] = global.chapter - 1;
                        
                        FILECHECK = -2;
                        STARTGAME = 1;
                    }
                }
                
                if (FILECHECK == 0)
                {
                    global.filechoice = FILESLOT;
                    var namer = instance_create(0, 0, DEVICE_NAMER);
                    namer.REMMENU = MENU_NO;
                    REMMENU = MENU_NO;
                    MENU_NO = -1;
                }
                
                if (FILECHECK == -1)
                    snd_play(snd_error);
            }
            
            if (MENU_NO == 4)
            {
                var temp_comment_is_interesting = false;
                
                if (TYPE == 0)
                {
                    TEMPCOMMENT = stringsetloc("IT CONFORMED TO THE REFLECTION.", "DEVICE_MENU_slash_Step_0_gml_74_0");
                    
                    if (NAME[0] == NAME[1] && NAME[1] == NAME[2])
                    {
                        if (TIME[0] == TIME[1] && TIME[1] == TIME[2])
                        {
                            if (PLACE[0] == PLACE[1] && PLACE[1] == PLACE[2])
                            {
                                temp_comment_is_interesting = true;
                                TEMPCOMMENT = stringsetloc("WHAT AN INTERESTING BEHAVIOR.", "DEVICE_MENU_slash_Step_0_gml_77_0");
                            }
                        }
                    }
                }
                
                event_user(5);
                
                if (TYPE == 0)
                {
                    if (NAME[0] == NAME[1] && NAME[1] == NAME[2])
                    {
                        if (TIME[0] == TIME[1] && TIME[1] == TIME[2])
                        {
                            if (PLACE[0] == PLACE[1] && PLACE[1] == PLACE[2] && !temp_comment_is_interesting)
                                TEMPCOMMENT = stringsetloc("PREPARATIONS ARE COMPLETE.", "DEVICE_MENU_slash_Step_0_gml_86_0");
                        }
                    }
                }
                
                if (TYPE == 1)
                    TEMPCOMMENT = stringsetloc("Copy complete.", "DEVICE_MENU_slash_Step_0_gml_91_0");
                
                MESSAGETIMER = 90;
                SELNOISE = 0;
                DEATHNOISE = 1;
                MENU_NO = 0;
            }
            
            if (MENU_NO == 7)
            {
                FILE[MENUCOORD[5]] = 0;
                NAME[MENUCOORD[5]] = stringsetloc("[EMPTY]", "DEVICE_MENU_slash_Step_0_gml_105_0");
                TIME[MENUCOORD[5]] = 0;
                PLACE[MENUCOORD[5]] = "------------";
                LEVEL[MENUCOORD[5]] = 0;
                TIME_STRING[MENUCOORD[5]] = "--:--";
                ossafe_file_delete("filech" + string(global.chapter) + "_" + string(MENUCOORD[5]));
                iniwrite = ossafe_ini_open("dr.ini");
                ini_write_string(scr_ini_chapter(global.chapter, MENUCOORD[5]), "Name", "[EMPTY]");
                ini_write_real(scr_ini_chapter(global.chapter, MENUCOORD[5]), "Level", 0);
                ini_write_real(scr_ini_chapter(global.chapter, MENUCOORD[5]), "Love", 0);
                ini_write_real(scr_ini_chapter(global.chapter, MENUCOORD[5]), "Time", 0);
                ini_write_real(scr_ini_chapter(global.chapter, MENUCOORD[5]), "Room", 0);
                ini_write_real(scr_ini_chapter(global.chapter, MENUCOORD[5]), "Date", 0);
                ini_write_real(scr_ini_chapter(global.chapter, MENUCOORD[5]), "UraBoss", 0);
                ini_write_string(scr_ini_chapter(global.chapter, MENUCOORD[5]), "Version", "0");
                ossafe_ini_close();
                ossafe_savedata_save();
                
                if (ossafe_file_exists("keyconfig_" + string(MENUCOORD[5]) + ".ini"))
                    ossafe_file_delete("keyconfig_" + string(MENUCOORD[5]) + ".ini");
                
                TEMPCOMMENT = stringsetloc("IT WAS AS IF IT WAS NEVER THERE AT ALL.", "DEVICE_MENU_slash_Step_0_gml_126_0");
                
                if (TYPE == 1)
                    TEMPCOMMENT = stringsetloc("Erase complete.", "DEVICE_MENU_slash_Step_0_gml_127_0");
                
                MESSAGETIMER = 90;
                SELNOISE = 0;
                DEATHNOISE = 1;
                MENU_NO = 0;
            }
            
            if (MENU_NO == 6)
            {
                THREAT += 1;
                MENU_NO = 7;
                MENUCOORD[7] = 0;
            }
        }
        
        if (MENU_NO >= 0)
        {
            if (MENUCOORD[MENU_NO] == 1)
            {
                if (MENU_NO == 4 && TYPE == 0)
                {
                    TEMPCOMMENT = stringsetloc("IT RETAINED ITS ORIGINAL SHAPE.", "DEVICE_MENU_slash_Step_0_gml_149_0");
                    MESSAGETIMER = 90;
                }
                
                if (MENU_NO == 6 || MENU_NO == 7)
                {
                    if (TYPE == 0)
                    {
                        TEMPCOMMENT = stringsetloc("THEN IT WAS SPARED.", "DEVICE_MENU_slash_Step_0_gml_156_0");
                        
                        if (THREAT >= 10)
                        {
                            TEMPCOMMENT = stringsetloc("VERY INTERESTING.", "DEVICE_MENU_slash_Step_0_gml_159_0");
                            THREAT = 0;
                        }
                        
                        MESSAGETIMER = 90;
                    }
                }
                
                if (MENU_NO == 11)
                    MENU_NO = 10;
                else
                    MENU_NO = 0;
            }
        }
    }
    
    if (button2_p() && TWOBUFFER < 0)
    {
        ONEBUFFER = 1;
        TWOBUFFER = 1;
        
        if (MENU_NO != 0)
            BACKNOISE = 1;
        
        if (MENU_NO == 1)
            MENU_NO = 0;
        else if (MENU_NO == 4)
            MENU_NO = 2;
        else if (MENU_NO == 6)
            MENU_NO = 5;
        else if (MENU_NO == 7)
            MENU_NO = 5;
        else if (MENU_NO == 11)
            MENU_NO = 10;
    }
}

if (MENU_NO == 2 || MENU_NO == 3 || MENU_NO == 5)
{
    if (down_p())
    {
        if (MENUCOORD[MENU_NO] < 3)
        {
            MENUCOORD[MENU_NO] += 1;
            MOVENOISE = 1;
        }
    }
    
    if (up_p())
    {
        if (MENUCOORD[MENU_NO] > 0)
        {
            MENUCOORD[MENU_NO] -= 1;
            MOVENOISE = 1;
        }
    }
    
    if (button1_p() && ONEBUFFER < 0)
    {
        if (MENUCOORD[MENU_NO] < 3)
        {
            if (MENU_NO == 3)
            {
                if (MENUCOORD[2] != MENUCOORD[3])
                {
                    if (FILE[MENUCOORD[MENU_NO]] == 1)
                    {
                        TWOBUFFER = 2;
                        ONEBUFFER = 2;
                        SELNOISE = 1;
                        MENUCOORD[4] = 0;
                        MENU_NO = 4;
                    }
                    else
                    {
                        TEMPCOMMENT = stringsetloc("THE DIVISION IS COMPLETE.", "DEVICE_MENU_slash_Step_0_gml_225_0");
                        MESSAGETIMER = 90;
                        
                        if (TYPE == 1)
                            TEMPCOMMENT = stringsetloc("Copy complete.", "DEVICE_MENU_slash_Step_0_gml_227_0");
                        
                        DEATHNOISE = 1;
                        MENU_NO = 0;
                        ONEBUFFER = 2;
                        TWOBUFFER = 2;
                        event_user(5);
                    }
                }
                else
                {
                    TEMPCOMMENT = stringsetloc("IT IS IMMUNE TO ITS OWN IMAGE.", "DEVICE_MENU_slash_Step_0_gml_238_0");
                    
                    if (TYPE == 1)
                        TEMPCOMMENT = stringsetloc("You can't copy there.", "DEVICE_MENU_slash_Step_0_gml_239_0");
                    
                    MESSAGETIMER = 90;
                    TWOBUFFER = 2;
                    ONEBUFFER = 2;
                    BACKNOISE = 1;
                }
            }
            
            if (MENU_NO == 2)
            {
                if (FILE[MENUCOORD[MENU_NO]] == 1)
                {
                    TWOBUFFER = 2;
                    ONEBUFFER = 2;
                    SELNOISE = 1;
                    MENUCOORD[3] = 0;
                    MENU_NO = 3;
                }
                else
                {
                    TEMPCOMMENT = stringsetloc("IT IS BARREN AND CANNOT BE COPIED.", "DEVICE_MENU_slash_Step_0_gml_261_0");
                    
                    if (FILE[0] == 0 && FILE[1] == 0 && FILE[2] == 0)
                        TEMPCOMMENT = stringsetloc("BUT THERE WAS NOTHING LEFT TO COPY.", "DEVICE_MENU_slash_Step_0_gml_264_0");
                    
                    if (TYPE == 1)
                        TEMPCOMMENT = stringsetloc("It can't be copied.", "DEVICE_MENU_slash_Step_0_gml_266_0");
                    
                    MESSAGETIMER = 90;
                    BACKNOISE = 1;
                    TWOBUFFER = 2;
                    ONEBUFFER = 2;
                }
            }
            
            if (MENU_NO == 5)
            {
                if (FILE[MENUCOORD[MENU_NO]] == 1)
                {
                    TWOBUFFER = 2;
                    ONEBUFFER = 2;
                    SELNOISE = 1;
                    MENUCOORD[6] = 0;
                    MENU_NO = 6;
                }
                else
                {
                    TEMPCOMMENT = stringsetloc("BUT IT WAS ALREADY GONE.", "DEVICE_MENU_slash_Step_0_gml_289_0");
                    
                    if (FILE[0] == 0 && FILE[1] == 0 && FILE[2] == 0)
                        TEMPCOMMENT = stringsetloc("BUT THERE WAS NOTHING LEFT TO ERASE.", "DEVICE_MENU_slash_Step_0_gml_292_0");
                    
                    if (TYPE == 1)
                        TEMPCOMMENT = stringsetloc("There's nothing to erase.", "DEVICE_MENU_slash_Step_0_gml_294_0");
                    
                    MESSAGETIMER = 90;
                    TWOBUFFER = 2;
                    ONEBUFFER = 2;
                    BACKNOISE = 1;
                }
            }
        }
        
        if (MENUCOORD[MENU_NO] == 3)
        {
            TWOBUFFER = 2;
            ONEBUFFER = 2;
            SELNOISE = 1;
            MENU_NO = 0;
        }
    }
    
    if (button2_p() && TWOBUFFER < 0)
    {
        TWOBUFFER = 2;
        ONEBUFFER = 2;
        BACKNOISE = 1;
        
        if (MENU_NO == 2 || MENU_NO == 5)
            MENU_NO = 0;
        
        if (MENU_NO == 3)
            MENU_NO = 2;
    }
}

if (MENU_NO == 0 || MENU_NO == 10)
{
    var M = MENU_NO;
    var MAXY = 8;
    
    if (M == 10)
        MAXY = 3;
    
    if (down_p())
    {
        if (MENUCOORD[M] < MAXY)
        {
            if (MENUCOORD[M] < 3)
                MENUCOORD[M] += 1;
            else if (MENUCOORD[M] == 3)
                MENUCOORD[M] = 5;
            else if (MENUCOORD[M] == 4)
                MENUCOORD[M] = 6;
            else if (MENUCOORD[M] == 7 && CANQUIT == 1)
                MENUCOORD[M] = 8;
            
            MOVENOISE = 1;
        }
    }
    
    if (up_p())
    {
        if (MENUCOORD[M] > 0)
        {
            if (MENUCOORD[M] < 3)
                MENUCOORD[M] -= 1;
            else if (MENUCOORD[M] == 3 || MENUCOORD[M] == 4 || MENUCOORD[M] == 7)
                MENUCOORD[M] = 2;
            else if (MENUCOORD[M] == 5 || MENUCOORD[M] == 6)
                MENUCOORD[M] -= 2;
            else if (MENUCOORD[M] == 8)
                MENUCOORD[M] = 7;
            
            MOVENOISE = 1;
        }
    }
    
    if (right_p())
    {
        if (MENUCOORD[M] >= 3 && MENUCOORD[M] < 7)
        {
            MOVENOISE = 1;
            
            if (MENUCOORD[M] == 4)
                MENUCOORD[M] = 7;
            else if (MENUCOORD[M] == 6 && CANQUIT == 1)
                MENUCOORD[M] = 8;
            else
                MENUCOORD[M]++;
        }
    }
    
    if (left_p())
    {
        if (MENUCOORD[M] >= 4 && MENUCOORD[M] != 5)
        {
            if (MENUCOORD[M] == 7)
                MENUCOORD[M] = 4;
            else if (MENUCOORD[M] == 8)
                MENUCOORD[M] = 6;
            else
                MENUCOORD[M]--;
            
            MOVENOISE = 1;
        }
    }
    
    if (button1_p() && ONEBUFFER < 0)
    {
        MESSAGETIMER = -1;
        
        if (MENUCOORD[M] <= 2)
        {
            var FILECHECK = 1;
            
            if (MENU_NO == 10)
            {
                if (INCOMPLETE_LOAD == 0 && COMPLETEFILE_PREV[MENUCOORD[M]] != 1)
                    FILECHECK = 0;
                
                if (INCOMPLETE_LOAD == 1 && INCOMPLETEFILE_PREV[MENUCOORD[M]] != 1)
                    FILECHECK = 0;
            }
            
            if (FILECHECK)
            {
                MENUCOORD[M + 1] = 0;
                ONEBUFFER = 1;
                TWOBUFFER = 1;
                MENU_NO = M + 1;
                SELNOISE = 1;
            }
            else
            {
                ONEBUFFER = 4;
                snd_play(snd_error);
            }
        }
        
        if (MENUCOORD[M] == 3)
        {
            if (M == 0)
            {
                MENUCOORD[2] = 0;
                ONEBUFFER = 1;
                TWOBUFFER = 1;
                MENU_NO = 2;
                SELNOISE = 1;
            }
            else
            {
                MENUCOORD[0] = 5;
                ONEBUFFER = 1;
                TWOBUFFER = 1;
                MENU_NO = 0;
                SELNOISE = 1;
            }
        }
        
        if (MENUCOORD[M] == 4)
        {
            MENUCOORD[5] = 0;
            ONEBUFFER = 1;
            TWOBUFFER = 1;
            MENU_NO = 5;
            SELNOISE = 1;
        }
        
        if (MENUCOORD[M] == 5)
        {
            MENUCOORD[10] = 0;
            ONEBUFFER = 1;
            TWOBUFFER = 1;
            MENU_NO = 10;
            SELNOISE = 1;
        }
        
        if (MENUCOORD[M] == 6)
        {
            SELNOISE = 1;
            names_countdown = 90;
            scr_change_language();
            scr_84_load_ini();
        }
        
        if (MENUCOORD[M] == 7)
        {
            input_enabled = false;
            SELNOISE = 1;
            snd_free_all();
            alarm[0] = 30;
        }
        
        if (MENUCOORD[M] == 8 && CANQUIT)
        {
            SELNOISE = 1;
            
            if (global.is_console)
                ossafe_game_end();
            else
                game_end();
        }
    }
    
    if (button2_p() && TWOBUFFER < 0)
    {
        ONEBUFFER = 1;
        TWOBUFFER = 1;
        BACKNOISE = 1;
        
        if (MENU_NO == 10)
            MENU_NO = 0;
    }
}

if (OBMADE == 1)
{
    OB_DEPTH += 1;
    obacktimer += OBM;
    
    if (obacktimer >= 20)
    {
        DV = instance_create(0, 0, DEVICE_OBACK_4);
        DV.depth = 5 + OB_DEPTH;
        DV.OBSPEED = 0.01 * OBM;
        
        if (OB_DEPTH >= 60000)
            OB_DEPTH = 0;
        
        obacktimer = 0;
    }
}

if (MOVENOISE == 1)
{
    snd_play(snd_menumove);
    MOVENOISE = 0;
}

if (SELNOISE == 1)
{
    snd_play(snd_select);
    SELNOISE = 0;
}

if (BACKNOISE == 1)
{
    snd_play(snd_swing);
    BACKNOISE = 0;
}

if (DEATHNOISE == 1)
{
    snd_play(AUDIO_APPEARANCE);
    DEATHNOISE = 0;
}

ONEBUFFER -= 1;
TWOBUFFER -= 1;

if (STARTGAME == 1)
{
    snd_free_all();
    
    if (global.chapter == 1)
        room_goto(PLACE_CONTACT);
    
    if (global.chapter >= 2)
        room_goto(room_krisroom);
}

if (names_countdown > 0)
    names_countdown -= 1;