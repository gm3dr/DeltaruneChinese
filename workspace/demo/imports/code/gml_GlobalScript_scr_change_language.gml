function scr_change_language()
{
    if (global.lang == "en")
        global.lang = "ja";
    else
        global.lang = "en";
    
    ossafe_ini_open("true_config.ini");
    ini_write_string("LANG", "LANG", global.lang);
    ossafe_ini_close();
    ossafe_savedata_save();
    scr_84_init_localization();
}
