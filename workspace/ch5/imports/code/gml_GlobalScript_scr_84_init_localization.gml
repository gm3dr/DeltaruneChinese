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
        global.names = ini_read_real("L10N_ZH", "NAMES", 0);
        ossafe_ini_close();
        ossafe_savedata_save();
    }
    global.lang = "en";
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
            ds_map_add(fm, "main", 14);
            ds_map_add(fm, "mainbig", 11);
            ds_map_add(fm, "tinynoelle", 13);
            ds_map_add(fm, "dotumche", 10);
            ds_map_add(fm, "comicsans", 9);
            ds_map_add(fm, "small", 12);
            ds_map_add(fm, "8bit", 0);
            ds_map_add(fm, "8bit_mixed", 1);
            var sm = global.chemg_sprite_map;
            ds_map_add(sm, "spr_bnamekris", 4155);
            ds_map_add(sm, "spr_bnameralsei", 4159);
            ds_map_add(sm, "spr_bnamesusie", 4164);
            ds_map_add(sm, "spr_bnamenoelle", 691);
            ds_map_add(sm, "spr_battlemsg", 3327);
            ds_map_add(sm, "spr_btact", 4165);
            ds_map_add(sm, "spr_btdefend", 4166);
            ds_map_add(sm, "spr_btfight", 4169);
            ds_map_add(sm, "spr_btitem", 4170);
            ds_map_add(sm, "spr_btspare", 4172);
            ds_map_add(sm, "spr_bttech", 4171);
            ds_map_add(sm, "spr_darkmenudesc", 4659);
            ds_map_add(sm, "spr_dmenu_captions", 4418);
            ds_map_add(sm, "spr_quitmessage", 5473);
            ds_map_add(sm, "spr_thrashstats", 3621);
            ds_map_add(sm, "spr_fieldmuslogo", 4721);
            ds_map_add(sm, "spr_shop_space_ui", 626);
            ds_map_add(sm, "spr_face_queen", 23);
            ds_map_add(sm, "bg_building_icee_sign_ch5", 7474);
            ds_map_add(sm, "spr_dw_fcastle_second_diner_sign_en", 2321);
            ds_map_add(sm, "spr_cafe_cheese_owe_money", 637);
            ds_map_add(sm, "spr_dw_castle_welcome_sign", 3848);
            ds_map_add(sm, "spr_dw_fcastle_foyer_sign", 329);
            ds_map_add(sm, "spr_dw_garden_exit", 2447);
            ds_map_add(sm, "spr_dw_scarecrow_not_enemy_sign", 7598);
            ds_map_add(sm, "spr_face_susie_queen", 2842);
            ds_map_add(sm, "spr_fcastle_jail_chute", 3604);
            ds_map_add(sm, "spr_gardenmuslogo", 1399);
            ds_map_add(sm, "spr_green_sign", 3274);
            ds_map_add(sm, "spr_green_sign_owe_money", 3511);
            ds_map_add(sm, "spr_green_sign_owe_money_left", 2148);
            ds_map_add(sm, "spr_green_sign_welcome_pink", 4533);
            ds_map_add(sm, "spr_pink_mewers_live", 2833);
            ds_map_add(sm, "spr_pink_mewers_live_dim", 8475);
            ds_map_add(sm, "spr_thrashfit_header", 5436);
            ds_map_add(sm, "spr_thrashstats_susie", 3871);
            ds_map_add(sm, "spr_funnytext_dump_her", 6211);
            ds_map_add(sm, "spr_funnytext_ass", 7714);
            var sndm = global.chemg_sound_map;
            ds_map_add(sndm, "snd_flowery_voiceclip_flowery2", 674);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepyouwaiting1", 688);
            ds_map_add(sndm, "snd_flowery_voiceclip_heyguys", 642);
            ds_map_add(sndm, "snd_flowery_voiceclip_hey", 110);
            ds_map_add(sndm, "snd_flowery_voiceclip_thatsgreat", 718);
            ds_map_add(sndm, "snd_flowery_voiceclip_wow", 165);
            ds_map_add(sndm, "snd_flowery_voiceclip_yes", 213);
            ds_map_add(sndm, "snd_flowery_voiceclip_nonono", 187);
            ds_map_add(sndm, "snd_flowery_voiceclip_huh", 117);
            ds_map_add(sndm, "snd_flowery_voiceclip_stingus", 80);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepaladyinwaiting", 102);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorryaboutthatlittleguy", 109);
            ds_map_add(sndm, "snd_flowery_voiceclip_thisguysyourbestfriend", 225);
            ds_map_add(sndm, "snd_flowery_voiceclip_heytherelittleguy", 521);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepyouladies", 638);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorryaboutthatguys", 716);
            ds_map_add(sndm, "snd_flowery_voiceclip_itsmeflowery", 382);
            ds_map_add(sndm, "snd_flowery_voiceclip_yourdadsmybestfriend", 338);
            ds_map_add(sndm, "snd_flowery_voiceclip_heyguysithinkifoundaglue", 505);
            ds_map_add(sndm, "snd_flowery_voiceclip_imsorryonceagainikeptaladyinwaiting", 261);
            ds_map_add(sndm, "snd_flowery_voiceclip_glue", 132);
            ds_map_add(sndm, "snd_flowery_voiceclip_hereicomesanfrandisc", 675);
            ds_map_add(sndm, "snd_flowery_voiceclip_hereicomesanfrandisco_strong", 762);
            ds_map_add(sndm, "snd_flowery_voiceclip_itsme", 763);
            ds_map_add(sndm, "snd_flowery_voiceclip_hey_raly", 220);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepyouwaiting2", 637);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorryabouttheguy", 735);
            ds_map_add(sndm, "snd_flowery_voiceclip_flowers_blooms_in_your_heart", 196);
            ds_map_add(sndm, "snd_flowery_voiceclip_no_way_its_your_children", 167);
            ds_map_add(sndm, "snd_flowery_voiceclip_mysterious_wind", 405);
            ds_map_add(sndm, "snd_flowery_voiceclip_my_king", 611);
            ds_map_add(sndm, "snd_flowery_voiceclip_my_favorite_two", 744);
            ds_map_add(sndm, "snd_flowery_voiceclip_im_falling", 238);
            ds_map_add(sndm, "snd_flowery_voiceclip_hey_boys", 75);
            ds_map_add(sndm, "snd_flowery_voiceclip_grown_like_a_turnip", 87);
            ds_map_add(sndm, "snd_flowery_voiceclip_great_style", 241);
            ds_map_add(sndm, "snd_flowery_voiceclip_your_dad", 55);
            ds_map_add(sndm, "snd_flowery_voiceclip_the_diner", 104);
            ds_map_add(sndm, "snd_flowery_voiceclip_the_boys", 655);
            ds_map_add(sndm, "snd_flowery_voiceclip_calling_for_help", 216);
            ds_map_add(sndm, "snd_flowery_voiceclip_try_my_flavor", 10);
            ds_map_add(sndm, "snd_flowery_voiceclip_goodbye", 125);
            ds_map_add(sndm, "snd_flowery_voiceclip_susie", 239);
            ds_map_add(sndm, "snd_flowery_voiceclip_kris", 754);
            ds_map_add(sndm, "snd_flowery_voiceclip_get_a_chance_1", 193);
            ds_map_add(sndm, "snd_flowery_voiceclip_youre_a_hero", 221);
            ds_map_add(sndm, "snd_flowery_voiceclip_forget_it", 258);
            ds_map_add(sndm, "snd_flowery_voiceclip_my_human", 645);
            ds_map_add(sndm, "snd_flowery_voiceclip_leaf_it_to_me", 411);
            ds_map_add(sndm, "snd_flowery_voiceclip_say_that_again", 100);
            ds_map_add(sndm, "snd_flowery_voiceclip_go_home", 623);
            ds_map_add(sndm, "snd_flowery_voiceclip_smile_again", 223);
            ds_map_add(sndm, "snd_flowery_voiceclip_thats_my_dreams", 698);
            ds_map_add(sndm, "snd_flowery_voiceclip_dont_you_like_serving_humans", 760);
            ds_map_add(sndm, "snd_flowery_voiceclip_im_only_trying_to_help_you", 257);
            ds_map_add(sndm, "snd_flowery_voiceclip_all_according_to_all_according_to_plant", 129);
            ds_map_add(sndm, "snd_flowery_voiceclip_mostlys", 22);
            ds_map_add(sndm, "snd_flowery_voiceclip_its_so_human", 725);
            ds_map_add(sndm, "snd_flowery_voiceclip_what_a_predictable_creature", 266);
            ds_map_add(sndm, "snd_flowery_voiceclip_its_all_in_a_name", 612);
            ds_map_add(sndm, "snd_flowery_voiceclip_give_to_you", 662);
            ds_map_add(sndm, "snd_flowery_voiceclip_suckle_it_up", 48);
            ds_map_add(sndm, "snd_flowery_voiceclip_flowery2", 674);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepyouwaiting1", 688);
            ds_map_add(sndm, "snd_flowery_voiceclip_its_all_yours", 17);
            ds_map_add(sndm, "snd_flowery_voiceclip_minipeppers", 119);
            ds_map_add(sndm, "snd_flowery_voiceclip_heh_it_s_my_jarona", 707);
            ds_map_add(sndm, "snd_flowery_voiceclip_hoo", 691);
            ds_map_add(sndm, "snd_flowery_voiceclip_jarona1", 237);
            ds_map_add(sndm, "snd_flowery_voiceclip_jarona2", 189);
            ds_map_add(sndm, "snd_flowery_voiceclip_jarona3", 745);
            ds_map_add(sndm, "snd_flowery_voiceclip_jarona4", 4);
            ds_map_add(sndm, "snd_flowery_voiceclip_prism_blow", 445);
            ds_map_add(sndm, "snd_flowery_voiceclip_take_that", 62);
            ds_map_add(sndm, "snd_flowery_voiceclip_last_jarona", 432);
            ds_map_add(sndm, "snd_flowery_voiceclip_lend_me_your_power", 57);
            ds_map_add(sndm, "snd_flowery_voiceclip_omega_flowery", 701);
            ds_map_add(sndm, "snd_flowery_voiceclip_with_your_powers_combined", 224);
            ds_map_add(sndm, "snd_flowery_voiceclip_theyre_eating_my_flesh", 263);
            ds_map_add(sndm, "snd_forthefans", 746);
            ds_map_add(sndm, "snd_jarona_orange1", 211);
            ds_map_add(sndm, "snd_jarona_orange2", 211);
            ds_map_add(sndm, "snd_ja_kidding", 200);
        }
        else
        {
            var fm = global.font_map;
            ds_map_add(fm, "main", 6);
            ds_map_add(fm, "mainbig", 5);
            ds_map_add(fm, "tinynoelle", 3);
            ds_map_add(fm, "dotumche", 4);
            ds_map_add(fm, "comicsans", 7);
            ds_map_add(fm, "small", 8);
            ds_map_add(fm, "8bit", 2);
            ds_map_add(fm, "8bit_mixed", 2);
            var sm = global.chemg_sprite_map;

		if (global.names < 2)
		{
			ds_map_add(sm, "spr_bnamekris", spr_bnamekris);
			ds_map_add(sm, "spr_bnameralsei", spr_bnameralsei);
			ds_map_add(sm, "spr_bnamesusie", spr_bnamesusie);
			ds_map_add(sm, "spr_bnamenoelle", spr_bnamenoelle);
		}
		else
		{
			ds_map_add(sm, "spr_bnamekris", spr_zhname_bnamekris);
			ds_map_add(sm, "spr_bnameralsei", spr_zhname_bnameralsei);
			ds_map_add(sm, "spr_bnamesusie", spr_zhname_bnamesusie);
			ds_map_add(sm, "spr_bnamenoelle", spr_zhname_bnamenoelle);
		}
            ds_map_add(sm, "spr_battlemsg", 7569);
            ds_map_add(sm, "spr_btact", 4107);
            ds_map_add(sm, "spr_btdefend", 4112);
            ds_map_add(sm, "spr_btfight", 4115);
            ds_map_add(sm, "spr_btitem", 4129);
            ds_map_add(sm, "spr_btspare", 4116);
            ds_map_add(sm, "spr_bttech", 4134);
            ds_map_add(sm, "spr_darkmenudesc", 4649);
            ds_map_add(sm, "spr_dmenu_captions", 4382);
            ds_map_add(sm, "spr_quitmessage", 4877);
            ds_map_add(sm, "spr_fieldmuslogo", 4721);
            ds_map_add(sm, "spr_shop_space_ui", 1339);
            ds_map_add(sm, "spr_funnytext_dump_her", 1391);
            ds_map_add(sm, "spr_funnytext_ass", 7775);
            ds_map_add(sm, "spr_face_queen", 343);
            ds_map_add(sm, "bg_building_icee_sign_ch5", 3526);
            ds_map_add(sm, "spr_dw_fcastle_second_diner_sign_en", 4506);
            ds_map_add(sm, "spr_cafe_cheese_owe_money", 8252);
            ds_map_add(sm, "spr_dw_castle_welcome_sign", 1772);
            ds_map_add(sm, "spr_dw_fcastle_foyer_sign", 2130);
            ds_map_add(sm, "spr_dw_garden_exit", 47);
            ds_map_add(sm, "spr_dw_scarecrow_not_enemy_sign", 7691);
            ds_map_add(sm, "spr_face_susie_queen", 890);
            ds_map_add(sm, "spr_fcastle_jail_chute", 7903);
            ds_map_add(sm, "spr_gardenmuslogo", 1920);
            ds_map_add(sm, "spr_green_sign", 923);
            ds_map_add(sm, "spr_green_sign_owe_money", 3133);
            ds_map_add(sm, "spr_green_sign_owe_money_left", 7230);
            ds_map_add(sm, "spr_green_sign_welcome_pink", 7194);
            ds_map_add(sm, "spr_pink_mewers_live", 3362);
            ds_map_add(sm, "spr_pink_mewers_live_dim", 1430);
            ds_map_add(sm, "spr_thrashfit_header", 5564);
            ds_map_add(sm, "spr_thrashstats_susie", 89);
            var sndm = global.chemg_sound_map;
            ds_map_add(sndm, "snd_flowery_voiceclip_flowery2", 131);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepyouwaiting1", 111);
            ds_map_add(sndm, "snd_flowery_voiceclip_heyguys", 106);
            ds_map_add(sndm, "snd_flowery_voiceclip_hey", 110);
            ds_map_add(sndm, "snd_flowery_voiceclip_thatsgreat", 5);
            ds_map_add(sndm, "snd_flowery_voiceclip_wow", 244);
            ds_map_add(sndm, "snd_flowery_voiceclip_yes", 228);
            ds_map_add(sndm, "snd_flowery_voiceclip_nonono", 187);
            ds_map_add(sndm, "snd_flowery_voiceclip_huh", 117);
            ds_map_add(sndm, "snd_flowery_voiceclip_stingus", 757);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepaladyinwaiting", 226);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorryaboutthatlittleguy", 717);
            ds_map_add(sndm, "snd_flowery_voiceclip_thisguysyourbestfriend", 633);
            ds_map_add(sndm, "snd_flowery_voiceclip_heytherelittleguy", 205);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepyouladies", 154);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorryaboutthatguys", 44);
            ds_map_add(sndm, "snd_flowery_voiceclip_itsmeflowery", 72);
            ds_map_add(sndm, "snd_flowery_voiceclip_yourdadsmybestfriend", 750);
            ds_map_add(sndm, "snd_flowery_voiceclip_heyguysithinkifoundaglue", 210);
            ds_map_add(sndm, "snd_flowery_voiceclip_imsorryonceagainikeptaladyinwaiting", 54);
            ds_map_add(sndm, "snd_flowery_voiceclip_glue", 15);
            ds_map_add(sndm, "snd_flowery_voiceclip_hereicomesanfrandisco_strong", 317);
            ds_map_add(sndm, "snd_flowery_voiceclip_hereicomesanfrandisc", 250);
            ds_map_add(sndm, "snd_flowery_voiceclip_itsme", 673);
            ds_map_add(sndm, "snd_flowery_voiceclip_hey_raly", 77);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepyouwaiting2", 95);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorryabouttheguy", 49);
            ds_map_add(sndm, "snd_flowery_voiceclip_flowers_blooms_in_your_heart", 616);
            ds_map_add(sndm, "snd_flowery_voiceclip_no_way_its_your_children", 183);
            ds_map_add(sndm, "snd_flowery_voiceclip_mysterious_wind", 144);
            ds_map_add(sndm, "snd_flowery_voiceclip_my_king", 197);
            ds_map_add(sndm, "snd_flowery_voiceclip_my_favorite_two", 74);
            ds_map_add(sndm, "snd_flowery_voiceclip_im_falling", 678);
            ds_map_add(sndm, "snd_flowery_voiceclip_hey_boys", 436);
            ds_map_add(sndm, "snd_flowery_voiceclip_grown_like_a_turnip", 702);
            ds_map_add(sndm, "snd_flowery_voiceclip_great_style", 574);
            ds_map_add(sndm, "snd_flowery_voiceclip_your_dad", 53);
            ds_map_add(sndm, "snd_flowery_voiceclip_the_diner", 89);
            ds_map_add(sndm, "snd_flowery_voiceclip_the_boys", 204);
            ds_map_add(sndm, "snd_flowery_voiceclip_calling_for_help", 216);
            ds_map_add(sndm, "snd_flowery_voiceclip_try_my_flavor", 704);
            ds_map_add(sndm, "snd_flowery_voiceclip_goodbye", 125);
            ds_map_add(sndm, "snd_flowery_voiceclip_susie", 151);
            ds_map_add(sndm, "snd_flowery_voiceclip_kris", 212);
            ds_map_add(sndm, "snd_flowery_voiceclip_get_a_chance_1", 208);
            ds_map_add(sndm, "snd_flowery_voiceclip_youre_a_hero", 140);
            ds_map_add(sndm, "snd_flowery_voiceclip_forget_it", 627);
            ds_map_add(sndm, "snd_flowery_voiceclip_my_human", 3);
            ds_map_add(sndm, "snd_flowery_voiceclip_leaf_it_to_me", 622);
            ds_map_add(sndm, "snd_flowery_voiceclip_say_that_again", 741);
            ds_map_add(sndm, "snd_flowery_voiceclip_go_home", 739);
            ds_map_add(sndm, "snd_flowery_voiceclip_smile_again", 147);
            ds_map_add(sndm, "snd_flowery_voiceclip_thats_my_dreams", 142);
            ds_map_add(sndm, "snd_flowery_voiceclip_dont_you_like_serving_humans", 79);
            ds_map_add(sndm, "snd_flowery_voiceclip_im_only_trying_to_help_you", 743);
            ds_map_add(sndm, "snd_flowery_voiceclip_all_according_to_all_according_to_plant", 14);
            ds_map_add(sndm, "snd_flowery_voiceclip_mostlys", 696);
            ds_map_add(sndm, "snd_flowery_voiceclip_its_so_human", 185);
            ds_map_add(sndm, "snd_flowery_voiceclip_what_a_predictable_creature", 653);
            ds_map_add(sndm, "snd_flowery_voiceclip_its_all_in_a_name", 159);
            ds_map_add(sndm, "snd_flowery_voiceclip_give_to_you", 628);
            ds_map_add(sndm, "snd_flowery_voiceclip_suckle_it_up", 29);
            ds_map_add(sndm, "snd_flowery_voiceclip_flowery2", 131);
            ds_map_add(sndm, "snd_flowery_voiceclip_sorrytokeepyouwaiting1", 111);
            ds_map_add(sndm, "snd_flowery_voiceclip_its_all_yours", 103);
            ds_map_add(sndm, "snd_flowery_voiceclip_minipeppers", 736);
            ds_map_add(sndm, "snd_flowery_voiceclip_heh_it_s_my_jarona", 164);
            ds_map_add(sndm, "snd_flowery_voiceclip_hoo", 691);
            ds_map_add(sndm, "snd_flowery_voiceclip_jarona1", 12);
            ds_map_add(sndm, "snd_flowery_voiceclip_jarona2", 150);
            ds_map_add(sndm, "snd_flowery_voiceclip_jarona3", 752);
            ds_map_add(sndm, "snd_flowery_voiceclip_jarona4", 68);
            ds_map_add(sndm, "snd_flowery_voiceclip_prism_blow", 740);
            ds_map_add(sndm, "snd_flowery_voiceclip_take_that", 135);
            ds_map_add(sndm, "snd_flowery_voiceclip_last_jarona", 613);
            ds_map_add(sndm, "snd_flowery_voiceclip_lend_me_your_power", 624);
            ds_map_add(sndm, "snd_flowery_voiceclip_omega_flowery", 659);
            ds_map_add(sndm, "snd_flowery_voiceclip_with_your_powers_combined", 166);
            ds_map_add(sndm, "snd_flowery_voiceclip_theyre_eating_my_flesh", 644);
            ds_map_add(sndm, "snd_forthefans", 124);
            ds_map_add(sndm, "snd_jarona_orange1", 703);
            ds_map_add(sndm, "snd_jarona_orange2", 260);
            ds_map_add(sndm, "snd_ja_kidding", 40);
    }
}
