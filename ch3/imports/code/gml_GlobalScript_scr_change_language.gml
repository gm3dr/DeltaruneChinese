function scr_change_language()
{
    global.names = !global.names;
    ossafe_ini_open("true_config.ini");
    ini_write_string("NAMES", "NAMES", global.names);
    ossafe_ini_close();
    ossafe_savedata_save();
    scr_84_init_localization();
}
