/// @description Alert display control, Ammo check
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

    
if ammo_check == true {
    ammo_check = false;
    global.cannon_ammo = 0;
    global.mg_tank_ammo = 0;
    global.rifle_ammo = 0;
    global.flare_ammo = 0;
    global.rpg_ammo = 0;
    global.depot_supply = 0;
    global.repair_supply = 0;
    global.tow_supply = 0;
    global.mortar_supply = 0;
    global.he_ammo = 0;
    global.ap_ammo = 0;
    global.ammo_supply = 0;
    global.building_supply = 0;
    global.tow_ammo = 0;
    global.mortar_ammo = 0;
    global.ammunition_ammo= 0;
    global.parts_ammo = 0;
    global.repair_ammo = 0;
    global.repair_mg_ammo = 0;
    global.lc_ammunition_ammo = 0;
    global.lc_parts_ammo  = 0;
    if !ds_list_empty(global.myunit_list) {
        var i;
        for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
            var unit = ds_list_find_value(global.myunit_list, i);
            with unit {
                switch unit_type {
                  case "INFANTRY":
                      global.rifle_ammo += rifle_ammo;
                      global.flare_ammo += flare_ammo;
                      global.rpg_ammo   += rpg_ammo;
                      break;
                  case "TANK":
                      global.cannon_ammo  += cannon_ammo;
                      global.mg_tank_ammo += mg_ammo;
                      break;
                  case "ENGINEER":
                      global.depot_supply  += depot_supply;
                      global.repair_supply += repair_supply;
                      global.tow_supply    += tow_supply;
                      global.mortar_supply += mortar_supply;
                      break;
                  case "BTR":
                      global.he_ammo += he_ammo;
                      global.ap_ammo += ap_ammo;
                      break;
                  case "LOGI":
                      global.ammo_supply += ammo_supply;
                      global.building_supply += building_supply;
                      break;
                  case "DEPOT":
                      global.ammunition_ammo += ammunition_ammo;
                      global.parts_ammo += parts_ammo;
                      break;
                  case "REPAIR":
                      global.repair_ammo += repair_ammo;
                      global.repair_mg_ammo += mg_ammo;
                      break;
                  case "TOW":
                      global.tow_ammo += tow_ammo;
                      break;
                  case "MORTAR":
                      global.mortar_ammo += mortar_ammo;
                      break;
                  default:
                      break;
                }
            }
        }
    }
    with obj_LogiLanding_Unit { 
        global.lc_ammunition_ammo += ammunition_ammo;
        global.lc_parts_ammo      += parts_ammo;
    }
}

if PLAYER.net_status == "NONE" && landing == true {
	if keyboard_check_pressed(vk_escape) {
		if show_options == false {  
			//Retract UI, disable unit selection, display game options
			show_options = true;
			//Deselect units
			with obj_Unit_Parent { if selected == true { selected = false; } } 
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

