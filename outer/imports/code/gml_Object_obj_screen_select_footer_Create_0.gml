_init = false;
_parent = -4;
_input_enabled = false;
_choices = [];
_choice_index = 0;
_grid_display = -4;
_alpha = 0;
_fade_in = false;

init = function(arg0)
{
    _parent = arg0;
    var language_text = (global.lang == "en") ? "日本語" : "简体中文";
    var language_choice = instance_create(x + 260, y + 24, obj_ui_choice);
    language_choice.init(id, language_text, UnknownEnum.Value_5);
    language_choice.set_alpha(0);
    language_choice.y -= 40;
    if (global.lang == "en")
    {
        language_choice.set_font(1);
    }
    else
    {
        language_choice.set_font(2);
    }
    _choices = [language_choice];
    if (!global.is_console)
    {
        var quit_text = (global.lang == "en") ? "退出" : "終了";
        var quit_choice = instance_create(x + 180, y + 24, obj_ui_choice);
        quit_choice.init(id, quit_text, UnknownEnum.Value_4);
        quit_choice.set_alpha(0);
        quit_choice.y -= 40;
        language_choice.x = quit_choice.x + 140;
        _choices = [quit_choice, language_choice];
    }
    var version_display = instance_create(x, y, obj_ui_version);
    version_display.set_screen_state(UnknownEnum.Value_4);
    _grid_display = instance_create(x + 584, y + 26, obj_ui_grid);
    _init = true;
};

fade_in = function()
{
    _fade_in = true;
    if (_grid_display != -4)
    {
        _grid_display.fade_in();
    }
};

reset = function()
{
    _choice_index = 0;
    for (var i = 0; i < array_length(_choices); i++)
    {
        var choice = _choices[i];
        choice.reset();
    }
};

highlight = function()
{
    for (var i = 0; i < array_length(_choices); i++)
    {
        var choice = _choices[i];
        choice.reset();
        if (i == _choice_index)
        {
            choice.highlight();
        }
    }
};

enable_input = function()
{
    _input_enabled = true;
};

disable_input = function()
{
    _input_enabled = false;
    for (var i = 0; i < array_length(_choices); i++)
    {
        var choice = _choices[i];
        choice.disable_input();
    }
};

trigger_event = function(arg0, arg1)
{
    switch (arg1)
    {
        case UnknownEnum.Value_4:
            disable_input();
            _parent.trigger_event(arg0, arg1);
            break;
        case UnknownEnum.Value_5:
            disable_input();
            _parent.trigger_event(arg0, arg1);
            break;
    }
};

enum UnknownEnum
{
    Value_4 = 4,
    Value_5
}
