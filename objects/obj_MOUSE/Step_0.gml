if global.game_state == "IN_GAME" {
    if global.double_click == true {
        if timer_start == true {
            timer_start = false;
            alarm[0] = 30;
        }
    }
    
    if (x == xprevious) && (y == yprevious) { mouse_timer += 1; }
        else { mouse_timer = 0; }
    
    if mouse_timer > 20 { 
        var mpm = global.turn_AP-global.temp_AP;
        if mpm >= 0 { global.mouse_holdpos = true; } 
    } 
        else { global.mouse_holdpos = false; }
    
    if (global.selected_LC == true) && (global.supply_ship == noone) { global.show_cursor = false; }
        else { global.show_cursor = true; }
}
	else { global.show_cursor = true; }

