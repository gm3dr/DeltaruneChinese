draw_set_font(fnt_mainbig);
var stringlength = string_length(mystring);
var xx = (camerax() + 320) - ((stringlength * hspace) / 2) - (hspace / 2);
var yy = cameray() + 180;

repeat (timerspeed)
{
    if (timer == 0)
    {
        scale = 0;
        scr_lerpvar("scale", 0, 2, 40, -2, "out");
        scale = 2;
        scr_lerpvar("hspace", 0, /*32*/56, 45, -2, "out");
    }
    
    if (timer == 26)
        scr_lerpvar("yyy", 0, -300 - (stringlength * 18), 26, 1, "in");
    
    if (timer >= 30)
    {
        with (obj_tenna_enemy)
            stopshoot = 0;
    }
    
    if (timer >= 100)
        instance_destroy();
    
    timer++;
    
    if (scr_debug())
    {
        if (keyboard_check(vk_space))
        {
            timer = 0;
            con = 0;
            yyy = 0;
        }
    }
    
    for (var i = 1; i < stringlength; i++)
    {
        var mychar = string_char_at(mystring, i);
        var myyyy = min(0, yyy + (i * 20));
        draw_set_color(c_black);
        draw_text_transformed(xx + (hspace * i) + 4, yy + 4 + myyyy, mychar, scale, scale, 0);
        draw_set_color(c_white);
        draw_text_transformed_outline(xx + (hspace * i), yy + myyyy, mychar, scale, scale, 8388608);
    }
}
