var icee_sign = scr_marker(274, -5, scr_84_get_sprite("bg_building_icee_sign_ch5"));
with (icee_sign)
{
    depth = 5083;
}
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
    depthsorter = instance_create_layer(0, 0, "OBJECTS_FESTIVAL", 1699);
    layer_set_visible("ASSETS_Morning_Boxes", false);
    layer_set_visible("ASSESTS_Festival_Night", false);
    layer_destroy("OBJECTS_NIGHT_COLLISION");
}
else if (global.flag[1324] == 2)
{
    depthsorter = instance_create_layer(0, 0, "OBJECTS_FESTIVAL", 1699);
    scr_manage_sunstate(2);
    layer_set_visible("ASSETS_Evening_buildings_shadows", true);
    with (944)
    {
        instance_destroy();
    }
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
{
    layer_destroy("OBJECTS_MORNING_COLLISION");
}
if (global.flag[1324] < 3)
{
    layer_destroy("INSTANCES_LAMPS");
}
if (scr_sideb_active())
{
    var ferris_event = instance_create(0, 0, 923);
    var sans_event = instance_create(0, 0, 675);
    var teacup_event = instance_create(0, 0, 867);
    var temmie_event = instance_create(0, 0, 88);
    var door_events = instance_create(0, 0, 1636);
    var conbini = instance_create(0, 0, 31);
    var diner_event = instance_create(0, 0, 1613);
}
else if (scr_flag_get(1324) < 2)
{
    var door_events = instance_create(0, 0, 1636);
    var conbini = instance_create(0, 0, 31);
    if (scr_flag_get(1324) == 0)
    {
        var ice_wolf = scr_marker(964, 142, 3213);
        with (ice_wolf)
        {
            scr_depth();
            image_speed = 0.1;
            sunshadows_exclude = true;
        }
        var ice_wolf_readable = instance_create(920, 140, 1242);
        with (ice_wolf_readable)
        {
            extflag = "ice_wolf_morning";
            image_xscale = 2;
            image_yscale = 2.5;
        }
        var rabbits = instance_create(0, 0, 486);
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
        var diner_event = instance_create(0, 0, 1613);
        var ferris_event = instance_create(0, 0, 1702);
        var teacup_event = instance_create(0, 0, 867);
        var sans_event = instance_create(0, 0, 559);
        var temmie_event = instance_create(0, 0, 88);
        var papyrus_readable = instance_create(1270, 85, 1242);
        with (papyrus_readable)
        {
            image_xscale = 1.5;
            extflag = "pap_door";
        }
    }
}
else if (scr_flag_get(1324) == 3)
{
    with (944)
    {
        instance_destroy();
    }
    var town_bg = instance_create(0, 0, 330);
    var town_convo = instance_create(0, 0, 1163);
}
