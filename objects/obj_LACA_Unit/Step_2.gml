if nav_confirmed == true {
    //Start movement along stored path
    if can_move == true {
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
		part_emitter_clear(particle_eng0, eng0_emitter);
		part_emitter_clear(particle_eng1, eng1_emitter);
        alarm[9] = 20;
        //Set move false to prevent starting the path more than once
        can_move = false;
        if anim_select == false { 
            scl = 0.8;
            anim_select = true; 
            anim_select_count = 0; 
        }
        if shoot_mask != noone { 
            shoot_mask.x = x_final; 
            shoot_mask.y = y_final;
        }
        var t = instance_place(x, y, obj_Game_Tile);
        t.occupied = false;
        //Start navigation with x_final and y_final end point
        mp_grid_path(global.move_grid, my_path, x, y, x_final, y_final, diag);
        nav_offset = 0;
        my_sound = audio_play_sound_on(emit, snd_TruckIdle01, true, 1);
        path_start(my_path, my_speed, path_action_stop, 0);
        if is_manning == true { 
            with manned_unit { is_occupied = false; manned_unit = noone; }
            is_manning = false;
            manned_unit = noone;
        }
        //Add alert to gui
        ds_list_add(global.action_alert_list, "Engineer Moving");
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
        t.occupied = true;
        mp_cost   = t.move_rating;
        my_tile   = t.id;
        my_tile_x = t.tile_x;
        my_tile_y = t.tile_y;
		view_radius = (global.cell_size*4)+(t.height_rating*global.cell_size);
		size_target = (4+t.height_rating)*1.5;//Light radius target size
        x = my_tile_x;
        y = my_tile_y;
        x_end = x;
        y_end = y;
        x_final = x;
        y_final = y;
        mp_grid_path(global.move_grid, my_path, x, y, x, y, diag);
        line_alpha = 0.35;
        audio_stop_sound(my_sound);
        //Switch off gui alert
        var i;
        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
            var z = ds_list_find_value(global.action_alert_list, i);
            if z == "Engineer Moving" { 
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
    if shoot_depot == true {
        //Add alert to gui
        ds_list_add(global.action_alert_list, "Building Depot"); 
        shoot_depot = false;
        shoot_amount -= 1;
        timer_target = 3;
        timer_count = timer_target;
        timer_start = true;
        instance_create_layer(target_x, target_y, "StaticUnits", obj_Depot_Static);
    }
        else if shoot_repair == true {
            //Add alert to gui
            ds_list_add(global.action_alert_list, "Building Repair OP");
            shoot_repair = false;
            shoot_amount -= 1;
            timer_target = 3;
            timer_count = timer_target;
            timer_start = true;
            instance_create_layer(target_x, target_y, "StaticUnits", obj_Repair_Static);
        }
            else if shoot_tow == true {
                //Add alert to gui
                ds_list_add(global.action_alert_list, "Building TOW");
                shoot_tow = false;
                shoot_amount -= 1;
                timer_target = 3;
                timer_count = timer_target;
                timer_start = true;
                instance_create_layer(target_x, target_y, "StaticUnits", obj_TOW_Static);
            }
                else if shoot_mortar == true {
                    //Add alert to gui
                    ds_list_add(global.action_alert_list, "Building Mortar");
                    shoot_mortar = false;
                    shoot_amount -= 1;
                    timer_target = 3;
                    timer_count = timer_target;
                    timer_start = true;
                    instance_create_layer(target_x, target_y, "StaticUnits", obj_Mortar_Static);
                }
                    else {}
}

if timer_start == true {
    timer_start = false;
    alarm[2] = global.tick_rate;
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
    if (depot_supply < depot_rate) && (repair_supply < repair_rate) && (tow_supply < tow_rate) && (mortar_supply < mortar_rate) { 
        alert_display = true;
        alert_text = "Supply Depleted!"; 
        alert_colour = c_red;
        alarm[3] = global.tick_rate*3;
    }
        else if (depot_supply < depot_rate) || (repair_supply < repair_rate) || (tow_supply < tow_rate) || (mortar_supply < mortar_rate) {
            alert_display = true;
            alert_text = "Low Supply!"; 
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
