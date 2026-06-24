function scr_84_init_localization()
{
    if (ossafe_file_exists("true_config.ini"))
    {
        ossafe_ini_open("true_config.ini");
        var _locale = os_get_language();
        var _lang;
        if (scr_is_switch_os())
        {
            _lang = substr(switch_language_get_desired_language(), 1, 2);
        }
        else
        {
            _lang = (substr(_locale, 1, 2) != "ja") ? "en" : "ja";
        }
        global.lang = ini_read_string("LANG", "LANG", _lang);
        ossafe_ini_close();
        ossafe_savedata_save();
    }
    if (!variable_global_exists("lang_loaded"))
    {
        global.lang_loaded = "";
    }
    if (!variable_global_exists("lang"))
    {
        var _locale = os_get_language();
        var _lang;
        if (scr_is_switch_os())
        {
            _lang = substr(switch_language_get_desired_language(), 1, 2);
        }
        else
        {
            _lang = (substr(_locale, 1, 2) != "ja") ? "en" : "ja";
        }
        global.lang = _lang;
    }
    if (global.lang_loaded != global.lang)
    {
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
            ds_map_add(fm, "main", 16);
            ds_map_add(fm, "mainbig", 13);
            ds_map_add(fm, "tinynoelle", 15);
            ds_map_add(fm, "dotumche", 12);
            ds_map_add(fm, "comicsans", 11);
            ds_map_add(fm, "small", 14);
            ds_map_add(fm, "8bit", 17);
            ds_map_add(fm, "8bit_mixed", 0);
            ds_map_add(fm, "legend", 2);
            ds_map_add(fm, "legend_alt", 3);
            var sm = global.chemg_sprite_map;
            ds_map_add(sm, "spr_bnamekris", 3183);
            ds_map_add(sm, "spr_bnameralsei", 3184);
            ds_map_add(sm, "spr_bnamesusie", 3185);
            ds_map_add(sm, "spr_bnamenoelle", 498);
            ds_map_add(sm, "spr_battlemsg", 4163);
            ds_map_add(sm, "spr_btact", 3187);
            ds_map_add(sm, "spr_btdefend", 3190);
            ds_map_add(sm, "spr_btfight", 3191);
            ds_map_add(sm, "spr_btitem", 3192);
            ds_map_add(sm, "spr_btspare", 3197);
            ds_map_add(sm, "spr_bttech", 3196);
            ds_map_add(sm, "spr_darkmenudesc", 3555);
            ds_map_add(sm, "spr_dmenu_captions", 3342);
            ds_map_add(sm, "spr_quitmessage", 4185);
            ds_map_add(sm, "spr_fieldmuslogo", 3591);
            ds_map_add(sm, "spr_face_queen", 17);
            ds_map_add(sm, "spr_shop_space_ui", 4796);
            ds_map_add(sm, "spr_mike_sign", 4526);
            var sndm = global.chemg_sound_map;
        }
        else
        {
            var fm = global.font_map;
            ds_map_add(fm, "main", 8);
            ds_map_add(fm, "mainbig", 7);
            ds_map_add(fm, "tinynoelle", 5);
            ds_map_add(fm, "dotumche", 6);
            ds_map_add(fm, "comicsans", 9);
            ds_map_add(fm, "small", 10);
            ds_map_add(fm, "8bit", 4);
            ds_map_add(fm, "8bit_mixed", 4);
            ds_map_add(fm, "legend", 1);
            ds_map_add(fm, "legend_alt", 1);
            var sm = global.chemg_sprite_map;
            ds_map_add(sm, "spr_bnamekris", 3139);
            ds_map_add(sm, "spr_bnameralsei", 3140);
            ds_map_add(sm, "spr_bnamesusie", 3143);
            ds_map_add(sm, "spr_bnamenoelle", 3144);
            ds_map_add(sm, "spr_battlemsg", 4025);
            ds_map_add(sm, "spr_btact", 3145);
            ds_map_add(sm, "spr_btdefend", 3149);
            ds_map_add(sm, "spr_btfight", 3151);
            ds_map_add(sm, "spr_btitem", 3164);
            ds_map_add(sm, "spr_btspare", 3153);
            ds_map_add(sm, "spr_bttech", 3167);
            ds_map_add(sm, "spr_darkmenudesc", 3546);
            ds_map_add(sm, "spr_dmenu_captions", 3318);
            ds_map_add(sm, "spr_quitmessage", 3730);
            ds_map_add(sm, "spr_fieldmuslogo", 3591);
            ds_map_add(sm, "spr_face_queen", 242);
            ds_map_add(sm, "spr_shop_space_ui", 1074);
            ds_map_add(sm, "spr_mike_sign", 4547);
            var sndm = global.chemg_sound_map;
        }
    }
}
