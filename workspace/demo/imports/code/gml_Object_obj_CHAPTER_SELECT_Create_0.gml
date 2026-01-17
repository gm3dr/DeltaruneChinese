var _tex_array = texturegroup_get_textures("chapter_select");

for (var i = 0; i < array_length(_tex_array); i++)
    texture_prefetch(_tex_array[i]);

global.is_console = os_type == os_switch || os_type == os_ps4;
global.chapter_debug_init = false;
global.savedata_async_id = -1;
global.savedata_async_load = false;
global.savedata_error = false;
global.savedata_debuginfo = "";
global.savedata_pause = false;
global.version = "1.10";

if (os_type == os_switch)
    global.version = "1.06";

if (os_type == os_ps4)
    global.version = "1.06";

init_loaded = false;
chapter_is_loading = false;
reload_textures = true;
window_set_caption("DELTARUNE 1&2章");

if (instance_exists(obj_time_ch1))
{
    with (obj_time_ch1)
        instance_destroy();
}

if (instance_exists(obj_time))
{
    with (obj_time)
        instance_destroy();
}

if (instance_exists(obj_debugcontroller_ch1))
{
    with (obj_debugcontroller_ch1)
        instance_destroy();
}

if (variable_global_exists("chapter_return"))
{
    global.lang_loaded = "";
    reload_textures = global.chapter != global.chapter_return;
    chaptertoload_temp = global.chapter_return;
    
    if (chaptertoload_temp >= 0)
    {
        global.chapter_return = -1;
        snd_free_all();
        alarm[2] = 5;
        
        if (reload_textures)
            alarm[3] = 1;
        
        exit;
    }
}

if (os_type == os_switch && !variable_global_exists("switchlogin"))
{
    var _id = -1;
    
    while (_id < 0)
        _id = switch_accounts_select_account(true, false, false);
    
    global.switchlogin = _id;
    switch_accounts_open_user(global.switchlogin);
}

first_time = global.is_console;
display_height = display_get_height();
display_width = display_get_width();
window_size_multiplier = 1;

for (_ww = 2; _ww < 6; _ww += 1)
{
    if (display_width > (640 * _ww) && display_height > (480 * _ww))
        window_size_multiplier = _ww;
}

if (window_size_multiplier > 1)
{
    window_set_size(640 * window_size_multiplier, 480 * window_size_multiplier);
    alarm[0] = 1;
}

if (global.is_console)
{
    application_surface_enable(true);
    application_surface_draw_enable(false);
}

global.debug = 0;
con = "init";
file_found = false;
highestUncompletedChapter = 0;
highestCompletedChapter = 0;
stringset = "0";
yes = "是";
no = "否";
mpos = 0;
chapterselectinit = 0;
timer = 0;
drawcolor = c_black;
yy = room_height / 2;
xx = room_width / 2;
fademax = 10;
fade = fademax;
chaptertoload = 0;
chaptertoload_temp = 0;
console = os_type == os_switch || os_type == os_ps4;
latestAvailableChapter = 2;
chapname[0] = " - - ";
chapname[1] = "开端";
chapname[2] = "赛博世界";
chapname[3] = " - - ";
chapname[4] = " - - ";
chapname[5] = " - - ";
chapname[6] = " - - ";
chapname[7] = " - - ";
text_font = 3;
roominit = 0;
scale = 1;
fadeout = 1;
xscale = 1;
yscale = 1;
spr_aftereffect = 0;
confirm_choice_index = 0;
move_noise = false;
select_noise = false;
old_savedata_check = false;

for (var i = 0; i < 10; i += 1)
{
    global.input_pressed[i] = 0;
    global.input_held[i] = 0;
    global.input_released[i] = 0;
}

if (global.is_console)
{
    if (os_type == os_switch)
    {
        switch_controller_support_set_defaults();
        switch_controller_support_set_singleplayer_only(true);
        switch_controller_set_supported_styles(7);
    }
    
    if (os_type == os_ps4)
        ps4_touchpad_mouse_enable(false);
    
    ossafe_savedata_load();
}
else
{
    var _locale = os_get_language();
    var _lang = (substr(_locale, 1, 2) != "ja") ? "en" : "ja";
    global.lang = _lang;
    
    if (ossafe_file_exists("true_config.ini"))
    {
        ossafe_ini_open("true_config.ini");
        global.lang = ini_read_string("LANG", "LANG", _lang);
        var is_fullscreen = ini_read_real("SCREEN", "FULLSCREEN", 0);
        window_set_fullscreen(is_fullscreen);
        ossafe_ini_close();
    }
    
    text_font = (global.lang == "en") ? 3 : 10;
    yes = (global.lang == "en") ? "是" : "はい";
    no = (global.lang == "en") ? "否" : "いいえ";
    chapname[1] = (global.lang == "en") ? "开端" : "はじまり";
    chapname[2] = (global.lang == "en") ? "赛博世界" : "サイバーワールド";
    scr_controls_default();
    audio_group_load(1);
    init_loaded = true;
}
