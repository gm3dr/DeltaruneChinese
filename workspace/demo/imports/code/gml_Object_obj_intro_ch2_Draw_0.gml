if (show_queen)
{
    if (queen_animate)
    {
        queen_siner++;
        queen_sprite_index = queen_siner / 3;
    }
    else
    {
        queen_sprite_index = 0;
    }
    
    draw_sprite_ext(queen_sprite, queen_sprite_index, view_wport[0] / 4, queen_y_pos, 1, 1, 0, c_white, queen_alpha);
}
else
{
    if (init == 0 && con == 1)
    {
        logopieces = 0;
        init = 1;
        
        for (i = 0; i < 9; i++)
            drawlogopart[i] = 0;
        
        con = 2;
        logotimer = 0;
    }
    
    if (con == 2)
    {
        logotimer++;
        
        if ((logotimer % 8) == 0 && logotimer < 80)
        {
            snd_play_x(snd_noise, 0.8, 0.5 + random(1));
            
            if (logopieces == 0)
                drawlogopart[0] = 1;
            
            if (logopieces == 1)
                drawlogopart[8] = 1;
            
            if (logopieces == 2)
                drawlogopart[1] = 1;
            
            if (logopieces == 3)
                drawlogopart[7] = 1;
            
            if (logopieces == 4)
                drawlogopart[2] = 1;
            
            if (logopieces == 5)
                drawlogopart[6] = 1;
            
            if (logopieces == 6)
                drawlogopart[3] = 1;
            
            if (logopieces == 7)
                drawlogopart[5] = 1;
            
            if (logopieces == 8)
                drawlogopart[4] = 1;
            
            logopieces++;
        }
        
        for (i = 0; i < 9; i++)
        {
            if (drawlogopart[i] == 1)
                draw_sprite_ext(IMAGE_LOGO_CENTER_SEPARATE, i, 160, 100, 1, 1, 0, c_white, 1);
        }
        
        if (logotimer == 120)
            snd_play(snd_queen_laugh_title);
        
        if (logotimer >= 120)
        {
            draw_set_font(fnt_mainbig);
            draw_set_color(c_white);
            draw_text_ext(130, 120, "第2章", 10, 900);
            scr_84_set_draw_font("mainbig");
        }
        
        if (logotimer >= 240)
            room_goto(PLACE_MENU);
    }
}
