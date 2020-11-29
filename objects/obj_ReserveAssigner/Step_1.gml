if clear == true {
    clear = false;
    active = false;
    place_unit = "";
    open_slots = 4;
    temp_sprite = -1;
	temp_cost  = 0;
    slot1_full = false;
    slot2_full = false;
    slot3_full = false;
    slot4_full = false;
    slot1_sprite = -1;
    slot2_sprite = -1;
    slot3_sprite = -1;
    slot4_sprite = -1;  
    if squad_list != -1 { 
        if !ds_list_empty(squad_list) { ds_list_clear(squad_list); } 
    }
}

if mouse_check_button_released(mb_left) {
    if active == true { 
        active = false; 
        //Add unit to squad
        if place_unit != "" {
            if slot1_full == false { slot1_full = true; slot1_sprite = temp_sprite; open_slots -= 1; ds_list_insert(squad_list, 0, place_unit); obj_UnitFormations.formation_points -= temp_cost; }
                else if slot2_full == false { slot2_full = true; slot2_sprite = temp_sprite; open_slots -= 1; ds_list_insert(squad_list, 1, place_unit); obj_UnitFormations.formation_points -= temp_cost; }
                    else if slot3_full == false { slot3_full = true; slot3_sprite = temp_sprite; open_slots -= 1; ds_list_insert(squad_list, 2, place_unit); obj_UnitFormations.formation_points -= temp_cost; } 
                        else if slot4_full == false { slot4_full = true; slot4_sprite = temp_sprite; open_slots -= 1; ds_list_insert(squad_list, 3, place_unit); obj_UnitFormations.formation_points -= temp_cost; } 
            place_unit  = "";
            temp_sprite = -1;
			temp_cost   = 0;
			temp_class  = "";
        }
    }
    if can_activate == true { can_activate = false; }
}
