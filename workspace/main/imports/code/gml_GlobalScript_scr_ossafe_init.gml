function scr_ossafe_init()
{
}

function scr_get_supported_demo_titles()
{
    var titles = [];
    
    if (scr_is_switch_os())
        titles = [new scr_switch_title("n/a", new scr_save_data_file("DELTARUNESaveData", "deltarune_ch1.sav")), new scr_switch_title("n/a", new scr_save_data_file("DELTARUNESaveData", "deltarune_ch1.sav"))];
    else if (os_type == os_ps4 || os_type == os_ps5)
        titles = [new scr_ps4_title("n/a", "n/a", new scr_save_data_file("DELTARUNESaveData", "deltarune_ch1.sav")), new scr_ps4_title("n/a", "n/a", new scr_save_data_file("DELTARUNE", "deltarune_ch1.sav")), new scr_ps4_title("n/a", "n/a", new scr_save_data_file("DELTARUNESaveData", "deltarune_ch1.sav")), new scr_ps4_title("n/a", "n/a", new scr_save_data_file("DELTARUNE", "deltarune_ch1.sav")), new scr_ps4_title("n/a", "n/a", new scr_save_data_file("DELTARUNESaveData", "deltarune_ch1.sav")), new scr_ps4_title("n/a", "n/a", new scr_save_data_file("DELTARUNE", "deltarune_ch1.sav"))];
    
    return titles;
}

function scr_get_supported_full_titles()
{
    var titles = [];
    
    if (os_get_config() == "SWITCH_OZ")
        titles = [new scr_switch_title("n/a", new scr_save_data_file("DELTARUNE", "deltarune.sav"))];
    else if (os_get_config() == "PS5" || os_get_config() == "PS5_TEST")
        titles = [new scr_ps4_title("n/a", "n/a", new scr_save_data_file("DELTARUNE", "deltarune.sav"))];
    
    return titles;
}

function scr_switch_title(arg0, arg1) constructor
{
    app_id = arg0;
    save_data_file = arg1;
}

function scr_ps4_title(arg0, arg1, arg2) constructor
{
    title_id = arg0;
    fingerprint = arg1;
    save_data_file = arg2;
}

function scr_save_data_file(arg0, arg1) constructor
{
    slottitle = arg0;
    filename = arg1;
}

function scr_pending_save_data(arg0, arg1) constructor
{
    title = arg0;
    save_data = arg1;
}

function scr_is_demo_title(arg0)
{
    if (scr_is_switch_os())
        return arg0.app_id == "n/a" || arg0.app_id == "n/a";
    else
        return arg0.title_id == "n/a" || arg0.title_id == "n/a" || arg0.title_id == "n/a";
}

function scr_is_full_title(arg0)
{
    if (scr_is_switch_os())
        return arg0.app_id == "n/a";
    else
        return arg0.title_id == "n/a";
}

function scr_get_app_title(arg0)
{
    var product_title = "N/A";
    
    if (scr_is_demo_title(arg0))
    {
        if (scr_is_switch_os())
        {
            if (arg0.app_id == "n/a")
            {
                product_title = "DELTARUNE 第一章+第二章\n";
                
                if (global.lang == "ja")
                    product_title = "『DELTARUNE Chapter 1&2』の\n";
            }
            else if (arg0.app_id == "n/a")
            {
                product_title = "DELTARUNE 第一章+第二章 试玩版\n";
                
                if (global.lang == "ja")
                    product_title = "『DELTARUNE Chapter 1&2 体験版』の\n";
            }
        }
        else
        {
            product_title = "DELTARUNE 第一章+第二章 试玩版\n";
            
            if (global.lang == "ja")
                product_title = "体験版『DELTARUNE Chapter 1&2』の\n";
        }
    }
    else if (scr_is_full_title(arg0))
    {
        if (scr_is_switch_os())
        {
            product_title = "DELTARUNE 任天堂Switch版\n";
            
            if (global.lang == "ja")
                product_title = "Nintendo Switch版『DELTARUNE』の\n";
        }
        else
        {
            product_title = "DELTARUNE PlayStation-4版#";
            
            if (global.lang == "ja")
                product_title = "PlayStation~4版『DELTARUNE』の#";
        }
    }
    
    return product_title;
}

function scr_get_app_title_choice_text(arg0)
{
    var product_title = "N/A";
    
    if (scr_is_demo_title(arg0))
    {
        if (scr_is_switch_os())
        {
            if (arg0.app_id == "n/a")
            {
                product_title = "DELTARUNE 第一章+第二章 试玩版（2021）"
                
                if (global.lang == "ja")
                    product_title = "『DELTARUNE Chapter 1&2』（2021年）";
            }
            else if (arg0.app_id == "n/a")
            {
                product_title = "DELTARUNE 第一章+第二章 试玩版（2025）";
                
                if (global.lang == "ja")
                    product_title = "『DELTARUNE Chapter 1&2 体験版』（2025年）";
            }
        }
        else
        {
            product_title = "DELTARUNE 第一章+第二章 试玩版";
            
            if (global.lang == "ja")
                product_title = "体験版『DELTARUNE Chapter 1&2』";
        }
    }
    else if (scr_is_full_title(arg0))
    {
        if (scr_is_switch_os())
        {
            product_title = "DELTARUNE 任天堂Switch版";
            
            if (global.lang == "ja")
                product_title = "『DELTARUNE』（Nintendo Switch版）";
        }
        else
        {
            product_title = "DELTARUNE PlayStation~4版";
            
            if (global.lang == "ja")
                product_title = "PlayStation~4版『DELTARUNE』";
        }
    }
    
    return product_title;
}
