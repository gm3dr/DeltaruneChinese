_chapter = 0;
_init = false;
_parent = -4;
_chapter_choice = -4;
_chapter_title = "";
_title_enabled = true;
_choices = [];
_choice_index = 0;
_scroll_enabled = false;
_input_enabled = false;
_enabled = false;
_enable_select = false;
_enable_confirm = false;
_is_highlighted = false;
_alpha = 0;
_scale = 2;
_color = 8421504;
_font = (global.lang == "en") ? 2 : 1;
_icon_index = UnknownEnum.Value_0;
_completed_files = [];
_fade_in = false;

init = function(arg0, arg1)
{
    _parent = arg0;
    _chapter = arg1;
    _chapter_title = get_chapter_title(_chapter);
    var chapter_text = "第" + string(_chapter) + "章";
    _chapter_choice = instance_create(x + 20, y + 26, obj_ui_choice);
    _chapter_choice.init(id, chapter_text, UnknownEnum.Value_0);
    _chapter_choice.y -= 40;
    _chapter_choice.disable();
    _chapter_choice.set_font(2);
    _chapter_choice.set_alpha(0);
    var play_text = (global.lang == "en") ? "游玩" : "プレイする";
    var cancel_text = (global.lang == "en") ? "返回" : "もどる";
    var confirm_choice = instance_create(x + 220, y + 26, obj_ui_choice);
    confirm_choice.init(id, play_text, UnknownEnum.Value_2);
    confirm_choice.y -= 40;
    confirm_choice.set_alpha(0);
    var cancel_choice = instance_create(confirm_choice.x + 180, y + 26, obj_ui_choice);
    cancel_choice.init(id, cancel_text, UnknownEnum.Value_3);
    cancel_choice.y -= 40;
    cancel_choice.set_alpha(0);
    _choices = [confirm_choice, cancel_choice];
    hide_choices();
    y -= 40;
    _init = true;
};

get_chapter = function()
{
    return _chapter;
};

fade_in = function()
{
    _fade_in = true;
};

enable = function()
{
    _enabled = true;
    _icon_index = get_chapter_icon_index(_chapter);
    _chapter_choice.enable();
    for (var i = 0; i < 3; i++)
    {
        var is_completed = scr_completed_chapter_in_slot(_chapter, i);
        _completed_files[array_length(_completed_files)] = is_completed;
    }
    for (var i = 0; i < array_length(_completed_files); i++)
    {
        var completed = _completed_files[i] == 1;
        var current_exists = scr_chapter_save_file_exists_in_slot(_chapter, i);
        if (completed && !current_exists)
        {
            _completed_files[i] = 2;
        }
    }
};

trigger_event = function(arg0, arg1)
{
    switch (arg1)
    {
        case UnknownEnum.Value_0:
            _chapter_choice.hide_heart();
            _chapter_choice.disable_input();
            hide_title();
            show_choices();
            _parent.trigger_event("disable_scroll", arg1);
            break;
        case UnknownEnum.Value_3:
            _chapter_choice.show_heart();
            _chapter_choice.enable_input();
            hide_choices();
            show_title();
            _parent.trigger_event("enable_scroll", arg1);
            break;
        case UnknownEnum.Value_2:
            _scroll_enabled = false;
            disable_input();
            _parent.trigger_event("launch_game", _chapter);
            break;
    }
};

hide_title = function()
{
    _title_enabled = false;
};

show_title = function()
{
    _title_enabled = true;
};

hide_choices = function()
{
    _scroll_enabled = false;
    for (var i = 0; i < array_length(_choices); i++)
    {
        var choice = _choices[i];
        choice.reset();
        choice.visible = false;
    }
};

show_choices = function()
{
    _scroll_enabled = true;
    _choice_index = 0;
    highlight_choice();
};

highlight_choice = function()
{
    for (var i = 0; i < array_length(_choices); i++)
    {
        var choice = _choices[i];
        choice.visible = true;
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
};

disable_all = function()
{
    disable_input();
    _chapter_choice.disable_input();
    for (var i = 0; i < array_length(_choices); i++)
    {
        var choice = _choices[i];
        choice.disable_input();
    }
};

highlight = function()
{
    _is_highlighted = true;
    _color = 65535;
    _chapter_choice.highlight();
    enable_input();
};

reset = function()
{
    _is_highlighted = false;
    _color = 16777215;
    _chapter_choice.reset();
    disable_input();
};

enum UnknownEnum
{
    Value_0,
    Value_2 = 2,
    Value_3
}
