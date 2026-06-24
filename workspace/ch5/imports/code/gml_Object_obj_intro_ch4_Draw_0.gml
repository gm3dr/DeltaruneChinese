if (chapter4_text_alpha > 0)
{
    draw_set_alpha(chapter4_text_alpha);
    draw_set_font(5);
    draw_set_color(16777215);
    draw_set_halign(1);
    draw_set_valign(0);
    draw_text_ext(room_center_x, room_center_y + 60, "第4章", 10, 900);
    scr_84_set_draw_font("mainbig");
    draw_set_alpha(1);
}
