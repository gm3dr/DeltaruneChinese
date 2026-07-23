function scr_84_init_localization()
{
    var _locale = os_get_language();
    var _lang;
    
    if (scr_is_switch_os())
        _lang = substr(switch_language_get_desired_language(), 1, 2);
    else
        _lang = (substr(_locale, 1, 2) != "ja") ? "en" : "ja";
    
    global.lang = _lang;
    
    if (ossafe_file_exists("true_config.ini"))
    {
        ossafe_ini_open("true_config.ini");
        global.lang = ini_read_string("LANG", "LANG", _lang);
        ossafe_ini_close();
    }
    
    if (!variable_global_exists("lang_loaded"))
        global.lang_loaded = "";
    
    if (!variable_global_exists("lang"))
    {
        _locale = os_get_language();
        
        if (scr_is_switch_os())
            _lang = substr(switch_language_get_desired_language(), 1, 2);
        else
            _lang = (substr(_locale, 1, 2) != "ja") ? "en" : "ja";
        
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
            var sm = global.chemg_sprite_map;
            ds_map_add(sm, "spr_bnamekris", spr_ja_bnamekris);
            ds_map_add(sm, "spr_bnameralsei", spr_ja_bnameralsei);
            ds_map_add(sm, "spr_bnamesusie", spr_ja_bnamesusie);
            ds_map_add(sm, "spr_btact", spr_ja_btact);
            ds_map_add(sm, "spr_btdefend", spr_ja_btdefend);
            ds_map_add(sm, "spr_btfight", spr_ja_btfight);
            ds_map_add(sm, "spr_btitem", spr_ja_btitem);
            ds_map_add(sm, "spr_btspare", spr_ja_btspare);
            ds_map_add(sm, "spr_bttech", spr_ja_bttech);
            ds_map_add(sm, "spr_darkmenudesc", spr_ja_darkmenudesc);
            ds_map_add(sm, "spr_dmenu_captions", spr_ja_dmenu_captions);
            ds_map_add(sm, "spr_quitmessage", spr_ja_quitmessage);
            ds_map_add(sm, "spr_thrashbody_b", spr_ja_thrashbody_b);
            ds_map_add(sm, "spr_thrashfoot_b", spr_ja_thrashfoot_b);
            ds_map_add(sm, "spr_thrashlogo", spr_ja_thrashlogo);
            ds_map_add(sm, "spr_thrashstats", spr_ja_thrashstats);
            ds_map_add(sm, "spr_fieldmuslogo", spr_ja_fieldmuslogo);
            var sndm = global.chemg_sound_map;
            ds_map_add(sndm, "snd_joker_anything", snd_joker_anything_ja);
            ds_map_add(sndm, "snd_joker_chaos", snd_joker_chaos_ja);
            ds_map_add(sndm, "snd_joker_metamorphosis", snd_joker_metamorphosis_ja);
            ds_map_add(sndm, "snd_joker_neochaos", snd_joker_neochaos_ja);
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
            var sm = global.chemg_sprite_map;
            ds_map_add(sm, "spr_bnamekris", spr_bnamekris);
            ds_map_add(sm, "spr_bnameralsei", spr_bnameralsei);
            ds_map_add(sm, "spr_bnamesusie", spr_bnamesusie);
            ds_map_add(sm, "spr_btact", spr_btact);
            ds_map_add(sm, "spr_btdefend", spr_btdefend);
            ds_map_add(sm, "spr_btfight", spr_btfight);
            ds_map_add(sm, "spr_btitem", spr_btitem);
            ds_map_add(sm, "spr_btspare", spr_btspare);
            ds_map_add(sm, "spr_bttech", spr_bttech);
            ds_map_add(sm, "spr_darkmenudesc", spr_darkmenudesc);
            ds_map_add(sm, "spr_dmenu_captions", spr_dmenu_captions);
            ds_map_add(sm, "spr_quitmessage", spr_quitmessage);
            ds_map_add(sm, "spr_thrashbody_b", spr_thrashbody_b);
            ds_map_add(sm, "spr_thrashfoot_b", spr_thrashfoot_b);
            ds_map_add(sm, "spr_thrashlogo", spr_thrashlogo);
            ds_map_add(sm, "spr_thrashstats", spr_thrashstats);
            ds_map_add(sm, "spr_fieldmuslogo", spr_fieldmuslogo);
            var sndm = global.chemg_sound_map;
            ds_map_add(sndm, "snd_joker_anything", snd_joker_anything);
            ds_map_add(sndm, "snd_joker_chaos", snd_joker_chaos);
            ds_map_add(sndm, "snd_joker_metamorphosis", snd_joker_metamorphosis);
            ds_map_add(sndm, "snd_joker_neochaos", snd_joker_neochaos);
        }
    }
}
