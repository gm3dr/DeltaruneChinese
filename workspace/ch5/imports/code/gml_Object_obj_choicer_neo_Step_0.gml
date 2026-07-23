global.flag[33] += 1;

if (canchoose == 1)
{
    if (mychoice >= 0 && button1_p())
        event_user(0);
    
    if (choiced == 0)
    {
        if (left_h())
            mychoice = 0;
        
        if (choicetotal >= 1 && right_h())
            mychoice = 1;
        
        if (choicetotal >= 2 && up_h())
            mychoice = 2;
        
        if (choicetotal >= 3 && down_h())
            mychoice = 3;
    }
}

scr_84_set_draw_font((dar == 1) ? "main" : "mainbig");

if (choicerstyle == 1)
    scr_84_set_draw_font("8bit");

if (neostyle == 0)
{
    if (choicerstyle == 0)
    {
        heartposx[0] = xx + (30 * dar);
        heartposy[0] = yy + ((34 + d_add) * dar) + (fighting * 30);
        textposx[0] = heartposx[0] + (16 * dar);
        textposy[0] = yy + ((13 + d_add) * dar) + (fighting * 30);
        
        if (choicetotal >= 1)
        {
            var str1width = string_width(string_hash_to_newline(global.choicemsg[1]));
            heartposx[1] = (xx + (276 * dar)) - str1width;
            heartposy[1] = yy + ((34 + d_add) * dar) + (fighting * 30);
            textposx[1] = heartposx[1] + (16 * dar);
            textposy[1] = yy + ((13 + d_add) * dar) + (fighting * 30);
        }
        
        if (choicetotal >= 2)
        {
            var msg0right = heartposx[0] + (16 * dar) + string_width(string_hash_to_newline(global.choicemsg[0]));
            var msg1left = heartposx[1];
            var msg2width = string_width(string_hash_to_newline(global.choicemsg[2])) + (16 * dar);
            
            if (choicetotal == 3)
            {
                var msg3width = string_width(string_hash_to_newline(global.choicemsg[3])) + (16 * dar);
                
                if (msg3width > msg2width)
                    msg2width = msg3width;
            }
            
            heartposx[2] = (msg0right + ((msg1left - msg0right) / 2)) - (msg2width / 2);
            heartposy[2] = yy + ((16 + d_add) * dar) + (fighting * 30);
            textposx[2] = heartposx[2] + (16 * dar);
            textposy[2] = yy + ((13 + d_add) * dar) + (fighting * 30);
        }
        
        if (choicetotal >= 3)
        {
            heartposx[3] = heartposx[2];
            heartposy[3] = yy + ((60 + d_add) * dar) + (fighting * 30);
            textposx[3] = heartposx[3] + (16 * dar);
            textposy[3] = yy + ((56 + d_add) * dar) + (fighting * 30);
        }
        
        if (mychoice >= 0)
        {
            hx = heartposx[mychoice];
            hy = heartposy[mychoice];
        }
    }
    
    if (choicerstyle == 1)
    {
        xx = boardwriter.x;
        yy = boardwriter.y;
    }
}

if (neostyle == 1)
{
    var scale = dar;
    
    if (!neoinit)
    {
        hx = xx + (156 * scale) + heartxoff;
        hy = yy + ((38 + d_add) * scale) + heartyoff;
        var textyoff = -1.5;
        textposx = [77.5 + opt0xoff, 243.5 + opt1xoff, 160.5 + opt2xoff, 163.5 + opt3xoff];
        textposy = [43 + opt0yoff, 43 + opt1yoff, 23 + opt2yoff, 62.5 + opt3yoff];
        
        for (var i = 0; i < 4; i++)
        {
            var firstChar = string_char_at(global.choicemsg[i], 0);
            if (firstChar == "#" || firstChar == "\n")
                global.choicemsg[i] = string_copy(global.choicemsg[i], 2, string_length(global.choicemsg[i]));
            
            textposx[i] = xx + (textposx[i] * scale);
            textposy[i] = yy + ((textposy[i] + d_add + textyoff) * scale);
            var biggest = 0;
            var arraySplit = string_split_ext(global.choicemsg[i], ["#", "\n"], true, 20);
            neolinecount[i] = array_length(arraySplit);
            
            for (var w = 0; w < neolinecount[i]; w++)
            {
                var newline = string_width(arraySplit[w]);
                biggest = max(biggest, newline);
            }
            
            if (i == 2)
            {
                if (neolinecount[i] > 1)
                {
                    textposy[i] += 2 * scale;
                    hy += (2.5 * scale);
                }
            }
            
            var heartSize = 11 * scale;
            var textXoff = round(biggest / 2) + heartSize;
            heartposx[i] = textposx[i] - textXoff;
            heartposy[i] = textposy[i];
        }
        
        if (choicetotal == 3)
        {
            if (neolinecount[2] == 1 && neolinecount[3] == 2)
                hy -= (5.5 * scale);
            
            if (neolinecount[2] == 2 && neolinecount[3] == 1)
                hy += (1.5 * scale);
            
            if (neolinecount[2] == 2 && neolinecount[3] == 2)
                hy -= (2 * scale);
        }
        
        var placeheart = false;
        
        if (left_h())
        {
            mychoice = 0;
            placeheart = true;
        }
        else if (right_h())
        {
            mychoice = 1;
            placeheart = true;
        }
        else if (up_h() && choicetotal > 1)
        {
            mychoice = 2;
            placeheart = true;
        }
        else if (down_h() && choicetotal > 2)
        {
            mychoice = 3;
            placeheart = true;
        }
        
        if (placeheart)
        {
            hx = heartposx[mychoice];
            hy = heartposy[mychoice];
        }
        
        neoinit = 1;
    }
    
    if (mychoice >= 0)
    {
        hx = lerp(hx, heartposx[mychoice], neolerpstrength);
        hy = lerp(hy, heartposy[mychoice] - (4 * scale), neolerpstrength);
    }
}
