if can_activate == true {
    if mouse_check_button(mb_left) {
        if place_meeting(x, y, obj_MOUSE) {
            if open_slots >= 1 { active = true; }
                else { 
                    active = false; 
                    place_unit = "";
                    temp_sprite = -1;
					temp_cost = 0;
                }
        }
            else { 
                active = false; 
                place_unit = "";
                temp_sprite = -1;
				temp_cost = 0;
            }
    }
        else { 
            active = false; 
            place_unit = "";
            temp_sprite = -1;
			temp_cost = 0;
        }
}
	else {
		
		if mouse_check_button_pressed(mb_right) {
			if (slot1_full == true) && (point_distance(mouse_x, mouse_y, x, slot_y1) < 12) {
				//GET THE CURRENT SQUAD COST OF UNIT IN THE LIST POSITION
				//RETURN THE COST TO FORMATION POINTS
				var slv = ds_list_find_value(squad_list, 0);
				switch slv {
					case "INF_A":
						obj_UnitFormations.formation_points += INF_1;
						break;
					case "INF_B":
						obj_UnitFormations.formation_points += INF_2;
						break;
					case "MBT_A":
						obj_UnitFormations.formation_points += MBT_1;
						break;
					case "MBT_B":
						obj_UnitFormations.formation_points += MBT_2;
						break;
					case "LAC_A":
						obj_UnitFormations.formation_points += LAC_1;
						break;
					case "LAC_B":
						obj_UnitFormations.formation_points += LAC_2;
						break;
					case "LAV_A":
						obj_UnitFormations.formation_points += LAV_1;
						break;
					case "LAV_B":
						obj_UnitFormations.formation_points += LAV_2;
						break;
					case "LOGI_A":
						obj_UnitFormations.formation_points += LOG_1;
						break;
					case "LOGI_B":
						obj_UnitFormations.formation_points += LOG_2;
						break;
				}
				ds_list_delete(squad_list, 0);
				//slot1_full = false;
				open_slots += 1;
				lcheck = true;
			}
				else if (slot2_full == true) && (point_distance(mouse_x, mouse_y, x, slot_y2) < 12) {
					var slv = ds_list_find_value(squad_list, 1);
					switch slv {
						case "INF_A":
							obj_UnitFormations.formation_points += INF_1;
							break;
						case "INF_B":
							obj_UnitFormations.formation_points += INF_2;
							break;
						case "MBT_A":
							obj_UnitFormations.formation_points += MBT_1;
							break;
						case "MBT_B":
							obj_UnitFormations.formation_points += MBT_2;
							break;
						case "LAC_A":
							obj_UnitFormations.formation_points += LAC_1;
							break;
						case "LAC_B":
							obj_UnitFormations.formation_points += LAC_2;
							break;
						case "LAV_A":
							obj_UnitFormations.formation_points += LAV_1;
							break;
						case "LAV_B":
							obj_UnitFormations.formation_points += LAV_2;
							break;
						case "LOGI_A":
							obj_UnitFormations.formation_points += LOG_1;
							break;
						case "LOGI_B":
							obj_UnitFormations.formation_points += LOG_2;
							break;
					}
					ds_list_delete(squad_list, 1);
					//slot2_full = false;
					open_slots += 1;
					lcheck = true;
				}
					else if (slot3_full == true) && (point_distance(mouse_x, mouse_y, x, slot_y3) < 12) {
						var slv = ds_list_find_value(squad_list, 2);
						switch slv {
							case "INF_A":
								obj_UnitFormations.formation_points += INF_1;
								break;
							case "INF_B":
								obj_UnitFormations.formation_points += INF_2;
								break;
							case "MBT_A":
								obj_UnitFormations.formation_points += MBT_1;
								break;
							case "MBT_B":
								obj_UnitFormations.formation_points += MBT_2;
								break;
							case "LAC_A":
								obj_UnitFormations.formation_points += LAC_1;
								break;
							case "LAC_B":
								obj_UnitFormations.formation_points += LAC_2;
								break;
							case "LAV_A":
								obj_UnitFormations.formation_points += LAV_1;
								break;
							case "LAV_B":
								obj_UnitFormations.formation_points += LAV_2;
								break;
							case "LOGI_A":
								obj_UnitFormations.formation_points += LOG_1;
								break;
							case "LOGI_B":
								obj_UnitFormations.formation_points += LOG_2;
								break;
						}
						ds_list_delete(squad_list, 2);
						//slot3_full = false;
						open_slots += 1;
						lcheck = true;
					}
						else if (slot4_full == true) && (point_distance(mouse_x, mouse_y, x, slot_y4) < 12) {
							var slv = ds_list_find_value(squad_list, 3);
							switch slv {
								case "INF_A":
									obj_UnitFormations.formation_points += INF_1;
									break;
								case "INF_B":
									obj_UnitFormations.formation_points += INF_2;
									break;
								case "MBT_A":
									obj_UnitFormations.formation_points += MBT_1;
									break;
								case "MBT_B":
									obj_UnitFormations.formation_points += MBT_2;
									break;
								case "LAC_A":
									obj_UnitFormations.formation_points += LAC_1;
									break;
								case "LAC_B":
									obj_UnitFormations.formation_points += LAC_2;
									break;
								case "LAV_A":
									obj_UnitFormations.formation_points += LAV_1;
									break;
								case "LAV_B":
									obj_UnitFormations.formation_points += LAV_2;
									break;
								case "LOGI_A":
									obj_UnitFormations.formation_points += LOG_1;
									break;
								case "LOGI_B":
									obj_UnitFormations.formation_points += LOG_2;
									break;
							}
							ds_list_delete(squad_list, 3);
							//slot4_full = false;
							open_slots += 1;
							lcheck = true;
						}
							else if (slot5_full == true) && (point_distance(mouse_x, mouse_y, x, slot_y5) < 12) {
								var slv = ds_list_find_value(squad_list, 4);
								switch slv {
									case "INF_A":
										obj_UnitFormations.formation_points += INF_1;
										break;
									case "INF_B":
										obj_UnitFormations.formation_points += INF_2;
										break;
									case "MBT_A":
										obj_UnitFormations.formation_points += MBT_1;
										break;
									case "MBT_B":
										obj_UnitFormations.formation_points += MBT_2;
										break;
									case "LAC_A":
										obj_UnitFormations.formation_points += LAC_1;
										break;
									case "LAC_B":
										obj_UnitFormations.formation_points += LAC_2;
										break;
									case "LAV_A":
										obj_UnitFormations.formation_points += LAV_1;
										break;
									case "LAV_B":
										obj_UnitFormations.formation_points += LAV_2;
										break;
									case "LOGI_A":
										obj_UnitFormations.formation_points += LOG_1;
										break;
									case "LOGI_B":
										obj_UnitFormations.formation_points += LOG_2;
										break;
								}
								ds_list_delete(squad_list, 4);
								//slot5_full = false;
								open_slots += 1;
								lcheck = true;
							}
								else if (slot6_full == true) && (point_distance(mouse_x, mouse_y, x, slot_y6) < 12) {
									var slv = ds_list_find_value(squad_list, 5);
									switch slv {
										case "INF_A":
											obj_UnitFormations.formation_points += INF_1;
											break;
										case "INF_B":
											obj_UnitFormations.formation_points += INF_2;
											break;
										case "MBT_A":
											obj_UnitFormations.formation_points += MBT_1;
											break;
										case "MBT_B":
											obj_UnitFormations.formation_points += MBT_2;
											break;
										case "LAC_A":
											obj_UnitFormations.formation_points += LAC_1;
											break;
										case "LAC_B":
											obj_UnitFormations.formation_points += LAC_2;
											break;
										case "LAV_A":
											obj_UnitFormations.formation_points += LAV_1;
											break;
										case "LAV_B":
											obj_UnitFormations.formation_points += LAV_2;
											break;
										case "LOGI_A":
											obj_UnitFormations.formation_points += LOG_1;
											break;
										case "LOGI_B":
											obj_UnitFormations.formation_points += LOG_2;
											break;
									}
									ds_list_delete(squad_list, 5);
									//slot6_full = false;
									open_slots += 1;
									lcheck = true;
								}
									else {}
		}
		
	}



