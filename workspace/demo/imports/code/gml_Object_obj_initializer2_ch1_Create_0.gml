global.is_console = os_type == os_switch || os_type == os_ps4;
global.screen_border_id = "Dynamic";
global.screen_border_active = true;
global.screen_border_alpha = 1;
global.screen_border_state = 0;
global.screen_border_dynamic_fade_id = 0;
global.screen_border_dynamic_fade_level = 0;
global.savedata_async_id = -1;
global.savedata_async_load = false;
global.savedata_error = false;
global.savedata_debuginfo = "";
old_savedata_check = false;

if (global.is_console)
{
    ossafe_savedata_load_ch1();
}
else
{
    global.names = 0;
    scr_84_init_localization_ch1();
    scr_84_load_ini_ch1();
    scr_gamestart_ch1();
    global.damagefont = font_add_sprite_ext(spr_numbersfontbig_ch1, "0123456789", 20, 0);
    global.hpfont = font_add_sprite_ext(spr_numbersfontsmall_ch1, scr_84_get_lang_string_ch1("obj_initializer2_slash_Create_0_gml_2_0"), 0, 2);
    
    for (i = 0; i < 100; i += 1)
        global.tempflag[i] = 0;
    
    global.heartx = 300;
    global.hearty = 220;
    audio_group_load(1);
    
    if (!instance_exists(obj_time_ch1))
        instance_create_ch1(0, 0, obj_time_ch1);
}
