//Determine when units can or cannot be selected
if global.menu_create == true || global.nav_menu == true || global.nav_select == true 
    || global.fire_display == true || global.repair_display || global.selected_LC == true  
        || global.waiting == true || global.opponent_turn == true || global.spawning_unit == true || obj_CONTROL.command_targeting == false {
        if global.can_select == true {
            global.can_select = false;
            with obj_Unit_Parent {
                pX = -1;
                pY = -1;
            }
        }
}
    else {
        if select_enable == true { global.can_select = true; }
    }
    
if global.can_select == true || global.opponent_turn == true 
    || global.victory == true || global.defeat == true { global.show_stats = true; }
    else { global.show_stats = false; }



