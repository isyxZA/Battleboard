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
	                alarm[1] = (ds_list_find_index(global.selected_list, id)+1)*4;
	                //Determine if the unit has enough ap to step off of the tile
					if move_amount == 0 {
						if action_points >= mp_cost { move_max = 1; }
							else { move_max = 0; }
					}
						else {
							var tap = 0;
							var pn = path_get_number(my_path);
							var im;
							for(im=0; im<pn; im++) {
								var ppx = path_get_point_x(my_path, im);
								var ppy = path_get_point_y(my_path, im);
								var ppc = instance_place(ppx, ppy, obj_Game_Tile);
								if ppc != noone { tap += ppc.move_rating; }
							}
							if action_points >= tap { move_max = pn; }
								else { }
						}
					if move_max > 0 {
						if global.mouse_holdpos == false { scr_Navigation(my_grid, nav_offset); }
					}
	            }
            }
        } 
    }
}

