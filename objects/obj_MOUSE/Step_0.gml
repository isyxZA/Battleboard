if global.game_state == "IN_GAME" {
    if global.double_click == true {
        if timer_start == true {
            timer_start = false;
            alarm[0] = 30;
        }
    }
    
	if global.nav_select == true {
	    if (x == xprevious) && (y == yprevious) { 
			mouse_timer += 1; 
			if mouse_timer > 30 { 
				var t_ap = 0;//Total action points available
				//Calculate total available ap of selected units
				if !ds_list_empty(global.selected_list) {
			        var i;
			        for(i=0; i<ds_list_size(global.selected_list); i+=1) {
			            var u = ds_list_find_value(global.selected_list, i);
						t_ap += u.action_points;
					}
				}
		        var mpm = t_ap-global.temp_AP;
		        if mpm >= 0 { global.mouse_holdpos = true; } 
		    } 
		        else { global.mouse_holdpos = false; }
		}
	        else { 
				mouse_timer = 0; 
				global.mouse_holdpos = false;
			}
	}
		else { global.mouse_holdpos = false; }
    
    if (global.selected_LC == true) && (global.supply_ship == noone) { global.show_cursor = false; }
        else { global.show_cursor = true; }
}
	else { global.show_cursor = true; }

