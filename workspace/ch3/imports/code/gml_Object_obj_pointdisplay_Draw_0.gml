draw_set_color(c_black);
xx = camerax() - 72;
yy = cameray() + 88;

if (i_ex(obj_mainchara))
{
    if (obj_mainchara.x <= (camerax() + 320))
        xx += 320;
}

scr_darkbox_black(xx + 96, yy + 100, xx + 360, yy + 220);
draw_set_color(c_white);
scr_84_set_draw_font("mainbig");
draw_text(xx + 130, yy + 130, "$" + string(global.gold));
draw_text(xx + 130, yy + 156, string(global.flag[1044]));
draw_text(xx + 210, yy + 156, /*"POINTs"*/"点数");

if (!d_ex())
    instance_destroy();
