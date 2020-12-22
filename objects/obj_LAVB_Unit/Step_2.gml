if nav_confirmed == true {
    //Start movement along stored path
    if can_move == true {
		//Set move false to prevent starting the path more than once
        can_move = false;
		if PLAYER.net_status == "HOST" {
			//Send navigation data to client
			var cc = ds_list_size(global.clients);
			if cc > 0 { 
				var i;
				for (i=0;i<cc;i++) {
					var csocket = ds_list_find_value(global.clients, i);
					net_write_client(csocket, 
						buffer_u8, NET_MOVE,
						buffer_u32, id,
						buffer_u16, x_final,
						buffer_u16, y_final
					);
				}
			}
		}
			else if PLAYER.net_status == "CLIENT" {
				//Send navigation data to host
				net_write_server(
					buffer_u8, NET_MOVE,
					buffer_u32, id,
					buffer_u16, x_final,
					buffer_u16, y_final
				);
			}
        global.units_running += 1;
		part_emitter_clear(particle_btr0, btr0_emitter);
		part_emitter_clear(particle_btr1, btr1_emitter);
        alarm[9] = 20;
        if anim_select == false { 
            scl = 0.8;
            anim_select = true; 
            anim_select_count = 0; 
        }
        if shoot_mask != noone { 
            shoot_mask.x = x_final; 
            shoot_mask.y = y_final;
        } else { shoot_mask = instance_create_layer(x_final, y_final, "Units", obj_Cant_Shoot); }
        if is_manning == true { 
            with manned_unit { is_occupied = false; manned_unit = noone; }
            is_manning = false;
            manned_unit = noone;
        }
			else { 
				var t = instance_place(x, y, obj_Game_Tile);
				t.occupied = false;
			}
		var tt = instance_place(x_final, y_final, obj_Game_Tile);
	    tt.occupied = true;
        //Start navigation with x_final and y_final end point
        mp_grid_path(my_grid, my_path, x, y, x_final, y_final, diag);
        nav_offset = 0;
        my_sound = audio_play_sound_on(emit, snd_TruckIdle_02, true, 1);
        path_start(my_path, my_speed, path_action_stop, 0);
        //Add alert to gui
        ds_list_add(global.action_alert_list, "APC Moving");
    }
    audio_emitter_position(emit, x, y, 0);
    if line_alpha >= 0.95 { fade_switch = true; }
        else if line_alpha <= 0.35 { fade_switch = false; }
    if fade_switch == true { line_alpha = lerp(line_alpha, 0, 0.025); } 
        else if fade_switch == false { line_alpha = lerp(line_alpha, 1, 0.025); }
    if path_position == 1 { 
        global.units_running -= 1;
        nav_confirmed = false; 
        path_end();
        var t = instance_place(x, y, obj_Game_Tile);
        //t.occupied = true;
        mp_cost   = t.move_rating;
        my_tile   = t.id;
        my_tile_x = t.tile_x;
        my_tile_y = t.tile_y;
		view_radius = (global.cell_size*6)+(t.height_rating*global.cell_size);
		size_target = (6+t.height_rating)*1.5;//Light radius target size
        x = my_tile_x;
        y = my_tile_y;
        x_end = x;
        y_end = y;
        x_final = x;
        y_final = y;
        mp_grid_path(my_grid, my_path, x, y, x, y, diag);
        line_alpha = 0.35;
        audio_stop_sound(my_sound);
        audio_play_sound_on(emit, snd_TankShutdown, false, 1);
        //Switch off gui alert
        var i;
        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
            var z = ds_list_find_value(global.action_alert_list, i);
            if z == "APC Moving" { 
                ds_list_delete(global.action_alert_list, i); 
                break;
            }
        }
    }
}

if action_confirmed == true {
	if net_action == true {
		net_action = false;
		if PLAYER.net_status == "HOST" {
			//Send action data to client
			var cc = ds_list_size(global.clients);
			if cc > 0 { 
				var i;
				for (i=0;i<cc;i++) {
					var csocket = ds_list_find_value(global.clients, i);
					net_write_client(csocket, 
						buffer_u8, NET_SHOOT,
						buffer_u32, id,
						buffer_u16, target_x,
						buffer_u16, target_y,
						buffer_string, weapon,
						buffer_u8, shoot_amount
					);
				}
			}
		}
			else if PLAYER.net_status == "CLIENT" {
				//Send action data to host
				net_write_server(
					buffer_u8, NET_SHOOT,
					buffer_u32, id,
					buffer_u16, target_x,
					buffer_u16, target_y,
					buffer_string, weapon,
					buffer_u8, shoot_amount
				);
			}
	}
    if shoot_ap == true {
        if !shoot_mask.t_line {
            //Add alert to gui
            ds_list_add(global.action_alert_list, "APC Firing AP"); 
            shoot_ap = false;
            timer_target = 3;
            timer_count = timer_target;
            timer_start = true;
            shoot_amount -= 1;
        }
            else {
                shoot_ap = false;
                timer_start = false;
                action_confirmed = false;
                //Ammo amount to be returned
                ap_ammo += shoot_amount*ap_rate;
                //Action points to be returned
                var pp = shoot_amount*ap_cost;
                action_points += pp;
                global.turn_AP += pp;
                global.ap_return = pp;
                global.draw_apreturn = true;
                shoot_amount = 0;
                alert_display = true;
                alert_text = "Cancelled!"; 
                alert_colour = c_red;
                alarm[3] = global.tick_rate*3;
                global.units_running -= 1;
				//SEND NET CANCEL SIGNAL
				if PLAYER.net_status == "HOST" {
					//Send action data to client
					var cc = ds_list_size(global.clients);
					if cc > 0 { 
						var i;
						for (i=0;i<cc;i++) {
							var csocket = ds_list_find_value(global.clients, i);
							net_write_client(csocket, 
								buffer_u8, NET_CANCELSHOOT,
								buffer_u32, id,
							);
						}
					}
				}
					else if PLAYER.net_status == "CLIENT" {
						//Send action data to host
						net_write_server(
							buffer_u8, NET_CANCELSHOOT,
							buffer_u32, id,
						);
					}
            }
    }
        else if shoot_he == true {
            if !shoot_mask.t_line {
                //Add alert to gui
                ds_list_add(global.action_alert_list, "APC Firing HE");
                shoot_he = false;
                timer_target = 3;
                timer_count = timer_target;
                timer_start = true;
                shoot_amount -= 1;
            }
                else {
                    shoot_he = false;
                    timer_start = false;
                    action_confirmed = false;
                    //Ammo amount to be returned
                    he_ammo += shoot_amount*he_rate;
                    //Action points to be returned
                    var pp = shoot_amount*ap_cost;
                    action_points += pp;
                    global.turn_AP += pp;
                    global.ap_return = pp;
                    global.draw_apreturn = true;
                    shoot_amount = 0;
                    alert_display = true;
                    alert_text = "Cancelled!"; 
                    alert_colour = c_red;
                    alarm[3] = global.tick_rate*3;
                    global.units_running -= 1;
					//SEND NET CANCEL SIGNAL
					if PLAYER.net_status == "HOST" {
						//Send action data to client
						var cc = ds_list_size(global.clients);
						if cc > 0 { 
							var i;
							for (i=0;i<cc;i++) {
								var csocket = ds_list_find_value(global.clients, i);
								net_write_client(csocket, 
									buffer_u8, NET_CANCELSHOOT,
									buffer_u32, id,
								);
							}
						}
					}
						else if PLAYER.net_status == "CLIENT" {
							//Send action data to host
							net_write_server(
								buffer_u8, NET_CANCELSHOOT,
								buffer_u32, id,
							);
						}
                }
        }
			else if shoot_mg == true {
	            if !shoot_mask.t_line {
	                //Add alert to gui
	                ds_list_add(global.action_alert_list, "APC Firing MG");
	                shoot_mg = false;
	                timer_target = 3;
	                timer_count = timer_target;
	                timer_start = true;
	                shoot_amount -= 1;
	            }
	                else {
	                    shoot_mg = false;
	                    timer_start = false;
	                    action_confirmed = false;
	                    //Ammo amount to be returned
	                    mg_ammo += shoot_amount*mg_rate;
	                    //Action points to be returned
	                    var pp = shoot_amount*mg_cost;
	                    action_points += pp;
	                    global.turn_AP += pp;
	                    global.ap_return = pp;
	                    global.draw_apreturn = true;
	                    shoot_amount = 0;
	                    alert_display = true;
	                    alert_text = "Cancelled!"; 
	                    alert_colour = c_red;
	                    alarm[3] = global.tick_rate*3;
	                    global.units_running -= 1;
						//SEND NET CANCEL SIGNAL
						if PLAYER.net_status == "HOST" {
							//Send action data to client
							var cc = ds_list_size(global.clients);
							if cc > 0 { 
								var i;
								for (i=0;i<cc;i++) {
									var csocket = ds_list_find_value(global.clients, i);
									net_write_client(csocket, 
										buffer_u8, NET_CANCELSHOOT,
										buffer_u32, id,
									);
								}
							}
						}
							else if PLAYER.net_status == "CLIENT" {
								//Send action data to host
								net_write_server(
									buffer_u8, NET_CANCELSHOOT,
									buffer_u32, id,
								);
							}
	                }
	        }
				else if shoot_sqd == true {
					//Add alert to gui
					shoot_sqd = false;
					sqd_unit   = ds_list_find_value(unit_list  , 0);
					sqd_squad  = ds_list_find_value(squad_list , 0);
					sqd_ap     = ds_list_find_value(ap_list    , 0);
					sqd_health = ds_list_find_value(health_list, 0);
					sqd_rflamo = ds_list_find_value(rflamo_list, 0);
					sqd_rpgamo = ds_list_find_value(rpgamo_list, 0);
					sqd_flramo = ds_list_find_value(flramo_list, 0);
					if sqd_unit != "NOONE" {
						ds_list_add(global.action_alert_list, "APC Deploying Squad");
						timer_target = 1;
						timer_count = timer_target;
						timer_start = true;
						shoot_amount -= 1;
						switch sqd_unit {
							case "INF_A":
								var inf = instance_create_layer(target_x, target_y, "Units", obj_INFA_Unit);
								break;
							case "INF_B":
								var inf = instance_create_layer(target_x, target_y, "Units", obj_INFB_Unit);
								break;
							default:
								var inf = instance_create_layer(target_x, target_y, "Units", obj_INFA_Unit);
								break;
						}
						with inf {
							my_squad      = other.sqd_squad;
							action_points = other.sqd_ap;
							unit_health   = other.sqd_health;
							rifle_ammo    = other.sqd_rflamo;
							rpg_ammo      = other.sqd_rpgamo;
							flare_ammo    = other.sqd_flramo;
							//Add to squad list
							switch my_squad {
								case "ALPHA":
									ds_list_add(global.squad_alpha, id);
									var ut = ds_list_find_index(global.alpha_transit, unit_type);
									if ut != -1 { ds_list_delete(global.alpha_transit, ut); }
									break;
								case "BRAVO":
									ds_list_add(global.squad_bravo, id);
									var ut = ds_list_find_index(global.bravo_transit, unit_type);
									if ut != -1 { ds_list_delete(global.bravo_transit, ut); }
									break;
								case "CHARLIE":
									ds_list_add(global.squad_charlie, id);
									var ut = ds_list_find_index(global.charlie_transit, unit_type);
									if ut != -1 { ds_list_delete(global.charlie_transit, ut); }
									break;
								case "DELTA":
									ds_list_add(global.squad_delta, id);
									var ut = ds_list_find_index(global.delta_transit, unit_type);
									if ut != -1 { ds_list_delete(global.delta_transit, ut); }
									break;
								case "ECHO":
									ds_list_add(global.squad_echo, id);
									var ut = ds_list_find_index(global.echo_transit, unit_type);
									if ut != -1 { ds_list_delete(global.echo_transit, ut); }
									break;
							}
							if my_squad == obj_CONTROL.active_turn { active = true; }
							spawn_check = true;
						}
						ds_list_delete(unit_list  , 0);
						ds_list_delete(squad_list , 0);
						ds_list_delete(ap_list    , 0);
						ds_list_delete(health_list, 0);
						ds_list_delete(rflamo_list, 0);
						ds_list_delete(rpgamo_list, 0);
						ds_list_delete(flramo_list, 0);
					}
			    }
					else {}
}

if timer_start == true {
    timer_start = false;
    alarm[2] = global.tick_rate;
}

if add_squad == true {
	add_squad = false;
	ds_list_add(unit_list  , sqd_unit  );
	ds_list_add(squad_list , sqd_squad );
	ds_list_add(ap_list    , sqd_ap    );
	ds_list_add(health_list, sqd_health);
	ds_list_add(rflamo_list, sqd_rflamo);
	ds_list_add(rpgamo_list, sqd_rpgamo);
	ds_list_add(flramo_list, sqd_flramo);
}

//Rotate the unit toward the next path point
if global.my_turn == true || global.waiting == true {
    //Find the next path point x,y
    if count_start == true {
        count_start = false;
        point_count = 1;
    }
    var px = path_get_point_x(my_path, point_count);    
    var py = path_get_point_y(my_path, point_count);
    //Once the path point is reached change target to next point on path
    if point_distance(x, y, px, py) < 2 { 
        if point_change == true {
            point_change = false;
            point_count += 1; 
            alarm[0] = 2;
        }
    }
    //Set image rotation during pathing
    var d = point_direction(x, y, px, py)+rot_adj;
    if point_count < path_get_number(my_path) {
        if rot != d { rot += (sin(degtorad(rot-d))*12); }
    }
        else { if rot != 180  { rot += (sin(degtorad(rot-180))); }}
}
    else {
        //Set idle image rotation
        if rot != 180  { rot += (sin(degtorad(rot-180))); }
    }

var d2;
if action_confirmed == true || draw_flash == true { 
    d2 = point_direction(x, y, target_x, target_y)+rot_adj; 
    if turret_rot != d2  { turret_rot += (sin(degtorad(turret_rot-d2))); }
}
    else { 
        if selected && global.reticule_display == true {
             d2 = point_direction(x, y, global.target_x, global.target_y)+rot_adj;
             if turret_rot != d2  { turret_rot += (sin(degtorad(turret_rot-d2))); } 
        }
            else { if turret_rot != 180  { turret_rot += (sin(degtorad(turret_rot-180))); } }
    }
    
if mp_depleted == true {
    mp_depleted = false;
    alert_display = true;
    alert_text = "MP Depleted!";
    alarm[3] = global.tick_rate*3;
}

if ap_depleted == true {
    ap_depleted = false;
    alert_display = true;
    alert_text = "AP Depleted!";
    alarm[3] = global.tick_rate*3;
}

if ammo_check == true {
    ammo_check = false;
    if (he_ammo < he_rate) && (ap_ammo < ap_rate) && (mg_ammo < mg_rate) { 
        alert_display = true;
        alert_text = "Ammo Depleted!"; 
        alert_colour = c_red;
        alarm[3] = global.tick_rate*3;
    }
        else if (he_ammo < he_rate) || (ap_ammo < ap_rate) || (mg_ammo < mg_rate) {
            alert_display = true;
            alert_text = "Low Ammo!"; 
            alert_colour = c_orange;
            alarm[3] = global.tick_rate*3;
        }
            else { }

}

//Toggle tile highlights
if selected {
    if global.highlight_supply != true && global.highlight_move != true {
        //Highlight tiles within action range
        if keyboard_check_pressed(ord("F")) {
            if highlight_shoot == false { 
                highlight_shoot = true;
                global.highlight_shoot = true;
                //Check which game tiles are in range
                if !ds_list_empty(global.tile_list){
                    var i;
                    for (i=0; i<ds_list_size(global.tile_list); i+=1){
                        var z = ds_list_find_value(global.tile_list, i);
                        if point_in_circle(z.tile_x,z.tile_y, x, y, action_range){
                             z.unit_count += 1;
                             z.alarm[1] = random_range(6,32);
                        }
                    }
                }
            }
        }
    }
    if global.highlight_supply != true && global.highlight_shoot != true {
        //Highlight tiles within movement range
        if keyboard_check_pressed(ord("T")) {
            if highlight_move == false { 
                highlight_move = true;
                global.highlight_move = true;
                //Check which game tiles are in range
                if !ds_list_empty(global.tile_list){
                    var i;
                    for (i=0; i<ds_list_size(global.tile_list); i+=1){
                        var z = ds_list_find_value(global.tile_list, i);
                        if point_in_circle(z.tile_x,z.tile_y, x, y, view_radius+(global.cell_size*2)){
                             z.unit_count += 1;
                             z.alarm[1] = random_range(6,32);
                        }
                    }
                }
            }
        }
    }
}

//Deactivate highlighting shoot tiles
if keyboard_check_released(ord("F")) {
    if highlight_shoot == true { 
        highlight_shoot = false;
        global.highlight_shoot = false;
        //Remove game tile visibility
        if !ds_list_empty(global.tile_list){
            var i;
            for (i=0; i<ds_list_size(global.tile_list); i+=1){
                var z = ds_list_find_value(global.tile_list, i);
                if point_in_circle(z.tile_x,z.tile_y, x, y, action_range){
                    if z.unit_count > 0 { 
                        z.unit_count -= 1; 
                        z.alarm[1] = 1;
                    }
                }
            }
        }
    }
}
if highlight_shoot == true { 
    if global.nav_menu == true {
        highlight_shoot = false;
        global.highlight_shoot = false;
        //Remove game tile visibility
        if !ds_list_empty(global.tile_list){
            var i;
            for (i=0; i<ds_list_size(global.tile_list); i+=1){
                var z = ds_list_find_value(global.tile_list, i);
                if point_in_circle(z.tile_x,z.tile_y, x, y, action_range){
                    if z.unit_count > 0 { 
                        z.unit_count -= 1; 
                        z.alarm[1] = 1;
                    }
                }
            }
        }
    }
}

//Deactivate highlighting move tiles
if keyboard_check_released(ord("T")) {
    if highlight_move == true { 
        highlight_move = false;
        global.highlight_move = false;
        //Remove game tile visibility
        if !ds_list_empty(global.tile_list){
            var i;
            for (i=0; i<ds_list_size(global.tile_list); i+=1){
                var z = ds_list_find_value(global.tile_list, i);
                if point_in_circle(z.tile_x,z.tile_y, x, y, view_radius+(global.cell_size*2)){
                    if z.unit_count > 0 { 
                        z.unit_count -= 1; 
                        z.alarm[1] = 1;
                    }
                }
            }
        }
    }
}
if highlight_move == true { 
    if global.nav_menu == true {
        highlight_move = false;
        global.highlight_move = false;
        //Remove game tile visibility
        if !ds_list_empty(global.tile_list){
            var i;
            for (i=0; i<ds_list_size(global.tile_list); i+=1){
                var z = ds_list_find_value(global.tile_list, i);
                if point_in_circle(z.tile_x,z.tile_y, x, y, view_radius+(global.cell_size*2)){
                    if z.unit_count > 0 { 
                        z.unit_count -= 1; 
                        z.alarm[1] = 1;
                    }
                }
            }
        }
    }
}
