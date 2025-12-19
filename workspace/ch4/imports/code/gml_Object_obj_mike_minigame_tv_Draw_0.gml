scr_depth(undefined, 100);
draw_set_colour(c_black);
ossafe_fill_rectangle(60, 80, 580, 180, 0);
var smallfont = scr_84_get_font("main");
var bigfont = scr_84_get_font("mainbig");
draw_set_colour(c_white);
draw_set_font(smallfont);
draw_set_halign(fa_left);

if (i_ex(obj_mike_hand))
{
    if (minigame == 0)
    {
        draw_set_font(bigfont);
        
        if (obj_room_castle_tv_zone_minigame.console_version)
        {
            var yy = 80;
            
            if (global.lang == "ja")
            {
                yy = 110;
                draw_set_font(smallfont);
            }
            
            draw_text(70, yy, console_desc);
        }
        else
        {
            draw_text(70, 80, desc[minigame]);
        }
    }
    else
    {
        draw_set_font(bigfont);
        draw_set_colour(c_aqua);
        draw_text(70, 80, name[minigame]);
        draw_set_colour(c_white);
        draw_set_font(smallfont);
        draw_text(70, 110, desc[minigame]);
    }
}

draw_set_font(fnt_mainbig);

if (minigame > 0)
{
    draw_set_halign(fa_right);
    var scale = (hiscore[minigame] >= 100000000) ? 0.5 : 1;
    draw_text_ext_transformed(550, 80, string(hiscore[minigame]), 0, 999, scale, 1, 0);
    var _trophy = 0;
    
    if (hiscore[minigame] >= silver_score[minigame])
        _trophy = 1;
    
    if (hiscore[minigame] >= gold_score[minigame])
        _trophy = 2;
    
    if (hiscore[minigame] >= platinum_score[minigame])
        _trophy = 3;
    
    if (hiscore[minigame] >= bronze_score[minigame])
        draw_sprite(spr_trophy, _trophy, 556, 86);
    
    scale = (latestscore[minigame] >= 1000000) ? 0.5 : 1;
    
    if (latestscore[minigame] > 0)
        draw_text_ext_transformed(550, 110, string(latestscore[minigame]), 0, 999, scale, 1, 0);
    
    draw_set_halign(fa_left);
    draw_text(330, 80, "最高分");
    
    if (latestscore[minigame] > 0)
        draw_text(330, 110, "上一次得分");
}
