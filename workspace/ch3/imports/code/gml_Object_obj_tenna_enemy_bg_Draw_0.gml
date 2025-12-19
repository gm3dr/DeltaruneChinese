depth = 100000;
var xx = camerax();
var yy = cameray();

if (slowdown == 1)
{
    rate = lerp(rate, 0, 0.12);
    
    if (rate <= 0.02)
    {
        rate = 0;
        slowdown = 0;
    }
}
else if (speedup == 1)
{
    rate = lerp(rate, 1, 0.12);
    
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

alpha2 = 1;
draw_set_color(c_white);
draw_set_font(fnt_8bit);
draw_set_halign(fa_center);
draw_set_color(c_white);

if (slowdown == 1 || rate == 0)
{
    alpha4 -= 0.04;
    
    if (alpha4 < 0)
        alpha4 = 0;
}

if (slowdown == 0 && rate != 0)
    alpha4 = 0.2 + (sin(siner / 6) * 0.04);

draw_sprite_ext(spr_pixel_white, 0, xx + 125, yy + 35, ((myscore / maxscore) * 98) + (sin(siner / 4) * 1), yy + 125, 0, c_white, alpha4);

if (minigametimecon == 0)
    draw_text_transformed_outline(camerax() + 320, cameray() + 80, myscore, 2 + (sin(siner / 4) * 0.3), 1.5, 16711680);

if (minigametimecon == 0)
    draw_text_transformed_outline(camerax() + 320, cameray() + 50, /*"SCORE"*/"分数", 2 + (sin(siner / 4) * 0.05), 1.5 + (sin(siner / 4) * 0.1), 16711680);

if (alarm[0] < 1)
{
    var rep = 10;
    
    if (addscore <= 20)
        rep = 1;
    
    repeat (rep)
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
}

if (addscore > 0)
{
    draw_text_transformed_outline(camerax() + 320 + 114, cameray() + 50, /*"bonus"*/"加成", 0.7 + (sin(siner / 6) * 0.2), 1.5, 16711680);
    draw_text_transformed_outline(camerax() + 320 + 110, cameray() + 80, "+" + string(addscore), 1 + (sin(siner / 6) * 0.2), 1.5, 16711680);
}

if (addscore < 0)
{
    draw_text_transformed_outline(camerax() + 320 + 110, cameray() + 50, /*"bet"*/"赌注", 1 + (sin(siner / 6) * 0.2), 1.5, 255);
    draw_text_transformed_outline(camerax() + 320 + 110, cameray() + 80, string(addscore), 1 + (sin(siner / 6) * 0.2), 1.5, 255);
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
draw_set_color(col1);

for (var i = -9; i < 9; i++)
{
    var topx = vx + (((i * xsep) + scrollx) * 0.5);
    draw_line_width(topx, cameray() + 132 + sin(2 + (topx / 120)), vx + (i * xsep) + scrollx, cameray() + 288, 2);
}

draw_set_color(col2);

for (var i = -9; i < 9; i++)
    draw_line_width(camerax() + 314 + (i * xsep) + scrollx, cameray() + 288, vx + (i * xsep) + scrollx, cameray() + 308, 2);

var bgcolor1 = make_color_hsv(110, 1800, 220);
draw_rectangle_color(xx, yy, xx + 120, yy + 130, c_navy, c_navy, bgcolor1, bgcolor1, false);
draw_rectangle_color(xx + 641, yy, xx + 520, yy + 130, c_navy, c_navy, bgcolor1, bgcolor1, false);
draw_set_alpha(1);

if (slowdown == 1 && alpha3 < 1)
    alpha3 += 0.1;

if (slowdown == 0 && alpha3 > 0.8)
    alpha3 -= 0.1;

if (paused == 0)
    starscrolly += (1 * rate);

if (minigametimecon == 1)
{
    minigametimetimer++;
    
    if (minigametimetimer == 1)
        snd_play(snd_bigscore);
    
    if (minigametimetimer > 0 && minigametimetimer <= 5)
        whitefgalpha = lerp(0, 1, minigametimetimer / 5);
    
    if (minigametimetimer == 10)
    {
        minigametimecon = 2;
        minigametimetimer = 0;
    }
}

if (minigametimecon == 2)
{
    minigametimetimer++;
    
    if (minigametimetimer > 0 && minigametimetimer <= 5)
        whitefgalpha = lerp(1, 0, minigametimetimer / 5);
    
    if (minigametimetimer == 60)
    {
        minigametimecon = 3;
        minigametimetimer = 0;
    }
}

draw_set_font(fnt_8bit);
draw_set_color(c_white);
draw_set_halign(fa_center);

if (addscore < 0)
{
}
else if (addscore > 0)
{
}
else if (minigametimecon > 1)
{
    draw_text_transformed_outline(camerax() + 330, cameray() + 66, /*"GAME TIME!"*/"游戏时间！", 2 + (sin(siner / 4) * 0.05), 1.5 + (sin(siner / 4) * 0.1), 16711680);
}

draw_set_halign(fa_left);
draw_set_alpha(whitefgalpha);
draw_rectangle(camerax() + 120, cameray() + 30, camerax() + 520, cameray() + 130, 0);
draw_set_alpha(1);
draw_set_font(scr_84_get_font("8bit_mixed"));
draw_sprite_ext(spr_tenna_enemy_bg_parts, 0, xx, yy + 12, 2, 2, image_angle, c_white, image_alpha);
var count = 0;
mysprite[0] = 4809;
mysprite[1] = 4809;
mysprite[2] = 4809;

for (var i = -12; i < 10; i += 2)
{
    var myx = vx + ((i * xsep) / 2) + (scrollx * 1.5);
    draw_sprite_ext(mysprite[count], abs(myx / 60), myx, cameray() + audience_y_pos + (sin((siner / 12) + (myx / 80)) * 12) + (sin(myx / 20) * 8), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    count++;
    
    if (count >= 3)
        count = 0;
}

for (var i = -11; i < 10; i += 2)
{
    var myx = vx + ((i * xsep) / 2) + (scrollx * 1.5);
    draw_sprite_ext(mysprite[count], abs(myx / 60), myx, cameray() + audience_y_pos + (sin((siner / 12) + (myx / 80)) * 12) + (sin(myx / 20) * 8), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    count++;
    
    if (count >= 3)
        count = 0;
}

draw_set_alpha(1);
draw_set_color(c_black);
draw_rectangle(camerax(), cameray() + 360, camerax() + room_width + 10, cameray() + view_hport[0], 0);
draw_set_color(c_white);
