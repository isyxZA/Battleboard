with obj_Unit_Parent {
	switch unit_type {
		case "LANDINGCRAFT":
			break;
		case "INF_A":
		case "INF_B":
			if p_one == true {
				if nav_confirmed == false {
					draw_sprite_ext(my_sprite, 0, x-4, y+4, scl, scl, rot, c_black, 0.6);
				}
			}
				else {
					if nav_confirmed == false {
						draw_sprite_ext(my_sprite, 0, x+4, y-4, scl, scl, rot, c_black, 0.6);
					}
				}
			break;
		case "MBT_A":
		case "MBT_B":
		case "LAC_A":
		case "LAC_B":
		case "LAV_A": 
		case "LAV_B":
		case "LOGI_A":
		case "LOGI_B":
			if p_one == true {
				if nav_confirmed == false {
					draw_sprite_ext(my_sprite, 0, x-4, y+4, scl, scl, rot, c_black, 0.6);
				}
			}
				else {
					if nav_confirmed == false {
						draw_sprite_ext(my_sprite, 0, x+4, y-4, scl, scl, rot, c_black, 0.6);
					}
				}
			break;
		case "DEPOT" :
		case "REPAIR": 
		case "TOW"   :
		case "MORTAR":
			if p_one == true {
				draw_sprite_ext(my_sprite, 0, x-4, y+4, scl, scl, 0, c_black, 0.6);
			}
				else {
					draw_sprite_ext(my_sprite, 0, x+4, y-4, scl, scl, 0, c_black, 0.6); 
				}
			break;
	}
}
with obj_Enemy_Parent {
	if is_visible == true {
		switch unit_type {
			case "E_INFA":
			case "E_INFB":
				if p_one == true {
					if nav_confirmed == false {
						draw_sprite_ext(my_sprite, 0, x-4, y+4, scl, scl, rot, c_black, my_alpha*0.6); 
					}
				}
					else {
						if nav_confirmed == false {
							draw_sprite_ext(my_sprite, 0, x+4, y-4, scl, scl, rot, c_black, my_alpha*0.6);
						}
					}
				break;
			case "E_MBTA":
			case "E_MBTB":
			case "E_LACA":
			case "E_LACB":
			case "E_LAVA":
			case "E_LAVB":
			case "E_LOGIA":
			case "E_LOGIB":
				if p_one == true {
					if nav_confirmed == false {
						draw_sprite_ext(my_sprite, 0, x-4, y+4, scl, scl, rot, c_black, my_alpha*0.6); 
					}
				}
					else {
						if nav_confirmed == false {
							draw_sprite_ext(my_sprite, 0, x+4, y-4, scl, scl, rot, c_black, my_alpha*0.6);
						}
					}
				break;
			case "E_DEPOT":
			case "E_REPAIR":
			case "E_TOW":
			case "E_MORTAR":
				if p_one == true {
					draw_sprite_ext(my_sprite, 0, x-4, y+4, scl, scl, rot, c_black, my_alpha*0.6); 
				}
					else {
						draw_sprite_ext(my_sprite, 0, x+4, y-4, scl, scl, rot, c_black, my_alpha*0.6); 
					}
				break;
		}
	}
}
