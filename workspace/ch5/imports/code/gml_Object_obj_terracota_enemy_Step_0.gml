if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0)
    {
        scr_randomtarget();
        setbattlemsg = false;
        myattackchoice = 0;
        
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        
        global.typer = 50;
        rr = choose(0, 1, 2);
        
        if (global.flag[1750] == 0)
        {
            msgsetloc(0, "PROTECT&..^1. KING", "obj_terracota_enemy_slash_Step_0_gml_17_0");
            global.flag[1750] = 1;
        }
        else
        {
            if (rr == 0)
                msgsetloc(0, "GOLDHAIR&GIVE WATER&..^1. FRAIND", "obj_terracota_enemy_slash_Step_0_gml_22_0");
            
            if (rr == 1)
                msgsetloc(0, "HUMAN...&DIGGING&..^1. &NO GOOD", "obj_terracota_enemy_slash_Step_0_gml_23_0");
            
            if (rr == 2)
                msgsetloc(0, "LITTLE&DIRT&NEVER&HURT", "obj_terracota_enemy_slash_Step_0_gml_24_0");
        }
        
        scr_enemyblcon(x - 20, y + 80, 10);
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
        
        if (!instance_exists(obj_moveheart))
            scr_moveheart();
        
        global.mnfight = 2;
        scr_turntimer(90);
    }
    
    if (scr_isphase("bullets") && attacked == 0)
    {
        rtimer += 1;
        
        if (rtimer == 12)
        {
            if (myattackchoice == 0)
            {
                global.monsterattackname[myself] = "terracota pots";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 150;
                dc.special = global.flag[1462];
                
                if (global.flag[1462] == 0)
                    scr_turntimer(190);
                
                if (global.flag[1462] == 1)
                    scr_turntimer(270);
                
                if (global.flag[1462] == 2)
                    scr_turntimer(240);
                
                if (global.flag[1462] == 3)
                    scr_turntimer(360);
                
                global.flag[1462]++;
                
                if (global.flag[1462] > 3)
                    global.flag[1462] = 3;
            }
            
            if (wateringcan)
            {
                inst = instance_create(x, y, obj_terracota_wateringcan);
                
                if (slowercan)
                    inst.slower = true;
                
                slowercan = false;
                wateringcan = false;
            }
            
            turns += 1;
            attacked = 1;
        }
    }
    
    if (global.mnfight == 2 && global.turntimer <= 2 && bonsaicon == 1)
    {
        msgsetloc(0, "* The enemy bloomed!", "obj_terracota_enemy_slash_Step_0_gml_82_0");
        scr_battletext_default();
        snd_stop(snd_bell_bounce_short);
        
        with (obj_pine_tree_telegraph)
            instance_destroy();
        
        if (i_ex(obj_growtangle))
        {
            snd_play_x(snd_ghostappear, 1, 1.1);
            bg = instance_create(obj_growtangle.x - 74, obj_growtangle.y - 74, obj_marker);
            bg.sprite_index = spr_terracota_bg;
            bg.image_xscale = 2;
            bg.image_yscale = 2;
            bg.image_alpha = 0;
            bg.depth = obj_growtangle.depth - 1;
            
            with (bg)
                scr_lerpvar("image_alpha", 0, 1, 6);
        }
        
        global.turntimer = 90;
        bonsaicon = 2;
        bonsaitimer = 0;
        headballooncon = 1;
    }
    
    if (bonsaicon == 2)
    {
        with (obj_terracota_leaf_bullet)
        {
            mask_index = spr_nothing;
            image_alpha -= 0.1;
            
            if (image_alpha <= 0)
                instance_destroy();
        }
        
        with (obj_terracota_leaf_bullet2)
        {
            mask_index = spr_nothing;
            image_alpha -= 0.1;
            
            if (image_alpha <= 0)
                instance_destroy();
        }
        
        with (obj_terracota_flower_bullet)
        {
            mask_index = spr_nothing;
            image_alpha -= 0.1;
            
            if (image_alpha <= 0)
                instance_destroy();
        }
        
        with (obj_terracota_split_flower_bullet)
        {
            mask_index = spr_nothing;
            image_alpha -= 0.1;
            
            if (image_alpha <= 0)
                instance_destroy();
        }
        
        with (obj_terracota_wateringcan_bullet)
        {
            mask_index = spr_nothing;
            image_alpha -= 0.1;
            
            if (image_alpha <= 0)
                instance_destroy();
        }
        
        with (obj_terracota_pine_bullet)
        {
            mask_index = spr_nothing;
            image_alpha -= 0.1;
            
            if (image_alpha <= 0)
                instance_destroy();
        }
        
        with (obj_terracota_wateringcan)
        {
            mask_index = spr_nothing;
            image_alpha -= 0.2;
            
            if (image_alpha <= 0)
                instance_destroy();
            
            timer = 0;
        }
    }
    
    if (global.mnfight == 2 && global.turntimer <= 1)
    {
        // if (setbattlemsg == false)
        // {
            if (bonsaicon == 2)
            {
                scr_recruit();
                event_user(10);
                
                with (bg)
                    instance_destroy();
                
                with (obj_writer)
                    instance_destroy();
                
                bonsaicon = 0;
                scr_wincombat();
                snd_stop(snd_bell_bounce_short);
                
                with (obj_pine_tree_telegraph)
                    instance_destroy();
                
                with (obj_collidebullet)
                    instance_destroy();
                
                with (obj_bulletparent)
                    instance_destroy();
                
                with (obj_bulletgenparent)
                    instance_destroy();
                
                with (obj_darkener)
                    darken = 0;
                
                with (obj_heart)
                {
                    instance_create(x, y, obj_returnheart);
                    instance_destroy();
                }
                //
                exit;
                //
            }
        //    
        if (setbattlemsg == false)
        {
        //
            global.typer = 6;
            global.fc = 0;
            rr = choose(0, 1, 2, 3);
            
            if (scr_messagepriority(random(2)))
            {
                var substring = string(myself);
                
                if (rr == 0)
                    global.battlemsg[0] = stringsetsubloc("* Terakota thunders with each step.", "obj_terracota_enemy_slash_Step_0_gml_183_0");
                
                if (rr == 1)
                    global.battlemsg[0] = stringsetsubloc("* Terakota offers a battle prayer to the Great Pumpkin.", "obj_terracota_enemy_slash_Step_0_gml_184_0");
                
                if (rr == 2)
                    global.battlemsg[0] = stringsetsubloc("* Terakota attempts to dig bedrock.", "obj_terracota_enemy_slash_Step_0_gml_185_0");
                
                if (rr == 3)
                    global.battlemsg[0] = stringsetsubloc("* Birds (from the song Weird Birds) land on Terakota peacefully.", "obj_terracota_enemy_slash_Step_0_gml_186_0");
                
                if (irandom(100) < 3)
                    global.battlemsg[0] = stringsetsubloc("* Smells like fresh soil.", "obj_terracota_enemy_slash_Step_0_gml_187_0");
            }
            
            if (global.monsterstatus[myself] == 1)
            {
                if (scr_messagepriority(100))
                    global.battlemsg[0] = stringsetloc("* Terakota's eyes (?) blink slowly.", "obj_terracota_enemy_slash_Step_0_gml_198_0");
            }
            
            if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 4))
            {
                if (scr_messagepriority(101))
                {
                    var substring = string(myself);
                    global.battlemsg[0] = stringsetloc("* Terakota's armor pH is out of wack.", "obj_terracota_enemy_slash_Step_0_gml_193_0");
                }
            }
            
            setbattlemsg = true;
            attackalreadyseenbyplayer = true;
        }
    }
}

if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        msgsetloc(0, "* TERAKOTA - A thick exterior^1. But it's what's inside that counts./%", "obj_terracota_enemy_slash_Step_0_gml_219_0");
        scr_battletext_default();
    }
    
    if (acting == 2 && actcon == 0)
        acting = 1.1;
    
    if (acting == 3 && actcon == 0)
    {
        acting = 1.1;
        slowercan = true;
    }
    
    if (acting == 1.1)
    {
        msgsetloc(0, "* Use watering can droplets to turn all pots green!/%", "obj_terracota_enemy_slash_Step_0_gml_236_0");
        scr_battletext_default();
        wateringcan = true;
        acting = 0;
        actcon = 1;
    }
    
    if (actingsus == 1 && actconsus == 1)
    {
        var _rand = choose(0, 1, 2);
        
        if (_rand == 0)
            msgsetloc(0, "* Susie ate dirt unharmed!", "obj_terracota_enemy_slash_Step_0_gml_246_0");
        
        if (_rand == 1)
            msgsetloc(0, "* Susie lifted pots!", "obj_terracota_enemy_slash_Step_0_gml_247_0");
        
        if (_rand == 2)
            msgsetloc(0, "* Susie lifted weeds!", "obj_terracota_enemy_slash_Step_0_gml_248_0");
        
        scr_mercyadd(myself, 18);
        scr_simultext("susie");
        
        if (simulordersus == 0)
            actconsus = 20;
        else
            actconsus = 0;
        
        global.flag[1888] = 1;
    }
    
    if (actingral == 1 && actconral == 1)
    {
        var _rand = choose(0, 1, 2);
        
        if (_rand == 0)
            msgsetloc(0, "* Ralsei alters soil pH!", "obj_terracota_enemy_slash_Step_0_gml_258_0");
        
        if (_rand == 1)
            msgsetloc(0, "* Ralsei does the worm!", "obj_terracota_enemy_slash_Step_0_gml_259_0");
        
        if (_rand == 2)
            msgsetloc(0, "* Ralsei acts stone!", "obj_terracota_enemy_slash_Step_0_gml_260_0");
        
        scr_mercyadd(myself, 18);
        scr_simultext("ralsei");
        
        if (simulorderral == 0)
            actconral = 20;
        else
            actconral = 0;
        
        global.flag[1888] = 1;
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
