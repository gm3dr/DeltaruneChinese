function scr_change_language_ch1()
{
	global.names = (global.names + 1) % 3;
    ossafe_ini_open_ch1("true_config.ini");
    ini_write_string("L10N_ZH", "NAMES", global.names);
    ossafe_ini_close_ch1();
    ossafe_savedata_save_ch1();
    scr_84_init_localization_ch1();
}
