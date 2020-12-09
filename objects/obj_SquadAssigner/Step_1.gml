if clear == true {
    clear = false;
    auto_assign = false;
    active = false;
    place_unit = "";
    open_slots = 6;
    temp_sprite = -1;
	temp_cost = 0;
	lpos = -1;
    slot1_full = false;
    slot2_full = false;
    slot3_full = false;
    slot4_full = false;
    slot5_full = false;
    slot6_full = false;
    slot1_sprite = spr_Dropdown_Empty;
	slot2_sprite = spr_Dropdown_Empty;
	slot3_sprite = spr_Dropdown_Empty;
	slot4_sprite = spr_Dropdown_Empty;
	slot5_sprite = spr_Dropdown_Empty;
	slot6_sprite = spr_Dropdown_Empty;
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
                            else if slot5_full == false { slot5_full = true; slot5_sprite = temp_sprite; open_slots -= 1; ds_list_insert(squad_list, 4, place_unit); obj_UnitFormations.formation_points -= temp_cost; } 
                                else if slot6_full == false { slot6_full = true; slot6_sprite = temp_sprite; open_slots -= 1; ds_list_insert(squad_list, 5, place_unit); obj_UnitFormations.formation_points -= temp_cost; } 
            place_unit = "";
            temp_sprite = -1;
			temp_cost = 0;
            //with obj_UnitSelector { if dragging == true { unit_amount -= 1; } }
        }
    }
    if can_activate == true { can_activate = false; }
}

/*
if auto_assign == false {
    if mouse_check_button_released(mb_left) {
        if active == true { 
            active = false; 
            //Add unit to squad
            if place_unit != "" {
                if slot1_full == false { slot1_full = true; slot1_sprite = temp_sprite; open_slots -= 1; ds_list_add(squad_list, place_unit); }
                    else if slot2_full == false { slot2_full = true; slot2_sprite = temp_sprite; open_slots -= 1; ds_list_add(squad_list, place_unit); }
                        else if slot3_full == false { slot3_full = true; slot3_sprite = temp_sprite; open_slots -= 1; ds_list_add(squad_list, place_unit); } 
                            else if slot4_full == false { slot4_full = true; slot4_sprite = temp_sprite; open_slots -= 1; ds_list_add(squad_list, place_unit); } 
                                else if slot5_full == false { slot5_full = true; slot5_sprite = temp_sprite; open_slots -= 1; ds_list_add(squad_list, place_unit); } 
                                    else if slot6_full == false { slot6_full = true; slot6_sprite = temp_sprite; open_slots -= 1; ds_list_add(squad_list, place_unit); } 
                place_unit = "";
                temp_sprite = -1;
                with obj_UnitSelector { if dragging == true { unit_amount -= 1; } }
            }
        }
        if can_activate == true { can_activate = false; }
    }
}
    else if auto_assign == true {
        if can_activate == true { can_activate = false; place_unit = ""; temp_sprite = -1; }
        if open_slots >= 1 { 
            active = true;
            //Add unit to squad
            if place_unit != "" {
                if slot1_full == false { slot1_full = true; slot1_sprite = temp_sprite; open_slots -= 1; ds_list_add(squad_list, place_unit); }
                    else if slot2_full == false { slot2_full = true; slot2_sprite = temp_sprite; open_slots -= 1; ds_list_add(squad_list, place_unit); }
                        else if slot3_full == false { slot3_full = true; slot3_sprite = temp_sprite; open_slots -= 1; ds_list_add(squad_list, place_unit); } 
                            else if slot4_full == false { slot4_full = true; slot4_sprite = temp_sprite; open_slots -= 1; ds_list_add(squad_list, place_unit); } 
                                else if slot5_full == false { slot5_full = true; slot5_sprite = temp_sprite; open_slots -= 1; ds_list_add(squad_list, place_unit); } 
                                    else if slot6_full == false { slot6_full = true; slot6_sprite = temp_sprite; open_slots -= 1; ds_list_add(squad_list, place_unit); } 
                place_unit = "";
                temp_sprite = -1;
                if selector != -1 { selector.unit_amount -= 1; selector = -1; }
            } 
        }
            else { active = false; }
    }
*/
