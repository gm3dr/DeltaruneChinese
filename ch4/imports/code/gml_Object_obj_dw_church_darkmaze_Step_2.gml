if (fixsusie)
{
    with (sumark)
        scr_depth();
}

if (trippin == 0)
{
    with (obj_gerson_cane_bullet)
    {
        if (!instance_exists(obj_battleback))
        {
            hit = 0;
            other.trippin = 1;
            gravity = 1;
            vspeed = -12;
            var a = gravity / 2;
            var b = vspeed;
            var c = -abs(878 - y);
            var time = (-b + sqrt((b * b) - (4 * a * c))) / (2 * a);
            scr_lerpvar("image_angle", image_angle % 360, (image_angle % 360) - 180, time);
            hspeed = 18;
        }
    }
}

if (trippin == 1)
{
}

var domake = false;

with (obj_gerson_cane_bullet)
{
    if (other.trippin)
        hspeed = lerp(hspeed, 0.5, 0.05);
    
    if (y >= 878)
    {
        if (hit == 0)
        {
            domake = true;
            vspeed = -6;
            snd_play(snd_wing);
            hit = 1;
        }
        else if (hit == 1)
        {
            vspeed = -3;
            snd_play(201, 0.5);
            hit = 2;
        }
        
        scr_depth();
        y = 878;
    }
}

if (domake)
{
    caught = instance_create(obj_gerson_cane_bullet.x, obj_gerson_cane_bullet.y, obj_trigger_interact);
    
    with (caught)
    {
        scr_sizeexact(50, 36);
        talked = 0;
    }
}

with (caught)
{
    if (instance_exists(obj_gerson_cane_bullet))
        setxy(obj_gerson_cane_bullet.x - 20, obj_gerson_cane_bullet.y - 20);
    else
        instance_destroy();
    
    if (myinteract == 3 && global.interact == 0)
    {
        global.interact = 1;
        myinteract = 4;
        var str1 = "* （哪里走...！）/%";
        var str2 = "* （它去迎接更美好的生活了...）/%";
        
        if (global.lang == "ja")
        {
            str1 = "＊ (いた…！)/%";
            str2 = "＊ (さようなら…　どうか達者で…)/%";
        }
        
        scr_speaker("no_name");
        
        if (talked == 0)
            msgset(0, str1);
        else
            msgset(0, str2);
        
        talked++;
        d_make();
    }
    
    if (myinteract == 4 && !d_ex())
    {
        global.interact = 0;
        myinteract = 0;
    }
    
    if (myinteract == 0 && y > (room_width + 40))
    {
        with (obj_gerson_cane_bullet)
            instance_destroy();
        
        instance_destroy();
    }
}
