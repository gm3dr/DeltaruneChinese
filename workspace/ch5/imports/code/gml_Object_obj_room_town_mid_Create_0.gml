var icee_sign = scr_marker(274, -5, scr_84_get_sprite("bg_building_icee_sign_ch5"));

with (icee_sign)
    depth = 5083;

if (global.flag[1324] == 0)
{
    layer_set_visible("ASSETS_Morning_Boxes", true);
    layer_destroy("OBJECTS_FESTIVAL");
    layer_destroy("OBJECTS_FESTIVAL_COLLISION");
    layer_destroy("OBJECTS_NIGHT_COLLISION");
    layer_set_visible("ASSETS_Festival_5000", false);
    layer_set_visible("ASSETS_Festival_5100", false);
    layer_set_visible("ASSETS_Festival_990000", false);
    layer_set_visible("ASSETS_Festival_995000", false);
    layer_set_visible("ASSESTS_Festival_Night", false);
    layer_set_visible("DEPTHSORT", false);
    scr_manage_sunstate(1);
}
else if (global.flag[1324] == 1)
{
    depthsorter = instance_create_layer(0, 0, "OBJECTS_FESTIVAL", obj_depthsorter_lw);
    layer_set_visible("ASSETS_Morning_Boxes", false);
    layer_set_visible("ASSESTS_Festival_Night", false);
    layer_destroy("OBJECTS_NIGHT_COLLISION");
}
else if (global.flag[1324] == 2)
{
    depthsorter = instance_create_layer(0, 0, "OBJECTS_FESTIVAL", obj_depthsorter_lw);
    scr_manage_sunstate(2);
    layer_set_visible("ASSETS_Evening_buildings_shadows", true);
    
    with (obj_festival_confetti)
        instance_destroy();
    
    layer_set_visible("ASSETS_Morning_Boxes", false);
    layer_set_visible("ASSESTS_Festival_Night", false);
    layer_set_visible("ASSETS_Evening_Trees_overlay", true);
    layer_set_visible("ASSETS_Evening_Trees_overlay_back", true);
    layer_destroy("OBJECTS_NIGHT_COLLISION");
}
else if (global.flag[1324] == 3)
{
    layer_set_visible("DEPTHSORT", false);
    layer_set_visible("ASSETS_Festival_990000", false);
    layer_set_visible("ASSETS_Festival_5100", false);
    layer_set_visible("ASSESTS_Festival_Night", true);
    layer_destroy("OBJECTS_FESTIVAL_COLLISION");
    layer_destroy("OBJECTS_FESTIVAL");
}

if (global.flag[1324] > 0)
    layer_destroy("OBJECTS_MORNING_COLLISION");

if (global.flag[1324] < 3)
    layer_destroy("INSTANCES_LAMPS");
//
layer_create(993000, "OBJECTS_Buildings_Depth_993000_gm3dr");
var store_marker = scr_marker(940, -50, (global.names >= 2) ? bg_zhname_building_store : bg_building_store);
layer_add_instance("OBJECTS_Buildings_Depth_993000_gm3dr", store_marker);
//
if (scr_sideb_active())
{
    var ferris_event = instance_create(0, 0, obj_town_mid_ferris_w);
    var sans_event = instance_create(0, 0, obj_town_mid_sans_w);
    var teacup_event = instance_create(0, 0, obj_town_mid_teacup);
    var temmie_event = instance_create(0, 0, obj_town_mid_temmie);
    var door_events = instance_create(0, 0, obj_town_mid_doors);
    var conbini = instance_create(0, 0, obj_town_mid_conbini);
    var diner_event = instance_create(0, 0, obj_room_town_mid_diner);
	//
	instance_destroy(store_marker);
	//
}
else if (scr_flag_get(1324) < 2)
{
    var door_events = instance_create(0, 0, obj_town_mid_doors);
    var conbini = instance_create(0, 0, obj_town_mid_conbini);
	//
	instance_destroy(store_marker);
	//
    
    if (scr_flag_get(1324) == 0)
    {
        var ice_wolf = scr_marker(964, 142, spr_npc_icewolf_logs);
        
        with (ice_wolf)
        {
            scr_depth();
            image_speed = 0.1;
            sunshadows_exclude = true;
        }
        
        var ice_wolf_readable = instance_create(920, 140, obj_readable_room1);
        
        with (ice_wolf_readable)
        {
            extflag = "ice_wolf_morning";
            image_xscale = 2;
            image_yscale = 2.5;
        }
        
        var rabbits = instance_create(0, 0, obj_npc_rabbits);
    }
    else if (scr_flag_get(1324) == 1)
    {
        if (!snd_is_playing(global.currentsong[1]))
        {
            global.currentsong[0] = snd_init("festival.ogg");
            global.currentsong[1] = mus_loop(global.currentsong[0]);
            mus_volume(global.currentsong[1], 0, 0);
            mus_volume(global.currentsong[1], 1, 30);
        }
        
        var diner_event = instance_create(0, 0, obj_room_town_mid_diner);
        var ferris_event = instance_create(0, 0, obj_town_mid_ferris);
        var teacup_event = instance_create(0, 0, obj_town_mid_teacup);
        var sans_event = instance_create(0, 0, obj_town_mid_sans);
        var temmie_event = instance_create(0, 0, obj_town_mid_temmie);
        var papyrus_readable = instance_create(1270, 85, obj_readable_room1);
        
        with (papyrus_readable)
        {
            image_xscale = 1.5;
            extflag = "pap_door";
        }
    }
}
else if (scr_flag_get(1324) == 3)
{
    with (obj_festival_confetti)
        instance_destroy();
    
    var town_bg = instance_create(0, 0, obj_ch5_LWF02_bg);
    var town_convo = instance_create(0, 0, obj_ch5_LWF_town_mid);
}
