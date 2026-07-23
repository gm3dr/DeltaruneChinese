if (instance_exists(obj_mainchara))
    checkX = obj_mainchara.x + 20;

timer += 2;
c_rainbow = make_color_hsv(timer % 255, 255, 255);
curColor = merge_color(merge_color(c_white, c_rainbow, 0.5), c_black, 0.2);
draw_set_color(curColor);

if (createAndStay == 0)
    draw_rectangle(594, 110, 1488, 220, 0);

if (createAndStay == 1)
{
    if (checkX >= 594)
        newcount = 1;
    
    if (checkX >= 750)
        newcount = 2;
    
    if (checkX >= 898)
        newcount = 3;
    
    if (checkX >= 1043)
        newcount = 4;
    
    if (checkX >= 1190)
        newcount = 5;
    
    if (checkX >= 1339)
        newcount = 6;
    
    if (count < newcount)
        count = newcount;
    
    if (count >= 1)
        draw_rectangle(594, 110, 750, 220, 0);
    
    if (count >= 2)
        draw_rectangle(750, 110, 898, 220, 0);
    
    if (count >= 3)
        draw_rectangle(898, 110, 1043, 220, 0);
    
    if (count >= 4)
        draw_rectangle(1043, 110, 1190, 220, 0);
    
    if (count >= 5)
        draw_rectangle(1190, 110, 1339, 220, 0);
    
    if (count >= 6)
    {
        draw_rectangle(1339, 110, 1488, 220, 0);
        
        if (global.plot < 67)
            global.plot = 67;
    }
}

draw_set_color(c_white);
