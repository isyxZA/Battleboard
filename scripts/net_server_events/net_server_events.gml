function net_server_events() {

	//Gets the data passed in by the connection data. (net_server_connections)
	var data = argument[0];
	var socket = argument[1];

	//Reads which event id was sent by the client. (The first data sent from the client)
	var event = buffer_read(data,buffer_u8);

	//Checks which type of event has been requested.
	switch(event){
		case NET_CONNECT://Data recieved back from client on connect request
			var efac = buffer_read(data,buffer_string);
			PLAYER.opponent_faction = efac;
			break;
		case NET_PING: //Ping Request.
			//Reads the time sent from the client.
			var clientTime = buffer_read(data,buffer_u32);
			//Sends the time back to the player.
			net_write_client(socket,
				buffer_u8,NET_PING,
				buffer_u32,clientTime
			);
			break;
		case NET_FACTION:
			var fac = buffer_read(data,buffer_string);
			PLAYER.opponent_faction = fac;
			break;
		case NET_GREENLIGHT: 
			var gl = buffer_read(data, buffer_bool);
			global.green_light = gl;
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
							net_id   = other.temp_id;
				            my_squad = other.temp_squad; 
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
			break;
		case NET_MOVE:
			//Find matching unit net_id
			temp_id    = buffer_read(data, buffer_u32);
			//Transfer navigation waypoint
			temp_xfinal = buffer_read(data,buffer_u16);
			temp_yfinal = buffer_read(data,buffer_u16);
			with obj_Enemy_Parent {
				if net_id == other.temp_id {
					mp_grid_clear_rectangle(global.move_grid, x-40, y-40, x+40, y+40);
		            //Set final waypoint
		            x_final = other.temp_xfinal;
		            y_final = other.temp_yfinal;
					can_move = true; 
					count_start = true;
					nav_confirmed = true;
					mp_grid_add_rectangle(global.move_grid, x_final-36, y_final-36, x_final+36, y_final+36);
				}
			}
			//Reset temp variables
			temp_id     = -1;
			temp_xfinal       = -1;
			temp_yfinal       = -1;
			break;
		case NET_ENDTURN:
			obj_CONTROL.can_endturn = true;
			break;
	
	}


}
