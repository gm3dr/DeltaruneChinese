if (drawlabel == 1)
{
    var lang = 0;
    
    if (global.lang == "ja")
        lang = 1;
	
	var pipis = spr_pipissign;
	if (global.names >= 2)
	{
		pipis = spr_zhname_pipissign;
	}
    
    draw_sprite_ext(pipis, lang, (x - 4) + random_range(0, 1), y + (sprite_height / 2) + 12 + random_range(0, 1), 1, 1, 0, c_white, 1);
}

if (type == 3)
{
    if (x < (obj_growtangle.x + (obj_growtangle.sprite_width / 2) + 10) && y > ((obj_growtangle.y - (obj_growtangle.sprite_height / 2)) + 10))
    {
        event_user(0);
        snd_play(snd_bomb);
    }
    
    if (y > ((obj_growtangle.y - 20) + obj_growtangle.sprite_height))
    {
        event_user(0);
        snd_play(snd_bomb);
    }
    
    image_angle += 10;
}
else if (type == 2)
{
    image_angle += 45;
    
    if (con == 0)
    {
        if (y > ((obj_growtangle.y - 20) + (obj_growtangle.sprite_height / 2)) && vspeed > 0)
            con = 1;
    }
    
    if (con == 1)
    {
        snd_play(snd_bump);
        image_angle = -30 - random(30);
        gravity = 0.24;
        vspeed = bouncespeed;
        con = 2;
        alarm[0] = 10;
    }
    
    if (x < (obj_growtangle.x + (obj_growtangle.sprite_width / 2) + 10) && y > ((obj_growtangle.y - (obj_growtangle.sprite_height / 2)) + 10))
    {
        event_user(0);
        snd_play(snd_bomb);
    }
    
    if (y > ((obj_growtangle.y - 20) + (obj_growtangle.sprite_height / 2)) && vspeed > 0 && con == 2 && alarm[0] < 1)
        con = 1;
}
else
{
    if (type == 1)
        x = parent.x;
    
    image_angle += 4;
    
    if (gravity_direction == 180)
    {
        if (x < (obj_growtangle.x + (obj_growtangle.sprite_width / 2) + 10))
        {
            event_user(0);
            snd_play(snd_bomb);
        }
    }
}

var x_shake = 0;
var y_shake = 0;

if (shake > 0)
{
    shake--;
    x_shake = 4 - random(8);
    y_shake = 4 - random(8);
}

draw_sprite_ext(sprite_index, image_index, x + x_shake, y + y_shake, image_xscale, image_yscale, image_angle, c_white, image_alpha);

if (type == 2)
{
    if ((con == 2 && y < ((obj_growtangle.y - (obj_growtangle.sprite_height / 2)) + 0) && x < (obj_growtangle.x + (obj_growtangle.sprite_width / 2) + 80)) || (directhit == 1 && y < ((obj_growtangle.y - (obj_growtangle.sprite_height / 2)) + 0)))
        gravity += 0.01;
}
