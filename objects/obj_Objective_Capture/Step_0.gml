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
					case "INF_A":
					case "MBT_A":
					case "LAC_A":
					case "LAV_A":
					case "LOGI_A":
					case "INF_B":
					case "MBT_B":
					case "LAC_B":
					case "LAV_B":
					case "LOGI_B":
					case "DEPOT":
					case "REPAIR":
					case "TOW":
					case "MORTAR":
						u1 ++;
						break;
					case "E_INFA":
					case "E_MBTA":
					case "E_LACA":
					case "E_LAVA":
					case "E_LOGIA":
					case "E_INFB":
					case "E_MBTB":
					case "E_LACB":
					case "E_LAVB":
					case "E_LOGIB":
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
			if capture_pos == 9 { if u2 == 0 { capture_pos += 1; } }
				else { capture_pos += 1; }
			if capture_pos >= 10 { capture_pos = 10; objective_cap += 1; }
		}
			else if ptwo_units>pone_units { 
				//If player two controls the area
				if capture_pos == -9 { if u1 == 0 { capture_pos -= 1; } }
					else { capture_pos -= 1; }
				if capture_pos <= -10 { capture_pos = -10; objective_cap -= 1; }
			}
		if p_one == true { flag_x = x+(capture_pos*(x_ref*0.1)); }
			else { flag_x = x-(capture_pos*(x_ref*0.1)); }
    }
}

