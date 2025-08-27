con = -1;
customcon = 0;
global.flag[6] = 0;
global.flag[7] = 0;
init = 0;

if (!scr_havechar(2))
    scr_getchar(2);

if (!scr_havechar(3))
    scr_getchar(3);

var vending_machine = instance_create(400, 80, obj_npc_room);
vending_machine.sprite_index = spr_dw_green_room_vending;

with (vending_machine)
    scr_depth();

var tv_readable = instance_create(560, 360, obj_readable_room1);

with (tv_readable)
{
    extflag = "racing";
    image_xscale = 2;
}

var ramb_npc = instance_create(715, 60, obj_npc_ramb);
ramb_npc.sprite_index = spr_npc_ramb_clean;

with (ramb_npc)
    scr_depth();

var bar_front = scr_dark_marker(550, 40, global.names >= 2 ? spr_zhname_dw_green_room_bar_front : spr_dw_green_room_bar_front);
bar_front.depth = ramb_npc.depth - 10;
lancer_npc = instance_create(92, 118, obj_npc_room_animated);

with (lancer_npc)
{
    sprite_index = spr_lancer_rt;
    extflag = "lancer";
    scr_depth();
    image_speed = 0;
}

lancer_marker = -4;
door_closed = scr_dark_marker(992, 14, spr_dw_green_room_door_changing);
door_closed.depth = 98900;
door_ranking = scr_dark_marker(1120, 14, spr_dw_green_room_door_ranking);
door_ranking.depth = 98900;
var couch_left = scr_dark_marker(400, 240, spr_dw_green_room_couch_left);

with (couch_left)
    depth = 97000;

var couch_right = scr_dark_marker(760, 240, spr_dw_green_room_couch_right);

with (couch_right)
    depth = 97000;

var poster_left_readable = instance_create(190, 90, obj_readable_room1);

with (poster_left_readable)
{
    extflag = "left_poster";
    image_xscale = 2;
    image_yscale = 2;
}

var tv_right_readable = instance_create(830, 360, obj_readable_room1);

with (tv_right_readable)
{
    extflag = "tv_right";
    image_xscale = 3;
    image_yscale = 2;
}

var cactus_left_readable = instance_create(280, 400, obj_readable_room1);

with (cactus_left_readable)
{
    extflag = "cactus_left";
    image_xscale = 2;
    image_yscale = 2;
}

var cactus_right_readable = instance_create(1120, 400, obj_readable_room1);

with (cactus_right_readable)
{
    extflag = "cactus_right";
    image_xscale = 2;
    image_yscale = 2;
}

var changing_readable = instance_create(1020, 130, obj_readable_room1);

with (changing_readable)
{
    extflag = "changing_room";
    image_xscale = 2;
}

var changing_block = instance_create(changing_readable.x - 20, changing_readable.y, obj_solidblock);

with (changing_block)
    image_xscale = 4;

blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = 100;
blackall.image_blend = c_black;
blackall.visible = 0;
hide_caterpillar = false;
var savepoint = instance_create(404, 397, obj_savepoint);

with (savepoint)
    scr_depth();

var door_right_cover = scr_dark_marker(1320, 36, spr_dw_green_room_door_tape);

with (door_right_cover)
    depth = 150000;

zapper_npc = instance_create(1260, 58, obj_npc_room);

with (zapper_npc)
{
    extflag = "zapper";
    sprite_index = spr_npc_zapper_talk;
}

zapper_npc.depth = 98000;
elnina_npc = -4;
pippins_npc = -4;
pippins_drink_marker = -4;
word_marker = -4;
border_switch = false;

if (global.plot < 150)
{
    blackall.visible = 1;
    var vines = instance_find(obj_dw_green_room_vines, 0);
    
    if (global.plot == 120)
    {
        con = 50;
        blackall.image_blend = c_white;
        word_marker = scr_marker(camerax() + (view_wport[0] / 2) + 104, cameray() + (view_hport[0] / 2), scr_84_get_sprite("spr_dw_screen_word"));
        word_marker.depth = -100;
    }
    else
    {
        scr_lerp_var_instance(blackall, "image_alpha", 1, 0, 5);
        
        with (blackall)
            scr_delay_var("visible", 0, 6);
        
        if (scr_flag_get(1055) >= 1 && scr_flag_get(1185) == 0)
        {
            if (scr_flag_get(1173) > 0)
            {
                con = 119;
                alarm[0] = 1;
            }
        }
        
        with (obj_border_controller)
            set_border(195);
    }
    
    if (scr_flag_get(1068) == 1)
    {
        with (lancer_npc)
            instance_destroy();
    }
    else
    {
        with (obj_doorAny)
        {
            if (x < 40)
                instance_destroy();
        }
        
        var door_cover_marker = scr_dark_marker(40, 36, spr_dw_green_room_door_cover);
        door_cover_marker.depth = lancer_npc.depth - 10;
        var wall_cover_marker = scr_dark_marker(0, 0, spr_pixel_white);
        wall_cover_marker.depth = door_cover_marker.depth - 10;
        
        with (wall_cover_marker)
        {
            image_blend = c_black;
            image_xscale = 10;
            image_yscale = 100;
        }
    }
    
    var pippins_marker = scr_dark_marker(470, 80, spr_npc_pippins_jump);
    pippins_marker.image_speed = 0.2;
    
    with (pippins_marker)
        scr_depth();
    
    var pippins_readable = instance_create(pippins_marker.x + 8, pippins_marker.y + 16, obj_readable_room1);
    
    with (pippins_readable)
    {
        image_xscale = 3;
        image_yscale = 2;
        extflag = "pippins";
    }
    
    if (scr_flag_get(1210) == 0)
    {
        pippins_npc = instance_create(890, 236, obj_npc_room_animated);
        pippins_npc.sprite_index = spr_npc_pippins_gaming;
        
        with (pippins_npc)
            scr_depth();
    }
    
    elnina_npc = instance_create(798, 220, obj_npc_room_animated);
    elnina_npc.extflag = "elnina_gaming";
    elnina_npc.sprite_index = spr_npc_elnina_blush_gaming;
    
    with (elnina_npc)
        scr_depth();
}
else if (global.plot >= 280)
{
    var snow_vfx = instance_create(0, 0, obj_dw_ch3_tvsnow);
    snow_vfx.bgdepth = 9999;
    
    with (zapper_npc)
        instance_destroy();
    
    with (lancer_npc)
        instance_destroy();
    
    with (ramb_npc)
        instance_destroy();
    
    with (door_right_cover)
        sprite_index = spr_dw_green_room_door_tape_opened;
    
    if (scr_flag_get(1055) >= 3)
    {
        var ramb_readable = instance_create(600, 140, obj_readable_room1);
        
        with (ramb_readable)
        {
            extflag = "ramb_absent";
            image_xscale = 14;
        }
        
        if (scr_flag_get(1055) == 6 && scr_flag_get(1192) == 0)
        {
            if (scr_flag_get(1174) > 0)
            {
                blackall.visible = 1;
                scr_lerp_var_instance(blackall, "image_alpha", 1, 0, 15);
                
                with (blackall)
                    scr_delay_var("visible", 0, 16);
                
                con = 180;
            }
        }
    }
    else
    {
        var ramb_readable = instance_create(730, 140, obj_readable_room1);
        
        with (ramb_readable)
            extflag = (scr_flag_get(1239) == 0) ? "pippins_drink" : "stone_ramb";
        
        var ramb_stone = scr_dark_marker(715, 60, spr_npc_ramb_body_full_stone);
        
        with (ramb_stone)
            scr_depth();
        
        pippins_drink_marker = instance_create(755, 120, obj_dw_ch3_green_room_pippins);
        pippins_drink_marker.depth = bar_front.depth + 5;
        
        if (scr_flag_get(1239) > 0)
        {
            pippins_drink_marker.y = 60;
            var pippins_readable = instance_create(790, 140, obj_readable_room1);
            
            with (pippins_readable)
                extflag = "pippins_drink";
        }
    }
    
    with (obj_doorAny)
    {
        if (x <= 40)
            instance_destroy();
    }
    
    var door_readable = instance_create(64, 160, obj_readable_room1);
    
    with (door_readable)
    {
        extflag = "left_door_exit";
        image_xscale = 2;
        image_yscale = 2;
    }
    
    with (obj_border_controller)
        set_border(3035);
}
else
{
    if (global.plot < 160)
    {
        con = 55;
        blackall.image_blend = c_white;
        blackall.visible = 1;
        
        with (obj_border_controller)
            hide_border(1, 16777215);
    }
    else
    {
        scr_lerp_var_instance(blackall, "image_alpha", 1, 0, 5);
        
        with (blackall)
            scr_delay_var("visible", 0, 6);
        
        with (obj_border_controller)
            set_border(195);
    }
    
    if (scr_flag_get(1055) >= 2 && scr_flag_get(1186) == 0)
    {
        if (scr_flag_get(1174) > 0)
            con = 130;
    }
    
    with (zapper_npc)
    {
        extflag = "zapper_board_2";
        
        if (scr_flag_get(1113) == 2 || scr_flag_get(1114) == 1)
            instance_destroy();
    }
    
    with (lancer_npc)
        instance_destroy();
    
    var lancer_spin = instance_create(1020, 400, obj_dw_ch3_lancer_spin);
    
    with (lancer_spin)
        depth = 96000;
    
    var throuple_marker = scr_dark_marker(806, 190, spr_npc_rouxls_weather_gaming_chef);
    
    with (throuple_marker)
    {
        image_speed = 0.2;
        scr_depth();
    }
    
    var rouxls_readable = instance_create(828, 242, obj_readable_room1);
    
    with (rouxls_readable)
    {
        image_yscale = 3;
        image_xscale = 5;
        extflag = "rouxls";
    }
}

function gotemall()
{
    if ((global.flag[654] + global.flag[655] + global.flag[656] + global.flag[657] + global.flag[658] + global.flag[659]) != 6)
        return false;
    else
        return true;
}

function lostem()
{
    if (global.flag[654] == -1 || global.flag[655] == -1 || global.flag[656] == -1 || global.flag[657] == -1 || global.flag[658] == -1 || global.flag[659] == -1)
        return true;
    else
        return false;
}

clip = -4;
cliptrig = -4;

if (global.plot >= 280)
{
    clip = scr_marker_ext(1250, 90, 571, 2, 2);
    
    with (clip)
        scr_depth();
    
    cliptrig = instance_create(1250, 120, obj_trigger_interact);
    cliptrig.talked = 0;
    
    with (cliptrig)
        scr_size(2, 1.25);
}

visible = true;
siner = 0;

if (global.entrance == 8)
{
    debug_print("in ramb's room now");
    
    with (obj_solidblock)
        instance_destroy();
    
    with (obj_readable_room1)
        instance_destroy();
    
    scr_marker_ext(694, 54, 412, 92, 60, undefined, undefined, 0, 16777215);
    
    with (instance_create(574, 72, obj_solidblocksized))
    {
        scr_size(3, 1);
        visible = false;
    }
    
    with (instance_create(784, 72, obj_solidblocksized))
    {
        scr_size(3, 1);
        visible = false;
    }
    
    with (instance_create(560, 142, obj_solidblocksized))
    {
        scr_size(9, 1);
        visible = false;
    }
    
    with (instance_create(592, 90, obj_solidblocksized))
    {
        scr_size(1, 1);
        visible = false;
    }
    
    with (instance_create(904, 90, obj_solidblocksized))
    {
        scr_size(1, 1);
        visible = false;
    }
    
    with (instance_create(694, 62, obj_doorAny))
    {
        scr_size(2.3, 1);
        doorRoom = 244;
        doorEntrance = 8;
        doorFadeMusic = 1;
    }
    
    bar_front.depth = 98100;
    scr_setparty(0, 0, 0);
    scr_marker_ext(530, 240, 2706, 2, 2, 0.05, 1);
    scr_marker_ext(582, 236, 4679, 2, 2, 1/30, 0);
}

if (global.flag[1067] == 0 && global.flag[1055] >= 6 && global.plot >= 280)
    instance_create(874, 86, obj_treasure_room);

repeat (array_length(global.keyitem))
    scr_keyitemremove(8);
