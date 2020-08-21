if place_meeting(x, y, obj_MOUSE) {
    if mouse_check_button_pressed(mb_left) {
        can_drag = true;
        a.set_ref = true;
        a.drag = true;
    }
}

if mouse_check_button_released(mb_left) {
    can_drag = false;
    a.drag = false;
}

if can_drag == true {
    if (mouse_x >= leftLimit) && (mouse_x <= rightLimit) {
        a.x = mouse_x;
    }
}

sw = a.x-sx;