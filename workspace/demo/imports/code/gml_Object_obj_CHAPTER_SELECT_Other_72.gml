if (ds_map_find_value(async_load, "id") == global.savedata_async_id)
{
    global.savedata_async_id = -1;
    
    if (global.savedata_async_load)
    {
        global.savedata_async_load = false;
        
        if (ds_map_find_value(async_load, "status") == false)
        {
            if (!old_savedata_check)
            {
                old_savedata_check = true;
                ossafe_savedata_load_old_check();
                exit;
            }
            else
            {
                global.savedata_error = true;
                global.savedata_debuginfo = "load failed: " + string(ds_map_find_value(async_load, "status"));
                global.savedata = ds_map_create();
            }
        }
        else
        {
            global.savedata_error = false;
            global.savedata_debuginfo = "load succeeded";
            var json = buffer_read(global.savedata_buffer, buffer_string);
            global.savedata = json_decode(json);
        }
        
        buffer_delete(global.savedata_buffer);
        global.savedata_buffer = undefined;
        global.lang = "en";
        var _locale = os_get_language();
        var _lang;
        
        if (os_type == os_switch)
            _lang = substr(switch_language_get_desired_language(), 1, 2);
        else
            _lang = (substr(_locale, 1, 2) != "ja") ? "en" : "ja";
        
        global.lang = _lang;
        scr_controls_default();
        audio_group_load(1);
        
        if (global.savedata == -1 || global.savedata == undefined)
        {
            var error_message = instance_create(0, 0, obj_savedata_error);
            error_message.error_type = "save_data_corrupt";
            exit;
        }
        
        if (ossafe_file_exists("true_config.ini"))
        {
            first_time = false;
            ossafe_ini_open("true_config.ini");
            global.lang = ini_read_string("LANG", "LANG", _lang);
            ossafe_ini_close();
        }
        
        text_font = (global.lang == "en") ? 3 : 10;
        yes = (global.lang == "en") ? "是" : "はい";
        no = (global.lang == "en") ? "否" : "いいえ";
        chapname[1] = (global.lang == "en") ? "开端" : "はじまり";
        chapname[2] = (global.lang == "en") ? "赛博世界" : "サイバーワールド";
        
        if (ossafe_file_exists("dr.ini"))
            first_time = false;
        
        if (ossafe_file_exists_ch1("filech1_0"))
            first_time = false;
        
        if (ossafe_file_exists_ch1("filech1_1"))
            first_time = false;
        
        if (ossafe_file_exists_ch1("filech1_2"))
            first_time = false;
        
        if (ossafe_file_exists_ch1("filech1_3"))
            first_time = false;
        
        if (ossafe_file_exists_ch1("filech1_4"))
            first_time = false;
        
        if (ossafe_file_exists_ch1("filech1_5"))
            first_time = false;
        
        if (variable_global_exists("store_prompt"))
        {
            if (global.store_prompt)
                first_time = false;
        }
        
        init_loaded = true;
    }
}
