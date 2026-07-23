function scr_84_lang_load_ch1()
{
    var name = "lang_" + global.lang + (global.names == 0 ? "" : (global.names == 1 ? "_names_recruitable" : "_names")) + "_ch1.json";
    var orig_filename = working_directory + "lang/" + name;
    var new_filename = working_directory + "lang-new/" + name;
    var filename = orig_filename;
    var type = "orig";
    show_debug_message("loading lang: " + orig_filename);
    var orig_map = scr_84_load_map_json_ch1(orig_filename);
    
    if (ossafe_file_exists_ch1(new_filename))
    {
        var new_map = scr_84_load_map_json_ch1(new_filename);
        var new_date = real(ds_map_find_value(new_map, "date"));
        var orig_date = real(ds_map_find_value(orig_map, "date"));
        show_debug_message("orig_date: " + string(orig_date));
        show_debug_message(" new_date: " + string(new_date));
        
        if (new_date > orig_date)
        {
            show_debug_message("using new language file");
            ds_map_destroy(orig_map);
            orig_map = new_map;
            filename = new_filename;
            type = "new(" + string(new_date) + ")";
        }
        else
        {
            show_debug_message("using orig language file");
        }
    }
    
    ds_map_destroy(global.lang_map);
    global.lang_map = orig_map;
    show_debug_message("loaded: " + filename + ", entries: " + string(ds_map_size(global.lang_map)));
    return type;
}
