function scr_84_lang_load()
{
    var name = "lang_" + global.lang + ".json";
    var orig_filename = working_directory + "lang/" + name;
    var new_filename = working_directory + "lang-new/" + name;
    var filename = orig_filename;
    var type = "orig";
    var orig_map = scr_84_load_map_json(orig_filename);
    
    if (ossafe_file_exists(new_filename))
    {
        var new_map = scr_84_load_map_json(new_filename);
        var new_date = real(ds_map_find_value(new_map, "date"));
        var orig_date = real(ds_map_find_value(orig_map, "date"));
        
        if (new_date > orig_date)
        {
            ds_map_destroy(orig_map);
            orig_map = new_map;
            filename = new_filename;
            type = "new(" + string(new_date) + ")";
        }
        else
        {
        }
    }
    
    ds_map_destroy(global.lang_map);
    global.lang_map = orig_map;
    return type;
}
