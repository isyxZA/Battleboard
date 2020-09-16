/// @description Switching turns, GUI Buttons
if global.game_state == "IN_GAME" {
	if global.game_turn != 0 {
	    if tlist_adj != 0 { tlist_adj = lerp(tlist_adj, 0, 0.05 ); }
	    if tlist_a   < 1  { tlist_a+=0.05; }
	    //End turn button controls
	    if global.my_turn == true {
	        //End turn when out of action points
	        if can_endturn == false {
	            if global.turn_AP <= 0 {
	                //End player turn
	                can_endturn = true;
	                can_count = false;
	                timer_count = turn_timer;
	                alarm[0] = 10;
					if PLAYER.net_status == "HOST" {
						//Send turn end signal to client
						var cc = ds_list_size(global.clients);
						if cc > 0 { 
							var i;
							for (i=0;i<cc;i++) {
								var csocket = ds_list_find_value(global.clients, i);
								net_write_client(csocket, buffer_u8, NET_ENDTURN);
							}
						}
					}
						else if PLAYER.net_status == "CLIENT" {
							//Send turn end signal to host can_endturn = true
							net_write_server(buffer_u8, NET_ENDTURN);
						}
	            }
	            //End turn manually
	            var eb = point_distance(ui_tx+(ui_rx*ui_ratio), ui_ty+(ty_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	            if eb < s_dist {
					if show_options == false {
		                if endturn_timer < 12 { endturn_timer += 1; }
		                if endturn_timer >= 12 {
		                    if global.my_turn == true { 
		                        draw_endturn = true; 
			                        if mouse_check_button_pressed(mb_left) {
			                            //End player turn
			                            can_endturn = true;
			                            can_count = false;
			                            timer_count = turn_timer;
			                            alarm[0] = 10;
										if PLAYER.net_status == "HOST" {
											//Send turn end signal to client
											var cc = ds_list_size(global.clients);
											if cc > 0 { 
												var i;
												for (i=0;i<cc;i++) {
													var csocket = ds_list_find_value(global.clients, i);
													net_write_client(csocket, buffer_u8, NET_ENDTURN);
												}
											}
										}
											else if PLAYER.net_status == "CLIENT" {
												//Send turn end signal to host can_endturn = true
												net_write_server(buffer_u8, NET_ENDTURN);
											}
			                        }
		                    }
		                }
					}
						else {
							endturn_timer = 0; 
							draw_endturn = false;
						}
	            }
	                else { 
	                    endturn_timer = 0; 
	                    draw_endturn = false;
						if show_options == false {
							if keyboard_check_pressed(vk_space) {
								//End player turn
		                        can_endturn = true;
		                        can_count = false;
		                        timer_count = turn_timer;
		                        alarm[0] = 10;
								if PLAYER.net_status == "HOST" {
									//Send turn end signal to client
									var cc = ds_list_size(global.clients);
									if cc > 0 { 
										var i;
										for (i=0;i<cc;i++) {
											var csocket = ds_list_find_value(global.clients, i);
											net_write_client(csocket, buffer_u8, NET_ENDTURN);
										}
									}
								}
									else if PLAYER.net_status == "CLIENT" {
										//Send turn end signal to host can_endturn = true
										net_write_server(buffer_u8, NET_ENDTURN);
									}
							}
						}
	                }
	        }
	            else { 
	                endturn_timer = 0; 
	                draw_endturn = false;
	            }  
	    }
	        else if global.opponent_turn == true { 
	            endturn_timer = 0; 
	            draw_endturn = false;
	            //If the enemy is out of AP
	            if can_endturn == true { 
	                //End opponent turn and start player turn
	                can_endturn = false;
	                can_count = false;
	                timer_count = turn_timer;
	                alarm[0] = 10;
	            }
	        }
	            else {
	                endturn_timer = 0; 
	                draw_endturn = false;
	                can_endturn = false;
	            }
    
	    if global.menu_create != true && global.nav_menu != true && global.nav_select != true && global.fire_display != true && show_options != true {
	        //TURN LIST SENSORS
	        scr_ListSensors();
	        //COMMAND OPTIONS SENSORS
	        scr_CommandSensors();
	    }
	}
	    else if global.game_turn == 0 {
			if PLAYER.net_status == "NONE" {
		        //Determine how many units have been deployed from the ships
		        var itotal = ds_list_size(global.myunit_list);
		        //Once all units have been deployed, begin manouvers
		        if itotal == 30 && turn_timer == 99 {
		            timer_count = 0;
		            turn_timer = 2;
		        }
			}
				else {
					//Determine how many units have been deployed from the ships
			        var itotal = ds_list_size(global.myunit_list)+ds_list_size(global.enemyunit_list);
			        //Once all units have been deployed, begin manouvers
			        if itotal == 60 && turn_timer == 99 {
			            timer_count = 0;
			            turn_timer = 2;
			        }
				}
	    }

	//Triggers at end of turn if units still have actions to complete...ref alarm[0]
	if global.waiting == true {
	    //Switch off waiting once unit actions are complete
	    if global.units_running == 0 { 
			//Calculate objective capture status
			obj_Objective_Capture.can_count = true;
	        global.waiting = false; 
	        //Turn complete, send to back of the list or delete from list if required
	        //var ind = ds_list_find_value(global.turn_list, 0);
			switch active_turn {
				case "BOMBER":
					if active_bomber == true { active_bomber = false; }
					ds_list_delete(global.turn_list, 0);
	                break;
	            case "MISSILE":
					if active_missile == true { active_missile = false; }
					ds_list_delete(global.turn_list, 0);
	                break;
	            case "UAV":
					if active_uav == true { active_uav = false; }
					ds_list_delete(global.turn_list, 0);
	                break;
	            case "AIRDROP":
					if active_airdrop == true { active_airdrop = false; }
					ds_list_delete(global.turn_list, 0);
	                break;
	            case "ARTILLERY":
					if active_artillery == true { active_artillery = false; }
					ds_list_delete(global.turn_list, 0);
	                break;
	            case "ILC":
					if active_ilc == true { active_ilc = false; }
					ds_list_delete(global.turn_list, 0);
	                break;
	            case "TLC":
					if active_tlc == true { active_tlc = false; }
					ds_list_delete(global.turn_list, 0);
	                break;
	            case "ELC":
					if active_elc == true { active_elc = false; }
					ds_list_delete(global.turn_list, 0);
	                break;
	            case "BLC":
					if active_blc == true { active_blc = false; }
					ds_list_delete(global.turn_list, 0);
	                break;
	            case "LLC":
	                if active_llc == true { active_llc = false; }
					ds_list_delete(global.turn_list, 0);
	                break;
				case "ALPHA":
	            case "BRAVO":
	            case "CHARLIE":
	            case "DELTA":
	            case "ECHO":
					ds_list_delete(global.turn_list, 0);
					ds_list_add(global.turn_list, active_turn);
					break;
				default:
					ds_list_delete(global.turn_list, 0);
					ds_list_add(global.turn_list, active_turn);
					break;
			}
	        tlist_adj = -t_space;
	        tlist_a = 0;
	        //Determine the next turn
	        active_turn = ds_list_find_value(global.turn_list, 0);
	        switching_turns = true; 
	        //Give the OK to end the turn
	        switch active_turn {
	            case "ALPHA":
	            case "BRAVO":
	            case "CHARLIE":
	            case "DELTA":
	            case "ECHO":
	            case "BOMBER":
	            case "MISSILE":
	            case "UAV":
	            case "AIRDROP":
	            case "ARTILLERY":
	            case "ILC":
	            case "TLC":
	            case "ELC":
	            case "BLC":
	            case "LLC":
	                my_turn_start = true;
	                break;
	            case "E_1":
	            case "E_2":
	            case "E_3":
	            case "E_4":
	            case "E_5":
				case "E_BOMBER":
                case "E_MISSILE":
                case "E_UAV":
                case "E_AIRDROP":
                case "E_ARTILLERY":
                case "E_ILC":
                case "E_TLC":
                case "E_ELC":
                case "E_BLC":
                case "E_LLC":
	                my_turn_start = false;
	                break;
	        }
	    }
	    display_txt = "Ending Turn";
	    my_colour = c_orange;
	}
	if global.enemy_waiting == true {
	    //Switch off waiting once enemy unit actions are complete
	    if global.enemyunits_running == 0 { 
			//Calculate objective capture status
			obj_Objective_Capture.can_count = true;
	        global.enemy_waiting = false; 
	        //Turn complete, send to back of the list or delete from list if required
	        //var ind = ds_list_find_value(global.turn_list, 0);
			switch active_turn {
				case "E_BOMBER":
		        case "E_MISSILE":
		        case "E_UAV":
		        case "E_AIRDROP":
		        case "E_ARTILLERY":
		        case "E_ILC":
		        case "E_TLC":
		        case "E_ELC":
		        case "E_BLC":
		        case "E_LLC":
		            ds_list_delete(global.turn_list, 0);
		            break;
				case "E_1":
		        case "E_2":
		        case "E_3":
		        case "E_4":
		        case "E_5":
					ds_list_delete(global.turn_list, 0);
					ds_list_add(global.turn_list, active_turn);
					break;
				default:
					ds_list_delete(global.turn_list, 0);
					ds_list_add(global.turn_list, active_turn);
					break;
			}
	        tlist_adj = -t_space;
	        tlist_a = 0;
	        //Determine the next turn
	        active_turn = ds_list_find_value(global.turn_list, 0);
	        switching_turns = true; 
	        //Give the OK to end the turn
	        switch active_turn {
	            case "ALPHA":
	            case "BRAVO":
	            case "CHARLIE":
	            case "DELTA":
	            case "ECHO":
	            case "BOMBER":
	            case "MISSILE":
	            case "UAV":
	            case "AIRDROP":
	            case "ARTILLERY":
	            case "ILC":
	            case "TLC":
	            case "ELC":
	            case "BLC":
	            case "LLC":
	                my_turn_start = true;
	                break;
	            case "E_1":
	            case "E_2":
	            case "E_3":
	            case "E_4":
	            case "E_5":
				case "E_BOMBER":
                case "E_MISSILE":
                case "E_UAV":
                case "E_AIRDROP":
                case "E_ARTILLERY":
                case "E_ILC":
                case "E_TLC":
                case "E_ELC":
                case "E_BLC":
                case "E_LLC":
	                my_turn_start = false;
	                break;
	        }
	    }
	    display_txt = "Ending Turn";
	    my_colour = c_orange;
	}

	//Control timer and turn-related text display
	if global.waiting == false && global.enemy_waiting == false {
	    if global.victory == false && global.defeat == false {
	        //Timer
	        //Switching turns will pause the timer
	        if switching_turns == false {
	            //99 represents infinite turn time
	            if turn_timer != 99 && can_count == true {
			        //Count up to the turn timer
			        can_count = false;
			        timer_count += 1;
			        clamp(timer_count,0,turn_timer);
			        //Tick rate of timer
			        alarm[0] = global.tick_rate;
	            }
	        }
	            else if switching_turns == true {
					switching_turns = false;
					can_count = false;
					//Check for win conditions
					objectives_controlled = 0;
					objectives_lost       = 0;
					with obj_Objective_Capture { 
						if capture_pos >= 10 { obj_CONTROL.objectives_controlled += 1; } 
							else if capture_pos <= -10 { obj_CONTROL.objectives_lost += 1; }
					}
					if objectives_controlled == objective_amount { global.victory = true; }
						else if objectives_lost == objective_amount { global.defeat  = true; }
					if ds_list_empty(global.myunit_list)    { if global.game_turn >= 3 { global.defeat  = true; } }
					if ds_list_empty(global.enemyunit_list) { if global.game_turn >= 3 { global.victory = true; } }
					if global.victory == false && global.defeat == false {
						if global.game_turn == 0 { 
							display_txt = "Begin Manouvers"; 
							obj_ARROWS.txt = display_txt;
							obj_ARROWS.alarm[1] = 4; 
						}
	                    else { 
	                        if my_turn_start == true { display_txt = "Your Turn"; my_colour = make_colour_rgb(240,248,255); }
	                            else if my_turn_start == false { display_txt = "Opponent Turn"; my_colour = make_colour_rgb(153,25,0); }
	                    }
		                //Switch turn
		                alarm[1] = 100;
					}
	            }
	    }
	        else {
	            if game_over == false {
	                game_over = true;
	                global.opponent_turn = false;
	                global.my_turn = false;
	                global.waiting = false;
	                global.enemy_waiting = false;
	                global.can_select = false;
	                switching_turns = false;
	                draw_commandOL = false;
	                command_targeting = false;
	                can_count = false;
	                turn_timer = 0;
	                timer_count = 0;
	                if global.victory == true { 
	                    audio_stop_all();
	                    audio_play_sound(snd_Victory, 10, false);
	                    display_txt = "VICTORY!"; 
	                }
	                    else if global.defeat == true { 
	                        audio_stop_all();
	                        audio_play_sound(snd_Defeat, 10, false);
	                        display_txt = "DEFEAT!";
	                    }
	            }
	        }
	}
}
