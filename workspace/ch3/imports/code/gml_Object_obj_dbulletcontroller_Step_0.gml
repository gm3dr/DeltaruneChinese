if (i_ex(obj_shadowman_enemy))
{
    for (var i = 0; i < instance_number(obj_shadowman_enemy); i += 1)
    {
        enemy[i] = instance_find(obj_shadowman_enemy, i);
        
        if (enemy[i].myattackchoice == 3)
        {
            instance_destroy();
            exit;
        }
    }
}

if (init == 0)
{
    sameattack = scr_monsterattacknamecount(global.monsterattackname[creator]);
    
    if (sameattack > 1)
    {
        if (creator == 2)
            sameattacker = sameattack - 1;
        else if (creator == 1)
            sameattacker = (sameattack == 3) ? creator : (global.monsterattackname[0] == global.monsterattackname[1]);
    }
    
    if (instance_exists(obj_growtangle))
    {
        miny = obj_growtangle.y - (obj_growtangle.sprite_height / 2);
        maxy = obj_growtangle.y + (obj_growtangle.sprite_height / 2);
        minx = obj_growtangle.x - (obj_growtangle.sprite_width / 2);
        maxx = obj_growtangle.x + (obj_growtangle.sprite_width / 2);
    }
    
    init = 1;
}

btimer += 1;

if (type == 0 && i_ex(obj_heart))
{
    if (btimer >= (timermax * ratio))
    {
        btimer = 0;
        var dir = 30 + random(120);
        radius = 140 + random(80);
        var xx = lengthdir_x(radius, dir);
        var yy = lengthdir_y(radius, dir);
        bm = instance_create(obj_heart.x + 8 + xx, obj_heart.y + 8 + yy, obj_dbullet_maker);
        bm.grazepoints = grazepoints;
        
        if (bm.y < (__view_get(e__VW.YView, 0) + 40))
            bm.y = __view_get(e__VW.YView, 0) + 40;
        
        bm.damage = damage;
        bm.target = target;
    }
}

if (type == 1)
{
    if (btimer >= (9 * ratio))
    {
        btimer = 0;
        radius = 140 + random(40);
        var yy = radius * side;
        var xx = -100 + random(200);
        num = choose(0, 1, 2, 3);
        
        if (num == 3)
            xx = -10 + random(20);
        
        d = instance_create(obj_heart.x + 8 + xx, obj_heart.y + 8 + yy, obj_dbullet_vert);
        d.damage = damage;
        d.target = target;
    }
}

if (type == 3)
{
    if (made == 0)
    {
        if (i_ex(creatorid))
        {
            with (creatorid)
                image_alpha = 0;
            
            var slasher = instance_create(creatorid.x, creatorid.y, obj_dknight_slasher);
            scr_bullet_inherit(slasher);
            slasher.timepoints = 2;
            slasher.grazepoints = 6;
        }
        
        made = 1;
    }
}
else if (type == 4 && (sameattack < 3 || creator < 2))
{
    if (btimer > 7)
    {
        btimer = 0;
        var xx = x - (made * 30);
        var yy = maxy;
        d = instance_create(xx, yy, obj_chainbullet);
        d.damage = damage;
        d.grazepoints = 4;
        d.direction = 90;
        d.childSpeed = 7;
        d.childgravity = 0.25;
        d.firingSpeed = 2;
        d.target = target;
        d.sprite_index = spr_diamondbullet_vert;
        made++;
    }
}
else if (type == 30)
{
    if (btimer >= (20 * ratio))
    {
        var xx = __view_get(e__VW.XView, 0) - 20;
        
        if (side == 1)
            xx = __view_get(e__VW.XView, 0) + 660;
        
        var yy = miny + random(maxy - miny);
        bul = instance_create(xx, yy, obj_clubsbullet);
        bul.speed = 12;
        bul.damage = damage;
        bul.target = target;
        bul.grazepoints = 4;
        
        if (side == 1)
        {
            bul.direction = 180;
            bul.image_angle = 180;
        }
        
        btimer = 0;
    }
}
else if (type == 31)
{
    if (btimer >= (30 * ratio))
    {
        btimer = 0;
        var dir;
        
        if (side == -1)
            dir = 225;
        
        if (side == 1)
            dir = 315;
        
        radius = 400;
        var xx = lengthdir_x(radius, dir);
        var yy = lengthdir_y(radius, dir);
        d = instance_create(obj_heart.x + 8 + xx, obj_heart.y + 8 + yy, obj_clubsbullet_dark);
        d.damage = damage;
        d.target = target;
        d.grazepoints = 4;
        d.direction = dir + 180;
        d.speed = 20;
        d.friction = 1;
        
        with (d)
            image_angle = direction;
        
        if (side == 1)
            side = -1;
        else
            side = 1;
    }
}
else if (type == 32)
{
    if (init == 1)
    {
        dd = 0;
        dd2 = 0;
        phase = 0;
        strikes = 0;
        
        if (special == 1)
            global.turntimer = 5400;
        
        var xx = obj_growtangle.x;
        var yy = obj_growtangle.y;
        d = instance_create(xx + 1, yy, obj_bulletparent);
        d.sprite_index = spr_tm_grid;
        d.image_angle = 45;
        d.image_blend = c_gray;
        d.element = 6;
        d.depth = obj_growtangle.depth - 1;
        
        for (var i = 0; i < 4; i++)
        {
            xx = obj_growtangle.x;
            yy = obj_growtangle.y;
            
            if (i == 0 || i == 3)
                yy += ((i == 0) ? -50 : 50);
            else
                xx += ((i == 1) ? -50 : 50);
            
            d = instance_create(xx, yy, obj_bulletparent);
            d.sprite_index = spr_tm_letters;
            d.image_speed = 0;
            d.image_index = i;
            d.element = 6;
            d.image_blend = c_gray;
            d.depth = obj_growtangle.depth - 1;
        }
        
        obj_growtangle.target_angle = 45;
        obj_growtangle.image_angle = 45;
        d = scr_bullet_create(x - 22, y - 6, obj_tm_quizzler);
        made++;
        d.depth = global.monsterinstance[creator].depth;
        d.controller = self;
        d.element = 6;
        d.dojo = special < -2;
        d.creator = creator;
        global.monsterinstance[creator].lastQuizLetter = -1;
        d.difficulty = difficulty;
        init = 2;
        global.turntimer += 120;
        btimer = 0;
    }
    
    var attacktimer = 90;
    
    if (difficulty > 0)
        attacktimer = (difficulty == 3) ? 40 : 60;
    
    var quizReady = !instance_exists(obj_tm_quizzler);
    
    if ((made == 4 || special < -2) && quizReady && btimer >= 0)
    {
        if (special == 1)
        {
            special = -2;
            btimer = -20;
        }
        else if (special == -2)
        {
            special = -1;
            difficulty++;
            dd = scr_dark_marker_animated(x + 80, y + 4, spr_tm_pleased_effect, 1);
            dd2 = scr_dark_marker(x + 74, y + 66, spr_cutscene_26_tasquemanager);
            var _maru = instance_create(x + (phase * 40), y + 175, obj_bulletparent);
            _maru.sprite_index = spr_tm_maru;
            _maru.image_xscale = 2;
            _maru.image_yscale = 2;
            _maru = instance_create(obj_growtangle.x, obj_growtangle.y, obj_tm_quiz_result);
            _maru.sprite_index = spr_tm_maru_big;
            _maru.image_xscale = 3;
            _maru.image_yscale = 3;
            _maru.depth = obj_heart.depth - 15;
            _maru.max_time = 45;
            dd.depth = dd2.depth - 1;
            
            with (obj_tasque_manager_enemy)
                visible = 0;
            
            snd_play(snd_coin);
            btimer = -45;
            phase++;
        }
        else if (special == -1)
        {
            if (i_ex(dd))
                instance_destroy(dd);
            
            if (i_ex(dd2))
                instance_destroy(dd2);
            
            made = 0;
            
            with (obj_tasque_manager_enemy)
                visible = 1;
            
            if (strikes == 3)
            {
                global.flag[36] = 1;
                global.flag[39] = 1;
                global.turntimer = 10;
                btimer = -40;
                obj_tasque_manager_enemy.hspeed = 10;
                exit;
            }
            
            if (phase == 3)
            {
                special = -5;
                global.flag[39] = 1;
                global.turntimer = 10;
                btimer = -40;
                obj_tasque_manager_enemy.hspeed = 10;
            }
            else
            {
                special = 1;
                btimer = attacktimer - 10;
            }
        }
        else if (special == -4 && global.encounterno == 89)
        {
            special = -3;
            btimer = -20;
        }
        else if (special == -3)
        {
            special = -1;
            made = 4;
            dd2 = scr_dark_marker(x, y, spr_tm_hurt);
            
            with (obj_tasque_manager_enemy)
                visible = 0;
            
            snd_play(snd_error);
            
            if (global.encounterno == 89)
            {
                var _batsu = instance_create(x + (strikes * 40), y + 215, obj_bulletparent);
                _batsu.sprite_index = spr_tm_batsu;
                _batsu.image_xscale = 2;
                _batsu.image_yscale = 2;
                _batsu.element = 6;
                strikes++;
                btimer = -45;
                _batsu = instance_create(obj_growtangle.x, obj_growtangle.y, obj_tm_quiz_result);
                _batsu.sprite_index = spr_tm_batsu_big;
                _batsu.image_xscale = 3;
                _batsu.image_yscale = 3;
                _batsu.depth = obj_heart.depth - 15;
                _batsu.max_time = 45;
            }
        }
    }
    else if (quizReady && btimer > attacktimer && special >= 0 && made < 4)
    {
        if (special == 1)
            made++;
        
        d = scr_bullet_create(x - 22, y - 6, obj_tm_quizzler);
        d.element = 6;
        d.creator = creator;
        d.controller = self;
        d.difficulty = difficulty;
        d.turnlength = 90;
        btimer = 0;
        
        if (special == 1)
            d.dojo = true;
    }
}
else if (type == 33)
{
    if (made == 0)
    {
        made = 1;
        tail = instance_create(obj_clubsenemy.x + 144, obj_clubsenemy.y + 125, obj_clovertail_intro);
        tail.damage = damage;
        tail.target = target;
    }
}
else if (type == 34)
{
    if (btimer >= (14 * (difficulty + 1)))
    {
        if (init == 1 || side == 1)
        {
            side = irandom(2);
            init = 2;
        }
        else
        {
            side = (side + irandom(1)) % 3;
        }
        
        snd_play_x(snd_spearappear, 1, 1.2);
        d = instance_create(x, y, obj_werewerewire_laserbullet);
        d.grazepoints = 4;
        d.damage = damage;
        d.target = target;
        d.attackdirection = side;
        btimer = 0;
    }
}
else if (type == 35)
{
    if (init == 1)
    {
        global.turntimer = 3600;
        difficulty = 0;
        var xx = obj_growtangle.x;
        var yy = obj_growtangle.y;
        d = instance_create(xx + 1, yy, obj_bulletparent);
        d.sprite_index = spr_tm_grid;
        d.image_angle = 45;
        d.image_blend = c_gray;
        d.depth = obj_growtangle.depth - 1;
        
        for (var i = 0; i < 4; i++)
        {
            xx = obj_growtangle.x;
            yy = obj_growtangle.y;
            
            if (i == 0 || i == 3)
                yy += ((i == 0) ? -50 : 50);
            else
                xx += ((i == 1) ? -50 : 50);
            
            d = instance_create(xx, yy, obj_bulletparent);
            d.sprite_index = spr_tm_letters;
            d.image_speed = 0;
            d.image_index = i;
            d.image_blend = c_gray;
            d.depth = obj_growtangle.depth - 1;
        }
        
        obj_growtangle.target_angle = 45;
        obj_growtangle.image_angle = 45;
        d = scr_bullet_create(x, y, obj_tm_quizzler);
        d.depth = global.monsterinstance[creator].depth;
        d.creator = creator;
        d.difficulty = difficulty;
        d.dojo = true;
        init = 2;
        global.turntimer += 120;
        btimer = 0;
    }
}
else if (type == 48)
{
    if (btimer >= 135 && !i_ex(obj_ch2_dojo_puzzlebullet_maker))
    {
        var xmod = 0;
        
        if (roundcount == 1)
            xmod = irandom(20) * choose(-1, 1);
        
        if (roundcount == 2)
            xmod = irandom(30) * choose(-1, 1);
        
        if (roundcount == 3)
            xmod = irandom(40) * choose(-1, 1);
        
        if (roundcount == 4)
            xmod = irandom(60) * choose(-1, 1);
        
        if (roundcount > 4)
            xmod = irandom(80) * choose(-1, 1);
        
        bm = instance_create(320 + xmod, 40, obj_ch2_dojo_puzzlebullet_maker);
        bm.grazepoints = grazepoints;
        bm.damage = 1;
        bm.target = target;
        
        switch (roundcount)
        {
            case 0:
                bm.times = 7;
                bm.timetarg = 18;
                bm.bulletspeed = 6;
                break;
            
            case 1:
                bm.times = 7;
                bm.timetarg = 15;
                bm.bulletspeed = 6;
                break;
            
            case 2:
                bm.times = 7;
                bm.timetarg = 13;
                bm.bulletspeed = 6;
                break;
            
            case 3:
                bm.times = 7;
                bm.timetarg = 11;
                bm.bulletspeed = 6;
                break;
            
            default:
                bm.times = 7;
                bm.timetarg = 10;
                bm.bulletspeed = 6;
                break;
        }
        
        btimer = 0;
        roundcount++;
    }
}

if (type == 49 && i_ex(obj_heart))
{
    if (btimer >= (timermax * ratio))
    {
        btimer = 0;
        var dir = 30 + random(120);
        radius = 140 + random(80);
        var xx = lengthdir_x(radius, dir);
        var yy = lengthdir_y(radius, dir);
        bm = instance_create(obj_heart.x + 8 + xx, obj_heart.y + 8 + yy, obj_dbullet_maker);
        bm.grazepoints = grazepoints;
        
        if (bm.y < (__view_get(e__VW.YView, 0) + 40))
            bm.y = __view_get(e__VW.YView, 0) + 40;
        
        bm.damage = damage;
        bm.target = target;
    }
}

if (type == 60)
{
}

if (type == 61)
{
    if (init == 1)
    {
        init = 2;
        special = irandom(1);
        
        if (sameattack > 1)
            btimer = (40 * ratio) - (sameattacker * 5);
        
        sax_animation = scr_enemy_animation(3847);
        
        with (obj_enemy_animation)
        {
            if (i_ex(obj_rouxls_ch3_enemy) && y < obj_rouxls_ch3_enemy.y)
                depth = obj_rouxls_ch3_enemy.depth + 1;
        }
    }
    
    if (btimer > (40 * ratio))
    {
        d = scr_childbullet(x + 22, y + 84, obj_shadowman_sax_attack);
        d.sax_animation = sax_animation;
        btimer = 0;
        
        if (sameattack > 1)
        {
            d.shootSpeed = 1;
            d.timer = d.shootSpeed;
            d.bulletCount = 5;
            d.attackWaitTime = 0.8;
            d.pathLifetime = 1.7;
            d.grow_Speed = 0.05;
            d.fadeSpeed = 0.2;
            btimer = 25;
            
            if (special == 0)
            {
                with (obj_dbulletcontroller)
                {
                    if (type == 61)
                        special = 1;
                }
                
                d = scr_childbullet(x + 22, y + 84, obj_shadowman_sax_attack);
                d.sax_animation = sax_animation;
                d.shootSpeed = 1;
                d.timer = d.shootSpeed;
                d.bulletCount = 5;
                d.attackWaitTime = 0.8;
                d.pathLifetime = 1.7;
                d.grow_Speed = 0.05;
                d.fadeSpeed = 0.2;
            }
            else
            {
                d = scr_childbullet(x + 22, y + 84, obj_shadowman_sax_attack);
                d.sax_animation = sax_animation;
                d.shootSpeed = 1;
                d.timer = d.shootSpeed;
                d.bulletCount = 5;
                d.attackWaitTime = 0.8;
                d.pathLifetime = 1.7;
                d.grow_Speed = 0.05;
                d.fadeSpeed = 0.2;
                
                with (obj_dbulletcontroller)
                {
                    if (type == 61)
                        special = 0;
                }
            }
        }
    }
}

if (type == 62)
{
    if (!made)
    {
        if (i_ex(creatorid))
        {
            creatorid.image_alpha = 0;
            var shadowman_tommygun_manager = instance_create(creatorid.x, creatorid.y, obj_shadowman_tommygun);
            scr_bullet_inherit(shadowman_tommygun_manager);
            shadowman_tommygun_manager.dir = sameattacker;
            shadowman_tommygun_manager.sameattacker = sameattacker;
            shadowman_tommygun_manager.sameattack = sameattack;
            shadowman_tommygun_manager.creatorid = creatorid;
            shadowman_tommygun_manager.depth = creatorid.depth;
        }
        
        made = true;
    }
}

if (type == 63)
{
    if (btimer >= (26 * ratio))
    {
        if (i_ex(obj_growtangle))
        {
            var ball = scr_fire_bullet(obj_growtangle.x + irandom_range(-40, 40), obj_growtangle.y - 120, 145, 270, 4, 3588);
            scr_bullet_inherit(ball);
        }
        
        btimer = 0;
    }
}

if (type == 64)
{
    var btimerthreshold = 60;
    
    with (obj_dbulletcontroller)
    {
        if (type == 146)
            btimerthreshold = 40;
    }
    
    with (obj_dbulletcontroller)
    {
        if (type == 147)
            btimerthreshold = 50;
    }
    
    if (init == 1)
    {
        global.turntimer += 30;
        
        with (obj_dbulletcontroller)
            ratio = 1;
        
        btimer = 0;
        init = 2;
        rate = 60;
    }
    else if (init == 2 && btimer >= rate)
    {
        inst = instance_create(x, y, obj_shutta_rotation_attack);
        inst.creator = creator;
        inst.creatorid = creatorid;
        inst.difficulty = difficulty;
        inst.made = made;
        made++;
        
        if (difficulty >= 3)
            btimer = 10;
        else
            init = 3;
    }
    
    if (btimer == 20 && made == 0 && scr_monsterpop() == 1)
    {
        with (creatorid)
        {
            global.typer = 50;
            var _choice = irandom(2);
            
            if (other.difficulty == 0)
                msgsetloc(0, "Aaannd&TURN!", "obj_dbulletcontroller_slash_Step_0_gml_631_0");
            else if (other.special == 2)
                msgsetloc(0, "Hold it&a sec!", "obj_dbulletcontroller_slash_Step_0_gml_650_0");
            else if (other.special == 1)
                msgsetloc(0, "A lil'&turn?", "obj_dbulletcontroller_slash_Step_0_gml_652_0");
            else
                msgsetloc(0, "Let's get that other side!", "obj_dbulletcontroller_slash_Step_0_gml_653_0");
            
            scr_enemyblcon(x + 30, y + 35, 13);
        }
    }
    
    if (btimer == 60)
    {
        with (obj_writer)
            instance_destroy();
    }
}

if (type == 65)
{
    if (!made)
    {
        if (i_ex(creatorid))
        {
            with (creatorid)
                image_alpha = 0;
            
            var pop = scr_monsterpop();
            var zapper_lasermanager = instance_create(creatorid.x - 18, creatorid.y - 28, obj_zapper_laser_manager);
            scr_bullet_inherit(zapper_lasermanager);
            zapper_lasermanager.sameattacker = sameattacker;
            zapper_lasermanager.creator = creator;
            zapper_lasermanager.depth -= creator;
            zapper_lasermanager.sameattack = sameattack;
            zapper_lasermanager.damage = 55;
            
            if (pop != sameattack)
                zapper_lasermanager.nuisance = true;
            
            with (zapper_lasermanager)
            {
                alarm[0] = 30 + (3 * sameattacker);
                event_user(0);
            }
        }
        
        made = true;
    }
    
    if (i_ex(obj_growtangle))
    {
        if (obj_growtangle.growcon == 2 && !instance_exists(obj_zapper_laser_linedraw))
            instance_create_depth(0, 0, obj_growtangle.depth - 1, obj_zapper_laser_linedraw);
    }
}

if (type == 66)
{
    if (!made)
    {
        if (i_ex(creatorid))
        {
            creatorid.image_alpha = 0;
            var zapper_cannonmanager = instance_create(creatorid.x - 18, creatorid.y - 28, obj_zapper_cannon_manager);
            scr_bullet_inherit(zapper_cannonmanager);
            zapper_cannonmanager.depth -= creator;
            
            if (i_ex(obj_shutta_enemy))
                zapper_cannonmanager.depth = creatorid.depth;
            
            zapper_cannonmanager.damage = 55;
            var zapper_cannon_reload_ratio = 1;
            
            if (scr_monsterpop() != sameattack)
                zapper_cannon_reload_ratio = ratio;
            
            with (zapper_cannonmanager)
            {
                event_user(0);
                alarm[1] += other.sameattacker * reload * zapper_cannon_reload_ratio;
                reload *= (other.sameattack * zapper_cannon_reload_ratio);
            }
        }
        
        made = true;
    }
}

if (type == 67)
{
}

if (type == 68)
{
    if (made == false)
    {
        made = true;
        tempx = obj_growtangle.x - 135;
        
        with (instance_create(tempx, obj_growtangle.y - 15, obj_bullet_sun))
        {
            hspeed = 1.5;
            vspeed = -0.6;
            scr_lerpvar("vspeed", vspeed, -vspeed, 180);
            interval = 11 - (other.special * 3);
            overpower = other.special;
            damage = 55;
            target = other.target;
            level = 1;
        }
    }
    
    with (obj_bullet_sun)
    {
        if ((abs(x - obj_growtangle.x) > 150 || abs(y - obj_growtangle.y) > 150) && point_distance(x + hspeed, y + vspeed, obj_growtangle.x, obj_growtangle.y) > point_distance(x, y, obj_growtangle.x, obj_growtangle.y))
        {
            image_alpha = scr_approach(image_alpha, 0, 0.125);
            
            if (image_alpha == 0)
            {
                event_user(1);
                instance_destroy();
            }
        }
    }
}

if (type == 69)
{
    if (made == false)
    {
        made = true;
        side = 0;
    }
    
    var is_water = instance_exists(obj_rainwater);
    
    if ((btimer % ceil(35)) == 5)
    {
        var moondir = 30 + random(120);
        
        if (is_water)
            moondir = 90 + ((45 + random(15)) * choose(1, -1));
        
        var xx = obj_growtangle.x + lengthdir_x(180 + (20 * is_water), moondir);
        
        if (side == -1)
            xx = obj_growtangle.x - random(75);
        
        if (side == 1)
            xx = obj_growtangle.x + random(75);
        
        with (instance_create(xx, (obj_growtangle.y + lengthdir_y(180 + (20 * is_water), moondir)) - (50 * is_water), obj_bullet_submoon))
        {
            image_xscale = 0;
            image_yscale = 0;
            image_angle = scr_at_player(x, y);
            target = other.target;
            damage = 55;
            
            if (other.side == -1)
                image_angle = point_direction(x, y, obj_growtangle.x - 20 - irandom(60), obj_growtangle.y);
            
            if (other.side == 1)
                image_angle = point_direction(x, y, obj_growtangle.x + 20 + irandom(60), obj_growtangle.y);
            
            direction = image_angle;
            speed = 1.5;
            turnrate = 6 - other.special;
            turnrate *= choose(1, -1);
            destroyonhit = false;
            image_alpha = 0;
            overpower = other.special;
            scr_lerpvar("image_alpha", 0, 1, 10);
            scr_lerpvar("image_xscale", 4 + (overpower / 3), 2 + (overpower / 3), 15);
            scr_lerpvar("image_yscale", 4 + (overpower / 3), 2 + (overpower / 3), 15);
            scr_lerpvar("image_xscale", 0, 2.5 + (overpower / 3), 10);
            scr_lerpvar("image_yscale", 0, 2.5 + (overpower / 3), 10);
        }
    }
    
    with (obj_bullet_submoon)
    {
        if (!touched_water && slowdown == false)
            speed = scr_approach(speed, (6 - (overpower * 1.75) - (2.8 * is_water)) / (1 + power(slow_factor, 0.7)), (0.11 * sqrt(1 + sqrt(slow_factor))) + (0.3 * is_water));
    }
    
    if (special > 1)
    {
        with (obj_precipitation_bullet_parent)
        {
            if (y > (obj_growtangle.y - 90 - random(10)) && image_alpha > 0.8)
            {
                instance_destroy();
                
                with (instance_create(x, y, obj_regularbullet))
                {
                    active = false;
                    spin = 1;
                    spinspeed = random(5) - 0.25;
                    direction = 70 + random(40);
                    speed = 1 + random(1);
                    image_xscale = 0.5;
                    image_yscale = 0.5;
                    sprite_index = spr_cakesmoke;
                    scr_lerpvar("image_alpha", 1, 0, 30);
                    scr_script_delayed(instance_destroy, 30);
                }
            }
        }
    }
}

if (type == 70)
{
    var box = obj_growtangle;
    
    if ((btimer % ceil((3 + (sqrt(ratio) * (5 - special))) - instance_exists(obj_bullet_sun))) == 0)
    {
        var width = 95 + (20 * special);
        var fails = -1;
        var counter, tryx, tryy;
        
        do
        {
            counter = 0;
            fails++;
            tryx = (box.x - width) + random(width * 2);
            tryy = (box.y - width) + random(width * 2);
            var dist = point_distance(tryx, tryx, box.x, box.y);
            
            with (obj_bullet_snow)
            {
                if (point_distance(x, y, tryx, tryy) < (64 - sqrt(dist / 2)))
                    counter++;
            }
        }
        until (counter <= (3 + special + irandom(1)) || fails > 18);
        
        if (fails > 0)
            show_debug_message("fails: " + string(fails));
        
        if (fails < 16)
        {
            with (instance_create(tryx, tryy, obj_bullet_snow))
            {
                image_angle = random(360);
                spin = 1;
                target = obj_dbulletcontroller.target;
                damage = 55;
                spinspeed = (1 + random(2)) * choose(1, -1);
                sprite_index = spr_snowflake;
                image_blend = c_gray;
                active = false;
                
                if (irandom(3))
                    direction = point_direction(x, y, (box.x - 70) + random(140), (box.y - 30) + random(140));
                else
                    direction = scr_at_player(x, y);
                
                speed = random(0.45) + 0.1;
                image_alpha = 0;
                overpower = other.special;
                var mylife = 135 + random(15);
                
                if (!irandom(5) && instance_exists(obj_bullet_sun))
                {
                    y = (obj_bullet_sun.y - 10) + random(20);
                    x = obj_bullet_sun.x + 30 + random(20);
                    direction = 170 + random(20);
                }
                
                scr_lerpvar("image_alpha", 0, 1, 15);
                scr_script_delayed(scr_var, 30, "active", true);
                scr_script_delayed(scr_var, 30, "image_blend", 16777215);
                scr_script_delayed(scr_var, mylife, "active", false);
                scr_script_delayed(scr_var, mylife, "image_blend", 8421504);
                scr_script_delayed(scr_lerpvar, mylife, "image_alpha", 1, 0, 15);
                scr_doom(id, 180);
                image_xscale = 2;
                image_yscale = 2;
            }
        }
    }
    
    if (special == 2)
    {
        with (obj_bullet_submoon)
        {
            slow_factor = max(slow_factor, 250 - point_distance(box.x, box.x, x, y));
            image_xscale *= 0.99;
            image_yscale *= 0.99;
        }
    }
}

if (type == 71)
{
    if (made == false && !i_ex(obj_rouxls_ch3_enemy) && (ratio == 1 || special == 2))
    {
        made = true;
        side = 0;
        rain = instance_create(obj_growtangle.x, obj_growtangle.y + 70, obj_rainwater);
        rain.target = target;
        rain.damage = 55;
    }
    
    if (made == false)
    {
        made = true;
        side = 0;
    }
    
    var xx = (obj_growtangle.x - (75 * (1 + (special / 2)))) + random(150 * (1 + (special / 2)));
    
    if (side == -1)
        xx = obj_growtangle.x - random(75);
    
    if (side == 1)
        xx = obj_growtangle.x + random(75);
    
    if (side != -9999)
    {
        if ((((btimer % ceil((5 * ratio) - special - (special == 2))) == 0 || (special == 2 && irandom(9) < 3)) && !i_ex(obj_rouxls_ch3_enemy)) || ((btimer % 4) == 0 && i_ex(obj_rouxls_ch3_enemy)))
        {
            with (instance_create_depth(xx, obj_growtangle.y - 150 - random(45), obj_growtangle.depth - 1, obj_bullet_rain))
            {
                direction = 265 + random(10);
                speed = 3.5 / other.ratio;
                image_yscale = 1;
                gravity = 0.3 / other.ratio;
                target = other.target;
                damage = 55;
                timepoints = 0.5;
                overpower = other.special;
                
                if (i_ex(obj_rouxls_ch3_enemy))
                    overpower = 0;
                
                scr_lerpvar("gravity", gravity, 0, 60);
            }
        }
    }
}

if (type == 72)
{
    y = creatorid.y;
    special++;
    
    if (special == 8)
        instance_create(creatorid.x + 46, creatorid.y + 48, obj_yarn_rotating);
    
    var z = 0;
    
    if (i_ex(obj_rouxls_ch3_enemy) && obj_rouxls_ch3_enemy.yarndifficulty > 1)
        z = 6;
    
    if (btimer >= ((10 * ratio) - z) && special >= 8)
    {
        btimer = 0;
        radius = 120 + random(80);
        bm = instance_create(creatorid.x + 46, creatorid.y + 34, obj_yarnmaker);
        scr_bullet_inherit(bm);
        var childgravity = 0.5;
        var launchspeed = scr_remapvalue(40, 200, y - cameray(), 8, 16);
        
        if ((made % 3) == 2)
            bm.direction = 180 - scr_getlaunchdirection(launchspeed, (x - obj_heart.x) + 4, childgravity, 1);
        else
            bm.direction = 180 - scr_getlaunchdirection(launchspeed, random(250) + (x - maxx), childgravity, 1);
        
        bm.damage = damage;
        bm.target = target;
        bm.childgravity = 0.6;
        bm.childspeed = launchspeed;
        bm.grazepoints = 7;
        bm.image_angle = direction;
        made++;
    }
}

if (type == 72.1)
{
    if (btimer == 10)
    {
        n = 10 + random(3);
        basedir = 96 + random(19);
        side++;
        
        if (side > 8)
            side = 0;
    }
    
    if (!made)
    {
        var _mascot_attack = instance_create(obj_growtangle.x, obj_growtangle.y, obj_elnina_mascotattack);
        _mascot_attack.attacktype = 0;
        _mascot_attack.favored = 0;
        _mascot_attack.type = 0;
        _mascot_attack.dummy = true;
        scr_bullet_inherit(_mascot_attack);
        made = true;
        side = irandom(6);
    }
    
    if (btimer == 10 || btimer == 13 || btimer == 17)
    {
        bm = instance_create(x + 46, y + 34, obj_regularbullet_elnina);
        scr_bullet_inherit(bm);
        bm.damage = damage;
        bm.target = target;
        bm.direction = basedir;
        bm.gravity = 0.5;
        bm.speed = n;
        bm.grazepoints = 7;
        
        if (special == 1)
            bm.sprite_index = spr_ch3_bullet_raindrop;
        
        if (special == 2)
            bm.sprite_index = spr_ch3_bullet_ice;
        
        if (special == 3)
            bm.sprite_index = spr_ch3_bullet_moon;
        
        if (special == 4)
            bm.sprite_index = spr_ch3_bullet_sun;
        
        if (btimer >= 17 || side == 8)
        {
            bm.sprite_index = spr_lanino_fire;
            bm.image_blend = c_red;
            bm.image_xscale = 2;
            bm.image_yscale = 2;
        }
    }
    
    if (btimer == 17)
    {
        bm = instance_create(x + 46, y + 34, obj_regularbullet_elnina);
        scr_bullet_inherit(bm);
        bm.damage = damage;
        bm.target = target;
        bm.direction = basedir + 147;
        bm.gravity = -0.5;
        bm.speed = n;
        bm.grazepoints = 7;
        
        if (special == 1)
            bm.sprite_index = spr_ch3_bullet_raindrop;
        
        if (special == 2)
            bm.sprite_index = spr_ch3_bullet_ice;
        
        if (special == 3)
            bm.sprite_index = spr_ch3_bullet_moon;
        
        if (special == 4)
            bm.sprite_index = spr_ch3_bullet_sun;
    }
    
    if (btimer >= 17)
    {
        btimer = 0;
        made++;
    }
}

if (type == 73)
{
    if (made == false)
    {
        made = true;
        btimer = 0;
    }
    
    if (btimer == 90)
    {
        with (obj_rouxls_ch3_enemy)
        {
            with (obj_writer)
                instance_destroy();
            
            global.typer = 50;
            msgsetloc(0, "Go left?", "obj_dbulletcontroller_slash_Step_0_gml_1034_0");
            scr_enemyblcon(x + 20, global.monstery[myself] - 40, 10);
            
            with (obj_battleblcon)
                depth = obj_heart.depth - 10;
        }
    }
    
    if (btimer == 180)
    {
        with (obj_writer)
            instance_destroy();
    }
    
    if (btimer == 210)
    {
        with (obj_rouxls_ch3_enemy)
        {
            with (obj_writer)
                instance_destroy();
            
            global.typer = 50;
            msgsetloc(0, "Go left?", "obj_dbulletcontroller_slash_Step_0_gml_1049_0");
            scr_enemyblcon(x + 20, global.monstery[myself] - 40, 10);
            
            with (obj_battleblcon)
                depth = obj_heart.depth - 10;
        }
        
        with (obj_dbulletcontroller)
            side = -1;
    }
    
    if (btimer == 300)
    {
        with (obj_writer)
            instance_destroy();
    }
    
    if (btimer == 320)
    {
        with (obj_rouxls_ch3_enemy)
        {
            with (obj_writer)
                instance_destroy();
            
            global.typer = 50;
            msgsetloc(0, "GO RIGHT?", "obj_dbulletcontroller_slash_Step_0_gml_1065_0");
            scr_enemyblcon(x + 20, global.monstery[myself] - 40, 10);
            
            with (obj_battleblcon)
                depth = obj_heart.depth - 10;
        }
    }
    
    if (btimer == 325)
    {
        with (obj_dbulletcontroller)
            side = -9999;
    }
    
    if (btimer == 346)
    {
        with (obj_dbulletcontroller)
            side = 1;
    }
    
    if (btimer == 420)
    {
        with (obj_writer)
            instance_destroy();
    }
    
    if (btimer == 450)
    {
        with (obj_rouxls_ch3_enemy)
        {
            with (obj_writer)
                instance_destroy();
            
            global.typer = 50;
            msgsetloc(0, "Okay. Guyse?&Pauseth? Pauseth for&a second?", "obj_dbulletcontroller_slash_Step_0_gml_1084_0");
            scr_enemyblcon(x + 20, global.monstery[myself] - 40, 10);
            
            with (obj_battleblcon)
                depth = obj_heart.depth - 10;
        }
        
        with (obj_elnina_enemy_rouxls)
        {
            head = 3799;
            pose = -1;
        }
        
        with (obj_lanino_enemy_rouxls)
        {
            head = 4544;
            pose = -1;
        }
        
        with (obj_bullet_submoon)
            slowdown = true;
        
        with (obj_bullet_rain)
            slowdown = true;
    }
    
    if (btimer > 445)
    {
        with (obj_dbulletcontroller)
        {
            if (type != 73)
                btimer = 0;
        }
    }
    
    if (btimer == 540)
    {
        with (obj_rouxls_ch3_enemy)
        {
            with (obj_writer)
                instance_destroy();
            
            global.typer = 50;
            msgsetloc(0, "So I haveth a&Laser Pointere.", "obj_dbulletcontroller_slash_Step_0_gml_1107_0");
            scr_enemyblcon(x + 20, global.monstery[myself] - 40, 10);
            
            with (obj_battleblcon)
                depth = obj_heart.depth - 10;
            
            idlesprite = spr_rouxls_point;
        }
        
        inst = instance_create(obj_growtangle.x, obj_growtangle.y, obj_rouxls_laser_pointer_controller);
        inst.recordstring = "x450y189ox449y189ox446y189ox436y189ox417y190ox383y193ox365y193ox363y193ox339y191ox327y188ox325y188ox319y186ox312y185ox304y185ox296y184ox289y182ox284y181ox277y180ox276y180ox276y180ox273y177ox272y176ox271y175ox271y174ox270y174ox270y174ox270y172ox271y168ox271y167ox272y167ox279y171ox283y172ox286y172ox285y167ox280y164ox275y164ox272y172ox273y177ox276y179ox280y178ox282y177ox282y174ox277y173ox273y173ox272y173ox272y175ox275y176ox280y175ox283y172ox283y170ox280y170ox274y170ox271y172ox271y175ox276y179ox284y178ox287y174ox287y172ox283y169ox274y168ox266y174ox266y182ox267y185ox275y185ox284y180ox286y174ox286y173ox283y172ox279y175ox277y179ox278y180ox281y180ox285y178ox286y176ox285y173ox278y171ox274y171ox272y175ox274y181ox277y184ox282y184ox286y180ox284y176ox277y172ox272y171ox270y176ox270y183ox271y187ox276y187ox279y185ox280y181ox281y179ox280y178ox274y177ox269y179ox268y183ox272y185ox278y185ox282y184ox283y181ox283y178ox281y178ox281y178ox281y178ox281y178ox281y178ox281y178ox281y178ox281y178ox280y178ox280y178ox280y178ox280y178ox280y178ox280y178ox280y178ox280y178ox280y178ox280y178ox280y178ox277y178ox275y179ox275y181ox274y186ox274y187ox276y186ox280y183ox282y180ox282y178ox278y175ox274y175ox271y181ox272y185ox278y187ox285y186ox287y182ox287y179ox285y177ox280y177ox277y180ox277y182ox280y183ox284y181ox288y176ox289y173ox282y172ox272y172ox270y173ox270y179ox272y181ox278y183ox280y182ox281y176ox277y172ox275y172ox272y180ox274y185ox278y186ox284y185ox286y178ox286y171ox281y168ox275y168ox271y174ox271y182ox274y183ox280y182ox286y176ox286y173ox279y169ox274y170ox273y178ox274y180ox278y180ox282y176ox282y173ox280y173ox276y175ox275y180ox276y182ox280y182ox284y178ox284y175ox284y175ox281y177ox280y178ox280y178ox282y179ox285y176ox283y169ox277y168ox269y172ox267y177ox267y183ox271y183ox276y180ox277y177ox277y177ox271y178ox270y183ox272y183ox278y180ox280y175ox280y170ox279y169ox273y169ox268y175ox271y181ox278y181ox282y180ox283y175ox283y171ox280y169ox276y171ox274y173ox277y176ox282y176ox286y172ox286y169ox285y165ox280y163ox276y166ox275y176ox277y177ox282y177ox287y175ox289y169ox288y164ox281y163ox276y165ox276y169ox278y175ox280y176ox283y176ox284y173ox283y171ox276y171ox272y176ox273y180ox275y183ox280y183ox283y181ox283y178ox277y174ox273y173ox271y175ox272y180ox276y181ox280y181ox282y177ox282y176ox277y174ox272y173ox272y178ox275y180ox282y180ox285y177ox285y176ox283y173ox277y172ox274y176ox274y176ox276y176ox277y176ox278y176ox278y176ox278y176ox278y176o";
        inst.con = 2;
    }
    
    if (btimer == 630)
    {
        with (obj_rouxls_ch3_enemy)
        {
            with (obj_writer)
                instance_destroy();
            
            global.typer = 50;
            msgsetloc(0, "If you could&juste... Followe that?", "obj_dbulletcontroller_slash_Step_0_gml_1124_0");
            scr_enemyblcon(x + 20, global.monstery[myself] - 40, 10);
            
            with (obj_battleblcon)
                depth = obj_heart.depth - 10;
        }
        
        with (obj_elnina_enemy_rouxls)
            pose = 0;
        
        with (obj_lanino_enemy_rouxls)
            pose = 0;
    }
    
    if (btimer == 720)
    {
        with (obj_rouxls_laser_pointer_controller)
            instance_destroy();
        
        with (obj_rouxls_ch3_enemy)
        {
            with (obj_writer)
                instance_destroy();
            
            global.typer = 50;
            msgsetloc(0, "Everyone readye?&Okaye go.", "obj_dbulletcontroller_slash_Step_0_gml_1141_0");
            scr_enemyblcon(x + 20, global.monstery[myself] - 40, 10);
            
            with (obj_battleblcon)
                depth = obj_heart.depth - 10;
            
            idlesprite = spr_rouxls_chef;
        }
        
        with (obj_elnina_enemy_rouxls)
            head = 4845;
        
        with (obj_lanino_enemy_rouxls)
            head = 1271;
    }
    
    if (btimer == 816)
    {
        with (obj_bullet_submoon)
            gotopointer = true;
        
        with (obj_bullet_rain)
            gotopointer = true;
    }
    
    if (btimer == 810)
    {
        with (obj_writer)
            instance_destroy();
        
        if (i_ex(obj_rouxls_ch3_enemy))
        {
            with (obj_rouxls_ch3_enemy)
                idlesprite = spr_rouxls_point;
            
            with (obj_rouxls_moon_bullet)
                alarm[0] = 50;
            
            with (obj_rouxls_cloud_bullet)
                alarm[0] = 50;
            
            inst = instance_create(obj_growtangle.x, obj_growtangle.y, obj_rouxls_laser_pointer_controller);
            inst.recordstring = "x517y166ox517y166ox517y167ox515y168ox512y169ox496y175ox455y185ox414y191ox391y191ox363y191ox352y190ox344y189ox330y185ox326y182ox323y181ox321y179ox319y178ox319y178ox319y177ox318y176ox318y176ox318y176ox317y175ox317y175ox317y175ox317y175ox317y175ox317y175ox317y175ox317y175ox316y176ox314y176ox308y173ox295y161ox277y141ox271y132ox270y128ox267y123ox267y121ox267y121ox267y124ox269y131ox269y132ox277y133ox287y131ox286y125ox278y116ox271y115ox268y120ox269y125ox273y126ox276y121ox272y116ox263y115ox263y119ox268y123ox269y123ox268y121ox267y122ox268y123ox269y122ox269y115ox269y114ox269y120ox270y122ox269y121ox269y121ox272y124ox273y128ox276y132ox303y161ox318y185ox329y197ox347y216ox355y224ox356y224ox365y230ox374y236ox374y236ox375y234ox376y232ox377y231ox377y224ox377y219ox376y219ox372y222ox371y225ox373y226ox376y222ox377y211ox371y207ox361y218ox356y226ox365y225ox370y222ox368y223ox364y231ox363y236ox369y231ox372y221ox373y220ox363y229ox355y233ox355y224ox356y207ox358y207ox357y216ox353y221ox353y216ox370y190ox374y185ox371y196ox363y205ox362y206ox366y197ox384y197ox386y205ox364y209ox340y203ox342y197ox358y207ox360y220ox357y220ox356y220ox356y220ox355y221ox355y221ox357y219ox359y218ox360y217ox366y208ox372y195ox381y163ox387y136ox387y130ox385y124ox385y119ox384y115ox383y108ox383y99ox378y98ox372y103ox372y110ox376y112ox382y111ox377y107ox366y110ox364y118ox366y123ox389y122ox400y115ox383y117ox368y126ox373y127ox379y115ox379y107ox373y114ox363y126ox363y126ox365y118ox369y117ox368y132ox362y138ox366y107ox389y55ox393y59ox379y103ox355y121ox350y113ox360y95ox395y103ox395y120ox356y128ox324y112ox340y94ox379y107ox387y128ox368y135ox355y125ox395y118ox431y131ox396y137ox380y129ox396y120ox398y122ox390y135ox412y130ox430y121ox419y122ox391y129ox393y127ox392y122ox387y125ox386y139ox385y141ox382y141ox383y137ox385y129ox384y123ox383y121ox383y121ox363y140ox316y193ox281y233ox256y250ox262y239ox290y208ox300y194ox296y204ox264y233ox244y239ox239y235ox262y227ox295y234ox286y241ox244y226ox242y200ox280y209ox290y244ox274y243ox234y190ox246y182ox296y203ox299y205ox285y208ox280y215ox280y207ox290y176ox307y183ox318y216ox300y227ox255y199ox266y164ox340y178ox364y214ox294y245ox238y224ox273y155ox304y135ox310y185ox294y233ox262y244ox256y216ox302y165ox312y178ox273y232ox252y240ox251y226ox259y219ox266y234ox263y249ox264y246ox280y214ox290y194ox299y220ox291y294ox269y305ox262y269ox297y207ox316y183ox305y213ox268y244ox253y241ox268y194ox343y154ox374y187ox328y236ox234y242ox194y207ox198y190ox269y200ox372y214ox358y220ox226y212ox194y191ox252y170ox289y198ox278y219ox281y199ox278y200ox276y202ox277y207ox283y210ox288y209ox290y207ox289y204ox284y206ox283y215ox283y219ox290y222ox293y220ox290y208ox279y200ox273y207ox272y218ox279y219ox286y214ox287y201ox281y194ox273y197ox271y207ox273y210ox284y210ox291y204ox292y200ox282y200ox277y207ox281y212ox287y212ox291y208ox289y204ox281y205ox276y212ox276y213ox289y213ox294y211ox294y210ox282y207ox278y208ox279y212ox289y214ox296y211ox297y207ox286y207ox279y219ox283y222ox293y215ox296y202ox289y199ox284y203ox283y204ox289y208ox296y210ox289y207ox283y206ox282y207ox286y208ox291y205ox293y199ox282y197ox271y208ox269y213ox277y214ox292y208ox297y201ox292y204ox287y214ox288y214ox312y206ox342y183ox356y170ox369y158ox372y155ox373y153ox381y142ox384y135ox384y135ox384y134ox376y128ox364y125ox360y126ox359y126ox361y124ox363y122ox352y121ox337y122ox354y132ox378y137ox381y137ox381y133ox374y130ox367y132ox366y142ox374y150ox384y145ox386y129ox376y118ox366y117ox359y124ox360y132ox374y135ox381y131ox380y121ox361y112ox330y113ox329y127ox348y131ox360y127ox364y119ox364y113ox360y116ox360y124ox366y126ox381y126ox382y122ox374y118ox369y116ox365y119ox364y123ox375y122ox378y118ox373y111ox367y112ox362y123ox363y130ox374y127ox382y118ox382y113ox373y110ox363y114ox356y131ox364y137ox375y134ox377y122ox372y107ox362y100ox344y111ox340y128ox350y132ox364y131ox367y121ox366y110ox360y105ox353y113ox347y129ox353y130ox366y129ox368y125ox366y121ox357y120ox348y127ox349y141ox361y145ox372y138ox375y126ox367y117ox358y120ox348y131ox349y140ox366y144ox377y135ox377y127ox363y116ox350y117ox341y138ox342y143ox345y143ox345y135ox335y131ox326y131ox313y131ox283y131ox275y131ox270y133ox260y133ox259y133ox257y132ox257y132ox252y132ox252y133ox260y134ox272y131ox281y123ox283y115ox279y114ox271y120ox272y134ox286y137ox296y130ox293y117ox279y109ox269y114ox263y127ox268y137ox276y136ox283y126ox283y115ox267y111ox256y121ox256y133ox266y137ox277y134ox282y124ox280y115ox271y114ox260y128ox262y140ox273y140ox280y128ox278y112ox266y103ox257y109ox257y128ox271y133ox281y126ox283y114ox274y101ox264y98ox259y110ox262y124ox273y129ox280y128ox282y122ox278y113ox268y111ox258y128ox260y134ox273y130ox282y117ox281y110ox272y106ox262y114ox259y132ox267y136ox280y132ox288y119ox280y105ox264y97ox254y103ox252y121ox264y130ox277y131ox283y125ox284y118ox272y114ox264y122ox265y130ox280y131ox287y127ox286y119ox270y111ox262y113ox259y127ox263y133ox278y133ox289y123ox287y113ox273y109ox258y120ox256y135ox268y138ox279y129ox281y118ox279y111ox274y111ox268y127ox272y140ox280y141ox288y135ox291y124ox279y112ox265y112ox258y125ox257y139ox268y144ox280y138ox284y124ox279y108ox273y104ox261y113ox255y129ox264y137ox274y134ox282y121ox283y111ox278y108ox269y117ox266y135ox275y138ox286y131ox288y123ox288y120ox275y112ox265y116ox262y126ox268y131ox284y134ox293y127ox290y116ox272y110ox252y116ox247y129ox257y138ox270y138ox279y129ox283y119ox281y115ox271y115ox261y128ox265y137ox279y136ox288y126ox287y114ox277y106ox270y111ox266y126ox267y129ox282y130ox290y125ox291y118ox281y107ox268y105ox256y118ox257y136ox267y142ox284y133ox292y119ox290y109ox279y103ox269y110ox264y119ox271y129ox279y130ox285y118ox285y111ox277y106ox269y111ox264y126ox266y130ox273y129ox279y121ox279y119o";
            inst.con = 2;
        }
    }
    
    if (btimer == 900)
    {
        with (obj_rouxls_ch3_enemy)
        {
            with (obj_writer)
                instance_destroy();
            
            global.typer = 50;
            msgsetloc(0, "Just follow...&follow...", "obj_dbulletcontroller_slash_Step_0_gml_1179_0");
            scr_enemyblcon(x + 20, global.monstery[myself] - 40, 10);
            
            with (obj_battleblcon)
                depth = obj_heart.depth - 10;
        }
    }
    
    if (btimer == 1000)
    {
        with (obj_rouxls_ch3_enemy)
        {
            with (obj_writer)
                instance_destroy();
            
            global.typer = 50;
            msgsetloc(0, "Over here...", "obj_dbulletcontroller_slash_Step_0_gml_1191_0");
            scr_enemyblcon(x + 20, global.monstery[myself] - 40, 10);
            
            with (obj_battleblcon)
                depth = obj_heart.depth - 10;
        }
    }
    
    if (btimer == 1150)
    {
        with (obj_rouxls_ch3_enemy)
        {
            with (obj_writer)
                instance_destroy();
            
            global.typer = 50;
            msgsetloc(0, "A little&over there?", "obj_dbulletcontroller_slash_Step_0_gml_1203_0");
            scr_enemyblcon(x + 20, global.monstery[myself] - 40, 10);
            
            with (obj_battleblcon)
                depth = obj_heart.depth - 10;
        }
    }
    
    if (btimer == 1260)
    {
        with (obj_rouxls_ch3_enemy)
            idlesprite = spr_rouxls_chef;
        
        with (obj_writer)
            instance_destroy();
        
        with (obj_rouxls_laser_pointer_controller)
            instance_destroy();
        
        global.turntimer = 1;
    }
}

if (type == 73.1)
{
    if (made == false)
    {
        made = true;
        btimer = 0;
    }
    
    if (btimer == 40)
    {
        with (obj_bullet_submoon)
            slowdown = true;
        
        with (obj_bullet_rain)
            slowdown = true;
    }
    
    if (btimer > 35)
    {
        with (obj_dbulletcontroller)
        {
            if (type != 73.1)
                btimer = 0;
        }
    }
    
    if (btimer == 50)
    {
        with (obj_writer)
            instance_destroy();
        
        with (obj_rouxls_ch3_enemy)
            idlesprite = spr_rouxls_point;
        
        with (obj_rouxls_moon_bullet)
            alarm[0] = 50;
        
        with (obj_rouxls_cloud_bullet)
            alarm[0] = 50;
        
        inst = instance_create(obj_growtangle.x, obj_growtangle.y, obj_rouxls_laser_pointer_controller);
        inst.recordstring = "x505y171ox505y171ox503y175ox480y197ox460y211ox445y220ox445y220ox439y222ox410y223ox400y223ox401y226ox402y226ox400y226ox382y226ox378y229ox387y232ox392y231ox384y220ox357y214ox343y221ox343y225ox350y225ox350y225ox337y228ox321y236ox321y237ox319y237ox283y228ox272y224ox270y225ox264y229ox264y229ox265y229ox250y226ox230y228ox228y228ox229y228ox230y225ox230y225ox232y227ox240y228ox248y220ox249y209ox243y205ox243y205ox249y201ox262y177ox265y159ox261y157ox262y156ox268y144ox269y138ox248y117ox239y104ox246y103ox248y102ox255y96ox260y94ox273y101ox296y99ox314y92ox312y92ox318y105ox328y109ox330y107ox335y105ox350y110ox358y113ox365y107ox384y94ox379y93ox377y101ox377y104ox379y105ox381y104ox377y107ox380y115ox391y119ox389y116ox375y111ox369y115ox371y136ox375y138ox382y133ox384y129ox372y137ox364y168ox368y176ox373y176ox377y175ox364y185ox347y227ox359y240ox365y241ox369y238ox371y236ox364y239ox356y255ox362y258ox370y257ox377y252ox377y246ox372y250ox373y252ox378y249ox379y246ox364y240ox352y242ox351y250ox348y252ox341y252ox316y248ox273y245ox271y245ox277y246ox292y249ox294y245ox260y234ox248y232ox256y231ox255y219ox248y207ox249y206ox265y198ox261y170ox252y161ox256y157ox267y141ox268y134ox264y133ox259y131ox266y125ox271y120ox271y115ox277y110ox287y112ox297y116ox324y114ox326y111ox310y110ox311y118ox354y133ox362y130ox365y122ox377y118ox382y118ox390y122ox410y122ox415y118ox414y118ox412y127ox414y135ox414y135ox411y141ox406y159ox407y162ox399y158ox385y157ox383y165ox380y170ox367y181ox343y198ox333y204ox322y207ox297y227ox299y233ox300y233ox288y233ox286y233ox281y235ox273y236ox271y237ox268y241ox269y243ox267y239ox237y233ox242y235ox263y240ox266y231ox261y217ox257y214ox246y193ox233y165ox237y162ox271y125ox279y75ox279y74ox275y75ox263y77ox260y77ox259y89ox259y97ox265y96ox261y89ox253y89ox257y98ox266y102ox278y105ox273y105ox267y105ox270y106ox272y105ox269y104ox264y107ox270y118ox272y119ox272y115ox264y114ox267y118o";
        inst.con = 2;
    }
    
    if (btimer == 86)
    {
        with (obj_bullet_submoon)
            gotopointer = true;
        
        with (obj_bullet_rain)
            gotopointer = true;
    }
    
    if (btimer == 265)
    {
        with (obj_rouxls_ch3_enemy)
            idlesprite = spr_rouxls_chef;
        
        with (obj_writer)
            instance_destroy();
        
        with (obj_rouxls_laser_pointer_controller)
            instance_destroy();
        
        global.turntimer = 1;
    }
}

if (type == 73.5)
{
    if (made == false)
    {
        made = true;
        btimer = 0;
    }
    
    if (btimer == 3)
    {
        instance_create(obj_growtangle.x + 44, obj_growtangle.y - 37, obj_rouxls_moon_bullet);
        instance_create(obj_growtangle.x - 37, obj_growtangle.y + 42, obj_rouxls_cloud_bullet);
    }
    
    if (btimer == 230)
    {
    }
    
    if (btimer == 290)
    {
        with (obj_rouxls_moon_bullet)
            con = 4;
        
        with (obj_rouxls_cloud_bullet)
            con = 4;
        
        with (obj_rouxls_ch3_enemy)
        {
            with (obj_writer)
                instance_destroy();
            
            global.typer = 50;
            msgsetloc(0, "Follow&my laser&pointer!", "obj_dbulletcontroller_slash_Step_0_gml_1310_0");
            scr_enemyblcon(x + 20, global.monstery[myself] - 40, 10);
        }
    }
    
    if (btimer == 350)
    {
        with (obj_writer)
            instance_destroy();
        
        with (obj_rouxls_ch3_enemy)
            idlesprite = spr_rouxls_point;
        
        with (obj_rouxls_moon_bullet)
            alarm[0] = 50;
        
        with (obj_rouxls_cloud_bullet)
            alarm[0] = 50;
        
        inst = instance_create(obj_growtangle.x, obj_growtangle.y, obj_rouxls_laser_pointer_controller);
        inst.recordstring = "x517y166ox517y166ox517y167ox515y168ox512y169ox496y175ox455y185ox414y191ox391y191ox363y191ox352y190ox344y189ox330y185ox326y182ox323y181ox321y179ox319y178ox319y178ox319y177ox318y176ox318y176ox318y176ox317y175ox317y175ox317y175ox317y175ox317y175ox317y175ox317y175ox317y175ox316y176ox314y176ox308y173ox295y161ox277y141ox271y132ox270y128ox267y123ox267y121ox267y121ox267y124ox269y131ox269y132ox277y133ox287y131ox286y125ox278y116ox271y115ox268y120ox269y125ox273y126ox276y121ox272y116ox263y115ox263y119ox268y123ox269y123ox268y121ox267y122ox268y123ox269y122ox269y115ox269y114ox269y120ox270y122ox269y121ox269y121ox272y124ox273y128ox276y132ox303y161ox318y185ox329y197ox347y216ox355y224ox356y224ox365y230ox374y236ox374y236ox375y234ox376y232ox377y231ox377y224ox377y219ox376y219ox372y222ox371y225ox373y226ox376y222ox377y211ox371y207ox361y218ox356y226ox365y225ox370y222ox368y223ox364y231ox363y236ox369y231ox372y221ox373y220ox363y229ox355y233ox355y224ox356y207ox358y207ox357y216ox353y221ox353y216ox370y190ox374y185ox371y196ox363y205ox362y206ox366y197ox384y197ox386y205ox364y209ox340y203ox342y197ox358y207ox360y220ox357y220ox356y220ox356y220ox355y221ox355y221ox357y219ox359y218ox360y217ox366y208ox372y195ox381y163ox387y136ox387y130ox385y124ox385y119ox384y115ox383y108ox383y99ox378y98ox372y103ox372y110ox376y112ox382y111ox377y107ox366y110ox364y118ox366y123ox389y122ox400y115ox383y117ox368y126ox373y127ox379y115ox379y107ox373y114ox363y126ox363y126ox365y118ox369y117ox368y132ox362y138ox366y107ox389y55ox393y59ox379y103ox355y121ox350y113ox360y95ox395y103ox395y120ox356y128ox324y112ox340y94ox379y107ox387y128ox368y135ox355y125ox395y118ox431y131ox396y137ox380y129ox396y120ox398y122ox390y135ox412y130ox430y121ox419y122ox391y129ox393y127ox392y122ox387y125ox386y139ox385y141ox382y141ox383y137ox385y129ox384y123ox383y121ox383y121ox363y140ox316y193ox281y233ox256y250ox262y239ox290y208ox300y194ox296y204ox264y233ox244y239ox239y235ox262y227ox295y234ox286y241ox244y226ox242y200ox280y209ox290y244ox274y243ox234y190ox246y182ox296y203ox299y205ox285y208ox280y215ox280y207ox290y176ox307y183ox318y216ox300y227ox255y199ox266y164ox340y178ox364y214ox294y245ox238y224ox273y155ox304y135ox310y185ox294y233ox262y244ox256y216ox302y165ox312y178ox273y232ox252y240ox251y226ox259y219ox266y234ox263y249ox264y246ox280y214ox290y194ox299y220ox291y294ox269y305ox262y269ox297y207ox316y183ox305y213ox268y244ox253y241ox268y194ox343y154ox374y187ox328y236ox234y242ox194y207ox198y190ox269y200ox372y214ox358y220ox226y212ox194y191ox252y170ox289y198ox278y219o";
        inst.con = 2;
    }
    
    if (btimer == 650)
    {
        with (obj_rouxls_ch3_enemy)
            idlesprite = spr_rouxls_chef;
        
        with (obj_writer)
            instance_destroy();
        
        with (obj_rouxls_laser_pointer_controller)
            instance_destroy();
        
        global.turntimer = 1;
    }
}

if (type == 74)
{
    if (!made)
    {
        if (i_ex(creatorid))
        {
            creatorid.image_alpha = 0;
            var shadowman_tommygun_manager = instance_create(creatorid.x, creatorid.y, obj_shadowman_tommygyn_rouxls);
            scr_bullet_inherit(shadowman_tommygun_manager);
            shadowman_tommygun_manager.dir = sameattacker;
            shadowman_tommygun_manager.sameattacker = sameattacker;
            shadowman_tommygun_manager.sameattack = sameattack;
            shadowman_tommygun_manager.creatorid = creatorid;
            shadowman_tommygun_manager.depth = creatorid.depth;
            shadowman_tommygun_manager.target = target;
            shadowman_tommygun_manager.damage = 55;
            
            with (shadowman_tommygun_manager)
            {
                if (sameattacker == 2)
                {
                    bullet_timer = 20;
                    scr_lerpvar_instance(id, "y", y, scr_get_box(5) - (sprite_height * 0.5), 16);
                }
            }
        }
        
        with (obj_rouxls_ch3_enemy)
            scr_lerpvar_instance(id, "x", x, xstart + 240, 20);
        
        made = true;
    }
}

if (type == 75)
{
    if (!made)
    {
        obj_growtangle.image_xscale = 3;
        obj_growtangle.image_yscale = 3;
        var _lanino_solar_system = instance_create(obj_growtangle.x, (mean(scr_get_box(1), obj_growtangle.y) + 25) - 200, obj_lanino_solar_system);
        scr_bullet_inherit(_lanino_solar_system);
        made = true;
    }
    
    if (btimer == 400 || btimer == 440 || btimer == 480 || btimer == 530)
    {
        with (obj_lanino_solar_system)
            intensity = scr_approach(intensity, 4, 1);
    }
    
    if (btimer == 115)
    {
        with (obj_lanino_enemy)
        {
            global.typer = 50;
            msgsetloc(0, "SUN&ATTACK!! &HA HA&HA!!!", "obj_dbulletcontroller_slash_Step_0_gml_1400_0");
            scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
            myblcon.depth = other.depth - 100;
        }
    }
    
    if (btimer == 200)
    {
        with (obj_writer)
            instance_destroy();
    }
    
    if (btimer == 260)
    {
        with (obj_lanino_enemy)
        {
            global.typer = 50;
            msgsetloc(0, "HA HA&HA!!!", "obj_dbulletcontroller_slash_Step_0_gml_1509_0");
            scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
            myblcon.depth = other.depth - 100;
        }
    }
    
    if (btimer == 320)
    {
        with (obj_writer)
            instance_destroy();
    }
    
    if (btimer == 350)
    {
        with (obj_lanino_enemy)
        {
            global.typer = 50;
            msgsetloc(0, "HA HA...&HA!!!", "obj_dbulletcontroller_slash_Step_0_gml_1525_0");
            scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
            myblcon.depth = other.depth - 100;
        }
    }
    
    if (btimer == 410)
    {
        with (obj_writer)
            instance_destroy();
        
        with (obj_lanino_enemy)
        {
            obj_lanino_enemy.head = 1271;
            global.typer = 50;
            msgsetloc(0, "Ha....&ha...", "obj_dbulletcontroller_slash_Step_0_gml_1538_0");
            scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
            myblcon.depth = other.depth - 100;
        }
    }
    
    if (btimer == 480)
    {
        with (obj_writer)
            instance_destroy();
        
        with (obj_lanino_enemy)
        {
            global.typer = 50;
            msgsetloc(0, "...&ha....", "obj_dbulletcontroller_slash_Step_0_gml_1550_0");
            scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
            myblcon.depth = other.depth - 100;
        }
    }
    
    if (btimer == 560)
    {
        with (obj_writer)
            instance_destroy();
        
        with (obj_lanino_enemy)
        {
            obj_lanino_enemy.head = 3264;
            global.typer = 50;
            msgsetloc(0, "...", "obj_dbulletcontroller_slash_Step_0_gml_1470_0");
            scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
            myblcon.depth = other.depth - 100;
        }
    }
    
    if (btimer == 700)
    {
        with (obj_writer)
            instance_destroy();
        
        with (obj_lanino_enemy)
            scr_move_to_rememberxy(8);
    }
}

if (type == 76)
{
    if (!made)
    {
        with (obj_elnina_enemy)
            scr_randomtarget();
        
        target = obj_elnina_enemy.mytarget;
        obj_growtangle.image_xscale = 3;
        obj_growtangle.image_yscale = 3;
        var _elnina_snow_ring = instance_create(obj_growtangle.x, (mean(scr_get_box(1), obj_growtangle.y) + 25) - 210, obj_elnina_snowring);
        scr_bullet_inherit(_elnina_snow_ring);
        _elnina_snow_ring.target = target;
        made = true;
    }
    
    if (btimer == 400 || btimer == 440 || btimer == 480 || btimer == 500)
    {
        with (obj_elnina_snowring)
            intensity = scr_approach(intensity, 4, 1);
    }
    
    if (btimer == 115)
    {
        with (obj_elnina_enemy)
        {
            global.typer = 50;
            msgsetloc(0, "SNOW&ATTACK!!&HA HA&HA!!!", "obj_dbulletcontroller_slash_Step_0_gml_1511_0");
            scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
        }
    }
    
    if (btimer == 200)
    {
        with (obj_writer)
            instance_destroy();
    }
    
    if (btimer == 260)
    {
        with (obj_elnina_enemy)
        {
            global.typer = 50;
            msgsetloc(0, "HA HA&HA!!!", "obj_dbulletcontroller_slash_Step_0_gml_1619_0");
            scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
        }
    }
    
    if (btimer == 320)
    {
        with (obj_writer)
            instance_destroy();
    }
    
    if (btimer == 350)
    {
        with (obj_elnina_enemy)
        {
            global.typer = 50;
            msgsetloc(0, "HA HA...&HA!!!", "obj_dbulletcontroller_slash_Step_0_gml_1633_0");
            scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
        }
    }
    
    if (btimer == 410)
    {
        with (obj_writer)
            instance_destroy();
        
        with (obj_elnina_enemy)
        {
            obj_elnina_enemy.head = 889;
            global.typer = 50;
            msgsetloc(0, "Ha....&ha...", "obj_dbulletcontroller_slash_Step_0_gml_1645_0");
            scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
        }
    }
    
    if (btimer == 480)
    {
        with (obj_writer)
            instance_destroy();
        
        with (obj_elnina_enemy)
        {
            global.typer = 50;
            msgsetloc(0, "...&ha....", "obj_dbulletcontroller_slash_Step_0_gml_1656_0");
            scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
        }
    }
    
    if (btimer == 560)
    {
        with (obj_writer)
            instance_destroy();
        
        with (obj_elnina_enemy)
        {
            obj_elnina_enemy.head = 4435;
            global.typer = 50;
            msgsetloc(0, "...", "obj_dbulletcontroller_slash_Step_0_gml_1575_0");
            scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
        }
    }
    
    if (btimer == 700)
    {
        with (obj_writer)
            instance_destroy();
        
        with (obj_elnina_enemy)
            scr_move_to_rememberxy(8);
    }
}

if (type == 77)
{
    if (init == 1)
    {
        photo = instance_create(maxx + 100, lerp(miny, maxy, 0.5), obj_shutta_photo_attack);
        photo.depth += 20;
        btimer = -12;
        init = 2;
        rate = 12;
    }
    
    if (btimer >= (rate - 6) && btimer < (rate - 5))
    {
        with (photo)
            DoFlip(1);
    }
    
    if (btimer >= rate)
    {
        var _axe = scr_childbullet(maxx + 80, lerp(miny, maxy, 0.5), obj_axebullet_shutta);
        snd_play(snd_laz_c);
        btimer = 0;
        made++;
    }
    
    if (special != 0)
    {
        if (made >= special)
        {
            made = 0;
            btimer = -45;
        }
    }
}

if (type == 78)
{
    if (init == 1)
    {
        siner = 0;
        init = 2;
        made = irandom(3) + 1;
        side = randomsign();
    }
    
    if (btimer >= (5 * ratio))
    {
        var _flame = scr_childbullet(lerp(minx, maxx, 0.5), miny, obj_toriel_fire_bullet);
        _flame.siner = siner;
        _flame.gravity = 0.15;
        _flame.dir = side;
        _flame.maxy = maxy - 8;
        made--;
        
        if (made == 0)
        {
            made = irandom(3) + 1;
            side = -side;
        }
        
        btimer = 0;
    }
    
    siner++;
}

if (type == 79)
{
    if (btimer > (30 * ratio))
    {
        side = irandom(1);
        var _xx = 0;
        var _yy = 0;
        
        if (side == 0)
            _xx = 120;
        
        if (side == 1)
            _yy = 120;
        
        var _bullet = scr_childbullet(obj_growtangle.x - _xx, obj_growtangle.y + _yy, obj_jigsawbullet);
        _bullet.side = side;
        _bullet = scr_childbullet(obj_growtangle.x + _xx, obj_growtangle.y - _yy, obj_jigsawbullet);
        _bullet.side = side + 2;
        btimer = 0;
    }
}

if (type == 97)
{
}

if (type == 98)
{
    if (init == 1)
    {
        init = 2;
        instance_create(obj_heart.x, obj_heart.y, obj_heart_follower);
        bulletmaker = instance_create(x, y, obj_knight_pointing_cone);
        btimer = 0;
        bulletmaker.difficulty = difficulty;
        endtimer = 120;
        
        if (difficulty >= 2)
        {
            endtimer += 30;
            global.turntimer += 60;
            endtimer += 60;
        }
        
        bulletmaker.endtimer = endtimer;
        delay = 0;
        subdelay = 0;
        global.turntimer += 30;
        
        if (difficulty == 0)
            side = choose(-1, 1);
    }
    else if (init >= 3)
    {
        exit;
    }
    
    if (global.turntimer <= (endtimer + 1))
    {
        init = 3;
    }
    else if ((made != 0 && btimer >= 4) || btimer >= 45)
    {
        if (difficulty == 2)
            side = choose(0, 66, -66);
        
        d = scr_childbullet(bulletmaker.x + 22, bulletmaker.y + 56, obj_knight_pointing_star);
        d.difficulty = difficulty;
        d.side = side;
        starsound = snd_play_pitch(snd_stardrop, 0.5);
        snd_volume(starsound, 0.5, 0);
        
        if (made == 0)
        {
            size = random_range(0.5, 1);
            special = random_range(-0.5, 0.5);
        }
        else
        {
            special += 0.5;
            special += (0.5 + (sin(random(1)) * 0.3));
            special %= 1;
            special -= 0.5;
            size += (0.5 + (sin(made) * 0.5));
            size %= 1;
        }
        
        var _dir = 180 + (special * bulletmaker.angle);
        
        if (size <= 0.1)
        {
            var _heartdir = point_direction(bulletmaker.x + 22, bulletmaker.y + 56, obj_heart.x + 10, obj_heart.y + 10);
            
            if (abs(angle_difference(_heartdir, _dir)) < 20)
            {
                if (_dir < _heartdir)
                    _dir = (_heartdir - 20) + angle_difference(_heartdir, _dir);
                else
                    _dir = _heartdir + 20 + angle_difference(_heartdir, _dir);
                
                _dir = scr_loop_ext(_dir, 180 - bulletmaker.angle, 180 + bulletmaker.angle);
            }
        }
        
        d.direction = _dir;
        d.speed = lerp(10, 5, size);
        d.grow_Speed = lerp(0.1, 0.25, size);
        made++;
        btimer = 0;
    }
}

if (type == 99)
{
    if (!made)
    {
        with (creatorid)
            image_alpha = 0;
        
        var _slasher = instance_create(creatorid.x, creatorid.y, obj_roaringknight_boxsplitter_attack);
        scr_bullet_inherit(_slasher);
        _slasher.difficulty = difficulty;
        
        with (_slasher)
        {
            turn_type = "full";
            event_user(0);
        }
        
        made = true;
    }
}

if (type == 100)
{
    if (made == false)
    {
        made = true;
        
        with (creatorid)
            image_alpha = 0;
        
        var roarknight_slasher = instance_create(creatorid.x, creatorid.y, obj_knight_slasher);
        scr_bullet_inherit(roarknight_slasher);
    }
}

if (type == 101)
{
    if (!made)
    {
        made = true;
        obj_growtangle.x -= 70;
        obj_heart.x -= 70;
        obj_growtangle.image_xscale = 2.5;
        
        with (creatorid)
            image_alpha = 0;
        
        var roarknight_tunnel_slasher = instance_create(creatorid.x, creatorid.y, obj_knight_tunnel_slasher);
        scr_bullet_inherit(roarknight_tunnel_slasher);
    }
}

if (type == 102)
{
    if (!made)
    {
        global.turntimer = 999999;
        made = true;
        var knight_swordtunnel = instance_create(creatorid.x, creatorid.y, obj_knight_tunnel_slasher_2_revised);
        scr_bullet_inherit(knight_swordtunnel);
        
        with (knight_swordtunnel)
            event_user(0);
        
        with (creatorid)
            image_alpha = 0;
    }
}

if (type == 103)
{
    if (made == false)
    {
        obj_growtangle.image_xscale = 3.5;
        obj_growtangle.image_yscale = 3.5;
        made = true;
        
        with (creatorid)
            image_alpha = 0;
        
        var knight_stream = instance_create(creatorid.x, creatorid.y, obj_knight_stream);
        scr_bullet_inherit(knight_stream);
    }
}

if (type == 104)
{
    if (made == false)
    {
        global.turntimer = 999999;
        made = true;
        
        with (creatorid)
            image_alpha = 0;
        
        var knight_stream = instance_create(creatorid.x, creatorid.y, obj_knight_rotating_slash);
        knight_stream.difficulty = difficulty;
        
        with (knight_stream)
            event_user(0);
        
        scr_bullet_inherit(knight_stream);
    }
}

if (type == 105)
{
    if (!made)
    {
        with (creatorid)
            image_alpha = 0;
        
        global.turntimer = 999999;
        var knight_combo = instance_create(0, 0, obj_knight_combinations);
        scr_bullet_inherit(knight_combo);
        
        with (knight_combo)
            event_user(0);
        
        made = true;
    }
}

if (type == 106)
{
    if (!made)
    {
        with (obj_knight_enemy)
        {
            with (instance_create_depth(x, y, depth, obj_knight_warp))
            {
                master = other.id;
                event_user(1);
            }
        }
        
        obj_growtangle.image_xscale = 2;
        obj_growtangle.image_yscale = 2;
        global.turntimer = 999999;
        made = true;
        
        with (creatorid)
            image_alpha = 0;
        
        var knight_weird = instance_create(creatorid.x, creatorid.y, obj_knight_weird_bottom_manager);
        scr_bullet_inherit(knight_weird);
        
        with (knight_weird)
            event_user(0);
    }
}

if (type == 107)
{
    if (made == false)
    {
        global.turntimer = 999999;
        made = true;
        
        with (creatorid)
            image_alpha = 0;
        
        var knight_roarin2 = instance_create(creatorid.x, creatorid.y, obj_knight_roaring2);
        knight_roarin2.target = 3;
        scr_bullet_inherit(knight_roarin2);
    }
}

if (type == 108)
{
    if (made == false)
    {
        global.turntimer = 999999;
        made = true;
        
        with (creatorid)
            image_alpha = 0;
        
        var knight_swordfall = instance_create(creatorid.x, creatorid.y, obj_knight_swordfall);
        knight_swordfall.target = 3;
        knight_swordfall.difficulty = difficulty;
        scr_bullet_inherit(knight_swordfall);
        
        with (knight_swordfall)
        {
            turn_type = "full";
            turn_segment = -1;
            next_up = -999;
            turn_segment = 0;
            event_user(0);
        }
        
        if (difficulty == 1)
        {
        }
    }
}

if (type == 109)
{
    if (!made)
    {
        with (creatorid)
        {
            with (instance_create_depth(x, y, depth, obj_knight_warp))
            {
                master = other.id;
                event_user(1);
            }
        }
        
        made = true;
        d = instance_create((camerax() + 480 + 80) - 80, cameray() + 160, obj_bullet_knight_crescentGenerator);
        
        if (difficulty == 1)
            d.type = 3;
    }
}

if (type == 110)
{
    if (!made && obj_growtangle.growcon == 2)
    {
        var _ribbick_repeat;
        
        if (!instance_exists(obj_ribbick_battle_frog))
            _ribbick_repeat = 2;
        else
            _ribbick_repeat = 1;
        
        var _ribbick_frog;
        
        repeat (_ribbick_repeat)
        {
            _ribbick_frog = instance_create(scr_get_box(4) + irandom_range(-51, 53), scr_get_box(3) - 22, obj_ribbick_battle_frog);
            
            if (i_ex(obj_growtangle))
                _ribbick_frog.depth = obj_growtangle.depth - 1;
            
            _ribbick_frog.target = target;
            _ribbick_frog.damage = 70;
        }
        
        scr_bullet_inherit(_ribbick_frog);
        var _ribbick_frogcount = instance_number(obj_ribbick_battle_frog);
        var _ribbick_froglist = ds_list_create();
        
        with (obj_ribbick_battle_frog)
            ds_list_add(_ribbick_froglist, id);
        
        ds_list_shuffle(_ribbick_froglist);
        
        for (a = 0; a < ds_list_size(_ribbick_froglist); a++)
        {
            var _ribbick_current_frog = ds_list_find_value(_ribbick_froglist, a);
            var _ribbick_count_ratio = 1;
            
            if (scr_monsterpop() == 2)
                _ribbick_count_ratio = 2;
            
            if (scr_monsterpop() == 3)
                _ribbick_count_ratio = 5;
            
            _ribbick_current_frog.alarm[0] = 10 + floor(((10 + (_ribbick_count_ratio * 30)) / _ribbick_frogcount) * (a + 0.25));
            _ribbick_current_frog.wait_time = 10 + (10 + (_ribbick_count_ratio * 30));
        }
        
        ds_list_shuffle(_ribbick_froglist);
        
        for (a = 0; a < ds_list_size(_ribbick_froglist); a++)
        {
            var _ribbick_current_frog = ds_list_find_value(_ribbick_froglist, a);
            _ribbick_current_frog.x = scr_get_box(2) + 34 + ((84 / (ds_list_size(_ribbick_froglist) - 1)) * a) + irandom_range(-5, 5);
            _ribbick_current_frog.image_xscale = sign(scr_get_box(4) - _ribbick_current_frog.x);
            
            if (_ribbick_current_frog.image_xscale == 0)
                _ribbick_current_frog.image_xscale = 1;
        }
        
        ds_list_destroy(_ribbick_froglist);
        made = true;
    }
}

if (type == 111)
{
    if (!made)
    {
        if (!instance_exists(obj_ribbick_battle_fly_manager))
        {
            var _ribbick_fly = instance_create(x, y, obj_ribbick_battle_fly_manager);
            scr_bullet_inherit(_ribbick_fly);
            _ribbick_fly.ratio = ratio;
            _ribbick_fly.sameattack = sameattack;
            _ribbick_fly.target = target;
            _ribbick_fly.damage = 70;
        }
    }
}

if (type == 112)
{
    bmax = 34;
    
    if (scr_monsterpop() == 2)
        bmax = 46;
    
    if (scr_monsterpop() == 3)
        bmax = 60;
    
    if (btimer >= bmax)
    {
        rab = instance_create(obj_battlesolid.x + obj_battlesolid.sprite_width, obj_battlesolid.y, obj_rabbitbullet);
        scr_bullet_inherit(rab);
        rab.damage = 55;
        btimer = 0;
    }
}

if (type == 120)
{
    if (made == false)
    {
        made = true;
        
        if (scr_debug() && keyboard_check(vk_shift))
            special += 1;
        
        if (scr_debug() && keyboard_check(vk_control))
            special += 2;
        
        if (scr_debug() && keyboard_check(vk_alt))
            special += 4;
        
        var pippins_count_true = 0;
        
        for (var i = 0; i < instance_number(obj_pippins_enemy); i++)
        {
            enemy[i] = instance_find(obj_pippins_enemy, i);
            
            if (enemy[i].bet)
                special = 1;
            
            if (enemy[i].fixedbet)
                special = 2;
            
            if (enemy[i].cheat)
                special = 4;
            
            if (image_alpha != 0)
                pippins_count_true++;
        }
        
        if (pippins_count_true == 3)
            n = 4;
        
        if (pippins_count_true == 2)
            n = 3;
        
        if (pippins_count_true == 1)
            n = 2;
        
        if (i_ex(obj_zapper_enemy))
            n = 3;
        
        if (special == 2)
            n++;
        
        if (special == 4)
            n--;
        
        difficulty = irandom(5);
    }
    
    if (n > 0 && btimer > 99 && i_ex(obj_growtangle))
    {
        n--;
        btimer = 88;
        var flags = special;
        show_debug_message("flags: " + string(flags));
        
        with (instance_create((obj_growtangle.x - 60) + random(120), obj_growtangle.y - 90 - random(30), obj_bullet_dice))
        {
            if (flags & 1)
                mercified = true;
            
            if (flags & 2)
            {
                slowed_rotate = 1.5;
                mercified = true;
            }
            
            if (flags & 4)
                sprite_index = spr_bullet_dice_all4s;
            
            target = other.target;
            damage = 66;
            
            if (other.difficulty == 0)
            {
                if (other.n == 0)
                    image_index = 1;
                
                if (other.n == 1)
                    image_index = 5;
                
                if (other.n == 2)
                    image_index = 5;
                
                if (other.n == 3)
                    image_index = 5;
            }
            
            if (other.difficulty == 1)
            {
                if (other.n == 0)
                    image_index = 5;
                
                if (other.n == 1)
                    image_index = 8;
                
                if (other.n == 2)
                    image_index = 12;
                
                if (other.n == 3)
                    image_index = 8;
            }
            
            if (other.difficulty == 2)
            {
                if (other.n == 0)
                    image_index = 5;
                
                if (other.n == 1)
                    image_index = 5;
                
                if (other.n == 2)
                    image_index = 1;
                
                if (other.n == 3)
                    image_index = 5;
            }
            
            if (other.difficulty == 3)
            {
                if (other.n == 0)
                    image_index = 12;
                
                if (other.n == 1)
                    image_index = 5;
                
                if (other.n == 2)
                    image_index = 5;
                
                if (other.n == 3)
                    image_index = 8;
            }
            
            if (other.difficulty == 4)
            {
                if (other.n == 0)
                    image_index = 5;
                
                if (other.n == 1)
                    image_index = 5;
                
                if (other.n == 2)
                    image_index = 12;
                
                if (other.n == 3)
                    image_index = 12;
            }
            
            if (other.difficulty == 5)
            {
                if (other.n == 0)
                    image_index = 5;
                
                if (other.n == 1)
                    image_index = 1;
                
                if (other.n == 2)
                    image_index = 5;
                
                if (other.n == 3)
                    image_index = 8;
            }
        }
    }
    
    if (!i_ex(obj_bullet_dice) && global.turntimer > 30)
        global.turntimer = 30;
}

if (type == 125)
{
    if (!made)
    {
        var _tenna_allstars = instance_create(obj_growtangle.x, cameray(), obj_tenna_allstars_manager);
        scr_bullet_inherit(_tenna_allstars);
        _tenna_allstars.difficulty = difficulty;
        made = true;
    }
}

if (type == 127)
{
    if (!made)
    {
        made = true;
        my_angle = random(360);
    }
    
    if (btimer == 110)
        instance_create(obj_growtangle.x + lengthdir_x(60, my_angle), obj_growtangle.y + lengthdir_y(60, my_angle), obj_lensflare_manager);
    
    if (btimer == 125)
        instance_create(obj_growtangle.x + lengthdir_x(60, my_angle + 180), obj_growtangle.y + lengthdir_y(60, my_angle + 180), obj_lensflare_manager);
}

if (type == 126)
{
    if (!made)
    {
        var _tenna_smashcut = instance_create(obj_growtangle.x, obj_growtangle.y, obj_tenna_smashcut_attack);
        scr_bullet_inherit(_tenna_smashcut);
        made = true;
    }
}

if (type == 128 || type == 129)
{
    if (!made)
    {
        made = true;
        side1 = irandom(3);
        side2 = side1 + 1;
        side1 *= 90;
        side2 *= 90;
    }
    
    if (btimer == 103 || (type == 128 && btimer == 117))
    {
        var dir;
        
        if (btimer == 103)
            dir = side1;
        else
            dir = side2;
        
        var maindist = 150;
        var sidedist = 0;
        var xdist = lengthdir_x(maindist, dir) + lengthdir_x(sidedist, dir + 90);
        var ydist = lengthdir_y(maindist, dir) + lengthdir_y(sidedist, dir + 90);
        var firedir = 142 + dir + (11 * (btimer == 103));
        
        with (scr_fire_bullet(obj_growtangle.x + xdist, obj_growtangle.y + ydist, 289, firedir, 6))
        {
            damage = other.damage;
            target = other.target;
            scr_lerpvar("speed", speed, 3.75, 30);
        }
    }
    
    var rate1 = 78;
    var rate2 = 50;
    
    if (type == 129)
    {
        rate1 = 27;
        rate2 = 20;
    }
    
    if ((btimer % rate1) == rate2)
    {
        snd_play(snd_rimshot);
        
        with (obj_tenna_rimshot_star)
            rimshot_timer = 74;
    }
}

if (type == 130)
{
    if (!made)
    {
        var _mascot_attack = instance_create(obj_growtangle.x, obj_growtangle.y, obj_elnina_mascotattack);
        _mascot_attack.attacktype = special;
        _mascot_attack.favored = side;
        _mascot_attack.type = difficulty;
        scr_bullet_inherit(_mascot_attack);
        made = true;
    }
    
    if (special != 4)
        exit;
    
    if (global.turntimer < 500 && init == 1)
    {
        global.typer = 50;
        init = 2;
        
        if (side == 1)
        {
            with (obj_elnina_enemy)
            {
                msgsetloc(0, "Nice move,&huh, Lanino!?", "obj_dbulletcontroller_slash_Step_0_gml_2437_0");
                scr_enemyblcon(x + 40, global.monstery[myself] - 70, 13);
                myblcon.depth = other.depth - 100;
            }
        }
        else
        {
            with (obj_lanino_enemy)
            {
                msgsetloc(0, "Nice move,&huh, Elnina!?", "obj_dbulletcontroller_slash_Step_0_gml_2446_0");
                
                if (global.lang == "ja")
                    scr_enemyblcon(x - 60, global.monstery[myself] + 70, 12.1);
                else
                    scr_enemyblcon(x - 60, global.monstery[myself] + 70, 12);
                
                myblcon.depth = other.depth - 100;
            }
        }
    }
    
    if (global.turntimer < 400 && init == 2)
    {
        init = 3;
        
        with (obj_writer)
            instance_destroy();
    }
    
    if (global.turntimer < 350 && init == 3)
    {
        init = 4;
        global.typer = 50;
        
        if (side == 1)
        {
            with (obj_elnina_enemy)
            {
                head = 3799;
                msgsetloc(0, "... Lanino?", "obj_dbulletcontroller_slash_Step_0_gml_2469_0");
                scr_enemyblcon(x + 40, global.monstery[myself] - 70, 13);
                myblcon.depth = other.depth - 100;
            }
        }
        else
        {
            with (obj_lanino_enemy)
            {
                head = 4544;
                msgsetloc(0, "...&Elnina?", "obj_dbulletcontroller_slash_Step_0_gml_2479_0");
                
                if (global.lang == "ja")
                    scr_enemyblcon(x - 60, global.monstery[myself] + 70, 12.2);
                else
                    scr_enemyblcon(x - 60, global.monstery[myself] + 70, 12.2);
                
                myblcon.depth = other.depth - 100;
            }
        }
    }
    
    if (global.turntimer < 250 && init == 4)
    {
        init = 5;
        
        with (obj_writer)
            instance_destroy();
    }
    
    if (global.turntimer < 200 && init == 5)
    {
        init = 6;
        global.typer = 50;
        
        if (side == 1)
        {
            msgsetloc(0, "... oh...", "obj_dbulletcontroller_slash_Step_0_gml_2532_0");
            
            with (obj_elnina_enemy)
            {
                head = 4435;
                scr_enemyblcon(x + 40, global.monstery[myself] - 70, 13);
                myblcon.depth = other.depth - 100;
            }
        }
        else
        {
            with (obj_lanino_enemy)
            {
                head = 3264;
                msgsetloc(0, "...&oh...", "obj_dbulletcontroller_slash_Step_0_gml_2542_0");
                
                if (global.lang == "ja")
                    scr_enemyblcon(x - 5, global.monstery[myself] + 70, 12.4);
                else
                    scr_enemyblcon(x - 5, global.monstery[myself] + 70, 12.3);
                
                myblcon.depth = other.depth - 100;
            }
        }
    }
    
    if (global.turntimer < 100 && init == 6)
    {
        init = 7;
        
        with (obj_writer)
            instance_destroy();
    }
}

if (type == 135)
{
    if (!made)
    {
        if (i_ex(obj_heart) && i_ex(obj_growtangle))
        {
            var rainbullet = instance_create(obj_growtangle.x, obj_growtangle.y, obj_watercooler_bullet_rainball);
            scr_bullet_inherit(rainbullet);
            rainbullet.special = special;
            made = 1;
        }
    }
}

if (type == 136)
{
    if (!made)
    {
        if (i_ex(obj_heart) && i_ex(obj_growtangle))
        {
            var rainbullet = instance_create(obj_growtangle.x - 50, obj_growtangle.y, obj_watercooler_bullet_rainball);
            scr_bullet_inherit(rainbullet);
            rainbullet.special = special;
            rainbullet.threshold = 7;
            rainbullet.side = -1;
            rainbullet.amount = 2;
            rainbullet = instance_create(obj_growtangle.x + 50, obj_growtangle.y, obj_watercooler_bullet_rainball);
            scr_bullet_inherit(rainbullet);
            rainbullet.special = special;
            rainbullet.side = 1;
            rainbullet.threshold = 7;
            rainbullet.amount = 2;
            made = 1;
        }
    }
}

if (type == 140)
{
    if (!made)
    {
        var _mascot_attack = instance_create(obj_growtangle.x, obj_growtangle.y, obj_elnina_mascotattack);
        _mascot_attack.attacktype = special;
        _mascot_attack.favored = side;
        scr_bullet_inherit(_mascot_attack);
        made = true;
        var umbrella = instance_create(obj_growtangle.x, obj_growtangle.y, obj_elnina_umbrella);
    }
}

if (type == 141)
{
    if (!made)
    {
        var bouncybullet = instance_create(obj_growtangle.x + 20, cameray() + 40, obj_elnina_bouncingbullet);
        scr_bullet_inherit(bouncybullet);
        bouncybullet.difficulty = difficulty;
        bouncybullet.image_blend = c_yellow;
        
        if (difficulty == 0)
        {
            bouncybullet.difficulty = 2;
            bouncybullet.bounce_count = 20;
        }
        
        made = true;
        
        with (obj_elnina_umbrella)
            sprite_index = spr_ch3_elnina_umbrella;
    }
}

if (type == 145)
{
    if (btimer >= 30 && (btimer % 6) == 0)
    {
        var firebullet = instance_create(obj_growtangle.x, obj_growtangle.y - 150, obj_regularbullet);
        scr_bullet_inherit(firebullet);
        
        with (firebullet)
        {
            sprite_index = spr_ch3_bullet_raindrop;
            speed = 4 + random_range(-2, 3);
            direction = point_direction(x, y, obj_heart.x + 10, obj_heart.y + 10) + random_range(-25, 25);
            image_angle = direction + 90;
            grazepoints = 3;
        }
    }
}

if (type == 146 && i_ex(obj_heart))
{
    if (made == 0)
    {
        timermax = 8;
        made = 1;
    }
    
    if (btimer >= timermax)
    {
        btimer = 0;
        var dir = 30 + random(120);
        radius = 140 + random(80);
        var xx = lengthdir_x(radius, dir);
        var yy = lengthdir_y(radius, dir);
        bm = instance_create(obj_heart.x + 8 + xx, obj_heart.y + 8 + yy, obj_dbullet_maker);
        bm.grazepoints = 3;
        
        if (bm.y < (__view_get(e__VW.YView, 0) + 40))
            bm.y = __view_get(e__VW.YView, 0) + 40;
        
        bm.damage = damage;
        bm.target = target;
    }
}

if (type == 147)
{
    if (made == 0)
    {
        btimer = 50;
        made = 1;
    }
    
    if (btimer >= 50)
    {
        btimer = 18;
        var amount = 5;
        var mydirection = choose(0, 90, 180, 270);
        
        for (var i = 0; i < amount; i++)
        {
            var xx = lengthdir_x(150, mydirection);
            var yy = lengthdir_y(150, mydirection);
            var offsety = lengthdir_y(82, mydirection - 90);
            var offsetx = lengthdir_x(82, mydirection - 90);
            var firebullet = instance_create(obj_growtangle.x + xx + lerp(-offsetx, offsetx, (i + 0.5) / amount), obj_growtangle.y + yy + lerp(-offsety, offsety, (i + 0.5) / amount), obj_regularbullet);
            scr_bullet_inherit(firebullet);
            
            with (firebullet)
            {
                sprite_index = spr_ch3_bullet_raindrop;
                direction = mydirection + 180;
                image_angle = mydirection + 270;
                speed = 3.3 - ((i * 2.2) / amount);
                grazepoints = 3;
            }
        }
    }
}

if (type == 150)
{
    if (!made)
    {
        instance_create(x, y, obj_lightemup_controller);
        made = true;
    }
}

if (type == 151)
{
    if (!made)
    {
        var _manager = instance_create(obj_growtangle.x, cameray(), obj_tracking_swords_manager);
        scr_bullet_inherit(_manager);
        _manager.variant = difficulty;
        _manager.damage = damage;
        
        with (_manager)
            event_user(0);
        
        made = true;
    }
}

if (type == 152)
{
    if (!made)
    {
        var _manager = instance_create(obj_growtangle.x, cameray(), obj_diagonal_bullet_manager);
        scr_bullet_inherit(_manager);
        _manager.difficulty = difficulty;
        made = true;
    }
}

if (type == 153)
{
    if (!made)
    {
        var _manager = instance_create(obj_growtangle.x, cameray(), obj_sword_tunnel_manager);
        scr_bullet_inherit(_manager);
        _manager.difficulty = difficulty;
        _manager.damage = damage;
        
        with (_manager)
            event_user(0);
        
        made = true;
    }
}

if (type == 154)
{
    if (!made)
    {
        var _manager = instance_create(obj_growtangle.x, cameray(), obj_sword_vortex_manager);
        scr_bullet_inherit(_manager);
        _manager.variant = difficulty;
        _manager.damage = damage;
        made = true;
    }
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
