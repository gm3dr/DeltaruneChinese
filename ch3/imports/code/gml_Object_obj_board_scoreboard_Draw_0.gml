if (init == 0)
{
    if (i_ex(obj_ch3_gameshow))
        init = 1;
}

if (init == 1)
{
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_set_color(image_blend);
    draw_set_font(fnt_8bit);
    draw_set_halign(fa_right);
    draw_text(x + 94, y + /*8*/6, string(global.flag[1044]));
    draw_set_halign(fa_left);
    draw_text(x + 9, y + /*8*/6, "P");
}

draw_set_color(c_white);
