/// @description scr_LOGIA_MBTB_Tab(target_unit, cannon_ammo, mg_ammo, cannon_max, mg_max, cannon_rate, mg_rate);
/// @param target_unit
/// @param cannon_ammo
/// @param mg_ammo
/// @param cannon_max
/// @param mg_max
/// @param cannon_rate
/// @param mg_rate
function scr_LOGIA_MBTB_Tab(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	/*
	lata_fire_menu[0] = "Cannon Ammo";
	lata_fire_menu[1] = "MG Ammo";
	lata_fire_menu[2] = "Retarget";
	lata_fire_menu[3] = "Cancel";
	*/

	var cannon_count      = argument1;
	var mg_count          = argument2;
	var cannon_max        = argument3;
	var mg_max            = argument4;
	var mbtap_supply_rate = argument5;
	var mbtmg_supply_rate = argument6;

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
	        //RESUPPLY CANNON
	        //Select number of rounds to fire
	        //Increase by a rate of 1
	        if mouse_wheel_up() || keyboard_check_pressed(global.INCREASE) { 
	            //Check if there is enough ammo supply available
	            if mbtap_l_amount <= (logia_amo_supply-mbtap_supply_rate) {
	                //Make sure the unit rifle ammo does not go over max
	                if ((mbtap_l_amount+cannon_count)+mbtap_supply_rate) <= cannon_max {
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
	                        if ap >= ((mbtap_l_amount+mbtap_supply_rate)/mbtap_supply_rate)*ap_cost {
	                            //Add the rounds
	                            mbtap_l_amount += mbtap_supply_rate; 
	                        }
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 1
	        if mouse_wheel_down() || keyboard_check_pressed(global.DECREASE) { 
	            if mbtap_l_amount >= mbtap_supply_rate { 
	                mbtap_l_amount -= mbtap_supply_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if mbtap_l_amount < 0 { mbtap_l_amount = 0; }
	        if mbtap_l_amount > logia_amo_supply { mbtap_l_amount = logia_amo_supply; }
	        //Add to temp AP cost
	        global.temp_AP = (mbtap_l_amount/mbtap_supply_rate)*ap_cost;
	        //Set the menu position
	        global.fire_option = 0; 
	        //Switch off camera zoom
	        global.can_zoom  = false;
	        global.header_highlight = false;
	        obj_ACTIONMENU.display_tabinfo = false;
	        obj_ACTIONMENU.display_menuinfo = true;
	    }
	        else if f2 {
	            //RESUPPLY MG
	            //Select number of rounds to fire
	            //Increase by a rate of 20
	            if mouse_wheel_up() || keyboard_check_pressed(global.INCREASE) { 
	                //Check if there is enough ammo available
	                if mbtmg_l_amount <= (logia_amo_supply-mbtmg_supply_rate) { 
	                    //Make sure the unit rpg ammo does not go over max
	                    if ((mbtmg_l_amount+mg_count)+mbtmg_supply_rate) <= mg_max {
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
	                            if ap >= ((mbtmg_l_amount+mbtmg_supply_rate)/mbtmg_supply_rate)*ap_cost {
	                                //Add the rounds
	                                mbtmg_l_amount +=  mbtmg_supply_rate; 
	                            }
	                        }
	                    }
	                } 
	            }
	            //Decrease by a rate of 20
	            if mouse_wheel_down() || keyboard_check_pressed(global.DECREASE) { 
	                if mbtmg_l_amount >= mbtmg_supply_rate { 
	                    mbtmg_l_amount -= mbtmg_supply_rate; 
	                } 
	            }
	            //Clamp the value between zero and the max available rounds
	            if mbtmg_l_amount < 0 { mbtmg_l_amount = 0; }
	            if mbtmg_l_amount > logia_amo_supply { mbtmg_l_amount = logia_amo_supply; }
	            //Add to temp AP cost
	            global.temp_AP = (mbtmg_l_amount/mbtmg_supply_rate)*ap_cost;
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
	                        //global.fire_option = 0; 
	                        global.can_zoom  = true;
	                        global.header_highlight = false;
	                        obj_ACTIONMENU.display_tabinfo = false;
	                        obj_ACTIONMENU.display_menuinfo = false;
	                    }
            
	if mouse_check_button_pressed(global.LMOUSE) {
	    if global.my_turn == true {
	        if f0 { 
				//Switch ammo/fire options tab
				if ds_list_size(tabs) > 1 {
					var t_size = ds_list_size(tabs)-1;
					if tab_count < t_size { tab_count += 1; }
						else { tab_count = 0; }
					global.ammo_tab = ds_list_find_value(tabs, tab_count);
					mbtap_l_amount   = 0;
					mbtmg_l_amount   = 0;
					//Reset menu animation
					menu_anim = true;
					menu_anim_count = 0;
					menu_alpha = 0;
					menu_scl = 0;
					//Remove the surface
					if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
				}
	        }
	            else if f1 {
	                //TRANSFER CANNON AMMO
	                //Remove ammo cost
	                if mbtap_l_amount != 0 {
	                    var t=0;
	                    while (mbtap_l_amount >= mbtap_supply_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_logia_list, i);
	                            if (u.can_shoot == true) && (u.ammo_supply >= mbtap_supply_rate) {
	                                if (u.action_points >= ap_cost) {
	                                    mbtap_l_amount -= mbtap_supply_rate;
	                                    if mbtap_l_amount >= 0 {
	                                        if u.shoot_amount == 0 { 
	                                            u.action_confirmed = true;
	                                            global.units_running += 1; 
	                                            u.shoot_ammo = true;
	                                            u.weapon     = "CANNON";
	                                            u.target_x = global.target_x;
	                                            u.target_y = global.target_y;
	                                            u.resupply_unit = argument0;
	                                            u.resupply_unit.resupplying = true;
	                                            u.alert_display = true;
	                                            u.alert_colour = c_red;
	                                            u.alarm[3] = global.tick_rate*3;
	                                        }
	                                        u.shoot_amount   += 1; 
	                                        u.ammo_supply    -= mbtap_supply_rate;
	                                        global.turn_AP   -= ap_cost;
	                                        u.action_points  -= ap_cost;
	                                        u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                    }
	                                }
	                            }
	                        }
	                        if t >= 200 { 
	                            mbtap_l_amount = 0;
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
	                    mbtap_l_amount = 0;
	                }
	                    else { 
							//Deselect all units
							if !ds_list_empty(global.selected_list) {
								scr_DeselectAll();
							}
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
	                    //TRANSFER MG AMMO
	                    //Remove ammo cost
	                    if mbtmg_l_amount != 0 {
	                        var t=0;
	                        while (mbtmg_l_amount >= mbtmg_supply_rate) {
	                            t+=1;
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                                var u = ds_list_find_value(global.selected_logia_list, i);
	                                if (u.can_shoot == true) && (u.ammo_supply >= mbtmg_supply_rate) {
	                                    if (u.action_points >= ap_cost) {
	                                        mbtmg_l_amount -= mbtmg_supply_rate;
	                                        if mbtmg_l_amount >= 0 { 
	                                            if u.shoot_amount == 0 { 
	                                                u.action_confirmed = true;
	                                                global.units_running += 1; 
	                                                u.shoot_ammo = true;
	                                                u.weapon     = "MG";
	                                                u.target_x = global.target_x;
	                                                u.target_y = global.target_y;
	                                                u.resupply_unit = argument0;
	                                                u.resupply_unit.resupplying = true;
	                                                u.alert_display = true;
	                                                u.alert_colour = c_red;
	                                                u.alarm[3] = global.tick_rate*3;
	                                            }
	                                            u.shoot_amount   += 1; 
	                                            u.ammo_supply    -= mbtmg_supply_rate;
	                                            global.turn_AP   -= ap_cost;
	                                            u.action_points  -= ap_cost;
	                                            u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                        }
	                                    }
	                                }
	                            }
	                            if t >= 200 { 
	                                mbtmg_l_amount = 0;
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
	                        mbtmg_l_amount = 0;
	                    }
	                        else { 
								//Deselect all units
								if !ds_list_empty(global.selected_list) {
									scr_DeselectAll();
								}
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
								//Deselect all units
								if !ds_list_empty(global.selected_list) {
									scr_DeselectAll();
								}
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
