if (!ds_list_empty(global.selected_list)) || (global.supply_ship != noone) {
	amount_reset = true;
    //If not using targeting reticule
    if global.reticule_display == false {
        //And not currently choosing a waypoint
        if global.nav_select == false {
            //Enable the navigation tab
            if global.nav_menu == true { 
				scr_Navigation_Tab(); 
				if menu_anim == true {
					if menu_anim_count < menu_anim_timer { 
						menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
						menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
						menu_anim_count ++; 
					}
						else { menu_anim = false; }
				}
			}
                //If not choosing a waypoint
                else if global.nav_menu == false {
                    if mouse_check_button_pressed(mb_right) {
                        //If not displaying the repair menu
                        //Enable the action/action_repair tab
                        if global.repair_display != true { global.menu_create = true; } else { global.menu_create = false; }
                    }
                    if global.menu_create == true {
                        //First check if any vehicles are in a repair station
                        if !ds_list_empty(global.selected_list) {
                            var i;
                            repair_tab = false;
                            for (i=0; i<ds_list_size(global.selected_list); i+=1) {
                                var u = ds_list_find_value(global.selected_list, i);
                                switch u.unit_type {
                                    case "MBT_A":
									case "MBT_B":
                                    case "LAC_A":
									case "LAC_B":
                                    case "LAV_A":
									case "LAV_B":
                                    case "LOGI_A":
									case "LOGI_B":
                                        if u.is_manning == true { 
											repair_tab = true; 
										}
                                        break;
                                    default:
                                        break;
                                }
                            }
                            if repair_tab == false { 
								scr_Action_Tab();
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
								        menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								        menu_anim_count ++; 
								    }
										else { menu_anim = false; }
								}
							} 
								else { 
									scr_ActionRepair_Tab(); 
									if menu_anim == true {
										if menu_anim_count < menu_anim_timer { 
									        menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
											menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
									        menu_anim_count ++; 
									    }
											else { menu_anim = false; }
									}
								}
                        }
                    }
                        else if global.menu_create == false {
                            if global.repair_display == true {
                                //Calculate available repair amount
                                if ammo_check == true {
                                    ammo_check = false;
                                    repair_v_ammo = 0;
                                    if !ds_list_empty(global.repair_list) {
                                        var i;
                                        for (i=0; i<ds_list_size(global.repair_list); i+=1) {
                                            var unit = ds_list_find_value(global.repair_list, i);
                                            if unit.manned_unit != noone {
												if unit.manned_unit.selected == true { repair_v_ammo += unit.repair_ammo; }
                                            }
                                        }
                                    }
                                }
                                //Loop thru unit list to find vehicles in repair stations
                                var h_total = 0;
                                var h_max = 0;
                                if !ds_list_empty(global.selected_list) {
                                    var ii;
                                    for (ii=0; ii<ds_list_size(global.selected_list); ii+=1) {
                                        var u = ds_list_find_value(global.selected_list, ii);
                                        switch u.unit_type {
                                            case "MBT_A":
											case "MBT_B":
		                                    case "LAC_A":
											case "LAC_B":
		                                    case "LAV_A":
											case "LAV_B":
		                                    case "LOGI_A":
											case "LOGI_B":
                                                if u.is_manning == true { 
                                                    h_total += u.unit_health; 
                                                    h_max   += u.health_max;
                                                }
                                                break;
                                            default:
                                                break;
                                        }
                                    }
                                }
                                scr_Repair_Vehicle_Tab(h_total, h_max, obj_Repair_Static.repair_rate);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
								        menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								        menu_anim_count ++; 
								    }
										else { menu_anim = false; }
								}
                            }
                        }
                }
        }
            //If currently choosing a waypoint
            else if global.nav_select == true {
                //RMB to bring up the nav menu
                if mouse_check_button_pressed(mb_right) {
					var total_ap = 0;
                    //Calculate the mp cost
                    if !ds_list_empty(global.selected_list) {
                        var ii;
                        for (ii=0; ii<ds_list_size(global.selected_list); ii+=1) {
                            var u2 = ds_list_find_value(global.selected_list, ii);
							total_ap += u2.action_points;
                        }
                    } 
                    if (total_ap-global.temp_AP) < 0 { global.navigation_error = true; }
                        else {
                            global.nav_menu = true;
                            global.nav_select = false; 
                        }
                }
            }
    }
        //If using the targeting reticule
        else if global.reticule_display == true {
            //If RMB while the targeting reticule is visible
            if mouse_check_button_pressed(mb_right) {
                //Display the fire/action options
                if global.fire_display ==  false {
                    global.fire_display = true; 
					ds_list_clear(tabs);
					global.selected_infa   = ds_list_size(global.selected_infa_list);
					global.selected_infb   = ds_list_size(global.selected_infb_list);
					global.selected_mbta   = ds_list_size(global.selected_mbta_list);
					global.selected_mbtb   = ds_list_size(global.selected_mbtb_list);
					global.selected_laca   = ds_list_size(global.selected_laca_list);
					global.selected_lacb   = ds_list_size(global.selected_lacb_list);
					global.selected_lava   = ds_list_size(global.selected_lava_list);
					global.selected_lavb   = ds_list_size(global.selected_lavb_list);
					global.selected_logia  = ds_list_size(global.selected_logia_list);
					global.selected_logib  = ds_list_size(global.selected_logib_list);
					global.selected_depot  = ds_list_size(global.selected_depot_list);
					global.selected_repair = ds_list_size(global.selected_repair_list);
					global.selected_tow    = ds_list_size(global.selected_tow_list);
					global.selected_mortar = ds_list_size(global.selected_mortar_list);
					if global.selected_infa   != 0     { ds_list_add(tabs, "INF_A"); }
					if global.selected_infb   != 0     { ds_list_add(tabs, "INF_B"); }
					if global.selected_mbta   != 0     { ds_list_add(tabs, "MBT_A"); }
					if global.selected_mbtb   != 0     { ds_list_add(tabs, "MBT_B"); }
					if global.selected_laca   != 0     { ds_list_add(tabs, "LAC_A"); }
					if global.selected_lacb   != 0     { ds_list_add(tabs, "LAC_B"); }
					if global.selected_lava   != 0     { ds_list_add(tabs, "LAV_A"); }
					if global.selected_lavb   != 0     { ds_list_add(tabs, "LAV_B"); }
					if global.selected_logia  != 0     { ds_list_add(tabs, "LOGI_A"); }
					if global.selected_logib  != 0     { ds_list_add(tabs, "LOGI_B"); }
					if global.selected_depot  != 0     { ds_list_add(tabs, "DEPOT"); }
					if global.selected_repair != 0     { ds_list_add(tabs, "REPAIR"); }
					if global.selected_tow    != 0     { ds_list_add(tabs, "TOW"); }
					if global.selected_mortar != 0     { ds_list_add(tabs, "MORTAR"); }
					if global.supply_ship     != noone { ds_list_add(tabs, "SUPPLY SHIP"); }
					if !ds_list_empty(tabs) { 
						global.ammo_tab = ds_list_find_value(tabs, 0);
					}
						else {
							global.ammo_tab = "NOONE";
						}
                }
                if ammo_check == false { ammo_check = true; }
            }
            if global.fire_display == true {
                //Set the unit's queue status
                if !ds_list_empty(global.selected_list) {
                    var i;
                    for (i=0; i<ds_list_size(global.selected_list); i+=1) {
                        var unit = ds_list_find_value(global.selected_list, i);
                        with unit {
                            if unit_type != global.ammo_tab { in_queue = true; }
                                else { in_queue = false; }
                        }
                    }
                }
                //Calculate available ammo levels
                if ammo_check == true {
                    ammo_check = false;
					//INFA Ammo
                    infa_rfl_ammo = 0;
                    infa_flr_ammo = 0;
                    infa_rpg_ammo = 0;
					//INFB Ammo
					infb_rfl_ammo = 0;
                    infb_flr_ammo = 0;
                    infb_rpg_ammo = 0;
					//MBTA Ammo
                    mbta_ap_ammo = 0;
                    mbta_mg_ammo = 0;
					//MBTB Ammo
                    mbtb_ap_ammo = 0;
                    mbtb_mg_ammo = 0;
					//LACA Ammo
                    laca_dpt_supply = 0;
                    laca_rpr_supply = 0;
                    laca_tow_supply = 0;
                    laca_mtr_supply = 0;
					//LAVB Ammo
					lacb_tow_ammo = 0;
					//LAVA Ammo
                    lava_he_ammo = 0;
                    lava_ap_ammo = 0;
					lava_mg_ammo = 0;
					lava_at_ammo = 0;
					lava_sq_ammo = 0;
					//LAVA Ammo
                    lavb_he_ammo = 0;
                    lavb_ap_ammo = 0;
					lavb_mg_ammo = 0;
					lavb_sq_ammo = 0;
					//LOGIA Ammo
                    logia_amo_supply = 0;
                    logia_bld_supply = 0;
					//LOGIB Ammo
					logib_amo_supply = 0;
					logib_sqd_supply = 0;
					//TOW Ammo
                    tow_ammo = 0;
					//MORTAR Ammo
                    mortar_ammo = 0;
					//SHIP Ammo
                    dpt_amo_supply = 0;
                    dpt_bld_supply = 0;
					//REPAIR Ammo
                    repair_mg_ammo = 0;
                    if !ds_list_empty(global.selected_list) {
                        var i;
                        for (i=0; i<ds_list_size(global.selected_list); i+=1) {
                            var unit = ds_list_find_value(global.selected_list, i);
                            with unit {
	                            switch unit_type {
		                            case "INF_A":
		                                //If the unit has line of fire then add its ammo to available rounds
		                                if can_shoot == true {
		                                    obj_ACTIONMENU.infa_rfl_ammo += rifle_ammo;
		                                    obj_ACTIONMENU.infa_flr_ammo += flare_ammo;
		                                    obj_ACTIONMENU.infa_rpg_ammo += rpg_ammo;
		                                }
		                                break;
									case "INF_B":
		                                //If the unit has line of fire then add its ammo to available rounds
		                                if can_shoot == true {
		                                    obj_ACTIONMENU.infb_rfl_ammo += rifle_ammo;
		                                    obj_ACTIONMENU.infb_flr_ammo += flare_ammo;
		                                    obj_ACTIONMENU.infb_rpg_ammo += rpg_ammo;
		                                }
		                                break;
		                            case "MBT_A":
		                                //If the unit has line of fire then add its ammo to available rounds
		                                if can_shoot == true {
		                                    obj_ACTIONMENU.mbta_ap_ammo += cannon_ammo;
		                                    obj_ACTIONMENU.mbta_mg_ammo += mg_ammo;
		                                }
		                                break;
									case "MBT_B":
		                                //If the unit has line of fire then add its ammo to available rounds
		                                if can_shoot == true {
		                                    obj_ACTIONMENU.mbtb_ap_ammo += cannon_ammo;
		                                    obj_ACTIONMENU.mbtb_mg_ammo += mg_ammo;
		                                }
		                                break;
		                            case "LAC_A":
		                                //If the unit has line of fire then add its ammo to available rounds
		                                if can_shoot == true {
		                                    obj_ACTIONMENU.laca_dpt_supply += depot_supply;
		                                    obj_ACTIONMENU.laca_rpr_supply += repair_supply;
		                                    obj_ACTIONMENU.laca_tow_supply += tow_supply;
		                                    obj_ACTIONMENU.laca_mtr_supply += mortar_supply;
		                                }
		                                break;
									case "LAC_B":
		                                //If the unit has line of fire then add its ammo to available rounds
		                                if can_shoot == true {
		                                    obj_ACTIONMENU.lacb_tow_ammo += tow_ammo;
		                                }
		                                break;
		                            case "LAV_A":
		                                //If the unit has line of fire then add its ammo to available rounds
		                                if can_shoot == true {
		                                    obj_ACTIONMENU.lava_he_ammo += he_ammo;
		                                    obj_ACTIONMENU.lava_ap_ammo += ap_ammo;
											obj_ACTIONMENU.lava_mg_ammo += mg_ammo;
											obj_ACTIONMENU.lava_at_ammo += tow_ammo;
											obj_ACTIONMENU.lava_sq_ammo += sqd_ammo;
		                                }
		                                break;
									case "LAV_B":
		                                //If the unit has line of fire then add its ammo to available rounds
		                                if can_shoot == true {
		                                    obj_ACTIONMENU.lavb_he_ammo += he_ammo;
		                                    obj_ACTIONMENU.lavb_ap_ammo += ap_ammo;
											obj_ACTIONMENU.lavb_mg_ammo += mg_ammo;
											obj_ACTIONMENU.lavb_sq_ammo += sqd_ammo;
		                                }
		                                break;
		                            case "LOGI_A":
		                                //If the unit has line of fire then add its ammo to available rounds
		                                if can_shoot == true {
		                                    obj_ACTIONMENU.logia_amo_supply += ammo_supply;
		                                    obj_ACTIONMENU.logia_bld_supply += building_supply;
		                                }
		                                break;
									case "LOGI_B":
		                                //If the unit has line of fire then add its ammo to available rounds
		                                if can_shoot == true {
		                                    obj_ACTIONMENU.logib_amo_supply += ammo_supply;
		                                    obj_ACTIONMENU.logib_sqd_supply += sqd_supply;
		                                }
		                                break;
		                            case "DEPOT":
		                                //If the unit has line of fire then add its ammo to available rounds
		                                if can_shoot == true {
		                                    obj_ACTIONMENU.dpt_amo_supply += ammunition_ammo;
		                                    obj_ACTIONMENU.dpt_bld_supply += parts_ammo;
		                                }
		                                break;
		                            case "REPAIR":
		                                //If the unit has line of fire then add its ammo to available rounds
		                                if can_shoot == true {
		                                    obj_ACTIONMENU.repair_mg_ammo += mg_ammo;
		                                }
		                                break;
		                            case "TOW":
		                                //If the unit has line of fire then add its ammo to available rounds
		                                if can_shoot == true {
		                                    obj_ACTIONMENU.tow_ammo += tow_ammo;
		                                }
		                                break;
		                            case "MORTAR":
		                                //If the unit has line of fire then add its ammo to available rounds
		                                if can_shoot == true {
		                                    obj_ACTIONMENU.mortar_ammo += mortar_ammo;
		                                }
		                                break;
		                            default:
		                                break;
	                            }
                            }
                        }
                    }
                        else {
                            if global.supply_ship != noone {
                                lc_amo_ammo = 0;
                                lc_bld_ammo = 0;
                                if global.supply_ship.can_shoot == true {
                                    lc_amo_ammo += global.supply_ship.ammunition_ammo;
                                    lc_bld_ammo += global.supply_ship.parts_ammo;
                                }
                            }
                        }
                }
                //Create menu selection boxes for fire menu according to unit type
                switch global.ammo_tab {
                    case "INF_A":
                        scr_INFA_Tab(4, 1, 1, 2);
						if menu_anim == true {
							if menu_anim_count < menu_anim_timer { 
								menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_anim_count ++; 
							}
								else { menu_anim = false; }
						}
                        break;
					case "INF_B":
                        scr_INFB_Tab(4, 1, 1, 2);
						if menu_anim == true {
							if menu_anim_count < menu_anim_timer { 
								menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_anim_count ++; 
							}
								else { menu_anim = false; }
						}
                        break;
                    case "MBT_A":
                        scr_MBTA_Tab(1, 4, 4, 2);
						if menu_anim == true {
							if menu_anim_count < menu_anim_timer { 
								menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_anim_count ++; 
							}
								else { menu_anim = false; }
						}
                        break;
					case "MBT_B":
                        scr_MBTB_Tab(1, 4, 4, 2);
						if menu_anim == true {
							if menu_anim_count < menu_anim_timer { 
								menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_anim_count ++; 
							}
								else { menu_anim = false; }
						}
                        break;
                    case "LAC_A":
                        scr_LACA_Tab(1, 1, 1, 1, 6);
						if menu_anim == true {
							if menu_anim_count < menu_anim_timer { 
								menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_anim_count ++; 
							}
								else { menu_anim = false; }
						}
                        break;
					case "LAC_B":
                        scr_LACB_Tab(1, 6);
						if menu_anim == true {
							if menu_anim_count < menu_anim_timer { 
								menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_anim_count ++; 
							}
								else { menu_anim = false; }
						}
                        break;
                    case "LAV_A":
                        scr_LAVA_Tab(
							obj_LAVA_Unit.he_rate, obj_LAVA_Unit.ap_rate, obj_LAVA_Unit.mg_rate, obj_LAVA_Unit.tow_rate, obj_LAVA_Unit.sqd_rate,
							obj_LAVA_Unit.he_cost, obj_LAVA_Unit.ap_cost, obj_LAVA_Unit.mg_cost, obj_LAVA_Unit.tow_cost, obj_LAVA_Unit.sqd_cost
						);
						if menu_anim == true {
							if menu_anim_count < menu_anim_timer { 
								menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_anim_count ++; 
							}
								else { menu_anim = false; }
						}
                        break;
					case "LAV_B":
                        scr_LAVB_Tab(
							obj_LAVB_Unit.he_rate, obj_LAVB_Unit.ap_rate, obj_LAVB_Unit.mg_rate, obj_LAVB_Unit.sqd_rate,
							obj_LAVB_Unit.he_cost, obj_LAVB_Unit.ap_cost, obj_LAVB_Unit.mg_cost, obj_LAVB_Unit.sqd_cost
						);
						if menu_anim == true {
							if menu_anim_count < menu_anim_timer { 
								menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_anim_count ++; 
							}
								else { menu_anim = false; }
						}
                        break;
                    case "LOGI_A":
                        //Determine if a unit is being targeted for resupply
                        var infa  = instance_place(global.target_x, global.target_y, obj_INFA_Unit);
						var infb  = instance_place(global.target_x, global.target_y, obj_INFB_Unit);
                        var tanka = instance_place(global.target_x, global.target_y, obj_MBTA_Unit);
						var tankb = instance_place(global.target_x, global.target_y, obj_MBTB_Unit);
                        var laca  = instance_place(global.target_x, global.target_y, obj_LACA_Unit);
						var lacb  = instance_place(global.target_x, global.target_y, obj_LACB_Unit);
                        var lava  = instance_place(global.target_x, global.target_y, obj_LAVA_Unit);
						var lavb  = instance_place(global.target_x, global.target_y, obj_LAVB_Unit);
                        var logia = instance_place(global.target_x, global.target_y, obj_LOGIA_Unit);
						var logib = instance_place(global.target_x, global.target_y, obj_LOGIB_Unit);
                        var depot = instance_place(global.target_x, global.target_y, obj_Depot_Static);
                        var rpr   = instance_place(global.target_x, global.target_y, obj_Repair_Static);
                        var tow   = instance_place(global.target_x, global.target_y, obj_TOW_Static);
                        var mtr   = instance_place(global.target_x, global.target_y, obj_Mortar_Static);
        
                        if infa != noone { 
                            if (infa.nav_confirmed == false) && (infa.action_confirmed == false) && (infa.resupplying == false ) { global.resupply_target = "INF_A"; }
                                else { global.resupply_target = "NOONE"; }
                        }
							else if infb { 
	                            if (infb.nav_confirmed == false) && (infb.action_confirmed == false) && (infb.resupplying == false ) { global.resupply_target = "INF_B"; }
	                                else { global.resupply_target = "NOONE"; }
	                        }
	                            else if tanka { 
	                                if (tanka.nav_confirmed == false) && (tanka.action_confirmed == false) && (tanka.resupplying == false ) { global.resupply_target = "MBT_A"; }
	                                    else { global.resupply_target = "NOONE"; }
	                            }
									else if tankb { 
		                                if (tankb.nav_confirmed == false) && (tankb.action_confirmed == false) && (tankb.resupplying == false ) { global.resupply_target = "MBT_B"; }
		                                    else { global.resupply_target = "NOONE"; }
		                            }
		                                else if laca { 
		                                    if (laca.nav_confirmed == false) && (laca.action_confirmed == false) && (laca.resupplying == false ) { global.resupply_target = "LAC_A"; }
		                                        else { global.resupply_target = "NOONE"; }
		                                }
											else if lacb { 
			                                    if (lacb.nav_confirmed == false) && (lacb.action_confirmed == false) && (lacb.resupplying == false ) { global.resupply_target = "LAC_B"; }
			                                        else { global.resupply_target = "NOONE"; }
			                                }
			                                    else if lava { 
			                                        if (lava.nav_confirmed == false) && (lava.action_confirmed == false) && (lava.resupplying == false ) { global.resupply_target = "LAV_A"; }
			                                            else { global.resupply_target = "NOONE"; }
			                                    }
													else if lavb { 
				                                        if (lavb.nav_confirmed == false) && (lavb.action_confirmed == false) && (lavb.resupplying == false ) { global.resupply_target = "LAV_B"; }
				                                            else { global.resupply_target = "NOONE"; }
				                                    }
				                                        else if logia { 
				                                            if (logia.nav_confirmed == false) && (logia.action_confirmed == false) && (logia.resupplying == false ) { global.resupply_target = "LOGI_A"; }
				                                                else { global.resupply_target = "NOONE"; }
				                                        }
															else if logib { 
					                                            if (logib.nav_confirmed == false) && (logib.action_confirmed == false) && (logib.resupplying == false ) { global.resupply_target = "LOGI_B"; }
					                                                else { global.resupply_target = "NOONE"; }
					                                        }
					                                            else if depot { 
					                                                if (depot.nav_confirmed == false) && (depot.action_confirmed == false) && (depot.resupplying == false ) && (depot.is_manned == true) { global.resupply_target = "DEPOT"; }
					                                                    else { global.resupply_target = "NOONE"; }
					                                            }
					                                                else if rpr { 
					                                                    if (rpr.nav_confirmed == false) && (rpr.action_confirmed == false) && (rpr.resupplying == false ) && (rpr.is_manned == true) { global.resupply_target = "REPAIR"; }
					                                                        else { global.resupply_target = "NOONE"; }
					                                                }
					                                                    else if tow { 
					                                                        if (tow.nav_confirmed == false) && (tow.action_confirmed == false) && (tow.resupplying == false ) && (tow.is_manned == true) { global.resupply_target = "TOW"; }
					                                                            else { global.resupply_target = "NOONE"; }
					                                                    }
					                                                        else if mtr { 
					                                                            if (mtr.nav_confirmed == false) && (mtr.action_confirmed == false) && (mtr.resupplying == false ) && (mtr.is_manned == true) { global.resupply_target = "MORTAR"; }
					                                                                else { global.resupply_target = "NOONE"; }
					                                                        }
					                                                            else { global.resupply_target = "NOONE"; }
                                                            
                        //Determine which tab to display depending on which unit type is targeted    
                        switch global.resupply_target {
                            case "INF_A":
                                var ammo_1  = infa.rifle_ammo;
                                var ammo_2  = infa.rpg_ammo;
                                var ammo_3  = infa.flare_ammo;
                                var max_1   = infa.rifle_max;
                                var max_2   = infa.rpg_max;
                                var max_3   = infa.flare_max;
                                var rate_1  = obj_LOGIA_Unit.rfl_supply_rate;
                                var rate_2  = obj_LOGIA_Unit.rpg_supply_rate;
                                var rate_3  = obj_LOGIA_Unit.flr_supply_rate;
                                scr_LOGIA_INFA_Tab(infa.id, ammo_1, ammo_2, ammo_3, max_1, max_2, max_3, rate_1, rate_2, rate_3);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
							case "INF_B":
                                var ammo_1  = infb.rifle_ammo;
                                var ammo_2  = infb.rpg_ammo;
                                var ammo_3  = infb.flare_ammo;
                                var max_1   = infb.rifle_max;
                                var max_2   = infb.rpg_max;
                                var max_3   = infb.flare_max;
                                var rate_1  = obj_LOGIA_Unit.rfl_supply_rate;
                                var rate_2  = obj_LOGIA_Unit.rpg_supply_rate;
                                var rate_3  = obj_LOGIA_Unit.flr_supply_rate;
                                scr_LOGIA_INFB_Tab(infb.id, ammo_1, ammo_2, ammo_3, max_1, max_2, max_3, rate_1, rate_2, rate_3);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "MBT_A":
                                var ammo_1  = tanka.cannon_ammo;
                                var ammo_2  = tanka.mg_ammo;
                                var max_1   = tanka.cannon_max;
                                var max_2   = tanka.mg_max;
                                var rate_1  = obj_LOGIA_Unit.mbtap_supply_rate;
                                var rate_2  = obj_LOGIA_Unit.mbtmg_supply_rate;
                                scr_LOGIA_MBTA_Tab(tanka.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
							case "MBT_B":
                                var ammo_1  = tankb.cannon_ammo;
                                var ammo_2  = tankb.mg_ammo;
                                var max_1   = tankb.cannon_max;
                                var max_2   = tankb.mg_max;
                                var rate_1  = obj_LOGIA_Unit.mbtap_supply_rate;
                                var rate_2  = obj_LOGIA_Unit.mbtmg_supply_rate;
                                scr_LOGIA_MBTB_Tab(tankb.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "LAC_A":
                                var ammo_1  = laca.depot_supply;
                                var ammo_2  = laca.repair_supply;
                                var ammo_3  = laca.tow_supply;
                                var ammo_4  = laca.mortar_supply;
                                var max_1   = laca.depot_max;
                                var max_2   = laca.repair_max;
                                var max_3   = laca.tow_max;
                                var max_4   = laca.mortar_max;
                                var rate_1  = obj_LOGIA_Unit.lacdpt_supply_rate;
                                var rate_2  = obj_LOGIA_Unit.lacrpr_supply_rate;
                                var rate_3  = obj_LOGIA_Unit.lactow_supply_rate;
                                var rate_4  = obj_LOGIA_Unit.lacmtr_supply_rate;
                                scr_LOGIA_LACA_Tab(laca.id, ammo_1, ammo_2, ammo_3, ammo_4, max_1, max_2, max_3, max_4, rate_1, rate_2, rate_3, rate_4);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
							case "LAC_B":
                                var ammo_1  = lacb.tow_ammo;
                                var max_1   = lacb.tow_max;
                                var rate_1  = obj_LOGIA_Unit.lactow2_supply_rate;
                                scr_LOGIA_LACB_Tab(lacb.id, ammo_1, max_1, rate_1);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "LAV_A":
                                var ammo_1  = lava.he_ammo;
                                var ammo_2  = lava.ap_ammo;
								var ammo_3  = lava.mg_ammo;
                                var ammo_4  = lava.tow_ammo;
                                var max_1   = lava.he_max;
                                var max_2   = lava.ap_max;
								var max_3   = lava.mg_max;
                                var max_4   = lava.tow_max;
                                var rate_1  = obj_LOGIA_Unit.lavhe_supply_rate;
                                var rate_2  = obj_LOGIA_Unit.lavap_supply_rate;
								var rate_3  = obj_LOGIA_Unit.lavmg_supply_rate;
                                var rate_4  = obj_LOGIA_Unit.lavat_supply_rate;
                                scr_LOGIA_LAVA_Tab(lava.id, ammo_1, ammo_2, ammo_3, ammo_4, max_1, max_2, max_3, max_4, rate_1, rate_2, rate_3, rate_4);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
							case "LAV_B":
                                var ammo_1  = lavb.he_ammo;
                                var ammo_2  = lavb.ap_ammo;
								var ammo_3  = lavb.mg_ammo;
                                var max_1   = lavb.he_max;
                                var max_2   = lavb.ap_max;
								var max_3   = lavb.mg_max;
                                var rate_1  = obj_LOGIA_Unit.lavhe_supply_rate;
                                var rate_2  = obj_LOGIA_Unit.lavap_supply_rate;
								var rate_3  = obj_LOGIA_Unit.lavmg_supply_rate;
                                scr_LOGIA_LAVB_Tab(lavb.id, ammo_1, ammo_2, ammo_3, max_1, max_2, max_3, rate_1, rate_2, rate_3);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "LOGI_A":
                                var ammo_1  = logia.ammo_supply;
                                var ammo_2  = logia.building_supply;
                                var max_1   = logia.ammo_max;
                                var max_2   = logia.building_max;
                                var rate_1  = obj_LOGIA_Unit.logiamo_supply_rate;
                                var rate_2  = obj_LOGIA_Unit.logibld_supply_rate;
                                scr_LOGIA_LOGIA_Tab(logia.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
							case "LOGI_B":
                                var ammo_1  = logib.ammo_supply;
                                var max_1   = logib.ammo_max;
                                var rate_1  = obj_LOGIA_Unit.logiamo_supply_rate;
                                scr_LOGIA_LOGIB_Tab(logib.id, ammo_1, max_1, rate_1);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "DEPOT":
                                var ammo_1  = depot.parts_ammo;
                                var ammo_2  = depot.ammunition_ammo;
                                var max_1   = depot.parts_max;
                                var max_2   = depot.ammunition_max;
                                var rate_1  = obj_LOGIA_Unit.depotbld_supply_rate;
                                var rate_2  = obj_LOGIA_Unit.depotamo_supply_rate;
                                scr_LOGIA_Depot_Tab(depot.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "REPAIR":
                                var ammo_1  = rpr.repair_ammo;
                                var ammo_2  = rpr.mg_ammo;
                                var max_1   = rpr.repair_max;
                                var max_2   = rpr.mg_max;
                                var rate_1  = obj_LOGIA_Unit.repairS_supply_rate;
                                var rate_2  = obj_LOGIA_Unit.repairmg_supply_rate;
                                scr_LOGIA_Repair_Tab(rpr.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "TOW":
                                var ammo_1  = tow.tow_ammo;
                                var max_1   = tow.tow_max;
                                var rate_1  = obj_LOGIA_Unit.towS_supply_rate;
                                scr_LOGIA_TOW_Tab(tow.id, ammo_1, max_1, rate_1);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "MORTAR":
                                var ammo_1  = mtr.mortar_ammo;
                                var max_1   = mtr.mortar_max;
                                var rate_1  = obj_LOGIA_Unit.mortarS_supply_rate;
                                scr_LOGIA_Mortar_Tab(mtr.id, ammo_1, max_1, rate_1);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "NOONE":
                                scr_LOGIA_Noone_Tab();
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            default:
                                scr_LOGIA_Noone_Tab();
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                        }
                        break;
					case "LOGI_B":
                        //Determine if a unit is being targeted for resupply
                        var infa  = instance_place(global.target_x, global.target_y, obj_INFA_Unit);
						var infb  = instance_place(global.target_x, global.target_y, obj_INFB_Unit);
                        var tanka = instance_place(global.target_x, global.target_y, obj_MBTA_Unit);
						var tankb = instance_place(global.target_x, global.target_y, obj_MBTB_Unit);
						var laca  = instance_place(global.target_x, global.target_y, obj_LACA_Unit);
						var lacb  = instance_place(global.target_x, global.target_y, obj_LACB_Unit);
                        var lava  = instance_place(global.target_x, global.target_y, obj_LAVA_Unit);
						var lavb  = instance_place(global.target_x, global.target_y, obj_LAVB_Unit);
                        var logia = instance_place(global.target_x, global.target_y, obj_LOGIA_Unit);
						var logib = instance_place(global.target_x, global.target_y, obj_LOGIB_Unit);
                        var depot = instance_place(global.target_x, global.target_y, obj_Depot_Static);
                        var rpr   = instance_place(global.target_x, global.target_y, obj_Repair_Static);
                        var tow   = instance_place(global.target_x, global.target_y, obj_TOW_Static);
                        var mtr   = instance_place(global.target_x, global.target_y, obj_Mortar_Static);
						var emy   = instance_place(global.target_x, global.target_y, obj_Enemy_Parent);
						var flg   = instance_place(global.target_x, global.target_y, obj_Trees);
						var bld   = instance_place(global.target_x, global.target_y, obj_Houses);
        
                        if infa != noone { 
                            if (infa.nav_confirmed == false) && (infa.action_confirmed == false) && (infa.resupplying == false ) { global.resupply_target = "INF_A"; }
                                else { global.resupply_target = "NOONE"; }
                        }
							else if infb { 
	                            if (infb.nav_confirmed == false) && (infb.action_confirmed == false) && (infb.resupplying == false ) { global.resupply_target = "INF_B"; }
	                                else { global.resupply_target = "NOONE"; }
	                        }
	                            else if tanka { 
	                                if (tanka.nav_confirmed == false) && (tanka.action_confirmed == false) && (tanka.resupplying == false ) { global.resupply_target = "MBT_A"; }
	                                    else { global.resupply_target = "NOONE"; }
	                            }
									else if tankb { 
		                                if (tankb.nav_confirmed == false) && (tankb.action_confirmed == false) && (tankb.resupplying == false ) { global.resupply_target = "MBT_B"; }
		                                    else { global.resupply_target = "NOONE"; }
		                            }
										
										else if lacb { 
				                            if (lacb.nav_confirmed == false) && (lacb.action_confirmed == false) && (lacb.resupplying == false ) { global.resupply_target = "LAC_B"; }
				                                else { global.resupply_target = "NOONE"; }
				                        }
				                            else if lava { 
				                                if (lava.nav_confirmed == false) && (lava.action_confirmed == false) && (lava.resupplying == false ) { global.resupply_target = "LAV_A"; }
				                                    else { global.resupply_target = "NOONE"; }
				                            }
												else if lavb { 
					                                if (lavb.nav_confirmed == false) && (lavb.action_confirmed == false) && (lavb.resupplying == false ) { global.resupply_target = "LAV_B"; }
					                                    else { global.resupply_target = "NOONE"; }
					                            }
					                                else if logia { 
					                                    if (logia.nav_confirmed == false) && (logia.action_confirmed == false) && (logia.resupplying == false ) { global.resupply_target = "LOGI_A"; }
					                                        else { global.resupply_target = "NOONE"; }
					                                }
														else if logib { 
						                                    if (logib.nav_confirmed == false) && (logib.action_confirmed == false) && (logib.resupplying == false ) { global.resupply_target = "LOGI_B"; }
						                                        else { global.resupply_target = "NOONE"; }
						                                }
						                                    else if depot { 
						                                        if (depot.nav_confirmed == false) && (depot.action_confirmed == false) && (depot.resupplying == false ) && (depot.is_manned == true) { global.resupply_target = "DEPOT"; }
						                                            else { global.resupply_target = "NOONE"; }
						                                    }
						                                        else if rpr { 
						                                            if (rpr.nav_confirmed == false) && (rpr.action_confirmed == false) && (rpr.resupplying == false ) && (rpr.is_manned == true) { global.resupply_target = "REPAIR"; }
						                                                else { global.resupply_target = "NOONE"; }
						                                        }
						                                            else if tow { 
						                                                if (tow.nav_confirmed == false) && (tow.action_confirmed == false) && (tow.resupplying == false ) && (tow.is_manned == true) { global.resupply_target = "TOW"; }
						                                                    else { global.resupply_target = "NOONE"; }
						                                            }
						                                                else if mtr { 
						                                                    if (mtr.nav_confirmed == false) && (mtr.action_confirmed == false) && (mtr.resupplying == false ) && (mtr.is_manned == true) { global.resupply_target = "MORTAR"; }
						                                                        else { global.resupply_target = "NOONE"; }
						                                                }
																			else if laca || emy || flg || bld { 
																				global.resupply_target = "NOONE";
												                            }
																				else { global.resupply_target = "SQUAD"; }
                                                            
                        //Determine which tab to display depending on which unit type is targeted    
                        switch global.resupply_target {
                            case "INF_A":
                                var ammo_1  = infa.rifle_ammo;
                                var ammo_2  = infa.rpg_ammo;
                                var ammo_3  = infa.flare_ammo;
                                var max_1   = infa.rifle_max;
                                var max_2   = infa.rpg_max;
                                var max_3   = infa.flare_max;
                                var rate_1  = obj_LOGIB_Unit.rfl_supply_rate;
                                var rate_2  = obj_LOGIB_Unit.rpg_supply_rate;
                                var rate_3  = obj_LOGIB_Unit.flr_supply_rate;
                                scr_LOGIB_INFA_Tab(infa.id, ammo_1, ammo_2, ammo_3, max_1, max_2, max_3, rate_1, rate_2, rate_3);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
							case "INF_B":
                                var ammo_1  = infb.rifle_ammo;
                                var ammo_2  = infb.rpg_ammo;
                                var ammo_3  = infb.flare_ammo;
                                var max_1   = infb.rifle_max;
                                var max_2   = infb.rpg_max;
                                var max_3   = infb.flare_max;
                                var rate_1  = obj_LOGIB_Unit.rfl_supply_rate;
                                var rate_2  = obj_LOGIB_Unit.rpg_supply_rate;
                                var rate_3  = obj_LOGIB_Unit.flr_supply_rate;
                                scr_LOGIB_INFB_Tab(infb.id, ammo_1, ammo_2, ammo_3, max_1, max_2, max_3, rate_1, rate_2, rate_3);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "MBT_A":
                                var ammo_1  = tanka.cannon_ammo;
                                var ammo_2  = tanka.mg_ammo;
                                var max_1   = tanka.cannon_max;
                                var max_2   = tanka.mg_max;
                                var rate_1  = obj_LOGIB_Unit.mbtap_supply_rate;
                                var rate_2  = obj_LOGIB_Unit.mbtmg_supply_rate;
                                scr_LOGIB_MBTA_Tab(tanka.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
							case "MBT_B":
                                var ammo_1  = tankb.cannon_ammo;
                                var ammo_2  = tankb.mg_ammo;
                                var max_1   = tankb.cannon_max;
                                var max_2   = tankb.mg_max;
                                var rate_1  = obj_LOGIB_Unit.mbtap_supply_rate;
                                var rate_2  = obj_LOGIB_Unit.mbtmg_supply_rate;
                                scr_LOGIB_MBTB_Tab(tankb.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
							case "LAC_B":
                                var ammo_1  = lacb.tow_ammo;
                                var max_1   = lacb.tow_max;
                                var rate_1  = obj_LOGIB_Unit.lactow2_supply_rate;
                                scr_LOGIB_LACB_Tab(lacb.id, ammo_1, max_1, rate_1);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "LAV_A":
                                var ammo_1  = lava.he_ammo;
                                var ammo_2  = lava.ap_ammo;
								var ammo_3  = lava.mg_ammo;
                                var ammo_4  = lava.tow_ammo;
                                var max_1   = lava.he_max;
                                var max_2   = lava.ap_max;
								var max_3   = lava.mg_max;
                                var max_4   = lava.tow_max;
                                var rate_1  = obj_LOGIB_Unit.lavhe_supply_rate;
                                var rate_2  = obj_LOGIB_Unit.lavap_supply_rate;
								var rate_3  = obj_LOGIB_Unit.lavmg_supply_rate;
                                var rate_4  = obj_LOGIB_Unit.lavat_supply_rate;
                                scr_LOGIB_LAVA_Tab(lava.id, ammo_1, ammo_2, ammo_3, ammo_4, max_1, max_2, max_3, max_4, rate_1, rate_2, rate_3, rate_4);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
							case "LAV_B":
                                var ammo_1  = lavb.he_ammo;
                                var ammo_2  = lavb.ap_ammo;
								var ammo_3  = lavb.mg_ammo;
                                var max_1   = lavb.he_max;
                                var max_2   = lavb.ap_max;
								var max_3   = lavb.mg_max;
                                var rate_1  = obj_LOGIB_Unit.lavhe_supply_rate;
                                var rate_2  = obj_LOGIB_Unit.lavap_supply_rate;
								var rate_3  = obj_LOGIB_Unit.lavmg_supply_rate;
                                scr_LOGIB_LAVB_Tab(lavb.id, ammo_1, ammo_2, ammo_3, max_1, max_2, max_3, rate_1, rate_2, rate_3);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "LOGI_A":
                                var ammo_1  = logia.ammo_supply;
                                var max_1   = logia.ammo_max;
                                var rate_1  = obj_LOGIB_Unit.logiamo_supply_rate;
                                scr_LOGIB_LOGIA_Tab(logia.id, ammo_1, max_1, rate_1);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
							case "LOGI_B":
                                var ammo_1  = logib.ammo_supply;
                                var max_1   = logib.ammo_max;
                                var rate_1  = obj_LOGIB_Unit.logiamo_supply_rate;
                                scr_LOGIB_LOGIB_Tab(logib.id, ammo_1, max_1, rate_1);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "DEPOT":
                                var ammo_1  = depot.ammunition_ammo;
                                var max_1   = depot.ammunition_max;
                                var rate_1  = obj_LOGIB_Unit.depotamo_supply_rate;
                                scr_LOGIB_Depot_Tab(depot.id, ammo_1, max_1, rate_1);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "REPAIR":
                                var ammo_1  = rpr.mg_ammo;
                                var max_1   = rpr.mg_max;
                                var rate_1  = obj_LOGIB_Unit.repairmg_supply_rate;
                                scr_LOGIB_Repair_Tab(rpr.id, ammo_1, max_1, rate_1);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "TOW":
                                var ammo_1  = tow.tow_ammo;
                                var max_1   = tow.tow_max;
                                var rate_1  = obj_LOGIB_Unit.towS_supply_rate;
                                scr_LOGIB_TOW_Tab(tow.id, ammo_1, max_1, rate_1);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "MORTAR":
                                var ammo_1  = mtr.mortar_ammo;
                                var max_1   = mtr.mortar_max;
                                var rate_1  = obj_LOGIB_Unit.mortarS_supply_rate;
                                scr_LOGIB_Mortar_Tab(mtr.id, ammo_1, max_1, rate_1);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
							case "SQUAD":
                                var max_1  = 1;
                                var rate_1 = 1;
                                scr_LOGIB_SQUAD_Tab(max_1, rate_1);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "NOONE":
                                scr_LOGIB_Noone_Tab();
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            default:
                                scr_LOGIB_Noone_Tab();
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                        }
                        break;
                    case "DEPOT":
                        //Determine if a unit is being targeted for resupply
                        var infa  = instance_place(global.target_x, global.target_y, obj_INFA_Unit);
						var infb  = instance_place(global.target_x, global.target_y, obj_INFB_Unit);
                        var tanka = instance_place(global.target_x, global.target_y, obj_MBTA_Unit);
						var tankb = instance_place(global.target_x, global.target_y, obj_MBTB_Unit);
                        var laca  = instance_place(global.target_x, global.target_y, obj_LACA_Unit);
						var lacb  = instance_place(global.target_x, global.target_y, obj_LACB_Unit);
                        var lava  = instance_place(global.target_x, global.target_y, obj_LAVA_Unit);
						var lavb  = instance_place(global.target_x, global.target_y, obj_LAVB_Unit);
                        var logia = instance_place(global.target_x, global.target_y, obj_LOGIA_Unit);
						var logib = instance_place(global.target_x, global.target_y, obj_LOGIB_Unit);
                        var depot = instance_place(global.target_x, global.target_y, obj_Depot_Static);
                        var rpr   = instance_place(global.target_x, global.target_y, obj_Repair_Static);
                        var tow   = instance_place(global.target_x, global.target_y, obj_TOW_Static);
                        var mtr   = instance_place(global.target_x, global.target_y, obj_Mortar_Static);
        
                        if infa != noone { 
                            if (infa.nav_confirmed == false) && (infa.action_confirmed == false) && (infa.resupplying == false ) { global.resupply_target = "INF_A"; }
                                else { global.resupply_target = "NOONE"; }
                        }
							else if infb { 
	                            if (infb.nav_confirmed == false) && (infb.action_confirmed == false) && (infb.resupplying == false ) { global.resupply_target = "INF_B"; }
	                                else { global.resupply_target = "NOONE"; }
	                        }
	                            else if tanka { 
	                                if (tanka.nav_confirmed == false) && (tanka.action_confirmed == false) && (tanka.resupplying == false ) { global.resupply_target = "MBT_A"; }
	                                    else { global.resupply_target = "NOONE"; }
	                            }
									else if tankb { 
		                                if (tankb.nav_confirmed == false) && (tankb.action_confirmed == false) && (tankb.resupplying == false ) { global.resupply_target = "MBT_B"; }
		                                    else { global.resupply_target = "NOONE"; }
		                            }
		                                else if laca { 
		                                    if (laca.nav_confirmed == false) && (laca.action_confirmed == false) && (laca.resupplying == false ) { global.resupply_target = "LAC_A"; }
		                                        else { global.resupply_target = "NOONE"; }
		                                }
											else if lacb { 
			                                    if (lacb.nav_confirmed == false) && (lacb.action_confirmed == false) && (lacb.resupplying == false ) { global.resupply_target = "LAC_B"; }
			                                        else { global.resupply_target = "NOONE"; }
			                                }
			                                    else if lava { 
			                                        if (lava.nav_confirmed == false) && (lava.action_confirmed == false) && (lava.resupplying == false ) { global.resupply_target = "LAV_A"; }
			                                            else { global.resupply_target = "NOONE"; }
			                                    }
													else if lavb { 
				                                        if (lavb.nav_confirmed == false) && (lavb.action_confirmed == false) && (lavb.resupplying == false ) { global.resupply_target = "LAV_B"; }
				                                            else { global.resupply_target = "NOONE"; }
				                                    }
				                                        else if logia { 
				                                            if (logia.nav_confirmed == false) && (logia.action_confirmed == false) && (logia.resupplying == false ) { global.resupply_target = "LOGI_A"; }
				                                                else { global.resupply_target = "NOONE"; }
				                                        }
															else if logib { 
					                                            if (logib.nav_confirmed == false) && (logib.action_confirmed == false) && (logib.resupplying == false ) { global.resupply_target = "LOGI_B"; }
					                                                else { global.resupply_target = "NOONE"; }
					                                        }
					                                            else if depot { 
					                                                if (depot.nav_confirmed == false) && (depot.action_confirmed == false) && (depot.resupplying == false ) && (depot.is_manned == true) { global.resupply_target = "DEPOT"; }
					                                                    else { global.resupply_target = "NOONE"; }
					                                            }
					                                                else if rpr { 
					                                                    if (rpr.nav_confirmed == false) && (rpr.action_confirmed == false) && (rpr.resupplying == false ) && (rpr.is_manned == true) { global.resupply_target = "REPAIR"; }
					                                                        else { global.resupply_target = "NOONE"; }
					                                                }
					                                                    else if tow { 
					                                                        if (tow.nav_confirmed == false) && (tow.action_confirmed == false) && (tow.resupplying == false ) && (tow.is_manned == true) { global.resupply_target = "TOW"; }
					                                                            else { global.resupply_target = "NOONE"; }
					                                                    }
					                                                        else if mtr { 
					                                                            if (mtr.nav_confirmed == false) && (mtr.action_confirmed == false) && (mtr.resupplying == false ) && (mtr.is_manned == true) { global.resupply_target = "MORTAR"; }
					                                                                else { global.resupply_target = "NOONE"; }
					                                                        }
					                                                            else { global.resupply_target = "NOONE"; }
                                                            
                        //Determine which tab to display depending on which unit type is targeted    
                        switch global.resupply_target {
                            case "INF_A":
                                var ammo_1  = infa.rifle_ammo;
                                var ammo_2  = infa.rpg_ammo;
                                var ammo_3  = infa.flare_ammo;
                                var max_1   = infa.rifle_max;
                                var max_2   = infa.rpg_max;
                                var max_3   = infa.flare_max;
                                var rate_1  = obj_Depot_Static.rfl_supply_rate;
                                var rate_2  = obj_Depot_Static.rpg_supply_rate;
                                var rate_3  = obj_Depot_Static.flr_supply_rate;
                                scr_Depot_INFA_Tab(infa.id, ammo_1, ammo_2, ammo_3, max_1, max_2, max_3, rate_1, rate_2, rate_3);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
							case "INF_B":
                                var ammo_1  = infb.rifle_ammo;
                                var ammo_2  = infb.rpg_ammo;
                                var ammo_3  = infb.flare_ammo;
                                var max_1   = infb.rifle_max;
                                var max_2   = infb.rpg_max;
                                var max_3   = infb.flare_max;
                                var rate_1  = obj_Depot_Static.rfl_supply_rate;
                                var rate_2  = obj_Depot_Static.rpg_supply_rate;
                                var rate_3  = obj_Depot_Static.flr_supply_rate;
                                scr_Depot_INFB_Tab(infb.id, ammo_1, ammo_2, ammo_3, max_1, max_2, max_3, rate_1, rate_2, rate_3);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "MBT_A":
                                var ammo_1  = tanka.cannon_ammo;
                                var ammo_2  = tanka.mg_ammo;
                                var max_1   = tanka.cannon_max;
                                var max_2   = tanka.mg_max;
                                var rate_1  = obj_Depot_Static.mbtap_supply_rate;
                                var rate_2  = obj_Depot_Static.mbtmg_supply_rate;
                                scr_Depot_MBTA_Tab(tanka.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
							case "MBT_B":
                                var ammo_1  = tankb.cannon_ammo;
                                var ammo_2  = tankb.mg_ammo;
                                var max_1   = tankb.cannon_max;
                                var max_2   = tankb.mg_max;
                                var rate_1  = obj_Depot_Static.mbtap_supply_rate;
                                var rate_2  = obj_Depot_Static.mbtmg_supply_rate;
                                scr_Depot_MBTB_Tab(tankb.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "LAC_A":
                                var ammo_1  = laca.depot_supply;
                                var ammo_2  = laca.repair_supply;
                                var ammo_3  = laca.tow_supply;
                                var ammo_4  = laca.mortar_supply;
                                var max_1   = laca.depot_max;
                                var max_2   = laca.repair_max;
                                var max_3   = laca.tow_max;
                                var max_4   = laca.mortar_max;
                                var rate_1  = obj_Depot_Static.lacdpt_supply_rate;
                                var rate_2  = obj_Depot_Static.lacrpr_supply_rate;
                                var rate_3  = obj_Depot_Static.lactow_supply_rate;
                                var rate_4  = obj_Depot_Static.lacmtr_supply_rate;
                                scr_Depot_LACA_Tab(laca.id, ammo_1, ammo_2, ammo_3, ammo_4, max_1, max_2, max_3, max_4, rate_1, rate_2, rate_3, rate_4);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
							case "LAC_B":
								var ammo_1  = lacb.tow_ammo;
                                var max_1   = lacb.tow_max;
                                var rate_1  = obj_Depot_Static.lactow2_supply_rate;
                                scr_Depot_LACB_Tab(lacb.id, ammo_1, max_1, rate_1);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "LAV_A":
                                var ammo_1  = lava.he_ammo;
                                var ammo_2  = lava.ap_ammo;
								var ammo_3  = lava.mg_ammo;
                                var ammo_4  = lava.tow_ammo;
                                var max_1   = lava.he_max;
                                var max_2   = lava.ap_max;
								var max_3   = lava.mg_max;
                                var max_4   = lava.tow_max;
                                var rate_1  = obj_Depot_Static.lavhe_supply_rate;
                                var rate_2  = obj_Depot_Static.lavap_supply_rate;
								var rate_3  = obj_Depot_Static.lavmg_supply_rate;
                                var rate_4  = obj_Depot_Static.lavat_supply_rate;
                                scr_Depot_LAVA_Tab(lava.id, ammo_1, ammo_2, ammo_3, ammo_4, max_1, max_2, max_3, max_4, rate_1, rate_2, rate_3, rate_4);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
							case "LAV_B":
                                var ammo_1  = lavb.he_ammo;
                                var ammo_2  = lavb.ap_ammo;
								var ammo_3  = lavb.mg_ammo;
                                var max_1   = lavb.he_max;
                                var max_2   = lavb.ap_max;
								var max_3   = lavb.mg_max;
                                var rate_1  = obj_Depot_Static.lavhe_supply_rate;
                                var rate_2  = obj_Depot_Static.lavap_supply_rate;
								var rate_3  = obj_Depot_Static.lavmg_supply_rate;
                                scr_Depot_LAVB_Tab(lavb.id, ammo_1, ammo_2, ammo_3, max_1, max_2, max_3, rate_1, rate_2, rate_3);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "LOGI_A":
                                var ammo_1  = logia.ammo_supply;
                                var ammo_2  = logia.building_supply;
                                var max_1   = logia.ammo_max;
                                var max_2   = logia.building_max;
                                var rate_1  = obj_Depot_Static.logiamo_supply_rate;
                                var rate_2  = obj_Depot_Static.logibld_supply_rate;
                                scr_Depot_LOGIA_Tab(logia.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
							case "LOGI_B":
                                var ammo_1  = logib.ammo_supply;
                                var max_1   = logib.ammo_max;
                                var rate_1  = obj_Depot_Static.logiamo_supply_rate;
                                scr_Depot_LOGIB_Tab(logib.id, ammo_1, max_1, rate_1);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "DEPOT":
                                var ammo_1  = depot.parts_ammo;
                                var ammo_2  = depot.ammunition_ammo;
                                var max_1   = depot.parts_max;
                                var max_2   = depot.ammunition_max;
                                var rate_1  = obj_Depot_Static.depotamo_supply_rate;
                                var rate_2  = obj_Depot_Static.depotbld_supply_rate;
                                scr_Depot_Depot_Tab(depot.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "REPAIR":
                                var ammo_1  = rpr.repair_ammo;
                                var ammo_2  = rpr.mg_ammo;
                                var max_1   = rpr.repair_max;
                                var max_2   = rpr.mg_max;
                                var rate_1  = obj_Depot_Static.repairS_supply_rate;
                                var rate_2  = obj_Depot_Static.repairmg_supply_rate;
                                scr_Depot_Repair_Tab(rpr.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "TOW":
                                var ammo_1  = tow.tow_ammo;
                                var max_1   = tow.tow_max;
                                var rate_1  = obj_Depot_Static.towS_supply_rate;
                                scr_Depot_TOW_Tab(tow.id, ammo_1, max_1, rate_1);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "MORTAR":
                                var ammo_1  = mtr.mortar_ammo;
                                var max_1   = mtr.mortar_max;
                                var rate_1  = obj_Depot_Static.mortarS_supply_rate;
                                scr_Depot_Mortar_Tab(mtr.id, ammo_1, max_1, rate_1);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "NOONE":
                                scr_Depot_Noone_Tab();
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            default:
                                scr_Depot_Noone_Tab();
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                        }
                        break;
                    case "REPAIR":
                        scr_Repair_Tab(4, 2);
						if menu_anim == true {
							if menu_anim_count < menu_anim_timer { 
								menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_anim_count ++; 
							}
								else { menu_anim = false; }
						}
                        break;
                    case "TOW": 
                        scr_TOW_Tab(1, 10);
						if menu_anim == true {
							if menu_anim_count < menu_anim_timer { 
								menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_anim_count ++; 
							}
								else { menu_anim = false; }
						}
                        break;
                    case "MORTAR":
                        scr_Mortar_Tab(4, 2);
						if menu_anim == true {
							if menu_anim_count < menu_anim_timer { 
								menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_anim_count ++; 
							}
								else { menu_anim = false; }
						}
                        break;
                    case "SUPPLY SHIP":
                        var logia = instance_place(global.target_x, global.target_y, obj_LOGIA_Unit);
						var logib = instance_place(global.target_x, global.target_y, obj_LOGIB_Unit);
                        var depot = instance_place(global.target_x, global.target_y, obj_Depot_Static);
                        if logia { 
                            if (logia.nav_confirmed == false) && (logia.action_confirmed == false) && (logia.resupplying == false) { global.resupply_target = "LOGI_A"; }
                                else { global.resupply_target = "NOONE"; }
                        }
							else if logib { 
	                            if (logib.nav_confirmed == false) && (logib.action_confirmed == false) && (logib.resupplying == false) { global.resupply_target = "LOGI_B"; }
	                                else { global.resupply_target = "NOONE"; }
	                        }
	                            else if depot { 
	                                if (depot.nav_confirmed == false) && (depot.action_confirmed == false) && (depot.is_manned == true) && (depot.resupplying == false) { global.resupply_target = "DEPOT"; }
	                                    else { global.resupply_target = "NOONE"; }
	                            }
	                                else { global.resupply_target = "NOONE"; }
                                
                         //Determine which tab to display depending on which unit type is targeted    
                        switch global.resupply_target {
                            case "LOGI_A":
                                var ammo_1 = logia.ammo_supply;
                                var ammo_2 = logia.building_supply;
                                var max_1  = logia.ammo_max;
                                var max_2  = logia.building_max;
                                var rate_1 = obj_LogiLanding_Unit.logiamo_supply_rate;//10
                                var rate_2 = obj_LogiLanding_Unit.logibld_supply_rate;//10
                                scr_Ship_LOGIA_Tab(logia.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
							case "LOGI_B":
                                var ammo_1 = logib.ammo_supply;
                                var max_1  = logib.ammo_max;
                                var rate_1 = obj_LogiLanding_Unit.logiamo_supply_rate;//10
                                scr_Ship_LOGIB_Tab(logib.id, ammo_1, max_1, rate_1);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "DEPOT":
                                var ammo_1 = depot.parts_ammo;
                                var ammo_2 = depot.ammunition_ammo;
                                var max_1  = depot.parts_max;
                                var max_2  = depot.ammunition_max;
                                var rate_1 = obj_LogiLanding_Unit.depotbld_supply_rate;//10
                                var rate_2 = obj_LogiLanding_Unit.depotamo_supply_rate;//10
                                scr_Ship_Depot_Tab(depot.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "NOONE":
                                scr_Ship_Noone_Tab();
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            default:
                                scr_Ship_Noone_Tab();
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                        }
                        break;
                    default:
                        break;
                }
            }
                else if global.fire_display == false {
                    if queue_reset == true {
                        queue_reset = false;
                        //Reset all unit's queue status
                        var i;
                        for (i=0; i<ds_list_size(global.selected_list); i+=1) {
                            var unit = ds_list_find_value(global.selected_list, i);
                            with unit {
                                in_queue = false;
                            }
                        }
                    }
                }
        }
}
    //If no units are currently selected
    else {
		if amount_reset == true {
			amount_reset = false;
			global.selected_infa   = 0;
			global.selected_infb   = 0;
			global.selected_mbta   = 0;
			global.selected_mbtb   = 0;
			global.selected_laca   = 0;
			global.selected_lacb   = 0;
			global.selected_lava   = 0;
			global.selected_lavb   = 0;
			global.selected_logia  = 0;
			global.selected_logib  = 0;
			global.selected_depot  = 0;
			global.selected_repair = 0;
			global.selected_tow    = 0;
			global.selected_mortar = 0;
			ds_list_clear(tabs);
			tab_count = 0;
	        //Reset
	        global.menu_create = false;
	        global.fire_display = false;
	        global.reticule_display = false;
	        global.repair_display = false;
	        global.nav_menu = false;
	        global.nav_select = false;
	        global.ammo_tab = "NOONE";
	        global.resupply_target = "NOONE";
	        //INFA
	        infa_rfl_amount = 0;
	        infa_flr_amount = 0;
	        infa_rpg_amount = 0;
			//INFB
	        infb_rfl_amount = 0;
	        infb_flr_amount = 0;
	        infb_rpg_amount = 0;
	        //MBTA
	        mbta_ap_amount = 0;
	        mbta_mg_amount = 0;
			//MBTB
	        mbtb_ap_amount = 0;
	        mbtb_mg_amount = 0;
	        //LACA
	        laca_dpt_amount = 0;
	        laca_rpr_amount = 0;
	        laca_tow_amount = 0;
	        laca_mtr_amount = 0;
			//LACB
			lacb_tow_amount = 0;
	        //LAVA
	        lava_he_amount = 0;
	        lava_ap_amount = 0;
			lava_mg_amount = 0;
			lava_at_amount = 0;
			lava_sq_amount = 0;
			//LAVB
	        lavb_he_amount = 0;
	        lavb_ap_amount = 0;
			lavb_mg_amount = 0;
			lavb_sq_amount = 0;
	        //LOGI
	        infrfl_l_amount  = 0;
	        infrpg_l_amount  = 0;
	        infflr_l_amount  = 0;
	        mbtap_l_amount   = 0;
	        mbtmg_l_amount   = 0;
	        lavhe_l_amount   = 0;
	        lavap_l_amount   = 0;
			lavmg_l_amount   = 0;
	        lavat_l_amount   = 0;
	        lacdpt_l_amount  = 0;
	        lacrpr_l_amount  = 0;
	        lactow_l_amount  = 0;
			lactow2_l_amount = 0;
	        lacmtr_l_amount  = 0;
	        logiamo_l_amount = 0;
	        logibld_l_amount = 0;
			logisqd_l_amount = 0;
	        dptbld_l_amount  = 0;
	        dptamo_l_amount  = 0;
	        rprmg_l_amount   = 0;
	        rprbld_l_amount  = 0;
	        towamo_l_amount  = 0;
	        mtramo_l_amount  = 0;
	        //TOW
	        towS_amount = 0;
	        //Mortar
	        mortarS_amount = 0;
	        //Depot
	        infrfl_d_amount  = 0;
	        infrpg_d_amount  = 0;
	        infflr_d_amount  = 0;
	        mbtap_d_amount   = 0;
	        mbtmg_d_amount   = 0;
	        lavhe_d_amount   = 0;
	        lavap_d_amount   = 0;
			lavmg_d_amount   = 0;
			lavat_d_amount   = 0;
	        lacdpt_d_amount  = 0;
	        lacrpr_d_amount  = 0;
	        lactow_d_amount  = 0;
	        lacmtr_d_amount  = 0;
			lactow2_d_amount = 0;
	        logiamo_d_amount = 0;
	        logibld_d_amount = 0;
	        dptbld_d_amount  = 0;
	        dptamo_d_amount  = 0;
	        rprmg_d_amount   = 0;
	        rprbld_d_amount  = 0;
	        towamo_d_amount  = 0;
	        mtramo_d_amount  = 0;
	        //Resupply Ship
	        logiamo_s_amount = 0;
	        logibld_s_amount = 0;
	        dptbld_s_amount  = 0;
	        dptamo_s_amount  = 0;
	        //Repair
			repair_v_ammo = 0;
	        repair_mg_amount = 0;
	        repair_v_amount = 0;
	        //Temp cost variables
	        global.temp_AP = 0;

	        queue_reset = true;
	        ammo_count = 0;
	        ammo_check = true;
	        shoot_amount = 0;
		}
		if global.game_turn != 0 && obj_CONTROL.show_options != true { global.can_zoom = true; }
    }

