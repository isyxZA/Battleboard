with obj_Unit_Parent {
	switch unit_type {
		case "LANDINGCRAFT":
			break;
		case "INFANTRY":
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
		case "TANK":
		case "BTR" : 
		case "LOGI":
		case "ENGINEER":
			if p_one == true {
				if nav_confirmed == false {
					draw_sprite_ext(my_sprite, 0, x-4, y+4, scl, scl, 0, c_black, 0.6);
				}
			}
				else {
					if nav_confirmed == false {
						draw_sprite_ext(my_sprite, 0, x+4, y-4, scl, scl, 0, c_black, 0.6);
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
			case "E_INFANTRY":
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
			case "E_TANK":
			case "E_ENGINEER":
			case "E_BTR":
			case "E_LOGI":
				if p_one == true {
					if nav_confirmed == false {
						draw_sprite_ext(my_sprite, 0, x-4, y+4, scl, scl, 0, c_black, my_alpha*0.6); 
					}
				}
					else {
						if nav_confirmed == false {
							draw_sprite_ext(my_sprite, 0, x+4, y-4, scl, scl, 0, c_black, my_alpha*0.6);
						}
					}
				break;
			case "E_DEPOT":
			case "E_REPAIR":
			case "E_TOW":
			case "E_MORTAR":
				if p_one == true {
					draw_sprite_ext(my_sprite, 0, x-4, y+4, scl, scl, 0, c_black, my_alpha*0.6); 
				}
					else {
						draw_sprite_ext(my_sprite, 0, x+4, y-4, scl, scl, 0, c_black, my_alpha*0.6); 
					}
				break;
		}
	}
}
