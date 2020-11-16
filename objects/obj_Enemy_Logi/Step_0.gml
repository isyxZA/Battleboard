if nav_confirmed == true {
    //Start movement along stored path
    if can_move == true {
        //Set move false to prevent starting the path more than once
        can_move = false;
        global.enemyunits_running += 1;
		part_emitter_clear(particle_logi0, logi0_emitter);
		part_emitter_clear(particle_logi1, logi1_emitter);
        if shoot_mask != noone { 
            shoot_mask.x = x_final; 
            shoot_mask.y = y_final;
        }
        //Reset target list as unit position has now changed
        no_shot = false;
        if !ds_list_empty(target_list) { ds_list_clear(target_list); }
        if my_tile != noone { my_tile.occupied = false; }
        scr_VisibilityCheck();
        if is_visible == true { my_sound = audio_play_sound_on(emit, snd_TruckIdle01, true, 1); }
            else my_sound = -1;
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
		mp_cost   = t.move_rating;
        my_tile   = t.id;
        my_tile_x = t.tile_x;
        my_tile_y = t.tile_y;
        x = my_tile_x;
        y = my_tile_y;
        x_end = x;
        y_end = y;
        x_final = x;
        y_final = y;
        if my_sound != -1 { audio_stop_sound(my_sound); }
        mp_grid_path(nav_grid, my_path, x, y, x, y, diag);
    }
}

