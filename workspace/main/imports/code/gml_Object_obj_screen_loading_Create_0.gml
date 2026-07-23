_target_chapter = -1;
_init = false;
_callback = -4;
_initialize_text = "";
_font = 4;

show_loading_screen = function(arg0, arg1)
{
    _target_chapter = arg0;
    _callback = arg1;
    _initialize_text = get_text(_target_chapter);
    _font = get_font();
    _init = true;
    alarm[0] = 1;
};

get_text = function(arg0)
{
    var _text = "正在加载\n第" + string(arg0) + "章";
    
    if (global.lang == "ja")
        _text = "CHAPTER " + string(arg0) + "を\nはじめます";
    
    if (arg0 == 0)
    {
        _text = "正在加载\n章节\n选择器";
        
        if (global.lang == "ja")
            _text = "チャプター\n選択画面\nよみこみ中";
    }
    
    return _text;
};

get_font = function()
{
    return (global.lang == "en") ? 4 : 9;
};
