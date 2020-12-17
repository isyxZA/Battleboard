/// @description Alert display control
if global.my_turn == true || global.waiting == true {
	//Display AP cost of action
	if global.draw_apcost == true {
	    global.draw_apcost = false;
	    draw_apcost = true;
	    alarm[4] = global.tick_rate;
	}

	//Display CP cost of action
	if global.draw_cpcost == true {
	    global.draw_cpcost = false;
	    draw_cpcost = true;
	    alarm[4] = global.tick_rate;
	}

	if global.draw_apreturn == true {
	    global.draw_apreturn = false;
	    draw_apreturn = true;
	    alarm[4] = global.tick_rate;
	}

	if global.targeting_error == true {
	    global.targeting_error = false;
	    targeting_error = true;
	    alarm[2] = 200;
	}

	if global.navigation_error == true {
	    global.navigation_error = false;
	    navigation_error = true;
	    alarm[3] = 100;
	}

	if global.friendly_fire == true {
	    global.friendly_fire = false;
	    friendly_fire = true;
	    alarm[5] = 100;
	}
}

if PLAYER.net_status != "NONE" && landing == true {
	if keyboard_check_pressed(vk_escape) {
		if show_options == false {  
			//Retract UI, disable unit selection, display game options
			show_options = true;
			//Deselect all units
			if !ds_list_empty(global.selected_list) {
				scr_DeselectAll();
			}
			instance_create_layer(camera_get_view_x(obj_CAMERA.my_camera), camera_get_view_y(obj_CAMERA.my_camera), "Pause", obj_OPTIONS);
			global.can_zoom = false;
			global.can_pan = false;
			temp_zlevel = global.zoom_level;
			global.zoom_level = 0;
			if global.game_turn != 0 {
				ui_anim = true;
				y_target = -(ui_height*ui_ratio);
				ins_rot = 0;
				command_targeting = true;
				bomber_timer = 0;
				missile_timer = 0;
				uav_timer = 0;
				artillery_timer = 0;
				airdrop_timer = 0;
				ilc_timer = 0;
				tlc_timer = 0;
				blc_timer = 0;
				elc_timer = 0;
				llc_timer = 0;
				bomber_targeting = false;
				missile_targeting = false;
				uav_targeting = false;
				artillery_targeting = false;
				airdrop_targeting = false;
				ilc_targeting = false;
				tlc_targeting = false;
				blc_targeting = false;
				elc_targeting = false;
				llc_targeting = false;
			}
		}
			else if show_options == true { 
				//Extend UI and stop displaying options
				show_options = false;
				scr_SaveSettings();
				with obj_OPTIONS { instance_destroy(); }
				global.zoom_level = temp_zlevel;
				global.can_zoom = true;
				global.can_pan = true;
				if global.set_ui == true {
					global.set_ui = false;
					ui_ratio = global.ui_scale;
					s_dist   = 36*global.ui_scale;
					clamp(s_dist, 24, 36);
					ui_tx = (mid_x - (ui_width*global.ui_scale)*0.5);
					ui_bx = ui_tx;
					ui_by = display_get_gui_height()-(ui_height*global.ui_scale);
				}
				if global.game_turn != 0 {
					ui_anim = true;
					y_target = 0;
				}
			}
	}
}

/*
if keyboard_check_pressed(ord("L")) {
	if global.victory = false {
		global.victory = true;
		ui_anim = true;
		y_target = -(ui_height*ui_ratio);
	}
}
*/

