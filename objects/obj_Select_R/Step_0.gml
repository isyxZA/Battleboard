if place_meeting(x, y, obj_MOUSE) {
	touching = true;
	if parent.dragging == false {
	    if mouse_check_button_pressed(mb_left) {
			parent.count += 1;
			parent.unit_change = true;
		}
	}
}
	else { 
		touching = false;
	}
