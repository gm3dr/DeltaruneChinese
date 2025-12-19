scr_bullet_init();
destroyonhit = 0;
grazepoints = 3;
parentid = -1;
timer = 0;
image_angle = parentid.image_angle;
image_xscale = 0;
visible = true;
depth = obj_heart.depth - 1;

// if (global.lang == "ja")
//     sprite_index = spr_rouxls_biplane_flag_ja;
if (global.names >= 2)
    sprite_index = spr_zhname_rouxls_biplane_flag