if can_count == true {
	can_count = false;
	//Check which game tiles are in range
    if !ds_list_empty(global.unit_list) {
		var u1 = 0;
		var u2 = 0;
        var i;
        for (i=0; i<ds_list_size(global.unit_list); i+=1) {
            var z = ds_list_find_value(global.unit_list, i);
            if point_in_circle(z.x,z.y, x, y, capture_radius) {
				switch z.unit_type {
					case "INFANTRY":
					case "TANK":
					case "ENGINEER":
					case "BTR":
					case "LOGI":
					case "DEPOT":
					case "REPAIR":
					case "TOW":
					case "MORTAR":
						u1 ++;
						break;
					case "E_INFANTRY":
					case "E_TANK":
					case "E_ENGINEER":
					case "E_BTR":
					case "E_LOGI":
					case "E_DEPOT":
					case "E_REPAIR":
					case "E_TOW":
					case "E_MORTAR":
						u2 ++;
						break;
				}
            }
        }
		pone_units = u1;
		ptwo_units = u2;
		if pone_units>ptwo_units { 
			//If player one controls the objective
			capture_pos += 1;
			if capture_pos >= 10 { capture_pos = 10; objective_cap += 1; }
		}
			else if ptwo_units>pone_units { 
				//If player two controls the area
				capture_pos -= 1;
				if capture_pos <= -10 { capture_pos = -10; objective_cap -= 1; }
			}
		if p_one == true { flag_x = x+(capture_pos*(x_ref*0.1)); }
			else { flag_x = x-(capture_pos*(x_ref*0.1)); }
    }
}

