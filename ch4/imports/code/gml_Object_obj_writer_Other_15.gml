if (formatted == 0)
{
    length = string_length(mystring);
    charpos = -1;
    remspace = -1;
    remchar = -1;
    linecount = 0;
    stringmax = 0;
    aster = 0;
    
    for (i = 0; i < (length + 1); i += 1)
    {
        skip = 0;
        thischar = string_char_at(mystring, i);
        
        if (thischar == "`")
        {
            i++;
        }
        else if (thischar == "/" || thischar == "%")
        {
            if (charpos > -1)
                charpos -= 1;
        }
        else if (thischar == "^")
        {
            if (charpos > -1)
                charpos -= 2;
        }
        else if (thischar == "\\")
        {
            if (charpos > -1)
                charpos -= 3;
            
            if (dialoguer == 1)
            {
                nextchar = string_char_at(mystring, i + 1);
                nextchar2 = string_char_at(mystring, i + 2);
                
                if (nextchar == "E")
                {
                    __nextface = ord(nextchar2);
                    
                    if (__nextface >= 48 && __nextface <= 57)
                        global.fe = real(nextchar2);
                    else if (__nextface >= 65 && __nextface <= 90)
                        global.fe = __nextface - 55;
                    else if (__nextface >= 97 && __nextface <= 122)
                        global.fe = __nextface - 61;
                }
                
                if (nextchar == "F")
                {
                    if (nextchar2 == "0")
                        global.fc = 0;
                    
                    if (nextchar2 == "S")
                        global.fc = 1;
                    
                    if (nextchar2 == "R")
                        global.fc = 2;
                    
                    if (nextchar2 == "N")
                        global.fc = 3;
                    
                    if (nextchar2 == "T")
                        global.fc = 4;
                    
                    if (nextchar2 == "L")
                        global.fc = 5;
                    
                    if (nextchar2 == "s")
                        global.fc = 6;
                    
                    if (nextchar2 == "U")
                        global.fc = 9;
                    
                    if (nextchar2 == "A")
                        global.fc = 10;
                    
                    if (nextchar2 == "a")
                        global.fc = 11;
                    
                    if (nextchar2 == "B")
                        global.fc = 12;
                    
                    if (nextchar2 == "r")
                        global.fc = 15;
                    
                    if (nextchar2 == "u")
                        global.fc = 18;
                    
                    if (nextchar2 == "K")
                        global.fc = 20;
                    
                    if (nextchar2 == "Q")
                        global.fc = 21;
                    
                    if (global.fc == 0)
                    {
                        charline = originalcharline;
                        writingx = x;
                    }
                    else
                    {
                        charline = 26;
                        writingx = x + (58 * f);
                        
                        if (global.lang == "ja")
                            writingx -= 8;
                    }
                }
                
                if (nextchar == "m")
                    drawaster = 0;
                
                if (nextchar == "s")
                {
                    if (nextchar2 == "0")
                        skippable = 0;
                }
            }
        }
        else if (thischar == "&" || thischar == "\n")
        {
            if (charpos > stringmax)
                stringmax = charpos;
            
            remspace = -1;
            charpos = 0;
            linecount += 1;
            skip = 1;
            nextchar = string_char_at(mystring, i + 1);
            
            if (aster == 1 && autoaster == 1 && nextchar != "*" && global.lang != "ja")
            {
                charpos = 2;
                length += 2;
                mystring = string_insert("||", mystring, i + 1);
                i += 2;
            }
        }
        
        if (skip == 0)
        {
            if (thischar == " ")
            {
                remspace = i;
                remchar = charpos;
            }
            
            if (thischar == "*")
                aster = 1;
            
            if (charpos >= charline)
            {
                if (remspace > 2)
                {
                    mystring = string_delete(mystring, remspace, 1);
                    mystring = string_insert("&", mystring, remspace);
                    i = remspace + 1;
                    
                    if (remchar > stringmax)
                        stringmax = remchar;
                    
                    remspace = -1;
                    charpos = 1;
                    linecount += 1;
                    scr_asterskip();
                }
                else
                {
                    if (charpos > stringmax)
                        stringmax = charpos;
                    
                    mystring = string_insert("&", mystring, i);
                    length += 1;
                    charpos = 1;
                    remspace = -1;
                    linecount += 1;
                    i += 1;
                    scr_asterskip();
                }
            }
            else
            {
                // charpos += 1;
                if (ord(thischar) > 505 || ord(thischar) == 183)
                    charpos += 1.75;
                else
                    charpos += 1;
                //
            }
        }
    }
    
    if (autocenter == 1)
    {
        x = ((camerax() + (camerawidth() / 2)) - ((stringmax * hspace) / 2)) + 5;
        y = (cameray() + (cameraheight() / 2)) - ((writingy + ((linecount + 1) * vspace)) / 2) - 10;
    }
    
    if (charpos > stringmax)
        stringmax = charpos;
    
    formatted = 1;
}
