//Rotate the unit toward the next path point
if global.opponent_turn == true || global.enemy_waiting == true {
	if nav_confirmed == true {
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
	        if rot_path != d { rot_path += (sin(degtorad(rot_path-d))*12); }
	    }
	}
		else { rot_path = rot_offset; }
}

//Set idle image rotation
if rot != rot_offset  { rot -= (sin(degtorad(rot-rot_offset))); }

