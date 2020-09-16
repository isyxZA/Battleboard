/// @description Turn start and end actions

//First turn of the game
if global.game_turn == 0 {
    //Start the game
    global.game_turn = 1;
    global.turn_AP = 0;
    global.temp_AP = 0;
    //Set timer length
    turn_timer = global.turn_timer;
    //Switch on command turn cards
    command_targeting = true;
	//Display the ui
	ty_adj = -(ui_height*ui_ratio);
	by_adj =    ui_height*ui_ratio;
	y_target = 0;
	ui_anim = true;
    //Generate turn list
	if PLAYER.player == "ONE" {
		ds_list_add(global.turn_list, "ALPHA");
		ds_list_add(global.turn_list, "E_1");
		ds_list_add(global.turn_list, "BRAVO");
		ds_list_add(global.turn_list, "E_2");
		ds_list_add(global.turn_list, "CHARLIE");
		ds_list_add(global.turn_list, "E_3");
		ds_list_add(global.turn_list, "DELTA");
		ds_list_add(global.turn_list, "E_4");
		ds_list_add(global.turn_list, "ECHO");
		ds_list_add(global.turn_list, "E_5");
	}
		else if PLAYER.player == "TWO" {
			ds_list_add(global.turn_list, "E_1");
			ds_list_add(global.turn_list, "ALPHA");
			ds_list_add(global.turn_list, "E_2");
			ds_list_add(global.turn_list, "BRAVO");
			ds_list_add(global.turn_list, "E_3");
			ds_list_add(global.turn_list, "CHARLIE");
			ds_list_add(global.turn_list, "E_4");
			ds_list_add(global.turn_list, "DELTA");
			ds_list_add(global.turn_list, "E_5");
			ds_list_add(global.turn_list, "ECHO");
		}
    //Set active turn
    active_turn = ds_list_find_value(global.turn_list, 0);
    //Determine starting player
    switch active_turn {
        case "ALPHA":
        case "BRAVO":
        case "CHARLIE":
        case "DELTA":
        case "ECHO":
            display_txt = "Your Turn";
            global.my_turn = true;
            global.opponent_turn = false; 
            //Start turn timer
            can_count = true;
            //Assign unit action points
            if !ds_list_empty(global.myunit_list) {
                var i;
                for(i=0; i<ds_list_size(global.myunit_list); i+=1){
                    var unit = ds_list_find_value(global.myunit_list, i);
                    with unit { 
                        switch unit_type {
                            case "INFANTRY":
                            case "TANK":
                            case "ENGINEER":
                            case "BTR":
                            case "LOGI":
                                if my_squad == obj_CONTROL.active_turn {
                                    active = true;
                                    action_points = start_ap;
                                    global.turn_AP += action_points;
                                }
									else { action_points = 0; }
                                break;
                        }
                                
                    }
                }
            }
            break;
        case "E_1":
        case "E_2":
        case "E_3":
        case "E_4":
        case "E_5":
            display_txt = "Opponent Turn";
            global.my_turn = false;
            global.opponent_turn = true;
            //Start turn timer
            can_count = true;
			if PLAYER.net_status == "NONE" {
	            obj_EnemyControl_B.active = true;
	            obj_EnemyControl_B.turn_start = true;
			}
            if !ds_list_empty(global.enemyunit_list) {
                var i;
                for(i=0; i<ds_list_size(global.enemyunit_list); i+=1){
                    var unit = ds_list_find_value(global.enemyunit_list, i);
                    with unit { 
                        switch unit_type {
                            case "E_INFANTRY":
                            case "E_TANK":
                            case "E_ENGINEER":
                            case "E_BTR":
                            case "E_LOGI":
                                no_shot = false;
                                no_move = false;
                                action_points = start_ap;
                                if !ds_list_empty(target_list) { ds_list_clear(target_list); }
                                break;
                        }
                                
                    }
                }
            }
            break;
    }
}
    else {
        //Actions to take at start of player turn
        if my_turn_start == true {
            global.turn_AP = 0;
            global.temp_AP = 0;
            global.game_turn += 1;
            global.my_turn = true;
            global.ammo_tab = "NOONE";
            timer_count = 0;
            turn_timer = global.turn_timer;
            can_count = true;
            //Determine actions based on active turn
            switch active_turn {
                case "ALPHA":
                case "BRAVO":
                case "CHARLIE":
                case "DELTA":
                case "ECHO":
                    if !ds_list_empty(global.myunit_list) {
                        var i;
                        for(i=0; i<ds_list_size(global.myunit_list); i+=1) {
                            var unit = ds_list_find_value(global.myunit_list, i);
                            with unit { 
                                switch unit_type {
                                    case "INFANTRY":
                                    case "TANK":
                                    case "ENGINEER":
                                    case "BTR":
										if my_squad == obj_CONTROL.active_turn {
                                            active = true;
                                            action_points = start_ap;
                                            global.turn_AP += action_points;
                                        }
											else { action_points = 0; }
                                        break;
                                    case "LOGI":
                                        if my_squad == obj_CONTROL.active_turn {
                                            active = true;
                                            action_points = start_ap;
                                            global.turn_AP += action_points;
                                        }
											else { action_points = 0; }
                                        break;
                                    case "DEPOT":
										if build_pos < 2 { build_pos += 1; }
		                                if my_squad == obj_CONTROL.active_turn {
		                                    active = true;
		                                    action_points = start_ap;
		                                    global.turn_AP += action_points;
		                                }
											else { action_points = 0; }
										break;
                                    case "REPAIR":
										if build_pos < 2 { build_pos += 1; }
										if is_occupied == true { action_points = 0; }
											else {
			                                    if my_squad == obj_CONTROL.active_turn {
			                                        active = true;
			                                        action_points = start_ap;
			                                        global.turn_AP += action_points;
			                                    }
													else { action_points = 0; }
											}
                                        break;
                                    case "TOW":
                                    case "MORTAR":
                                        if build_pos < 2 { build_pos += 1; }
                                        if is_manned == true {
                                            if my_squad == obj_CONTROL.active_turn {
                                                active = true;
                                                action_points = start_ap;
                                                global.turn_AP += action_points;
                                            }
												else { action_points = 0; }
                                        }
                                            else if is_manned == false {
                                                action_points = 0;
                                            }
                                        break;
                                }      
                            }
                        }
                    }
                    break;
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
                    global.turn_AP = 10;
                    obj_COMMAND.active = true;
                    obj_COMMAND.target_option = active_turn;
                    break;
            }
            //Reset enemy unit path positions
            if !ds_list_empty(global.enemyunit_list) {
                var ii;
                for(ii=0; ii<ds_list_size(global.enemyunit_list); ii+=1){
                    var unit1 = ds_list_find_value(global.enemyunit_list, ii);
                    with unit1 { 
                        x = my_tile_x;
                        y = my_tile_y;
                        x_end = x;
                        y_end = y;
                        x_final = x;
                        y_final = y; 
                        mp_grid_path(global.move_grid, my_path, x, y, x, y, diag);      
                    }
                }
            }
        }
            //Actions to take at start of opponent turn
            else if my_turn_start == false {
                global.opponent_turn = true;
                timer_count = 0;
                turn_timer = global.turn_timer;
                can_count = true;
				global.game_turn += 1;
                global.turn_AP = 0;
                global.temp_AP = 0;
                //Deselect all units and reset path positions
                if !ds_list_empty(global.myunit_list) {
                    var i;
                    for(i=0; i<ds_list_size(global.myunit_list); i+=1){
                        var unit = ds_list_find_value(global.myunit_list, i);
                        with unit { 
                            active = false;
                            var t = instance_place(x, y, obj_Game_Tile);
                            my_tile   = t.tile_num;
                            my_tile_x = t.tile_x;
                            my_tile_y = t.tile_y;
                            x = my_tile_x;
                            y = my_tile_y;
                            x_end = x;
                            y_end = y;
                            x_final = x;
                            y_final = y; 
                            mp_grid_path(global.move_grid, my_path, x, y, x, y, diag);      
                        }
                    }
                }
                //Prep the enemy units
                if !ds_list_empty(global.enemyunit_list) {
                    var e;
                    for(e=0; e<ds_list_size(global.enemyunit_list); e+=1){
                        var ue = ds_list_find_value(global.enemyunit_list, e);
                        with ue { 
                            switch unit_type {
                                case "E_INFANTRY":
									if PLAYER.net_status != "NONE" { 
										rifle_ammo = 100;
										rpg_ammo = 1;
										flare_ammo = 2;
									}
									no_shot = false;
                                    no_move = false;
                                    action_points = start_ap;
                                    if !ds_list_empty(target_list) { ds_list_clear(target_list); }
                                    if spot_count > 0 { spot_count -= 1; } else { is_spotted = false; }
                                    break;
                                case "E_TANK":
									if PLAYER.net_status != "NONE" { 
										cannon_ammo = 10;
										mg_ammo     = 100;
									}
									no_shot = false;
                                    no_move = false;
                                    action_points = start_ap;
                                    if !ds_list_empty(target_list) { ds_list_clear(target_list); }
                                    if spot_count > 0 { spot_count -= 1; } else { is_spotted = false; }
                                    break;
                                case "E_ENGINEER":
									if PLAYER.net_status != "NONE" { 
										depot_supply  = 1;
										repair_supply = 1;
										tow_supply    = 1;
										mortar_supply = 1;
									}
									no_shot = false;
                                    no_move = false;
                                    action_points = start_ap;
                                    if !ds_list_empty(target_list) { ds_list_clear(target_list); }
                                    if spot_count > 0 { spot_count -= 1; } else { is_spotted = false; }
                                    break;
                                case "E_BTR":
									if PLAYER.net_status != "NONE" { 
										he_ammo = 80;
										ap_ammo = 80;
									}
									no_shot = false;
                                    no_move = false;
                                    action_points = start_ap;
                                    if !ds_list_empty(target_list) { ds_list_clear(target_list); }
                                    if spot_count > 0 { spot_count -= 1; } else { is_spotted = false; }
                                    break;
                                case "E_LOGI":
									if PLAYER.net_status != "NONE" { 
										building_supply = 100;
										ammo_supply = 100;
									}
                                    no_shot = false;
                                    no_move = false;
                                    action_points = start_ap;
                                    if !ds_list_empty(target_list) { ds_list_clear(target_list); }
                                    if spot_count > 0 { spot_count -= 1; } else { is_spotted = false; }
                                    break;
                                case "E_DEPOT":
									no_shot = false;
                                    no_move = true;
                                    if !ds_list_empty(target_list) { ds_list_clear(target_list); }
                                    if build_pos < 2 { build_pos += 1; }
                                    if is_manned == true {
                                        action_points = start_ap;
                                    }
                                        else if is_manned == false {
                                            action_points = 0;
                                        }
                                    if spot_count > 0 { spot_count -= 1; } else { is_spotted = false; }
                                    break;
                                case "E_REPAIR":
									if PLAYER.net_status != "NONE" { 
										mg_ammo = 100;
									}
									no_shot = false;
                                    no_move = true;
                                    if !ds_list_empty(target_list) { ds_list_clear(target_list); }
                                    if build_pos < 2 { build_pos += 1; }
                                    if is_manned == true {
                                        action_points = start_ap;
                                    }
                                        else if is_manned == false {
                                            action_points = 0;
                                        }
                                    if spot_count > 0 { spot_count -= 1; } else { is_spotted = false; }
                                    break;
                                case "E_TOW":
									if PLAYER.net_status != "NONE" { 
										tow_ammo = 10;
									}
									no_shot = false;
                                    no_move = true;
                                    if !ds_list_empty(target_list) { ds_list_clear(target_list); }
                                    if build_pos < 2 { build_pos += 1; }
                                    if is_manned == true {
                                        action_points = start_ap;
                                    }
                                        else if is_manned == false {
                                            action_points = 0;
                                        }
                                    if spot_count > 0 { spot_count -= 1; } else { is_spotted = false; }
                                    break;
                                case "E_MORTAR":
									if PLAYER.net_status != "NONE" { 
										mortar_ammo = 100;
									}
                                    no_shot = false;
                                    no_move = true;
                                    if !ds_list_empty(target_list) { ds_list_clear(target_list); }
                                    if build_pos < 2 { build_pos += 1; }
                                    if is_manned == true {
                                        action_points = start_ap;
                                    }
                                        else if is_manned == false {
                                            action_points = 0;
                                        }
                                    if spot_count > 0 { spot_count -= 1; } else { is_spotted = false; }
                                    break;
                                default:
                                    break;
                            }
                                    
                        }
                    }
                }
				if PLAYER.net_status == "NONE" {
	                with obj_EnemyControl_B {
	                    active = true;
						active_timer = 0;
						alarm[9] = global.tick_rate;
	                    turn_start = true;
	                }
				}
            }
    }

