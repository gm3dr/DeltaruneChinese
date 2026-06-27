if (chapter4_text_alpha > 0)
{
    draw_set_alpha(chapter4_text_alpha);
    draw_set_font(fnt_mainbig);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_text_ext(room_center_x, room_center_y + 60, "CHAPTER 4", 10, 900);
    scr_84_set_draw_font("mainbig");
    draw_set_alpha(1);
}
