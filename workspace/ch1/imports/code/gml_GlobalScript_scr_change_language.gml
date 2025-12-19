function scr_change_language()
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
    ossafe_ini_open("true_config.ini");
    ini_write_string("L10N_ZH", "NAMES", global.names);
    ossafe_ini_close();
    ossafe_savedata_save();
    scr_84_init_localization();
}
