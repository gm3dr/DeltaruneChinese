con = -1;
customcon = 0;
var store_marker = scr_marker(940, -50, global.names >= 2 ? bg_building_store : bg_zhname_building_store);
store_marker.depth = 994000;
_sign = scr_marker_animated(1004, 59, spr_lw_conbini_open_sign, 0.05);
_sign.depth = 980000;

if (scr_sideb_active())
{
    store_marker.sprite_index = global.names >= 2 ? spr_zhname_lw_conbini_open : spr_lw_conbini_open;
    store_marker.depth = 980010;
}
else if (scr_flag_get(1324) == 0)
{
    _sign.visible = false;
}
else if (scr_flag_get(1324) > 0 && scr_flag_get(1324) < 3)
{
    store_marker.sprite_index = global.names >= 2 ? spr_zhname_festival_icecreams : spr_festival_icecreams;
    store_marker.depth = 993900;
}

_readable = instance_create(1000, 50, obj_readable_room1);

with (_readable)
{
    extflag = "conbini";
    image_xscale = 2;
    image_yscale = 2;
}

show_convo = function(arg0)
{
    if (scr_sideb_active())
    {
        if (scr_flag_get(1761) == 0)
            con = 30;
        else
            con = 40;
    }
    else if (scr_flag_get(1761) == 0)
    {
        con = 10;
    }
    else
    {
        con = 20;
    }
};
