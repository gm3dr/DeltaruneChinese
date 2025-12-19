depth = 100000;
var xx = camerax();
var yy = cameray();

if (slowdown == 1)
{
    rate = lerp(rate, 0, 0.08);
    
    if (rate <= 0.02)
    {
        rate = 0;
        slowdown = 0;
    }
}
else if (speedup == 1)
{
    rate = lerp(rate, 1, 0.08);
    
    if (rate >= 0.98)
    {
        rate = 1;
        speedup = 0;
    }
}

if (paused == 0)
    siner += (1 * rate);

draw_set_alpha(1);
draw_sprite_tiled_ext(spr_dw_tv_starbgtile, siner / 3, xx + siner, yy + siner, 2, 2, c_white, 1);
draw_sprite_ext(spr_dw_tv_starbgtile_allblue, 0, xx, yy, 1, 2, 0, c_white, alpha2);
draw_sprite_ext(spr_dw_tv_starbgtile_allblue, 0, xx + 80, yy, 6, 0.3, 0, c_white, alpha2);
draw_sprite_ext(spr_dw_tv_starbgtile_allblue, 0, xx + 560, yy, 1, 2, 0, c_white, alpha2);

if (slowdown == 1 && alpha2 < 1)
    alpha2 += 0.1;

if (slowdown == 0 && alpha2 > 0)
    alpha2 -= 0.1;

draw_set_color(c_white);
draw_set_font(scr_84_get_font("8bit"));
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_alpha(0.2 + (sin(siner / 6) * 0.04));
ossafe_fill_rectangle(xx + 125, yy + 35, xx + 125 + ((myscore / maxscore) * 390) + (sin(siner / 4) * 1), yy + 125);
draw_set_alpha(1);
draw_text_transformed_outline(camerax() + 320, cameray() + 80, myscore, 2 + (sin(siner / 4) * 0.3), 1.5, 16711680);
draw_text_transformed_outline(camerax() + 320, cameray() + 50, /*"SCORE"*/"分数", 2 + (sin(siner / 4) * 0.05), 1.5 + (sin(siner / 4) * 0.1), 16711680);

if (addscore > 0)
    draw_text_transformed_outline(camerax() + 320 + 100, cameray() + 80, "+" + string(addscore), 2 + (sin(siner / 4) * 0.3), 1.5, 16711680);

if (addscore < 0)
    draw_text_transformed_outline(camerax() + 320 + 100, cameray() + 80, string(addscore), 2 + (sin(siner / 4) * 0.3), 1.5, 255);

repeat (10)
{
    if (addscore > 0 && global.mnfight == 0)
    {
        addscore--;
        myscore++;
    }
}

if (addscore < 0)
{
    addscore++;
    myscore--;
}

draw_set_halign(fa_left);
draw_sprite_ext(spr_tenna_enemy_bg_parts, 1, xx, yy + 48, 2, 2, image_angle, c_white, image_alpha);
draw_sprite_ext(spr_tenna_enemy_bg_parts, 2, xx + (sin(siner / 8) * 3), yy + 56 + (cos(siner / 8) * 1), 2, 2, image_angle, c_white, image_alpha);
var scrollspeed = sin(siner / 40) * 8;
scrollspeed = 3 * rate;

if (paused == 0)
    scrollx += scrollspeed;

if (scrollx >= 70)
    scrollx -= 70;

if (scrollx < 0)
    scrollx += 70;

var xsep = 70;
var vx = camerax() + 314;
draw_set_color(c_maroon);
draw_set_alpha(0.3);

for (var i = -9; i < 9; i++)
{
    var topx = vx + (((i * xsep) + scrollx) * 0.5);
    draw_line_width(topx, cameray() + 132 + sin(2 + (topx / 120)), vx + (i * xsep) + scrollx, cameray() + 288, 2);
}

draw_set_color(c_navy);

for (var i = -9; i < 9; i++)
    draw_line_width(camerax() + 314 + (i * xsep) + scrollx, cameray() + 288, vx + (i * xsep) + scrollx, cameray() + 308, 2);

draw_set_alpha(alpha3);
var bgcolor1 = make_color_hsv(110, 1800, 220);
ossafe_fill_rectangle_color(xx, yy, xx + 120, yy + 130, 8388608, 8388608, bgcolor1, bgcolor1, false);
ossafe_fill_rectangle_color(xx + 641, yy, xx + 520, yy + 130, 8388608, 8388608, bgcolor1, bgcolor1, false);
draw_set_alpha(1);

if (slowdown == 1 && alpha3 < 1)
    alpha3 += 0.1;

if (slowdown == 0 && alpha3 > 0.8)
    alpha3 -= 0.1;

if (paused == 0)
    starscrolly += (1 * rate);

draw_sprite_ext(spr_tenna_enemy_bg_parts, 0, xx, yy + 12, 2, 2, image_angle, c_white, image_alpha);
var count = 0;
mysprite[0] = 4809;
mysprite[1] = 4809;
mysprite[2] = 4809;

for (var i = -12; i < 10; i += 2)
{
    var myx = vx + ((i * xsep) / 2) + (scrollx * 1.5);
    draw_sprite_ext(mysprite[count], abs(myx / 60), myx, cameray() + 360 + (sin((siner / 12) + (myx / 80)) * 12) + (sin(myx / 20) * 8), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    count++;
    
    if (count >= 3)
        count = 0;
}

for (var i = -11; i < 10; i += 2)
{
    var myx = vx + ((i * xsep) / 2) + (scrollx * 1.5);
    draw_sprite_ext(mysprite[count], abs(myx / 60), myx, cameray() + 360 + (sin((siner / 12) + (myx / 80)) * 12) + (sin(myx / 20) * 8), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    count++;
    
    if (count >= 3)
        count = 0;
}

draw_set_alpha(1);
