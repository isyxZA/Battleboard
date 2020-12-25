//Visibilty area in fog of war
if light_size < size_target { light_size = lerp(light_size, size_target, 0.005); }
if light_strength != global.light_level { light_strength = lerp(light_strength, global.light_level, 0.002); }

//For game start animation
if can_move == true {
	if p_one == true {
		part_emitter_region(particle_ship0, ship0_emitter, x-20, x+20, y+240, y+240, ps_shape_line, ps_distr_invgaussian);
	}
		else {
			part_emitter_region(particle_ship0, ship0_emitter, x-20, x+20, y-240, y-240, ps_shape_line, ps_distr_invgaussian);
		}
	//Wake
	part_emitter_stream(particle_ship0, ship0_emitter, part1, -3);
    if PLAYER.player == "ONE" && (y > y_to) { move_towards_point(x, y_to, s); } 
		else if PLAYER.player == "TWO" && (y < y_to) { move_towards_point(x, y_to, s); } 
	        else { 
	            speed = 0; 
	            can_move = false;
				part_emitter_clear(particle_ship0, ship0_emitter);
	            var spawner = instance_place(x, y, obj_Ship_Spawn);
	            if spawner != noone {
	                with spawner { instance_destroy(); }
	                //global.active_ilc = false;
	            }
	        }
}

//If the game is in staging phase allow for unit placement
if global.my_turn == true || global.active_ilc == true {
    if can_move == false {
        //If units are still available for spawn
        if depleted == false {
            if mouse_check_button_pressed(mb_left) {
                if place_meeting(x, y, obj_MOUSE) { 
					if obj_CONTROL.show_options == false {
						if global.selected_LC == false { selected = true; } else { selected = false; } 
					}
				} 
                    else { selected = false; }
            }
            if selected {
                if nav_display == false {
                    //Actions that will run only ONCE when selected
                    nav_display = true;
                    //Set global variable to on
                    if global.selected_LC == false { global.selected_LC = true; }
                    //Check which game tiles are in range
                    if !ds_list_empty(global.tile_list){
                        var i;
                        for (i=0; i<ds_list_size(global.tile_list); i+=1){
                            var z = ds_list_find_value(global.tile_list, i);
                            if point_in_circle(z.tile_x,z.tile_y, x, y, view_radius){
                                 z.unit_count += 1;
                                 z.alarm[1] = random_range(6,32);
                            }
                        }
                    }
                }
                if !ds_list_empty(unit_list) { 
                    //Look for nearest game tile
                    var target = instance_nearest(mouse_x-global.cell_size*0.5, mouse_y-global.cell_size*0.5, obj_Game_Tile);
                    mx = target.tile_x;
                    my = target.tile_y;
                    unit_drag = true; 
                    //If the tile is within view range and can be moved to
                    if (target.unit_count >= 1) && (target.my_colour == c_green) { 
                        //Check if other units exist on the board
                        if !ds_list_empty(global.unit_list){
                            can_place = true;
                            var i;
                            for (i=0; i<ds_list_size(global.unit_list); i+=1) {
                                var u = ds_list_find_value(global.unit_list, i);
                                if (u.x_final == mx) && (u.y_final == my) { can_place = false;} 
                            }
                        }
                            //If no other units exist on the board
                            else { can_place = true; }
                    } 
                        else { can_place = false; }
                } 
                    else { 
                        unit_drag = false; 
                        can_place = false;
                        mx = x;
                        my = y;
                    }
                //Right click to place unit
                if mouse_check_button_pressed(mb_right) {
                    if can_place == true { 
                        if !ds_list_empty(unit_list) {
                            var t = ds_list_find_value(unit_list, 0);
                            switch t {
                                case spr_Infantry_A1:
								case spr_Infantry_A2:
								case spr_Infantry_B1:
								case spr_Infantry_B2:
                                    my_unit = obj_INFA_Unit;
                                    break;
								case spr_Infantry_A1a:
								case spr_Infantry_A2a:
								case spr_Infantry_B1a:
								case spr_Infantry_B2a:
                                    my_unit = obj_INFB_Unit;
                                    break;
                                case spr_Tank_A1_Icon:
								case spr_Tank_A2_Icon:
								case spr_Tank_B1_Icon:
								case spr_Tank_B2_Icon:
                                    my_unit = obj_MBTA_Unit;
                                    break;
								case spr_Tank_A1a_Icon:
								case spr_Tank_A2a_Icon:
								case spr_Tank_B1a_Icon:
								case spr_Tank_B2a_Icon:
                                    my_unit = obj_MBTB_Unit;
                                    break;
                                case spr_Engineer_A1:
								case spr_Engineer_A2:
								case spr_Engineer_B1:
								case spr_Engineer_B2:
                                    my_unit = obj_LACA_Unit;
                                    break;
								case spr_Engineer_A1a_Icon:
								case spr_Engineer_A2a_Icon:
								case spr_Engineer_B1a_Icon:
								case spr_Engineer_B2a_Icon:
                                    my_unit = obj_LACB_Unit;
                                    break;
                                case spr_BTR_A1_Icon:
								case spr_BTR_A2_Icon:
								case spr_BTR_B1_Icon:
								case spr_BTR_B2_Icon:
                                    my_unit = obj_LAVA_Unit;
                                    break;
								case spr_BTR_A1a_Icon:
								case spr_BTR_A2a_Icon:
								case spr_BTR_B1a_Icon:
								case spr_BTR_B2a_Icon:
                                    my_unit = obj_LAVB_Unit;
                                    break;
                                case spr_Logi_A1:
								case spr_Logi_A2:
								case spr_Logi_B1:
								case spr_Logi_B2:
									my_unit = obj_LOGIA_Unit;
                                    break;
								case spr_Logi_A1a:
								case spr_Logi_A2a:
								case spr_Logi_B1a:
								case spr_Logi_B2a:
                                    my_unit = obj_LOGIB_Unit;
                                    break;
                            }
                            //Remove from available units list
                            ds_list_delete(unit_list, 0);
                            global.spawning_unit = true; 
                            //Create the unit
                            with instance_create_layer(mx, my, "Units", my_unit) { 
                                my_squad = other.my_squad; 
                                //Add to squad list
                                switch my_squad {
                                    case "ALPHA":
                                        ds_list_add(global.squad_alpha, id);
                                        break;
                                    case "BRAVO":
                                        ds_list_add(global.squad_bravo, id);
                                        break;
                                    case "CHARLIE":
                                        ds_list_add(global.squad_charlie, id);
                                        break;
                                    case "DELTA":
                                        ds_list_add(global.squad_delta, id);
                                        break;
                                    case "ECHO":
                                        ds_list_add(global.squad_echo, id);
                                        break;
                                }
                            }
                            with obj_ACTIONMENU { alarm[1] = 30; }
                        }
                    } 
                } 
                
            }
                else {
                    if nav_display == true {
                        nav_display = false;
                        unit_drag = false;
                        can_place = false;
                        mx = x;
                        my = y;
                        if global.selected_LC == true { global.selected_LC = false; }
                        //Remove game tile visibility
                        if !ds_list_empty(global.tile_list){
                            var i;
                            for (i=0; i<ds_list_size(global.tile_list); i+=1){
                                var z = ds_list_find_value(global.tile_list, i);
                                if point_in_circle(z.tile_x,z.tile_y, x, y, view_radius){
                                     z.unit_count -= 1;
                                     z.alarm[1] = 1;
                                }
                            }
                        }
                    }
                }
        }
        
        //Once all units are used
        if ds_list_empty(unit_list) {
            if depleted == false {
                //Switch off ability to spawn units 
                depleted = true;
				//Send empty signal to CONTROL
				if send_empty == true { 
					send_empty = false;
					//if PLAYER.net_status != "NONE"
					obj_CONTROL.empty_ship += 1; 
				}
                if selected { 
                    if global.selected_LC == true { global.selected_LC = false; }
                    if global.active_ilc == true { 
                        global.active_ilc = false;
                        obj_CONTROL.active_ilc = false; 
                        global.turn_AP = 0;
                        global.units_running -= 1;
                    }
                    selected = false;
                    if nav_display == true {
                        nav_display = false;
                        unit_drag = false;
                        can_place = false;
                        mx = x;
                        my = y;
                        if !ds_list_empty(global.tile_list){
                            var i;
                            for (i=0; i<ds_list_size(global.tile_list); i+=1){
                                var z = ds_list_find_value(global.tile_list, i);
                                if point_in_circle(z.tile_x,z.tile_y, x, y, view_radius){
                                     z.unit_count -= 1;
                                     z.alarm[1] = 1;
                                }
                            }
                        }
                    } 
                }
            }
        }
    }
}  
    else {
        if selected { 
            selected = false;
            if global.selected_LC == true { global.selected_LC = false; }
            if nav_display == true {
                nav_display = false;
                unit_drag = false;
                can_place = false;
                mx = x;
                my = y;
                if !ds_list_empty(global.tile_list){
                    var i;
                    for (i=0; i<ds_list_size(global.tile_list); i+=1){
                        var z = ds_list_find_value(global.tile_list, i);
                        if point_in_circle(z.tile_x,z.tile_y, x, y, view_radius){
                             z.unit_count -= 1;
                             z.alarm[1] = 1;
                        }
                    }
                }
            } 
        }
    }

