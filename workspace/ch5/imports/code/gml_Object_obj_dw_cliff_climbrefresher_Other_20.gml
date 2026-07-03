global.plot = max(global.plot, 306);

if (monologuecon >= 0 && monologuecon < array_length(susie_monologue))
{
    var monologue = susie_monologue[monologuecon];
    scr_speaker(monologue[1]);
    msgset(0, monologue[0]);
    last_monologue = monologuecon;
    waiting_next_monologue = monologuecon < (array_length(susie_monologue) - 1);
    monologuecon = -1;
    
    if (i_ex(monologue_writer))
        instance_destroy(monologue_writer);
    
    monologue_writer = instance_create(x, y, obj_writer);
    monologue_writer.depth = 3000;
    // monologue_writer.originalcharline = 16;
    // monologue_writer.charline = 16;
    monologue_writer.originalcharline = 28;
    monologue_writer.charline = 28;
    monologue_writer.skippable = false;
    monologue_writer.disablebutton1 = true;
}
