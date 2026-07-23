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
_song_id = 0;
_string_width = 0;
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
    scrolling_text = "! " + _track_name + " ! " + "High Score (Normal) - " + _highscore + " ! " + "High Score (Hard) - " + _highscore_hard + " ! ";
    _string_width = string_width(scrolling_text);
    init = true;
};

show_banner = function()
{
    text_x_pos[0] = 40;
    text_x_pos[1] = 40 + _string_width;
    scr_lerpvar("banner_alpha", banner_alpha, 1, 30, 2, "out");
    scr_lerpvar("target_ypos", target_ypos, 16, 20, 2, "out");
};

hide_banner = function()
{
    scr_lerpvar("banner_alpha", banner_alpha, 0, 30, 2, "out");
    scr_lerpvar("target_ypos", target_ypos, -80, 20, 2, "out");
};
