var __layers = layer_get_all();
var __numlayers = array_length_1d(__layers);

for (var __i = 0; __i < __numlayers; __i++)
{
    var __layer_id = __layers[__i];
    var __els = layer_get_all_elements(__layer_id);
    var __numels = array_length_1d(__els);
    var __name = layer_get_name(__layer_id);
    var __pos = string_pos("_lang_", __name);
    
    if (__pos > 0 && string_length(__name) > (__pos + 8))
    {
        var __lang = string_copy(__name, __pos + 6, 2);
        
        if (__lang != global.lang)
        {
            layer_set_visible(__layer_id, false);
            continue;
        }
    }
    
    for (var __j = 0; __j < __numels; __j++)
    {
        var __id = __els[__j];
        var __eltype = layer_get_element_type(__id);
        
        if (__eltype == 2)
            continue;
        
        if (__eltype == 4)
        {
            var __spr = layer_sprite_get_sprite(__id);
            __name = sprite_get_name(__spr);
            __pos = string_pos("_lang_", __name);
            
            if (__pos > 0 && string_length(__name) > (__pos + 8))
            {
                var __lang = string_copy(__name, __pos + 6, 2);
                
                if (__lang != global.lang)
                    layer_sprite_destroy(__id);
            }
        }
        else if (__eltype == 1)
        {
        }
        else if (__eltype == 5)
        {
        }
        else if (__eltype == 6)
        {
        }
        else if (__eltype == 7)
        {
        }
        else
        {
        }
    }
}
