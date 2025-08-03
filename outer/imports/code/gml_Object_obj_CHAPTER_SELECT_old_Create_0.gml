global.is_console = os_type == os_switch || os_type == os_ps4 || os_type == os_ps5;
global.savedata_async_id = -1;
global.savedata_async_load = false;
global.savedata_error = false;
global.savedata_debuginfo = "";
global.savedata_pause = false;
isfullscreen = 0;
init_loaded = false;
window_set_caption("DELTARUNE 第一章+第二章");
if (!global.is_console)
{
    window_enable_borderless_fullscreen(true);
}
global.launcher = true;
var launch_data = scr_init_launch_parameters();
var isoriginallauncher = is_original_launcher(launch_data);
if (os_type == os_switch && !variable_global_exists("switchlogin"))
{
    global.switchlogin = launch_data.switch_id;
    while (global.switchlogin < 0)
    {
        global.switchlogin = switch_accounts_select_account(true, false, false);
    }
    if (!switch_accounts_is_user_open(global.switchlogin))
    {
        switch_accounts_open_user(global.switchlogin);
    }
}
display_height = display_get_height();
display_width = display_get_width();
window_size_multiplier = 1;
for (var _ww = 2; _ww < 6; _ww += 1)
{
    if (display_width > (640 * _ww) && display_height > (480 * _ww))
    {
        window_size_multiplier = _ww;
    }
}
if (!window_get_fullscreen())
{
    if (window_size_multiplier > 1 && isoriginallauncher)
    {
        window_set_size(640 * window_size_multiplier, 480 * window_size_multiplier);
        alarm[0] = 1;
    }
}
if (global.is_console)
{
    application_surface_enable(true);
    application_surface_draw_enable(false);
}
global.debug = 0;
var _locale = os_get_language();
var _lang = (substr(_locale, 1, 2) != "ja") ? "en" : "ja";
global.lang = _lang;
if (ossafe_file_exists("true_config.ini"))
{
    ossafe_ini_open("true_config.ini");
    global.lang = ini_read_string("LANG", "LANG", _lang);
    ossafe_ini_close();
}
text_font = 2;
con = "init";
file_found = false;
highestUncompletedChapter = 0;
highestCompletedChapter = 0;
my_stringset = "0";
yes = "Yes";
no = "No";
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
global.versionno = "v2";
version_text = global.versionno + " ";
version_text_alpha = 0;
loop = -4;
for (i = 0; i < 10; i += 1)
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
    {
        ps4_touchpad_mouse_enable(false);
    }
    ossafe_savedata_load();
}
else
{
    _locale = os_get_language();
    _lang = (substr(_locale, 1, 2) != "ja") ? "en" : "ja";
    global.lang = _lang;
    if (ossafe_file_exists("true_config.ini"))
    {
        ossafe_ini_open("true_config.ini");
        global.lang = ini_read_string("LANG", "LANG", _lang);
        if (isoriginallauncher)
        {
            var is_fullscreen = ini_read_real("SCREEN", "FULLSCREEN", 0) || window_get_fullscreen();
            window_set_fullscreen(is_fullscreen);
        }
        ossafe_ini_close();
    }
    text_font = (global.lang == "en") ? 2 : 1;
    yes = (global.lang == "en") ? "是 " : "はい";
    no = (global.lang == "en") ? "否" : "いいえ";
    chapname[1] = (global.lang == "en") ? "开端" : "はじまり";
    chapname[2] = (global.lang == "en") ? "赛博世界" : "サイバーワールド";
    scr_controls_default();
    audio_group_load(0);
    init_loaded = true;
}
