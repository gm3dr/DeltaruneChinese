var lang = 0;

if (global.lang == "ja")
    lang = 1;

mystring = "";

for (var i = 0; i < clamp(con + 1 + lang, 0, 3); i++)
    mystring += alphanumericarray[letter[i]];

draw_set_font(fnt_main);

if (lang == 1)
    draw_set_font(scr_84_get_font("8bit"));

draw_set_color(c_black);
draw_set_alpha(0.25);
var xpos = x - 17 - (lang * 2);
var ypos = (y - 50) + (lang * 9);
var scale = 2 - lang;

for (var i = 0; i < string_length(mystring); i++)
    draw_text_transformed((xpos + (16 * i)) - 2, ypos + 2, string_char_at(mystring, i + 1), scale, scale, 0);

draw_set_alpha(1);
draw_set_color(mycolor);

for (var i = 0; i < string_length(mystring); i++)
    draw_text_transformed((xpos + (16 * i)) - 2, ypos, string_char_at(mystring, i + 1), scale, scale, 0);

draw_set_color(c_white);

if (con < 3)
{
    timer++;
    var upcol = merge_color(c_white, #00A3EA, up_h());
    var downcol = merge_color(c_white, #00A3EA, down_h());
    var sinmod = round(abs(sin(timer / 8) * 6) / 2) * 2;
    draw_sprite_ext(spr_gameshow_nameentry_arrow, 0, (x - 5) + (con * 16) + 2, (y - 44 - sinmod) + 2, 2, 2, 180, c_black, 0.25);
    draw_sprite_ext(spr_gameshow_nameentry_arrow, 0, (x - 5) + (con * 16), y - 44 - sinmod, 2, 2, 180, upcol, 1);
    draw_sprite_ext(spr_gameshow_nameentry_arrow, 0, (x - 21) + (con * 16) + 2, (y - 22) + sinmod + 2, 2, 2, 0, c_black, 0.25);
    draw_sprite_ext(spr_gameshow_nameentry_arrow, 0, (x - 21) + (con * 16), (y - 22) + sinmod, 2, 2, 0, downcol, 1);
}

draw_set_font(scr_84_get_font("mainbig"));
strchange = stringsetloc("Change Letter", "obj_gameshow_nameentry_slash_Draw_0_gml_41_0");
strnext = stringsetloc("Next Letter", "obj_gameshow_nameentry_slash_Draw_0_gml_42_0");
strprev = stringsetloc("Previous Letter", "obj_gameshow_nameentry_slash_Draw_0_gml_43_0");
var _xx = camerax();
var _yy = cameray();
//
    var kern = 28;
//
if (controller_active)
{
    draw_sprite_ext(scr_getbuttonsprite(global.input_g[2], false), 0, _xx + 32, ((_yy + 480) - 70) + 1 + (tutprog * 80), 2, 2, 0, c_white, 1);
    draw_sprite_ext(scr_getbuttonsprite(global.input_g[0], false), 0, _xx + 32 + 65, ((_yy + 480) - 70) + 1 + (tutprog * 80), 2, 2, 0, c_white, 1);
    draw_sprite_ext(scr_getbuttonsprite(global.input_g[4], false), 0, (_xx + 640) - 234, ((_yy + 480) - 67) + 1 + (tutprog * 80), 2, 2, 0, c_white, 1);
    draw_sprite_ext(scr_getbuttonsprite(global.input_g[5], false), 0, (_xx + 640) - 298, ((_yy + 480) - 37) + (tutprog * 80), 2, 2, 0, c_white, 1);
    draw_set_halign(fa_left);
    draw_set_color(#003A52);
    draw_text(_xx + 14 + 60, ((_yy + 480) - 70) + 2 + (tutprog * 80), "/");
    //var kern = (global.lang == "ja") ? 28 : 16;
    for (i = 1; i <= string_length(strchange); i += 1)
    {
        var ch = string_char_at(strchange, i);
        draw_text(_xx + 14 + (i * kern), ((_yy + 480) - 40) + 2 + (tutprog * 80), ch);
    }
    
    draw_set_color(c_white);
    draw_text(_xx + 14 + 60, ((_yy + 480) - 70) + (tutprog * 80), "/");
    
    for (i = 1; i <= string_length(strchange); i += 1)
    {
        var ch = string_char_at(strchange, i);
        draw_text(_xx + 14 + (i * kern), ((_yy + 480) - 40) + (tutprog * 80), ch);
    }
    
    draw_set_halign(fa_right);
    draw_set_color(#003A52);
    var i = string_length(strnext);
    
    while (i >= 1)
    {
        var ch = string_char_at(strnext, i);
        draw_text(((_xx + 640) - 200) + (i * kern), ((_yy + 480) - 70) + 2 + (tutprog * 80), ch);
        i -= 1;
    }
    
    i = string_length(strprev);
    
    while (i >= 1)
    {
        var ch = string_char_at(strprev, i);
        draw_text(((_xx + 640) - 264) + (i * kern), ((_yy + 480) - 40) + 2 + (tutprog * 80), ch);
        i -= 1;
    }
    
    draw_set_color(c_white);
    i = string_length(strnext);
    
    while (i >= 1)
    {
        var ch = string_char_at(strnext, i);
        draw_text(((_xx + 640) - 200) + (i * kern), ((_yy + 480) - 70) + (tutprog * 80), ch);
        i -= 1;
    }
    
    i = string_length(strprev);
    
    while (i >= 1)
    {
        var ch = string_char_at(strprev, i);
        draw_text(((_xx + 640) - 264) + (i * kern), ((_yy + 480) - 40) + (tutprog * 80), ch);
        i -= 1;
    }
    
    draw_set_halign(fa_left);
}
else
{
    draw_set_halign(fa_left);
    draw_set_color(#003A52);
    var kern = 28; //var kern = (global.lang == "ja") ? 28 : 16;
    var command_text = strup + "/" + strdown + ": ";
    
    for (i = 1; i <= string_length(command_text); i += 1)
    {
        var ch = string_char_at(command_text, i);
        draw_text(_xx + 14 + (i * kern), ((_yy + 480) - 70) + 2 + (tutprog * 80), ch);
    }
    
    for (i = 1; i <= string_length(strchange); i += 1)
    {
        var ch = string_char_at(strchange, i);
        draw_text(_xx + 14 + (i * kern), ((_yy + 480) - 40) + 2 + (tutprog * 80), ch);
    }
    
    draw_set_color(c_white);
    
    for (i = 1; i <= string_length(command_text); i += 1)
    {
        var ch = string_char_at(command_text, i);
        draw_text(_xx + 14 + (i * kern), ((_yy + 480) - 70) + (tutprog * 80), ch);
    }
    
    for (i = 1; i <= string_length(strchange); i += 1)
    {
        var ch = string_char_at(strchange, i);
        draw_text(_xx + 14 + (i * kern), ((_yy + 480) - 40) + (tutprog * 80), ch);
    }
    
    draw_set_halign(fa_right);
    draw_set_color(#003A52);
    var next_text = strbut1 + ": " + strnext;
    var i = string_length(next_text);
    
    while (i >= 1)
    {
        var ch = string_char_at(next_text, i);
        draw_text(((_xx + 640) - 280) + (i * kern), ((_yy + 480) - 70) + 2 + (tutprog * 80), ch);
        i -= 1;
    }
    
    var prev_text = strbut2 + ": " + strprev;
    i = string_length(prev_text);
    
    while (i >= 1)
    {
        var ch = string_char_at(prev_text, i);
        draw_text(((_xx + 640) - 344) + (i * kern), ((_yy + 480) - 40) + 2 + (tutprog * 80), ch);
        i -= 1;
    }
    
    draw_set_color(c_white);
    i = string_length(next_text);
    
    while (i >= 1)
    {
        var ch = string_char_at(next_text, i);
        draw_text(((_xx + 640) - 280) + (i * kern), ((_yy + 480) - 70) + (tutprog * 80), ch);
        i -= 1;
    }
    
    i = string_length(prev_text);
    
    while (i >= 1)
    {
        var ch = string_char_at(prev_text, i);
        draw_text(((_xx + 640) - 344) + (i * kern), ((_yy + 480) - 40) + (tutprog * 80), ch);
        i -= 1;
    }
    
    draw_set_halign(fa_left);
}
