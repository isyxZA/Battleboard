/// @description Draw selection box and Stats
if global.game_state == "IN_GAME" {
    if global.game_turn != 0 {
        if global.can_select == true {
            if (pX != -1 && pY != -1) {
                draw_set_alpha(.5);
                draw_roundrect_colour(pX, pY, mouse_x, mouse_y, c_white, c_white, true);
                draw_set_alpha(.1);
                draw_roundrect_colour(pX, pY, mouse_x, mouse_y, c_green, c_green, false);
                draw_set_alpha(1);
            }
        }
    }
    draw_set_alpha(1);
    //If not holding TAB
    if show_allstats == false {
        //When units are selected
        if !ds_list_empty(global.selected_list) {
            //If not selecting a waypoint or a target then display stats
            if global.nav_select != true && global.fire_display != true && global.highlight_move != true {
                var i;
                for (i=0; i<ds_list_size(global.selected_list); i+=1) {
                    var unit = ds_list_find_value(global.selected_list, i);
                    with unit {
                        //Draw unit stats
                        scr_DrawUnitStats();
                    }
                }
            }
        }
        //If a ship is selected
        if global.selected_LC == true {  scr_DrawShipStats(); }
        //Draw single unit stat box when in contact with the mouse
        if show_stats == true {
            with instance_nearest(x, y, obj_Unit_Parent) {
                if (selected != true) {
                    //Draw unit stats
                    scr_DrawUnitStats();
                }
            }
        }
    }
        else if show_allstats == true {
            if !ds_list_empty(global.myunit_list) {
                    var i;
                    for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
                    var unit = ds_list_find_value(global.myunit_list, i);
                    with unit {
                        //Draw unit stats
                        scr_DrawUnitStats();
                    }
                }
            }
            //Draw landing craft stats
            scr_DrawShipStats_2();
        }
}

draw_set_font(fnt_12);
draw_set_colour(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(1);



