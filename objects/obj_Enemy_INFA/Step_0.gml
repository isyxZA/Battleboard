if nav_confirmed == true {
    //Start movement along stored path
    if can_move == true {
        can_move = false;
        global.enemyunits_running += 1;
        if shoot_mask != noone { 
            shoot_mask.x = x_final; 
            shoot_mask.y = y_final;
        } else { shoot_mask = instance_create_layer(x_final, y_final, "Units", obj_Cant_Shoot); }
        //Set move false to prevent starting the path more than once
        can_move = false;
        //Reset target list as unit position has now changed
        no_shot = false;
        if !ds_list_empty(target_list) { ds_list_clear(target_list); }
        if my_tile != noone { my_tile.occupied = false; }
        //scr_VisibilityCheck();
        if is_visible == true { my_sound = audio_play_sound_on(emit, snd_MarchingFootsteps, true, 1); }
            else { 
				//Check if unit will be moving into view
				scr_VisibilityCheck();
				if is_visible == true { my_sound = audio_play_sound_on(emit, snd_MarchingFootsteps, true, 1); }
					else { my_sound = -1; }
			}
        //Start navigation with x_final and y_final end point
		mp_grid_path(nav_grid, my_path, x, y, x_final, y_final, diag);
        path_start(my_path, my_speed, path_action_stop, 0);
    }
    audio_emitter_position(emit, x, y, 0);
    if line_alpha >= 0.95 { fade_switch = true; }
        else if line_alpha <= 0.35 { fade_switch = false; }
    if fade_switch == true { line_alpha = lerp(line_alpha, 0, 0.025); } 
        else if fade_switch == false { line_alpha = lerp(line_alpha, 1, 0.025); }
    if path_position == 1 { 
        global.enemyunits_running -= 1;
        nav_confirmed = false; 
        path_end();
        var t = instance_place(x, y, obj_Game_Tile);
        t.occupied = true;
        my_tile   = t.id;
		mp_cost   = t.move_rating;
        my_tile_x = t.tile_x;
        my_tile_y = t.tile_y;
        x = my_tile_x;
        y = my_tile_y;
        x_end = x;
        y_end = y;
        x_final = x;
        y_final = y;
        rot = 0;
        if my_sound != -1 { audio_stop_sound(my_sound); }
		if is_visible == true { 
			//Check if unit has moved out of view
			scr_VisibilityCheck(); 
		}
        mp_grid_path(nav_grid, my_path, x, y, x, y, diag);
        if is_manning == true { instance_destroy(); }
    }
}

if action_confirmed == true {
    if shoot_rifle == true { 
        shoot_rifle = false;
        timer_target = 3;
        timer_count = timer_target;
        timer_start = true;
        shoot_amount -= 1;
    }
        else if shoot_rpg == true {
            shoot_rpg = false;
            timer_target = 3;
            timer_count = timer_target;
            timer_start = true;
            shoot_amount -= 1;
        }
            else if shoot_flare == true {
                shoot_flare = false;
                timer_target = 3;
                timer_count = timer_target;
                timer_start = true;
                shoot_amount -= 1;
            }
                else {}
}

if timer_start == true {
    timer_start = false;
    alarm[2] = global.tick_rate;
}





