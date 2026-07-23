with (obj_ch5_LW20W_blur2)
    instance_destroy();

doend = function()
{
    timer = 0;
    con = 99;
    snd_stop_all();
    snd_free_all();
    doshade = false;
    index = -1;
    image_blend = c_black;
    scr_complete_save_file_b();
    
    if (!global.is_console)
    {
        if (global.launcher)
            scr_chapterswitch(0);
        else
            game_restart_true();
        
        exit;
    }
};

gettimer = function(arg0)
{
    var val = round(arg0 * 30);
    return val;
};

crttimer = 0;
crt_glitch = 5;
chromStrength = 0.25;
image_blend = c_white;
timer = 0;
siner = 0;
mysurf = -4;
index = -1;
con = 0;
doshade = true;
shader = 28;
u_time = shader_get_uniform(shader, "TIME");
u_aber = shader_get_uniform(shader, "aberation_amount");
texture_one = sprite_get_texture(spr_rainbow, 0);
aberration = 0;
surf = -4;
speedcheck = 0;
time = 0;
spd = 0.5;
alpha = 0;
blocks = [];
array_push(blocks, 
{
    x: 12,
    y: 3,
    w: 11,
    h: 10
});
array_push(blocks, 
{
    x: 24,
    y: 3,
    w: 11,
    h: 10
});
array_push(blocks, 
{
    x: 35,
    y: 3,
    w: 11,
    h: 10
});
array_push(blocks, 
{
    x: 47,
    y: 3,
    w: 11,
    h: 10
});
array_push(blocks, 
{
    x: 61,
    y: 0,
    w: 7,
    h: 13
});
array_push(blocks, 
{
    x: -40,
    y: -40,
    w: 0,
    h: 0
});
array_push(blocks, 
{
    x: 83,
    y: 0,
    w: 11,
    h: 13
});
array_push(blocks, 
{
    x: 95,
    y: 0,
    w: 11,
    h: 13
});
array_push(blocks, 
{
    x: 107,
    y: 2,
    w: 11,
    h: 11
});
array_push(blocks, 
{
    x: 119,
    y: 2,
    w: 11,
    h: 11
});
array_push(blocks, 
{
    x: 133,
    y: 0,
    w: 7,
    h: 13
});
array_push(blocks, 
{
    x: 143,
    y: 3,
    w: 11,
    h: 10
});
array_push(blocks, 
{
    x: 155,
    y: 3,
    w: 11,
    h: 10
});
array_push(blocks, 
{
    x: -40,
    y: -40,
    w: 0,
    h: 0
});
array_push(blocks, 
{
    x: 179,
    y: 0,
    w: 11,
    h: 13
});
array_push(blocks, 
{
    x: 0,
    y: 19,
    w: 11,
    h: 13
});
array_push(blocks, 
{
    x: 14,
    y: 20,
    w: 7,
    h: 12
});
array_push(blocks, 
{
    x: 24,
    y: 19,
    w: 11,
    h: 13
});
array_push(blocks, 
{
    x: 36,
    y: 22,
    w: 11,
    h: 10
});
array_push(blocks, 
{
    x: -40,
    y: -40,
    w: 0,
    h: 0
});
array_push(blocks, 
{
    x: 60,
    y: 19,
    w: 11,
    h: 13
});
blocksLength = array_length(blocks);
