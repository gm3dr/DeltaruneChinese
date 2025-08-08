if (myself == 1)
{
    if (pipisSignAlpha > 0)
    {
        pipisSignAlpha -= 0.1;
        var lang = 0;
        
        if (global.lang == "ja")
            lang = 1;

		var pipis = spr_pipissign;
		if (global.lang == 2)
		{
			pipis = spr_zhname_pipissign;
		}
        
        draw_sprite_ext(pipis, lang, (x - 4) + random_range(0, 1), y + (sprite_height / 2) + 12 + random_range(0, 1), 1, 1, 0, c_white, pipisSignAlpha);
    }
}

if (state == 3)
{
    scr_enemyhurt_tired_after_damage(0.5);
    fatal = 1;
    hurttimer -= 1;
    
    if (hurttimer < 0)
    {
        state = 0;
    }
    else
    {
        if (global.monster[myself] == 0)
        {
            x = xstart - 16;
            y = ystart - 12;
            scr_defeatrun();
        }
        
        hurtshake += 1;
        
        if (hurtshake > 1)
        {
            if (shakex > 0)
                shakex -= 1;
            
            if (shakex < 0)
                shakex += 1;
            
            shakex = -shakex;
            hurtshake = 0;
        }
        
        draw_sprite_ext(hurtsprite, 0, x + shakex + hurtspriteoffx, y + hurtspriteoffy, 2, 2, 0, image_blend, 1);
    }
}

if (custom_draw_example == 0)
{
    scr_enemy_drawidle_generic(0);
}
else if (state == 0)
{
    if (flash == 1)
        fsiner++;
    
    siner += 0.16666666666666666;
    
    if (global.mercymod[myself] >= global.mercymax[myself])
    {
        draw_monster_body_part(sparedsprite, siner, x, y);
    }
    else
    {
        draw_monster_body_part(spr_diamondm_custom_body_example, 1, x + (sin(siner) * 2), y);
        draw_monster_body_part(spr_diamondm_custom_body_example, 0, x - (sin(siner) * 2), y + cos(siner));
    }
}

if (becomeflash == 0)
    flash = 0;

becomeflash = 0;
