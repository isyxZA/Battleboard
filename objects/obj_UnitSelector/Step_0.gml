if can_drag == true {
    if mouse_check_button(mb_left) {
        dragging = true;
        with obj_SquadAssigner {
            if active == true {
                place_unit = other.my_unit;
                temp_sprite = other.icon_sprite;
            }
        }
    }
        else { dragging = false; }
}
    else { dragging = false;  }
    
if unit_amount <= 0 { my_indicator = spr_Indicator_Red; }
    else { my_indicator = spr_Indicator_Green; }



