//Rotate the unit toward the next path point
if global.opponent_turn == true || global.enemy_waiting == true {
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
	
if action_confirmed == true { 
    var d2;
    d2 = point_direction(x, y, target_x, target_y)+rot_adj; 
    if turret_rot != d2  { turret_rot += (sin(degtorad(turret_rot-d2))); }
}
    else { if turret_rot != 180  { turret_rot += (sin(degtorad(turret_rot-180))); } }

