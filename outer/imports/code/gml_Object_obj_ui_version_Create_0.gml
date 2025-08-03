_copyright_enabled = false;
_copyright_text = "(C) Toby Fox 2018-2025";
_version_text = "DELTARUNE " + get_version() + "  好人汉化组汉化 20250612 v24";
_scale = 1;
_alpha = 1;
_font = 2;

set_screen_state = function(arg0)
{
    if (arg0 == UnknownEnum.Value_4)
    {
        _copyright_enabled = true;
    }
};

set_alpha = function(arg0)
{
    _alpha = arg0;
};

enum UnknownEnum
{
    Value_4 = 4
}
