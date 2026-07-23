function scr_windowcaption(arg0)
{
    if (global.tempflag[10] != 1 && global.chapter == 1)
        window_set_caption(arg0);
    else
        window_set_caption("DELTARUNE Chapter " + string(global.chapter));
}
