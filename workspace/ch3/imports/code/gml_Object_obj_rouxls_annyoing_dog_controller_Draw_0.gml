var cx = camerax();
var cy = cameray();
siner++;

if (con == 3 && timer > 60)
{
    smashtimer++;
    var scale = smashtimer / 1200;
    
    if (textspd > 0.005)
        textspd -= 0.005;
    
    textoffset += textspd;
    draw_set_alpha(alpha);
    draw_sprite_ext(spr_smashreveal1, 0, cx, cy, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_smashreveal2, 0, (cx + 0 + (textoffset / 5)) - 20, cy + 10, 2, 2, 0, c_white, 1);
    var dogstring = stringset("ANNOYING#DOG");
    dogstring = string_hash_to_newline(dogstring);
    var angle = 10 - (textoffset / 3 / 10);
    var textposx = cx + 432 + (angle / 10);
    var textposy = cy + 172 + (angle / 10);

    //这里用日文版的处理方式
    if (global.lang /*!=*/== "ja")
    {
        var memalign = [draw_get_halign(), draw_get_valign()];
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        var memfont = draw_get_font();
        draw_set_font(fnt_mainbig);
        draw_set_color(c_black);
        
        for (var i = 1; i < 6; i++)
            draw_text_transformed(textposx + (i * 2), textposy + (i * 2), dogstring, 3, 3, angle);
        
        draw_set_color(-1);
        draw_text_transformed(textposx, textposy, dogstring, 3, 3, angle);
        draw_set_halign(memalign[0]);
        draw_set_valign(memalign[1]);
        draw_set_font(memfont);
    }
    else
    {
        var dloc = [((cx + 434) - 4) + (dogspin * 12), cy + 196];
        draw_sprite_ext(spr_txt_ja_annoyingdog, 0, dloc[0], dloc[1], 1, 1, 0, c_white, 1);
    }
    
    scale = 14;
    angle = -30 + (smashtimer / 6);
    var xoffset = 190;
    var yoffset = 270;
    var dogloc = [(cx + xoffset + 8) - (dogspin * 8), (cy + yoffset + 40) - (dogspin * 40)];
    d3d_set_fog(true, c_black, 0, 0);
    draw_sprite_ext(spr_dog_walk, 0, dogloc[0] + (10 * dogspin), dogloc[1] + (10 * dogspin), scale, scale, -dogspin * 8, c_white, (alpha * 0.5) - (0.2 * dogspin));
    d3d_set_fog(false, c_black, 0, 0);
    var bloc = [460 + (dogspin * 8), 292];
    var revline = 4820;
    var bon = 0;
    
    if (global.lang == "ja")
    {
        revline = 1172;
        bon = -10;
    }
    
    draw_sprite_ext(spr_dog_walk, 0, dogloc[0], dogloc[1], scale, scale, -dogspin * 8, c_white, alpha);
    draw_sprite_ext(revline, 0, (cx + bloc[0]) - bon, cy + bloc[1], 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_pxwhite, 0, cx, cy, 640, 480, 0, c_white, whitealpha);
}
