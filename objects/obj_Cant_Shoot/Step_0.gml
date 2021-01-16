if global.opponent_turn == true { active = false; }
    //else if (global.my_turn == true) && (my_unit != -1) { active = true; }
	
if active == true {
    switch kind {
		case -1:
			break;
        case 1:
			var tgt_x = my_unit.target_x;
			var tgt_y = my_unit.target_y;
            var dir   = point_direction(x, y, tgt_x, tgt_y);
            var xdir  = lengthdir_x(global.cell_size, dir);
            var ydir  = lengthdir_y(global.cell_size, dir);
			var ld_x  = tgt_x-xdir;
			var ld_y  = tgt_y-ydir;
            //Infantry, Tank, BTR, TOW, Repair
            t_line = collision_line(x, y, ld_x, ld_y, obj_Cant_Shoot, false, true);
            break;
        case 2:
			var tgt_x = my_unit.target_x;
			var tgt_y = my_unit.target_y;
            //Engineer
            t_line = collision_line(x, y, tgt_x, tgt_y, obj_Cant_Shoot, false, true);
            break;
    }
}

