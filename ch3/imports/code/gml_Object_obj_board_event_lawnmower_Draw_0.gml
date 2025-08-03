if (active)
{
    var xx = x - 160;
    var yy = scr_even((y - 96) + scorey);
    draw_set_color(c_black);
    ossafe_fill_rectangle(xx + 128, yy + 64, xx + 640, yy + 64 + 16 + 4 + 1, 0);
    draw_set_color(c_white);
    draw_set_font(scr_84_get_font("8bit"));
    draw_set_halign(fa_left);
    draw_text(xx + 128 + 4, yy + 64 + 4, "TIME: " + string(round(gametimer / 30)));
    draw_set_halign(fa_right);
    draw_text((xx + 512) - 4, yy + 64 + 4, "SCORE: " + string(mowscore * 10));
    draw_set_halign(fa_left);
}
