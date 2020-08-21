if clear == true {
    clear = false;
    auto_assign = false;
    unit_amount = start_units;
}

if auto_assign == false {
    if place_meeting(x, y, obj_MOUSE) {
        if mouse_check_button_pressed(mb_left) {
            if unit_amount >= 1 { 
                can_drag = true; 
                with obj_SquadAssigner { can_activate = true; }
            }
        }
    }
}
    else if auto_assign == true {
        can_drag = false;
    }





