if (global.chapter >= 4)
{
    con = -1;
    customcon = 0;
    sans_face = -4;
    sans_face_timer = 0;
	if (global.names >= 2)
	{
		var conbini = scr_marker(940, -50, bg_zhname_building_store);
		conbini.depth = 980000;
	}
    var conbini = scr_marker_animated(960, 43, spr_conbini_windows_open, 0.05);
    conbini.depth = 980000;
    var conbini_sign = scr_marker_animated(1004, 60, spr_conbini_sign_open, 0.05);
    conbini_sign.depth = conbini.depth - 10;
    
    if (global.chapter == 4)
    {
        if (global.plot >= 100 && global.plot < 300)
        {
            with (conbini_sign)
                instance_destroy();
            
            var closed_lights = scr_marker(965, 47, spr_lw_conbini_closed_lights);
            closed_lights.depth = conbini.depth - 10;
            
            with (conbini)
                instance_destroy();
        }
    }
    
    if (global.chapter == 4 && global.plot >= 300)
    {
        with (conbini)
            instance_destroy();
        
        with (conbini_sign)
            instance_destroy();
    }
    
    if (global.chapter == 4)
    {
        susie_hang_timer = 0;
        
        if (global.plot < 95)
        {
            var alphys_npc = instance_create(1875, 96, obj_npc_facing);
            
            with (alphys_npc)
                scr_depth();
        }
        
        if (scr_flag_get(765) > 0)
        {
            var window_marker = scr_marker(1514, 6, spr_town_mid_child_left);
            
            with (window_marker)
                scr_depth();
        }
        
        warrior_construct = global.plot < 100;
        warrior_timer = 0;
        var pizza_marker = scr_marker(265, -25, bg_building_icee_construction);
        pizza_marker.depth = 990000;
        warrior_marker = scr_marker(240, 11, spr_warrior_build_loop);
        
        with (warrior_marker)
            image_speed = 0.25;
        
        warrior_marker.depth = 97990;
        emitter = audio_emitter_create();
        audio_emitter_position(emitter, warrior_marker.x, warrior_marker.y, 0);
        audio_falloff_set_model(audio_falloff_inverse_distance);
        audio_emitter_falloff(emitter, 40, 80, 1.8);
        
        if (global.plot >= 100)
        {
            with (warrior_marker)
                instance_destroy();
            
            if (audio_emitter_exists(emitter))
                audio_emitter_free(emitter);
        }
        
        tarp_marker = scr_marker(270, 4, bg_building_icee_construction_tarp);
        tarp_marker.depth = 98000;
        var sign_npc = instance_create(242, 93, obj_npc_sign);
        
        with (sign_npc)
        {
            sprite_index = spr_npc_burgerpants_sign_point;
            scr_depth();
        }
        
        if (global.plot < 100)
        {
            var burger_marker = instance_create(190, 46, obj_npc_room);
            burger_marker.sprite_index = spr_npc_burgerpants_stand;
            
            with (burger_marker)
                scr_depth();
            
            var sans_npc = instance_create(1095, 82, obj_npc_facing);
            
            with (sans_npc)
                scr_depth();
            
            var sign_readable = instance_create(1008, 80, obj_readable_room1);
            
            if (scr_flag_get(798) == 3)
                scr_flag_set(798, 4);
            
            if (scr_flag_get(798) == 4)
            {
                with (conbini_sign)
                    instance_destroy();
                
                conbini_sign = scr_marker_animated(1003, 60, spr_conbini_sign_clopen, 0.05);
                conbini_sign.depth = conbini.depth - 10;
            }
            
            if (scr_flag_get(798) == 5)
                scr_flag_set(798, 6);
            
            if (scr_flag_get(798) >= 6)
            {
                with (conbini_sign)
                    instance_destroy();
                
                conbini_sign = scr_marker_animated(1003, 53, spr_conbini_sign_sans, 0.05);
                conbini_sign.depth = conbini.depth - 10;
            }
        }
        else
        {
            instance_create(0, 0, obj_town_burgerpants);
            
            if (global.plot >= 300)
            {
                var window_marker = scr_marker(1514, 6, spr_town_mid_child_left);
                
                with (window_marker)
                    scr_depth();
            }
            
            with (obj_doorparent)
            {
                if ((x > 590 && x < 610) || (x > 1080 && x < 1100))
                {
                    var readable = instance_create(x, y, obj_readable_room1);
                    
                    if (readable.x > 1080 && readable.x < 1090)
                        readable.image_xscale = 2;
                    
                    instance_destroy();
                }
            }
        }
        
        with (obj_doorparent)
        {
            if (x < 310)
            {
                var readable = instance_create(x, y, obj_readable_room1);
                readable.image_xscale = 3;
                instance_destroy();
            }
        }
    }
}
