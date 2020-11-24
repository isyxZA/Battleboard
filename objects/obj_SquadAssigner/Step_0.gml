if can_activate == true {
    if mouse_check_button(mb_left) {
        if place_meeting(x, y, obj_MOUSE) {
            if open_slots >= 1 { active = true; }
                else { 
                    active = false; 
                    place_unit = "";
                    temp_sprite = -1;
					temp_cost = 0;
                }
        }
            else { 
                active = false; 
                place_unit = "";
                temp_sprite = -1;
				temp_cost = 0;
            }
    }
        else { 
            active = false; 
            place_unit = "";
            temp_sprite = -1;
			temp_cost = 0;
        }
}



