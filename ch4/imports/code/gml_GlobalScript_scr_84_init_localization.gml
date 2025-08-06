function scr_84_init_localization()
{
    if (ossafe_file_exists("true_config.ini"))
    {
        ossafe_ini_open("true_config.ini");
        var _locale = os_get_language();
        var _lang;
        
        if (scr_is_switch_os())
            _lang = substr(switch_language_get_desired_language(), 1, 2);
        else
            _lang = (substr(_locale, 1, 2) != "ja") ? "en" : "ja";
        
        global.lang = ini_read_string("LANG", "LANG", _lang);
        global.names = ini_read_string("NAMES", "NAMES", false);
        ossafe_ini_close();
        ossafe_savedata_save();
    }
    
    global.lang = "en";
    
    if (!variable_global_exists("lang_loaded"))
        global.lang_loaded = "";
    
    if (!variable_global_exists("lang"))
    {
        var _locale = os_get_language();
        var _lang;
        
        if (scr_is_switch_os())
            _lang = substr(switch_language_get_desired_language(), 1, 2);
        else
            _lang = (substr(_locale, 1, 2) != "ja") ? "en" : "ja";
        
        global.lang = _lang;
    }
    
    global.lang_loaded = global.lang;
    
    if (variable_global_exists("lang_map"))
    {
        ds_map_destroy(global.lang_map);
        ds_map_destroy(global.font_map);
        ds_map_destroy(global.chemg_sprite_map);
        ds_map_destroy(global.chemg_sound_map);
    }
    
    global.lang_map = ds_map_create();
    global.font_map = ds_map_create();
    global.lang_missing_map = ds_map_create();
    global.chemg_sprite_map = ds_map_create();
    global.chemg_sound_map = ds_map_create();
    scr_84_lang_load();
    scr_ascii_input_names();
    global.chemg_last_get_font = "";
    
    if (global.lang == "ja")
    {
        var fm = global.font_map;
        ds_map_add(fm, "main", fnt_ja_main);
        ds_map_add(fm, "mainbig", fnt_ja_mainbig);
        ds_map_add(fm, "tinynoelle", fnt_ja_tinynoelle);
        ds_map_add(fm, "dotumche", fnt_ja_dotumche);
        ds_map_add(fm, "comicsans", fnt_ja_comicsans);
        ds_map_add(fm, "small", fnt_ja_small);
        ds_map_add(fm, "8bit", fnt_ja_8bit);
        ds_map_add(fm, "8bit_mixed", fnt_ja_8bit_mixed);
        ds_map_add(fm, "legend", fnt_ja_legend);
        ds_map_add(fm, "legend_alt", fnt_ja_legend_alt);
        var sm = global.chemg_sprite_map;
        ds_map_add(sm, "spr_bnamekris", spr_ja_bnamekris);
        ds_map_add(sm, "spr_bnameralsei", spr_ja_bnameralsei);
        ds_map_add(sm, "spr_bnamesusie", spr_ja_bnamesusie);
        ds_map_add(sm, "spr_bnamenoelle", spr_ja_bnamenoelle);
        ds_map_add(sm, "spr_battlemsg", spr_ja_battlemsg);
        ds_map_add(sm, "spr_btact", spr_ja_btact);
        ds_map_add(sm, "spr_btdefend", spr_ja_btdefend);
        ds_map_add(sm, "spr_btfight", spr_ja_btfight);
        ds_map_add(sm, "spr_btitem", spr_ja_btitem);
        ds_map_add(sm, "spr_btspare", spr_ja_btspare);
        ds_map_add(sm, "spr_bttech", spr_ja_bttech);
        ds_map_add(sm, "spr_darkmenudesc", spr_ja_darkmenudesc);
        ds_map_add(sm, "spr_dmenu_captions", spr_ja_dmenu_captions);
        ds_map_add(sm, "spr_quitmessage", spr_ja_quitmessage);
        ds_map_add(sm, "spr_fieldmuslogo", spr_fieldmuslogo);
        ds_map_add(sm, "spr_face_queen", spr_ja_face_queen);
        ds_map_add(sm, "spr_shop_space_ui", spr_ja_shop_space_ui);
        ds_map_add(sm, "spr_mike_sign", spr_ja_mike_sign);
        var sndm = global.chemg_sound_map;
    }
    else
    {
        var fm = global.font_map;
        ds_map_add(fm, "main", fnt_main);
        ds_map_add(fm, "mainbig", fnt_mainbig);
        ds_map_add(fm, "tinynoelle", fnt_tinynoelle);
        ds_map_add(fm, "dotumche", fnt_dotumche);
        ds_map_add(fm, "comicsans", fnt_comicsans);
        ds_map_add(fm, "small", fnt_small);
        ds_map_add(fm, "8bit", fnt_8bit);
        ds_map_add(fm, "8bit_mixed", fnt_8bit);
        ds_map_add(fm, "legend", fnt_legend);
        ds_map_add(fm, "legend_alt", fnt_legend);
        var sm = global.chemg_sprite_map;
        ds_map_add(sm, "spr_bnamekris", spr_bnamekris);
        ds_map_add(sm, "spr_bnameralsei", spr_bnameralsei);
        ds_map_add(sm, "spr_bnamesusie", spr_bnamesusie);
        ds_map_add(sm, "spr_bnamenoelle", spr_bnamenoelle);
        ds_map_add(sm, "spr_battlemsg", spr_battlemsg);
        ds_map_add(sm, "spr_btact", spr_btact);
        ds_map_add(sm, "spr_btdefend", spr_btdefend);
        ds_map_add(sm, "spr_btfight", spr_btfight);
        ds_map_add(sm, "spr_btitem", spr_btitem);
        ds_map_add(sm, "spr_btspare", spr_btspare);
        ds_map_add(sm, "spr_bttech", spr_bttech);
        ds_map_add(sm, "spr_darkmenudesc", spr_darkmenudesc);
        ds_map_add(sm, "spr_dmenu_captions", spr_dmenu_captions);
        ds_map_add(sm, "spr_quitmessage", spr_quitmessage);
        ds_map_add(sm, "spr_fieldmuslogo", spr_fieldmuslogo);
        ds_map_add(sm, "spr_face_queen", spr_face_queen);
        ds_map_add(sm, "spr_shop_space_ui", spr_shop_space_ui);
        ds_map_add(sm, "spr_mike_sign", spr_mike_sign);
        var sndm = global.chemg_sound_map;
    }
}
