if place_meeting(x,y, obj_MOUSE) {
    if mouse_check_button_pressed(mb_left) {
        if is_checked == false { 
			//Find IP address and assign to global IP variable
			if instance_exists(obj_Get_LAN_IP) { instance_destroy(obj_Get_LAN_IP); }
			if !instance_exists(obj_Get_IP)    { instance_create_layer(0, 0, "Control", obj_Get_IP); }
        }
    }
}

if global.net_type == "INTERNET" { is_checked = true; }
    else { is_checked = false; }
    
if is_checked == true { 
    if anim_count < anim_timer { 
        scl = ease_out_quad(anim_count, 0.2, 0.8, anim_timer);
        anim_count ++; 
    }
}

