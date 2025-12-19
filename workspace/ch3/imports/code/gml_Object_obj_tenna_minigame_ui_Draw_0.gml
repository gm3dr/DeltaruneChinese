if (i_ex(obj_tenna_zoom) && (obj_tenna_zoom.minigameinsanityintro || obj_tenna_enemy.phaseturn == 18))
{
    var _channelnumber = string(channelnumber);
    
    if (channelnumber < 10)
        _channelnumber = "0" + string(channelnumber);
    
    draw_set_font(fnt_mainbig);
    
    if (!i_ex(obj_tvturnoff_manager))
        draw_text_color((camerax() + camerawidth()) - 70, cameray() + 10, "Ch" + string(_channelnumber), c_lime, c_lime, c_lime, c_lime, 1);
}

if (enabled == false)
    exit;

if (!i_ex(obj_tenna_enemy))
    exit;

if (i_ex(obj_actor_tenna) && obj_actor_tenna.lightemupcon == 5)
    exit;

if (i_ex(obj_border_controller))
    depth = obj_border_controller.depth + 2;

if (obj_tenna_enemy.phaseturn == 18)
    depth = obj_battlecontroller.depth - 100;
else if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanityintro)
    exit;

draw_set_font(fnt_main);
draw_set_color(c_white);
draw_set_halign(fa_left);
var blackbg1_x = 0;
var blackbg1_y = 0;
var blackbg1_scale = 40;
var blackbg2_x = 0;
var blackbg2_y = 380;
var blackbg2_scale = 100;
var barsize = 150;
var bar_x = 30;
var bar_y = 400;
var score_x = 33;
var score_y = 420;
var box_x = 428;
var box_y = 402;
var scale = 1;

if (minigametype == "battle")
{
    if (minigamedifficulty == 0)
    {
        timer += 1;
        barsize = 150 - (150 * (timer / 215));
        
        if (barsize < 0)
            barsize = 0;
    }
    
    if (minigamedifficulty == 1)
    {
        if (i_ex(obj_lightemup_controller) && obj_lightemup_controller.starttimer)
            timer += 1;
        
        barsize = 150;
        barsize = 150 - (150 * (timer / 270));
        
        if (barsize < 0)
            barsize = 0;
    }
    
    if (minigamedifficulty == 2)
    {
        timer += 1;
        barsize = 150 - (150 * (timer / 300));
        
        if (barsize < 0)
            barsize = 0;
    }
    
    if (minigamedifficulty == 3)
    {
        barsize = 150;
        
        if (i_ex(obj_shadowman_sharpshoot_target))
            barsize = 150 * (obj_shadowman_sharpshoot_target.tennahp / obj_shadowman_sharpshoot_target.tennahpmax);
        
        if (barsize < 0)
            barsize = 0;
        
        blackbg1_scale = 0;
        blackbg2_scale = 0;
        bar_x = 3;
        bar_y = 330;
        score_x = 53;
        score_y = 50;
        box_y = 32;
    }
}

if (minigametype == "music")
{
    timer += 1;
    barsize = 150 - (150 * (timer / 320));
    
    if (barsize < 0)
        barsize = 0;
    
    blackbg1_scale = 0;
    blackbg2_y = 410;
    bar_y = 420;
    score_y = 440;
    box_y = 422;
}

if (minigametype == "cowboy")
{
    timer += 1;
    barsize = 150 - (150 * (timer / 270));
    
    if (barsize < 0)
        barsize = 0;
    
    blackbg1_scale = 20;
    blackbg2_y = 385;
}

if (minigametype == "susiezilla")
{
    if (minigamedifficulty == 2)
    {
        timer += 1;
        barsize = 150 - (150 * (timer / 300));
        
        if (barsize < 0)
            barsize = 0;
    }
    
    if (minigamedifficulty == 3 || minigamedifficulty == 4)
    {
        barsize = 60;
        
        if (i_ex(obj_susiezilla_singlescreen_kickboxin_tenna))
            barsize = 60 * (obj_susiezilla_singlescreen_kickboxin_tenna.hp / obj_susiezilla_singlescreen_kickboxin_tenna.maxhp);
        
        if (barsize < 0)
            barsize = 0;
    }
    
    if (minigamedifficulty == 5)
    {
        timer += 1;
        barsize = 150 - (150 * (timer / 180));
        
        if (barsize < 0)
            barsize = 0;
    }
    
    blackbg1_scale = 0;
}

if (minigametype == "cooking")
{
    if (minigamedifficulty == 1 || minigamedifficulty == 3)
    {
        barsize = 60;
        
        if (i_ex(obj_chefs_customer))
            barsize = 60 * (obj_chefs_customer.foods_needed / 6);
        
        if (barsize < 0)
            barsize = 0;
        
        blackbg1_scale = 90;
        blackbg2_scale = 0;
        bar_y = 30;
        score_x = 83;
        score_y = 50;
        box_y = 32;
    }
    else
    {
        timer += 1;
        barsize = 150 - (150 * (timer / 300));
        
        if (barsize < 0)
            barsize = 0;
        
        if (i_ex(obj_chefs_kris) && obj_chefs_kris.stun < 1 && (timer % 12) == 0)
            scr_tenna_add_score(1);
    }
}

if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity == true)
    timer = 0;

draw_sprite_ext(spr_whitepixel, 0, camerax() + blackbg1_x, cameray() + blackbg1_y, camerawidth(), blackbg1_scale, 0, c_black, 1);
draw_sprite_ext(spr_whitepixel, 0, camerax() + blackbg2_x, cameray() + blackbg2_y, camerawidth(), blackbg2_scale, 0, c_black, 1);

if (minigametype == "cooking" && (minigamedifficulty == 1 || minigamedifficulty == 3))
{
    draw_text_transformed(camerax() + score_x + 140, ((cameray() + bar_y) - 5) + 70, /*"ENEMY"*/"敌人", 3, 2, 0);
    draw_sprite_ext(spr_whitepixel, 0, camerax() + bar_x + 116 + 190, cameray() + bar_y + 4 + 70, 60, 14, 0, c_red, 1);
    draw_sprite_ext(spr_whitepixel, 0, camerax() + bar_x + 116 + 190, cameray() + bar_y + 4 + 70, barsize, 14, 0, c_white, 1);
}
else if (minigametype == "battle" && minigamedifficulty == 3)
{
    draw_text_transformed(camerax() + score_x + 140, ((cameray() + bar_y) - 5) + 70, /*"ENEMY"*/"敌人", 3, 2, 0);
    draw_sprite_ext(spr_whitepixel, 0, camerax() + bar_x + 116 + 190, cameray() + bar_y + 4 + 70, 150, 14, 0, c_red, 1);
    draw_sprite_ext(spr_whitepixel, 0, camerax() + bar_x + 116 + 190, cameray() + bar_y + 4 + 70, barsize, 14, 0, c_white, 1);
}
else if (minigametype == "susiezilla" && (minigamedifficulty == 3 || minigamedifficulty == 4))
{
    draw_text_transformed(camerax() + score_x, (cameray() + bar_y) - 5, /*"ENEMY"*/"敌人", 3, 2, 0);
    draw_sprite_ext(spr_whitepixel, 0, camerax() + bar_x + 116, cameray() + bar_y + 4, 60, 14, 0, c_red, 1);
    draw_sprite_ext(spr_whitepixel, 0, camerax() + bar_x + 116, cameray() + bar_y + 4, barsize, 14, 0, c_white, 1);
}
else
{
    draw_sprite_ext(spr_tenna_minigame_ui, 0, camerax() + bar_x, cameray() + bar_y, 0.5, 0.5, 0, c_white, 1);
    draw_sprite_ext(spr_whitepixel, 0, camerax() + bar_x + 26, cameray() + bar_y + 4, 150, 14, 0, c_red, 1);
    draw_sprite_ext(spr_whitepixel, 0, camerax() + bar_x + 26, cameray() + bar_y + 4, barsize, 14, 0, c_white, 1);
}

if (minigametype == "battle" && minigamedifficulty == 3)
    exit;

draw_text_transformed(camerax() + score_x, cameray() + score_y, /*"SCORE"*/"得分", 3, 2, 0);
draw_set_halign(fa_right);

if (myscore < 10)
    draw_text_transformed(camerax() + score_x + 175, cameray() + score_y, "00" + string(myscore), 3, 2, 0);
else if (myscore < 100)
    draw_text_transformed(camerax() + score_x + 175, cameray() + score_y, "0" + string(myscore), 3, 2, 0);
else
    draw_text_transformed(camerax() + score_x + 175, cameray() + score_y, myscore, 3, 2, 0);

draw_set_halign(fa_left);

if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity == true)
    exit;

scale = 1.1;
var blend1 = 16777215;

if (obj_tenna_enemy.minigamefailcount >= 1)
    blend1 = 255;

var blend2 = 16777215;

if (obj_tenna_enemy.minigamefailcount >= 2)
    blend2 = 255;

var blend3 = 16777215;

if (obj_tenna_enemy.minigamefailcount >= 3)
    blend3 = 255;

draw_text_transformed_color((camerax() + box_x) - 93, cameray() + box_y + 18, /*"MISS"*/"失误", 3, 2, 0, blend1, blend1, blend1, blend1, 1);
draw_sprite_ext(spr_tenna_minigame_ui, 1, camerax() + box_x, cameray() + box_y, scale, scale, 0, blend1, 1);
draw_sprite_ext(spr_tenna_minigame_ui, 1, camerax() + box_x + 52, cameray() + box_y, scale, scale, 0, blend2, 1);
draw_sprite_ext(spr_tenna_minigame_ui, 1, camerax() + box_x + 104, cameray() + box_y, scale, scale, 0, blend3, 1);

if (obj_tenna_enemy.minigamefailcount >= 1 && minigamefailcountprev == 0)
    shaketimer1 = 15;

if (obj_tenna_enemy.minigamefailcount >= 2 && minigamefailcountprev == 1)
    shaketimer2 = 15;

if (obj_tenna_enemy.minigamefailcount >= 3 && minigamefailcountprev == 2)
    shaketimer3 = 15;

minigamefailcountprev = obj_tenna_enemy.minigamefailcount;
shaketimer1--;

if (shaketimer1 == 14)
    shakex1 = 10;

if (shaketimer1 == 13)
    shakex1 = -9;

if (shaketimer1 == 12)
    shakex1 = 8;

if (shaketimer1 == 11)
    shakex1 = -7;

if (shaketimer1 == 10)
    shakex1 = 6;

if (shaketimer1 == 9)
    shakex1 = -5;

if (shaketimer1 == 8)
    shakex1 = 4;

if (shaketimer1 == 7)
    shakex1 = -3;

if (shaketimer1 == 6)
    shakex1 = 2;

if (shaketimer1 == 5)
    shakex1 = -1;

if (shaketimer1 == 4)
    shakex1 = 0;

shaketimer2--;

if (shaketimer2 == 14)
    shakex2 = 10;

if (shaketimer2 == 13)
    shakex2 = -9;

if (shaketimer2 == 12)
    shakex2 = 8;

if (shaketimer2 == 11)
    shakex2 = -7;

if (shaketimer2 == 10)
    shakex2 = 6;

if (shaketimer2 == 9)
    shakex2 = -5;

if (shaketimer2 == 8)
    shakex2 = 4;

if (shaketimer2 == 7)
    shakex2 = -3;

if (shaketimer2 == 6)
    shakex2 = 2;

if (shaketimer2 == 5)
    shakex2 = -1;

if (shaketimer2 == 4)
    shakex2 = 0;

shaketimer3--;

if (shaketimer3 == 14)
    shakex3 = 10;

if (shaketimer3 == 13)
    shakex3 = -9;

if (shaketimer3 == 12)
    shakex3 = 8;

if (shaketimer3 == 11)
    shakex3 = -7;

if (shaketimer3 == 10)
    shakex3 = 6;

if (shaketimer3 == 9)
    shakex3 = -5;

if (shaketimer3 == 8)
    shakex3 = 4;

if (shaketimer3 == 7)
    shakex3 = -3;

if (shaketimer3 == 6)
    shakex3 = 2;

if (shaketimer3 == 5)
    shakex3 = -1;

if (shaketimer3 == 4)
    shakex3 = 0;

scale = 1;

if (obj_tenna_enemy.minigamefailcount >= 1)
    draw_sprite_ext(spr_tenna_x, 1, camerax() + box_x + 22 + shakex1, cameray() + box_y + 22, scale, scale, 0, c_white, 1);

if (obj_tenna_enemy.minigamefailcount >= 2)
    draw_sprite_ext(spr_tenna_x, 1, camerax() + box_x + 52 + 22 + shakex2, cameray() + box_y + 22, scale, scale, 0, c_white, 1);

if (obj_tenna_enemy.minigamefailcount >= 3)
    draw_sprite_ext(spr_tenna_x, 1, camerax() + box_x + 104 + 22 + shakex3, cameray() + box_y + 22, scale, scale, 0, c_white, 1);
