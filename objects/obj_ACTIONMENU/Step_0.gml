if (!ds_list_empty(global.selected_list)) || (global.supply_ship != noone) {
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
                                    case "TANK":
                                    case "ENGINEER":
                                    case "BTR":
                                    case "LOGI":
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
                                    global.repair_ammo = 0;
                                    if !ds_list_empty(global.repair_list) {
                                        var i;
                                        for (i=0; i<ds_list_size(global.repair_list); i+=1) {
                                            var unit = ds_list_find_value(global.repair_list, i);
                                            if unit.manned_unit != noone {
												if unit.manned_unit.selected == true { global.repair_ammo += unit.repair_ammo; }
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
                                            case "TANK":
                                            case "ENGINEER":
                                            case "BTR":
                                            case "LOGI":
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
                    //Calculate the mp cost
                    if !ds_list_empty(global.selected_list) {
                        var ii;
                        global.temp_AP = 0;
                        for (ii=0; ii<ds_list_size(global.selected_list); ii+=1) {
                            var u2 = ds_list_find_value(global.selected_list, ii);
                            global.temp_AP += (u2.move_amount*u2.mp_cost);
                        }
                    } 
                    if (global.turn_AP-global.temp_AP) < 0 { global.navigation_error = true; }
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
                    if global.selected_infantry != 0 { global.ammo_tab = "INFANTRY"; }
                        else if global.selected_tank != 0 { global.ammo_tab = "TANK"; }
                            else if global.selected_engineer != 0 { global.ammo_tab = "ENGINEER"; }
                                else if global.selected_btr != 0 { global.ammo_tab = "BTR"; }
                                    else if global.selected_logi != 0 { global.ammo_tab = "LOGI"; }
                                        else if global.selected_depot != 0 { global.ammo_tab = "DEPOT"; }
                                            else if global.selected_repair != 0 { global.ammo_tab = "REPAIR"; }
                                                else if global.selected_tow != 0 { global.ammo_tab = "TOW"; }
                                                    else if global.selected_mortar != 0 { global.ammo_tab = "MORTAR"; }
                                                        else if global.supply_ship != noone { global.ammo_tab = "SUPPLY SHIP"; }
                                                            else { global.ammo_tab = "NOONE"; }
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
                    global.ammunition_ammo = 0;
                    global.parts_ammo = 0;
                    global.repair_mg_ammo = 0;
                    if !ds_list_empty(global.selected_list) {
                        var i;
                        for (i=0; i<ds_list_size(global.selected_list); i+=1) {
                            var unit = ds_list_find_value(global.selected_list, i);
                            with unit {
                                if unit_type == global.ammo_tab {
                                      switch unit_type {
                                        case "INFANTRY":
                                            //If the unit has line of fire then add its ammo to available rounds
                                            if can_shoot == true {
                                                global.rifle_ammo += rifle_ammo;
                                                global.flare_ammo += flare_ammo;
                                                global.rpg_ammo   += rpg_ammo;
                                            }
                                            break;
                                        case "TANK":
                                            //If the unit has line of fire then add its ammo to available rounds
                                            if can_shoot == true {
                                                global.cannon_ammo  += cannon_ammo;
                                                global.mg_tank_ammo += mg_ammo;
                                            }
                                            break;
                                        case "ENGINEER":
                                            //If the unit has line of fire then add its ammo to available rounds
                                            if can_shoot == true {
                                                global.depot_supply  += depot_supply;
                                                global.repair_supply += repair_supply;
                                                global.tow_supply    += tow_supply;
                                                global.mortar_supply += mortar_supply;
                                            }
                                            break;
                                        case "BTR":
                                            //If the unit has line of fire then add its ammo to available rounds
                                            if can_shoot == true {
                                                global.he_ammo += he_ammo;
                                                global.ap_ammo += ap_ammo;
                                            }
                                            break;
                                        case "LOGI":
                                            //If the unit has line of fire then add its ammo to available rounds
                                            if can_shoot == true {
                                                global.ammo_supply     += ammo_supply;
                                                global.building_supply += building_supply;
                                            }
                                            break;
                                        case "DEPOT":
                                            //If the unit has line of fire then add its ammo to available rounds
                                            if can_shoot == true {
                                                global.ammunition_ammo += ammunition_ammo;
                                                global.parts_ammo      += parts_ammo;
                                            }
                                            break;
                                        case "REPAIR":
                                            //If the unit has line of fire then add its ammo to available rounds
                                            if can_shoot == true {
                                                global.repair_mg_ammo += mg_ammo;
                                            }
                                            break;
                                        case "TOW":
                                            //If the unit has line of fire then add its ammo to available rounds
                                            if can_shoot == true {
                                                global.tow_ammo     += tow_ammo;
                                            }
                                            break;
                                        case "MORTAR":
                                            //If the unit has line of fire then add its ammo to available rounds
                                            if can_shoot == true {
                                                global.mortar_ammo  += mortar_ammo;
                                            }
                                            break;
                                        default:
                                            break;
                                      }
                                }
                            }
                        }
                    }
                        else {
                            if global.supply_ship != noone {
                                global.lc_ammunition_ammo = 0;
                                global.lc_parts_ammo  = 0;
                                if global.supply_ship.can_shoot == true {
                                    global.lc_ammunition_ammo += global.supply_ship.ammunition_ammo;
                                    global.lc_parts_ammo      += global.supply_ship.parts_ammo;
                                }
                            }
                        }
                }
                //Create menu selection boxes for fire menu according to unit type
                switch global.ammo_tab {
                    case "INFANTRY":
                        scr_Infantry_Tab(4, 1, 1, 2);
						if menu_anim == true {
							if menu_anim_count < menu_anim_timer { 
								menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_anim_count ++; 
							}
								else { menu_anim = false; }
						}
                        break;
                    case "TANK":
                        scr_Tank_Tab(1, 4, 4, 2);
						if menu_anim == true {
							if menu_anim_count < menu_anim_timer { 
								menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_anim_count ++; 
							}
								else { menu_anim = false; }
						}
                        break;
                    case "ENGINEER":
                        scr_Engineer_Tab(1, 1, 1, 1, 10);
						if menu_anim == true {
							if menu_anim_count < menu_anim_timer { 
								menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_anim_count ++; 
							}
								else { menu_anim = false; }
						}
                        break;
                    case "BTR":
                        scr_BTR_Tab(4, 4, 4);
						if menu_anim == true {
							if menu_anim_count < menu_anim_timer { 
								menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
								menu_anim_count ++; 
							}
								else { menu_anim = false; }
						}
                        break;
                    case "LOGI":
                        //Determine if a unit is being targeted for resupply
                        var inf   = instance_place(global.target_x, global.target_y, obj_Soldier_Unit);
                        var tank  = instance_place(global.target_x, global.target_y, obj_Tank_Unit);
                        var eng   = instance_place(global.target_x, global.target_y, obj_Engineer_Unit);
                        var btr   = instance_place(global.target_x, global.target_y, obj_BTR_Unit);
                        var logi  = instance_place(global.target_x, global.target_y, obj_Logi_Unit);
                        var depot = instance_place(global.target_x, global.target_y, obj_Depot_Static);
                        var rpr   = instance_place(global.target_x, global.target_y, obj_Repair_Static);
                        var tow   = instance_place(global.target_x, global.target_y, obj_TOW_Static);
                        var mtr   = instance_place(global.target_x, global.target_y, obj_Mortar_Static);
        
                        if inf != noone { 
                            if (inf.nav_confirmed == false) && (inf.action_confirmed == false) && (inf.resupplying == false ) { global.resupply_target = "INFANTRY"; }
                                else { global.resupply_target = "NOONE"; }
                        }
                            else if tank { 
                                if (tank.nav_confirmed == false) && (tank.action_confirmed == false) && (tank.resupplying == false ) { global.resupply_target = "TANK"; }
                                    else { global.resupply_target = "NOONE"; }
                            }
                                else if eng { 
                                    if (eng.nav_confirmed == false) && (eng.action_confirmed == false) && (eng.resupplying == false ) { global.resupply_target = "ENGINEER"; }
                                        else { global.resupply_target = "NOONE"; }
                                }
                                    else if btr { 
                                        if (btr.nav_confirmed == false) && (btr.action_confirmed == false) && (btr.resupplying == false ) { global.resupply_target = "BTR"; }
                                            else { global.resupply_target = "NOONE"; }
                                    }
                                        else if logi { 
                                            if (logi.nav_confirmed == false) && (logi.action_confirmed == false) && (logi.resupplying == false ) { global.resupply_target = "LOGI"; }
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
                            case "INFANTRY":
                                var ammo_1  = inf.rifle_ammo;
                                var ammo_2  = inf.rpg_ammo;
                                var ammo_3  = inf.flare_ammo;
                                var max_1   = inf.rifle_max;
                                var max_2   = inf.rpg_max;
                                var max_3   = inf.flare_max;
                                var rate_1  = obj_Logi_Unit.rifle_supply_rate;
                                var rate_2  = obj_Logi_Unit.rpg_supply_rate;
                                var rate_3  = obj_Logi_Unit.flare_supply_rate;
                                scr_Logi_Infantry_Tab(inf.id, ammo_1, ammo_2, ammo_3, max_1, max_2, max_3, rate_1, rate_2, rate_3);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "TANK":
                                var ammo_1  = tank.cannon_ammo;
                                var ammo_2  = tank.mg_ammo;
                                var max_1   = tank.cannon_max;
                                var max_2   = tank.mg_max;
                                var rate_1  = obj_Logi_Unit.cannon_supply_rate;
                                var rate_2  = obj_Logi_Unit.mg_supply_rate;
                                scr_Logi_Tank_Tab(tank.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "ENGINEER":
                                var ammo_1  = eng.depot_supply;
                                var ammo_2  = eng.repair_supply;
                                var ammo_3  = eng.tow_supply;
                                var ammo_4  = eng.mortar_supply;
                                var max_1   = eng.depot_max;
                                var max_2   = eng.repair_max;
                                var max_3   = eng.tow_max;
                                var max_4   = eng.mortar_max;
                                var rate_1  = obj_Logi_Unit.depot_supply_rate;
                                var rate_2  = obj_Logi_Unit.repair_supply_rate;
                                var rate_3  = obj_Logi_Unit.tow_supply_rate;
                                var rate_4  = obj_Logi_Unit.mortar_supply_rate;
                                scr_Logi_Engineer_Tab(eng.id, ammo_1, ammo_2, ammo_3, ammo_4, max_1, max_2, max_3, max_4, rate_1, rate_2, rate_3, rate_4);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "BTR":
                                var ammo_1  = btr.he_ammo;
                                var ammo_2  = btr.ap_ammo;
                                var max_1   = btr.he_max;
                                var max_2   = btr.ap_max;
                                var rate_1  = obj_Logi_Unit.he_supply_rate;
                                var rate_2  = obj_Logi_Unit.ap_supply_rate;
                                scr_Logi_BTR_Tab(btr.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "LOGI":
                                var ammo_1  = logi.ammo_supply;
                                var ammo_2  = logi.building_supply;
                                var max_1   = logi.ammo_max;
                                var max_2   = logi.building_max;
                                var rate_1  = obj_Logi_Unit.ammo_supply_rate;
                                var rate_2  = obj_Logi_Unit.building_supply_rate;
                                scr_Logi_Logi_Tab(logi.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
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
                                var rate_1  = obj_Logi_Unit.depotparts_supply_rate;
                                var rate_2  = obj_Logi_Unit.depotammo_supply_rate;
                                scr_Logi_Depot_Tab(depot.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
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
                                var rate_1  = obj_Logi_Unit.repairS_supply_rate;
                                var rate_2  = obj_Logi_Unit.repairmg_supply_rate;
                                scr_Logi_Repair_Tab(rpr.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
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
                                var rate_1  = obj_Logi_Unit.towS_supply_rate;
                                scr_Logi_TOW_Tab(tow.id, ammo_1, max_1, rate_1);
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
                                var rate_1  = obj_Logi_Unit.mortarS_supply_rate;
                                scr_Logi_Mortar_Tab(mtr.id, ammo_1, max_1, rate_1);
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
                                scr_Logi_Noone_Tab();
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
                                scr_Logi_Noone_Tab();
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
                        var inf   = instance_place(global.target_x, global.target_y, obj_Soldier_Unit);
                        var tank  = instance_place(global.target_x, global.target_y, obj_Tank_Unit);
                        var eng   = instance_place(global.target_x, global.target_y, obj_Engineer_Unit);
                        var btr   = instance_place(global.target_x, global.target_y, obj_BTR_Unit);
                        var logi  = instance_place(global.target_x, global.target_y, obj_Logi_Unit);
                        var depot = instance_place(global.target_x, global.target_y, obj_Depot_Static);
                        var rpr   = instance_place(global.target_x, global.target_y, obj_Repair_Static);
                        var tow   = instance_place(global.target_x, global.target_y, obj_TOW_Static);
                        var mtr   = instance_place(global.target_x, global.target_y, obj_Mortar_Static);
        
                        if inf != noone { 
                            if (inf.nav_confirmed == false) && (inf.action_confirmed == false) && (inf.resupplying == false ) { global.resupply_target = "INFANTRY"; }
                                else { global.resupply_target = "NOONE"; }
                        }
                            else if tank { 
                                if (tank.nav_confirmed == false) && (tank.action_confirmed == false) && (tank.resupplying == false ) { global.resupply_target = "TANK"; }
                                    else { global.resupply_target = "NOONE"; }
                            }
                                else if eng { 
                                    if (eng.nav_confirmed == false) && (eng.action_confirmed == false) && (eng.resupplying == false ) { global.resupply_target = "ENGINEER"; }
                                        else { global.resupply_target = "NOONE"; }
                                }
                                    else if btr { 
                                        if (btr.nav_confirmed == false) && (btr.action_confirmed == false) && (btr.resupplying == false ) { global.resupply_target = "BTR"; }
                                            else { global.resupply_target = "NOONE"; }
                                    }
                                        else if logi { 
                                            if (logi.nav_confirmed == false) && (logi.action_confirmed == false) && (logi.resupplying == false ) { global.resupply_target = "LOGI"; }
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
                            case "INFANTRY":
                                var ammo_1  = inf.rifle_ammo;
                                var ammo_2  = inf.rpg_ammo;
                                var ammo_3  = inf.flare_ammo;
                                var max_1   = inf.rifle_max;
                                var max_2   = inf.rpg_max;
                                var max_3   = inf.flare_max;
                                var rate_1  = obj_Depot_Static.rifle_supply_rate;
                                var rate_2  = obj_Depot_Static.rpg_supply_rate;
                                var rate_3  = obj_Depot_Static.flare_supply_rate;
                                scr_Depot_Infantry_Tab(inf.id, ammo_1, ammo_2, ammo_3, max_1, max_2, max_3, rate_1, rate_2, rate_3);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "TANK":
                                var ammo_1  = tank.cannon_ammo;
                                var ammo_2  = tank.mg_ammo;
                                var max_1   = tank.cannon_max;
                                var max_2   = tank.mg_max;
                                var rate_1  = obj_Depot_Static.cannon_supply_rate;
                                var rate_2  = obj_Depot_Static.mg_supply_rate;
                                scr_Depot_Tank_Tab(tank.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "ENGINEER":
                                var ammo_1  = eng.depot_supply;
                                var ammo_2  = eng.repair_supply;
                                var ammo_3  = eng.tow_supply;
                                var ammo_4  = eng.mortar_supply;
                                var max_1   = eng.depot_max;
                                var max_2   = eng.repair_max;
                                var max_3   = eng.tow_max;
                                var max_4   = eng.mortar_max;
                                var rate_1  = obj_Depot_Static.depot_supply_rate;
                                var rate_2  = obj_Depot_Static.repair_supply_rate;
                                var rate_3  = obj_Depot_Static.tow_supply_rate;
                                var rate_4  = obj_Depot_Static.mortar_supply_rate;
                                scr_Depot_Engineer_Tab(eng.id, ammo_1, ammo_2, ammo_3, ammo_4, max_1, max_2, max_3, max_4, rate_1, rate_2, rate_3, rate_4);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "BTR":
                                var ammo_1  = btr.he_ammo;
                                var ammo_2  = btr.ap_ammo;
                                var max_1   = btr.he_max;
                                var max_2   = btr.ap_max;
                                var rate_1  = obj_Depot_Static.he_supply_rate;
                                var rate_2  = obj_Depot_Static.ap_supply_rate;
                                scr_Depot_BTR_Tab(btr.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
								if menu_anim == true {
									if menu_anim_count < menu_anim_timer { 
										menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
										menu_anim_count ++; 
									}
										else { menu_anim = false; }
								}
                                break;
                            case "LOGI":
                                var ammo_1  = logi.ammo_supply;
                                var ammo_2  = logi.building_supply;
                                var max_1   = logi.ammo_max;
                                var max_2   = logi.building_max;
                                var rate_1  = obj_Depot_Static.ammo_supply_rate;
                                var rate_2  = obj_Depot_Static.building_supply_rate;
                                scr_Depot_Logi_Tab(logi.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
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
                                var rate_1  = obj_Depot_Static.depotammo_supply_rate;
                                var rate_2  = obj_Depot_Static.depotparts_supply_rate;
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
                        var logi  = instance_place(global.target_x, global.target_y, obj_Logi_Unit);
                        var depot = instance_place(global.target_x, global.target_y, obj_Depot_Static);
                        if logi { 
                            if (logi.nav_confirmed == false) && (logi.action_confirmed == false) && (logi.resupplying == false) { global.resupply_target = "LOGI"; }
                                else { global.resupply_target = "NOONE"; }
                        }
                            else if depot { 
                                if (depot.nav_confirmed == false) && (depot.action_confirmed == false) && (depot.is_manned == true) && (depot.resupplying == false) { global.resupply_target = "DEPOT"; }
                                    else { global.resupply_target = "NOONE"; }
                            }
                                else { global.resupply_target = "NOONE"; }
                                
                         //Determine which tab to display depending on which unit type is targeted    
                        switch global.resupply_target {
                            case "LOGI":
                                var ammo_1  = logi.ammo_supply;
                                var ammo_2  = logi.building_supply;
                                var max_1   = logi.ammo_max;
                                var max_2   = logi.building_max;
                                var rate_1  = obj_LogiLanding_Unit.ammo_supply_rate;//10
                                var rate_2  = obj_LogiLanding_Unit.building_supply_rate;//10
                                scr_SupplyShip_Logi_Tab(logi.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
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
                                var rate_1  = obj_LogiLanding_Unit.depotparts_supply_rate;//10
                                var rate_2  = obj_LogiLanding_Unit.depotammo_supply_rate;//10
                                scr_SupplyShip_Depot_Tab(depot.id, ammo_1, ammo_2, max_1, max_2, rate_1, rate_2);
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
                                scr_SupplyShip_Noone_Tab();
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
                                scr_SupplyShip_Noone_Tab();
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
        //Reset
        global.menu_create = false;
        global.fire_display = false;
        global.reticule_display = false;
        global.repair_display = false;
        global.nav_menu = false;
        global.nav_select = false;
        global.ammo_tab = "NOONE";
        global.resupply_target = "NOONE";
        //Infantry
        global.rifle_amount = 0;
        global.flare_amount = 0;
        global.rpg_amount = 0;
        //Tank 
        global.cannon_amount = 0;
        global.mg_tank_amount = 0;
        //Engineer
        global.depot_amount = 0;
        global.repair_amount = 0;
        global.tow_amount = 0;
        global.mortar_amount = 0;
        //BTR
        global.he_amount = 0;
        global.ap_amount = 0;
        //Logi
        global.rifle_l_amount = 0;
        global.rpg_l_amount = 0;
        global.flare_l_amount = 0;
        global.cannon_l_amount = 0;
        global.tankmg_l_amount = 0;
        global.he_l_amount = 0;
        global.ap_l_amount = 0;
        global.depot_l_amount = 0;
        global.repair_l_amount = 0;
        global.tow_l_amount = 0;
        global.mortar_l_amount = 0;
        global.ammo_l_amount = 0;
        global.building_l_amount = 0;
        global.depotParts_l_amount = 0;
        global.depotAmmo_l_amount = 0;
        global.repairmg_l_amount = 0;
        global.repairS_l_amount = 0;
        global.towS_l_amount = 0;
        global.mortarS_l_amount = 0;
        //TOW
        global.towS_amount = 0;
        //Mortar
        global.mortarS_amount = 0;
        //Depot
        global.rifle_d_amount = 0;
        global.rpg_d_amount = 0;
        global.flare_d_amount = 0;
        global.cannon_d_amount = 0;
        global.tankmg_d_amount = 0;
        global.he_d_amount = 0;
        global.ap_d_amount = 0;
        global.depot_d_amount = 0;
        global.repair_d_amount = 0;
        global.tow_d_amount = 0;
        global.mortar_d_amount = 0;
        global.ammo_d_amount = 0;
        global.building_d_amount = 0;
        global.depotParts_d_amount = 0;
        global.depotAmmo_d_amount = 0;
        global.repairmg_d_amount = 0;
        global.repairS_d_amount = 0;
        global.towS_d_amount = 0;
        global.mortarS_d_amount = 0;
        //Resupply Ship
        global.ammo_s_amount = 0;
        global.building_s_amount = 0;
        global.depotParts_s_amount = 0;
        global.depotAmmo_s_amount = 0;
        //Repair
		global.repair_ammo = 0;
        global.repair_mg_amount = 0;
        global.repair_v_amount = 0;
        //Temp cost variables
        global.temp_AP = 0;
        //global.temp_MP = 0;
        
        if global.game_turn != 0 { global.can_zoom = true; }

        queue_reset = true;
        ammo_count = 0;
        ammo_check = true;
        shoot_amount = 0;
    }

