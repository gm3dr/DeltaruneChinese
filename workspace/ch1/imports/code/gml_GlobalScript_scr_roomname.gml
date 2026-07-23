function scr_roomname(arg0)
{
    roomname = " ";
    
    if (arg0 == 0)
        roomname = "---";
    
    if (arg0 == 2)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_3_0");
    
    if (arg0 == 35)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_4_0");
    
    if (arg0 == 40)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_5_0");
    
    if (arg0 == 45)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_6_0");
    
    if (arg0 == 49)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_7_0");
    
    if (arg0 == 59)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_8_0");
    
    if (arg0 == 68)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_9_0");
    
    if (arg0 == 71)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_10_0");
    
    if (arg0 == 73)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_11_0");
    
    if (arg0 == 82)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_12_0");
    
    if (arg0 == 90)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_13_0");
    
    if (arg0 == 96)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_14_0");
    
    if (arg0 == 97)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_15_0");
    
    if (arg0 == 107)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_16_0");
    
    if (arg0 == 114)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_17_0");
    
    if (arg0 == 123)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_18_0");
    
    if (arg0 == 126)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_19_0");
    
    if (arg0 == 111)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_20_0");
    
    if (arg0 == 56)
    {
        if (global.lang == "en")
            roomname = "Field - Maze of Death";
        
        if (global.lang == "ja")
            roomname = "平原 - 死の迷路";
    }
    
    return roomname;
}
