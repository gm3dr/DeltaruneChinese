// var _cx = camerax();
// var _cy = cameray();
// var draw1 = false;
// var draw2 = false;
// var draw3 = false;

// if (ncon && instance_exists(obj_dialoguer))
// {
//     if (i_ex(obj_writer))
//     {
//         ncon = 2;
        
//         with (obj_writer)
//         {
//             if (global.lang == "en")
//             {
//                 if (pos > 6)
//                     draw1 = /*true*/false;
                
//                 if (pos > 16)
//                     draw2 = /*true*/false;
//             }
            
//             if (global.lang == "ja")
//             {
//                 if (pos > 2)
//                     draw1 = true;
                
//                 if (pos > 7)
//                     draw2 = true;
                
//                 if (pos > 14)
//                     draw3 = true;
//             }
//         }
//     }
//     else if (ncon == 2)
//     {
//         draw1 = /*true*/false;
//         draw2 = /*true*/false;
        
//         if (global.lang == "ja")
//             draw3 = true;
//     }
    
//     var spr = 1488;
    
//     if (global.lang == "ja")
//         spr = 1421;
    
//     var vpos = [138, 298, 342];
    
//     if (global.lang == "ja")
//         vpos = [99, 194, 342, 383];
    
//     if (draw1)
//         draw_sprite(spr, 0, _cx + vpos[0], _cy + vpos[2]);
    
//     if (draw2)
//         draw_sprite(spr, 0, _cx + vpos[1], _cy + vpos[2]);
    
//     if (draw3)
//         draw_sprite(spr, 0, _cx + vpos[3], _cy + vpos[2]);
// }
