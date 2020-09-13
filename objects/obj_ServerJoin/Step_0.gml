/// @description  Detect clicking on server list
count = ds_list_size(server_list);
if count > 0 {
	if (mouse_y>=yy1) && (mouse_y<(yy1+(count*v_sep))) {
		if (mouse_x>xx1) && (mouse_x<xx2) {
			picked = floor((mouse_y+yy1)/(v_sep)-4);
		}
			else { picked = -1; }
	}
		else { picked = -1; }
	if picked != -1 {
		if mouse_check_button_pressed(mb_left) {
			global.server_IP   = ds_list_find_value(server_list , picked);
			global.server_port = ds_list_find_value(server_ports, picked);
			global.server_name = ds_list_find_value(server_names, picked);
			selected = picked;
		}
	}
}
	else { picked = -1; }
	
if can_choose == true {
	if (global.server_IP != undefined) && (global.server_port != undefined) && (global.server_name != undefined) {
		global.can_choose = true;
	}
		else { global.can_choose = false; }
}

