x = mouse_x;
y = mouse_y;

if global.game_state == "IN_GAME" {
	if mouse_check_button_pressed(mb_left) {
		pX = mouse_x;
		pY = mouse_y;
	}
    if keyboard_check_direct(vk_tab) { show_allstats = true;} 
        else { show_allstats = false; }
    if show_allstats == false {
        if place_meeting(x,y, obj_Unit_Parent) { 
            if stat_timer < 25 { stat_timer += 1; }
                else if stat_timer >= 25 { if global.show_stats == true { show_stats = true; } } 
        }
            else { 
                stat_timer = 0;
                show_stats = false; 
            }
    }
        else { 
            stat_timer = 0;
            show_stats = false;
        }
}

