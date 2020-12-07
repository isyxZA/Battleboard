/// @description State machine
if global.game_state == "IN_GAME" {
	if global.game_turn != 0 {
	    //If enemy units are available
	    if !ds_list_empty(global.enemyunit_list) {
	        if active == true {
	            if global.opponent_turn == true && active_timer < turn_max { 
	                if turn_start == true {
	                    can_execute = true;
	                    //Set active squad for the turn
	                    active_squad = ds_list_find_value(global.turn_list, 0);
	                    idle_count = 0;
	                    switch active_squad {
	                        case "E_1":
	                            if !ds_list_empty(global.squad_1) { squad_1_active = true; active_list = global.squad_1; }
	                            break;
	                        case "E_2":
	                            if !ds_list_empty(global.squad_2) { squad_2_active = true; active_list = global.squad_2; }
	                            break;
	                        case "E_3":
	                            if !ds_list_empty(global.squad_3) { squad_3_active = true; active_list = global.squad_3; }
	                            break;
	                        case "E_4":
	                            if !ds_list_empty(global.squad_4) { squad_4_active = true; active_list = global.squad_4; }
	                            break;
	                        case "E_5":
	                            if !ds_list_empty(global.squad_5) { squad_5_active = true; active_list = global.squad_5; }
	                            break;
	                        default:
	                            active_list = -1;
	                            squad_1_active = false;
	                            squad_2_active = false;
	                            squad_3_active = false;
	                            squad_4_active = false;
	                            squad_5_active = false;
	                            break;
	                    }
	                    turn_ap = 0;
	                    //Determine total amount of action points in play for the turn
	                    //Enable movement and targeting with active units
	                    if active_list != -1 {
	                        var ali;
	                        if !ds_list_empty(active_list) {
	                            for(ali=0; ali<ds_list_size(active_list); ali+=1) {
	                                var uli = ds_list_find_value(active_list, ali);
	                                turn_ap += uli.action_points;
	                            }
	                        }
	                    }
	                    //Set state for the turn
	                    if global.game_turn <= 12 {
	                        turn_start = false;
	                        state = "DEFEND"; 
	                        can_move = true;
	                    }
	                        else if global.game_turn > 12 && global.game_turn <= 59  {
	                            turn_start = false;
	                            state = choose("DEFEND", "ATTACK", "DEFEND"); 
	                            can_move = true;
	                        }
								else if global.game_turn >= 60 && global.game_turn < 64 { 
	                                turn_start = false;
	                                state = "REINFORCE";
									can_reinforce = true;
	                                infantry_amount = 6;
	                                tank_amount = 2;
	                                engineer_amount = 0;
	                                btr_amount = 4;
	                                logi_amount = 0;
									ds_list_clear(tile_list);
	                                spawn_infantry = true;
									spawn_tank = false;
									spawn_engineer = false;
									spawn_btr = false;
									spawn_logi = false;
	                            }
	                            else if global.game_turn >= 64 && global.game_turn <= 75 {
	                                //Check and replenish ammo
	                                var ia;
	                                if !ds_list_empty(active_list) {
	                                    for(ia=0; ia<ds_list_size(active_list); ia+=1) {
	                                        var eu = ds_list_find_value(active_list, ia);
	                                        with eu {
	                                            switch unit_type {
	                                                case "E_INFA":
	                                                    if rifle_ammo <= 0 { rifle_ammo += rifle_rate*4; }
	                                                    if rpg_ammo   <= 0 { rpg_ammo += rpg_rate; }
	                                                    if flare_ammo <= 0 { flare_ammo += flare_rate; }
	                                                    break;
	                                                case "E_MBTA":
	                                                    if cannon_ammo <= 0 { cannon_ammo += cannon_rate*2; }
	                                                    if mg_ammo     <= 0 { mg_ammo += mg_rate*4; }
	                                                    break;
	                                                case "E_LACA":
	                                                    break;
	                                                case "E_LAVA":
	                                                    if ap_ammo <= 0 { ap_ammo += ap_rate*2; }
	                                                    if he_ammo <= 0 { he_ammo += he_rate*2; }
	                                                    break;
	                                                case "E_LOGIA":
	                                                    break;
	                                                case "E_DEPOT":
	                                                    break;
	                                                case "E_REPAIR":
	                                                    break;
	                                                case "E_TOW":
	                                                    break;
	                                                case "E_MORTAR":
	                                                    break;
	                                            }
	                                        }
	                                    }
	                                }
	                                turn_start = false;
	                                state = "DEFEND";  
	                                can_move = true;
								}
									else if global.game_turn > 75  {
			                            turn_start = false;
			                            state = choose("DEFEND", "ATTACK", "DEFEND", "DEFEND"); 
			                            can_move = true;
			                        }
                                    
	                } 
	                if can_move == true {
	                    can_move = false;
	                    alarm[1] = global.tick_rate*2;
	                    //Set squad waypoints
						scr_EnemyWaypoints();
	                }
	            }
	                else { 
						//Timer max reached, end the turn
						active = false; 
						obj_CONTROL.can_endturn = true;
					}
	        }
	            else { state = "IDLE"; }
	    }
	        else if ds_list_empty(global.enemyunit_list) { 
	            state = "DEFEAT";
	        }   
	}
	    else if global.game_turn == 0 && obj_CONTROL.landing == true { state = "LANDING"; }
}
	else { 
		state = "IDLE"; 
		active = false;
	}

switch state {
    case "IDLE":
        squad_1_active = false;
        squad_2_active = false;
        squad_3_active = false;
        squad_4_active = false;
        squad_5_active = false;
        break;
    case "DEFEAT":
        if global.victory == false { global.victory = true; }
        break;
    case "LANDING":
        //Spawn the initial wave of units
        if can_spawn == true {
            can_spawn = false;
            //Find a clear tile within range to spawn on
            //Search for viable tiles
            var i;
            if !ds_list_empty(global.tile_list) {
                for(i=0; i<ds_list_size(global.tile_list); i+=1) {
                    var gt = ds_list_find_value(global.tile_list, i);
                    var tx = gt.tile_x;
                    var ty = gt.tile_y;
					if p_one == true {
	                    if (ty >= global.min_y) && (ty <= (global.min_y+(global.cell_size*6))) {
	                        if (tx >= global.min_x+global.cell_size*12) && (tx <= global.max_x-(global.cell_size*12)) {
	                            //Add tile to list of potential waypoints/targets
	                            if (gt.my_colour == c_green) && (gt.occupied == false) { ds_list_add(tile_list,gt.id); }
	                        }
	                    }
					}
						else {
							if (ty <= global.max_y) && (ty >= (global.max_y-(global.cell_size*6))) {
		                        if (tx >= global.min_x+global.cell_size*12) && (tx <= global.max_x-(global.cell_size*12)) {
		                            //Add tile to list of potential waypoints/targets
		                            if (gt.my_colour == c_green) && (gt.occupied == false) { ds_list_add(tile_list,gt.id); }
		                        }
		                    }
						}
                }
            } 
            //First spawn INFANTRY units
            if spawn_infantry == true {
                var esc = 0;
                while infantry_amount > 0 {
                    //Spawn infantry
                    //Choose a waypoint from list of qualified tiles
                    if !ds_list_empty(tile_list) {
                        var c  = abs(floor(random(ds_list_size(tile_list))));
                        var ct = ds_list_find_value(tile_list, c);
                        if ct != noone { instance_create_layer(ct.tile_x, ct.tile_y, "Units", obj_Enemy_INFA); infantry_amount -= 1; }
                        //Remove the waypoint to prevent unit stacking
                        ds_list_delete(tile_list, c);
                    }
                    //Give an escape route
                    if esc > 200 { break; } else { esc+=1; }
                }
                //If all infantry have been spawned then switch to tank spawning
                if infantry_amount <= 0 { 
                    spawn_infantry = false; 
                    spawn_tank = true; 
                    alarm[0] = 120;
                }
                    else { alarm[0] = 120; }
            }
                //Spawn TANK units
                else if spawn_tank == true {
                    var esc = 0;
                    while tank_amount > 0 {
                        //Spawn tanks
                        //Choose a waypoint from list of qualified tiles
                        if !ds_list_empty(tile_list) {
                            var c  = abs(floor(random(ds_list_size(tile_list))));
                            var ct = ds_list_find_value(tile_list, c);
                            if ct != noone { instance_create_layer(ct.tile_x, ct.tile_y, "Units", obj_Enemy_MBTA); tank_amount -= 1; }
                            //Remove the waypoint to prevent unit stacking
                            ds_list_delete(tile_list, c);
                        }
                        //Give an escape route
                        if esc > 200 { break; } else { esc+=1; }
                    }
                    if tank_amount <= 0 { 
                        spawn_tank = false; 
                        spawn_engineer = true; 
                        alarm[0] = 120;
                    }
                        else { alarm[0] = 120; }
                }
                    //Spawn ENGINEER units
                    else if spawn_engineer == true {
                        var esc = 0;
                        while engineer_amount > 0 {
                            //Spawn engineers
                            //Choose a waypoint from list of qualified tiles
                            if !ds_list_empty(tile_list) {
                                var c  = abs(floor(random(ds_list_size(tile_list))));
                                var ct = ds_list_find_value(tile_list, c);
                                if ct != noone { instance_create_layer(ct.tile_x, ct.tile_y, "Units", obj_Enemy_LACA); engineer_amount -= 1; }
                                //Remove the waypoint to prevent unit stacking
                                ds_list_delete(tile_list, c);
                            }
                            //Give an escape route
                            if esc > 200 { break; } else { esc+=1; }
                        }
                        if engineer_amount <= 0 { 
                            spawn_engineer = false; 
                            spawn_btr = true; 
                            alarm[0] = 120;
                        }
                            else { alarm[0] = 120; }
                    }
                        //Spawn BTR units
                        else if spawn_btr == true {
                            var esc = 0;
                            while btr_amount > 0 {
                                //Spawn infantry
                                //Choose a waypoint from list of qualified tiles
                                if !ds_list_empty(tile_list) {
                                    var c  = abs(floor(random(ds_list_size(tile_list))));
                                    var ct = ds_list_find_value(tile_list, c);
                                    if ct != noone { instance_create_layer(ct.tile_x, ct.tile_y, "Units", obj_Enemy_LAVA); btr_amount -= 1; }
                                    //Remove the waypoint to prevent unit stacking
                                    ds_list_delete(tile_list, c);
                                }
                                //Give an escape route
                                if esc > 200 { break; } else { esc+=1; }
                            }
                            if btr_amount <= 0 { 
                                spawn_btr = false; 
                                spawn_logi = true; 
                                alarm[0] = 120;
                            }
                                else { alarm[0] = 120; }
                        }
                            //Spawn LOGI units
                            else if spawn_logi == true {
                                var esc = 0;
                                while logi_amount > 0 {
                                    //Spawn infantry
                                    //Choose a waypoint from list of qualified tiles
                                    if !ds_list_empty(tile_list) {
                                        var c  = abs(floor(random(ds_list_size(tile_list))));
                                        var ct = ds_list_find_value(tile_list, c);
                                        if ct != noone { instance_create_layer(ct.tile_x, ct.tile_y, "Units", obj_Enemy_LOGIA); logi_amount -= 1; }
                                        //Remove the waypoint to prevent unit stacking
                                        ds_list_delete(tile_list, c);
                                    }
                                    //Give an escape route
                                    if esc > 200 { break; } else { esc+=1; }
                                }
                                if logi_amount <= 0 { 
                                    spawn_logi = false; 
                                    ds_list_clear(tile_list);
                                    state = "IDLE";
                                }
                                    else { alarm[0] = 120; }
                            }
        }
        break;
    case "DEFEND":
        //SHOOT MOVE SHOOT
        if (turn_ap > 2) {
            if can_execute == true {
                can_execute = false;
                alarm[10] = 60;
                if squad_1_active == true { active_x = squad_1x; active_y = squad_1y; }
                    else if squad_2_active == true { active_x = squad_2x; active_y = squad_2y; }
                        else if squad_3_active == true { active_x = squad_3x; active_y = squad_3y; }
                            else if squad_4_active == true { active_x = squad_4x; active_y = squad_4y; }
                                else if squad_5_active == true { active_x = squad_5x; active_y = squad_5y; }
                //Calculate navigation for units in active squad
                if active_list != -1 {
                    var i1;
                    if !ds_list_empty(active_list) {
                        idle_count = 0;
                        for(i1=0; i1<ds_list_size(active_list); i1+=1) {
                            var u1 = ds_list_find_value(active_list, i1);
                            with u1 {
                                if nav_confirmed == false && action_confirmed == false && resupplying == false {
                                    //Find max ap
                                    var amm = (action_points/ap_cost);
                                    if amm<0 {amm=0;}
                                    //Find max mp
                                    //var mm = (action_points/mp_cost);
                                    //if mm<0 {mm=0;}
                                    //Take action
                                    if no_shot == false {
                                        if (amm >= 1) {
                                            ds_list_clear(target_list);
                                            //Search for a viable target by looping thru the player unit list
                                            if ds_list_empty(target_list) {
                                                var it;
                                                if !ds_list_empty(global.myunit_list) {
                                                    for(it=0; it<ds_list_size(global.myunit_list); it+=1) {
                                                        var tu = ds_list_find_value(global.myunit_list, it);
                                                        if point_in_circle(tu.x,tu.y, x, y, action_range) {
                                                            ttx = tu.x;
                                                            tty = tu.y;
                                                            var dir = point_direction(x, y, ttx, tty);
                                                            var xdir = lengthdir_x(global.cell_size, dir);
                                                            var ydir = lengthdir_y(global.cell_size, dir);
                                                            if unit_type == "E_LACA" { with shoot_mask { t_line = collision_line(x, y, my_unit.ttx, my_unit.tty, obj_Cant_Shoot, false, true); } }
																//ADD MORTARS HERE...WILL HAVE NO COLLISION LINE
																//ADD LOGIS HERE...WILL SEARCH FOR UNITS IN ACTION RANGE
																//ADD DEPOTS HERE...WILL SEARCH FOR UNITS IN ACTION RANGE
																//ADD REPAIR STATIONS HERE...WILL CHECK IF OCCUPIED
                                                                else { with shoot_mask { t_line = collision_line(x, y, my_unit.ttx-xdir, my_unit.tty-ydir, obj_Cant_Shoot, false, true); } }
                                                            //If unit has a clear line of sight
                                                            if !shoot_mask.t_line  {
                                                                //Generate a list of possible targets
                                                                ds_list_add(target_list, tu.id);
                                                            }
                                                        }
                                                    }
                                                }
                                                if ds_list_empty(target_list) { no_shot = true; }
                                                    else if !ds_list_empty(target_list) { scr_EnemyTargeting(); }
                                            }
                                                else if !ds_list_empty(target_list) { ds_list_clear(target_list); }
                                        }
                                            else { no_shot = true; }
                                    }
                                        //If there are enough points available
                                        //Begin movement
                                        else if no_shot == true {
                                            if action_points >= mp_cost { 
												mp_grid_clear_rectangle(global.move_grid, x-40, y-40, x+40, y+40); 
												//IF THE UNIT IS NOT A STATIC UNIT THEN ALLOW NAVIGATION...ADD HERE
												scr_EnemyNavigation(obj_EnemyControl_B.active_x, obj_EnemyControl_B.active_y); 
											}
                                                else { no_move = true; }			
                                        }
                                    //If the unit cannot move or shoot then increment the idle count
                                    if no_move == true && no_shot == true { idle_state = 1; }
                                        else { idle_state = 0; }
                                    obj_EnemyControl_B.idle_count += idle_state;
                                }
                                    else {
                                        no_move = false;
                                        no_shot = false;
                                    }
                            }
                        }
                        //Determine if all units in squad are idle
                        if idle_count >= ds_list_size(active_list) {
                            //End the turn
                            active = false;
                            obj_CONTROL.can_endturn = true;
                        }
                    }
                        else {
                            //No units assigned to squad
                            //End the turn
                            active = false;
                            obj_CONTROL.can_endturn = true;
                        }
                }
                    else {
                        //No active squad list assigned
                        //End the turn
                        active = false;
                        obj_CONTROL.can_endturn = true;
                    }
            }
        }
            else {
                //No action points available
                //End the turn
                active = false;
                obj_CONTROL.can_endturn = true;
            }
        break;
    case "ATTACK":
        if (turn_ap > 2) {
            if can_execute == true {
                can_execute = false;
                alarm[10] = 60;
                //MOVE SHOOT MOVE
                if squad_1_active == true { active_x = squad_1x; active_y = squad_1y; }
                    else if squad_2_active == true { active_x = squad_2x; active_y = squad_2y; }
                        else if squad_3_active == true { active_x = squad_3x; active_y = squad_3y; }
                            else if squad_4_active == true { active_x = squad_4x; active_y = squad_4y; }
                                else if squad_5_active == true { active_x = squad_5x; active_y = squad_5y; }
                if active_list != -1 {
                    //Calculate navigation for units in active squad
                    var i1;
                    if !ds_list_empty(active_list) {
                        //Reset idle unit count
                        idle_count = 0;
                        //Loop thru active unit list and set unit actions
                        for(i1=0; i1<ds_list_size(active_list); i1+=1) {
                            var u1 = ds_list_find_value(active_list, i1);
                            with u1 {
                                if nav_confirmed == false && action_confirmed == false && resupplying == false {
                                    //Find max movement amount
                                    //var mm = (action_points/mp_cost);
                                    //if mm<0 {mm=0;}
                                    //Find max actions amount
                                    var amm = (action_points/ap_cost);
                                    if amm<0 {amm=0;}
                                    //If there are enough points available
                                    //Begin movement
                                    if no_move == false {
                                        //Allow for movement up to 4 moves then look for a target
                                        if action_points >= mp_cost*2 { 
											mp_grid_clear_rectangle(global.move_grid, x-40, y-40, x+40, y+40);
                                            scr_EnemyNavigation(obj_EnemyControl_B.active_x, obj_EnemyControl_B.active_y);   
                                        }
                                            else {
                                                //Check if unit has a firing solution
                                                if no_shot == false {
                                                    if amm >= 2 {
                                                        //Clear any previous target list and generate a new one
                                                        ds_list_clear(target_list);
                                                        //Search for a viable target
                                                        if ds_list_empty(target_list) {
                                                            var it;
                                                            if !ds_list_empty(global.myunit_list) {
                                                                for(it=0; it<ds_list_size(global.myunit_list); it+=1) {
                                                                    var tu = ds_list_find_value(global.myunit_list, it);
                                                                    if point_in_circle(tu.x,tu.y, x, y, action_range) {
                                                                        ttx = tu.x;
                                                                        tty = tu.y;
                                                                        var dir = point_direction(x, y, ttx, tty);
                                                                        var xdir = lengthdir_x(global.cell_size, dir);
                                                                        var ydir = lengthdir_y(global.cell_size, dir);
                                                                        if unit_type == "E_LACA" { with shoot_mask { t_line = collision_line(x, y, my_unit.ttx, my_unit.tty, obj_Cant_Shoot, false, true); } }
                                                                            else { with shoot_mask { t_line = collision_line(x, y, my_unit.ttx-xdir, my_unit.tty-ydir, obj_Cant_Shoot, false, true); } }
                                                                        //If unit has a clear line of sight
                                                                        if !shoot_mask.t_line  {
                                                                            //Generate a list of possible targets
                                                                            ds_list_add(target_list, tu.id);
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            if ds_list_empty(target_list) { no_shot = true; }
                                                                else if !ds_list_empty(target_list) { scr_EnemyTargeting(); }
                                                        }
                                                            else if !ds_list_empty(target_list) { ds_list_clear(target_list); }
                                                    }
                                                        else { no_shot = true ; }
                                                }
                                                    else {
                                                        //If the unit has movement points available
                                                        if action_points >= mp_cost { 
															mp_grid_clear_rectangle(global.move_grid, x-40, y-40, x+40, y+40);
															scr_EnemyNavigation(obj_EnemyControl_B.active_x, obj_EnemyControl_B.active_y); 
														}
                                                            else { no_move = true; }
                                                    }
                                            }
                                    }
                                        else if no_move == true {
                                            //Check if unit has a firing solution
                                            if no_shot == false {
                                                if amm >= 2 {
                                                    //Clear any previous target list and generate a new one
                                                    ds_list_clear(target_list);
                                                    //Search for a viable target
                                                    if ds_list_empty(target_list) {
                                                        var it;
                                                        if !ds_list_empty(global.myunit_list) {
                                                            for(it=0; it<ds_list_size(global.myunit_list); it+=1) {
                                                                var tu = ds_list_find_value(global.myunit_list, it);
                                                                if point_in_circle(tu.x,tu.y, x, y, action_range) {
                                                                    ttx = tu.x;
                                                                    tty = tu.y;
                                                                    var dir = point_direction(x, y, ttx, tty);
                                                                    var xdir = lengthdir_x(global.cell_size, dir);
                                                                    var ydir = lengthdir_y(global.cell_size, dir);
                                                                    if unit_type == "E_LACA" { with shoot_mask { t_line = collision_line(x, y, my_unit.ttx, my_unit.tty, obj_Cant_Shoot, false, true); } }
                                                                        else { with shoot_mask { t_line = collision_line(x, y, my_unit.ttx-xdir, my_unit.tty-ydir, obj_Cant_Shoot, false, true); } }
                                                                    //If unit has a clear line of sight
                                                                    if !shoot_mask.t_line  {
                                                                        //Generate a list of possible targets
                                                                        ds_list_add(target_list, tu.id);
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        if ds_list_empty(target_list) { no_shot = true; }
                                                            else if !ds_list_empty(target_list) { scr_EnemyTargeting(); }
                                                    }
                                                        else if !ds_list_empty(target_list) { ds_list_clear(target_list); }
                                                }
                                                    else { no_shot = true ; }
                                            }
                                        }
                                    //If the unit cannot move or shoot then increment the idle count
                                    if no_move == true && no_shot == true { idle_state = 1; }
                                        else { idle_state = 0; }
                                    obj_EnemyControl_B.idle_count += idle_state;
                                }
                                    else {
                                        no_move = false;
                                        no_shot = false;
                                    }
                            }
                        }
                        //Determine if all units in squad are idle
                        if idle_count >= ds_list_size(active_list) {
                            //End the turn
                            active = false;
                            obj_CONTROL.can_endturn = true;
                        }
                    }
                        else {
                            //No units assigned to squad
                            //End the turn
                            active = false;
                            obj_CONTROL.can_endturn = true;
                        }
                }
                    else {
                        //No active squad list assigned
                        //End the turn
                        active = false;
                        obj_CONTROL.can_endturn = true;
                    }
            }
        }
            else {
                //No action points available
                //End the turn
                active = false;
                obj_CONTROL.can_endturn = true;
            }
        break;
    case "REINFORCE":
        //Spawn reinforcements
        if can_reinforce == true {
            can_reinforce = false;
            //Find a suitable waypoint
            //Look for viable tiles
            var itl;
            if !ds_list_empty(global.tile_list) {
                for(itl=0; itl<ds_list_size(global.tile_list); itl+=1) {
                    var gt = ds_list_find_value(global.tile_list, itl);
                    var tx = gt.tile_x;
                    var ty = gt.tile_y
                    if p_one == true {
	                    if (ty >= global.min_y) && (ty <= (global.min_y+(global.cell_size*6))) {
	                        if (tx >= global.min_x+global.cell_size*12) && (tx <= global.max_x-(global.cell_size*12)) {
	                            //Add tile to list of potential waypoints/targets
	                            if (gt.my_colour == c_green) && (gt.occupied == false) { ds_list_add(tile_list,gt.id); }
	                        }
	                    }
					}
						else {
							if (ty <= global.max_y) && (ty >= (global.max_y-(global.cell_size*6))) {
		                        if (tx >= global.min_x+global.cell_size*12) && (tx <= global.max_x-(global.cell_size*12)) {
		                            //Add tile to list of potential waypoints/targets
		                            if (gt.my_colour == c_green) && (gt.occupied == false) { ds_list_add(tile_list,gt.id); }
		                        }
		                    }
						}
                }
            } 
            //First spawn INFANTRY units
            if spawn_infantry == true {
                var esc = 0;
                while infantry_amount > 0 {
                    //Choose a waypoint from list of qualified tiles
                    if !ds_list_empty(tile_list) {
                        var c  = abs(floor(random(ds_list_size(tile_list))));
                        var ct = ds_list_find_value(tile_list, c);
                        if ct != noone { instance_create_layer(ct.tile_x, ct.tile_y, "Units", obj_Enemy_INFA); infantry_amount -= 1; }
                        //Remove the waypoint to prevent unit stacking
                        ds_list_delete(tile_list, c);
                    }
                    //Give an escape route
                    if esc > 200 { break; } else { esc+=1; }
                }
                //If all infantry have been spawned then switch to tank spawning
                if infantry_amount <= 0 { 
                    spawn_infantry = false; 
                    spawn_tank = true; 
                    alarm[7] = 120;
                }
                    else { alarm[7] = 120; }
            }
                //Spawn TANK units
                else if spawn_tank == true {
                    var esc = 0;
                    while tank_amount > 0 {
                        //Choose a waypoint from list of qualified tiles
                        if !ds_list_empty(tile_list) {
                            var c  = abs(floor(random(ds_list_size(tile_list))));
                            var ct = ds_list_find_value(tile_list, c);
                            if ct != noone { instance_create_layer(ct.tile_x, ct.tile_y, "Units", obj_Enemy_MBTA); tank_amount -= 1; }
                            //Remove the waypoint to prevent unit stacking
                            ds_list_delete(tile_list, c);
                        }
                        //Give an escape route
                        if esc > 200 { break; } else { esc+=1; }
                    }
                    if tank_amount <= 0 { 
                        spawn_tank = false; 
                        spawn_engineer = true; 
                        alarm[7] = 120;
                    }
                        else { alarm[7] = 120; }
                }
                    //Spawn ENGINEER units
                    else if spawn_engineer == true {
                        var esc = 0;
                        while engineer_amount > 0 {
                            //Choose a waypoint from list of qualified tiles
                            if !ds_list_empty(tile_list) {
                                var c  = abs(floor(random(ds_list_size(tile_list))));
                                var ct = ds_list_find_value(tile_list, c);
                                if ct != noone { instance_create_layer(ct.tile_x, ct.tile_y, "Units", obj_Enemy_LACA); engineer_amount -= 1; }
                                //Remove the waypoint to prevent unit stacking
                                ds_list_delete(tile_list, c);
                            }
                            //Give an escape route
                            if esc > 200 { break; } else { esc+=1; }
                        }
                        if engineer_amount <= 0 { 
                            spawn_engineer = false; 
                            spawn_btr = true; 
                            alarm[7] = 120;
                        }
                            else { alarm[7] = 120; }
                    }
                        //Spawn BTR units
                        else if spawn_btr == true {
                            var esc = 0;
                            while btr_amount > 0 {
                                //Spawn infantry
                                //Choose a waypoint from list of qualified tiles
                                if !ds_list_empty(tile_list) {
                                    var c  = abs(floor(random(ds_list_size(tile_list))));
                                    var ct = ds_list_find_value(tile_list, c);
                                    if ct != noone { instance_create_layer(ct.tile_x, ct.tile_y, "Units", obj_Enemy_LAVA); btr_amount -= 1; }
                                    //Remove the waypoint to prevent unit stacking
                                    ds_list_delete(tile_list, c);
                                }
                                //Give an escape route
                                if esc > 200 { break; } else { esc+=1; }
                            }
                            if btr_amount <= 0 { 
                                spawn_btr = false; 
                                spawn_logi = true; 
                                alarm[7] = 120;
                            }
                                else { alarm[7] = 120; }
                        }
                            //Spawn LOGI units
                            else if spawn_logi == true {
                                var esc = 0;
                                while logi_amount > 0 {
                                    //Spawn infantry
                                    //Choose a waypoint from list of qualified tiles
                                    if !ds_list_empty(tile_list) {
                                        var c  = abs(floor(random(ds_list_size(tile_list))));
                                        var ct = ds_list_find_value(tile_list, c);
                                        if ct != noone { instance_create_layer(ct.tile_x, ct.tile_y, "Units", obj_Enemy_LOGIA); logi_amount -= 1; }
                                        //Remove the waypoint to prevent unit stacking
                                        ds_list_delete(tile_list, c);
                                    }
                                    //Give an escape route
                                    if esc > 200 { break; } else { esc+=1; }
                                }
                                if logi_amount <= 0 { 
                                    spawn_logi = false; 
                                    ds_list_clear(tile_list);
									state = "IDLE";
                                    //End the turn
					                active = false;
					                obj_CONTROL.can_endturn = true;
                                }
                                    else { alarm[7] = 120; }
                            }
        }
			else { }
        break;
    default:
        break;
}
