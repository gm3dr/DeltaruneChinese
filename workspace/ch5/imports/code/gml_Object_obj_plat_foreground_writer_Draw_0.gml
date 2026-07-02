if (instance_exists(obj_plat_player) && obj_plat_player.targetmode)
{
    var _camerax = camerax();
    var _cameray = cameray();
    remember_text_info();
    alphaer = scr_approach(alphaer, 1, 0.2);
    var ss = side * 380;
    var _myside = side;
    
    if (evade)
    {
        ss = (ss + 380) % 760;
        _myside = (side + 1) % 2;
    }
    
    if (ss > 300 && instance_exists(obj_darkcontroller) && obj_darkcontroller.charcon == 1)
        ss = ss - 43;
    
    var _yoffset = 0;
    
    if (global.lang == "ja")
    {
        if (!draw_flowery_act && (obj_plat_player.hlit_target + 1) == 0)
        {
            var can_act = [scr_plat_can_act("su"), scr_plat_can_act("ra")];
            var total = 0;
            var total_su = 0;
            var total_ra = 0;
            var blocked2 = false;
            var text = "";
            var i = ds_list_size(obj_plat_player.act_targets_list) - 1;
            
            while (i >= 0)
            {
                var elem = ds_list_find_value(obj_plat_player.act_targets_list, i);
                
                if (instance_exists(elem))
                {
                    total++;
                    
                    if (elem.char == "ra")
                        total_ra++;
                    
                    if (elem.char == "su")
                        total_su++;
                    
                    if (elem.blocked == 2)
                        blocked2 = true;
                }
                
                i--;
            }
            
            if (total > 0)
            {
                if (!can_act[0] && total_su > 0)
                {
                    if (total_ra > 0 && can_act[1])
                        _yoffset = -20;
                    else
                        _yoffset = 0;
                }
                
                if (!can_act[1] && total_ra > 0)
                {
                    if (text == "")
                    {
                        if (total_su > 0 && can_act[0])
                            _yoffset = -20;
                        else
                            _yoffset = 0;
                    }
                    else
                    {
                        _yoffset = 0;
                    }
                }
            }
        }
    }
    
    draw_sprite_ext(spr_pxwhite, 0, _camerax + xoffset, _cameray + yoffset + ss + (_yoffset * _myside), camerawidth(), 100 - _yoffset, 0, c_black, 0.6);
    var target;
    
    if (draw_flowery_act)
    {
        draw_set_color(c_aqua);
        draw_set_alpha(image_alpha);
        scr_84_set_draw_font("mainbig");
        var name = stringsetloc("Kris", "obj_plat_foreground_writer_slash_Draw_0_gml_17_0");
        draw_text(_camerax + xoffset + 20, _cameray + yoffset + 10 + ss, name);
        draw_set_color(image_blend);
        // draw_text(_camerax + xoffset + (16 * (string_length(name) + 1)), _cameray + yoffset + 10 + ss, "-->  " + stringsetloc("OMEGA FLATTER", "obj_plat_foreground_writer_slash_Draw_0_gml_20_0"));
        var _cjk_cnt = (string_byte_length(name) - string_length(name)) / 2;
        var _en_cnt = string_length(name) - _cjk_cnt;
        draw_text(_camerax + xoffset + (28 * _cjk_cnt + 16 * (_en_cnt + 1)), _cameray + yoffset + 10 + ss, "-->  " + stringsetloc("OMEGA FLATTER", "obj_plat_foreground_writer_slash_Draw_0_gml_20_0"));
        draw_text(_camerax + xoffset + 20, _cameray + yoffset + 40 + ss, stringsetloc("Disable ACTs.", "obj_plat_foreground_writer_slash_Draw_0_gml_22_0"));
        draw_set_alpha(1);
    }
    else
    {
        target = obj_plat_player.hlit_target + 1;
        
        if (target >= 0)
        {
            if (target == 6 && instance_exists(obj_dw_garden_finalplatforming_right))
                exit;
            
            draw_set_color(cols[target]);
            draw_set_alpha(image_alpha);
            scr_84_set_draw_font("mainbig");
            draw_text(_camerax + xoffset + 20, _cameray + yoffset + 10 + ss + (_yoffset * _myside), targets[target]);
            draw_set_color(image_blend);
            
            if (target >= 1)
            {
                var _len = 0;
                
                // if (global.lang == "ja")
                //     _len = 28 * (string_length(targets[target]) + 1);
                // else
                var _cjk_cnt = (string_byte_length(targets[target]) - string_length(targets[target])) / 2;
                var _en_cnt = string_length(targets[target]) - _cjk_cnt;
                _len = 28 * _cjk_cnt + 16 * (_en_cnt + 1);
                
                draw_text(_camerax + xoffset + _len, _cameray + yoffset + 10 + ss + (_yoffset * side), "-->  " + obj_plat_player.hlit_name);
            }
            
            if (target == 0)
            {
                var can_act = [scr_plat_can_act("su"), scr_plat_can_act("ra")];
                var total = 0;
                var total_su = 0;
                var total_ra = 0;
                var blocked2 = false;
                var text = "";
                var i = ds_list_size(obj_plat_player.act_targets_list) - 1;
                
                while (i >= 0)
                {
                    var elem = ds_list_find_value(obj_plat_player.act_targets_list, i);
                    
                    if (instance_exists(elem))
                    {
                        total++;
                        
                        if (elem.char == "ra")
                            total_ra++;
                        
                        if (elem.char == "su")
                            total_su++;
                        
                        if (elem.blocked == 2)
                            blocked2 = true;
                    }
                    
                    i--;
                }
                
                if (total > 0)
                {
                    if (!can_act[0] && total_su > 0)
                    {
                        if (total_ra > 0 && can_act[1])
                            text = no_target_text_ralsei_only;
                        else
                            text = no_target_text_susie;
                    }
                    
                    if (!can_act[1] && total_ra > 0)
                    {
                        if (text == "")
                        {
                            if (total_su > 0 && can_act[0])
                                text = no_target_text_susie_only;
                            else
                                text = no_target_text_ralsei;
                        }
                        else
                        {
                            text = no_target_text_both;
                        }
                    }
                }
                
                if (text == "")
                    text = no_target_text_has;
                
                if (blocked2)
                    text = blocked_text;
                
                if (instance_exists(obj_plat_finalflowery))
                    text = blocked_text_flowery;
                
                draw_text(_camerax + xoffset + 20, _cameray + yoffset + 40 + ss + (_yoffset * _myside), text);
            }
            else if (target < 1)
            {
                draw_text(_camerax + xoffset + 20, _cameray + yoffset + 40 + ss, no_target_text_hasnt);
            }
            
            draw_set_alpha(1);
        }
    }
    
    if (obj_plat_player.targetindex != last_target)
    {
        if (target >= 1)
        {
            with (writer)
                instance_destroy();
            
            global.msg[0] = stringsetsubloc("* ~1", obj_plat_player.hlit_desc, "obj_plat_foreground_writer_slash_Draw_0_gml_87_0");
            
            if (obj_plat_player.hlit_blocked)
            {
                target = 0;
                global.msg[0] = blocked_text;
            }
            
            global.typer = 36;
            writer = instance_create(_camerax + xoffset + 20, _cameray + yoffset + 40 + ss, obj_writer);
            writer.skippable = false;
            writer.preventcskip = true;
            writer.charline = 40;
            writer.originalcharline = 40;
        }
        else
        {
            with (writer)
                instance_destroy();
        }
    }
    
    last_target = obj_plat_player.targetindex;
}
else
{
    restore_text_info();
    alphaer = scr_approach(alphaer, 0, 0.2);
    
    with (writer)
        instance_destroy();
}
