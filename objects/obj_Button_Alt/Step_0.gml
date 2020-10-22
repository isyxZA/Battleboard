if global.game_state == "IN_MENU" {
        if place_meeting(x, y, obj_MOUSE) {
            c1 = make_colour_rgb(240,248,255);
			highlight = true;
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
					case "Refresh"://In room join...refresh server list
						if instance_exists(obj_ServerJoin) {
							with obj_ServerJoin {
								ds_list_clear(server_list);
								ds_list_clear(server_ports);
								ds_list_clear(server_names);
								global.server_IP   = undefined;
								global.server_port = undefined;
								global.server_name = undefined;
							}
						}
                        break;
					case "Host Game"://Multiplayer...goes to room host
						if clicked == false {
							clicked = true;
							PLAYER.net_status = "HOST";
	                        PLAYER.player = "ONE";
							PLAYER.faction = "US";
							PLAYER.opponent_faction = "";
	                        global.transition = true;
	                        global.can_choose = false;
	                        obj_SOUND.fade_out = true;
	                        obj_SOUND.fade_in = false;
							start_game = true;
	                        alarm[6] = 60;
						}
                        break;
					case "Back":
						if room == rm_Setup {
							if PLAYER.net_status == "CLIENT" {
								with obj_CLIENT { instance_destroy(); }
							}
								else if PLAYER.net_status == "SERVER" {
									with obj_SERVER { instance_destroy(); }
								}
						}
						game_restart();
						break;
                }
            }
        }
            else { 
                c1 = c_silver;
				highlight = false;
            }
}


