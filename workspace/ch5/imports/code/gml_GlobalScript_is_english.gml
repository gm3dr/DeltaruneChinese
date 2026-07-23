function is_english()
{
    return !variable_global_exists("lang") || global.lang == "en";
}
