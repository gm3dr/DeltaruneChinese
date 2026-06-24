function scr_init()
{
}

function create_choice(arg0, arg1) constructor
{
    choice_text = arg0;
    choice_value = arg1;
}

function get_chapter_confirm_sound(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_1:
            return 2;
            break;
        
        case UnknownEnum.Value_2:
            return 1;
            break;
        
        case UnknownEnum.Value_3:
            return 3;
            break;
        
        case UnknownEnum.Value_4:
            return 5;
            break;
        
        case UnknownEnum.Value_5:
            return 0;
            break;
        
        default:
            return 4;
            break;
    }
}

function get_chapter_title(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_1:
            return (global.lang == "en") ? "开端" : "はじまり";
            break;
        
        case UnknownEnum.Value_2:
            return (global.lang == "en") ? "赛博世界" : "サイバーワールド";
            break;
        
        case UnknownEnum.Value_3:
            return (global.lang == "en") ? "深夜" : "レイトナイト";
            break;
        
        case UnknownEnum.Value_4:
            return (global.lang == "en") ? "预言" : "予言";
            break;
        
        case UnknownEnum.Value_5:
            return (global.lang == "en") ? "节日" : "お祭り";
            break;
        
        default:
            return "- -";
            break;
    }
}

function get_version()
{
    var version = "v22";
    return version;
}

function get_chapter_icon_index(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_1:
            return UnknownEnum.Value_1;
            break;
        
        case UnknownEnum.Value_2:
            return UnknownEnum.Value_2;
            break;
        
        case UnknownEnum.Value_3:
            return scr_completed_chapter_any_slot(arg0) ? UnknownEnum.Value_4 : UnknownEnum.Value_3;
            break;
        
        case UnknownEnum.Value_4:
            return UnknownEnum.Value_5;
            break;
        
        case UnknownEnum.Value_5:
            return UnknownEnum.Value_6;
            break;
        
        default:
            return UnknownEnum.Value_0;
            break;
    }
}

function get_title()
{
    var title = "DELTARUNE";
    return title;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6
}
