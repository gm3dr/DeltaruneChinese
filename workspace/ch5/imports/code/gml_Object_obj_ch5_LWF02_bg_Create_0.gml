layer_name = ["BACKGROUND"];

if (room == room_town_north)
    layer_name = ["ASSETS_Buildings_2", "TILES_Trees_4", "ASSETS_Festival_5300", "ASSETS_Festival_950000", "ASSETS_Buildings_1", "ASSETS_Trees", "TILES_Trees_1", "TILES_Trees_2", "TILES_Trees_3", "TILES_Ground_1", "TILES_Ground_2", "TILES_Ground_3", "TILES_Ground_4", "ASSETS_Ground", "DEPTHSORT", "ASSETS_Festival_Night"];
else if (room == room_town_mid)
    layer_name = ["ASSETS_Festival_5000", "TILES_Depth_5000", "ASSETS_Buildings_Depth_5000", "ASSETS_Festival_5100", "DEPTHSORT", "ASSETS_Festival_990000", "TILES_Depth_990000", "TILES_Depth_993000", "ASSETS_Buildings_Depth_994000", "ASSETS_Depth_995200", "TILES_Depth_995250", "TILES_Depth_995500", "TILES_Depth_995000", "TILES_Depth_996000", "ASSETS_Depth_998000", "TILES_Depth_1000000", "ASSESTS_Festival_Night"/**/, "OBJECTS_Buildings_Depth_993000_gm3dr"/**/];
else if (room == room_town_south)
    layer_name = ["TILES_Depth_5000", "ASSETS_Festival_5100", "DEPTHSORT", "ASSETS_Festival_980000", "ASSETS_Depth_980000", "ASSETS_Festival_990000", "ASSETS_Buildings_Depth_982000", "ASSETS_Depth_985000", "TILES_Depth_990000", "TILES_Depth_992000", "TILES_Depth_994000", "ASSETS_Festival_995000", "TILES_Depth_995000", "TILES_Depth_996000", "TILES_Depth_997500", "TILES_Depth_1000000", "ASSETS_Festival_Night"];
else if (room == room_town_school)
    layer_name = ["TILES_Depth_5000", "TILES_Depth_950000", "ASSETS_Depth_955000", "TILES_Depth_990000", "ASSETS_Depth_995000", "ASSETS_Depth_996000", "TILES_Depth_1000000", "ASSETS_Festival_Night"];
else if (room == room_schoollobby)
    layer_name = ["BACKGROUND_ASSETS"];
else if (room == room_schooldoor)
    layer_name = ["Compatibility_Tiles_Depth_1000000", "Compatibility_Tiles_Depth_995000"];

plot_begin = 0;
plot_end = 300;
overlay = scr_marker(-10, -10, spr_whitepx_10);
overlay.image_xscale = (room_width / 10) + 2;
overlay.image_yscale = (room_height / 10) + 2;
overlay.image_blend = merge_color(c_black, c_navy, 0.5);
overlay.image_alpha = 0.6;
overlay.depth = 990;
palette_sprite = 8;
palette_index = 1;
pal_swap_layer_init();

for (var i = 0; i < array_length(layer_name); i++)
{
    pal_swap_enable_layer(layer_name[i]);
    pal_swap_set_layer(palette_sprite, palette_index, layer_name[i], false);
}

pal_swap_reset();
