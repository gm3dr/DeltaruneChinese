if (acting == 4)
{
    global.faceaction[0] = 0;
    global.faceaction[1] = 0;
    global.faceaction[2] = 0;
}

firstframe++;

if (firstframe == 1)
    exit;

if (!i_ex(obj_halo_bat_circle) && !i_ex(obj_halo_bat_aim))
    floatsiner++;

y = ystart + (sin(floatsiner / 12) * 4);
scr_enemy_drawhurt_generic();

if (state == 0)
{
    siner += 1;
    animsiner++;
    fsiner += 1;
    eyetimer++;
    
    if (eyetimer == 30)
    {
        var eyeangle = 160 + irandom(40);
        targetEyeX = lengthdir_x(6, eyeangle);
        targetEyeY = lengthdir_y(6, eyeangle);
    }
    
    if (eyetimer == 90)
    {
        eyetimer = (0 + irandom(8)) - irandom(8);
        targetEyeX = 0;
        targetEyeY = 0;
    }
    
    eyex = lerp(eyex, targetEyeX, 0.2);
    eyey = lerp(eyey, targetEyeY, 0.2);
    wingAnimating = 1;
    
    if (wingAnimating == 0)
    {
        wingSpriteL = 5804;
        wingSpriteR = 4533;
    }
    else
    {
        wingSpriteL = 5030;
        wingSpriteR = 5351;
    }
    
    thissprite = idlesprite;
    
    if (global.mercymod[myself] >= global.mercymax[myself])
        thissprite = sparedsprite;
    
    draw_monster_body_part_ext(spr_halo_bat_sword, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_monster_body_part_ext(spr_halo_bat_topBit, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_monster_body_part_ext(wingSpriteL, siner * 0.25, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_monster_body_part_ext(wingSpriteR, siner * 0.25, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_monster_body_part_ext(spr_halo_bat_black, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_monster_body_part_ext(spr_halo_bat_eyeWhite, 0, x + round(eyex * 0.2), y + round(eyey * 0.2), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    
    if (global.mercymod[myself] < 100)
        draw_monster_body_part_ext(spr_halo_bat_eyePupil, 0, x + round(eyex), y + round(eyey), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    
    if (global.mercymod[myself] >= 100)
        draw_monster_body_part_ext(spr_halo_bat_eyePupil_spare, 0, x + round(eyex * 0.2), y + round(eyey * 0.2), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    
    draw_monster_body_part_ext(spr_halo_bat_halo, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

if (becomeflash == 0)
    flash = 0;

becomeflash = 0;

if (init == 0)
{
    init = 1;
    textlength = string_length(text);
}

if (talked == 1 && scr_isphase("enemytalk"))
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_set_font(fnt_dotumche);
    
    if (global.lang == "ja")
        draw_set_font(fnt_ja_kakugo);
    
    angle -= 1;
    extravar++;
    
    if (extravar > 1)
    {
        var angle_diff = 0;
        var letter_count = 1;
        
        repeat (textlength)
        {
            draw_text_transformed(x + lengthdir_x(radius, angle_diff + angle), (y - 90) + (surface_h / 2) + lengthdir_y(radius, angle_diff + angle), string_char_at(text, letter_count), 1, 1, angle_diff + 270 + angle);
            var dist = /*-8*/-14;
            
            if (global.lang == "ja")
            {
                dist = -15;
                
                if (exspace)
                    dist = -13;
            }
            
            angle_diff += dist;
            letter_count++;
        }
    }
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
else
{
    extravar = 0;
}
