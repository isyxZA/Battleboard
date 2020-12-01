if can_drag == true {
    if mouse_check_button(mb_left) {
        dragging = true;
        with obj_SquadAssigner {
            if active == true {
                place_unit  = other.my_unit;
                temp_sprite = other.icon_sprite;
				temp_cost   = other.unit_cost;
            }
        }
		with obj_ReserveAssigner {
            if active == true {
                place_unit  = other.my_unit;
                temp_sprite = other.icon_sprite;
				temp_cost   = other.unit_cost;
				temp_class  = other.unit_class;
            }
        }
    }
        else { dragging = false; }
}
    else { dragging = false;  }
	
if (obj_UnitFormations.formation_points-unit_cost < 0) { my_indicator = spr_Indicator_Red; }
    else { my_indicator = spr_Indicator_Green; }




