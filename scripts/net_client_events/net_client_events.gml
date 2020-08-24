function net_client_events() {

	//Gets the data passed in by the connection data. (net_client_connections)
	var data = argument[0];

	//Reads which event id was sent by the server. (The first data sent from the server)
	var event = buffer_read(data,buffer_u8);

	//Checks which type of event has been requested.
	switch(event){
		case NET_CONNECT: //Get connect data from host
			var pos = buffer_read(data,buffer_string);
			var fac = buffer_read(data,buffer_string);
			var tmr = buffer_read(data,buffer_u8);
			if pos == "ONE" { PLAYER.player = "TWO"; }
				else { PLAYER.player = "ONE"; }
			PLAYER.opponent_faction = fac;
			global.turn_timer       = tmr;
			//Send back connect data to host
			net_write_server(buffer_u8, NET_CONNECT, buffer_string, PLAYER.faction);
			break;
		case NET_STARTGAME:
			global.transition = true;
			obj_MENUBUTTON.alarm[3] = 80;
			break;
		case NET_PING: //Ping from host
			//Reads the time sent from the client.
			var stime = buffer_read(data,buffer_u32);
			ping = current_time-stime;
			break;
		case NET_FACTION://Recieve host faction
			var fac = buffer_read(data,buffer_string);
			PLAYER.opponent_faction = fac;
			break;
		case NET_POSITION://Recieve host player position
			var pos = buffer_read(data,buffer_string);
			if pos == "ONE" { PLAYER.player = "TWO"; }
				else { PLAYER.player = "ONE"; }
			break;
		case NET_TIMER: 
			var tmr = buffer_read(data,buffer_u8);
			global.turn_timer = tmr;
			break;
		case NET_GREENLIGHT: 
			break;
		case NET_SPAWN:
			var xx     = buffer_read(data,buffer_u16);
			var yy     = buffer_read(data,buffer_u16);
			temp_id    = buffer_read(data, buffer_u32);
			var uu     = buffer_read(data,buffer_string);
			temp_squad = buffer_read(data,buffer_string);
			switch uu {
				case "INFANTRY":
					temp_unit = obj_Enemy_Infantry;
					break;
				case "TANK":
					temp_unit = obj_Enemy_Tank;
					break;
				case "ENGINEER":
					temp_unit = obj_Enemy_Engineer;
					break;
				case "BTR":
					temp_unit = obj_Enemy_BTR;
					break;
				case "LOGI":
					temp_unit = obj_Enemy_Logi;
					break;
				case "DEPOT":
					temp_unit = obj_Enemy_Depot;
					break;
				case "REPAIR":
					temp_unit = obj_Enemy_Repair;
					break;
				case "TOW":
					temp_unit = obj_Enemy_TOW;
					break;
				case "MORTAR":
					temp_unit = obj_Enemy_Mortar;
					break;
				default:
					temp_unit = -1;
					break;
			}
			if temp_id != - 1 {
				if temp_unit != -1 {
					if temp_squad != "" {
					//Create the unit
				        with instance_create_layer(xx, yy, "Units", temp_unit) { 
							net_id   = obj_CLIENT.temp_id;
				            my_squad = obj_CLIENT.temp_squad; 
				            //Add to squad list
				            switch my_squad {
				                case "ALPHA":
				                    ds_list_add(global.squad_1, id);
				                    break;
				                case "BRAVO":
				                    ds_list_add(global.squad_2, id);
				                    break;
				                case "CHARLIE":
				                    ds_list_add(global.squad_3, id);
				                    break;
				                case "DELTA":
				                    ds_list_add(global.squad_4, id);
				                    break;
				                case "ECHO":
				                    ds_list_add(global.squad_5, id);
				                    break;
				            }
				        }
						//Reset temp variables
						temp_id  = -1;
						my_unit  = -1;
						my_squad = "";
					}
						else {
							show_debug_message("Unable to spawn unit! Invalid temp_squad");
							//Reset temp variables
							temp_id  = -1;
							my_unit  = -1;
							my_squad = "";
						}
				}
					else {
						show_debug_message("Unable to spawn unit! Invalid temp_unit");
						//Reset temp variables
						temp_id  = -1;
						my_unit  = -1;
						my_squad = "";
					}
			}
				else {
					show_debug_message("Unable to spawn unit! Invalid temp_id");
					//Reset temp variables
					temp_id  = -1;
					my_unit  = -1;
					my_squad = "";
				}
			break;
		case NET_SQUADUPDATE:
			break;
		case NET_DESTROY:
			break;
		case NET_SHOOT:
			//Get net_id
			temp_id     = buffer_read(data, buffer_u32);
			//Get target coords
			temp_xfinal = buffer_read(data,buffer_u16);
			temp_yfinal = buffer_read(data,buffer_u16);
			//Get weapon type
			temp_weapon = buffer_read(data, buffer_string);
			//Get shoot amount
			temp_amount = buffer_read(data, buffer_u8);
			with obj_Enemy_Parent {
				if net_id == obj_CLIENT.temp_id {
					action_confirmed = true;
					target_x         = obj_CLIENT.temp_xfinal;
					target_y         = obj_CLIENT.temp_yfinal;
					weapon           = obj_CLIENT.temp_weapon;
					shoot_amount     = obj_CLIENT.temp_amount;
					global.enemyunits_running += 1;
					switch weapon {
						case "RIFLE":
							shoot_rifle = true;
							break;
						case "RPG":
							shoot_rpg = true;
							break;
						case "CANNON":
							shoot_cannon = true;
							break;
						case "MG":
							shoot_mg = true;
							break;
						case "TOW":
							shoot_tow = true;
							break;
						case "HE":
							shoot_he = true;
							break;
						case "AP":
							shoot_ap = true;
							break;
					}
				}
			}
			//Reset temp variables
			temp_id     = -1;
			temp_xfinal = -1;
			temp_yfinal = -1;
			temp_weapon = "";
			temp_amount = 0;
			break;
		case NET_CANCELSHOOT:
			//Find matching unit net_id
			temp_id = buffer_read(data, buffer_u32);
			with obj_Enemy_Parent {
				if net_id == obj_CLIENT.temp_id {
					action_confirmed = false;
					shoot_amount = 0;
					timer_start = false;
					switch unit_type {
						case "INFANTRY":
							if shoot_rifle == true { shoot_rifle = false; }
							if shoot_rpg   == true { shoot_rpg   = false; }
							break;
						case "TANK":
							if shoot_cannon == true { shoot_cannon = false; }
							if shoot_mg     == true { shoot_mg     = false; }
							break;
						case "BTR":
							if shoot_he   == true { shoot_he   = false; }
							if shoot_ap   == true { shoot_ap   = false; }
							break;
						case "TOW":
							if shoot_tow == true { shoot_tow = false; }
							break;
						case "REPAIR":
							if shoot_mg == true { shoot_rifle = false; }
							break;
					}
				}
			}
			//Reset temp variables
			temp_id = -1;
			break;
		case NET_MOVE:
			//Find matching unit net_id
			temp_id    = buffer_read(data, buffer_u32);
			//Transfer navigation waypoint
			temp_xfinal = buffer_read(data,buffer_u16);
			temp_yfinal = buffer_read(data,buffer_u16);
			with obj_Enemy_Parent {
				if net_id == obj_CLIENT.temp_id {
					mp_grid_clear_rectangle(global.move_grid, x-40, y-40, x+40, y+40);
		            //Set final waypoint
		            x_final = obj_CLIENT.temp_xfinal;
		            y_final = obj_CLIENT.temp_yfinal;
					can_move = true; 
					count_start = true;
					nav_confirmed = true;
					mp_grid_add_rectangle(global.move_grid, x_final-36, y_final-36, x_final+36, y_final+36);
				}
			}
			//Reset temp variables
			temp_id     = -1;
			temp_xfinal = -1;
			temp_yfinal = -1;
			break;
		case NET_ENDTURN:
			obj_CONTROL.can_endturn = true;
			break;
		
	}


}
