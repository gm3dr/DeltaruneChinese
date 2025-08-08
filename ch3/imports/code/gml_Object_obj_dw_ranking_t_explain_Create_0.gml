type = 0;
timer = 0;

if (global.plot > 150)
    type = 1;

is_active = false;
mask_x_pos = view_wport[0];
is_closed = true;

show_explain = function()
{
    if (type == 0)
        snd_play_x(snd_circle_zoom, 1, image_alpha + random(0.1));
    
    is_closed = false;
    mask_x_pos = view_wport[0];
    scr_lerpvar("mask_x_pos", mask_x_pos, 0, 12);
    is_active = true;
};

hide_explain = function()
{
    snd_stop(snd_circle_zoom);
    
    if (type == 0)
        snd_play_x(snd_circle_zoom, 1, (image_alpha + random(0.1)) - 0.1);
    
    scr_lerpvar("mask_x_pos", mask_x_pos, view_wport[0], 12);
    scr_delay_var("is_active", false, 13);
    scr_delay_var("is_closed", true, 13);
};

if (global.names >= 2)
{
	sprite_index = spr_zhname_dw_ranking_t_explain;
}