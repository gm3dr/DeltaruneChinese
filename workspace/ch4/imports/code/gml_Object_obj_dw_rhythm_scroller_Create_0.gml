init = false;
text_timer = 0;
text_speed = -2;
text_y_pos = 0;
text_x_pos[0] = view_wport[0] / 4;
text_x_pos[1] = view_wport[0] / 4;
yy = 0;
margin_top = 8;
target_ypos = -80;
banner_alpha = 0;
_highscore = 0;
_highscore_rank = 0;
_highscore_rank_hard = 0;
_highscore_hard = 0;
_track_name = "";
scrolling_text = "";
show_active = false;
draw_set_font(scr_84_get_font("mainbig"));

init_song = function(arg0)
{
    _highscore = string(arg0[0]);
    _highscore_rank = string(arg0[1]);
    _highscore_rank_hard = string(arg0[2]);
    _highscore_hard = string(arg0[3]);
    _track_name = string(arg0[4]);
    _song_id = string(arg0[5]);
    scrolling_text = "! " + _track_name + " ! " + /*"High Score (Normal) - "*/"最高得分（普通）- " + _highscore + " ! " + /*"High Score (Hard) - "*/"最高得分（困难） - " + _highscore_hard + " ! ";
    init = true;
};

show_banner = function()
{
    var x_offset = 0;
    
    if (global.lang == "ja")
    {
        if (_song_id == 0)
            x_offset = 400;
        else if (_song_id == 2)
            x_offset = 160;
        else if (_song_id == 10)
            x_offset = 160;
    }
    
    text_x_pos[0] = 40;
    text_x_pos[1] = 40 + (string_width(scrolling_text) * 2) + x_offset;
    scr_lerpvar("banner_alpha", banner_alpha, 1, 30, 2, "out");
    scr_lerpvar("target_ypos", target_ypos, 16, 20, 2, "out");
};

hide_banner = function()
{
    scr_lerpvar("banner_alpha", banner_alpha, 0, 30, 2, "out");
    scr_lerpvar("target_ypos", target_ypos, -80, 20, 2, "out");
};
