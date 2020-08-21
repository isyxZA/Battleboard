/// @description  Detect clicking on server list
if mouse_check_button_released(mb_left) {
	var count = ds_list_size(server_list);
	if count > 0 {
		if mouse_y>yy1-v_sep && mouse_y<(yy1+(count*v_sep)) {
			var picked = floor(((mouse_y-yy1)/v_sep));
			if global.can_choose == true {
				global.server_IP   = ds_list_find_value(server_list , picked);
				global.server_port = ds_list_find_value(server_ports, picked);
				global.server_name = ds_list_find_value(server_names, picked);
				if (global.server_IP != undefined) and (global.server_port != undefined) and (global.server_name != undefined) {
					network_destroy(global.broadcast_server);
					global.broadcast_server = -1;
					global.transition = true;
			        global.can_choose = false;
			        obj_SOUND.fade_out = true;
			        obj_SOUND.fade_in = false;
					alarm[1] = 60;
				}
			}
		}
	}
}