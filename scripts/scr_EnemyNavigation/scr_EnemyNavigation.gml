/// @description scr_EnemyNavigation(waypoint_x, waypoint_y, move_max);
/// @param waypoint_x
/// @param  waypoint_y
/// @param  move_max
function scr_EnemyNavigation(argument0, argument1, argument2) {

	var mx = argument0;
	var my = argument1;
	var xx = instance_nearest(mx, my, obj_Game_Tile).tile_x;
	var yy = instance_nearest(mx, my, obj_Game_Tile).tile_y;

	//Create the navigation path 
	if mp_grid_path(global.move_grid, my_path, x, y, xx, yy, diag) {
	    //Limit movement to move max
	    while (path_get_number(my_path)-1 > argument2) { path_delete_point(my_path, path_get_number(my_path)-1); }    
	    //Store the path end coords
	    x_end = path_get_x(my_path, 1);
	    y_end = path_get_y(my_path, 1);
	    //Check for overlapping path ends...if one exists then delete last point on path
	    repeat (argument2) {
	        if !ds_list_empty(global.unit_list){
	            var in;
	            for (in=0; in<ds_list_size(global.unit_list); in+=1;) {
	                var un = ds_list_find_value(global.unit_list, in);
	                //If u is not self
	                if (un.id != id) {
	                    switch un.unit_type {
	                        //Static Units
	                        case "E_DEPOT":
	                        case "E_TOW":
	                        case "E_MORTAR":
	                            //First check if this unit waypoint is still at start position
	                            //This will prevent adding path points in the negative direction
	                            if (x_end == x) && (y_end == y) {
	                                x_end = path_get_x(my_path, 1);
	                                y_end = path_get_y(my_path, 1);
	                            }
	                                else {
	                                    //Check for overlapping path ends
	                                    if (x_end == un.x_end) && (y_end == un.y_end) {
	                                        //If static unit is not under construction
	                                        if un.can_be_manned == true {
	                                            if unit_type != "E_INFANTRY" {
	                                                switch unit_type {
	                                                    //If this unit is a vehicle
	                                                    //Prevent from entering static unit
	                                                    case "E_TANK":
	                                                    case "E_ENGINEER":
	                                                    case "E_BTR":
	                                                    case "E_LOGI":
	                                                        path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                        x_end = path_get_x(my_path, 1);
	                                                        y_end = path_get_y(my_path, 1);
	                                                        break;
	                                                    case "E_DEPOT":
	                                                    case "E_REPAIR":
	                                                    case "E_TOW":
	                                                    case "E_MORTAR":
	                                                        //When transfering infantry between static units
	                                                        if un.is_manned == true {
	                                                            path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                            x_end = path_get_x(my_path, 1);
	                                                            y_end = path_get_y(my_path, 1);
	                                                        }
	                                                            else if un.is_manned == false {
	                                                            }
	                                                        break;
	                                                }
	                                            }
	                                                //If this unit is infantry
	                                                else { 
	                                                    //If the static unit is already being manned
	                                                    //Prevent from entering static unit
	                                                    if un.is_manned == true {
	                                                        path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                        x_end = path_get_x(my_path, 1);
	                                                        y_end = path_get_y(my_path, 1);    
	                                                    }
	                                                        //If the static unit is not currently manned
	                                                        //Allow infantry to man the static unit
	                                                        else { }
	                                                }
	                                        }
	                                            //If static unit is under construction
	                                            //Prevent all units from entering static unit
	                                            else if un.can_be_manned == false {
	                                                path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                x_end = path_get_x(my_path, 1);
	                                                y_end = path_get_y(my_path, 1);
	                                            } 
	                                    }
	                                        //Check for overlapping path ends
	                                        else if (x_end == un.x_final) && (y_end == un.y_final) {
	                                            //If static unit is not under construction
	                                            if un.can_be_manned == true {
	                                                if unit_type != "E_INFANTRY" {
	                                                   switch unit_type {
	                                                    //If this unit is a vehicle
	                                                    //Prevent from entering static unit
	                                                    case "E_TANK":
	                                                    case "E_ENGINEER":
	                                                    case "E_BTR":
	                                                    case "E_LOGI":
	                                                        path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                        x_end = path_get_x(my_path, 1);
	                                                        y_end = path_get_y(my_path, 1);
	                                                        break;
	                                                    case "E_DEPOT":
	                                                    case "E_REPAIR":
	                                                    case "E_TOW":
	                                                    case "E_MORTAR":
	                                                        //When transfering infantry between static units
	                                                        if un.is_manned == true {
	                                                            path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                            x_end = path_get_x(my_path, 1);
	                                                            y_end = path_get_y(my_path, 1);
	                                                        }
	                                                        break;
	                                                }
	                                            }
	                                                    //If this unit is infantry
	                                                    else { 
	                                                        //If the static unit is already being manned
	                                                        //Prevent from entering static unit
	                                                        if un.is_manned == true {
	                                                            path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                            x_end = path_get_x(my_path, 1);
	                                                            y_end = path_get_y(my_path, 1);    
	                                                        }
	                                                            //If the static unit is not currently manned
	                                                            //Allow infantry to man the static unit
	                                                            else { }
	                                                    }
	                                            }
	                                                //If static unit is under construction
	                                                //Prevent all units from entering static unit
	                                                else if un.can_be_manned == false {
	                                                    path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                    x_end = path_get_x(my_path, 1);
	                                                    y_end = path_get_y(my_path, 1);
	                                                } 
	                                        }
	                                }
	                            break;
	                        case "E_REPAIR":
	                            //First check if unit is still at start position
	                            //This will prevent adding path points in the negative direction
	                            if (x_end == x) && (y_end == y) {
	                                x_end = path_get_x(my_path, 1);
	                                y_end = path_get_y(my_path, 1);
	                            }
	                                else {
	                                    //If static unit is not under construction
	                                    if (x_end == un.x_end) && (y_end == un.y_end) {
	                                        //If the repair station is not under construction
	                                        if un.can_be_manned == true {
	                                            //If this unit is not infantry
	                                            if unit_type != "E_INFANTRY" {
	                                                switch unit_type {
	                                                    //Vehicle control
	                                                    case "E_TANK":
	                                                    case "E_ENGINEER":
	                                                    case "E_BTR":
	                                                    case "E_LOGI":
	                                                        //If the repair station is selecting a waypoint for its manned unit
	                                                        //Prevent vehicle entry
	                                                        if un.nav_split == true || un.is_occupied == true || un.is_manned == false{
	                                                            path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                            x_end = path_get_x(my_path, 1);
	                                                            y_end = path_get_y(my_path, 1);
	                                                        }
	                                                        break;
	                                                    case "E_DEPOT":
	                                                    case "E_REPAIR":
	                                                    case "E_TOW":
	                                                    case "E_MORTAR":
	                                                        //When transfering infantry between static units
	                                                        if un.is_manned == true {
	                                                            path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                            x_end = path_get_x(my_path, 1);
	                                                            y_end = path_get_y(my_path, 1);
	                                                        }
	                                                        break;
	                                                }
	                                            }
	                                                //If this unit is infantry
	                                                else { 
	                                                    //If the static unit is already being manned
	                                                    //Prevent from entering repair station
	                                                    if un.is_manned == true {
	                                                        path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                        x_end = path_get_x(my_path, 1);
	                                                        y_end = path_get_y(my_path, 1);    
	                                                    }
	                                                        //If the static unit is not currently manned
	                                                        //Allow infantry to man the repair station
	                                                        else { }
	                                                }
	                                        }
	                                            //If the repair station is under construction
	                                            //Prevent all units from entering
	                                            else if un.can_be_manned == false {
	                                                path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                x_end = path_get_x(my_path, 1);
	                                                y_end = path_get_y(my_path, 1);
	                                            } 
	                                    }
	                                        //Check for overlapping path ends
	                                        else if (x_end == un.x_final) && (y_end == un.y_final) {
	                                            //If the repair station is not under construction
	                                            if un.can_be_manned == true {
	                                                //If this unit is not infantry
	                                                if unit_type != "E_INFANTRY" {
	                                                    switch unit_type {
	                                                        //Vehicle control
	                                                        case "E_TANK":
	                                                        case "E_ENGINEER":
	                                                        case "E_BTR":
	                                                        case "E_LOGI":
	                                                            //If the repair station is selecting a waypoint for its manned unit
	                                                            //Prevent vehicle entry
	                                                            if un.nav_split == true || un.is_occupied == true || un.is_manned == false{
	                                                                path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                                x_end = path_get_x(my_path, 1);
	                                                                y_end = path_get_y(my_path, 1);
	                                                            }
	                                                            break;
	                                                        case "E_DEPOT":
	                                                        case "E_REPAIR":
	                                                        case "E_TOW":
	                                                        case "E_MORTAR":
	                                                            //When transfering infantry between static units
	                                                            if un.is_manned == true {
	                                                                path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                                x_end = path_get_x(my_path, 1);
	                                                                y_end = path_get_y(my_path, 1);
	                                                            }
	                                                            break;
	                                                }
	                                            }
	                                                //If this unit is infantry
	                                                else { 
	                                                    //If the static unit is already being manned
	                                                    //Prevent from entering repair station
	                                                    if un.is_manned == true {
	                                                        path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                        x_end = path_get_x(my_path, 1);
	                                                        y_end = path_get_y(my_path, 1);    
	                                                    }
	                                                        //If the static unit is not currently manned
	                                                        //Allow infantry to man the repair station
	                                                        else { }
	                                                    }
	                                        }   
	                                                //If the repair station is under construction
	                                                //Prevent all units from entering
	                                                else if un.can_be_manned == false {
	                                                    path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                    x_end = path_get_x(my_path, 1);
	                                                    y_end = path_get_y(my_path, 1);
	                                                } 
	                                        }
	                                }
	                            break;
	                        default:
	                            //All other units on the board
	                            //First check if unit is still at start position
	                            //This will prevent adding path points in the negative direction
	                            if (x_end == x) && (y_end == y) {
	                                x_end = path_get_x(my_path, 1);
	                                y_end = path_get_y(my_path, 1);
	                            }
	                                else {
	                                    //Check for overlapping path ends
	                                    if (x_end == un.x_end) && (y_end == un.y_end) {
	                                        path_delete_point(my_path, path_get_number(my_path) - 1);
	                                        x_end = path_get_x(my_path, 1);
	                                        y_end = path_get_y(my_path, 1);
	                                    }
	                                        //Check for overlapping path ends
	                                        else if (x_end == un.x_final) && (y_end == un.y_final) {
	                                            path_delete_point(my_path, path_get_number(my_path) - 1);
	                                            x_end = path_get_x(my_path, 1);
	                                            y_end = path_get_y(my_path, 1);
	                                        }
	                                            else { }
	                                }
	                            break;
	                    }
	                }
	            }
	        }
	    }
	    //Create the final path
	    mp_grid_path(global.move_grid, my_path, x, y, x_end, y_end, diag);
	    if (x_end == x) && (y_end == y)  { move_amount = 0; }
	        else { move_amount = (path_get_number(my_path)-1); }

	    if (move_amount > 0) {
	        if mp_grid_path(global.move_grid, my_path, x, y, x_end, y_end, diag) {
	            can_move = true; 
	            count_start = true;
	            //Set final waypoint
	            x_final = x_end;
	            y_final = y_end;
	            action_points -= (move_amount*mp_cost);
	            //Remove cost
				if instance_exists(obj_EnemyControl_B) {
					obj_EnemyControl_B.turn_ap -= (move_amount*mp_cost);
				}
	            move_amount = 0;
	            nav_confirmed = true;
				mp_grid_add_rectangle(global.move_grid, x_final-36, y_final-36, x_final+36, y_final+36);
	        }
	            else {
	                x_end = x;
	                y_end = y;
	                x_final = x;
	                y_final = y;
	                mp_grid_path(global.move_grid, my_path, x, y, x, y, diag);
					mp_grid_add_rectangle(global.move_grid, x-36, y-36, x+36, y+36);
	                no_move = true;
	            }
	    }
	        else {
	            x_end = x;
	            y_end = y;
	            x_final = x;
	            y_final = y;
	            mp_grid_path(global.move_grid, my_path, x, y, x, y, diag);
				mp_grid_add_rectangle(global.move_grid, x-36, y-36, x+36, y+36);
	            no_move = true;
	        }
	}
	    else {
			mp_grid_add_rectangle(global.move_grid, x-36, y-36, x+36, y+36);
	        no_move = true;
	    }





   






}
