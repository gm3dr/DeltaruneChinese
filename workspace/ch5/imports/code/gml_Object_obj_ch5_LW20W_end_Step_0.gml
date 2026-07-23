aberration = 0.34;
spd = scr_wave(0, 0.75, 4, 0);
time += spd;
alpha = scr_wave(0, 1, 4, 0);

if (con == 0)
{
    timer++;
    
    if (timer == 1)
        snd_loop(snd_next);
    
    if (timer == 151)
    {
        timer = 0;
        con = 1;
    }
}

if (con == 1)
{
    timer++;
    var rate = 1/3;
    var sidebpause = 4;
    var rate2 = 1.4;
    var wordbreak = 15;
    var wordcount = 22;
    
    for (var i = 0; i < (wordbreak + 1); i++)
    {
        if (timer == gettimer((i + 1) * rate))
            index++;
    }
    
    for (var i = wordbreak; i < wordcount; i++)
    {
        if (timer == gettimer((i * rate * rate2) + sidebpause))
            index++;
    }
    
    var endpause = 10;
    
    if (scr_debug())
    {
        if (timer == gettimer((21 * rate * rate2) + sidebpause + endpause))
            scr_debug_print("ten seconds left");
    }
    
    if (timer >= gettimer((21 * rate * rate2) + sidebpause + endpause))
    {
        if (button1_h() || button2_h() || button3_h())
            doend();
    }
    
    if (timer >= gettimer((21 * rate * rate2) + sidebpause + endpause + 10))
        doend();
}
