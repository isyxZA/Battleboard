/// @description scr_LOGIA_Depot_Tab(target_unit, parts_ammo, ammunition_ammo, parts_max, ammunition_max, parts_rate, ammunition_rate);
/// @param target_unit
/// @param parts_ammo
/// @param ammunition_ammo
/// @param parts_max
/// @param ammunition_max
/// @param parts_rate
/// @param ammunition_rate
function scr_LOGIA_Depot_Tab(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	/*
	lad_fire_menu[0] = "Parts";
	lad_fire_menu[1] = "Ammunition";
	lad_fire_menu[2] = "Retarget";
	lad_fire_menu[3] = "Cancel";
	*/

	var depotparts_count       = argument1;
	var depotammo_count        = argument2;
	var parts_max              = argument3;
	var ammunition_max         = argument4;
	var depotamo_supply_rate   = argument5;
	var depotbld_supply_rate   = argument6;

	var f0;
	var f1;
	var f2;
	var f3;
	var f4;

	if p_one == true {
		f0 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+global.menu_height    *global.menu_ratio, obj_MOUSE, false, false);
		f1 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
		f2 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*2)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
		f3 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*3)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*4)*global.menu_ratio, obj_MOUSE, false, false);
		f4 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*4)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*5)*global.menu_ratio, obj_MOUSE, false, false);
	}
		else {
			f0 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y                                         , obj_MOUSE, false, false);
			f1 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-global.menu_height*global.menu_ratio    , obj_MOUSE, false, false);
			f2 = collision_rectangle(global.menu_x, global.menu_y-global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
			f3 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*2)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
			f4 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*3)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*4)*global.menu_ratio, obj_MOUSE, false, false);
		}

	var ap_cost = obj_LOGIA_Unit.ap_cost;

	if f0 {
	    global.header_highlight = true;
	    obj_ACTIONMENU.display_menuinfo = false;
	}
	    else if f1 {
	        //RESUPPLY PARTS
	        //Select number of rounds to fire
	        //Increase by a rate of 10
	        if mouse_wheel_up() { 
	            //Check if there is enough supply available
	            if global.dptbld_l_amount <= (global.logi_bld_supply-depotbld_supply_rate) { 
	                //Make sure the unit rpg ammo does not go over max
	                if ((global.dptbld_l_amount+depotparts_count)+depotbld_supply_rate) <= parts_max {
	                    //Check if there is enough turn AP for the move
	                    var m_ap = (global.turn_AP-global.temp_AP);
	                    if m_ap >=  ap_cost {
	                        //Check total unit AP available
	                        var i;
	                        var ap = 0;
	                        if !ds_list_empty(global.selected_logia_list) {
	                            for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                                var unit = ds_list_find_value(global.selected_logia_list, i);
	                                if unit.can_shoot == true { ap += unit.action_points; }
	                            }
	                        }
	                        if ap >= ((global.dptbld_l_amount+depotbld_supply_rate)/depotbld_supply_rate)*ap_cost {
	                            //Add the rounds
	                            global.dptbld_l_amount +=  depotbld_supply_rate; 
	                        }
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 4
	        if mouse_wheel_down() { 
	            if global.dptbld_l_amount >= depotbld_supply_rate { 
	                global.dptbld_l_amount -= depotbld_supply_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if global.dptbld_l_amount < 0 { global.dptbld_l_amount = 0; }
	        if global.dptbld_l_amount > global.logi_bld_supply { global.dptbld_l_amount = global.logi_bld_supply; }
	        //Add to temp AP cost
	        global.temp_AP = (global.dptbld_l_amount/depotbld_supply_rate)*ap_cost;
	        //Set the menu position
	        global.fire_option = 0; 
	        //Switch off camera zoom
	        global.can_zoom  = false;
	        global.header_highlight = false;
	        obj_ACTIONMENU.display_tabinfo = false;
	        obj_ACTIONMENU.display_menuinfo = true;
	    }
	        else if f2 { 
	            //RESUPPLY AMMO
	            //Select number of rounds to fire
	            //Increase by a rate of 10
	            if mouse_wheel_up() { 
	                //Check if there is enough supply available
	                if global.dptamo_l_amount <= (global.ammo_supply-depotamo_supply_rate) {
	                    //Make sure the unit ammo does not go over max
	                    if ((global.dptamo_l_amount+depotammo_count)+depotamo_supply_rate) <= ammunition_max {
	                        //Check if there is enough turn AP for the move
	                        var m_ap = (global.turn_AP-global.temp_AP);
	                        if m_ap >=  ap_cost {
	                            //Check total unit AP available
	                            var i;
	                            var ap = 0;
	                            if !ds_list_empty(global.selected_logia_list) {
	                                for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                                    var unit = ds_list_find_value(global.selected_logia_list, i);
	                                    if unit.can_shoot == true { ap += unit.action_points; }
	                                }
	                            }
	                            if ap >= ((global.dptamo_l_amount+depotamo_supply_rate)/depotamo_supply_rate)*ap_cost {
	                                //Add the rounds
	                                global.dptamo_l_amount +=  depotamo_supply_rate; 
	                            }
	                        }
	                    }
	                } 
	            }
	            //Decrease by a rate of 10
	            if mouse_wheel_down() { 
	                if global.dptamo_l_amount >= depotamo_supply_rate { 
	                    global.dptamo_l_amount -= depotamo_supply_rate; 
	                } 
	            }
	            //Clamp the value between zero and the max available rounds
	            if global.dptamo_l_amount < 0 { global.dptamo_l_amount = 0; }
	            if global.dptamo_l_amount > global.logi_amo_supply { global.dptamo_l_amount = global.ammo_supply; }
	            //Add to temp AP cost
	            global.temp_AP = (global.dptamo_l_amount/depotamo_supply_rate)*ap_cost;
	            //Set the menu position
	            global.fire_option = 1; 
	            //Switch off camera zoom
	            global.can_zoom  = false;
	            global.header_highlight = false;
	            obj_ACTIONMENU.display_tabinfo = false;
	            obj_ACTIONMENU.display_menuinfo = true;
	        }
	        else if f3 {
	            //RE-TARGET 
	            global.fire_option = 2; 
	            global.can_zoom  = true;
	            global.header_highlight = false;
	            obj_ACTIONMENU.display_tabinfo = false;
	            obj_ACTIONMENU.display_menuinfo = false;
	        }
	            else if f4 {
	                //CANCEL
	                global.fire_option = 3; 
	                global.can_zoom  = true;  
	                global.header_highlight = false;
	                obj_ACTIONMENU.display_tabinfo = false;
	                obj_ACTIONMENU.display_menuinfo = false;
	            }
	                else { 
	                    global.fire_option = 0; 
	                    global.can_zoom  = true;
	                    global.header_highlight = false;
	                    obj_ACTIONMENU.display_tabinfo = false;
	                    obj_ACTIONMENU.display_menuinfo = false;
	                }
            
	if mouse_check_button_released(mb_left) {
	    if global.my_turn == true {
	        if f0 { 
	            //Switch ammo tab
				if global.selected_logib != 0 {
			        global.ammo_tab = "LOGI_B";
					//Remove the surface
					if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
			        ammo_check = true;
			    }
		            else if global.selected_depot != 0 {
		                global.ammo_tab = "DEPOT";
						//Remove the surface
						if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                ammo_check = true;
		            }
		                else if global.selected_repair != 0 {
		                    global.ammo_tab = "REPAIR";
							//Remove the surface
							if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                    ammo_check = true;
		                }
		                    else if global.selected_tow != 0 {
		                        global.ammo_tab = "TOW";
								//Remove the surface
								if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                        ammo_check = true;
		                    }
		                        else if global.selected_mortar != 0 {
		                            global.ammo_tab = "MORTAR";
									//Remove the surface
									if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                            ammo_check = true;
		                        }
		                            else if global.selected_infa != 0 {
		                                global.ammo_tab = "INF_A";
										//Remove the surface
										if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                                ammo_check = true;
		                            }
										else if global.selected_infb != 0 {
			                                global.ammo_tab = "INF_B";
											//Remove the surface
											if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
			                                ammo_check = true;
			                            }
			                                else if global.selected_mbta != 0 {
			                                    global.ammo_tab = "MBT_A"; 
												//Remove the surface
												if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
			                                    ammo_check = true;
			                                }
												else if global.selected_mbtb != 0 {
				                                    global.ammo_tab = "MBT_B"; 
													//Remove the surface
													if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
				                                    ammo_check = true;
				                                }
				                                    else if global.selected_laca != 0 {
				                                        global.ammo_tab = "LAC_A"; 
														//Remove the surface
														if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
				                                        ammo_check = true;
				                                    }
														else if global.selected_lacb != 0 {
					                                        global.ammo_tab = "LAC_B"; 
															//Remove the surface
															if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
					                                        ammo_check = true;
					                                    }
					                                        else if global.selected_lava != 0 {
					                                            global.ammo_tab = "LAV_A"; 
																//Remove the surface
																if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
					                                            ammo_check = true;
					                                        }
																else if global.selected_lavb != 0 {
						                                            global.ammo_tab = "LAV_B"; 
																	//Remove the surface
																	if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
						                                            ammo_check = true;
						                                        }
						                                            else {
						                                            }
	        }
	            else if f1 {
	                //TRANSFER PARTS SUPPLY
	                //Remove cost
	                if global.dptbld_l_amount != 0 {
	                    var t=0;
	                    while (global.dptbld_l_amount >= depotbld_supply_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_logia_list, i);
	                            if (u.can_shoot == true) && (u.building_supply >= depotbld_supply_rate) {
	                                if (u.action_points >= ap_cost) {
	                                    global.dptbld_l_amount -= depotbld_supply_rate;
	                                    if global.dptbld_l_amount >= 0 { 
	                                        if u.shoot_amount == 0 { 
	                                            u.action_confirmed = true;
	                                            global.units_running += 1; 
	                                            u.shoot_building = true;
	                                            u.weapon         = "PARTS";
	                                            u.target_x = global.target_x;
	                                            u.target_y = global.target_y;
	                                            u.resupply_unit = argument0;
	                                            u.resupply_unit.resupplying = true;
	                                            u.alert_display = true;
	                                            u.alert_colour = c_red;
	                                            u.alarm[3] = global.tick_rate*3;
	                                        }
	                                        u.shoot_amount    += 1; 
	                                        u.building_supply -= depotbld_supply_rate;
	                                        global.turn_AP    -= ap_cost;
	                                        u.action_points   -= ap_cost;
	                                        u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                    }
	                                }
	                            }
	                        }
	                        if t >= 200 { 
	                            global.dptbld_l_amount = 0;
	                            global.targeting_error = true;
	                        } 
	                    }
	                }
	                //Hold shift to keep targeting
	                if keyboard_check_direct(vk_shift) {
	                    var i;
	                    for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                        var unit = ds_list_find_value(global.selected_logia_list, i);
	                        with unit { if action_confirmed == true { selected = false; } }
	                    }
	                    ammo_check = true;
	                    global.dptbld_l_amount = 0;
	                }
	                    else { 
	                        global.menu_create = false;
	                        global.reticule_display = false; 
							//Reset menu animation
							menu_anim = true;
							menu_anim_count = 0;
							menu_alpha = 0;
							menu_scl = 0;
							//Remove the surface
							if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                    }
	                if global.temp_AP > 0 { 
	                    global.draw_apcost = true; 
	                    obj_CONTROL.ap_cost = global.temp_AP;
	                }
	                global.fire_display = false;
	                global.can_zoom  = true;
	                queue_reset = true;
	            }
	                else if f2 {
	                    //TRANSFER AMMO SUPPLY
	                    //Remove ammo cost
	                    if global.dptamo_l_amount != 0 {
	                        var t=0;
	                        while (global.dptamo_l_amount >= depotamo_supply_rate) {
	                            t+=1;
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                                var u = ds_list_find_value(global.selected_logia_list, i);
	                                if (u.can_shoot == true) && (u.ammo_supply >= depotamo_supply_rate) {
	                                    if (u.action_points >= ap_cost) {
	                                        global.dptamo_l_amount -= depotamo_supply_rate;
	                                        if global.dptamo_l_amount >= 0 { 
	                                            if u.shoot_amount == 0 { 
	                                                u.action_confirmed = true;
	                                                global.units_running += 1; 
	                                                u.shoot_ammo = true;
	                                                u.weapon     = "AMMO";
	                                                u.target_x = global.target_x;
	                                                u.target_y = global.target_y;
	                                                u.resupply_unit = argument0;
	                                                u.resupply_unit.resupplying = true;
	                                                u.alert_display = true;
	                                                u.alert_colour = c_red;
	                                                u.alarm[3] = global.tick_rate*3;
	                                            }
	                                            u.shoot_amount   += 1; 
	                                            u.ammo_supply    -= depotamo_supply_rate;
	                                            global.turn_AP   -= ap_cost;
	                                            u.action_points  -= ap_cost;
	                                            u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                        }
	                                    }
	                                }
	                            }
	                            if t >= 200 { 
	                                global.dptamo_l_amount = 0;
	                                global.targeting_error = true;
	                            } 
	                        }
	                    }
	                    //Hold shift to keep targeting
	                    if keyboard_check_direct(vk_shift) {
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_logia_list, i);
	                            with unit { if action_confirmed == true { selected = false; } }
	                        }
	                        ammo_check = true;
	                        global.dptamo_l_amount = 0;
	                    }
	                        else { 
	                            global.menu_create = false;
	                            global.reticule_display = false; 
								//Reset menu animation
								menu_anim = true;
								menu_anim_count = 0;
								menu_alpha = 0;
								menu_scl = 0;
								//Remove the surface
								if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                        }
	                    if global.temp_AP > 0 { 
	                        global.draw_apcost = true; 
	                        obj_CONTROL.ap_cost = global.temp_AP;
	                    }
	                    global.fire_display = false;
	                    global.can_zoom  = true;
	                    queue_reset = true;
	            }
	                 else if f3 { 
	                    //RE-TARGET
	                    //Stop drawing fire menu and display the targeting reticule
	                    global.fire_display = false;
	                    global.reticule_display = true;
						//Reset menu animation
						menu_anim = true;
						menu_anim_count = 0;
						menu_alpha = 0;
						menu_scl = 0;
						//Remove the surface
						if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                    queue_reset = true;
	                }
	                    else if f4 { 
	                        //CANCEL
	                        //Stop drawing all menus
	                        global.fire_display = false;
	                        global.reticule_display = false;
	                        global.menu_create = false;
							//Reset menu animation
							menu_anim = true;
							menu_anim_count = 0;
							menu_alpha = 0;
							menu_scl = 0;
							//Remove the surface
							if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                        queue_reset = true;
	                    }
	    }
	}




}