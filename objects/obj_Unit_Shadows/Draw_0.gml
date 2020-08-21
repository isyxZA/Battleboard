with obj_Unit_Parent {
	switch unit_type {
		case "LANDINGCRAFT":
			break;
		case "INFANTRY":
			if p_one == true {
				if nav_confirmed == false {
					draw_sprite_ext(my_sprite, 0, x-4, y+4, scl, scl, rot, c_black, 0.6);
				}
					else {
						draw_sprite_ext(my_sprite, 0, x_final-4, y_final+4, scl, scl, 0, c_black, 0.6);
					}
			}
				else {
					if nav_confirmed == false {
						draw_sprite_ext(my_sprite, 0, x+4, y-4, scl, scl, rot, c_black, 0.6);
					}
						else {
							draw_sprite_ext(my_sprite, 0, x_final+4, y_final-4, scl, scl, 0, c_black, 0.6);
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
					else {
						draw_sprite_ext(my_sprite, 0, x_final-4, y_final+4, scl, scl, 0, c_black, 0.6);
					}
			}
				else {
					if nav_confirmed == false {
						draw_sprite_ext(my_sprite, 0, x+4, y-4, scl, scl, 0, c_black, 0.6);
					}
						else {
							draw_sprite_ext(my_sprite, 0, x_final+4, y_final-4, scl, scl, 0, c_black, 0.6);
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
		if p_one == true {
			if nav_confirmed == false {
					if action_confirmed == true { draw_sprite_ext(my_sprite, 0, x-4, y+4, scl, scl, rot, c_black, my_alpha*0.6); }
						else { draw_sprite_ext(my_sprite, 0, x-4, y+4, scl,scl, 0, c_black, my_alpha*0.6); }
				}
					else {
						draw_sprite_ext(my_sprite, 0, x_final-4, y_final+4, scl,scl, 0, c_black, my_alpha*0.6);
					}
			}
				else {
					if nav_confirmed == false {
						if action_confirmed == true { draw_sprite_ext(my_sprite, 0, x+4, y-4, scl, scl, rot, c_black, my_alpha*0.6); }
							else { draw_sprite_ext(my_sprite, 0, x+4, y-4, scl,scl, 0, c_black, my_alpha*0.6); }
					}
						else {
							draw_sprite_ext(my_sprite, 0, x_final+4, y_final-4, scl, scl, 0, c_black, my_alpha*0.6);
						}
			}
	}
}
