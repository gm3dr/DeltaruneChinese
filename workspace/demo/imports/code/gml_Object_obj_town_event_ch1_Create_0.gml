choicetimer = 0;
flush = 0;
con = 0;

if (room == room_town_mid_ch1)
{
    if (global.flag[271] == 0)
    {
        bnpc = instance_create_ch1(x, y, obj_npc_room_animated_ch1);
        bnpc.sprite_index = spr_npc_icemascot1_ch1;
    }
    else
    {
        bnpc = instance_create_ch1(x + 7, y + 4, obj_npc_room_ch1);
        bnpc.sprite_index = spr_npc_burgerpants_ch1;
    }
	if (global.names >= 2)
	{
		var conbini = scr_marker(940, -50, bg_zhname_building_store_ch1);
		conbini.depth = 980000;
    }
}

if (room == room_town_south_ch1)
{
    policewindow = scr_marker_ch1(292, 57, spr_policewindow_ch1);
    
    with (policewindow)
        depth = 940000;
}

if (room == room_graveyard_ch1)
{
    overlay = instance_create_ch1(0, 0, obj_backgrounder_sprite_ch1);
    
    with (obj_mainchara_ch1)
        bg = 1;
    
    with (overlay)
    {
        image_alpha = 0.4;
        ss = 0.1;
        sprite_index = spr_graveyard_overlay_ch1;
        depth = 1000;
    }
}
