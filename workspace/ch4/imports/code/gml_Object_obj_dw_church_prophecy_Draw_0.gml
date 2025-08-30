var propblue = 16764994;
var liteblue = 16777215;
image_blend = propblue;
var tilespr = 4065;
var tiletex = 1523;

if (alwaysactive)
    active = true;

width = 150;
height = 90;

if (musickind == 3)
    width = 300;

var xsin = 0;
var ysin = cos(siner / 12) * 4;

if (active)
{
    image_alpha = lerp(image_alpha, 1.2, 0.1);
    scr_update_lightbeams(1 - (image_alpha / 1.2), true);
}
else
{
    image_alpha = lerp(image_alpha, 0, 0.2);
    var _no_others_active = true;
    
    with (object_index)
    {
        if (id != other.id && active)
            _no_others_active = false;
    }
    
    if (_no_others_active && image_alpha > 0)
        scr_update_lightbeams(1 - (image_alpha / 1.2), false);
}

var onscreen = true;

if (image_alpha <= 0)
    onscreen = false;

var camx = camerax();
var camy = cameray();

if (x > (camx + 640 + (width * 2)) || x < (camx - (width * 2)) || y > (camy + 480 + (height * 2)) || y < (camy - (height * 2)))
    onscreen = false;

if (onscreen)
{
    if (angle == 90)
    {
        xsin = ysin;
        ysin = 0;
    }
    
    var textwidth = 320;
    
    if (!surface_exists(surf0))
        surf0 = surface_create(textwidth, height);
    
    if (!surface_exists(surf1))
        surf1 = surface_create(width, height);
    
    if (musickind)
    {
        if (!surface_exists(surf2))
            surf2 = surface_create(width * 2, height * 2);
    }
    
    var debugoffsetx = -24;
    var debugoffsety = -20;
    
    if (icon_sprite == -4)
    {
        if (musickind == 3)
            icon_sprite = 4529;
        
        if (prophecy_icon.custom_sprite != -4)
            icon_sprite = prophecy_icon.custom_sprite;
        
        if (extflag == "angel")
            icon_sprite = 1022;
    }
    else
    {
        surface_set_target(surf0);
        draw_set_blend_mode(bm_normal);
        draw_sprite_tiled_ext(tilespr, 0, ceil(siner / 2), ceil(siner / 2), 1, 1, propblue, 1);
        draw_set_blend_mode(bm_subtract);
        draw_sprite_ext(icon_sprite, 0, width / 2, 28, 1, 1, 0, c_black, 1);
        
        if (extflag == "angel")
            draw_sprite_ext(spr_pxwhite, 0, 0, 0, 640, 480, 0, c_black, 1);
        
        if (musickind == 3)
        {
            var yoffset = 8;
            draw_set_blend_mode(bm_normal);
            draw_sprite_tiled_ext(tilespr, 0, ceil(siner / 2), ceil(siner / 2), 1, 1, propblue, 1);
            draw_set_blend_mode(bm_subtract);
            draw_sprite_ext(spr_dw_church_prophecy_cacophony_pt1, 0, 0, yoffset + 0, 1, 1, 0, c_black, 1);
            draw_sprite_ext(spr_dw_church_prophecy_cacophony_pt2, 0, 46, yoffset + 0, 2, 1, 0, c_black, 1);
            
            for (var i = 1; i < 10; i++)
                draw_sprite_ext(spr_dw_church_prophecy_cacophony_pt2, 0, 46 + (20 * i), yoffset + 0, 2, 1, 0, c_black, 1);
            
            draw_sprite_ext(spr_pxwhite, 0, 0, 0, 600, yoffset, 0, c_black, 1);
        }
        
        draw_set_blend_mode(bm_normal);
        surface_reset_target();
    }
    
    var ogbg = 16775331;
    var linecol = merge_color(#8BE9EF, #17EDFF, 0.5 + (sin(siner / 120) * 0.5));
    var gradalpha = 1;
    
    if (church == 3)
        ogbg = 255;
    
    if (church == 3)
        gradalpha = 0.25;
    
    if (church == 3)
        linecol = 255;
    
    surface_set_target(surf1);
    draw_sprite_ext(spr_pxwhite, 0, 0, 0, width + 1, height + 1, 0, ogbg, gradalpha);
    draw_sprite_tiled_ext(tiletex, 0, ceil(-siner / 2), ceil(-siner / 2), 1, 1, linecol, gradalpha);
    var gradcol = 0;
    
    if (church == 2)
        gradcol = 16765515;
    
    if (!noback)
    {
        draw_sprite_ext(spr_gradient20, 0, 0, 0, width / 20, -3, 0, gradcol, gradalpha);
        draw_sprite_ext(spr_gradient20, 0, 0, height, width / 20, 3, 0, gradcol, gradalpha);
        draw_sprite_ext(spr_gradient20, 0, 0, 0, height / 20, 3, -90, gradcol, gradalpha);
        draw_sprite_ext(spr_gradient20, 0, width, height, height / 20, 3, 90, gradcol, gradalpha);
    }
    
    draw_set_blend_mode(bm_subtract);
    
    if (fade_edges)
    {
        draw_sprite_ext(spr_gradient20, 0, 0, 0, width / 20, -3, 0, gradcol, gradalpha);
        draw_sprite_ext(spr_gradient20, 0, 0, height, width / 20, 3, 0, gradcol, gradalpha);
        draw_sprite_ext(spr_gradient20, 0, 0, 0, height / 20, 3, -90, gradcol, gradalpha);
        draw_sprite_ext(spr_gradient20, 0, width, height, height / 20, 3, 90, gradcol, gradalpha);
    }
    
    draw_set_blend_mode(bm_normal);
    draw_set_blend_mode(bm_add);
    draw_surface(surf0, 0, 0);
    draw_surface(surf0, 0, 0);
    draw_surface(surf0, 0, 0);
    draw_set_blend_mode(bm_normal);
    surface_reset_target();
    
    if (drawback)
    {
        var col = 0;
        
        if (church == 2)
            col = 16723733;
        
        draw_sprite_ext(spr_pxwhite, 0, (x - width) + xsin, (y - height) + ysin, width * 2, height * 2, 0, col, 1);
    }
    
    if (!notext)
    {
        if (text_sprite == -4)
        {
            if (prophecy_text.custom_sprite != -4)
                text_sprite = prophecy_text.custom_sprite;
        }
        else
        {
            surface_set_target(surf0);
            draw_set_blend_mode(bm_normal);
            draw_clear_alpha(c_aqua, 1);
            draw_sprite_tiled_ext(tiletex, 0, ceil(siner / 2), ceil(siner / 2), 1, 1, c_white, 0.6);
            draw_set_blend_mode(bm_subtract);
            var xoff = 0;
            var yoff = 0;
            
            if (musickind == 3)
            {
                yoff = -6;
                xoff = -30;
            }
            
            draw_sprite_ext(text_sprite, 1, 0 + xoff, -10 + yoff, 1, 1, 0, c_black, 1);
            draw_set_blend_mode(bm_normal);
            surface_reset_target();
        }
    }
    
    if (musickind)
    {
        surface_set_target(surf2);
        draw_set_blend_mode(bm_normal);
        draw_clear_alpha(#53DDFF, 1);
        draw_sprite_tiled_ext(tiletex, 0, ceil(siner / 2), ceil(siner / 2), 1, 1, c_white, 0.6);
        draw_set_blend_mode(bm_subtract);
        draw_sprite_ext(spr_pxwhite, 0, 0, 0, width * 2, height * 2, 0, c_black, 1);
        var nxpos = 140;
        var nypos = 34;
        var count = 0;
        var space = 28;
        var yspace = 32;
        draw_set_blend_mode(bm_add);
        
        if (musickind == 1)
        {
            count = 0;
            draw_sprite_ext(spr_arrow_9x9, 1, nxpos + (count * space), nypos + (yspace * 2) + (sin((siner + (count * 24)) / 10) * 2), 2, 2, 270, c_black, 1);
            count++;
            draw_sprite_ext(spr_arrow_9x9, 1, nxpos + (count * space), nypos + (yspace * 1) + (sin((siner + (count * 24)) / 10) * 2), 2, 2, 0, c_black, 1);
            count++;
            draw_sprite_ext(spr_arrow_9x9, 1, nxpos + (count * space), nypos + (yspace * 2) + (sin((siner + (count * 24)) / 10) * 2), 2, 2, 270, c_black, 1);
            count++;
            draw_sprite_ext(spr_arrow_9x9, 1, nxpos + (count * space), nypos + (yspace * 3) + (sin((siner + (count * 24)) / 10) * 2), 2, 2, 90, c_black, 1);
            count++;
        }
        
        if (musickind == 2)
        {
            nxpos -= 10;
            nypos += 10;
            count = 0;
            draw_sprite_ext(spr_arrow_9x9, 1, nxpos + (count * space), nypos + (yspace * 1) + (sin((siner + (count * 24)) / 10) * 2), 2, 2, 0, c_black, 1);
            count++;
            draw_sprite_ext(spr_arrow_9x9, 1, nxpos + (count * space), nypos + (yspace * 1) + (sin((siner + (count * 24)) / 10) * 2), 2, 2, 0, c_black, 1);
            count++;
            draw_sprite_ext(spr_arrow_9x9, 1, nxpos + (count * space), nypos + (yspace * 3) + (sin((siner + (count * 24)) / 10) * 2), 2, 2, 90, c_black, 1);
            count++;
            draw_sprite_ext(spr_arrow_9x9, 1, nxpos + (count * space), nypos + (yspace * 3) + (sin((siner + (count * 24)) / 10) * 2), 2, 2, 90, c_black, 1);
            count++;
        }
        
        if (musickind == 3)
        {
            nxpos -= 30;
            nypos += 132;
            space = 36;
            count = 0;
            var sol = [];
            sol = [0, 13, 0, 9, 4, 6, 2, 0, 0, 13, 0, 8, 2];
            
            for (var i = 0; i < array_length(sol); i++)
            {
                var thisyoff = -85.33333333333333 * (pitcharray[sol[i]] - 0.5);
                var txpos = nxpos + (count * space);
                var typos = nypos + (sin((siner + (count * 24)) / 10) * 2) + thisyoff;
                draw_sprite_ext(spr_dw_church_musicproparrows, indarray[sol[i]], txpos, typos, 2, 2, dirarray[sol[i]] * 90, c_black, 1);
                count++;
            }
        }
        
        draw_set_blend_mode(bm_normal);
        surface_reset_target();
    }
    
    if (!textonly)
    {
        for (var i = 1; i < 3; i++)
        {
            if (!musickind)
                draw_surface_ext(surf1, (x - width) + (ysin * (2 * i)), (y - height) + (ysin * (2 * i)), 2, 2, angle, c_white, image_alpha / 4);
            else
                draw_surface_ext(surf2, (x - width) + (ysin * (2 * i)), (y - height) + (ysin * (2 * i)), 1, 1, angle, c_white, image_alpha / 4);
        }
    }
    
    if (!textonly)
        draw_surface_ext(surf1, (x - width) + xsin, (y - height) + ysin, 2, 2, angle, c_white, image_alpha);
    
    if (musickind)
    {
        draw_set_blend_mode(bm_add);
        draw_surface_ext(surf2, (x - width) + xsin + 2, (y - height) + ysin + 2, 1, 1, angle, #203DFF, image_alpha * 0.5);
        draw_surface_ext(surf2, (x - width) + xsin, (y - height) + ysin, 1, 1, angle, c_white, image_alpha);
        draw_surface_ext(surf2, (x - width) + xsin, (y - height) + ysin, 1, 1, angle, c_white, image_alpha);
        draw_set_blend_mode(bm_normal);
    }
    
    if (text_sprite != -4)
    {
        var textxoffset = -160;
        var textyoffset = -16;
        
        if (extflag == "heroes1")
            textyoffset = -70;
        
        if (extflag == "rightpiece")
            textyoffset += 10;
        
        if (musickind == 3)
        {
            textxoffset = 2;
            textyoffset = 2;
        }
        
        if (instance_exists(obj_dw_churchb_bellroom))
        {
            if (angle == 180)
            {
                textxoffset = 160;
                textyoffset = 20;
            }
            
            if (angle == 90)
            {
                textxoffset = -16;
                textyoffset = 160;
            }
        }
        
        if (instance_exists(obj_dw_churchb_libraryconnector))
        {
            if (extflag == "heroes4")
            {
                textxoffset = -166;
                textyoffset = -60;
            }
            
            if (extflag == "rudebuster")
                textyoffset = -44;
        }
        
        if (extflag == "gallery")
        {
            textxoffset -= 6;
            textyoffset = -48;
        }
        
        if (extflag == "angel")
        {
            //
            textyoffset = -40;
            //
        }
        
        if (extflag == "heavenandhell1")
            textyoffset = -44;
        
        if (extflag == "heavenandhell2")
            textyoffset = -32;
        
        if (extflag == "boss3")
            textyoffset = -38;
        
        if (extflag == "boss1")
            textyoffset = 48;
        
        if (instance_exists(obj_dw_churchb_library))
        {
            if (extflag == "heroes3")
                textyoffset = -38;
            
            if (extflag == "boss2")
                textyoffset = -38;
        }
        
        if (instance_exists(obj_dw_churchb_rotatingtower))
        {
            if (extflag == "heroes2")
                textyoffset = -28;
        }
        
        if (!variable_instance_exists(id, "proptextlinecount"))
        {
            proptextlinecount = 0;
            var mytext = array_get(scr_prophecytext(extflag), 0);
            
            for (var i = 1; i <= string_length(mytext); i++)
            {
                if (string_char_at(mytext, i) == "#" || string_char_at(mytext, i) == "\n")
                    proptextlinecount++;
            }
        }
        
        if (global.lang == "ja")
            textyoffset -= (16 * proptextlinecount);
        
        if (global.lang == "en")
        {
            if (extflag == "heroes1")
                textyoffset += 8;
        }
        
        if (global.lang == "ja")
        {
            if (extflag == "heroes1")
                textyoffset += 24;
            
            if (extflag == "heroes4")
                textyoffset += 16;
            
            if (extflag == "rudebuster")
                textyoffset += 8;
            
            if (extflag == "heroes2")
                textyoffset += 8;
            
            if (extflag == "laststory")
                textyoffset += 20;
            
            if (extflag == "savetheworlds")
                textyoffset += 22;
            
            if (room == room_dw_churchc_titanclimb2_post)
                textyoffset += 12;
            
            if (room == room_dw_churchc_final_prophecy)
            {
                if (extflag == "end5")
                    textyoffset += 16;
            }
        }
        
        draw_set_blend_mode(bm_add);
        draw_surface_ext(surf0, (x - width) + xsin + textxoffset, (y - height) + ysin + textyoffset, 2, 2, angle, c_white, image_alpha);
        draw_surface_ext(surf0, (x - width) + xsin + textxoffset, (y - height) + ysin + textyoffset, 2, 2, angle, c_white, image_alpha);
        draw_set_blend_mode(bm_normal);
    }
}

actuallyactive = onscreen;
