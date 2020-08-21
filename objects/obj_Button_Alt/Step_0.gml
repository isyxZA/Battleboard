if global.game_state == "IN_MENU" {
        if place_meeting(x, y, obj_MOUSE) {
            c1 = c_white;
            if mouse_check_button_pressed(mb_left) {
                switch txt {
                    case "Clear":
						if global.locked == false {
	                        with obj_UnitSelector   { clear = true; }
	                        with obj_SquadAssigner  { clear = true; }
	                        with obj_UnitAutoAssign { clear = true; }
						}
                        break;
                    case "Auto-Assign":
						if global.locked == false {
	                        with obj_UnitSelector   { auto_assign = true; }
	                        with obj_SquadAssigner  { auto_assign = true; }
	                        with obj_UnitAutoAssign { auto_assign = true; }
						}
                        break;
					case "Back":
						game_restart();
						break;
                }
            }
        }
            else { 
                c1 = c_gray;
            }
}


