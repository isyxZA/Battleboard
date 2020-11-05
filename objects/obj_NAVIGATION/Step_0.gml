if global.my_turn == true && global.nav_select == true {
    //Calculate unit waypoints
    if !ds_list_empty(global.selected_list) {
        var iu;
        for(iu=0; iu<ds_list_size(global.selected_list); iu+=1) {
            var n_unit = ds_list_find_value(global.selected_list, iu);
            with n_unit { 
				mp_grid_clear_rectangle(global.move_grid, x-40, y-40, x+40, y+40);
	            scr_Offset_Navigation();
	            //Add a delay to prevent this calculating every step
	            if nav_allow ==  true {
	                nav_allow = false;
	                alarm[1] = 8;
	                //Find a waypoint
					//Calculate temp ap cost
					var mm;
					var pn = path_get_number(my_path);
					var mc_cost;
					if move_amount > 0 {
						var pmc     = instance_place(x_end, y_end, obj_Game_Tile);
						mc_cost = (temp_ap+pmc.move_rating)/pn;
					}
						else {
							mc_cost = mp_cost;
						}
					mm = floor(action_points/mc_cost);
	                if mm > 0 {
						if move_max < mm { move_max += 1; }
	                    if move_max > mm { move_max = mm; }
	                    if global.mouse_holdpos == false { scr_Navigation(nav_offset); }
	                }
					/*
	                var mm = (action_points/mp_cost);
	                if mm > 0 {
						if move_max != mm { move_max += 1; }
	                    if move_max > mm { move_max = mm; }
	                    if global.mouse_holdpos == false { scr_Navigation(nav_offset); }
	                }
					*/
	            }
            }
        } 
    }

}

