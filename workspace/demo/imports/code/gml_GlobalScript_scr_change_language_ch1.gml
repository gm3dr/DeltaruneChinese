function scr_change_language_ch1()
{
    if (global.lang == "en")
        global.lang = "ja";
    else
        global.lang = "en";
    
    ossafe_ini_open_ch1("true_config.ini");
    ini_write_string("LANG", "LANG", global.lang);
    ossafe_ini_close_ch1();
    ossafe_savedata_save_ch1();
    scr_84_init_localization_ch1();
}
