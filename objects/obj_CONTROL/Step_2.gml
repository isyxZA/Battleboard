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
    mbta_ap_ammo = 0;
    mbta_mg_ammo= 0;
    obj_ACTIONMENU.infa_rfl_ammo = 0;
    obj_ACTIONMENU.infa_flr_ammo = 0;
    obj_ACTIONMENU.infa_rpg_ammo = 0;
    laca_dpt_supply = 0;
    laca_rpr_supply = 0;
    laca_tow_supply = 0;
    laca_mtr_supply = 0;
	lacb_tow_ammo = 0;
    lava_he_ammo = 0;
    lava_ap_ammo = 0;
	lava_mg_ammo = 0;
    lava_at_ammo = 0;
	lava_sq_ammo = 0;
    logia_amo_supply = 0;
    logia_bld_supply = 0;
    tow_ammo = 0;
    mortar_ammo = 0;
    dpt_amo_supply= 0;
    dpt_bld_supply = 0;
    repair_v_ammo = 0;
    repair_mg_ammo = 0;
    lc_amo_ammo = 0;
    lc_bld_ammo  = 0;
    if !ds_list_empty(global.myunit_list) {
        var i;
        for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
            var unit = ds_list_find_value(global.myunit_list, i);
            with unit {
                switch unit_type {
	                case "INF_A":
					case "INF_B":
	                    infa_rfl_ammo += rifle_ammo;
	                    infa_flr_ammo += flare_ammo;
	                    infa_rpg_ammo += rpg_ammo;
	                    break;
	                case "MBT_A":
					case "MBT_B":
	                    mbta_ap_ammo  += cannon_ammo;
	                    mbta_mg_ammo+= mg_ammo;
	                    break;
	                case "LAC_A":
	                    laca_dpt_supply += depot_supply;
	                    laca_rpr_supply += repair_supply;
	                    laca_tow_supply += tow_supply;
	                    laca_mtr_supply += mortar_supply;
	                    break;
					case "LAC_B":
						lacb_tow_ammo += tow_ammo;
						break;
	                case "LAV_A":
	                    lava_he_ammo += he_ammo;
	                    lava_ap_ammo += ap_ammo;
						lava_mg_ammo += mg_ammo;
	                    lava_at_ammo += tow_ammo;
	                    break;
					case "LAV_B":
	                    lava_he_ammo += he_ammo;
	                    lava_ap_ammo += ap_ammo;
						lava_mg_ammo += mg_ammo;
	                    break;
	                case "LOGI_A":
	                    logia_amo_supply += ammo_supply;
	                    logia_bld_supply += building_supply;
	                    break;
					case "LOGI_B":
	                    logia_amo_supply += ammo_supply;
	                    break;
	                case "DEPOT":
	                    dpt_amo_supply += ammunition_ammo;
	                    dpt_bld_supply += parts_ammo;
	                    break;
	                case "REPAIR":
	                    repair_v_ammo += repair_ammo;
	                    repair_mg_ammo += mg_ammo;
	                    break;
	                case "TOW":
	                    tow_ammo += tow_ammo;
	                    break;
	                case "MORTAR":
	                    mortar_ammo += mortar_ammo;
	                    break;
	                default:
	                    break;
                }
            }
        }
    }
    with obj_LogiLanding_Unit { 
        lc_amo_ammo += ammunition_ammo;
        lc_bld_ammo      += parts_ammo;
    }
}

if PLAYER.net_status != "NONE" && landing == true {
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

/*
if keyboard_check_pressed(ord("L")) {
	if global.victory = false {
		global.victory = true;
		ui_anim = true;
		y_target = -(ui_height*ui_ratio);
	}
}
*/

