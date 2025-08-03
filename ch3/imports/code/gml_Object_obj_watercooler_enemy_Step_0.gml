if (_init == false)
{
    if (global.encounterno == 140)
    {
        amimoonwarmer = true;
        global.monstername[myself] = stringset("Moonwarmer");
    }
    
    _init = true;
}

if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0)
    {
        scr_randomtarget();
        
        if (myattackchoice == 0)
            myattackchoice = 1;
        else
            myattackchoice = 0;
        
        CroakOnX = false;
        presscount = 0;
        presstimer = 0;
        startcroaktimer = false;
        
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        
        global.typer = 50;
        rr++;
        
        if (amimoonwarmer == false)
        {
            var random_vowel = choose("叭", "哔", "卟", "呗", "啵"); // var random_vowel = choose("a", "e", "i", "o", "u", "u", "oo");
            if (global.lang == "ja")
                random_vowel = choose("パ", "ピ", "プ", "ぺ");
            
            if (rr == 1)
                msgsetloc(0, "Buble", "obj_watercooler_enemy_slash_Step_0_gml_37_0");
            else
                msgsetsubloc(0, "B~1b~2e", random_vowel, choose(/*"i", "l"*/"卟", "啵"), "obj_watercooler_enemy_slash_Step_0_gml_38_0");
        }
        else if (rr == 1)
        {
            msgsetloc(0, "Moon", "obj_watercooler_enemy_slash_Step_0_gml_42_0");
        }
        else
        {
            msgset(0, choose("N", "M", "M") + choose("o", "oo", "a", "o", "oo") + choose("n", "m", "no", "mo", "n", "m"));
        }
        
        scr_enemyblcon(x - 10, y + 60, 10);
        talked = 1;
        talktimer = 0;
        rtimer = 0;
    }
    
    if (talked == 1 && scr_isphase("enemytalk"))
        scr_blconskip(15);
    
    if (global.mnfight == 1.5)
    {
        if (!instance_exists(obj_growtangle))
            instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 170, obj_growtangle);
        
        if (amimoonwarmer == false)
            instance_create(obj_growtangle.x - 10, obj_growtangle.y + 18, obj_heartmarker);
        
        if (!instance_exists(obj_moveheart))
            scr_moveheart();
        
        with (obj_heartmarker)
            instance_destroy();
        
        global.mnfight = 2;
        scr_turntimer(200);
    }
    
    if (scr_isphase("bullets") && attacked == 0)
    {
        rtimer += 1;
        
        if (rtimer == 12)
        {
            if (amimoonwarmer == false)
            {
                global.monsterattackname[myself] = "Rain";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 135;
                dc.special = 0;
                
                if (turns > 1 && (turns % 2) == 0)
                    dc.special = 1;
                else if (turns > 1)
                    dc.special = 2;
            }
            else
            {
                global.monsterattackname[myself] = "Moon";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 69;
                dc.special = 0;
            }
            
            scr_turntimer(140);
            attackanim = true;
            turns += 1;
            noballoon = false;
            bet = false;
            fixedbet = false;
            cheat = false;
            global.typer = 6;
            global.fc = 0;
            rr = choose(0, 1, 2, 3, 4);
            
            if (scr_messagepriority(random(2)))
            {
                if (amimoonwarmer == false)
                {
                    if (rr == 0)
                        global.battlemsg[0] = stringsetloc("* The watercooler shows no mercy.", "obj_watercooler_enemy_slash_Step_0_gml_113_0");
                    
                    if (rr == 1)
                        global.battlemsg[0] = stringsetloc("* The watercooler doesn't do anything in particular.", "obj_watercooler_enemy_slash_Step_0_gml_114_0");
                    
                    if (rr == 2)
                        global.battlemsg[0] = stringsetloc("* The watercooler leaves an icy silence.", "obj_watercooler_enemy_slash_Step_0_gml_115_0");
                    
                    if (rr == 3)
                        global.battlemsg[0] = stringsetloc("* The watercooler cools water, coolly.", "obj_watercooler_enemy_slash_Step_0_gml_116_0");
                }
                else
                {
                    if (rr == 0)
                        global.battlemsg[0] = stringsetloc("* The moonwarmer shows no mercy.", "obj_watercooler_enemy_slash_Step_0_gml_120_0");
                    
                    if (rr == 1)
                        global.battlemsg[0] = stringsetloc("* The moonwarmer doesn't do anything in particular.", "obj_watercooler_enemy_slash_Step_0_gml_121_0");
                    
                    if (rr == 2)
                        global.battlemsg[0] = stringsetloc("* The moonwarmer leaves a hot silence.", "obj_watercooler_enemy_slash_Step_0_gml_122_0");
                    
                    if (rr == 3)
                        global.battlemsg[0] = stringsetloc("* The moonwarmer warms moons, warmly.", "obj_watercooler_enemy_slash_Step_0_gml_123_0");
                }
                
                if (irandom(100) < 3)
                    global.battlemsg[0] = stringsetloc("* Smells like the faucet.", "obj_watercooler_enemy_slash_Step_0_gml_125_0");
            }
            
            if (amimoonwarmer == false)
            {
                if (global.monsterstatus[myself] == 1 && scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* The watercooler's bubbles rest on the surface.", "obj_watercooler_enemy_slash_Step_0_gml_130_0");
                
                if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3) && scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* The watercooler looks like it needs a refill.", "obj_watercooler_enemy_slash_Step_0_gml_131_0");
                
                if (global.mercymod[myself] >= global.mercymax[myself] && scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* The watercooler's water blushes a cranberry pink.", "obj_watercooler_enemy_slash_Step_0_gml_132_0");
            }
            else
            {
                if (global.monsterstatus[myself] == 1 && scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* The moonwarmer's bubbles rest on the surface.", "obj_watercooler_enemy_slash_Step_0_gml_136_0");
                
                if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3) && scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* The moonwarmer looks like it needs a refill.", "obj_watercooler_enemy_slash_Step_0_gml_137_0");
                
                if (global.mercymod[myself] >= global.mercymax[myself] && scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* The moonwarmer's water blushes a cranberry pink.", "obj_watercooler_enemy_slash_Step_0_gml_138_0");
            }
            
            attacked = 1;
        }
    }
    
    if (global.mnfight == 2 && global.turntimer > 1)
    {
    }
}

if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        
        if (amimoonwarmer == false)
            msgsetloc(0, "* You CHECKed the watercooler...&* The water was confirmed to be \\cBcool\\c0./%", "obj_watercooler_enemy_slash_Step_0_gml_166_0");
        else
            msgsetloc(0, "* You CHECKed the moonwarmer...&* The warms was confirmed to be \\cYmoon\\c0./%", "obj_watercooler_enemy_slash_Step_0_gml_167_0");
        
        scr_battletext_default();
    }
    
    if (acting == 2 && actcon == 0)
    {
        global.flag[1119]++;
        
        if (global.flag[1119] == 1)
        {
            if (amimoonwarmer == false)
                msgsetloc(0, "* You begged for mercy...&* ... but the watercooler showed none./", "obj_watercooler_enemy_slash_Step_0_gml_178_0");
            else
                msgsetloc(0, "* You begged for mercy...&* ... but the moonwarmer showed none./", "obj_watercooler_enemy_slash_Step_0_gml_179_0");
            
            msgnextloc("* You thought of some better, different ACTs to try next, instead./%", "obj_watercooler_enemy_slash_Step_0_gml_180_0");
        }
        else if (global.flag[1119] == 2)
        {
            if (amimoonwarmer == false)
                msgsetloc(0, "* You begged for mercy...&* ... but the watercooler showed none./", "obj_watercooler_enemy_slash_Step_0_gml_184_0");
            else
                msgsetloc(0, "* You begged for mercy...&* ... but the moonwarmer showed none./", "obj_watercooler_enemy_slash_Step_0_gml_185_0");
            
            msgnextloc("* This is probably because your NAME isn't YELLOW./%", "obj_watercooler_enemy_slash_Step_0_gml_186_0");
        }
        else
        {
            msgsetloc(0, "* You begged for mercy...&* This doesn't do anything./%", "obj_watercooler_enemy_slash_Step_0_gml_190_0");
        }
        
        scr_battletext_default();
        global.canact[myself][2] = 1;
        global.actactor[myself][2] = 4;
        global.actname[myself][2] = stringsetloc("ActCool", "obj_watercooler_enemy_slash_Step_0_gml_207_0");
        
        if (amimoonwarmer)
            global.actname[myself][2] = stringsetloc("ActWarmer", "obj_watercooler_enemy_slash_Step_0_gml_208_0");
        
        global.actdesc[myself][2] = "";
        global.canact[myself][3] = 1;
        global.actactor[myself][3] = 1;
        global.actname[myself][3] = stringsetloc("Flirt", "obj_watercooler_enemy_slash_Step_0_gml_213_0");
        global.actdesc[myself][3] = "";
        scr_spellmenu_setup();
        acting = 0;
        actcon = 1;
    }
    
    if (acting == 3 && actcon == 0)
    {
        obj_herokris.x = x - 70;
        obj_herokris.y = y - 50;
        obj_herosusie.x = x - 130;
        obj_herosusie.y = y;
        obj_heroralsei.x = x - 80;
        obj_heroralsei.y = y + 50;
        scr_battle_sprite_set("kris", 4371, 0, true);
        scr_battle_sprite_set("susie", 4276, 0, true);
        scr_battle_sprite_set("ralsei", 4829, 0, true);
        msgsetloc(0, "* Everyone chatted around the watercooler./%", "obj_watercooler_enemy_slash_Step_0_gml_226_0");
        scr_battletext_default();
        acting = 3.1;
    }
    
    if (acting == 3.1 && actcon == 0 && !i_ex(obj_writer))
    {
        msgsetloc(0, "* The watercooler felt included!/%", "obj_watercooler_enemy_slash_Step_0_gml_234_0");
        acting = 3.2;
        scr_mercyadd(myself, 25);
    }
    
    if (acting == 3.2 && actcon == 0 && !i_ex(obj_writer))
    {
        alarm[5] = 1;
        acting = 0;
        obj_herokris.x = obj_herokris.xstart;
        obj_herokris.y = obj_herokris.ystart;
        obj_herosusie.x = obj_herosusie.xstart;
        obj_herosusie.y = obj_herosusie.ystart;
        obj_heroralsei.x = obj_heroralsei.xstart;
        obj_heroralsei.y = obj_heroralsei.ystart;
        scr_battle_sprite_reset("kris");
        scr_battle_sprite_reset("susie");
        scr_battle_sprite_reset("ralsei");
        
        with (obj_heroparent)
            thissprite = idlesprite;
    }
    
    if (acting == 4 && actcon == 0)
    {
        var rand = choose(0, 1, 2);
        
        if (room == room_dw_teevie_watercooler || room == room_dw_teevie_large_02 || room == room_dw_b3bs_zapper_b)
            global.flag[1144] = 1;
        
        if (amimoonwarmer == false)
        {
            if (rand == 0)
                msgsetloc(0, "* You told the watercooler it should actually be called a watercoolest./%", "obj_watercooler_enemy_slash_Step_0_gml_264_0");
            
            if (rand == 1)
                msgsetloc(0, "* You took a slow sip of water and then asked if it cooled it itself./%", "obj_watercooler_enemy_slash_Step_0_gml_265_0");
            
            if (rand == 2)
                msgsetsubloc(0, "* You asked the watercooler, ~1water~2 they doing later./%", "\"", "\"", "obj_watercooler_enemy_slash_Step_0_gml_266_0");
        }
        else
        {
            if (rand == 0)
                msgsetloc(0, "* You told the moonwarmer it should actually be called a moonwarmest...?/%", "obj_watercooler_enemy_slash_Step_0_gml_270_0");
            
            if (rand == 1)
                msgsetloc(0, "* You took a slow sip of warms and asked if it ever mooned...?/%", "obj_watercooler_enemy_slash_Step_0_gml_271_0");
            
            if (rand == 2)
                msgsetsubloc(0, "* You asked the moonwarmer,~1hotter~2they doing later...?/%", "\"", "\"", "obj_watercooler_enemy_slash_Step_0_gml_272_0");
        }
        
        scr_battletext_default();
        acting = 4.1;
        
        if (global.hp[2] < 1 && global.hp[3] < 1)
            scr_mercyadd(myself, 14);
        else
            scr_mercyadd(myself, 10);
    }
    
    if (acting == 4.1 && actcon == 0 && !i_ex(obj_writer))
    {
        msgsetloc(0, "* The water turns pink for a second./%", "obj_watercooler_enemy_slash_Step_0_gml_285_0");
        scr_battletext_default();
        snd_play(snd_bell_bounce_short);
        pinkflashtimer = 30;
        scr_oflash();
        acting = 0;
        actcon = 1;
    }
    
    if (actingsus == 1 && actconsus == 1)
    {
        var _text = "_";
        var rand = choose(0, 1, 2);
        
        if (rand == 0)
            _text = stringsetloc("* Susie face-crushes a cup!!", "obj_watercooler_enemy_slash_Step_0_gml_313_0");
        
        if (rand == 1)
            _text = stringsetloc("* Susie puts cups on Ralsei!", "obj_watercooler_enemy_slash_Step_0_gml_314_0");
        
        if (rand == 2)
            _text = stringsetloc("* Susie puts cups on Kris's eyes!", "obj_watercooler_enemy_slash_Step_0_gml_315_0");
        
        if (simultotal == 1)
        {
            msgset(0, _text + "/%");
            scr_battletext_default();
            
            with (obj_face)
                instance_destroy();
            
            actconsus = 20;
        }
        else
        {
            msgset(0, _text);
            scr_simultext("susie");
            
            if (simulordersus == 0)
                actconsus = 20;
            else
                actconsus = 0;
        }
        
        actingsus = 0;
        
        if (global.hp[1] < 1 && global.hp[3] < 1)
            scr_mercyadd(myself, 10);
        else
            scr_mercyadd(myself, 6);
    }
    
    if (actingral == 1 && actconral == 1)
    {
        var _text = "_";
        var rand = choose(0, 1, 2);
        
        if (rand == 0)
            _text = stringsetloc("* Ralsei absorbs trace calcium!", "obj_watercooler_enemy_slash_Step_0_gml_341_0");
        
        if (rand == 1)
            _text = stringsetloc("* Ralsei cleans Susie's spill!!", "obj_watercooler_enemy_slash_Step_0_gml_342_0");
        
        if (rand == 2)
            _text = stringsetloc("* Ralsei labels everyone's cups!!", "obj_watercooler_enemy_slash_Step_0_gml_343_0");
        
        if (simultotal == 1)
        {
            msgset(0, _text + "/%");
            scr_battletext_default();
            
            with (obj_face)
                instance_destroy();
            
            actconral = 20;
        }
        else
        {
            msgset(0, _text);
            scr_simultext("ralsei");
            
            if (simulorderral == 0)
                actconral = 20;
            else
                actconral = 0;
        }
        
        actingral = 0;
        
        if (global.hp[1] < 1 && global.hp[2] < 1)
            scr_mercyadd(myself, 10);
        else
            scr_mercyadd(myself, 6);
    }
    
    if (actcon == 20 || actconsus == 20 || actconral == 20)
    {
        if (scr_terminate_writer())
        {
            actconsus = -1;
            actconral = -1;
            actcon = 1;
        }
    }
    
    if (actcon == 1 && !instance_exists(obj_writer))
        scr_nextact();
}

if (state == 3)
{
    scr_enemyhurt_tired_after_damage(0.5);
    scr_enemy_hurt();
}

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
