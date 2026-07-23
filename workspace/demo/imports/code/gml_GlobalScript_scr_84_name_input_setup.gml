function scr_84_name_input_setup()
{
    var menu = 0;
    var xoff = 0;
    var yoff = 0;
    var xstep = 0;
    var ystep = 0;
    
    if (LANGSUBTYPE == 0)
    {
        xoff = 68;
        yoff = 70;
        xstep = 20;
        ystep = 20;
        PLAYERNAMEY = 40;
        menu[0] = "ABCDEFGHIJ";
        menu[1] = "KLMNOPQRST";
        menu[2] = "UVWXYZ < <";
        CURX = 0;
        CURY = 0;
    }
    else if (LANGSUBTYPE == 1)
    {
        xoff = 28;
        yoff = 80;
        xstep = 16;
        ystep = 15;
        PLAYERNAMEY = 60;
        menu[0] = "あいうえお　まみむめも　ぁぃぅぇぉ";
        menu[1] = "かきくけこ　や　ゆ　よ　がぎぐげご";
        menu[2] = "さしすせそ　らりるれろ　ざじずぜぞ";
        menu[3] = "たちつてと　わをんー　　だぢづでど";
        menu[4] = "なにぬねの　ゃゅょっゎ　ばびぶべぼ";
        menu[5] = "はひふへほ　　　　　　　ぱぴぷぺぽ";
        menu[6] = ">> << >> << >> <<";
        menu[7] = ">>>> <<<>>>> <<<<";
    }
    else if (LANGSUBTYPE == 2)
    {
        xoff = 28;
        yoff = 80;
        xstep = 16;
        ystep = 15;
        PLAYERNAMEY = 60;
        menu[0] = "アイウエオ　マミムメモ　ァィゥェォ";
        menu[1] = "カキクケコ　ヤ　ユ　ヨ　ガギグゲゴ";
        menu[2] = "サシスセソ　ラリルレロ　ザジズゼゾ";
        menu[3] = "タチツテト　ワヲンー　　ダヂヅデド";
        menu[4] = "ナニヌネノ　ャュョッヮ　バビブベボ";
        menu[5] = "ハヒフヘホ　　　　　　　パピプペポ";
        menu[6] = ">> << >> << >> <<";
        menu[7] = ">>>> <<<>>>> <<<<";
    }
    else if (LANGSUBTYPE == 3)
    {
        xoff = 28;
        yoff = 80;
        xstep = 32;
        ystep = 15;
        PLAYERNAMEY = 60;
        menu[0] = "ABCDEFGHI";
        menu[1] = "JKLMNOPQR";
        menu[2] = "STUVWXYZ ";
        menu[3] = "         ";
        menu[4] = "         ";
        menu[5] = "         ";
        menu[6] = "> <> <> <";
        menu[7] = ">> <>> <<";
    }
    
    YMAX = array_length_1d(menu) - 1;
    
    for (j = 0; j <= YMAX; j += 1)
    {
        var str = menu[j];
        XMAX = string_length(str) - 1;
        
        for (i = 0; i <= XMAX; i += 1)
        {
            NAME[i][j] = string_char_at(str, i + 1);
            NAMEX[i][j] = xoff + (i * xstep);
            NAMEY[i][j] = yoff + (j * ystep);
        }
    }
    
    if (LANGSUBTYPE == 0)
    {
        NAME[6][2] = "(B)BACK";
        NAME[8][2] = "(E)END";
    }
    else if (LANGSUBTYPE == 1 || LANGSUBTYPE == 2)
    {
        NAME[2][6] = "(1)ひらがな";
        NAMEX[2][6] = (xoff + 32) - 20;
        NAMEY[2][6] = yoff + 90 + 8;
        NAME[8][6] = "(2)カタカナ";
        NAMEX[8][6] = (xoff + 128) - 24;
        NAMEY[8][6] = yoff + 90 + 8;
        NAME[14][6] = "(3)アルファベット";
        NAMEX[14][6] = (xoff + 224) - 40;
        NAMEY[14][6] = yoff + 90 + 8;
        NAME[4][7] = "(B)さくじょ";
        NAMEX[4][7] = (xoff + 64) - 8;
        NAMEY[4][7] = yoff + 105 + 16;
        NAME[12][7] = "(E)けってい";
        NAMEX[12][7] = (xoff + 180) - 32;
        NAMEY[12][7] = yoff + 105 + 16;
        
        if (LANGSUBTYPE == 1)
        {
            CURX = 2;
            CURY = 6;
        }
        else
        {
            CURX = 8;
            CURY = 6;
        }
    }
    else if (LANGSUBTYPE == 3)
    {
        NAME[1][6] = "(1)ひらがな";
        NAMEX[1][6] = (xoff + 32) - 20;
        NAMEY[1][6] = yoff + 90 + 8;
        NAME[4][6] = "(2)カタカナ";
        NAMEX[4][6] = (xoff + 128) - 24;
        NAMEY[4][6] = yoff + 90 + 8;
        NAME[7][6] = "(3)アルファベット";
        NAMEX[7][6] = (xoff + 224) - 40;
        NAMEY[7][6] = yoff + 90 + 8;
        NAME[2][7] = "(B)さくじょ";
        NAMEX[2][7] = (xoff + 64) - 8;
        NAMEY[2][7] = yoff + 105 + 16;
        NAME[6][7] = "(E)けってい";
        NAMEX[6][7] = (xoff + 180) - 32;
        NAMEY[6][7] = yoff + 105 + 16;
        CURX = 7;
        CURY = 6;
    }
    
    HEARTX = (NAMEX[CURX][CURY] + (string_width(NAME[CURX][CURY]) / 2)) - 10;
    HEARTY = NAMEY[CURX][CURY];
}
