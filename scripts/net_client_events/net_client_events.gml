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
			//Reads the time sent back from the host.
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
		case NET_TLUPDATE://Add command catds to the turn list
			var atype     = buffer_read(data, buffer_u8);
			var lpos      = buffer_read(data, buffer_u8);
			var ctext_in  = buffer_read(data, buffer_string);
			var ctext_out = "";
			switch ctext_in {
	            case "BOMBER":
					ctext_out = "E_BOMBER";
	                break;
	            case "MISSILE":
	                ctext_out = "E_MISSILE";
	                break;
	            case "ARTILLERY":
	                ctext_out = "E_ARTILLERY";
	                break;
	            case "UAV":
	                ctext_out = "E_UAV";
	                break;
	            case "AIRDROP":
	                ctext_out = "E_AIRDROP";
	                break;
	            case "ILC":
	                ctext_out = "E_ILC";
	                break;
	            case "TLC":
	                ctext_out = "E_TLC";
	                break;
	            case "ELC":
	                ctext_out = "E_ELC";
	                break;
	            case "BLC":
	                ctext_out = "E_BLC";
	                break;
	            case "LLC":
	                ctext_out = "E_LLC";
	                break;
	        }
			if (atype == 1) { ds_list_insert(global.turn_list, lpos, ctext_out); }
				else if atype == 2 { ds_list_add(global.turn_list, ctext_out); } 
			break;
		case NET_COMMANDCARD:
			var c_option = buffer_read(data, buffer_string);
			switch c_option {
				case "BOMBER":
					temp_x1 = buffer_read(data,buffer_u16);
					temp_y1 = buffer_read(data,buffer_u16);
					temp_x2 = buffer_read(data,buffer_u16);
					temp_y2 = buffer_read(data,buffer_u16);
					temp_x3 = buffer_read(data,buffer_u16);
					temp_y3 = buffer_read(data,buffer_u16);
					temp_x4 = buffer_read(data,buffer_u16);
					temp_y4 = buffer_read(data,buffer_u16);
					temp_x5 = buffer_read(data,buffer_u16);
					temp_y5 = buffer_read(data,buffer_u16);
					temp_x6 = buffer_read(data,buffer_u16);
					temp_y6 = buffer_read(data,buffer_u16);
					temp_x7 = buffer_read(data,buffer_u16);
					temp_y7 = buffer_read(data,buffer_u16);
					temp_pathx1 = buffer_read(data,buffer_s16);
					temp_pathy1 = buffer_read(data,buffer_s16);
					temp_pathx2 = buffer_read(data,buffer_s16);
					temp_pathy2 = buffer_read(data,buffer_s16);
					//Spawn bomber and bombs
					with instance_create_layer(temp_x1, temp_y1, "Command", obj_E_Bomb) { fuse = 10; }
		            with instance_create_layer(temp_x2, temp_y2, "Command", obj_E_Bomb) { fuse = 30; }
		            with instance_create_layer(temp_x3, temp_y3, "Command", obj_E_Bomb) { fuse = 50; }
		            with instance_create_layer(temp_x4, temp_y4, "Command", obj_E_Bomb) { fuse = 70; }
		            with instance_create_layer(temp_x5, temp_y5, "Command", obj_E_Bomb) { fuse = 90; }
		            with instance_create_layer(temp_x6, temp_y6, "Command", obj_E_Bomb) { fuse = 110; }
		            with instance_create_layer(temp_x7, temp_y7, "Command", obj_E_Bomb) { fuse = 130; }
		            with instance_create_layer(temp_pathx1, temp_pathy1, "Aircraft", obj_E_Bomber_Spawner) { 
		                my_path = path_add();
		                path_add_point(my_path, x, y, 40);
		                path_add_point(my_path, obj_CLIENT.temp_pathx2, obj_CLIENT.temp_pathy2, 40);
		                path_set_closed(my_path, false);
		                path_position = 0;
		            }
					//Reset temp variables
					temp_x1 = -1;
					temp_y1 = -1;
					temp_x2 = -1;
					temp_y2 = -1;
					temp_x3 = -1;
					temp_y3 = -1;
					temp_x4 = -1;
					temp_y4 = -1;
					temp_x5 = -1;
					temp_y5 = -1;
					temp_x6 = -1;
					temp_y6 = -1;
					temp_x7 = -1;
					temp_y7 = -1;
					temp_pathx1 = -1;
					temp_pathy1 = -1;
					temp_pathx2 = -1;
					temp_pathy2 = -1;
	                break;
	            case "MISSILE":
					temp_x1 = buffer_read(data,buffer_u16);
					temp_y1 = buffer_read(data,buffer_u16);
					temp_x2 = buffer_read(data,buffer_u16);
					temp_y2 = buffer_read(data,buffer_u16);
					temp_x3 = buffer_read(data,buffer_u16);
					temp_y3 = buffer_read(data,buffer_u16);
					temp_x4 = buffer_read(data,buffer_u16);
					temp_y4 = buffer_read(data,buffer_u16);
					temp_x5 = buffer_read(data,buffer_u16);
					temp_y5 = buffer_read(data,buffer_u16);
					temp_x6 = buffer_read(data,buffer_u16);
					temp_y6 = buffer_read(data,buffer_u16);
					temp_x7 = buffer_read(data,buffer_u16);
					temp_y7 = buffer_read(data,buffer_u16);
					//Spawn missiles
		            with instance_create_layer(temp_x1, temp_y1, "Command", obj_E_Missile) { fuse = 10; }
		            with instance_create_layer(temp_x2, temp_y2, "Command", obj_E_Missile) { fuse = 20; }
		            with instance_create_layer(temp_x3, temp_y3, "Command", obj_E_Missile) { fuse = 40; }
		            with instance_create_layer(temp_x4, temp_y4, "Command", obj_E_Missile) { fuse = 50; }
		            with instance_create_layer(temp_x5, temp_y5, "Command", obj_E_Missile) { fuse = 60; }
		            with instance_create_layer(temp_x6, temp_y6, "Command", obj_E_Missile) { fuse = 90; }
		            with instance_create_layer(temp_x7, temp_y7, "Command", obj_E_Missile) { fuse = 120; }
	                //Reset temp variables
					temp_x1 = -1;
					temp_y1 = -1;
					temp_x2 = -1;
					temp_y2 = -1;
					temp_x3 = -1;
					temp_y3 = -1;
					temp_x4 = -1;
					temp_y4 = -1;
					temp_x5 = -1;
					temp_y5 = -1;
					temp_x6 = -1;
					temp_y6 = -1;
					temp_x7 = -1;
					temp_y7 = -1;
	                break;
	            case "ARTILLERY":
	                temp_x1  = buffer_read(data,buffer_u16);
					temp_y1  = buffer_read(data,buffer_u16);
					temp_x2  = buffer_read(data,buffer_u16);
					temp_y2  = buffer_read(data,buffer_u16);
					temp_x3  = buffer_read(data,buffer_u16);
					temp_y3  = buffer_read(data,buffer_u16);
					temp_x4  = buffer_read(data,buffer_u16);
					temp_y4  = buffer_read(data,buffer_u16);
					temp_x5  = buffer_read(data,buffer_u16);
					temp_y5  = buffer_read(data,buffer_u16);
					temp_x6  = buffer_read(data,buffer_u16);
					temp_y6  = buffer_read(data,buffer_u16);
					temp_x7  = buffer_read(data,buffer_u16);
					temp_y7  = buffer_read(data,buffer_u16);
					temp_x8  = buffer_read(data,buffer_u16);
					temp_y8  = buffer_read(data,buffer_u16);
					temp_x9  = buffer_read(data,buffer_u16);
					temp_y9  = buffer_read(data,buffer_u16);
					temp_x10 = buffer_read(data,buffer_u16);
					temp_y10 = buffer_read(data,buffer_u16);
					//Spawn artillery
		            with instance_create_layer(temp_x1 , temp_y1 , "Command", obj_E_Artillery) { fuse = 160; }
		            with instance_create_layer(temp_x2 , temp_y2 , "Command", obj_E_Artillery) { fuse = 130; }
		            with instance_create_layer(temp_x3 , temp_y3 , "Command", obj_E_Artillery) { fuse = 90 ; }
		            with instance_create_layer(temp_x4 , temp_y4 , "Command", obj_E_Artillery) { fuse = 40 ; }
		            with instance_create_layer(temp_x5 , temp_y5 , "Command", obj_E_Artillery) { fuse = 10 ; }
		            with instance_create_layer(temp_x6 , temp_y6 , "Command", obj_E_Artillery) { fuse = 20 ; }
		            with instance_create_layer(temp_x7 , temp_y7 , "Command", obj_E_Artillery) { fuse = 30 ; }
		            with instance_create_layer(temp_x8 , temp_y8 , "Command", obj_E_Artillery) { fuse = 70 ; }
		            with instance_create_layer(temp_x9 , temp_y9 , "Command", obj_E_Artillery) { fuse = 110; }
		            with instance_create_layer(temp_x10, temp_y10, "Command", obj_E_Artillery) { fuse = 150; }
	                //Reset temp variables
					temp_x1  = -1;
					temp_y1  = -1;
					temp_x2  = -1;
					temp_y2  = -1;
					temp_x3  = -1;
					temp_y3  = -1;
					temp_x4  = -1;
					temp_y4  = -1;
					temp_x5  = -1;
					temp_y5  = -1;
					temp_x6  = -1;
					temp_y6  = -1;
					temp_x7  = -1;
					temp_y7  = -1;
					temp_x8  = -1;
					temp_y8  = -1;
					temp_x9  = -1;
					temp_y9  = -1;
					temp_x10 = -1;
					temp_y10 = -1;
	                break;
	            case "UAV":
					temp_pathx1 = buffer_read(data,buffer_s16);
					temp_pathy1 = buffer_read(data,buffer_s16);
					temp_pathx2 = buffer_read(data,buffer_s16);
					temp_pathy2 = buffer_read(data,buffer_s16);
	                //Set uav
		            with instance_create_layer(temp_pathx1, temp_pathy1, "Aircraft", obj_E_UAV_Spawner) { 
		                my_path = path_add();
		                path_add_point(my_path, x, y, 20);
		                path_add_point(my_path, obj_CLIENT.temp_pathx2, obj_CLIENT.temp_pathy2, 20);
		                path_set_closed(my_path, false);
		                path_position = 0;
		                path_start(my_path, 20, path_action_stop, 0);
		            }
					temp_pathx1 = -1;
					temp_pathy1 = -1;
					temp_pathx2 = -1;
					temp_pathy2 = -1;
	                break;
	            case "AIRDROP":
					temp_pathy1 = buffer_read(data,buffer_s16);
					//Spawn airdrop
	                with instance_create_layer(-96, temp_pathy1, "Aircraft", obj_E_Airdrop_Spawner) { 
		                my_path = path_add();
		                path_add_point(my_path, x, y, 30);
		                path_add_point(my_path, room_width+1024, obj_CLIENT.temp_pathy1, 30);
		                path_set_closed(my_path, false);
		                path_position = 0;
		            }
					temp_pathy1 = -1;
	                break;
	            case "ILC":
	                
	                break;
	            case "TLC":
	                
	                break;
	            case "ELC":
	                
	                break;
	            case "BLC":
	                
	                break;
	            case "LLC":
	                
	                break;
			}
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
					weapon = obj_CLIENT.temp_weapon;
					switch unit_type {
						case "E_INFANTRY":
							switch weapon {
								case "RIFLE":
									shoot_rifle = true;
									action_confirmed = true;
									target_x         = obj_CLIENT.temp_xfinal;
									target_y         = obj_CLIENT.temp_yfinal;
									shoot_amount     = obj_CLIENT.temp_amount;
									global.enemyunits_running += 1;
									break;
								case "RPG":
									shoot_rpg = true;
									action_confirmed = true;
									target_x         = obj_CLIENT.temp_xfinal;
									target_y         = obj_CLIENT.temp_yfinal;
									shoot_amount     = obj_CLIENT.temp_amount;
									global.enemyunits_running += 1;
									break;
								case "FLARE":
									global.enemyunits_running += 1;
									break;
							}
							break;
						case "E_TANK":
							switch weapon {
								case "CANNON":
									shoot_cannon = true;
									action_confirmed = true;
									target_x         = obj_CLIENT.temp_xfinal;
									target_y         = obj_CLIENT.temp_yfinal;
									shoot_amount     = obj_CLIENT.temp_amount;
									global.enemyunits_running += 1;
									break;
								case "MG":
									shoot_mg = true;
									action_confirmed = true;
									target_x         = obj_CLIENT.temp_xfinal;
									target_y         = obj_CLIENT.temp_yfinal;
									shoot_amount     = obj_CLIENT.temp_amount;
									global.enemyunits_running += 1;
									break;
							}
							break;
						case "E_ENGINEER":
							switch weapon {
								case "DEPOT":
									shoot_depot = true;
									action_confirmed = true;
									target_x         = obj_CLIENT.temp_xfinal;
									target_y         = obj_CLIENT.temp_yfinal;
									shoot_amount     = obj_CLIENT.temp_amount;
									global.enemyunits_running += 1;
									break;
								case "REPAIR":
									shoot_repair = true;
									action_confirmed = true;
									target_x         = obj_CLIENT.temp_xfinal;
									target_y         = obj_CLIENT.temp_yfinal;
									shoot_amount     = obj_CLIENT.temp_amount;
									global.enemyunits_running += 1;
									break;
								case "TOW":
									shoot_tow = true;
									action_confirmed = true;
									target_x         = obj_CLIENT.temp_xfinal;
									target_y         = obj_CLIENT.temp_yfinal;
									shoot_amount     = obj_CLIENT.temp_amount;
									global.enemyunits_running += 1;
									break;
								case "MORTAR":
									shoot_mortar = true;
									action_confirmed = true;
									target_x         = obj_CLIENT.temp_xfinal;
									target_y         = obj_CLIENT.temp_yfinal;
									shoot_amount     = obj_CLIENT.temp_amount;
									global.enemyunits_running += 1;
									break;
							}
							break;
						case "E_BTR":
							switch weapon {
								case "AP":
									shoot_ap = true;
									action_confirmed = true;
									target_x         = obj_CLIENT.temp_xfinal;
									target_y         = obj_CLIENT.temp_yfinal;
									shoot_amount     = obj_CLIENT.temp_amount;
									global.enemyunits_running += 1;
									break;
								case "HE":
									shoot_he = true;
									action_confirmed = true;
									target_x         = obj_CLIENT.temp_xfinal;
									target_y         = obj_CLIENT.temp_yfinal;
									shoot_amount     = obj_CLIENT.temp_amount;
									global.enemyunits_running += 1;
									break;
							}
							break;
						case "E_LOGI":
							global.enemyunits_running += 1;
							break;
						case "E_DEPOT":
							global.enemyunits_running += 1;
							break;
						case "E_REPAIR":
							switch weapon {
								case "MG":
									shoot_mg = true;
									action_confirmed = true;
									target_x         = obj_CLIENT.temp_xfinal;
									target_y         = obj_CLIENT.temp_yfinal;
									shoot_amount     = obj_CLIENT.temp_amount;
									global.enemyunits_running += 1;
									break;
								case "REPAIR":
									global.enemyunits_running += 1;
									break;
							}
							break;
						case "E_TOW":
							shoot_tow = true;
							action_confirmed = true;
							target_x         = obj_CLIENT.temp_xfinal;
							target_y         = obj_CLIENT.temp_yfinal;
							shoot_amount     = obj_CLIENT.temp_amount;
							global.enemyunits_running += 1;
							break;
						case "E_MORTAR":
							shoot_mortar = true;
							action_confirmed = true;
							target_x         = obj_CLIENT.temp_xfinal;
							target_y         = obj_CLIENT.temp_yfinal;
							shoot_amount     = obj_CLIENT.temp_amount;
							global.enemyunits_running += 1;
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
		case NET_ENDRUN:
			global.enemyunits_running -= 1;
			break;
		case NET_ENDTURN:
			obj_CONTROL.can_endturn = true;
			break;
	}
}
