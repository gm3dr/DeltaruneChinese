function scr_get_team_name()
{
    var name = stringsetloc("Gang", "scr_get_team_name_slash_scr_get_team_name_gml_2_0");
    
    if (global.flag[214] == 1)
        name = stringsetloc("The $!$? Squad", "scr_get_team_name_slash_scr_get_team_name_gml_4_0");
    
    if (global.flag[214] == 2)
        name = stringsetloc("The Lancer Fan Club", "scr_get_team_name_slash_scr_get_team_name_gml_5_0");
    
    if (global.flag[214] == 3)
        name = stringsetloc("The Fun Gang", "scr_get_team_name_slash_scr_get_team_name_gml_6_0");
    
    return name;
}
