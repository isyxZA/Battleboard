if unit_change == true {
	unit_change = false;
	if count > 1 { count = 0; }
	if count < 0 { count = 1; }
	switch count {
		case 0:
			switch unit_class {
				case "INF":
					my_unit     = "INF_A";
					my_sprite   = spr_INFA_Icon;
					icon_sprite = spr_INFA_Dropdown;
					unit_cost   = INF_1;
					break;
				case "MBT":
					my_unit     = "MBT_A";
					my_sprite   = spr_MBTA_Icon;
					icon_sprite = spr_MBTA_Dropdown;
					unit_cost   = MBT_1;
					break;
				case "LAC":
					my_unit     = "LAC_A";
					my_sprite   = spr_LACA_Icon;
					icon_sprite = spr_LACA_Dropdown;
					unit_cost   = LAC_1;
					break;
				case "LAV":
					my_unit     = "LAV_A";
					my_sprite   = spr_LAVA_Icon;
					icon_sprite = spr_LAVA_Dropdown;
					unit_cost   = LAV_1;
					break;
				case "LOG":
					my_unit     = "LOGI_A";
					my_sprite   = spr_LOGIA_Icon;
					icon_sprite = spr_LOGIA_Dropdown;
					unit_cost   = LOG_1;
					break;
			}
			break;
		case 1:
			switch unit_class {
				case "INF":
					my_unit     = "INF_B";
					my_sprite   = spr_INFB_Icon;
					icon_sprite = spr_INFB_Dropdown;
					unit_cost   = INF_2;
					break;
				case "MBT":
					my_unit     = "MBT_B";
					my_sprite   = spr_MBTB_Icon;
					icon_sprite = spr_MBTB_Dropdown;
					unit_cost   = MBT_2;
					break;
				case "LAC":
					my_unit     = "LAC_B";
					my_sprite   = spr_LACB_Icon;
					icon_sprite = spr_LACB_Dropdown;
					unit_cost   = LAC_2;
					break;
				case "LAV":
					my_unit     = "LAV_B";
					my_sprite   = spr_LAVB_Icon;
					icon_sprite = spr_LAVB_Dropdown;
					unit_cost   = LAV_2;
					break;
				case "LOG":
					my_unit     = "LOGI_B";
					my_sprite   = spr_LOGIB_Icon;
					icon_sprite = spr_LOGIB_Dropdown;
					unit_cost   = LOG_2;
					break;
			}
			break;
	}
}

if place_meeting(x, y, obj_MOUSE) {
    if mouse_check_button_pressed(mb_left) {
		if (obj_UnitFormations.formation_points-unit_cost >= 0) {
            can_drag = true; 
            with obj_SquadAssigner   { can_activate = true; }
			with obj_ReserveAssigner { can_activate = true; temp_class = other.unit_class; }
        }
    }
}




