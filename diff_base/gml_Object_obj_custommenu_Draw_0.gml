xx = __view_get(e__VW.XView, 0);
yy = __view_get(e__VW.YView, 0);

for (m = 0; m < menuMax; m++)
{
    drawmenu = 1;
    
    if (menuDisplayCondition[m] == 1 && menu != m)
        drawmenu = 0;
    
    if (menuDisplayCondition[m] == 2 && menu < m)
        drawmenu = 0;
    
    if (drawmenu)
    {
        wrap = 0;
        vwrap = 0;
        minj = menuMinimumID[m] + menuScrollCurrent[m];
        maxj = menuMinimumID[m] + menuScrollCurrent[m] + menuPageSize[m];
        
        if (maxj >= (menuMaximumID[m] + 1))
            maxj = menuMaximumID[m] + 1;
        
        if (menuBoxDraw[m] == 1)
        {
            draw_set_color(c_white);
            ossafe_fill_rectangle(xx + menuBoxDrawX1[m], yy + menuBoxDrawY1[m], xx + menuBoxDrawX2[m], yy + menuBoxDrawY2[m], false);
            draw_set_color(c_black);
            ossafe_fill_rectangle(xx + menuBoxDrawX1[m] + 4, yy + menuBoxDrawY1[m] + 4, (xx + menuBoxDrawX2[m]) - 4, (yy + menuBoxDrawY2[m]) - 4, false);
            trimove = round((sin(siner / 6) * 2) / 2) * 2;
            
            if (menuVEdgeBehavior[m] == 2 && menu == m)
            {
                if (maxj < (menuMaximumID[m] + 1))
                    draw_sprite_ext(spr_custommenu_arrow, 0, xx + ((menuBoxDrawX1[m] + menuBoxDrawX2[m]) / 2), yy + menuBoxDrawY2[m] + trimove, 2, 2, 0, c_white, 1);
                
                if (minj > menuMinimumID[m])
                    draw_sprite_ext(spr_custommenu_arrow, 0, xx + ((menuBoxDrawX1[m] + menuBoxDrawX2[m]) / 2), (yy + menuBoxDrawY1[m]) - trimove, 2, -2, 0, c_white, 1);
            }
            
            if (menuHEdgeBehavior[m] == 2 && menu == m)
            {
                draw_sprite_ext(spr_custommenu_arrow, 0, xx + menuBoxDrawX1[m] + trimove, yy + ((menuBoxDrawY1[m] + menuBoxDrawY2[m]) / 2), 2, 2, 270, c_white, 1);
                draw_sprite_ext(spr_custommenu_arrow, 0, (xx + menuBoxDrawX2[m]) - trimove, yy + ((menuBoxDrawY1[m] + menuBoxDrawY2[m]) / 2), 2, -2, 270, c_white, 1);
            }
        }
        
        draw_set_font(menuTextFont[m]);
        
        for (j = 0; j < menuHeaderTextAmount[m]; j++)
        {
            draw_set_color(menuHeaderColor[m][j]);
            textxscale = 1;
            textyscale = 1;
            
            // if (menuHeaderWidth[m][j] > 0)
            //     textxscale = menuHeaderWidth[m][j];
            
            // if (menuHeaderWidth[m][j] >= 5)
            //     textxscale = clamp(menuHeaderWidth[m] / string_width(string_hash_to_newline(menuHeaderText[m][j])), 0.5, 1);
            
            // if (menuHeaderHeight[m][j] > 0)
            //     textyscale = menuHeaderHeight[m][j];
            
            draw_text_transformed(xx + menuHeaderX[m][j], yy + menuHeaderY[m][j], string_hash_to_newline(menuHeaderText[m][j]), textxscale, textyscale, 0);
        }
        
        if (m == menu)
        {
            if (optionTopComment[m][menuCoord[m]] != " ")
            {
                scr_84_set_draw_font("mainbig");
                draw_set_color(c_black);
                ossafe_fill_rectangle(xx - 10, yy - 10, xx + 700, yy + 120, false);
                draw_set_color(c_white);
                
                if (display_buttons)
                {
                    draw_sprite_ext(scr_getbuttonsprite(global.input_g[4], false), 0, xx + 20, yy + 22, 2, 2, 0, c_white, 1);
                    var button_x_offset = (global.lang == "en") ? 0 : -40;
                    draw_sprite_ext(scr_getbuttonsprite(global.input_g[5], false), 0, xx + 190 + button_x_offset, yy + 22, 2, 2, 0, c_white, 1);
                    var x_offset = (global.lang == "en") ? 0 : -36;
                    draw_text(xx + 18 + x_offset, yy + 20, string_hash_to_newline(optionTopComment[m][menuCoord[m]]));
                }
                else
                {
                    draw_text(xx + 20, yy + 20, string_hash_to_newline(optionTopComment[m][menuCoord[m]]));
                }
            }
        }
        
        draw_set_font(menuTextFont[m]);
        
        for (j = minj; j < maxj; j++)
        {
            if (m == menu)
            {
                if (optionSelectable[m][j] == 0)
                    draw_set_color(menuTextColorUnselectable[m]);
                else if (menuCoord[m] == j)
                    draw_set_color(menuTextColorHover[m]);
                else
                    draw_set_color(menuTextColor[m]);
            }
            else if (optionSelected[m][j] == 1)
            {
                draw_set_color(menuTextColorSelected[m]);
            }
            else
            {
                draw_set_color(menuTextColorInactive[m]);
            }
            
            if (menuSpacingOverride[m] == 0)
            {
                optionX[m][j] = menuX[m] + (wrap * menuSpacingX[m]);
                optionY[m][j] = menuY[m] + (vwrap * menuSpacingY[m]);
            }
            
            textx = optionX[m][j] + menuTextOffsetX[m];
            texty = optionY[m][j] + menuTextOffsetY[m];
            textxscale = 1;
            textyscale = 1;
            
            // if (menuTextXScale[m] > 0)
            //     textxscale = menuTextXScale[m];
            
            // if (menuTextXScale[m] >= 5)
            //     textxscale = clamp(menuTextXScale[m] / string_width(string_hash_to_newline(optionText[m][j])), 0.5, 1);
            
            // if (menuTextYScale[m] > 0)
            //     textyscale = menuTextYScale[m];
            
            draw_text_transformed(textx, texty, string_hash_to_newline(optionText[m][j]), textxscale, textyscale, 0);
            wrap++;
            
            if (wrap >= menuWidth[m])
            {
                wrap = 0;
                vwrap++;
            }
            
            if (optionCommentA[m][j] != " ")
            {
                draw_set_color(optionCommentAColor[m][j]);
                textxscale = 1;
                textyscale = 1;
                
                // if (optionCommentAWidth[m][j] > 0)
                //     textxscale = optionCommentAWidth[m][j];
                
                // if (optionCommentAWidth[m][j] >= 5)
                //     textxscale = clamp(optionCommentAWidth[m][j] / string_width(string(optionText[m][j])), 0.5, 1);
                
                // if (optionCommentAHeight[m][j] > 0)
                //     textyscale = optionCommentAHeight[m][j];
                
                draw_text_transformed(textx + optionCommentAXOffset[m][j], texty + optionCommentAYOffset[m][j], string(optionCommentA[m][j]), textxscale, textyscale, 0);
            }
            
            if (optionCommentB[m][j] != " ")
            {
                draw_set_color(optionCommentBColor[m][j]);
                textxscale = 1;
                textyscale = 1;
                
                // if (optionCommentBWidth[m][j] > 0)
                //     textxscale = optionCommentBWidth[m][j];
                
                // if (optionCommentBWidth[m][j] >= 5)
                //     textxscale = clamp(optionCommentBWidth[m][j] / string_width(string(optionText[m][j])), 0.5, 1);
                
                // if (optionCommentBHeight[m][j] > 0)
                //     textyscale = optionCommentBHeight[m][j];
                
                draw_text_transformed(textx + optionCommentBXOffset[m][j], texty + optionCommentBYOffset[m][j], string(optionCommentB[m][j]), textxscale, textyscale, 0);
            }
            
            if (optionCommentC[m][j] != " ")
            {
                draw_set_color(optionCommentCColor[m][j]);
                textxscale = 1;
                textyscale = 1;
                
                // if (optionCommentCWidth[m][j] > 0)
                //     textxscale = optionCommentCWidth[m][j];
                
                // if (optionCommentCWidth[m][j] >= 5)
                //     textxscale = clamp(optionCommentCWidth[m][j] / string_width(string(optionText[m][j])), 0.5, 1);
                
                // if (optionCommentCHeight[m][j] > 0)
                //     textyscale = optionCommentCHeight[m][j];
                
                draw_text_transformed(textx + optionCommentCXOffset[m][j], texty + optionCommentCYOffset[m][j], string(optionCommentC[m][j]), textxscale, textyscale, 0);
            }
        }
    }
}

idealHeartX = optionX[menu][menuCoord[menu]];
heartX = lerp(heartX, idealHeartX, 0.5);

if (abs(heartX - idealHeartX) < 2)
    heartX = idealHeartX;

idealHeartY = optionY[menu][menuCoord[menu]];
heartY = lerp(heartY, idealHeartY, 0.5);

if (abs(heartY - idealHeartY) < 2)
    heartY = idealHeartY;

draw_sprite(menuSprite, 0, heartX, heartY + 8);

if (menuCoord[menu] >= ((menuWidth[menu] * (menuHeight[menu] - 1)) + menuScrollCurrent[menu]))
    draw_set_color(c_lime);

if (menuCoord[menu] < (menuWidth[menu] + menuScrollCurrent[menu]))
    draw_set_color(c_fuchsia);

if ((menuCoord[menu] % menuWidth[menu]) == (menuWidth[menu] - 1))
    draw_set_color(c_orange);

siner++;

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
