draw_set_alpha(darkness);
d_rectangle_color(camerax(), cameray(), camerax() + camerawidth(), cameray() + cameraheight(), 0, 0, 0, 0, false);
var _ja;

if (global.lang == "ja")
    _ja = true;
else
    _ja = false;

if (current_perp != -1 && (can_control || flowery_mode))
{
    gpu_set_blendmode(bm_add);
    
    with (current_perp)
        draw_sprite_ext(spr_trial_spotlight, 0, xstart, ystart + other.spotlight_offset, 2, 2.5, 0, c_white, 0.75);
    
    gpu_set_blendmode(bm_normal);
    draw_set_alpha(1);
    
    with (current_perp)
    {
        draw_self();
        
        if (!other.evidence_mode && other.can_control)
        {
            draw_set_font(scr_84_get_font("main"));
            draw_set_color(c_white);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_sprite_ext(spr_heart_centered, 0, xstart, ystart + 40, 1, 1, 0, c_white, 1);
            draw_sprite_ext(spr_sneo_bullet_arrow, 0, xstart + 20 + (sin(global.time * 0.1) * 3), ystart + 39, 1, 1, 0, c_white, 1);
            draw_sprite_ext(spr_sneo_bullet_arrow, 0, xstart - 20 - (sin(global.time * 0.1) * 3), ystart + 39, -1, 1, 0, c_white, 1);
            
            if (global.is_console || obj_gamecontroller.gamepad_active)
            {
                draw_sprite_ext(scr_getbuttonsprite(global.input_g[4]), 0, (xstart - 72) + (20 * _ja), (ystart - 12) + 64, 2, 2, 0, c_white, 1);
                draw_text_transformed(xstart - (20 * _ja), ystart + 64, string_replace(string(stringsetloc("{0} to accuse.", "obj_yellow_trial_manager_slash_Draw_0_gml_33_0"), scr_get_input_name(4)), "\\*Z", "    "), 2, 2, 0);
            }
            else
            {
                draw_text_transformed(xstart, ystart + 64, string(stringsetloc("{0} to accuse.", "obj_yellow_trial_manager_slash_Draw_0_gml_33_0"), scr_get_input_name(4)), 2, 2, 0);
            }
        }
    }
}

if (!can_control)
{
    with (obj_trial_perp)
    {
        if (visible)
        {
            if (perp_index != UnknownEnum.Value_4)
                draw_self();
        }
    }
    
    with (obj_trial_perp)
    {
        if (perp_index == UnknownEnum.Value_4)
        {
            draw_self();
            
            if (flash > 0)
            {
                d3d_set_fog(true, c_white, 0, 1);
                draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, flash);
                d3d_set_fog(false, c_white, 0, 1);
            }
        }
    }
}

if (evidence_mode)
{
    draw_set_alpha(0.75);
    
    if (global.encounterno == 222)
        d_rectangle_color(camerax() + 180, cameray(), camerax() + 600, cameray() + 320, 0, 0, 0, 0, false);
    else
        d_rectangle_color(camerax(), cameray(), camerax() + 640, cameray() + 324, 0, 0, 0, 0, false);
    
    draw_set_alpha(1);
    var listsize = ds_list_size(evidence_list);
    var cam_mid = camerax() + (camerawidth() * 0.5) + 60;
    var cam_height = cameray() + 220;
    
    for (var a = 0; a < listsize; a++)
    {
        var diff = a - smooth_counter;
        var offset = (diff == 0) ? -12 : 0;
        
        if (diff < -2)
        {
            draw_sprite_ext(spr_ui_arrow_left, 0, cam_mid - 220 - (sin(global.time * 0.1) * 2), cam_height, 2, 2, 0, #6E6EDD, 1);
        }
        else if (diff > 2)
        {
            draw_sprite_ext(spr_ui_arrow_right, 0, cam_mid + 220 + (sin(global.time * 0.1) * 2), cam_height, 2, 2, 0, #6E6EDD, 1);
        }
        else
        {
            draw_sprite_ext(spr_yellow_evidence, 0, cam_mid + (85 * diff), cam_height + (sin((global.time * 0.1) + a) * 2) + offset, (diff == 0) ? 2 : 1.5, (diff == 0) ? 2 : 1.5, 45, (diff == 0) ? #D6FEFE : c_gray, 1);
            draw_sprite_ext(spr_yellow_evidence, array_get(ds_list_find_value(evidence_list, a), 3), cam_mid + (85 * diff), cam_height + (sin((global.time * 0.1) + a) * 2) + offset, 2, 2, 0, c_white, 1);
        }
    }
    
    draw_set_font(scr_84_get_font("main"));
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_sprite_ext(spr_heart_centered, 0, camerax() + (camerawidth() * 0.5) + 60, cameray() + 280, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_sneo_bullet_arrow, 0, camerax() + (camerawidth() * 0.5) + 60 + 20 + (sin(global.time * 0.1) * 3), cameray() + 280, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_sneo_bullet_arrow, 0, (camerax() + (camerawidth() * 0.5) + 60) - 20 - (sin(global.time * 0.1) * 3), cameray() + 280, -1, 1, 0, c_white, 1);
    var trial_choice_1 = stringsetsubloc("~1 Choose", scr_get_input_name(4), "obj_yellow_trial_manager_slash_Draw_0_gml_107_0");
    var trial_choice_2 = stringsetsubloc("~1 Reconsider", scr_get_input_name(5), "obj_yellow_trial_manager_slash_Draw_0_gml_108_0");
    var trial_choice_3;
    
    if (can_cancel)
        trial_choice_3 = trial_choice_1 + " " + trial_choice_2;
    else
        trial_choice_3 = trial_choice_1;
    
    if (global.is_console || obj_gamecontroller.gamepad_active)
    {
        if (can_cancel)
        {
            var _x = camerax() + (camerawidth() * 0.5) + 60;
            var _y = cameray() + 68 + 236;
            draw_sprite_ext(scr_getbuttonsprite(global.input_g[4]), 0, _x - 146, _y - 12, 2, 2, 0, c_white, 1);
            draw_sprite_ext(scr_getbuttonsprite(global.input_g[5]), 0, _x - 14, _y - 12, 2, 2, 0, c_white, 1);
            
            if (_ja)
                draw_text_transformed(_x - (4 * _ja), _y, string_replace(string_replace(trial_choice_3, "\\*Z", ""), "\\*X", "   "), 2, 2, 0);
            else
                draw_text_transformed(_x, _y, string_replace(string_replace(trial_choice_3, "\\*Z", "    "), "\\*X", "    "), 2, 2, 0);
        }
        else
        {
            var _x = camerax() + (camerawidth() * 0.5) + 60;
            var _y = cameray() + 68 + 236;
            draw_sprite_ext(scr_getbuttonsprite(global.input_g[4]), 0, (_x - 56) + (16 * _ja), _y - 12, 2, 2, 0, c_white, 1);
            draw_text_transformed(_x - (24 * _ja), _y, string_replace(trial_choice_3, "\\*Z", "    "), 2, 2, 0);
        }
    }
    else
    {
        draw_text_transformed(camerax() + (camerawidth() * 0.5) + 60, cameray() + 68 + 236, trial_choice_3, 2, 2, 0);
    }
}

draw_set_alpha(1);

if (can_control)
{
    draw_set_font(scr_84_get_font("main"));
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    with (obj_yellow_enemy)
    {
        if (!other.evidence_mode)
            draw_text_transformed(camerax() + 30, cameray() + 376, string_hash_to_newline(case_info[trial_counter]), 2, 2, 0);
        else
            draw_text_transformed(camerax() + 30, cameray() + 376, string_hash_to_newline(array_get(ds_list_find_value(other.evidence_list, other.evidence_counter), 1)), 2, 2, 0);
        
        draw_set_color(#9A7ED3);
        
        for (var a = 0; a < 9; a++)
        {
            if ((a % 2) == 0)
                d_line_width(camerax() + 380, cameray() + 376 + (a * 10), camerax() + 380, cameray() + 376 + (a * 10) + 10, 4);
        }
        
        if (other.evidence_choice)
            draw_text_transformed(camerax() + 400, cameray() + 376, string_hash_to_newline(other.evidence_caption + array_get(ds_list_find_value(other.evidence_list, other.evidence_counter), 0)), 2, 2, 0);
        
        if (other.evidence_choice)
        {
            draw_sprite_ext(spr_yellow_evidence, 0, camerax() + 600, cameray() + 440, 2, 2, 0, c_white, 1);
            draw_sprite_ext(spr_yellow_evidence, array_get(ds_list_find_value(other.evidence_list, other.evidence_counter), 3), camerax() + 600, cameray() + 440, 2, 2, 0, c_white, 1);
        }
    }
    
    with (obj_flowery_enemy)
    {
        if (!other.evidence_mode)
        {
        }
        else
        {
            draw_text_transformed(camerax() + 30, cameray() + 376, string_hash_to_newline(array_get(ds_list_find_value(other.evidence_list, other.evidence_counter), 1)), 2, 2, 0);
        }
        
        draw_set_color(#9A7ED3);
        
        for (var a = 0; a < 9; a++)
        {
            if ((a % 2) == 0)
                d_line_width(camerax() + 380, cameray() + 376 + (a * 10), camerax() + 380, cameray() + 376 + (a * 10) + 10, 4);
        }
        
        if (other.evidence_choice)
            draw_text_transformed(camerax() + 400, cameray() + 376, string_hash_to_newline(other.evidence_caption + array_get(ds_list_find_value(other.evidence_list, other.evidence_counter), 0)), 2, 2, 0);
        else
            draw_text_transformed(camerax() + 400, cameray() + 376, string_hash_to_newline(other.evidence_caption + other.no_evidence), 2, 2, 0);
        
        draw_sprite_ext(spr_yellow_evidence, 0, camerax() + 600, cameray() + 440, 2, 2, 0, c_white, 1);
        
        if (other.evidence_choice)
            draw_sprite_ext(spr_yellow_evidence, array_get(ds_list_find_value(other.evidence_list, other.evidence_counter), 3), camerax() + 600, cameray() + 440, 2, 2, 0, c_white, 1);
    }
}

enum UnknownEnum
{
    Value_4 = 4
}
