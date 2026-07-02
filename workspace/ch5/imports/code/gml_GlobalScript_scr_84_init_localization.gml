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
        //
        global.names = ini_read_real("L10N_ZH", "NAMES", 0);
        //
        ossafe_ini_close();
        ossafe_savedata_save();
    }
    //
    global.lang = "en";
    //
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
    
    // if (global.lang_loaded != global.lang)
    // {
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
            ds_map_add(sm, "spr_thrashstats", spr_ja_thrashstats);
            ds_map_add(sm, "spr_fieldmuslogo", spr_fieldmuslogo);
            ds_map_add(sm, "spr_shop_space_ui", spr_ja_shop_space_ui);
            ds_map_add(sm, "spr_face_queen", spr_ja_face_queen);
            ds_map_add(sm, "bg_building_icee_sign_ch5", bg_building_icee_sign_ch5_ja);
            ds_map_add(sm, "spr_dw_fcastle_second_diner_sign_en", spr_dw_fcastle_second_diner_sign_ja);
            ds_map_add(sm, "spr_cafe_cheese_owe_money", spr_cafe_cheese_owe_money_ja);
            ds_map_add(sm, "spr_dw_castle_welcome_sign", spr_dw_castle_welcome_sign_ja);
            ds_map_add(sm, "spr_dw_fcastle_foyer_sign", spr_dw_fcastle_foyer_sign_ja);
            ds_map_add(sm, "spr_dw_garden_exit", spr_dw_garden_exit_ja);
            ds_map_add(sm, "spr_dw_scarecrow_not_enemy_sign", spr_dw_scarecrow_not_enemy_sign_ja);
            ds_map_add(sm, "spr_face_susie_queen", spr_face_susie_queen_ja);
            ds_map_add(sm, "spr_fcastle_jail_chute", spr_fcastle_jail_chute_ja);
            ds_map_add(sm, "spr_gardenmuslogo", spr_gardenmuslogo_ja);
            ds_map_add(sm, "spr_green_sign", spr_green_sign_ja);
            ds_map_add(sm, "spr_green_sign_owe_money", spr_green_sign_owe_money_ja);
            ds_map_add(sm, "spr_green_sign_owe_money_left", spr_green_sign_owe_money_left_ja);
            ds_map_add(sm, "spr_green_sign_welcome_pink", spr_green_sign_welcome_pink_ja);
            ds_map_add(sm, "spr_pink_mewers_live", spr_pink_mewers_live_ja);
            ds_map_add(sm, "spr_pink_mewers_live_dim", spr_pink_mewers_live_dim_ja);
            ds_map_add(sm, "spr_thrashfit_header", spr_thrashfit_header_ja);
            ds_map_add(sm, "spr_thrashstats_susie", spr_thrashstats_susie_ja);
            ds_map_add(sm, "spr_funnytext_dump_her", spr_funnytext_dump_her_ja);
            ds_map_add(sm, "spr_funnytext_ass", spr_ja_funnytext_ass);
            var sndm = global.chemg_sound_map;
            ds_map_add(sndm, "snd_flowery_voiceclip_flowery2", snd_flowery_voiceclip_flowery2_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepyouwaiting1", snd_flowery_voiceclip_sorrytokeepyouwaiting1_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_heyguys", snd_flowery_voiceclip_heyguys_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_hey", snd_flowery_voiceclip_hey);
            ds_map_add(sndm, "snd_flowery_voiceclip_thatsgreat", snd_flowery_voiceclip_thatsgreat_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_wow", snd_flowery_voiceclip_wow_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_yes", snd_flowery_voiceclip_yes_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_nonono", snd_flowery_voiceclip_nonono);
            ds_map_add(sndm, "snd_flowery_voiceclip_huh", snd_flowery_voiceclip_huh);
            ds_map_add(sndm, "snd_flowery_voiceclip_stingus", snd_flowery_voiceclip_stingus_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepaladyinwaiting", snd_flowery_voiceclip_sorrytokeepaladyinwaiting_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorryaboutthatlittleguy", snd_flowery_voiceclip_sorryaboutthatlittleguy_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_thisguysyourbestfriend", snd_flowery_voiceclip_thisguysyourbestfriend_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_heytherelittleguy", snd_flowery_voiceclip_heytherelittleguy_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepyouladies", snd_flowery_voiceclip_sorrytokeepyouladies_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorryaboutthatguys", snd_flowery_voiceclip_sorryaboutthatguys_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_itsmeflowery", snd_flowery_voiceclip_itsmeflowery_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_yourdadsmybestfriend", snd_flowery_voiceclip_yourdadsmybestfriend_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_heyguysithinkifoundaglue", snd_flowery_voiceclip_heyguysithinkifoundaglue_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_imsorryonceagainikeptaladyinwaiting", snd_flowery_voiceclip_imsorryonceagainikeptaladyinwaiting_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_glue", snd_flowery_voiceclip_glue_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_hereicomesanfrandisc", snd_flowery_voiceclip_hereicomesanfrandisc_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_hereicomesanfrandisco_strong", snd_flowery_voiceclip_hereicomesanfrandisco_strong_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_itsme", snd_flowery_voiceclip_itsme_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_hey_raly", snd_flowery_voiceclip_hey_raly_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepyouwaiting2", snd_flowery_voiceclip_sorrytokeepyouwaiting2_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorryabouttheguy", snd_flowery_voiceclip_sorryabouttheguy_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_flowers_blooms_in_your_heart", snd_flowery_voiceclip_flowers_blooms_in_your_heart_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_no_way_its_your_children", snd_flowery_voiceclip_no_way_its_your_children_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_mysterious_wind", snd_flowery_voiceclip_mysterious_wind_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_my_king", snd_flowery_voiceclip_my_king_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_my_favorite_two", snd_flowery_voiceclip_my_favorite_two_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_im_falling", snd_flowery_voiceclip_im_falling_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_hey_boys", snd_flowery_voiceclip_hey_boys_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_grown_like_a_turnip", snd_flowery_voiceclip_grown_like_a_turnip_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_great_style", snd_flowery_voiceclip_great_style_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_your_dad", snd_flowery_voiceclip_your_dad_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_the_diner", snd_flowery_voiceclip_the_diner_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_the_boys", snd_flowery_voiceclip_the_boys_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_calling_for_help", snd_flowery_voiceclip_calling_for_help);
            ds_map_add(sndm, "snd_flowery_voiceclip_try_my_flavor", snd_flowery_voiceclip_try_my_flavor_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_goodbye", snd_flowery_voiceclip_goodbye);
            ds_map_add(sndm, "snd_flowery_voiceclip_susie", snd_flowery_voiceclip_susie_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_kris", snd_flowery_voiceclip_kris_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_get_a_chance_1", snd_flowery_voiceclip_get_a_chance_1_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_youre_a_hero", snd_flowery_voiceclip_youre_a_hero_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_forget_it", snd_flowery_voiceclip_forget_it_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_my_human", snd_flowery_voiceclip_my_human_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_leaf_it_to_me", snd_flowery_voiceclip_leaf_it_to_me_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_say_that_again", snd_flowery_voiceclip_say_that_again_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_go_home", snd_flowery_voiceclip_go_home_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_smile_again", snd_flowery_voiceclip_smile_again_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_thats_my_dreams", snd_flowery_voiceclip_thats_my_dreams_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_dont_you_like_serving_humans", snd_flowery_voiceclip_dont_you_like_serving_humans_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_im_only_trying_to_help_you", snd_flowery_voiceclip_im_only_trying_to_help_you_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_all_according_to_all_according_to_plant", snd_flowery_voiceclip_all_according_to_all_according_to_plant_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_mostlys", snd_flowery_voiceclip_mostlys_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_its_so_human", snd_flowery_voiceclip_its_so_human_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_what_a_predictable_creature", snd_flowery_voiceclip_what_a_predictable_creature_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_its_all_in_a_name", snd_flowery_voiceclip_its_all_in_a_name_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_give_to_you", snd_flowery_voiceclip_give_to_you_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_suckle_it_up", snd_flowery_voiceclip_suckle_it_up_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_flowery2", snd_flowery_voiceclip_flowery2_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepyouwaiting1", snd_flowery_voiceclip_sorrytokeepyouwaiting1_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_its_all_yours", snd_flowery_voiceclip_its_all_yours_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_minipeppers", snd_flowery_voiceclip_minipeppers_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_heh_it_s_my_jarona", snd_flowery_voiceclip_heh_it_s_my_jarona_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_hoo", snd_flowery_voiceclip_hoo);
            ds_map_add(sndm, "snd_flowery_voiceclip_jarona1", snd_flowery_voiceclip_jarona1_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_jarona2", snd_flowery_voiceclip_jarona2_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_jarona3", snd_flowery_voiceclip_jarona3_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_jarona4", snd_flowery_voiceclip_jarona4_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_prism_blow", snd_flowery_voiceclip_prism_blow_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_take_that", snd_flowery_voiceclip_take_that_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_last_jarona", snd_flowery_voiceclip_last_jarona_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_lend_me_your_power", snd_flowery_voiceclip_lend_me_your_power_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_omega_flowery", snd_flowery_voiceclip_omega_flowery_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_with_your_powers_combined", snd_flowery_voiceclip_with_your_powers_combined_ja);
            ds_map_add(sndm, "snd_flowery_voiceclip_theyre_eating_my_flesh", snd_flowery_voiceclip_theyre_eating_my_flesh_ja);
            ds_map_add(sndm, "snd_forthefans", snd_forthefans_ja);
            ds_map_add(sndm, "snd_jarona_orange1", snd_jarona_orange1_ja);
            ds_map_add(sndm, "snd_jarona_orange2", snd_jarona_orange1_ja);
            ds_map_add(sndm, "snd_ja_kidding", snd_ja_kidding_ja);
            //
            ds_map_add(sm, "spr_green_sign_big", spr_green_sign_big_jp);
            ds_map_add(sm, "spr_battleblcon_v_thanks_green", spr_battleblcon_v_thanks_green_ja_susie);
            //
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
            //
            if (global.names < 2)
            {
                ds_map_add(sm, "spr_bnamekris", spr_bnamekris);
                ds_map_add(sm, "spr_bnameralsei", spr_bnameralsei);
                ds_map_add(sm, "spr_bnamesusie", spr_bnamesusie);
                ds_map_add(sm, "spr_bnamenoelle", spr_bnamenoelle);
                ds_map_add(sm, "spr_dw_castle_welcome_sign", spr_dw_castle_welcome_sign);
                ds_map_add(sm, "spr_face_susie_queen", spr_face_susie_queen);
                ds_map_add(sm, "spr_green_sign_welcome_pink", spr_green_sign_welcome_pink);
                //
                ds_map_add(sm, "spr_green_sign_big", spr_green_sign_big);
                ds_map_add(sm, "spr_battleblcon_v_thanks_green", spr_battleblcon_v_thanks_green);
                //
            }
            else
            {
                ds_map_add(sm, "spr_bnamekris", spr_zhname_bnamekris);
                ds_map_add(sm, "spr_bnameralsei", spr_zhname_bnameralsei);
                ds_map_add(sm, "spr_bnamesusie", spr_zhname_bnamesusie);
                ds_map_add(sm, "spr_bnamenoelle", spr_zhname_bnamenoelle);
                ds_map_add(sm, "spr_dw_castle_welcome_sign", spr_zhname_dw_castle_welcome_sign);
                ds_map_add(sm, "spr_face_susie_queen", spr_zhname_face_susie_queen);
                ds_map_add(sm, "spr_green_sign_welcome_pink", spr_zhname_green_sign_welcome_pink);
                //
                ds_map_add(sm, "spr_green_sign_big", spr_zhname_green_sign_big);
                ds_map_add(sm, "spr_battleblcon_v_thanks_green", spr_zhname_battleblcon_v_thanks_green);
                //
            }
            //
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
            ds_map_add(sm, "spr_shop_space_ui", spr_shop_space_ui);
            ds_map_add(sm, "spr_funnytext_dump_her", spr_funnytext_dump_her);
            ds_map_add(sm, "spr_funnytext_ass", spr_funnytext_ass);
            ds_map_add(sm, "spr_face_queen", spr_face_queen);
            ds_map_add(sm, "bg_building_icee_sign_ch5", bg_building_icee_sign_ch5);
            ds_map_add(sm, "spr_dw_fcastle_second_diner_sign_en", spr_dw_fcastle_second_diner_sign_en);
            ds_map_add(sm, "spr_cafe_cheese_owe_money", spr_cafe_cheese_owe_money);
            ds_map_add(sm, "spr_dw_fcastle_foyer_sign", spr_dw_fcastle_foyer_sign);
            ds_map_add(sm, "spr_dw_garden_exit", spr_dw_garden_exit);
            ds_map_add(sm, "spr_dw_scarecrow_not_enemy_sign", spr_dw_scarecrow_not_enemy_sign);
            ds_map_add(sm, "spr_fcastle_jail_chute", spr_fcastle_jail_chute);
            ds_map_add(sm, "spr_gardenmuslogo", spr_gardenmuslogo);
            ds_map_add(sm, "spr_green_sign", spr_green_sign);
            ds_map_add(sm, "spr_green_sign_owe_money", spr_green_sign_owe_money);
            ds_map_add(sm, "spr_green_sign_owe_money_left", spr_green_sign_owe_money_left);
            ds_map_add(sm, "spr_pink_mewers_live", spr_pink_mewers_live);
            ds_map_add(sm, "spr_pink_mewers_live_dim", spr_pink_mewers_live_dim);
            ds_map_add(sm, "spr_thrashfit_header", spr_thrashfit_header);
            ds_map_add(sm, "spr_thrashstats_susie", spr_thrashstats_susie);
            var sndm = global.chemg_sound_map;
            ds_map_add(sndm, "snd_flowery_voiceclip_flowery2", snd_flowery_voiceclip_flowery2);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepyouwaiting1", snd_flowery_voiceclip_sorrytokeepyouwaiting1);
            ds_map_add(sndm, "snd_flowery_voiceclip_heyguys", snd_flowery_voiceclip_heyguys);
            ds_map_add(sndm, "snd_flowery_voiceclip_hey", snd_flowery_voiceclip_hey);
            ds_map_add(sndm, "snd_flowery_voiceclip_thatsgreat", snd_flowery_voiceclip_thatsgreat);
            ds_map_add(sndm, "snd_flowery_voiceclip_wow", snd_flowery_voiceclip_wow);
            ds_map_add(sndm, "snd_flowery_voiceclip_yes", snd_flowery_voiceclip_yes);
            ds_map_add(sndm, "snd_flowery_voiceclip_nonono", snd_flowery_voiceclip_nonono);
            ds_map_add(sndm, "snd_flowery_voiceclip_huh", snd_flowery_voiceclip_huh);
            ds_map_add(sndm, "snd_flowery_voiceclip_stingus", snd_flowery_voiceclip_stingus);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepaladyinwaiting", snd_flowery_voiceclip_sorrytokeepaladyinwaiting);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorryaboutthatlittleguy", snd_flowery_voiceclip_sorryaboutthatlittleguy);
            ds_map_add(sndm, "snd_flowery_voiceclip_thisguysyourbestfriend", snd_flowery_voiceclip_thisguysyourbestfriend);
            ds_map_add(sndm, "snd_flowery_voiceclip_heytherelittleguy", snd_flowery_voiceclip_heytherelittleguy);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepyouladies", snd_flowery_voiceclip_sorrytokeepyouladies);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorryaboutthatguys", snd_flowery_voiceclip_sorryaboutthatguys);
            ds_map_add(sndm, "snd_flowery_voiceclip_itsmeflowery", snd_flowery_voiceclip_itsmeflowery);
            ds_map_add(sndm, "snd_flowery_voiceclip_yourdadsmybestfriend", snd_flowery_voiceclip_yourdadsmybestfriend);
            ds_map_add(sndm, "snd_flowery_voiceclip_heyguysithinkifoundaglue", snd_flowery_voiceclip_heyguysithinkifoundaglue);
            ds_map_add(sndm, "snd_flowery_voiceclip_imsorryonceagainikeptaladyinwaiting", snd_flowery_voiceclip_imsorryonceagainikeptaladyinwaiting);
            ds_map_add(sndm, "snd_flowery_voiceclip_glue", snd_flowery_voiceclip_glue);
            ds_map_add(sndm, "snd_flowery_voiceclip_hereicomesanfrandisco_strong", snd_flowery_voiceclip_hereicomesanfrandisco_strong);
            ds_map_add(sndm, "snd_flowery_voiceclip_hereicomesanfrandisc", snd_flowery_voiceclip_hereicomesanfrandisc);
            ds_map_add(sndm, "snd_flowery_voiceclip_itsme", snd_flowery_voiceclip_itsme);
            ds_map_add(sndm, "snd_flowery_voiceclip_hey_raly", snd_flowery_voiceclip_hey_raly);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepyouwaiting2", snd_flowery_voiceclip_sorrytokeepyouwaiting2);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorryabouttheguy", snd_flowery_voiceclip_sorryabouttheguy);
            ds_map_add(sndm, "snd_flowery_voiceclip_flowers_blooms_in_your_heart", snd_flowery_voiceclip_flowers_blooms_in_your_heart);
            ds_map_add(sndm, "snd_flowery_voiceclip_no_way_its_your_children", snd_flowery_voiceclip_no_way_its_your_children);
            ds_map_add(sndm, "snd_flowery_voiceclip_mysterious_wind", snd_flowery_voiceclip_mysterious_wind);
            ds_map_add(sndm, "snd_flowery_voiceclip_my_king", snd_flowery_voiceclip_my_king);
            ds_map_add(sndm, "snd_flowery_voiceclip_my_favorite_two", snd_flowery_voiceclip_my_favorite_two);
            ds_map_add(sndm, "snd_flowery_voiceclip_im_falling", snd_flowery_voiceclip_im_falling);
            ds_map_add(sndm, "snd_flowery_voiceclip_hey_boys", snd_flowery_voiceclip_hey_boys);
            ds_map_add(sndm, "snd_flowery_voiceclip_grown_like_a_turnip", snd_flowery_voiceclip_grown_like_a_turnip);
            ds_map_add(sndm, "snd_flowery_voiceclip_great_style", snd_flowery_voiceclip_great_style);
            ds_map_add(sndm, "snd_flowery_voiceclip_your_dad", snd_flowery_voiceclip_your_dad);
            ds_map_add(sndm, "snd_flowery_voiceclip_the_diner", snd_flowery_voiceclip_the_diner);
            ds_map_add(sndm, "snd_flowery_voiceclip_the_boys", snd_flowery_voiceclip_the_boys);
            ds_map_add(sndm, "snd_flowery_voiceclip_calling_for_help", snd_flowery_voiceclip_calling_for_help);
            ds_map_add(sndm, "snd_flowery_voiceclip_try_my_flavor", snd_flowery_voiceclip_try_my_flavor);
            ds_map_add(sndm, "snd_flowery_voiceclip_goodbye", snd_flowery_voiceclip_goodbye);
            ds_map_add(sndm, "snd_flowery_voiceclip_susie", snd_flowery_voiceclip_susie);
            ds_map_add(sndm, "snd_flowery_voiceclip_kris", snd_flowery_voiceclip_kris);
            ds_map_add(sndm, "snd_flowery_voiceclip_get_a_chance_1", snd_flowery_voiceclip_get_a_chance_1);
            ds_map_add(sndm, "snd_flowery_voiceclip_youre_a_hero", snd_flowery_voiceclip_youre_a_hero);
            ds_map_add(sndm, "snd_flowery_voiceclip_forget_it", snd_flowery_voiceclip_forget_it);
            ds_map_add(sndm, "snd_flowery_voiceclip_my_human", snd_flowery_voiceclip_my_human);
            ds_map_add(sndm, "snd_flowery_voiceclip_leaf_it_to_me", snd_flowery_voiceclip_leaf_it_to_me);
            ds_map_add(sndm, "snd_flowery_voiceclip_say_that_again", snd_flowery_voiceclip_say_that_again);
            ds_map_add(sndm, "snd_flowery_voiceclip_go_home", snd_flowery_voiceclip_go_home);
            ds_map_add(sndm, "snd_flowery_voiceclip_smile_again", snd_flowery_voiceclip_smile_again);
            ds_map_add(sndm, "snd_flowery_voiceclip_thats_my_dreams", snd_flowery_voiceclip_thats_my_dreams);
            ds_map_add(sndm, "snd_flowery_voiceclip_dont_you_like_serving_humans", snd_flowery_voiceclip_dont_you_like_serving_humans);
            ds_map_add(sndm, "snd_flowery_voiceclip_im_only_trying_to_help_you", snd_flowery_voiceclip_im_only_trying_to_help_you);
            ds_map_add(sndm, "snd_flowery_voiceclip_all_according_to_all_according_to_plant", snd_flowery_voiceclip_all_according_to_all_according_to_plant);
            ds_map_add(sndm, "snd_flowery_voiceclip_mostlys", snd_flowery_voiceclip_mostlys);
            ds_map_add(sndm, "snd_flowery_voiceclip_its_so_human", snd_flowery_voiceclip_its_so_human);
            ds_map_add(sndm, "snd_flowery_voiceclip_what_a_predictable_creature", snd_flowery_voiceclip_what_a_predictable_creature);
            ds_map_add(sndm, "snd_flowery_voiceclip_its_all_in_a_name", snd_flowery_voiceclip_its_all_in_a_name);
            ds_map_add(sndm, "snd_flowery_voiceclip_give_to_you", snd_flowery_voiceclip_give_to_you);
            ds_map_add(sndm, "snd_flowery_voiceclip_suckle_it_up", snd_flowery_voiceclip_suckle_it_up);
            ds_map_add(sndm, "snd_flowery_voiceclip_flowery2", snd_flowery_voiceclip_flowery2);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepyouwaiting1", snd_flowery_voiceclip_sorrytokeepyouwaiting1);
            ds_map_add(sndm, "snd_flowery_voiceclip_its_all_yours", snd_flowery_voiceclip_its_all_yours);
            ds_map_add(sndm, "snd_flowery_voiceclip_minipeppers", snd_flowery_voiceclip_minipeppers);
            ds_map_add(sndm, "snd_flowery_voiceclip_heh_it_s_my_jarona", snd_flowery_voiceclip_heh_it_s_my_jarona);
            ds_map_add(sndm, "snd_flowery_voiceclip_hoo", snd_flowery_voiceclip_hoo);
            ds_map_add(sndm, "snd_flowery_voiceclip_jarona1", snd_flowery_voiceclip_jarona1);
            ds_map_add(sndm, "snd_flowery_voiceclip_jarona2", snd_flowery_voiceclip_jarona2);
            ds_map_add(sndm, "snd_flowery_voiceclip_jarona3", snd_flowery_voiceclip_jarona3);
            ds_map_add(sndm, "snd_flowery_voiceclip_jarona4", snd_flowery_voiceclip_jarona4);
            ds_map_add(sndm, "snd_flowery_voiceclip_prism_blow", snd_flowery_voiceclip_prism_blow);
            ds_map_add(sndm, "snd_flowery_voiceclip_take_that", snd_flowery_voiceclip_take_that);
            ds_map_add(sndm, "snd_flowery_voiceclip_last_jarona", snd_flowery_voiceclip_last_jarona);
            ds_map_add(sndm, "snd_flowery_voiceclip_lend_me_your_power", snd_flowery_voiceclip_lend_me_your_power);
            ds_map_add(sndm, "snd_flowery_voiceclip_omega_flowery", snd_flowery_voiceclip_omega_flowery);
            ds_map_add(sndm, "snd_flowery_voiceclip_with_your_powers_combined", snd_flowery_voiceclip_with_your_powers_combined);
            ds_map_add(sndm, "snd_flowery_voiceclip_theyre_eating_my_flesh", snd_flowery_voiceclip_theyre_eating_my_flesh);
            ds_map_add(sndm, "snd_forthefans", snd_forthefans);
            ds_map_add(sndm, "snd_jarona_orange1", snd_jarona_orange1);
            ds_map_add(sndm, "snd_jarona_orange2", snd_jarona_orange2);
            ds_map_add(sndm, "snd_ja_kidding", snd_ja_kidding);
    //    }
    }
}
