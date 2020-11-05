if global.opponent_turn == true { active = false; }
    else if global.my_turn == true { 
		if global.reticule_display == true { active = true; }
			else { active = false; }
	}
    
if active == true {
    switch kind {
		case -1:
			break;
        case 1:
            var dir = point_direction(x, y, my_unit.target_x, my_unit.target_y);
            var xdir = lengthdir_x(global.cell_size, dir);
            var ydir = lengthdir_y(global.cell_size, dir);
            //Infantry, Tank, BTR, TOW, Repair
            t_line = collision_line(x, y, my_unit.target_x-xdir, my_unit.target_y-ydir, obj_Cant_Shoot, false, true);
            break;
        case 2:
            //Engineer
            t_line = collision_line(x, y, my_unit.target_x, my_unit.target_y, obj_Cant_Shoot, false, true);
            break;
    }
}

