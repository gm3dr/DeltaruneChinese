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
        global.names = ini_read_real("L10N_ZH", "NAMES", 0);
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
        ds_map_add(sm, "spr_btrouxls", spr_ja_btrouxls);
        ds_map_add(sm, "spr_btrouxls_select1", spr_ja_btrouxls_select1);
        ds_map_add(sm, "spr_btrouxls_select2", spr_ja_btrouxls_select2);
        ds_map_add(sm, "spr_btspade", spr_ja_btspade);
        ds_map_add(sm, "spr_dw_ch3_b3bs_stealthzone", spr_ja_dw_ch3_b3bs_stealthzone);
        ds_map_add(sm, "spr_dw_interstitial_poster_green", spr_ja_dw_interstitial_poster_green);
        ds_map_add(sm, "spr_gameshow_pushingbuddies", spr_ja_gameshow_pushingbuddies);
        ds_map_add(sm, "spr_quiz_ralsei_plush", spr_ja_quiz_ralsei_plush);
        ds_map_add(sm, "spr_susie_chef_doubleres", spr_ja_susie_chef_doubleres);
        ds_map_add(sm, "spr_susiezilla_hudguy_hp", spr_ja_susiezilla_hudguy_hp);
        ds_map_add(sm, "spr_dw_tv_mysertySign_killed", spr_ja_dw_tv_mysertySign_killed);
        ds_map_add(sm, "spr_dw_screen_technical_difficulties", spr_ja_dw_screen_technical_difficulties);
        ds_map_add(sm, "spr_dw_screen_word", spr_ja_dw_screen_word);
        ds_map_add(sm, "border_dw_word", border_ja_dw_word);
        ds_map_add(sm, "spr_dw_tv_cancelled", spr_ja_dw_tv_cancelled);
        ds_map_add(sm, "spr_dw_tv_funometer_base_2x", spr_ja_dw_tv_funometer_base_2x);
        ds_map_add(sm, "spr_dw_tv_mysterySign", spr_ja_dw_tv_mysterySign);
        ds_map_add(sm, "spr_dw_tv_mysterySign_gray", spr_ja_dw_tv_mysterySign_gray);
        ds_map_add(sm, "spr_dw_tv_prize_car", spr_ja_dw_tv_prize_car);
        ds_map_add(sm, "spr_shadowman_caption2", spr_ja_shadowman_caption2);
        ds_map_add(sm, "spr_shop_space_ui", spr_ja_shop_space_ui);
        ds_map_add(sm, "spr_funnytext_dark_fountain", spr_ja_funnytext_dark_fountain);
        ds_map_add(sm, "spr_funnytext_susiezilla", spr_ja_funnytext_susiezilla);
        ds_map_add(sm, "spr_funnytext_toriel", spr_ja_funnytext_toriel);
        ds_map_add(sm, "spr_funnytext_names", spr_ja_funnytext_names);
        ds_map_add(sm, "spr_funnytext_flames", spr_ja_funnytext_flames);
        ds_map_add(sm, "spr_funnytext_board", spr_ja_funnytext_board);
        ds_map_add(sm, "spr_funnytext_brother", spr_ja_funnytext_brother);
        ds_map_add(sm, "spr_funnytext_lovers", spr_ja_funnytext_lovers);
        ds_map_add(sm, "spr_funnytext_physical_challenge", spr_ja_funnytext_physical_challenge);
        ds_map_add(sm, "spr_funnytext_physical_challenges", spr_ja_funnytext_physical_challenge);
        ds_map_add(sm, "spr_funnytext_relax", spr_ja_funnytext_relax);
        ds_map_add(sm, "spr_funnytext_tears", spr_ja_funnytext_tears);
        ds_map_add(sm, "spr_funnytext_win_big", spr_ja_funnytext_win_big);
        ds_map_add(sm, "spr_funnytext_amazing_01", spr_ja_funnytext_amazing_01);
        ds_map_add(sm, "spr_funnytext_challenge", spr_ja_funnytext_challenge);
        ds_map_add(sm, "spr_funnytext_fun_o_meter", spr_ja_funnytext_fun_o_meter);
        ds_map_add(sm, "spr_funnytext_grand_prize", spr_ja_funnytext_grand_prize);
        ds_map_add(sm, "spr_funnytext_green_room", spr_ja_funnytext_green_room);
        ds_map_add(sm, "spr_funnytext_hall_of_fame", spr_ja_funnytext_hall_of_fame);
        ds_map_add(sm, "spr_funnytext_love", spr_ja_funnytext_love);
        ds_map_add(sm, "spr_ja_funnytext_daisuki", spr_ja_funnytext_daisuki);
        ds_map_add(sm, "spr_funnytext_lovely", spr_ja_funnytext_lovely);
        ds_map_add(sm, "spr_funnytext_prizes", spr_ja_funnytext_prizes);
        ds_map_add(sm, "spr_funnytext_quizzes", spr_ja_funnytext_quizzes);
        ds_map_add(sm, "spr_funnytext_stars", spr_ja_funnytext_stars);
        ds_map_add(sm, "spr_funnytext_star", spr_ja_funnytext_star);
        ds_map_add(sm, "spr_funnytext_word", spr_ja_funnytext_word);
        ds_map_add(sm, "spr_funnytext_win", spr_ja_funnytext_win);
        ds_map_add(sm, "spr_funnytext_fun_loop", spr_ja_funnytext_fun_loop);
        ds_map_add(sm, "spr_funnytext_rock_concert", spr_ja_funnytext_rock_concert);
        ds_map_add(sm, "spr_funnytext_tan", spr_ja_funnytext_tan);
        ds_map_add(sm, "spr_funnytext_coffee", spr_ja_funnytext_coffee);
        ds_map_add(sm, "spr_funnytext_alligator", spr_ja_funnytext_alligator);
        ds_map_add(sm, "spr_funnytext_city_feet", spr_ja_funnytext_city_feet);
        ds_map_add(sm, "spr_funnytext_know_tv", spr_ja_funnytext_know_tv);
        ds_map_add(sm, "spr_funnytext_gentle", spr_ja_funnytext_gentle);
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
        var sm = global.chemg_sprite_map;
		if (global.names < 2)
		{
			ds_map_add(sm, "spr_bnamekris", spr_bnamekris);
			ds_map_add(sm, "spr_bnameralsei", spr_bnameralsei);
			ds_map_add(sm, "spr_bnamesusie", spr_bnamesusie);
			ds_map_add(sm, "spr_bnamenoelle", spr_bnamenoelle);
			ds_map_add(sm, "spr_btrouxls", spr_btrouxls);
			ds_map_add(sm, "spr_btrouxls_select1", spr_btrouxls_select1);
			ds_map_add(sm, "spr_btrouxls_select2", spr_btrouxls_select2);
			ds_map_add(sm, "spr_btspade", spr_btspade);
			ds_map_add(sm, "spr_dw_tv_mysterySign", spr_dw_tv_mysterySign);
			ds_map_add(sm, "spr_dw_tv_mysterySign_gray", spr_dw_tv_mysterySign_gray);
			ds_map_add(sm, "spr_funnytext_toriel", spr_funnytext_toriel);
		}
        else
		{
			ds_map_add(sm, "spr_bnamekris", spr_zhname_bnamekris);
			ds_map_add(sm, "spr_bnameralsei", spr_zhname_bnameralsei);
			ds_map_add(sm, "spr_bnamesusie", spr_zhname_bnamesusie);
			ds_map_add(sm, "spr_bnamenoelle", spr_zhname_bnamenoelle);
			ds_map_add(sm, "spr_btrouxls", spr_zhname_btrouxls);
			ds_map_add(sm, "spr_btrouxls_select1", spr_zhname_btrouxls_select1);
			ds_map_add(sm, "spr_btrouxls_select2", spr_zhname_btrouxls_select2);
			ds_map_add(sm, "spr_btspade", spr_zhname_btspade);
			ds_map_add(sm, "spr_dw_tv_mysterySign", spr_zhname_dw_tv_mysterySign);
			ds_map_add(sm, "spr_dw_tv_mysterySign_gray", spr_zhname_dw_tv_mysterySign_gray);
			ds_map_add(sm, "spr_funnytext_toriel", spr_zhname_funnytext_toriel);
		}
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
        ds_map_add(sm, "spr_dw_ch3_b3bs_stealthzone", spr_dw_ch3_b3bs_stealthzone);
        ds_map_add(sm, "spr_dw_interstitial_poster_green", spr_dw_interstitial_poster_green);
        ds_map_add(sm, "spr_gameshow_pushingbuddies", spr_gameshow_pushingbuddies);
        ds_map_add(sm, "spr_quiz_ralsei_plush", spr_quiz_ralsei_plush);
        ds_map_add(sm, "spr_susie_chef_doubleres", spr_susie_chef_doubleres);
        ds_map_add(sm, "spr_susiezilla_hudguy_hp", spr_susiezilla_hudguy_hp);
        ds_map_add(sm, "spr_dw_tv_mysertySign_killed", spr_dw_tv_mysertySign_killed);
        ds_map_add(sm, "spr_dw_screen_technical_difficulties", spr_dw_screen_technical_difficulties);
        ds_map_add(sm, "spr_dw_screen_word", spr_dw_screen_word);
        ds_map_add(sm, "border_dw_word", border_dw_word);
        ds_map_add(sm, "spr_dw_tv_cancelled", spr_dw_tv_cancelled);
        ds_map_add(sm, "spr_dw_tv_funometer_base_2x", spr_dw_tv_funometer_base_2x);
        ds_map_add(sm, "spr_dw_tv_prize_car", spr_dw_tv_prize_car);
        ds_map_add(sm, "spr_shadowman_caption2", spr_shadowman_caption2);
        ds_map_add(sm, "spr_shop_space_ui", spr_shop_space_ui);
        ds_map_add(sm, "spr_funnytext_dark_fountain", spr_funnytext_dark_fountain);
        ds_map_add(sm, "spr_funnytext_susiezilla", spr_funnytext_susiezilla);
        ds_map_add(sm, "spr_funnytext_tears", spr_funnytext_tears);
        ds_map_add(sm, "spr_funnytext_lovely", spr_funnytext_lovely);
        ds_map_add(sm, "spr_funnytext_star", spr_funnytext_star);
        ds_map_add(sm, "spr_funnytext_stars", spr_funnytext_stars);
        ds_map_add(sm, "spr_funnytext_prizes", spr_funnytext_prizes);
        ds_map_add(sm, "spr_funnytext_grand_prize", spr_funnytext_grand_prize);
        ds_map_add(sm, "spr_funnytext_tv_time", spr_funnytext_tv_time);
        ds_map_add(sm, "spr_funnytext_names", spr_funnytext_names);
        ds_map_add(sm, "spr_funnytext_win", spr_funnytext_win);
        ds_map_add(sm, "spr_funnytext_win_big", spr_funnytext_win_big);
        ds_map_add(sm, "spr_funnytext_board", spr_funnytext_board);
        ds_map_add(sm, "spr_funnytext_fun_loop", spr_funnytext_fun_loop);
        ds_map_add(sm, "spr_funnytext_quizzes", spr_funnytext_quizzes);
        ds_map_add(sm, "spr_funnytext_physical_challenge", spr_funnytext_physical_challenge);
        ds_map_add(sm, "spr_funnytext_physical_challenges", spr_funnytext_physical_challenges);
        ds_map_add(sm, "spr_funnytext_love", spr_funnytext_love);
        ds_map_add(sm, "spr_ja_funnytext_daisuki", spr_funnytext_love);
        ds_map_add(sm, "spr_funnytext_tan", spr_funnytext_tan);
        ds_map_add(sm, "spr_funnytext_coffee", spr_funnytext_coffee);
        ds_map_add(sm, "spr_funnytext_bonus_round", spr_funnytext_bonus_round);
        ds_map_add(sm, "spr_funnytext_amazing_01", spr_funnytext_amazing_01);
        ds_map_add(sm, "spr_funnytext_hall_of_fame", spr_funnytext_hall_of_fame);
        ds_map_add(sm, "spr_funnytext_challenge", spr_funnytext_challenge);
        ds_map_add(sm, "spr_funnytext_fun_o_meter", spr_funnytext_fun_o_meter);
        ds_map_add(sm, "spr_funnytext_know_tv", spr_funnytext_know_tv);
        ds_map_add(sm, "spr_funnytext_lovers", spr_funnytext_lovers);
        ds_map_add(sm, "spr_funnytext_relax", spr_funnytext_relax);
        ds_map_add(sm, "spr_funnytext_word", spr_funnytext_word);
        ds_map_add(sm, "spr_funnytext_flames", spr_funnytext_flames);
        ds_map_add(sm, "spr_funnytext_special", spr_funnytext_special);
        ds_map_add(sm, "spr_funnytext_brother", spr_funnytext_brother);
        ds_map_add(sm, "spr_funnytext_green_room", spr_funnytext_green_room);
        ds_map_add(sm, "spr_funnytext_rock_concert", spr_funnytext_rock_concert);
        ds_map_add(sm, "spr_funnytext_alligator", spr_funnytext_alligator);
        ds_map_add(sm, "spr_funnytext_city_feet", spr_funnytext_city_feet);
        ds_map_add(sm, "spr_funnytext_gentle", spr_funnytext_gentle);
        var sndm = global.chemg_sound_map;
    }
}
