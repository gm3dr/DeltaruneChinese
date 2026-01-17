function scr_change_language_ch1()
{
	if (global.names == 0)
	{
		global.names = 1;
	}
	else if (global.names == 1)
	{
		global.names = 2
	}
	else
	{
		global.names = 0;
	}
    ossafe_ini_open_ch1("true_config.ini");
    ini_write_string("L10N_ZH", "NAMES", global.names);
    ossafe_ini_close_ch1();
    ossafe_savedata_save_ch1();
    scr_84_init_localization_ch1();
}
