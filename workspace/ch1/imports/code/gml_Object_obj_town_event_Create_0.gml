choicetimer = 0;
flush = 0;
con = 0;

if (room == room_town_mid)
{
    if (global.flag[271] == 0)
    {
        bnpc = instance_create(x, y, obj_npc_room_animated);
        bnpc.sprite_index = spr_npc_icemascot1;
    }
    else
    {
        bnpc = instance_create(x + 7, y + 4, obj_npc_room);
        bnpc.sprite_index = spr_npc_burgerpants;
    }
}

if (room == room_town_south)
{
    policewindow = scr_marker(292, 57, spr_policewindow);
    
    with (policewindow)
        depth = 940000;
}

if (room == room_graveyard)
{
    overlay = instance_create(0, 0, obj_backgrounder_sprite);
    
    with (obj_mainchara)
        bg = 1;
    
    with (overlay)
    {
        image_alpha = 0.4;
        ss = 0.1;
        sprite_index = spr_graveyard_overlay;
        depth = 1000;
    }
}
