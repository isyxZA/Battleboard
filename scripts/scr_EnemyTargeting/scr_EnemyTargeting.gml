function scr_EnemyTargeting() {
	//Choose a target from target list
	if !ds_list_empty(target_list) {
	    //Select a ramdom target from target list
	    var rt  = abs(floor(random(ds_list_size(target_list))));
	    var tt  = ds_list_find_value(target_list, rt);
	    //This may help to remove references to destroyed units
	    if tt != noone {
	        target_unit = tt.id;
	        target_x = target_unit.x;
	        target_y = target_unit.y; 
	    }
	        else { 
	            //Search again for targets
	            ds_list_clear(target_list);
	            no_shot = false;
	            exit;
	        }
	}
	    else {
	        no_shot = true;
	        exit;
	    }

	switch unit_type {
	    //Type of targeting unit
	    case "E_INFA":
	        //If the unit has enough ammo for at least one round
	        if (rifle_ammo >= rifle_rate) || (rpg_ammo >= rpg_rate) || (flare_ammo >= flare_rate) {
	            //Find max shoot amount for each weapon
	            var mrifle  = rifle_ammo/rifle_rate;
	            var mrpg    = rpg_ammo/rpg_rate;
	            var mflare  = flare_ammo/flare_rate;
	            var mpoints = action_points/ap_cost;
	            //Target unit
	            //This is for setting specific ammo type preferences for each target unit
	            switch target_unit.unit_type {
	                case "INF_A":
					case "INF_B":
	                case "LAC_A":
					case "LAC_B":
	                case "DEPOT":
	                case "REPAIR":
	                    if mrifle >= 1 {
	                        //Set max amount of rounds
	                        //If 4 volleys are available, otherwise shoot amount that is available
	                        //This also prevents shooting more than is available
	                        shoot_amount = min(1, mrifle, mpoints);
	                        shoot_rifle = true;
	                        weapon = "RIFLE";
	                        rifle_ammo -= shoot_amount*rifle_rate;
	                        action_points -= shoot_amount*ap_cost;
	                        obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                        //Fire the rounds
	                        action_confirmed = true;
	                        global.enemyunits_running += 1;
	                        exit;
	                    }
	                        else if mrpg >= 1 {
	                            //Set max amount of rounds
	                            //If 1 volleys are available, otherwise shoot amount that is available
	                            shoot_amount = min(1, mrpg);
	                            shoot_rpg = true;
	                            weapon = "RPG";
	                            rpg_ammo -= shoot_amount*rpg_rate;
	                            action_points -= shoot_amount*ap_cost;
	                            obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                            //Fire the rounds
	                            action_confirmed = true;
	                            global.enemyunits_running += 1;
	                            exit;
	                        }
	                            else if mflare >= 1 {
	                                //Set max amount of rounds
	                                //If 1 volleys are available, otherwise shoot amount that is available
	                                shoot_amount = min(1, mflare, mpoints);
	                                shoot_flare = true;
	                                weapon = "FLARE";
	                                flare_ammo -= shoot_amount*flare_rate;
	                                action_points -= shoot_amount*ap_cost;
	                                obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                                //Fire the rounds
	                                action_confirmed = true;
	                                global.enemyunits_running += 1;
	                                exit;
	                            }
	                    break;
	                case "MBT_A":
					case "MBT_B":
	                case "LAV_A":
					case "LAV_B":
	                case "LOGI_A":
					case "LOGI_B":
	                case "TOW":
	                case "MORTAR":
	                    if mrpg >= 1 {
	                        //Set max amount of rounds
	                        //If 1 volleys are available, otherwise shoot amount that is available
	                        shoot_amount = min(1, mrpg, mpoints);
	                        shoot_rpg = true;
	                        weapon = "RPG";
	                        rpg_ammo -= shoot_amount*rpg_rate;
	                        action_points -= shoot_amount*ap_cost;
	                        obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                        //Fire the rounds
	                        action_confirmed = true;
	                        global.enemyunits_running += 1;
	                        exit;
	                    }
	                        else if mrifle >= 1 {
	                            //Set max amount of rounds
	                            //If 4 volleys are available, otherwise shoot amount that is available
	                            //This also prevents shooting more than is available
	                            shoot_amount = min(1, mrifle, mpoints);
	                            shoot_rifle = true;
	                            weapon = "RIFLE";
	                            rifle_ammo -= shoot_amount*rifle_rate;
	                            action_points -= shoot_amount*ap_cost;
	                            obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                            //Fire the rounds
	                            action_confirmed = true;
	                            global.enemyunits_running += 1;
	                            exit;
	                        }
	                            else if mflare >= 1 {
	                                //Set max amount of rounds
	                                //If 1 volleys are available, otherwise shoot amount that is available
	                                shoot_amount = min(1, mflare, mpoints);
	                                shoot_flare = true;
	                                weapon = "FLARE";
	                                flare_ammo -= shoot_amount*flare_rate;
	                                action_points -= shoot_amount*ap_cost;
	                                obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                                //Fire the rounds
	                                action_confirmed = true;
	                                global.enemyunits_running += 1;
	                                exit;
	                            }
	                    break;
	            }
	        }
	            else { no_shot = true; }
	        break;
		case "E_INFB":
	        //If the unit has enough ammo for at least one round
	        if (rifle_ammo >= rifle_rate) || (rpg_ammo >= rpg_rate) || (flare_ammo >= flare_rate) {
	            //Find max shoot amount for each weapon
	            var mrifle  = rifle_ammo/rifle_rate;
	            var mrpg    = rpg_ammo/rpg_rate;
	            var mflare  = flare_ammo/flare_rate;
	            var mpoints = action_points/ap_cost;
	            //Target unit
	            //This is for setting specific ammo type preferences for each target unit
	            switch target_unit.unit_type {
	                case "INF_A":
					case "INF_B":
	                case "LAC_A":
					case "LAC_B":
	                case "DEPOT":
	                case "REPAIR":
	                    if mrifle >= 1 {
	                        //Set max amount of rounds
	                        //If 4 volleys are available, otherwise shoot amount that is available
	                        //This also prevents shooting more than is available
	                        shoot_amount = min(1, mrifle, mpoints);
	                        shoot_rifle = true;
	                        weapon = "RIFLE";
	                        rifle_ammo -= shoot_amount*rifle_rate;
	                        action_points -= shoot_amount*ap_cost;
	                        obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                        //Fire the rounds
	                        action_confirmed = true;
	                        global.enemyunits_running += 1;
	                        exit;
	                    }
	                        else if mrpg >= 1 {
	                            //Set max amount of rounds
	                            //If 1 volleys are available, otherwise shoot amount that is available
	                            shoot_amount = min(1, mrpg);
	                            shoot_rpg = true;
	                            weapon = "RPG";
	                            rpg_ammo -= shoot_amount*rpg_rate;
	                            action_points -= shoot_amount*ap_cost;
	                            obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                            //Fire the rounds
	                            action_confirmed = true;
	                            global.enemyunits_running += 1;
	                            exit;
	                        }
	                            else if mflare >= 1 {
	                                //Set max amount of rounds
	                                //If 1 volleys are available, otherwise shoot amount that is available
	                                shoot_amount = min(1, mflare, mpoints);
	                                shoot_flare = true;
	                                weapon = "FLARE";
	                                flare_ammo -= shoot_amount*flare_rate;
	                                action_points -= shoot_amount*ap_cost;
	                                obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                                //Fire the rounds
	                                action_confirmed = true;
	                                global.enemyunits_running += 1;
	                                exit;
	                            }
	                    break;
	                case "MBT_A":
					case "MBT_B":
	                case "LAV_A":
					case "LAV_B":
	                case "LOGI_A":
					case "LOGI_B":
	                case "TOW":
	                case "MORTAR":
	                    if mrpg >= 1 {
	                        //Set max amount of rounds
	                        //If 1 volleys are available, otherwise shoot amount that is available
	                        shoot_amount = min(1, mrpg, mpoints);
	                        shoot_rpg = true;
	                        weapon = "RPG";
	                        rpg_ammo -= shoot_amount*rpg_rate;
	                        action_points -= shoot_amount*ap_cost;
	                        obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                        //Fire the rounds
	                        action_confirmed = true;
	                        global.enemyunits_running += 1;
	                        exit;
	                    }
	                        else if mrifle >= 1 {
	                            //Set max amount of rounds
	                            //If 4 volleys are available, otherwise shoot amount that is available
	                            //This also prevents shooting more than is available
	                            shoot_amount = min(1, mrifle, mpoints);
	                            shoot_rifle = true;
	                            weapon = "RIFLE";
	                            rifle_ammo -= shoot_amount*rifle_rate;
	                            action_points -= shoot_amount*ap_cost;
	                            obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                            //Fire the rounds
	                            action_confirmed = true;
	                            global.enemyunits_running += 1;
	                            exit;
	                        }
	                            else if mflare >= 1 {
	                                //Set max amount of rounds
	                                //If 1 volleys are available, otherwise shoot amount that is available
	                                shoot_amount = min(1, mflare, mpoints);
	                                shoot_flare = true;
	                                weapon = "FLARE";
	                                flare_ammo -= shoot_amount*flare_rate;
	                                action_points -= shoot_amount*ap_cost;
	                                obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                                //Fire the rounds
	                                action_confirmed = true;
	                                global.enemyunits_running += 1;
	                                exit;
	                            }
	                    break;
	            }
	        }
	            else { no_shot = true; }
	        break;
	    case "E_MBTA":
	        //If the unit has enough ammo for at least one round
	        if (cannon_ammo >= cannon_rate) || (mg_ammo >= mg_rate) {
	            //Find max shoot amount for each weapon
	            var mcannon  = cannon_ammo/cannon_rate;
	            var mmg      = mg_ammo/mg_rate;
	            var cpoints  = action_points/cannon_cost;
	            var mgpoints = action_points/mg_cost;
	            //Target unit
	            //This is for setting specific ammo type preferences for each target unit
	            switch target_unit.unit_type {
	                case "INF_A":
					case "INF_B":
	                    if mmg >= 1 {
	                        //Set max amount of rounds
	                        //If 4 volleys are available, otherwise shoot amount that is available
	                        //This also prevents shooting more than is available
	                        shoot_amount = min(1, mmg, mgpoints);
	                        if shoot_amount >= 1 {
	                            shoot_mg = true;
	                            weapon = "MG";
	                            mg_ammo -= shoot_amount*mg_rate;
	                            action_points -= shoot_amount*mg_cost;
	                            obj_EnemyControl_B.turn_ap -= shoot_amount*mg_cost;
	                            //Fire the rounds
	                            action_confirmed = true;
	                            global.enemyunits_running += 1;
	                        }
	                        exit;
	                    }
	                        else if mcannon >= 1 {
	                            //Set max amount of rounds
	                            //If a volley is available then shoot, otherwise exit
	                            shoot_amount = min(1, mcannon, cpoints);
	                            if shoot_amount >= 1 {
	                                shoot_cannon = true;
	                                weapon = "CANNON";
	                                cannon_ammo -= shoot_amount*cannon_rate;
	                                action_points -= shoot_amount*cannon_cost;
	                                obj_EnemyControl_B.turn_ap -= shoot_amount*cannon_cost;
	                                //Fire the rounds
	                                action_confirmed = true;
	                                global.enemyunits_running += 1;
	                            }
	                            exit;
	                        }
	                    break;
	                case "LAC_A":
					case "LAC_B":
	                case "DEPOT":
	                case "REPAIR":
	                case "MBT_A":
					case "MBT_B":
	                case "LAV_A":
					case "LAV_B":
	                case "LOGI_A":
					case "LOGI_B":
	                case "TOW":
	                case "MORTAR":
	                    if mcannon >= 1 {
	                        //Set max amount of rounds
	                        //If a volley is available then shoot, otherwise exit
	                        shoot_amount = min(1, mcannon, cpoints);
	                        if shoot_amount >= 1 {
	                            shoot_cannon = true;
	                            weapon = "CANNON";
	                            cannon_ammo -= shoot_amount*cannon_rate;
	                            action_points -= shoot_amount*cannon_cost;
	                            obj_EnemyControl_B.turn_ap -= shoot_amount*cannon_cost;
	                            //Fire the rounds
	                            action_confirmed = true;
	                            global.enemyunits_running += 1;
	                        }
	                        exit;
	                    }
	                        else if mmg >= 1 {
	                            //Set max amount of rounds
	                            //If 4 volleys are available, otherwise shoot amount that is available
	                            //This also prevents shooting more than is available
	                            shoot_amount = min(1, mmg, mgpoints);
	                            if shoot_amount >= 1 {
	                                shoot_mg = true;
	                                weapon = "MG";
	                                mg_ammo -= shoot_amount*mg_rate;
	                                action_points -= shoot_amount*mg_cost;
	                                obj_EnemyControl_B.turn_ap -= shoot_amount*mg_cost;
	                                //Fire the rounds
	                                action_confirmed = true;
	                                global.enemyunits_running += 1;
	                            }
	                            exit;
	                        }
	                    break;
	            }
	        }
	            else { no_shot = true; }
	        break;
		case "E_MBTB":
	        //If the unit has enough ammo for at least one round
	        if (cannon_ammo >= cannon_rate) || (mg_ammo >= mg_rate) {
	            //Find max shoot amount for each weapon
	            var mcannon  = cannon_ammo/cannon_rate;
	            var mmg      = mg_ammo/mg_rate;
	            var cpoints  = action_points/cannon_cost;
	            var mgpoints = action_points/mg_cost;
	            //Target unit
	            //This is for setting specific ammo type preferences for each target unit
	            switch target_unit.unit_type {
	                case "INF_A":
					case "INF_B":
	                    if mmg >= 1 {
	                        //Set max amount of rounds
	                        //If 4 volleys are available, otherwise shoot amount that is available
	                        //This also prevents shooting more than is available
	                        shoot_amount = min(1, mmg, mgpoints);
	                        if shoot_amount >= 1 {
	                            shoot_mg = true;
	                            weapon = "MG";
	                            mg_ammo -= shoot_amount*mg_rate;
	                            action_points -= shoot_amount*mg_cost;
	                            obj_EnemyControl_B.turn_ap -= shoot_amount*mg_cost;
	                            //Fire the rounds
	                            action_confirmed = true;
	                            global.enemyunits_running += 1;
	                        }
	                        exit;
	                    }
	                        else if mcannon >= 1 {
	                            //Set max amount of rounds
	                            //If a volley is available then shoot, otherwise exit
	                            shoot_amount = min(1, mcannon, cpoints);
	                            if shoot_amount >= 1 {
	                                shoot_cannon = true;
	                                weapon = "CANNON";
	                                cannon_ammo -= shoot_amount*cannon_rate;
	                                action_points -= shoot_amount*cannon_cost;
	                                obj_EnemyControl_B.turn_ap -= shoot_amount*cannon_cost;
	                                //Fire the rounds
	                                action_confirmed = true;
	                                global.enemyunits_running += 1;
	                            }
	                            exit;
	                        }
	                    break;
	                case "LAC_A":
					case "LAC_B":
	                case "DEPOT":
	                case "REPAIR":
	                case "MBT_A":
					case "MBT_B":
	                case "LAV_A":
					case "LAV_B":
	                case "LOGI_A":
					case "LOGI_B":
	                case "TOW":
	                case "MORTAR":
	                    if mcannon >= 1 {
	                        //Set max amount of rounds
	                        //If a volley is available then shoot, otherwise exit
	                        shoot_amount = min(1, mcannon, cpoints);
	                        if shoot_amount >= 1 {
	                            shoot_cannon = true;
	                            weapon = "CANNON";
	                            cannon_ammo -= shoot_amount*cannon_rate;
	                            action_points -= shoot_amount*cannon_cost;
	                            obj_EnemyControl_B.turn_ap -= shoot_amount*cannon_cost;
	                            //Fire the rounds
	                            action_confirmed = true;
	                            global.enemyunits_running += 1;
	                        }
	                        exit;
	                    }
	                        else if mmg >= 1 {
	                            //Set max amount of rounds
	                            //If 4 volleys are available, otherwise shoot amount that is available
	                            //This also prevents shooting more than is available
	                            shoot_amount = min(1, mmg, mgpoints);
	                            if shoot_amount >= 1 {
	                                shoot_mg = true;
	                                weapon = "MG";
	                                mg_ammo -= shoot_amount*mg_rate;
	                                action_points -= shoot_amount*mg_cost;
	                                obj_EnemyControl_B.turn_ap -= shoot_amount*mg_cost;
	                                //Fire the rounds
	                                action_confirmed = true;
	                                global.enemyunits_running += 1;
	                            }
	                            exit;
	                        }
	                    break;
	            }
	        }
	            else { no_shot = true; }
	        break;
	    case "E_LACA":
	        no_shot = true;
	        break;
		case "E_LACB":
	        //If the unit has enough ammo for at least one round
	        if tow_ammo >= tow_rate{
	            //Find max shoot amount for each weapon
	            var mat = tow_ammo/tow_rate;
	            var mpoints = action_points/ap_cost;
	            //Target unit
	            //This is for setting specific ammo type preferences for each target unit
	            switch target_unit.unit_type {
	                case "INF_A":
					case "INF_B":
	                case "DEPOT":
	                case "REPAIR":
	                case "TOW":
	                case "MORTAR":
						no_shot = true;
	                    break;
	                case "LAC_A":
					case "LAC_B":
	                case "MBT_A":
					case "MBT_B":
	                case "LAV_A":
					case "LAV_B":
	                case "LOGI_A":
					case "LOGI_B":
	                    if mat >= 1 {
	                        //Set max amount of rounds
	                        //If 4 volleys are available, otherwise shoot amount that is available
	                        shoot_amount = 1;
	                        shoot_tow = true;
	                        weapon = "TOW";
	                        tow_ammo -= shoot_amount*tow_rate;
	                        action_points -= shoot_amount*ap_cost;
	                        obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                        //Fire the rounds
	                        action_confirmed = true;
	                        global.enemyunits_running += 1;
	                        exit;
	                    }
	                    break;
	            }
            
	        }
	            else { no_shot = true; }
	        break;
	    case "E_LAVA":
	        //If the unit has enough ammo for at least one round
	        if (he_ammo >= he_rate) || (ap_ammo >= ap_rate) || (mg_ammo >= mg_rate) || (tow_ammo >= tow_rate) {
	            //Find max shoot amount for each weapon
	            var mhe = he_ammo/he_rate;
	            var map = ap_ammo/ap_rate;
				var mmg = mg_ammo/mg_rate;
	            var mat = tow_ammo/tow_rate;
	            var mpoints = action_points/ap_cost;
	            //Target unit
	            //This is for setting specific ammo type preferences for each target unit
	            switch target_unit.unit_type {
	                case "INF_A":
					case "INF_B":
						if mmg >= 1 {
		                    //Set max amount of rounds
		                    //If 4 volleys are available, otherwise shoot amount that is available
		                    //This also prevents shooting more than is available
		                    shoot_amount = min(1, mmg, mpoints);
		                    shoot_mg = true;
		                    weapon = "MG";
		                    mg_ammo -= shoot_amount*ap_rate;
		                    action_points -= shoot_amount*ap_cost;
		                    obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
		                    //Fire the rounds
		                    action_confirmed = true;
		                    global.enemyunits_running += 1;
		                    exit;
		                }
							else if mhe >= 1 {
		                        //Set max amount of rounds
		                        //If 4 volleys are available, otherwise shoot amount that is available
		                        shoot_amount = min(1, mhe, mpoints);
		                        shoot_he = true;
		                        weapon = "HE";
		                        he_ammo -= shoot_amount*he_rate;
		                        action_points -= shoot_amount*ap_cost;
		                        obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
		                        //Fire the rounds
		                        action_confirmed = true;
		                        global.enemyunits_running += 1;
		                        exit;
		                    }
								else {
									no_shot = true;
				                }
						break;
	                case "DEPOT":
	                case "REPAIR":
	                case "TOW":
	                case "MORTAR":
	                    if mhe >= 1 {
	                        //Set max amount of rounds
	                        //If 4 volleys are available, otherwise shoot amount that is available
	                        shoot_amount = min(1, mhe, mpoints);
	                        shoot_he = true;
	                        weapon = "HE";
	                        he_ammo -= shoot_amount*he_rate;
	                        action_points -= shoot_amount*ap_cost;
	                        obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                        //Fire the rounds
	                        action_confirmed = true;
	                        global.enemyunits_running += 1;
	                        exit;
	                    }
	                        else if map >= 1 {
	                            //Set max amount of rounds
	                            //If 4 volleys are available, otherwise shoot amount that is available
	                            //This also prevents shooting more than is available
	                            shoot_amount = min(1, map, mpoints);
	                            shoot_ap = true;
	                            weapon = "AP";
	                            ap_ammo -= shoot_amount*ap_rate;
	                            action_points -= shoot_amount*ap_cost;
	                            obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                            //Fire the rounds
	                            action_confirmed = true;
	                            global.enemyunits_running += 1;
	                            exit;
	                        }
								else if mmg >= 1 {
		                            //Set max amount of rounds
		                            //If 4 volleys are available, otherwise shoot amount that is available
		                            //This also prevents shooting more than is available
		                            shoot_amount = min(1, mmg, mpoints);
		                            shoot_mg = true;
		                            weapon = "MG";
		                            mg_ammo -= shoot_amount*ap_rate;
		                            action_points -= shoot_amount*ap_cost;
		                            obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
		                            //Fire the rounds
		                            action_confirmed = true;
		                            global.enemyunits_running += 1;
		                            exit;
		                        }
									else if mat >= 1 {
			                            //Set max amount of rounds
			                            //This also prevents shooting more than is available
			                            shoot_amount = min(1, mat, mpoints);
			                            shoot_tow = true;
			                            weapon = "TOW";
			                            tow_ammo -= shoot_amount*ap_rate;
			                            action_points -= shoot_amount*ap_cost;
			                            obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
			                            //Fire the rounds
			                            action_confirmed = true;
			                            global.enemyunits_running += 1;
			                            exit;
			                        }
	                    break;
	                case "MBT_A":
					case "MBT_B":
	                case "LAV_A":
					case "LAV_B":
						if mat >= 1 {
			                //Set max amount of rounds
			                //This also prevents shooting more than is available
			                shoot_amount = min(1, mat, mpoints);
			                shoot_tow = true;
			                weapon = "TOW";
			                tow_ammo -= shoot_amount*ap_rate;
			                action_points -= shoot_amount*ap_cost;
			                obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
			                //Fire the rounds
			                action_confirmed = true;
			                global.enemyunits_running += 1;
			                exit;
			            }
							else if map >= 1 {
	                            //Set max amount of rounds
	                            //If 4 volleys are available, otherwise shoot amount that is available
	                            //This also prevents shooting more than is available
	                            shoot_amount = min(1, map, mpoints);
	                            shoot_ap = true;
	                            weapon = "AP";
	                            ap_ammo -= shoot_amount*ap_rate;
	                            action_points -= shoot_amount*ap_cost;
	                            obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                            //Fire the rounds
	                            action_confirmed = true;
	                            global.enemyunits_running += 1;
	                            exit;
	                        }
								else if mhe >= 1 {
			                        //Set max amount of rounds
			                        //If 4 volleys are available, otherwise shoot amount that is available
			                        shoot_amount = min(1, mhe, mpoints);
			                        shoot_he = true;
			                        weapon = "HE";
			                        he_ammo -= shoot_amount*he_rate;
			                        action_points -= shoot_amount*ap_cost;
			                        obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
			                        //Fire the rounds
			                        action_confirmed = true;
			                        global.enemyunits_running += 1;
			                        exit;
			                    }
									else { no_shot = true; }
						break;
					case "LAC_A":
					case "LAC_B":
	                case "LOGI_A":
					case "LOGI_B":
	                    if mhe >= 1 {
	                        //Set max amount of rounds
	                        //If 4 volleys are available, otherwise shoot amount that is available
	                        shoot_amount = min(1, mhe, mpoints);
	                        shoot_he = true;
	                        weapon = "HE";
	                        he_ammo -= shoot_amount*he_rate;
	                        action_points -= shoot_amount*ap_cost;
	                        obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                        //Fire the rounds
	                        action_confirmed = true;
	                        global.enemyunits_running += 1;
	                        exit;
	                    }
	                        else if map >= 1 {
	                            //Set max amount of rounds
	                            //If 4 volleys are available, otherwise shoot amount that is available
	                            //This also prevents shooting more than is available
	                            shoot_amount = min(1, map, mpoints);
	                            shoot_ap = true;
	                            weapon = "AP";
	                            ap_ammo -= shoot_amount*ap_rate;
	                            action_points -= shoot_amount*ap_cost;
	                            obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                            //Fire the rounds
	                            action_confirmed = true;
	                            global.enemyunits_running += 1;
	                            exit;
	                        }
								else if mmg >= 1 {
		                            //Set max amount of rounds
		                            //If 4 volleys are available, otherwise shoot amount that is available
		                            //This also prevents shooting more than is available
		                            shoot_amount = min(1, mmg, mpoints);
		                            shoot_mg = true;
		                            weapon = "MG";
		                            mg_ammo -= shoot_amount*ap_rate;
		                            action_points -= shoot_amount*ap_cost;
		                            obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
		                            //Fire the rounds
		                            action_confirmed = true;
		                            global.enemyunits_running += 1;
		                            exit;
		                        }
									else { no_shot = true; }
	                    break;
	            }
            
	        }
	            else { no_shot = true; }
	        break;
		case "E_LAVB":
	        //If the unit has enough ammo for at least one round
	        if (he_ammo >= he_rate) || (ap_ammo >= ap_rate) || (mg_ammo >= mg_rate) {
	            //Find max shoot amount for each weapon
	            var mhe = he_ammo/he_rate;
	            var map = ap_ammo/ap_rate;
				var mmg = mg_ammo/mg_rate;
	            var mpoints = action_points/ap_cost;
	            //Target unit
	            //This is for setting specific ammo type preferences for each target unit
	            switch target_unit.unit_type {
	                case "INF_A":
					case "INF_B":
						if mmg >= 1 {
		                    //Set max amount of rounds
		                    //If 4 volleys are available, otherwise shoot amount that is available
		                    //This also prevents shooting more than is available
		                    shoot_amount = min(1, mmg, mpoints);
		                    shoot_mg = true;
		                    weapon = "MG";
		                    mg_ammo -= shoot_amount*ap_rate;
		                    action_points -= shoot_amount*ap_cost;
		                    obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
		                    //Fire the rounds
		                    action_confirmed = true;
		                    global.enemyunits_running += 1;
		                    exit;
		                }
							else if mhe >= 1 {
		                        //Set max amount of rounds
		                        //If 4 volleys are available, otherwise shoot amount that is available
		                        shoot_amount = min(1, mhe, mpoints);
		                        shoot_he = true;
		                        weapon = "HE";
		                        he_ammo -= shoot_amount*he_rate;
		                        action_points -= shoot_amount*ap_cost;
		                        obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
		                        //Fire the rounds
		                        action_confirmed = true;
		                        global.enemyunits_running += 1;
		                        exit;
		                    }
								else {
									no_shot = true;
				                }
						break;
	                case "DEPOT":
	                case "REPAIR":
	                case "TOW":
	                case "MORTAR":
	                    if mhe >= 1 {
	                        //Set max amount of rounds
	                        //If 4 volleys are available, otherwise shoot amount that is available
	                        shoot_amount = min(1, mhe, mpoints);
	                        shoot_he = true;
	                        weapon = "HE";
	                        he_ammo -= shoot_amount*he_rate;
	                        action_points -= shoot_amount*ap_cost;
	                        obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                        //Fire the rounds
	                        action_confirmed = true;
	                        global.enemyunits_running += 1;
	                        exit;
	                    }
	                        else if map >= 1 {
	                            //Set max amount of rounds
	                            //If 4 volleys are available, otherwise shoot amount that is available
	                            //This also prevents shooting more than is available
	                            shoot_amount = min(1, map, mpoints);
	                            shoot_ap = true;
	                            weapon = "AP";
	                            ap_ammo -= shoot_amount*ap_rate;
	                            action_points -= shoot_amount*ap_cost;
	                            obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                            //Fire the rounds
	                            action_confirmed = true;
	                            global.enemyunits_running += 1;
	                            exit;
	                        }
								else if mmg >= 1 {
		                            //Set max amount of rounds
		                            //If 4 volleys are available, otherwise shoot amount that is available
		                            //This also prevents shooting more than is available
		                            shoot_amount = min(1, mmg, mpoints);
		                            shoot_mg = true;
		                            weapon = "MG";
		                            mg_ammo -= shoot_amount*ap_rate;
		                            action_points -= shoot_amount*ap_cost;
		                            obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
		                            //Fire the rounds
		                            action_confirmed = true;
		                            global.enemyunits_running += 1;
		                            exit;
		                        }
									else { no_shot = true; }
	                    break;
	                case "MBT_A":
					case "MBT_B":
	                case "LAV_A":
					case "LAV_B":
						if map >= 1 {
	                        //Set max amount of rounds
	                        //If 4 volleys are available, otherwise shoot amount that is available
	                        //This also prevents shooting more than is available
	                        shoot_amount = min(1, map, mpoints);
	                        shoot_ap = true;
	                        weapon = "AP";
	                        ap_ammo -= shoot_amount*ap_rate;
	                        action_points -= shoot_amount*ap_cost;
	                        obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                        //Fire the rounds
	                        action_confirmed = true;
	                        global.enemyunits_running += 1;
	                        exit;
	                    }
							else if mhe >= 1 {
			                    //Set max amount of rounds
			                    //If 4 volleys are available, otherwise shoot amount that is available
			                    shoot_amount = min(1, mhe, mpoints);
			                    shoot_he = true;
			                    weapon = "HE";
			                    he_ammo -= shoot_amount*he_rate;
			                    action_points -= shoot_amount*ap_cost;
			                    obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
			                    //Fire the rounds
			                    action_confirmed = true;
			                    global.enemyunits_running += 1;
			                    exit;
			                }
								else { no_shot = true; }
						break;
					case "LAC_A":
					case "LAC_B":
	                case "LOGI_A":
					case "LOGI_B":
	                    if mhe >= 1 {
	                        //Set max amount of rounds
	                        //If 4 volleys are available, otherwise shoot amount that is available
	                        shoot_amount = min(1, mhe, mpoints);
	                        shoot_he = true;
	                        weapon = "HE";
	                        he_ammo -= shoot_amount*he_rate;
	                        action_points -= shoot_amount*ap_cost;
	                        obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                        //Fire the rounds
	                        action_confirmed = true;
	                        global.enemyunits_running += 1;
	                        exit;
	                    }
	                        else if map >= 1 {
	                            //Set max amount of rounds
	                            //If 4 volleys are available, otherwise shoot amount that is available
	                            //This also prevents shooting more than is available
	                            shoot_amount = min(1, map, mpoints);
	                            shoot_ap = true;
	                            weapon = "AP";
	                            ap_ammo -= shoot_amount*ap_rate;
	                            action_points -= shoot_amount*ap_cost;
	                            obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
	                            //Fire the rounds
	                            action_confirmed = true;
	                            global.enemyunits_running += 1;
	                            exit;
	                        }
								else if mmg >= 1 {
		                            //Set max amount of rounds
		                            //If 4 volleys are available, otherwise shoot amount that is available
		                            //This also prevents shooting more than is available
		                            shoot_amount = min(1, mmg, mpoints);
		                            shoot_mg = true;
		                            weapon = "MG";
		                            mg_ammo -= shoot_amount*ap_rate;
		                            action_points -= shoot_amount*ap_cost;
		                            obj_EnemyControl_B.turn_ap -= shoot_amount*ap_cost;
		                            //Fire the rounds
		                            action_confirmed = true;
		                            global.enemyunits_running += 1;
		                            exit;
		                        }
									else { no_shot = true; }
	                    break;
	            }
            
	        }
	            else { no_shot = true; }
	        break;
	    case "E_LOGIA":
	        no_shot = true;
	        break;
		case "E_LOGIB":
	        no_shot = true;
	        break;
	    case "E_DEPOT":
	        no_shot = true;
	        break;
	    case "E_REPAIR":
	        //If the unit has enough ammo for at least one round
	        if (mg_ammo >= mg_rate) {
	            no_shot = true;
	        }
	            else { no_shot = true; }
	        break;
	    case "E_TOW":
	        //If the unit has enough ammo for at least one round
	        //ADD FOV LIMIT HERE
	        if (mg_ammo >= mg_rate) {
	            no_shot = true;
	        }
	            else { no_shot = true; }
	        break;
	    case "E_MORTAR":
	        //If the unit has enough ammo for at least one round
	        //ADD FOV LIMIT HERE
	        if (mg_ammo >= mg_rate) {
	            no_shot = true;
	        }
	            else { no_shot = true; }
	        break;
	}


}
