if (instance_exists(obj_climb_kris))
{
    if (i_ex(monologue_writer))
    {
        scr_speaker(susie_monologue[last_monologue][1]);
        // monologue_writer.originalcharline = 16;
        // monologue_writer.charline = 16;
        monologue_writer.originalcharline = 28;
        monologue_writer.charline = 28;
        monologue_writer.writingx = camerax() + 40;
        monologue_writer.writingy = cameray() + 200;
    }
}
else if (i_ex(monologue_writer))
{
    monologue_writer.writingx = camerax() + 40;
    
    if (global.interact == 0 && !obj_mainchara.cutscene)
    {
        scr_speaker(susie_monologue[last_monologue][1]);
        // monologue_writer.originalcharline = 16;
        // monologue_writer.charline = 16;
        monologue_writer.originalcharline = 28;
        monologue_writer.charline = 28;
        monologue_writer.writingy = min(room_height - 280, obj_mainchara.y - 2);
    }
    else if (!obj_mainchara.cutscene)
    {
        monologue_writer.writingy = cameray() + 200;
    }
    else
    {
    }
}

if (monocon == 0)
{
    if (i_ex(monologue_writer))
    {
        monocon = 1;
        monotime = 0;
    }
}

if (monocon == 1)
{
    if (i_ex(monologue_writer))
    {
        if (monologue_writer.halt > 0)
        {
            monotime++;
            var max_timer = (global.lang == "ja") ? 100 : 70;
            
            if (!i_ex(obj_climb_kris) && global.interact > 0)
                monotime--;
            
            if (monotime >= max_timer)
            {
                with (obj_writer)
                    forcebutton1 = 1;
                
                monotime = 0;
                monocon = 0;
                monologue_writer.halt = 0;
                monodelaytimer = susie_monologue[last_monologue][2];
            }
        }
    }
}

if (waiting_next_monologue && !instance_exists(monologue_writer) && monodelaytimer <= 0)
{
    monodelaytimer = susie_monologue[last_monologue][2];
    monocon = 0;
}

if ((!i_ex(obj_climb_kris) && global.interact > 0) || scr_trigcheck("dont_advance_monologue"))
    exit;

with (obj_cliff_crater)
{
    if (con > 0)
        exit;
}

if (monodelaytimer > 0 && !instance_exists(monologue_writer))
{
    monodelaytimer--;
    
    if (monodelaytimer == 0)
    {
        monologuecon = last_monologue + 1;
        event_user(10);
    }
}
