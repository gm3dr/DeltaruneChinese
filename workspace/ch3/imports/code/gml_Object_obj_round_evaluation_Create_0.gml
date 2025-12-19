depth = -99999999;

with (obj_mainchara)
    cutscene = 1;

con = 0;
timer = 0;
rcon = 0;
rtimer = 0;
reachedend_draw_triangle_siner = 0;
bgcolor = make_color_rgb(63, 72, 204);
yyscroll = 0;
totaltime = 100;
battlepoints = 0;
totalpoints = 0;
physicalchallengepoints = 0;
battlepoints = global.flag[1116];
totalpoints = global.flag[1117];
physicalchallengepoints = global.flag[1118];
setboardranking = false;

if (room == room_dw_rhythm)
    physicalchallengepoints = global.flag[1118];

tallestever = false;
maxstack = 0;
foodwasted = 0;
customersfe = 0;
physicalchallengeletter = "C";
chef_rank_letter = "Z";
tchefvar = 0;

if (i_ex(obj_chefs_game))
{
    physicalchallengeletter = obj_chefs_game.rank;
    maxstack = obj_chefs_game.maxstack;
    foodwasted = obj_chefs_game.foodwasted;
    customersfed = obj_chefs_game.customersfed;
    chef_rank_letter = obj_chefs_game.rank;
    
    if (obj_chefs_game.t_rank == true)
        chef_rank_letter = "T";
    
    if (maxstack > global.flag[1242])
    {
        tallestever = true;
        global.flag[1242] = maxstack;
    }
}

global.flag[1116] = 0;
global.flag[1117] = 0;
global.flag[1118] = 0;
secretitemfound = false;
extrakeycount = 0;
mossfound = global.flag[1078];
extrapicturecount = 0;
totalbattles = 3;
boardnumber = 1;
replayversion = false;

if (room == room_dw_chef)
{
    totalbattles = global.flag[1049];
    boardnumber = 1;
    
    if (i_ex(obj_chefs_game))
        replayversion = obj_chefs_game.replayversion;
    
    if (global.flag[1122] > 3)
    {
        extrakeycount = 1;
        secretitemfound = true;
    }
    
    if (global.flag[1122] > 4)
    {
        extrakeycount = 2;
        secretitemfound = true;
    }
}

if (room == room_dw_rhythm)
{
    totalbattles = global.flag[1171];
    boardnumber = 2;
    maxcombo = -1;
    
    if (i_ex(obj_rhythmgame))
    {
        replayversion = obj_rhythmgame.replayversion;
        maxcombo = obj_rhythmgame.max_combo;
        debug_print("max combo=" + string(maxcombo));
    }
    
    if ((global.flag[1041] + global.flag[1042] + global.flag[1043] + global.flag[1227]) == 4)
    {
        secretitemfound = true;
        extrapicturecount = 1;
    }
}

if (room == room_dw_susiezilla)
{
    totalbattles = global.flag[1172];
    boardnumber = 3;
    replayversion = true;
}

star_anim = 0;
star_anim_speed = 0.5;
bg_speed = 1;
bg_speed_y = 1;
bg_speed_max = 3;
bg_speed_y_max = 3;
start_y = cameray();
final_y = cameray() + room_height;
y = start_y;
bg_y = -640;
bg_y_extra = 0;
bg_x_extra = 0;
_lettergrade = "";
musicstarted = false;
global.flag[1116] = 0;
global.battlegrade[30] = 0;
roundcompletetext1 = stringsetloc("ROUND#COMPLETE#YOU GOT#", "obj_round_evaluation_slash_Create_0_gml_57_0");
roundcompletetext2 = stringsetloc("RANK", "obj_round_evaluation_slash_Create_0_gml_58_0");
white_overlay = false;
white_overlay_alpha = 0;

show_overlay = function(arg0)
{
    white_overlay = true;
    white_overlay_alpha = 0;
    scr_lerpvar("white_overlay_alpha", 0, 1, arg0);
};

tv_vignette = false;
tv_vignette_alpha = 0;

show_vignette = function(arg0)
{
    tv_vignette = true;
    tv_vignette_alpha = 0;
    scr_lerpvar("tv_vignette_alpha", 0, 1, arg0);
};

gradetimer = -8;
gradecon = 0;

for (var i = 0; i < 20; i++)
    _battlegrade[i] = "Z";

currenttotalpoints = 0;
currentphyspoints = 0;
currentbattlegrade = /*"?-RANK"*/"?-级";
currenttotalgrade = /*"?-RANK"*/"?-级";
currentphysgrade = /*"?-RANK"*/"?-级";
c_pink = make_color_rgb(248, 173, 227);
missednotes = 0;
normalnotes = 0;
goldnotes = 0;

if (i_ex(obj_rhythmgame))
{
    missednotes = obj_rhythmgame.savemiss;
    normalnotes = obj_rhythmgame.saveokay + obj_rhythmgame.savegood;
    goldnotes = obj_rhythmgame.savegreat;
}

dtype = 0;

function sp_draw_text(arg0, arg1, arg2)
{
    var shadcolor = 3934982;
    var shadalph = 0.65;
    var shadoff = 2;
    var memcol = draw_get_color();
    var memalph = draw_get_alpha();
    draw_set_color(shadcolor);
    draw_set_alpha(shadalph);
    draw_text(arg0 + shadoff, arg1 + shadoff, arg2);
    draw_set_color(memcol);
    draw_set_alpha(memalph);
    draw_text(arg0, arg1, arg2);
}

function checkskip(arg0, arg1)
{
    var _skip = false;
    
    if (timer > (arg0 + 5) && timer < (arg1 - 1))
    {
        if (button3_h())
            _skip = true;
    }
    
    if (timer > (arg0 + 1) && timer < (arg1 - 1))
    {
        if (button1_p())
            _skip = true;
    }
    
    if (_skip)
    {
        timer = arg1 - 1;
        safe_delete(obj_tennatalkbubble);
        safe_delete(obj_couchwriter);
        _skip = false;
    }
}

function rcheckskip(arg0, arg1)
{
    var _skip = false;
    
    if (rtimer > (arg0 + 5) && rtimer < (arg1 - 1))
    {
        if (button3_h())
            _skip = true;
    }
    
    if (rtimer > (arg0 + 1) && rtimer < (arg1 - 1))
    {
        if (button1_p())
            _skip = true;
    }
    
    if (_skip)
    {
        rtimer = arg1 - 1;
        safe_delete(obj_tennatalkbubble);
        safe_delete(obj_couchwriter);
        _skip = false;
    }
}

bouncebuff = 0;
bouncecount = 0;
shakeobj = 0;
debugbarcon = 0;
debugbartimer = 0;
debugbarvalue = 5;
debugbarrank = "Z";
rank1total = 800 + (totalbattles * 230);

if (boardnumber == 2 || i_ex(obj_rhythmgame))
    rank1total = 860 + (totalbattles * 230);

rank1phy = 500;
currentgraderank = 5;
currentbattlerank = 5;
currenttotalpointsrank = 5;
currentphychallengerank = -1;
currentsecretcount = 0;
currentgradetotal = 0;
currentgradetotalmax = 40;
gradenumber = 0;
lettergrade = "";
battlegrade = "";
secretset1 = 0;
secretset2 = 0;
savebattlepoints = -1;
savetotalpoints = -1;
savephypoints = -1;
savekey1 = -1;
savekey2 = -1;
madesound = false;
annoyingdog = false;
sndplayed = 0;
trophy_active = false;
