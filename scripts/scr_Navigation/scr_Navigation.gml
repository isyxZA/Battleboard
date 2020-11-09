/// @description scr_Navigation(offset);
/// @param offset
function scr_Navigation(argument0) {
	

	var mx = mouse_x-global.cell_size*0.5 + argument0;
	var my = mouse_y-global.cell_size*0.5;
	var xx = instance_nearest(mx, my, obj_Game_Tile).tile_x;
	var yy = instance_nearest(mx, my, obj_Game_Tile).tile_y;

	var tap1 = 0;

	//Create the navigation path 
	if mp_grid_path(global.move_grid, my_path, x, y, xx, yy, diag) {
	    //Limit movement to move max
	    while (path_get_number(my_path)-1 > move_max) { path_delete_point(my_path, path_get_number(my_path)-1); }  
		//Calculate the ap cost
		var pn1 = path_get_number(my_path)-1;
		var im1;
		for(im1=0; im1<pn1; im1++) {
			var ppx1 = path_get_point_x(my_path, im1);
			var ppy1 = path_get_point_y(my_path, im1);
			var ppc1 = instance_place(ppx1, ppy1, obj_Game_Tile);
			if ppc1 != noone { tap1 += ppc1.move_rating; }
		}
		temp_ap = tap1;
		//Limit movement to action point cost
		while (tap1 > action_points) { 
			path_delete_point(my_path, path_get_number(my_path)-1); 
			if (x_end == x) && (y_end == y) { temp_ap = 0; }
				else {
					pn1 = path_get_number(my_path)-1;
					tap1 = 0;
					var im2;
					for(im2=0; im2<pn1; im2++) {
						var ppx2 = path_get_point_x(my_path, im2);
						var ppy2 = path_get_point_y(my_path, im2);
						var ppc2 = instance_place(ppx2, ppy2, obj_Game_Tile);
						if ppc2 != noone { tap1 += ppc2.move_rating; }
					}
					temp_ap = tap1;
				}
		}
	    //Store the path end coords
	    x_end = path_get_x(my_path, 1);
	    y_end = path_get_y(my_path, 1);
		move_max = min(move_max,path_get_number(my_path)-1);
	    //Check for overlapping path ends...if one exists then delete last point on path
		repeat(move_max) {
	        if !ds_list_empty(global.unit_list){
	            var iu1;
	            for (iu1=0; iu1<ds_list_size(global.unit_list); iu1+=1;) {
	                var u = ds_list_find_value(global.unit_list, iu1);
	                //If u is not self
	                if (u.id != id) {
	                    switch u.unit_type {
	                        //Static Units
	                        case "DEPOT":
	                        case "TOW":
	                        case "MORTAR":
	                            //First check if this unit waypoint is still at start position
	                            //This will prevent adding path points in the negative direction
	                            if (x_end == x) && (y_end == y) {
	                                x_end = path_get_x(my_path, 1);
	                                y_end = path_get_y(my_path, 1);
	                            }
	                                else {
	                                    //Check for overlapping path ends
	                                    if (x_end == u.x_end) && (y_end == u.y_end) {
	                                        //If static unit is not under construction
	                                        if u.can_be_manned == true {
	                                            if unit_type != "INFANTRY" {
	                                                switch unit_type {
	                                                    //If this unit is a vehicle
	                                                    //Prevent from entering static unit
	                                                    case "TANK":
	                                                    case "ENGINEER":
	                                                    case "BTR":
	                                                    case "LOGI":
	                                                        path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                        x_end = path_get_x(my_path, 1);
	                                                        y_end = path_get_y(my_path, 1);
	                                                        break;
	                                                    case "DEPOT":
	                                                    case "REPAIR":
	                                                    case "TOW":
	                                                    case "MORTAR":
	                                                        //When transfering infantry between static units
	                                                        if u.is_manned == true {
	                                                            path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                            x_end = path_get_x(my_path, 1);
	                                                            y_end = path_get_y(my_path, 1);
	                                                        }
	                                                            else if u.is_manned == false {
	                                                            }
	                                                        break;
	                                                }
	                                            }
	                                                //If this unit is infantry
	                                                else { 
	                                                    //If the static unit is already being manned
	                                                    //Prevent from entering static unit
	                                                    if u.is_manned == true {
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
	                                            else if u.can_be_manned == false {
	                                                path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                x_end = path_get_x(my_path, 1);
	                                                y_end = path_get_y(my_path, 1);
	                                            } 
	                                    }
	                                        //Check for overlapping path ends
	                                        else if (x_end == u.x_final) && (y_end == u.y_final) {
	                                            //If static unit is not under construction
	                                            if u.can_be_manned == true {
	                                                if unit_type != "INFANTRY" {
	                                                   switch unit_type {
	                                                    //If this unit is a vehicle
	                                                    //Prevent from entering static unit
	                                                    case "TANK":
	                                                    case "ENGINEER":
	                                                    case "BTR":
	                                                    case "LOGI":
	                                                        path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                        x_end = path_get_x(my_path, 1);
	                                                        y_end = path_get_y(my_path, 1);
	                                                        break;
	                                                    case "DEPOT":
	                                                    case "REPAIR":
	                                                    case "TOW":
	                                                    case "MORTAR":
	                                                        //When transfering infantry between static units
	                                                        if u.is_manned == true {
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
	                                                        if u.is_manned == true {
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
	                                                else if u.can_be_manned == false {
	                                                    path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                    x_end = path_get_x(my_path, 1);
	                                                    y_end = path_get_y(my_path, 1);
	                                                } 
	                                        }
	                                }
	                            break;
	                        case "REPAIR":
	                            //First check if unit is still at start position
	                            //This will prevent adding path points in the negative direction
	                            if (x_end == x) && (y_end == y) {
	                                x_end = path_get_x(my_path, 1);
	                                y_end = path_get_y(my_path, 1);
	                            }
	                                else {
	                                    //If static unit is not under construction
	                                    if (x_end == u.x_end) && (y_end == u.y_end) {
	                                        //If the repair station is not under construction
	                                        if u.can_be_manned == true {
	                                            //If this unit is not infantry
	                                            if unit_type != "INFANTRY" {
	                                                switch unit_type {
	                                                    //Vehicle control
	                                                    case "TANK":
	                                                    case "ENGINEER":
	                                                    case "BTR":
	                                                    case "LOGI":
	                                                        //If the repair station is selecting a waypoint for its manned unit
	                                                        //Prevent vehicle entry
	                                                        if u.nav_split == true || u.is_occupied == true || u.is_manned == false {
	                                                            path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                            x_end = path_get_x(my_path, 1);
	                                                            y_end = path_get_y(my_path, 1);
	                                                        }
	                                                        break;
	                                                    case "DEPOT":
	                                                    case "REPAIR":
	                                                    case "TOW":
	                                                    case "MORTAR":
	                                                        //When transfering infantry between static units
	                                                        if u.is_manned == true {
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
	                                                    if u.is_manned == true {
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
	                                            else if u.can_be_manned == false {
	                                                path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                x_end = path_get_x(my_path, 1);
	                                                y_end = path_get_y(my_path, 1);
	                                            } 
	                                    }
	                                        //Check for overlapping path ends
	                                        else if (x_end == u.x_final) && (y_end == u.y_final) {
	                                            //If the repair station is not under construction
	                                            if u.can_be_manned == true {
	                                                //If this unit is not infantry
	                                                if unit_type != "INFANTRY" {
	                                                    switch unit_type {
	                                                        //Vehicle control
	                                                        case "TANK":
	                                                        case "ENGINEER":
	                                                        case "BTR":
	                                                        case "LOGI":
	                                                            //If the repair station is selecting a waypoint for its manned unit
	                                                            //Prevent vehicle entry
	                                                            if u.nav_split == true || u.is_occupied == true || u.is_manned == false{
	                                                                path_delete_point(my_path, path_get_number(my_path) - 1);
	                                                                x_end = path_get_x(my_path, 1);
	                                                                y_end = path_get_y(my_path, 1);
	                                                            }
	                                                            break;
	                                                        case "DEPOT":
	                                                        case "REPAIR":
	                                                        case "TOW":
	                                                        case "MORTAR":
	                                                            //When transfering infantry between static units
	                                                            if u.is_manned == true {
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
	                                                    if u.is_manned == true {
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
	                                                else if u.can_be_manned == false {
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
	                                    if (x_end == u.x_end) && (y_end == u.y_end) {
	                                        path_delete_point(my_path, path_get_number(my_path) - 1);
	                                        x_end = path_get_x(my_path, 1);
	                                        y_end = path_get_y(my_path, 1);
	                                    }
	                                        //Check for overlapping path ends
	                                        else if (x_end == u.x_final) && (y_end == u.y_final) {
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
	    //Will be executed once CONFIRMED in the ACTIONMENU
	    mp_grid_path(global.move_grid, my_path, x, y, x_end, y_end, diag);
	}
	
	if (x_end == x) && (y_end == y) { move_amount = 0; }
	        else { move_amount = (path_get_number(my_path)-1); }
			
	//Calculate the ap cost
	if !ds_list_empty(global.selected_list) {
	    var ie;
	    global.temp_AP = 0;
	    for (ie=0; ie<ds_list_size(global.selected_list); ie+=1) {
	        var n_unit1 = ds_list_find_value(global.selected_list, ie);
			with n_unit1 {
				if move_amount > 0 {
					temp_ap = 0;
					var im3;
					for(im3=0; im3<move_amount; im3++) {
						var ppx3 = path_get_point_x(my_path, im3);
						var ppy3 = path_get_point_y(my_path, im3);
						var ppc3 = instance_place(ppx3, ppy3, obj_Game_Tile);
						if ppc3 != noone { temp_ap += ppc3.move_rating; }
					}
				}
					else { temp_ap = 0; }
				global.temp_AP += temp_ap;
			}
	    }
	}


}
