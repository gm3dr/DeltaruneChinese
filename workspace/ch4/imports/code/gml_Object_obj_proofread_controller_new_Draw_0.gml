if (init == 0)
{
    if (!easyproof)
    {
        movespeed = 10;
        acttimermax = 110;
    }
    
    init = 1;
}

if (acttimer >= 10)
    timer++;

if (timer > movespeed && con == 0)
{
    snd_play(snd_menumove);
    timer = 0;
    currentchoice++;
    
    if (currentchoice == 4)
        currentchoice = 1;
}

var _x = camerax() + (camerawidth() / 2);
var _y = (cameray() + (cameraheight() / 2)) - 70;
draw_sprite_ext(spr_battleblcon_book_enemy, 0, _x, _y - 80, 1, 0.62, 0, c_white, 1);
draw_sprite_ext(spr_battleblcon_book_enemy, 0, _x, _y, 1, 0.62, 0, c_white, 1);
draw_sprite_ext(spr_battleblcon_book_enemy, 0, _x, _y + 80, 1, 0.62, 0, c_white, 1);
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_set_font(fnt_mainbig);
var _textscale = 1;
/*
if (rand == 9 && global.lang != "ja")
    _textscale = 0.7;
else
    _textscale = 1;
*/
draw_text_ext_transformed(_x, _y - 80 - 16, str1, 9999, 9999, _textscale, 1, 0);
draw_text_ext_transformed(_x, _y - 16, str2, 9999, 9999, _textscale, 1, 0);
draw_text_ext_transformed(_x, (_y + 80) - 16, str3, 9999, 9999, _textscale, 1, 0);
draw_set_color(c_white);
draw_set_halign(fa_left);
highlightindex += 0.5;

if (currentchoice == 1)
{
    if (con == 0)
        draw_sprite_ext(spr_heart, 0, _x - 104, _y - 88, 1, 1, 0, c_white, 1);
    
    draw_sprite_ext(spr_battleblcon_book_enemy_highlight, highlightindex, _x, _y - 80, 1, 1, 0, dottedlinecolor1, 1);
}
else
{
    draw_sprite_ext(spr_battleblcon_book_enemy_highlight, highlightindex, _x, _y - 80, 1, 1, 0, dottedlinecolor2, 1);
}

if (currentchoice == 2)
{
    if (con == 0)
        draw_sprite_ext(spr_heart, 0, _x - 104, _y - 8, 1, 1, 0, c_white, 1);
    
    draw_sprite_ext(spr_battleblcon_book_enemy_highlight, highlightindex, _x, _y, 1, 1, 0, dottedlinecolor1, 1);
}
else
{
    draw_sprite_ext(spr_battleblcon_book_enemy_highlight, highlightindex, _x, _y, 1, 1, 0, dottedlinecolor2, 1);
}

if (currentchoice == 3)
{
    if (con == 0)
        draw_sprite_ext(spr_heart, 0, _x - 104, _y + 72, 1, 1, 0, c_white, 1);
    
    draw_sprite_ext(spr_battleblcon_book_enemy_highlight, highlightindex, _x, _y + 80, 1, 1, 0, dottedlinecolor1, 1);
}
else
{
    draw_sprite_ext(spr_battleblcon_book_enemy_highlight, highlightindex, _x, _y + 80, 1, 1, 0, dottedlinecolor2, 1);
}

if (con == 0)
    acttimer++;

if (acttimer > acttimermax)
{
    snd_play(snd_error);
    instance_destroy();
    
    with (obj_writer)
        instance_destroy();
    
    msgsetloc(0, "* Out of time!", "obj_proofread_controller_new_slash_Draw_0_gml_77_0");
    global.fc = 0;
    global.typer = 4;
    
    with (instance_create(camerax() + 30, cameray() + 376, obj_writer))
    {
        dialoguer = 1;
        facer = 1;
        charline = 26;
        preventcskip = 1;
    }
    
    instance_destroy();
    exit;
}

if (con == 0 && acttimer > 12 && (button1_p() || button3_p()))
{
    if (currentchoice == correctchoice)
        con = 1;
    else
        con = 2;
    
    if (easyproof == 1)
        scr_monster_make_tired(creatorid.myself);
}

if (con == 1)
{
    endtimer++;
    
    if (endtimer == 2)
    {
        snd_play(snd_coin);
        var mercy = 100;
        
        if (easyproof == 1)
            mercy = 100;
        
        scr_mercyadd(creatorid.myself, mercy);
        
        with (obj_writer)
            instance_destroy();
        
        msgsetloc(0, "* Success!", "obj_proofread_controller_new_slash_Draw_0_gml_104_0");
        global.fc = 0;
        global.typer = 4;
        
        with (instance_create(camerax() + 30, cameray() + 376, obj_writer))
        {
            dialoguer = 1;
            facer = 1;
            charline = 26;
            preventcskip = 1;
        }
    }
    
    colortimer++;
    
    if (colortimer == 3)
    {
        colortimer = 0;
        
        if (dottedlinecolor1 == 255 || dottedlinecolor1 == 65535)
        {
            dottedlinecolor1 = 16777215;
            dottedlinecolor2 = 16711680;
        }
        else if (dottedlinecolor1 == 16777215)
        {
            dottedlinecolor1 = 65535;
        }
    }
    
    if (((button3_p() || button1_p()) && endtimer > 17) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
    }
    
    if (endtimer >= 60 && !i_ex(obj_writer))
        instance_destroy();
}

if (con == 2)
{
    endtimer++;
    
    if (endtimer == 2)
    {
        snd_play(snd_error);
        
        with (obj_writer)
            instance_destroy();
        
        msgsetloc(0, "* ..^1. but^1, it was misspelled!", "obj_proofread_controller_new_slash_Draw_0_gml_134_0");
        global.fc = 0;
        global.typer = 4;
        
        with (instance_create(camerax() + 30, cameray() + 376, obj_writer))
        {
            dialoguer = 1;
            facer = 1;
            charline = 26;
            preventcskip = 1;
        }
        
        with (global.monsterinstance[creatorid.myself])
        {
            shakex = 9;
            state = 3;
            hurttimer = 30;
        }
    }
    
    colortimer++;
    
    if (colortimer == 3)
    {
        colortimer = 0;
        
        if (dottedlinecolor1 == 255 || dottedlinecolor1 == 255)
        {
            dottedlinecolor1 = 16777215;
            dottedlinecolor2 = 16711680;
        }
        else if (dottedlinecolor1 == 16777215)
        {
            dottedlinecolor1 = 255;
        }
    }
    
    if (((button3_p() || button1_p()) && endtimer > 17 && endtimer > 17) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
    }
    
    if (endtimer >= 60 && !i_ex(obj_writer))
        instance_destroy();
}
