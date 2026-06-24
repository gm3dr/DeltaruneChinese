global.is_console = scr_is_switch_os() || os_type == 14 || os_type == 22;
if (!global.is_console)
{
    window_enable_borderless_fullscreen(true);
}
show_debug_message("global.is_console=" + string(global.is_console));
global.debug = 0;
var launch_data = scr_init_launch_parameters();
global.launcher = launch_data.is_launcher;
textures_loaded = false;
if (global.is_console)
{
    texture_set_interpolation(false);
}
if (global.launcher)
{
    if (scr_is_switch_os() && !variable_global_exists("switchlogin"))
    {
        global.switchlogin = launch_data.switch_id;
        if (global.switchlogin >= 0)
        {
            switch_save_data_mount(global.switchlogin);
        }
        while (global.switchlogin < 0)
        {
            global.switchlogin = switch_accounts_select_account(true, false, false);
        }
        if (!switch_accounts_is_user_open(global.switchlogin))
        {
            switch_accounts_open_user(global.switchlogin);
        }
    }
}
else if (scr_is_switch_os() && !variable_global_exists("switchlogin"))
{
    var _id = -1;
    while (_id < 0)
    {
        _id = switch_accounts_select_account(true, false, false);
    }
    global.switchlogin = _id;
    switch_accounts_open_user(global.switchlogin);
}
if (!instance_exists(1564))
{
    var event_manager = instance_create(0, 0, 1564);
    with (event_manager)
    {
        init();
    }
    if (os_type == 14 || os_type == 22)
    {
        with (event_manager)
        {
            enable_trophies();
        }
    }
}
global.screen_border_id = stringsetloc("Dynamic", "obj_initializer2_slash_Create_0_gml_22_0");
global.screen_border_active = true;
global.screen_border_alpha = 0;
global.screen_border_state = 0;
global.screen_border_dynamic_fade_id = 0;
global.screen_border_dynamic_fade_level = 0;
global.savedata_async_id = -1;
global.savedata_async_load = false;
global.savedata_error = false;
global.savedata_debuginfo = "";
global.versionno = "v0.0.105";
if (scr_is_switch_os())
{
    global.versionno = "v0.0.103";
}
if (os_type == 14 || os_type == 22)
{
    global.versionno = "v0.0.103";
}
global.game_won = false;
scr_input_manager_init();
if (global.is_console)
{
    ossafe_init();
    ossafe_savedata_load();
    if (os_type == 14 || os_type == 22)
    {
        window_set_cursor(-1);
    }
}
else
{
    global_flagname_init();
    scr_84_init_localization();
    pal_swap_init_system(3);
    global.damagefont = font_add_sprite_ext(3691, "0123456789", 20, 0);
    global.damagefontgold = font_add_sprite_ext(3692, "0123456789+-%", 20, 0);
    global.hpfont = font_add_sprite_ext(3693, "0123456789-+", 0, 2);
    scr_gamestart();
    for (i = 0; i < 100; i += 1)
    {
        global.tempflag[i] = 0;
    }
    global.heartx = 300;
    global.hearty = 220;
    scr_load_audio();
    if (!instance_exists(1498))
    {
        instance_create(0, 0, 1498);
    }
}
loadtex = -4;
if (global.is_console)
{
    loadtex = instance_create(0, 0, 71);
}
else
{
    scr_prefetch_textures();
}
textures_loaded = false;
