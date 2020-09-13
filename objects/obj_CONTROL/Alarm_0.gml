/// @description Timer count actions
can_count = true;
if timer_count != 0 {
    if timer_count == turn_timer {
        //Landing phase at very beginning of game
        if global.game_turn == 0 {
            if landing == false {
                if pre_battle == true {
                    pre_battle = false;
                    display_txt = "Secure a Beachhead";
					obj_ARROWS.txt = display_txt;
                    //Time allowed for ships to reach full stop
                    timer_count = 0;
                    turn_timer = 6;
                    global.zoom_speed = 0.4;
					with obj_Jet_Spawner { alarm[1] = 100; }
                }
                    else if pre_battle = false {
                        //Players land their units simultaneously at this time
                        landing = true;
                        display_txt = "";
						obj_ARROWS.alarm[0] = 20;
                        timer_count = 0;
                        //Time allowed for moving units off of the ships
                        turn_timer = 99;
						//Reset camera zoom speed
                        obj_CAMERA.alarm[0] = 10;
                        global.my_turn  = true;
                    }
            }
                //End of landing phase
                else if landing == true {
                    if global.my_turn == true {
                        global.my_turn = false;
                        timer_count = 0;
                        turn_timer = 0;
                        switching_turns = true;
                    }
                }
        }
            else {
				//Actions to take at end of turn
				if ins_1_count > 0 { ins_1_count -= 1; }
				if ins_2_count > 0 { ins_2_count -= 1; }
				if ins_3_count > 0 { ins_3_count -= 1; }
				if ins_4_count > 0 { ins_4_count -= 1; }
				if ins_5_count > 0 { ins_5_count -= 1; }
				if ins_6_count > 0 { ins_6_count -= 1; }
				if ins_7_count > 0 { ins_7_count -= 1; }
				if ins_8_count > 0 { ins_8_count -= 1; }
				if ins_9_count > 0 { ins_9_count -= 1; }
				//Clear the menu surface
				if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
                //Remove any empty squads from the turn list
				if ds_list_empty(global.squad_1) { ds_list_delete(global.turn_list, ds_list_find_index(global.turn_list, "E_1")); }
				if ds_list_empty(global.squad_2) { ds_list_delete(global.turn_list, ds_list_find_index(global.turn_list, "E_2")); }
				if ds_list_empty(global.squad_3) { ds_list_delete(global.turn_list, ds_list_find_index(global.turn_list, "E_3")); }
				if ds_list_empty(global.squad_4) { ds_list_delete(global.turn_list, ds_list_find_index(global.turn_list, "E_4")); }
				if ds_list_empty(global.squad_5) { ds_list_delete(global.turn_list, ds_list_find_index(global.turn_list, "E_5")); }
				if ds_list_empty(global.squad_alpha)   { ds_list_delete(global.turn_list, ds_list_find_index(global.turn_list, "ALPHA")); }
				if ds_list_empty(global.squad_bravo)   { ds_list_delete(global.turn_list, ds_list_find_index(global.turn_list, "BRAVO")); }
				if ds_list_empty(global.squad_charlie) { ds_list_delete(global.turn_list, ds_list_find_index(global.turn_list, "CHARLIE")); }
				if ds_list_empty(global.squad_delta)   { ds_list_delete(global.turn_list, ds_list_find_index(global.turn_list, "DELTA")); }
				if ds_list_empty(global.squad_echo)    { ds_list_delete(global.turn_list, ds_list_find_index(global.turn_list, "ECHO")); }
                if global.my_turn == true {
                    global.my_turn = false;
                    can_endturn = false;
                    obj_COMMAND.target_option = "NOONE";
                    //Deselect all units
                    scr_DeselectAll();
                    //If all units have completed their actions go ahead and end the turn
                    if global.units_running == 0 {
						//Calculate objective capture status
						obj_Objective_Capture.can_count = true;
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
                        else { 
                            //End the turn once all current actions are complete..ref step event
                            global.waiting = true; 
                        }
                }
                    //Actions to take at start of player turn/end of opponent turn
                    else if global.opponent_turn == true {
                        global.opponent_turn = false;
                        can_endturn = false;
						if PLAYER.net_status == "NONE" {
							obj_EnemyControl_B.active = false;
						}
                        if global.enemyunits_running == 0 {
							//Calculate objective capture status
							obj_Objective_Capture.can_count = true;
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
                            else { global.enemy_waiting = true; }
                    }
            }
    }
}







