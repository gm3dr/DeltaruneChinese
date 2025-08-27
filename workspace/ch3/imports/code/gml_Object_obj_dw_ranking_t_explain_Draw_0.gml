var cx = camerax();
var cy = cameray();

if (!is_active)
    exit;

scr_draw_set_mask(true);
ossafe_fill_rectangle(cx + mask_x_pos, cy, cx + view_wport[0], cy + view_hport[0]);
scr_draw_in_mask_begin();
var set = [3235, 2, 1];

// if (global.lang == "ja")
//     set = [3413, 1, 2];
if (global.names >= 2)
    set = [spr_zhname_dw_ranking_t_explain, 2, 1];

draw_sprite_ext(set[0], type, cx + (sprite_get_width(set[0]) / set[2]), cy + (sprite_get_height(set[0]) / set[2]), set[1], set[1], 0, c_white, 1);

if (type == 1)
{
    timer++;
    
    if (i_ex(obj_dw_ranking_t_screens))
    {
        var pitcherror = obj_dw_ranking_t_screens.pitcherror;
        timer += random_range(-pitcherror * 8, pitcherror);
    }
    
    draw_sprite_ext(spr_tenna_t_pose, timer / 4, cx + 320, cy + 124, 1, 0.25, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_tenna_t_pose, (timer / 4) + 2, cx + 390, cy + 200, 0.25, 0.25, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_tenna_t_pose, (timer / 5) - 1, cx + 320, cy + 480, 3, 2, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_tenna_t_pose, timer / 5, cx + 320, cy + 480, 3, 2, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_tenna_t_pose, (timer / 5) + 1, cx + 320, cy + 480, 3, 2, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_tenna_t_pose, (timer / 5) + 2, cx + 320, cy + 480, 3, 2, image_angle, image_blend, image_alpha);
}

scr_draw_in_mask_end();
