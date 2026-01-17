if (i_ex(mywriter))
{
    mywriter.depth = depth - 5;
    
    if (remmsgno != obj_writer.msgno)
        reformatted = 0;
    
    if (auto_length == 0)
    {
        init = 1;
        reformatted = 1;
    }
    
    if (reformatted == 0)
    {
        if (mywriter.formatted == 1)
        {
            if (init == 0)
            {
                initwritingx = mywriter.writingx;
                initwritingy = mywriter.writingy;
                init = 1;
            }
            
            writingx = mywriter.writingx;
            writingy = mywriter.writingy;
            stringmax = mywriter.stringmax;
            hspace = mywriter.hspace;
            vspace = mywriter.vspace;
            linecount = mywriter.linecount;
            balloonwidth = (((stringmax * 9) / 5) * hspace) + 10;
            balloonheight = ((linecount + 1) * vspace) + 5;
            
            if (global.lang == "ja")
            {
                var checkstring = mywriter.mystring;
                var spacing = mywriter.hspace;
                var stringlength = string_length(checkstring);
                var newmaxlength = 0;
                var currentlength = 0;
                
                for (var ii = 1; ii < (stringlength + 1); ii += 1)
                {
                    var mychar = string_char_at(checkstring, ii);
                    
                    if (mychar == "&" || mychar == "\n")
                    {
                        currentlength = 0;
                    }
                    else if (mychar == "^" || mychar == "*")
                    {
                        ii++;
                    }
                    else if (mychar == "\\")
                    {
                        ii += 2;
                    }
                    else if (mychar == "/" || mychar == "%")
                    {
                    }
                    else if (ord(mychar) < 256 || (ord(mychar) >= 65377 && ord(mychar) <= 65439))
                    {
                        currentlength += (spacing * 0.5);
                    }
                    else
                    {
                        currentlength += spacing;
                    }
                    
                    if (currentlength >= newmaxlength)
                        newmaxlength = currentlength;
                }
                
                balloonwidth = newmaxlength + 10;
            }
            
            if (side == 1)
            {
                mywriter.writingx = initwritingx - (balloonwidth + 20);
                mywriter.writingy = initwritingy - (balloonheight / 2);
                writingx = initwritingx - (balloonwidth + 20);
                writingy = initwritingy - (balloonheight / 2);
            }
            
            if (side == -1)
            {
                xoffset = 20;
                mywriter.writingx = initwritingx;
                mywriter.writingy = initwritingy - (balloonheight / 2);
                writingx = initwritingx;
                writingy = initwritingy - (balloonheight / 2);
            }
        }
    }
    
    if (auto_length == 0)
        draw_self();
    
    if (auto_length == 1 && init == 1)
    {
        blconscale = 1;
        
        if (balloonheight < 40)
            blconscale = 0.5;
        
        if (side == 1)
            draw_sprite_ext(spr_battleblcon_parts, 4, x, y, 1, blconscale, 0, c_white, 1);
        
        if (side == -1)
            draw_sprite_ext(spr_battleblcon_parts, 4, x - xoffset, y, -1, blconscale, 0, c_white, 1);
        
        draw_set_color(c_white);
        draw_rectangle(writingx - 10, writingy - 5, writingx + balloonwidth, (writingy + balloonheight) - 5, false);
        draw_rectangle(writingx - 5, writingy - 10, (writingx + balloonwidth) - 5, writingy + balloonheight, false);
    }
    
    remmsgno = mywriter.msgno;
}
