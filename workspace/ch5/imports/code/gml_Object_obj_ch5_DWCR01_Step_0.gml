if (!init)
{
    with (scr_genmarker("greendepth"))
    {
        scr_depth();
        other.depth_anchor = depth;
    }
    
    init = 1;
}

if (con == 0)
{
    if (place_meeting(x, y, obj_mainchara))
    {
        show_debug_message_concat("cutscene start");
        alarm[0] = 1;
        global.interact = 1;
    }
}

if (con == 1)
{
    roomcontroller = obj_dw_fcastle_second_diner.id;
    
    with (roomcontroller)
    {
        with (orange_bubble)
            instance_destroy();
    }
    
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    scr_miniface_init_flowers();
    c_mus2("volume", 0, 30);
    cam_region = findspriteinfo(spr_debug_cameraregionpreview, "DEBUG_CAMERAS", c_white);
    cam_region2 = findspriteinfo(spr_debug_cameraregionpreview, "DEBUG_CAMERAS", c_red);
    cam_region3 = findspriteinfo(spr_debug_cameraregionpreview, "DEBUG_CAMERAS", c_lime);
    seth_pos = findspriteinfo(spr_seth_read, "DEBUG_ASSETS");
    seth_pos2 = findspriteinfo(spr_seth_upset, "DEBUG_ASSETS");
    seth_marker = scr_makemarker_fromstruct(seth_pos);
    seth_marker.sprite_index = spr_seth_walk_up;
    green_marker = scr_makemarker_fromstruct(findspriteinfo(spr_enemy_green, "DEBUG_ASSETS"), 2);
    seat_marker = scr_makemarker_fromstruct(findspriteinfo(spr_diner_seat_mid, "DEBUG_ASSETS"), false);
    green_marker.sprite_index = spr_enemy_green_walk_right;
    green_marker.image_speed = 0.25;
    green_marker.x -= 200;
    green_marker.shake = false;
    green_marker.shakeamt = 0;
    green_marker.shadow_alpha = 0;
    green_marker.auto_depth = true;
    green_marker._rx = -4;
    green_marker._ry = -4;
    asgore_marker = scr_makemarker_fromstruct(findspriteinfo(spr_asgore_armor_walk_up, "DEBUG_ASSETS"), true);
    asgore_marker.auto_depth = true;
    
    with (obj_castlereflect_manager)
    {
        add_reflection(other.seth_marker);
        add_reflection(other.asgore_marker);
        add_reflection(other.green_marker);
        add_sprite_offset(2325, 2, 0);
        add_sprite_offset(692, 11, 0);
        add_sprite_offset(8022, -2, 0);
        add_sprite_offset(3147, 1, 0);
        add_sprite_offset(3873, 1, 0);
        add_sprite_offset(scr_84_get_sprite("spr_green_sign"), 7, 0);
    }
    
    green_step = function()
    {
        if (auto_depth)
            scr_depth();
        
        if (!variable_instance_exists(id, "_rx"))
        {
            _rx = -4;
            _ry = -4;
            shake = 0;
            shakeamt = 0;
        }
        
        if (_rx != -4)
        {
            x = _rx;
            _rx = -4;
        }
        
        if (_ry != -4)
        {
            y = _ry;
            _ry = -4;
        }
        
        if (shake)
        {
            shakeamt = min(shakeamt + (1/15), 2);
            _rx = x;
            _ry = y;
            x += random_range(-shakeamt, shakeamt);
            y += random_range(-shakeamt, shakeamt);
        }
    };
    
    green_draw = function()
    {
        if (shake)
        {
            draw_self();
            
            if (shadow_alpha > 0)
                draw_sprite_ext(spr_enemy_green_behind_shadow_right, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, shadow_alpha);
        }
        else
        {
            draw_self();
        }
    };
    
    asgore_marker.step_func = method(asgore_marker.id, green_step);
    green_marker.step_func = method(green_marker.id, green_step);
    green_marker.draw_func = method(green_marker.id, green_draw);
    var _pos_green_x = green_marker.xstart - 40;
    var _pos_green_y = (green_marker.ystart + 70 + 6 + 100) - 20;
    pos_table = findspriteinfo(spr_dw_garden_diner_roundtable, "DEBUG_ASSETS");
    pos_cheese = findspriteinfo(spr_mazecheese, "DEBUG_ASSETS");
    pos_plate = findspriteinfo(spr_green_plate, "DEBUG_ASSETS");
    pos_table.x += sprite_get_width(spr_dw_garden_diner_roundtable);
    pos_cheese.x += sprite_get_width(spr_cheese_smallening);
    pos_plate.x += sprite_get_width(spr_green_plate);
    pos_table.y += sprite_get_height(spr_dw_garden_diner_roundtable);
    pos_cheese.y += sprite_get_height(spr_cheese_smallening);
    pos_plate.y += sprite_get_height(spr_green_plate);
    c_mus2("free");
    c_pannable(true);
    c_pan_fancy(cam_region3.x, cam_region3.y, 30);
    c_customfunc(function()
    {
        with (obj_fusuma_door)
            set_open_state(true);
    });
    c_markerwalkdirect(asgore_marker, asgore_marker.x, -155, abs(asgore_marker.y - -155) / 2, 554, 0.25);
    c_wait(30);
    c_delay_customfunc(40, function()
    {
        with (obj_fusuma_door)
            set_open_state(false);
    });
    c_msgside("bottom");
    c_speaker("seth");
    c_msgsetsubloc(0, "~1* O-Of course^1, Mr. Asgore^1! I~2know you're very busy!/", (global.lang == "ja") ? "\\m1\t\t\t" : "\\m1\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_ch5_DWCR01_slash_Step_0_gml_134_0");
    c_msgnextsubloc("~1* I..^1. I'll pick a more~2interesting story next~2time^1, too!/%", (global.lang == "ja") ? "\\m1\t\t\t" : "\\m1\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_ch5_DWCR01_slash_Step_0_gml_135_0");
    c_talk_wait();
    c_wait_if(asgore_marker, "y", "<", -50);
    c_var_instance(seth_marker, "sprite_index", spr_seth_walk_left);
    c_wait(30);
    c_var_instance(seth_marker, "sprite_index", spr_seth_lookdown_l);
    c_wait(20);
    c_speaker("seth");
    c_msgsetsubloc(0, "~1* He..^1. only wanted to listen~2to a few pages.../", (global.lang == "ja") ? "\\m1\t\t\t" : "\\m1\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_ch5_DWCR01_slash_Step_0_gml_145_0");
    c_msgnextsubloc("~1* Well^1, he has to concentrate~2on his research^1, right!?~2I..^1. I can relate^1! Ha!/", (global.lang == "ja") ? "\\m1\t\t\t" : "\\m1\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_ch5_DWCR01_slash_Step_0_gml_146_0");
    c_msgcmd("var", seth_marker, "sprite_index", 7305);
    c_msgnextsubloc("~1* .../%", (global.lang == "ja") ? "\\m1\t\t\t" : "\\m1\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_ch5_DWCR01_slash_Step_0_gml_148_0");
    c_msgcmd("var", seth_marker, "sprite_index", 2325);
    c_talk_wait();
    c_sel(kr);
    c_setxy(obj_krmarker.x + 200, obj_krmarker.y);
    c_walkdirect_speed(obj_krmarker.x, obj_krmarker.y, 4);
    c_sel(su);
    c_setxy(obj_sumarker.x + 200, obj_sumarker.y);
    c_walkdirect_speed(obj_sumarker.x, obj_sumarker.y, 4);
    c_sel(ra);
    c_setxy(obj_ramarker.x + 200, obj_ramarker.y);
    c_walkdirect_speed(obj_ramarker.x, obj_ramarker.y, 4);
    c_wait(50);
    c_var_instance(seth_marker, "sprite_index", spr_seth_walk_left);
    c_wait(40);
    c_flipinstance(seth_marker, "x");
    c_var_add_instance(seth_marker, "x", -14);
    c_wait(30);
    c_var_instance(seth_marker, "sprite_index", spr_seth_panic);
    c_shaketarget(seth_marker);
    c_msgstay(6);
    c_speaker("seth");
    c_msgsetsubloc(0, "~1* What the book are you guys~2doing here!?/", (global.lang == "ja") ? "\\m1\t\t\t" : "\\m1\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_ch5_DWCR01_slash_Step_0_gml_177_0");
    c_facenext("ralsei", "K");
    c_msgnextloc("\\EK* Ummm^1, adventure..^1. things?/", "obj_ch5_DWCR01_slash_Step_0_gml_179_0");
    c_facenext("seth", 0);
    c_msgnextsubloc("~1* Didn't Orange stop you!?/%", (global.lang == "ja") ? "\\m1\t\t\t" : "\\m1\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_ch5_DWCR01_slash_Step_0_gml_181_0");
    c_msgcmd("var", seth_marker, "sprite_index", 6620);
    c_talk_wait();
    c_msgstay(6);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* Who's Orange?/%", "obj_ch5_DWCR01_slash_Step_0_gml_189_0");
    c_talk_wait();
    c_var_instance(seth_marker, "sprite_index", spr_seth_facepalm_l);
    c_var_add_instance(seth_marker, "x", 6);
    c_msgstay(6);
    c_speaker("seth");
    c_msgsetsubloc(0, "~1* Orange^1, are you hiding behind~2the walls again?/%", (global.lang == "ja") ? "\\m1\t\t\t" : "\\m1\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_ch5_DWCR01_slash_Step_0_gml_197_0");
    c_talk();
    c_var_instance(id, "interjection", 1);
    c_wait_talk();
    c_customfunc(function()
    {
        interjection = -1;
        
        with (roomcontroller)
        {
            with (orange_bubble)
                instance_destroy();
        }
    });
    c_msgstay(6);
    c_speaker("seth");
    c_msgsetsubloc(0, "~1* You are./%", (global.lang == "ja") ? "\\m1\t\t\t" : "\\m1\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_ch5_DWCR01_slash_Step_0_gml_207_0");
    c_talk();
    c_var_instance(id, "interjection", 2);
    c_wait_talk();
    c_customfunc(function()
    {
        interjection = -1;
        
        with (roomcontroller)
        {
            with (orange_bubble)
                instance_destroy();
        }
    });
    c_var_add_instance(seth_marker, "x", -6);
    c_var_instance(seth_marker, "sprite_index", spr_seth_thonk);
    c_speaker("seth");
    c_msgsetsubloc(0, "~1* That's it^1! Orange might have~2been nothing^1, but.../", (global.lang == "ja") ? "\\m1\t\t\t" : "\\m1\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_ch5_DWCR01_slash_Step_0_gml_225_0");
    c_msgnextsubloc("~1* There's another flower.../", (global.lang == "ja") ? "\\m1\t\t\t" : "\\m1\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_ch5_DWCR01_slash_Step_0_gml_226_0");
    c_sel_spritenext(su, 416, 0, 0);
    c_sel_spritenext(ra, 605, 0, 0);
    c_msgnextsubloc("~1* With unbelievable powers!!!/%", (global.lang == "ja") ? "\\m1\t\t\t" : "\\m1\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_ch5_DWCR01_slash_Step_0_gml_229_0");
    c_msgcmd("var", seth_marker, "sprite_index", 6620);
    c_sel_spritenext(ra, 1878, 0, 0);
    c_talk_wait();
    c_var_lerp_to_instance(green_marker, "x", green_marker.xstart, 65);
    c_wait(65);
    c_var_instance(green_marker, "sprite_index", spr_enemy_green_right);
    c_speaker("seth");
    c_msgsetsubloc(0, "~1* Try and survive THIS!/%", (global.lang == "ja") ? "\\m1\t\t\t" : "\\m1\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_ch5_DWCR01_slash_Step_0_gml_242_0");
    c_talk_wait();
    c_var_instance(seth_marker, "sprite_index", spr_seth_walk_right_panicked);
    c_var_instance(seth_marker, "image_speed", 0.3);
    c_var_lerp_to_instance(seth_marker, "x", _pos_green_x - 200, 35);
    c_sel_sprite(su, 582);
    c_sel_sprite(ra, 513);
    c_wait(35);
    c_customfunc(function()
    {
        with (obj_fusuma_door)
        {
            if (other.green_marker.x > bbox_left && other.green_marker.x < bbox_right)
                set_open_state(true);
        }
    });
    c_wait(30);
    c_var_instance(green_marker, "sprite_index", spr_enemy_green_walk_right);
    c_var_lerp_to_instance(green_marker, "y", _pos_green_y, 45);
    c_var_lerp_to_instance(green_marker, "x", _pos_green_x, 45);
    c_wait(45);
    c_customfunc(function()
    {
        with (obj_fusuma_door)
        {
            if (other.green_marker.x > bbox_left && other.green_marker.x < bbox_right)
                set_open_state(false);
        }
    });
    c_var_instance(green_marker, "sprite_index", spr_enemy_green_walk_right);
    c_var_instance(green_marker, "image_index", 0);
    c_var_instance(green_marker, "image_speed", 0);
    c_wait(10);
    c_var_instance(green_marker, "sprite_index", spr_enemy_green_wave_right);
    c_var_instance(green_marker, "image_speed", 0.25);
    c_wait(30);
    c_speaker("ralsei");
    
    if (scr_flag_get(1454) >= 70)
        c_msgsetloc(0, "\\EJ* Oh^1, from the trial...^1! Your name was.../%", "obj_ch5_DWCR01_slash_Step_0_gml_300_0");
    else
        c_msgsetloc(0, "\\EJ* Oh^1, it's you^1! Ummm^1, we never got your name.../%", "obj_ch5_DWCR01_slash_Step_0_gml_304_0");
    
    c_talk_wait();
    c_var_instance(green_marker, "sprite_index", spr_enemy_green_behind_right);
    c_snd_play(snd_noise);
    c_wait(20);
    c_var_instance(green_marker, "sprite_index", scr_84_get_sprite("spr_green_sign"));
    c_snd_play(snd_wing);
    c_wait(20);
    c_sel_sprite(ra, 508);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EH* Green^1! Well^1, it's nice to meet you!/", "obj_ch5_DWCR01_slash_Step_0_gml_326_0");
    c_facenext("susie", "9");
    c_msgnextloc("\\E9* Yeah^1, cool to finally meet up for real./%", "obj_ch5_DWCR01_slash_Step_0_gml_328_0");
    c_sel(su);
    c_spritenext(613);
    c_talk_wait();
    c_var_instance(green_marker, "sprite_index", spr_green_nods);
    c_var_instance(green_marker, "image_speed", 0.25);
    c_wait(24);
    c_var_instance(green_marker, "image_index", 0);
    c_var_instance(green_marker, "image_speed", 0);
    c_sel_sprite(ra, 513);
    c_sel_sprite(su, 582);
    c_speaker("susie");
    c_msgsetloc(0, "\\EE* ..^1. hey^1. You're with Flowery^1, right?/%", "obj_ch5_DWCR01_slash_Step_0_gml_349_0");
    c_talk_wait();
    c_var_instance(green_marker, "sprite_index", spr_green_nods);
    c_var_instance(green_marker, "image_speed", 0.25);
    c_wait(24);
    c_var_instance(green_marker, "image_index", 0);
    c_var_instance(green_marker, "image_speed", 0);
    c_sel_sprite(su, 416);
    c_speaker("susie");
    c_msgsetloc(0, "\\EG* Then^1, wait..^1. aren't you gonna...?/%", "obj_ch5_DWCR01_slash_Step_0_gml_370_0");
    c_talk_wait();
    c_wait(20);
    c_snd_play(snd_noise);
    c_var_instance(green_marker, "sprite_index", spr_enemy_green_behind_right);
    c_wait(20);
    c_var_instance(green_marker, "shake", true);
    sound_rumble = snd_loop(snd_rumble);
    snd_volume(sound_rumble, 0, 0);
    c_customfunc(function()
    {
        snd_volume(sound_rumble, 1, 60);
    });
    c_wait(10);
    c_sel_spriteimage(su, 416, 1);
    c_autowalk(false);
    c_sel_spriteimage(ra, 7197, 1);
    c_var_instance(green_marker, "auto_depth", false);
    c_var_instance(green_marker, "depth", -100);
    c_var_lerp_instance(blackall, "image_alpha", 0, 0.4, 50);
    c_var_lerp_to_instance(green_marker, "shadow_alpha", 1, 50);
    c_wait(70);
    c_customfunc(function()
    {
        audio_stop_sound(sound_rumble);
    });
    c_var_instance(blackall, "image_alpha", 0);
    c_var_instance(green_marker, "auto_depth", true);
    c_var_instance(green_marker, "shadow_alpha", false);
    c_var_instance(green_marker, "shake", false);
    c_var_instance(green_marker, "sprite_index", spr_enemy_green_pan_widerswing);
    c_var_add_instance(green_marker, "x", -12);
    c_var_instance(green_marker, "image_index", 2);
    c_var_instance(green_marker, "image_speed", -0.25);
    c_wait_if(green_marker, "image_index", "<=", 0.49);
    c_sndplay_x(snd_sparkle_gem, 0.6, 2.2);
    c_customfunc(function()
    {
        var _dir = random(360);
        
        repeat (3)
        {
            _dir += 72;
            var _sparkle = instance_create_depth(green_marker.x + 80, green_marker.y, green_marker.depth - 50, obj_sparkle_fake_particle);
            
            with (_sparkle)
            {
                direction = _dir;
                speed = 0.2 + random(0.5);
                image_speed = 0.15;
                image_xscale = 2;
                image_yscale = 2;
                gravity = -0.02;
                x += lengthdir_x(15, direction);
                y += lengthdir_y(15, direction);
            }
        }
    });
    c_var_instance(green_marker, "image_speed", 0);
    c_wait(30);
    c_var_instance(green_marker, "sprite_index", spr_enemy_green_witharmandpan_right);
    c_var_add_instance(green_marker, "x", 12);
    c_var_instance(green_marker, "image_index", 0);
    table_marker = scr_marker_centered(_pos_green_x + 108, _pos_green_y + 34, 4690, 1, 1, undefined, undefined, undefined, depth_anchor + 150);
    plate_marker = scr_marker_centered(_pos_green_x + 108, _pos_green_y + 40, 3505, 2, 2, undefined, undefined, undefined, depth_anchor + 140);
    cheese_marker = scr_marker_centered(_pos_green_x + 108, _pos_green_y + 34, 7713, 2, 2, undefined, undefined, undefined, depth_anchor);
    table_marker.flipfinish = -1;
    plate_marker.flipfinish = -1;
    cheese_marker.flipfinish = -1;
    table_marker.targety = pos_table.y;
    plate_marker.targety = pos_plate.y;
    cheese_marker.targety = pos_cheese.y;
    
    flip_func = function()
    {
        if (visible)
        {
            image_alpha++;
            
            if ((y + vspeed) > ystart && flipfinish < 2 && flipfinish >= 0)
            {
                flipfinish = 1;
                image_angle = 0;
                hspeed = 0;
                gravity = 0;
            }
            
            if ((y + vspeed) >= targety && flipfinish == 1)
            {
                flipfinish = 2;
                image_xscale = 2.4;
                image_yscale = 1.8;
                speed = 0;
                y = targety;
                
                if (sprite_index == spr_dw_garden_diner_roundtable)
                {
                    var ref = instance_create(x - 32, y - 46, obj_reflection);
                    
                    with (ref)
                    {
                        sprite_index = spr_dw_garden_diner_roundtable_reflection;
                        scr_darksize();
                    }
                }
            }
            
            if (flipfinish == 0)
            {
                image_angle += 12;
                
                if (sprite_index == spr_dw_garden_diner_roundtable)
                {
                    image_xscale = min(image_xscale + 0.1, 2);
                    image_yscale = image_xscale;
                }
            }
            
            if (flipfinish > 0)
            {
                image_xscale = max(image_xscale - 0.07, 2);
                image_yscale = min(image_yscale + 0.07, 2);
            }
        }
    };
    
    table_marker.step_func = method(table_marker, flip_func);
    plate_marker.step_func = method(plate_marker, flip_func);
    cheese_marker.step_func = method(cheese_marker, flip_func);
    table_marker.visible = false;
    plate_marker.visible = false;
    cheese_marker.visible = false;
    var _height = 160;
    var _time = 30;
    var _grav = (8 * _height) / sqr(_time);
    var _vspd = -sqrt(2 * _height * _grav);
    show_debug_message_concat(_grav, " / ", _vspd);
    c_snd_play(snd_item);
    c_var_instance(table_marker, "visible", true);
    c_wait(15);
    c_snd_play(snd_wing);
    c_var_instance(green_marker, "image_index", 1);
    c_var_instance(table_marker, "flipfinish", 0);
    c_var_instance(table_marker, "vspeed", _vspd);
    c_var_instance(table_marker, "hspeed", (pos_table.x - (_pos_green_x + 108)) / _time);
    c_var_instance(table_marker, "gravity", _grav);
    c_wait(5);
    c_var_instance(green_marker, "image_index", 0);
    c_var_instance(plate_marker, "visible", true);
    c_snd_play(snd_item);
    c_wait(15);
    c_snd_play(snd_wing);
    c_var_instance(green_marker, "image_index", 1);
    c_var_instance(plate_marker, "vspeed", _vspd);
    c_var_instance(plate_marker, "flipfinish", 0);
    c_var_instance(plate_marker, "hspeed", (pos_plate.x - (_pos_green_x + 108)) / _time);
    c_var_instance(plate_marker, "gravity", _grav);
    c_wait(5);
    c_var_instance(green_marker, "image_index", 0);
    c_var_instance(cheese_marker, "visible", true);
    c_snd_play(snd_item);
    c_wait(15);
    c_snd_play(snd_wing);
    c_var_instance(green_marker, "image_index", 1);
    c_var_instance(cheese_marker, "vspeed", _vspd);
    c_var_instance(cheese_marker, "flipfinish", 0);
    c_var_instance(cheese_marker, "hspeed", (pos_cheese.x - (_pos_green_x + 108)) / _time);
    c_var_instance(cheese_marker, "gravity", _grav);
    c_wait(60);
    c_var_instance(green_marker, "sprite_index", spr_green_gesture);
    c_var_instance(green_marker, "image_index", 0);
    c_wait(6);
    c_var_instance(green_marker, "image_index", 1);
    c_sel_sprite(su, 631);
    c_imageindex(0);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* No way!!/%", "obj_ch5_DWCR01_slash_Step_0_gml_583_0");
    c_talk_wait();
    c_mus2("initloop", "thrashmachine.ogg", 0);
    c_mus2("volume", 1, 0);
    c_pan_fancy(cam_region3.x, 0, 20);
    c_sel(kr);
    c_walkdirect_speed(pos_table.x + 30, pos_table.y - 56, 6);
    c_sel(ra);
    c_walkdirect_speed(pos_table.x - 72, pos_table.y - 68, 6);
    c_sel(su);
    c_autowalk(true);
    c_walkdirect_speed(pos_table.x - 26, pos_table.y - 100, 6);
    c_wait(4);
    c_wait_if(su_actor, "fake_speed", "=", 0);
    c_sel_facing(su, "d");
    c_wait_if(ra_actor, "fake_speed", "=", 0);
    c_sel_facing(ra, "r");
    c_sel_spriteimage(ra, 7504, 0, 0.25);
    c_autowalk(false);
    c_autodepth(false);
    c_depth(depth_anchor);
    c_sel_spriteimage(su, 5595, 0, 0.25);
    c_autowalk(false);
    c_var_instance(green_marker, "sprite_index", spr_green_pleased);
    
    cheese_func = function()
    {
        if (i_ex(ra_actor) && ra_actor.sprite_index == spr_ralsei_eat_cheese)
        {
            if (ra_actor.image_index > 2)
            {
                if (shakereset)
                {
                    shakereset = false;
                    scr_shakeobj(id, 4, 1);
                    
                    repeat (3)
                    {
                        var _particle = scr_dark_marker(x + random_range(-6, 6), y + random_range(-6, 6), spr_cheese_particle);
                        scr_doom(_particle.id, 20);
                        _particle.gravity = 1;
                        _particle.vspeed = -8;
                        _particle.hspeed = random_range(-3, 3);
                    }
                    
                    if (cheeseprogging)
                    {
                        cheeseprog++;
                        
                        if (cheeseprog == 2)
                        {
                            cheeseprog = 0;
                            image_index++;
                        }
                    }
                }
            }
            else
            {
                shakereset = true;
            }
        }
    };
    
    susie_forearm = scr_dark_marker_fancy(su_actor.x, su_actor.y, spr_susie_eat_cheese_front);
    susie_forearm.susie = su_actor.id;
    susie_forearm.depth = cheese_marker.depth + 2;
    
    susie_armfunc = function()
    {
        if (i_ex(susie))
        {
            visible = susie.sprite_index == spr_susie_eat_cheese;
            image_index = susie.image_index;
            x = susie.x;
            y = susie.y;
        }
        else
        {
            instance_destroy();
        }
    };
    
    susie_forearm.step_func = method(susie_forearm.id, susie_armfunc);
    c_customfunc(function()
    {
        cheese_marker.shakereset = true;
        cheese_marker.ra_actor = ra_actor;
        cheese_marker.cheeseprogging = true;
        cheese_marker.cheeseprog = 0;
        cheese_marker.step_func = method(cheese_marker.id, cheese_func);
    });
    c_wait_if(cheese_marker, "image_index", "=", 1);
    c_var_instance(cheese_marker, "cheeseprogging", false);
    c_speaker("susie");
    c_msgsetloc(0, "\\Ep* Hey^1, this cheese rules!!/", "obj_ch5_DWCR01_slash_Step_0_gml_675_0");
    c_facenext("ralsei", "H");
    c_msgnextloc("\\EH* Y-yum^1! I've..^1. never tasted anything so delicious!!/%", "obj_ch5_DWCR01_slash_Step_0_gml_677_0");
    c_talk_wait();
    c_var_instance(cheese_marker, "cheeseprogging", true);
    c_wait_if(cheese_marker, "image_index", "=", 2);
    c_var_instance(cheese_marker, "cheeseprogging", false);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E2* You're the best boss encounter ever^1, Green!/", "obj_ch5_DWCR01_slash_Step_0_gml_683_0");
    c_facenext("susie", "9");
    c_msgnextloc("\\E9* Yeah^1, you're our best enemy^1, Green!/%", "obj_ch5_DWCR01_slash_Step_0_gml_685_0");
    c_talk_wait();
    c_var_instance(cheese_marker, "cheeseprogging", true);
    c_wait_if(cheese_marker, "image_index", "=", 3);
    c_var_instance(cheese_marker, "cheeseprogging", false);
    c_wait_if(ra_actor, "image_index", "<", 1);
    c_sel(ra);
    c_imagespeed(0);
    c_imageindex(0);
    c_sel(su);
    c_imagespeed(0);
    c_imageindex(0);
    c_wait(10);
    c_sel(ra);
    c_autodepth(true);
    c_facing("l");
    c_sel(su);
    c_autodepth(true);
    c_autowalk(true);
    c_walkdirect(_pos_green_x + 94, _pos_green_y + 4, 15);
    c_wait(15);
    c_facing("l");
    c_wait(5);
    c_visible(false);
    c_var_instance(green_marker, "sprite_index", spr_green_susie_fistbump);
    c_var_instance(green_marker, "image_index", 0);
    c_var_instance(green_marker, "auto_depth", false);
    c_var_instance(green_marker, "depth", 97500);
    c_wait(4);
    c_var_instance(green_marker, "image_index", 1);
    c_snd_play(snd_whip_crack_only);
    c_wait(6);
    c_var_instance(green_marker, "image_index", 0);
    c_wait(4);
    c_var_instance(green_marker, "sprite_index", spr_green_nods);
    c_visible(true);
    c_walkdirect(_pos_green_x + 124, _pos_green_y - 12, 10);
    c_delaywalkdirect(10, pos_table.x + 30, _pos_green_y - 12, 30);
    c_delaywalkdirect(40, pos_table.x + 30 + 40, pos_table.y - 72, 10);
    c_delayfacing(50, "l");
    c_sel(ra);
    c_autowalk(true);
    c_walkdirect(_pos_green_x + 50, _pos_green_y + 12, 30);
    c_wait(31);
    c_facing("l");
    c_wait(5);
    c_visible(false);
    c_var_instance(green_marker, "sprite_index", spr_green_ralsei_hug);
    c_var_instance(green_marker, "image_speed", 0.25);
    c_wait_if(green_marker, "image_index", ">=", 1);
    c_snd_play(snd_noise);
    c_wait_if(green_marker, "image_index", ">=", 2);
    c_var_instance(green_marker, "image_speed", 0);
    c_wait(15);
    c_var_instance(green_marker, "sprite_index", spr_green_nods);
    c_facing("r");
    c_visible(true);
    c_walkdirect(_pos_green_x + 94, _pos_green_y - 12, 10);
    c_delaywalkdirect(10, pos_table.x + 30 + 50, _pos_green_y - 12, 40);
    c_delaywalkdirect(50, pos_table.x + 30 + 100, pos_table.y - 66, 15);
    c_delayfacing(65, "l");
    c_wait(65);
    c_autodepth(true);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EH* Thank you so much^1! That was lovely!/", "obj_ch5_DWCR01_slash_Step_0_gml_763_0");
    c_facenext("susie", "7");
    c_msgnextloc("\\E7* Yeah^1, thanks!/%", "obj_ch5_DWCR01_slash_Step_0_gml_765_0");
    c_talk_wait();
    c_var_instance(green_marker, "sprite_index", spr_enemy_green_wave_right);
    c_var_instance(green_marker, "image_speed", 0.25);
    c_sel_spriteimage(ra, 7919, 0, 0.25);
    c_autowalk(false);
    c_sel_spriteimage(su, 8208, 0, 0.25);
    c_autodepth(false);
    c_depth(96800);
    c_autowalk(false);
    c_speaker("susie");
    c_msgsetloc(0, "\\E9* Bye^1, Green!/%", "obj_ch5_DWCR01_slash_Step_0_gml_785_0");
    c_talk_wait();
    c_var_instance(green_marker, "auto_depth", true);
    c_var_instance(green_marker, "sprite_index", spr_enemy_green_walk_right);
    c_var_lerp_to_instance(green_marker, "y", green_marker.ystart, 30);
    c_var_lerp_to_instance(green_marker, "x", green_marker.xstart, 30);
    c_mus2("volume", 0, 30);
    c_customfunc(function()
    {
        seth_marker.image_xscale = 2;
        seth_marker.x = seth_pos2.x;
        seth_marker.y = seth_pos2.y;
        seth_marker.sprite_index = spr_seth_facepalm_down;
        seth_marker.image_speed = 0;
        seth_marker.image_index = 0;
        
        with (obj_fusuma_door)
        {
            if (other.green_marker.x > bbox_left && other.green_marker.x < bbox_right)
                set_open_state(true);
        }
    });
    c_wait(30);
    c_mus2("free");
    c_customfunc(function()
    {
        with (obj_fusuma_door)
        {
            if (other.green_marker.x > bbox_left && other.green_marker.x < bbox_right)
                set_open_state(false);
        }
    });
    c_var_instance(green_marker, "sprite_index", spr_enemy_green_walk);
    c_var_lerp_to_instance(green_marker, "x", -100, 60);
    c_var_lerp_to_instance(green_marker, "image_alpha", 0, 30);
    c_pan_fancy(cam_region2.x, cam_region2.y, 30);
    c_sel_facing(su, "l");
    c_autowalk(true);
    c_imageindex(0);
    c_sel_facing(ra, "l");
    c_autowalk(true);
    c_imageindex(0);
    c_wait(40);
    c_speaker("seth");
    c_msgsetsubloc(0, "~1* Why do I have to do~2everything myself...?/%", (global.lang == "ja") ? "\\m1\t\t\t" : "\\m1\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_ch5_DWCR01_slash_Step_0_gml_841_0");
    c_talk_wait();
    c_var_instance(id, "fadeinshortcut", true);
    c_wait(10);
    c_sndplay(snd_locker);
    c_customfunc(function()
    {
        with (seth_marker)
        {
            image_index = 1;
            scr_jump_in_place(5, 10);
        }
    });
    c_wait(40);
    c_var_instance(seth_marker, "sprite_index", spr_seth_upset);
    c_speaker("seth");
    c_msgsetsubloc(0, "~1* AND DID YOU REALLY HAVE TO~2MAKE THEM A SHORTCUT BACK~2TO THE CAFE!?/%", (global.lang == "ja") ? "\\m1\t\t\t" : "\\m1\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_ch5_DWCR01_slash_Step_0_gml_857_0");
    c_talk_wait();
    c_var_instance(seth_marker, "sprite_index", spr_seth_walk_right_panicked);
    c_var_instance(seth_marker, "image_speed", 0.4);
    c_var_lerp_to_instance(seth_marker, "x", green_marker.xstart, 20);
    c_wait(20);
    var _walkuptime = 25;
    c_var_instance(seth_marker, "sprite_index", spr_seth_walk_up);
    c_var_lerp_to_instance(seth_marker, "y", green_marker.ystart, _walkuptime);
    c_wait(15);
    c_customfunc(function()
    {
        with (obj_fusuma_door)
            set_open_state(true);
    });
    c_wait(10);
    c_var_instance(seth_marker, "depth", obj_fusuma_door.depth + 100);
    c_customfunc(function()
    {
        with (obj_fusuma_door)
            set_open_state(false);
    });
    c_customfunc(function()
    {
        scr_pan_lerp((kr_actor.x - 320) + 19, 0, 30);
        obj_mainchara.depth = 96900;
    });
    c_wait(30);
    c_var_instance(green_marker, "visible", false);
    c_var_instance(seth_marker, "visible", false);
    c_pannable(false);
    c_mus2("free");
    c_mus2("initloop", "flower_castle.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 30);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
    con = 2;
}

if (con == 2 && !i_ex(obj_cutscene_master))
{
    with (obj_orange_puppet)
        instance_destroy();
    
    show_debug_message_concat("cutscene ended");
    global.interact = 0;
    global.facing = 0;
    global.flag[1813] = 1;
    
    if (plot_check_on)
        scr_flag_set(plot_flag, plot_post);
    
    con = 999;
    
    with (table_marker)
        depth += 160;
    
    with (plate_marker)
        depth += 160;
    
    with (instance_create(table_marker.x, table_marker.y + 28, obj_solidblocksized))
    {
        image_xscale = 1.5;
        image_yscale = 0.5;
        x -= (0.5 * sprite_width);
        y -= (sprite_height + 2);
    }
    
    scr_tempsave();
}

if (interjection > 0)
{
    if (interjection == 1)
    {
        var desiredpos = string_length(stringsetloc("", "obj_ch5_DWCR01_slash_Step_0_gml_197_0"));
        
        if (global.lang == "ja")
            desiredpos = 35;
        
        if (i_ex(obj_writer) && obj_writer.msgno == 0 && obj_writer.pos > desiredpos)
        {
            roomcontroller.orange_interject(stringsetloc("NO!", "obj_ch5_DWCR01_slash_Step_0_gml_933_0"), 0);
            show_debug_message_concat("bubble 1");
            interjection = -1;
            
            with (obj_talkbubble)
            {
                x = 776;
                y = 436;
                depth = -100;
                tx = 842;
                ty = 462;
            }
        }
    }
    
    if (interjection == 2)
    {
        var desiredpos = string_length(stringsetloc("", "obj_ch5_DWCR01_slash_Step_0_gml_207_0"));
        
        if (global.lang == "ja")
            desiredpos = 15;
        
        if (i_ex(obj_writer) && obj_writer.msgno == 0 && obj_writer.pos > desiredpos)
        {
            roomcontroller.orange_interject(stringsetloc("YEAH, 'cause YOU'RE gonna#MAKE FUN OF ME!", "obj_ch5_DWCR01_slash_Step_0_gml_945_0"), 100);
            interjection = -1;
            
            with (obj_talkbubble)
            {
                depth = -100;
                y += 20;
                tx = 842;
                ty = 462;
            }
        }
    }
}

if (fadeinshortcut)
{
    show_debug_message_concat("fading in the shortcut");
    var _ly = layer_get_y(shortcutlayer);
    
    if (_ly > 0)
    {
        layer_y(shortcutlayer, _ly - 12);
    }
    else
    {
        layer_y(shortcutlayer, 0);
        fadeinshortcut = false;
    }
    
    if (shortcutalpha.image_alpha > 0)
        shortcutalpha.image_alpha -= 0.1;
}
