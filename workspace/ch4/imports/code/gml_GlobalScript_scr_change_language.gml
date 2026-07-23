function scr_change_language()
{
	global.names = (global.names + 1) % 3;
    ossafe_ini_open("true_config.ini");
    ini_write_string("L10N_ZH", "NAMES", global.names);
    ossafe_ini_close();
    ossafe_savedata_save();
    scr_84_init_localization();
}
