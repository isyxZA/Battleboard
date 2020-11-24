if global.game_state == "IN_MENU" {
	if place_meeting(x, y, obj_MOUSE) {
		if txt != "Save" { c1 = make_colour_rgb(240,248,255); }
		highlight = true;
	    if mouse_check_button_pressed(mb_left) {
	        switch txt {
	            case "Clear":
					if global.locked == false {
						with obj_UnitFormations {formation_points = start_points; }
		                //with obj_UnitSelector { clear = true; }
		                with obj_SquadAssigner  { clear = true; }
		                //with obj_UnitFormations { clear = true; }
					}
	                break;
				case "Save":
					if global.can_choose == true && can_save == true {
						//Save the formation to disk
						can_save = false;
						c1 = c_silver;
						var fi = obj_UnitFormations.formation;
						switch fi {
							case 1:
								if file_exists("formation1.sav") { file_delete("formation1.sav"); }
								ini_open("formation1.sav"); //create the file
								//Save as ALPHA
								var lu = ds_list_find_value(global.temp_alpha, 0);
								ini_write_string("ALPHA", "A1", lu);
								lu = ds_list_find_value(global.temp_alpha, 1);
								ini_write_string("ALPHA", "A2", lu);
								lu = ds_list_find_value(global.temp_alpha, 2);
								ini_write_string("ALPHA", "A3", lu);
								lu = ds_list_find_value(global.temp_alpha, 3);
								ini_write_string("ALPHA", "A4", lu);
								lu = ds_list_find_value(global.temp_alpha, 4);
								ini_write_string("ALPHA", "A5", lu);
								lu = ds_list_find_value(global.temp_alpha, 5);
								ini_write_string("ALPHA", "A6", lu);
								//Save as BRAVO
								lu = ds_list_find_value(global.temp_bravo, 0);
								ini_write_string("BRAVO", "B1", lu);
								lu = ds_list_find_value(global.temp_bravo, 1);
								ini_write_string("BRAVO", "B2", lu);
								lu = ds_list_find_value(global.temp_bravo, 2);
								ini_write_string("BRAVO", "B3", lu);
								lu = ds_list_find_value(global.temp_bravo, 3);
								ini_write_string("BRAVO", "B4", lu);
								lu = ds_list_find_value(global.temp_bravo, 4);
								ini_write_string("BRAVO", "B5", lu);
								lu = ds_list_find_value(global.temp_bravo, 5);
								ini_write_string("BRAVO", "B6", lu);
								//Save as CHARLIE
								lu = ds_list_find_value(global.temp_charlie, 0);
								ini_write_string("CHARLIE", "C1", lu);
								lu = ds_list_find_value(global.temp_charlie, 1);
								ini_write_string("CHARLIE", "C2", lu);
								lu = ds_list_find_value(global.temp_charlie, 2);
								ini_write_string("CHARLIE", "C3", lu);
								lu = ds_list_find_value(global.temp_charlie, 3);
								ini_write_string("CHARLIE", "C4", lu);
								lu = ds_list_find_value(global.temp_charlie, 4);
								ini_write_string("CHARLIE", "C5", lu);
								lu = ds_list_find_value(global.temp_charlie, 5);
								ini_write_string("CHARLIE", "C6", lu);
								//Save as DELTA
								lu = ds_list_find_value(global.temp_delta, 0);
								ini_write_string("DELTA", "D1", lu);
								lu = ds_list_find_value(global.temp_delta, 1);
								ini_write_string("DELTA", "D2", lu);
								lu = ds_list_find_value(global.temp_delta, 2);
								ini_write_string("DELTA", "D3", lu);
								lu = ds_list_find_value(global.temp_delta, 3);
								ini_write_string("DELTA", "D4", lu);
								lu = ds_list_find_value(global.temp_delta, 4);
								ini_write_string("DELTA", "D5", lu);
								lu = ds_list_find_value(global.temp_delta, 5);
								ini_write_string("DELTA", "D6", lu);
								//Save as ECHO
								lu = ds_list_find_value(global.temp_echo, 0);
								ini_write_string("ECHO", "E1", lu);
								lu = ds_list_find_value(global.temp_echo, 1);
								ini_write_string("ECHO", "E2", lu);
								lu = ds_list_find_value(global.temp_echo, 2);
								ini_write_string("ECHO", "E3", lu);
								lu = ds_list_find_value(global.temp_echo, 3);
								ini_write_string("ECHO", "E4", lu);
								lu = ds_list_find_value(global.temp_echo, 4);
								ini_write_string("ECHO", "E5", lu);
								lu = ds_list_find_value(global.temp_echo, 5);
								ini_write_string("ECHO", "E6", lu);
								ini_close();
								break;
							case 2:
								if file_exists("formation2.sav") { file_delete("formation2.sav"); }
								ini_open("formation2.sav"); //create the file
								//Save as ALPHA
								var lu = ds_list_find_value(global.temp_alpha, 0);
								ini_write_string("ALPHA", "A1", lu);
								lu = ds_list_find_value(global.temp_alpha, 1);
								ini_write_string("ALPHA", "A2", lu);
								lu = ds_list_find_value(global.temp_alpha, 2);
								ini_write_string("ALPHA", "A3", lu);
								lu = ds_list_find_value(global.temp_alpha, 3);
								ini_write_string("ALPHA", "A4", lu);
								lu = ds_list_find_value(global.temp_alpha, 4);
								ini_write_string("ALPHA", "A5", lu);
								lu = ds_list_find_value(global.temp_alpha, 5);
								ini_write_string("ALPHA", "A6", lu);
								//Save as BRAVO
								lu = ds_list_find_value(global.temp_bravo, 0);
								ini_write_string("BRAVO", "B1", lu);
								lu = ds_list_find_value(global.temp_bravo, 1);
								ini_write_string("BRAVO", "B2", lu);
								lu = ds_list_find_value(global.temp_bravo, 2);
								ini_write_string("BRAVO", "B3", lu);
								lu = ds_list_find_value(global.temp_bravo, 3);
								ini_write_string("BRAVO", "B4", lu);
								lu = ds_list_find_value(global.temp_bravo, 4);
								ini_write_string("BRAVO", "B5", lu);
								lu = ds_list_find_value(global.temp_bravo, 5);
								ini_write_string("BRAVO", "B6", lu);
								//Save as CHARLIE
								lu = ds_list_find_value(global.temp_charlie, 0);
								ini_write_string("CHARLIE", "C1", lu);
								lu = ds_list_find_value(global.temp_charlie, 1);
								ini_write_string("CHARLIE", "C2", lu);
								lu = ds_list_find_value(global.temp_charlie, 2);
								ini_write_string("CHARLIE", "C3", lu);
								lu = ds_list_find_value(global.temp_charlie, 3);
								ini_write_string("CHARLIE", "C4", lu);
								lu = ds_list_find_value(global.temp_charlie, 4);
								ini_write_string("CHARLIE", "C5", lu);
								lu = ds_list_find_value(global.temp_charlie, 5);
								ini_write_string("CHARLIE", "C6", lu);
								//Save as DELTA
								lu = ds_list_find_value(global.temp_delta, 0);
								ini_write_string("DELTA", "D1", lu);
								lu = ds_list_find_value(global.temp_delta, 1);
								ini_write_string("DELTA", "D2", lu);
								lu = ds_list_find_value(global.temp_delta, 2);
								ini_write_string("DELTA", "D3", lu);
								lu = ds_list_find_value(global.temp_delta, 3);
								ini_write_string("DELTA", "D4", lu);
								lu = ds_list_find_value(global.temp_delta, 4);
								ini_write_string("DELTA", "D5", lu);
								lu = ds_list_find_value(global.temp_delta, 5);
								ini_write_string("DELTA", "D6", lu);
								//Save as ECHO
								lu = ds_list_find_value(global.temp_echo, 0);
								ini_write_string("ECHO", "E1", lu);
								lu = ds_list_find_value(global.temp_echo, 1);
								ini_write_string("ECHO", "E2", lu);
								lu = ds_list_find_value(global.temp_echo, 2);
								ini_write_string("ECHO", "E3", lu);
								lu = ds_list_find_value(global.temp_echo, 3);
								ini_write_string("ECHO", "E4", lu);
								lu = ds_list_find_value(global.temp_echo, 4);
								ini_write_string("ECHO", "E5", lu);
								lu = ds_list_find_value(global.temp_echo, 5);
								ini_write_string("ECHO", "E6", lu);
								ini_close();
								break;
							case 3:
								if file_exists("formation3.sav") { file_delete("formation3.sav"); }
								ini_open("formation3.sav"); //create the file
								//Save as ALPHA
								var lu = ds_list_find_value(global.temp_alpha, 0);
								ini_write_string("ALPHA", "A1", lu);
								lu = ds_list_find_value(global.temp_alpha, 1);
								ini_write_string("ALPHA", "A2", lu);
								lu = ds_list_find_value(global.temp_alpha, 2);
								ini_write_string("ALPHA", "A3", lu);
								lu = ds_list_find_value(global.temp_alpha, 3);
								ini_write_string("ALPHA", "A4", lu);
								lu = ds_list_find_value(global.temp_alpha, 4);
								ini_write_string("ALPHA", "A5", lu);
								lu = ds_list_find_value(global.temp_alpha, 5);
								ini_write_string("ALPHA", "A6", lu);
								//Save as BRAVO
								lu = ds_list_find_value(global.temp_bravo, 0);
								ini_write_string("BRAVO", "B1", lu);
								lu = ds_list_find_value(global.temp_bravo, 1);
								ini_write_string("BRAVO", "B2", lu);
								lu = ds_list_find_value(global.temp_bravo, 2);
								ini_write_string("BRAVO", "B3", lu);
								lu = ds_list_find_value(global.temp_bravo, 3);
								ini_write_string("BRAVO", "B4", lu);
								lu = ds_list_find_value(global.temp_bravo, 4);
								ini_write_string("BRAVO", "B5", lu);
								lu = ds_list_find_value(global.temp_bravo, 5);
								ini_write_string("BRAVO", "B6", lu);
								//Save as CHARLIE
								lu = ds_list_find_value(global.temp_charlie, 0);
								ini_write_string("CHARLIE", "C1", lu);
								lu = ds_list_find_value(global.temp_charlie, 1);
								ini_write_string("CHARLIE", "C2", lu);
								lu = ds_list_find_value(global.temp_charlie, 2);
								ini_write_string("CHARLIE", "C3", lu);
								lu = ds_list_find_value(global.temp_charlie, 3);
								ini_write_string("CHARLIE", "C4", lu);
								lu = ds_list_find_value(global.temp_charlie, 4);
								ini_write_string("CHARLIE", "C5", lu);
								lu = ds_list_find_value(global.temp_charlie, 5);
								ini_write_string("CHARLIE", "C6", lu);
								//Save as DELTA
								lu = ds_list_find_value(global.temp_delta, 0);
								ini_write_string("DELTA", "D1", lu);
								lu = ds_list_find_value(global.temp_delta, 1);
								ini_write_string("DELTA", "D2", lu);
								lu = ds_list_find_value(global.temp_delta, 2);
								ini_write_string("DELTA", "D3", lu);
								lu = ds_list_find_value(global.temp_delta, 3);
								ini_write_string("DELTA", "D4", lu);
								lu = ds_list_find_value(global.temp_delta, 4);
								ini_write_string("DELTA", "D5", lu);
								lu = ds_list_find_value(global.temp_delta, 5);
								ini_write_string("DELTA", "D6", lu);
								//Save as ECHO
								lu = ds_list_find_value(global.temp_echo, 0);
								ini_write_string("ECHO", "E1", lu);
								lu = ds_list_find_value(global.temp_echo, 1);
								ini_write_string("ECHO", "E2", lu);
								lu = ds_list_find_value(global.temp_echo, 2);
								ini_write_string("ECHO", "E3", lu);
								lu = ds_list_find_value(global.temp_echo, 3);
								ini_write_string("ECHO", "E4", lu);
								lu = ds_list_find_value(global.temp_echo, 4);
								ini_write_string("ECHO", "E5", lu);
								lu = ds_list_find_value(global.temp_echo, 5);
								ini_write_string("ECHO", "E6", lu);
								ini_close();
								break;
							case 4:
								if file_exists("formation4.sav") { file_delete("formation4.sav"); }
								ini_open("formation4.sav"); //create the file
								//Save as ALPHA
								var lu = ds_list_find_value(global.temp_alpha, 0);
								ini_write_string("ALPHA", "A1", lu);
								lu = ds_list_find_value(global.temp_alpha, 1);
								ini_write_string("ALPHA", "A2", lu);
								lu = ds_list_find_value(global.temp_alpha, 2);
								ini_write_string("ALPHA", "A3", lu);
								lu = ds_list_find_value(global.temp_alpha, 3);
								ini_write_string("ALPHA", "A4", lu);
								lu = ds_list_find_value(global.temp_alpha, 4);
								ini_write_string("ALPHA", "A5", lu);
								lu = ds_list_find_value(global.temp_alpha, 5);
								ini_write_string("ALPHA", "A6", lu);
								//Save as BRAVO
								lu = ds_list_find_value(global.temp_bravo, 0);
								ini_write_string("BRAVO", "B1", lu);
								lu = ds_list_find_value(global.temp_bravo, 1);
								ini_write_string("BRAVO", "B2", lu);
								lu = ds_list_find_value(global.temp_bravo, 2);
								ini_write_string("BRAVO", "B3", lu);
								lu = ds_list_find_value(global.temp_bravo, 3);
								ini_write_string("BRAVO", "B4", lu);
								lu = ds_list_find_value(global.temp_bravo, 4);
								ini_write_string("BRAVO", "B5", lu);
								lu = ds_list_find_value(global.temp_bravo, 5);
								ini_write_string("BRAVO", "B6", lu);
								//Save as CHARLIE
								lu = ds_list_find_value(global.temp_charlie, 0);
								ini_write_string("CHARLIE", "C1", lu);
								lu = ds_list_find_value(global.temp_charlie, 1);
								ini_write_string("CHARLIE", "C2", lu);
								lu = ds_list_find_value(global.temp_charlie, 2);
								ini_write_string("CHARLIE", "C3", lu);
								lu = ds_list_find_value(global.temp_charlie, 3);
								ini_write_string("CHARLIE", "C4", lu);
								lu = ds_list_find_value(global.temp_charlie, 4);
								ini_write_string("CHARLIE", "C5", lu);
								lu = ds_list_find_value(global.temp_charlie, 5);
								ini_write_string("CHARLIE", "C6", lu);
								//Save as DELTA
								lu = ds_list_find_value(global.temp_delta, 0);
								ini_write_string("DELTA", "D1", lu);
								lu = ds_list_find_value(global.temp_delta, 1);
								ini_write_string("DELTA", "D2", lu);
								lu = ds_list_find_value(global.temp_delta, 2);
								ini_write_string("DELTA", "D3", lu);
								lu = ds_list_find_value(global.temp_delta, 3);
								ini_write_string("DELTA", "D4", lu);
								lu = ds_list_find_value(global.temp_delta, 4);
								ini_write_string("DELTA", "D5", lu);
								lu = ds_list_find_value(global.temp_delta, 5);
								ini_write_string("DELTA", "D6", lu);
								//Save as ECHO
								lu = ds_list_find_value(global.temp_echo, 0);
								ini_write_string("ECHO", "E1", lu);
								lu = ds_list_find_value(global.temp_echo, 1);
								ini_write_string("ECHO", "E2", lu);
								lu = ds_list_find_value(global.temp_echo, 2);
								ini_write_string("ECHO", "E3", lu);
								lu = ds_list_find_value(global.temp_echo, 3);
								ini_write_string("ECHO", "E4", lu);
								lu = ds_list_find_value(global.temp_echo, 4);
								ini_write_string("ECHO", "E5", lu);
								lu = ds_list_find_value(global.temp_echo, 5);
								ini_write_string("ECHO", "E6", lu);
								ini_close();
								break;
							case 5:
								if file_exists("formation5.sav") { file_delete("formation5.sav"); }
								ini_open("formation5.sav"); //create the file
								//Save as ALPHA
								var lu = ds_list_find_value(global.temp_alpha, 0);
								ini_write_string("ALPHA", "A1", lu);
								lu = ds_list_find_value(global.temp_alpha, 1);
								ini_write_string("ALPHA", "A2", lu);
								lu = ds_list_find_value(global.temp_alpha, 2);
								ini_write_string("ALPHA", "A3", lu);
								lu = ds_list_find_value(global.temp_alpha, 3);
								ini_write_string("ALPHA", "A4", lu);
								lu = ds_list_find_value(global.temp_alpha, 4);
								ini_write_string("ALPHA", "A5", lu);
								lu = ds_list_find_value(global.temp_alpha, 5);
								ini_write_string("ALPHA", "A6", lu);
								//Save as BRAVO
								lu = ds_list_find_value(global.temp_bravo, 0);
								ini_write_string("BRAVO", "B1", lu);
								lu = ds_list_find_value(global.temp_bravo, 1);
								ini_write_string("BRAVO", "B2", lu);
								lu = ds_list_find_value(global.temp_bravo, 2);
								ini_write_string("BRAVO", "B3", lu);
								lu = ds_list_find_value(global.temp_bravo, 3);
								ini_write_string("BRAVO", "B4", lu);
								lu = ds_list_find_value(global.temp_bravo, 4);
								ini_write_string("BRAVO", "B5", lu);
								lu = ds_list_find_value(global.temp_bravo, 5);
								ini_write_string("BRAVO", "B6", lu);
								//Save as CHARLIE
								lu = ds_list_find_value(global.temp_charlie, 0);
								ini_write_string("CHARLIE", "C1", lu);
								lu = ds_list_find_value(global.temp_charlie, 1);
								ini_write_string("CHARLIE", "C2", lu);
								lu = ds_list_find_value(global.temp_charlie, 2);
								ini_write_string("CHARLIE", "C3", lu);
								lu = ds_list_find_value(global.temp_charlie, 3);
								ini_write_string("CHARLIE", "C4", lu);
								lu = ds_list_find_value(global.temp_charlie, 4);
								ini_write_string("CHARLIE", "C5", lu);
								lu = ds_list_find_value(global.temp_charlie, 5);
								ini_write_string("CHARLIE", "C6", lu);
								//Save as DELTA
								lu = ds_list_find_value(global.temp_delta, 0);
								ini_write_string("DELTA", "D1", lu);
								lu = ds_list_find_value(global.temp_delta, 1);
								ini_write_string("DELTA", "D2", lu);
								lu = ds_list_find_value(global.temp_delta, 2);
								ini_write_string("DELTA", "D3", lu);
								lu = ds_list_find_value(global.temp_delta, 3);
								ini_write_string("DELTA", "D4", lu);
								lu = ds_list_find_value(global.temp_delta, 4);
								ini_write_string("DELTA", "D5", lu);
								lu = ds_list_find_value(global.temp_delta, 5);
								ini_write_string("DELTA", "D6", lu);
								//Save as ECHO
								lu = ds_list_find_value(global.temp_echo, 0);
								ini_write_string("ECHO", "E1", lu);
								lu = ds_list_find_value(global.temp_echo, 1);
								ini_write_string("ECHO", "E2", lu);
								lu = ds_list_find_value(global.temp_echo, 2);
								ini_write_string("ECHO", "E3", lu);
								lu = ds_list_find_value(global.temp_echo, 3);
								ini_write_string("ECHO", "E4", lu);
								lu = ds_list_find_value(global.temp_echo, 4);
								ini_write_string("ECHO", "E5", lu);
								lu = ds_list_find_value(global.temp_echo, 5);
								ini_write_string("ECHO", "E6", lu);
								ini_close();
								break;
						}
					}
					break;
	            case "Auto-Assign":
					if global.locked == false {
		                with obj_UnitSelector   { auto_assign = true; }
		                with obj_SquadAssigner  { auto_assign = true; }
		                with obj_UnitFormations { auto_assign = true; }
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
			if txt == "Save" {
				if global.can_choose == true  { 
					if can_save == true { c1 = c_green; }
						else { }
				}
					else  { c1 = make_colour_rgb(153,25,0); }
			}
				else { c1 = c_silver; }
			highlight = false;
	    }
}


