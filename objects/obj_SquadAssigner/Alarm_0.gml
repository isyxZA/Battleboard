lpos ++;
var lunit = ds_list_find_value(squad_list, lpos);

if is_undefined(lunit) {
	exit;
}
	else {
		if slot1_full == false { 
			slot1_full = true;
			open_slots -= 1;
			switch lunit {
				case "INFANTRY":
					slot1_sprite = spr_Infantry_Dropdown; 
					break;
				case "TANK":
					slot1_sprite = spr_Tank_Dropdown; 
					break;
				case "ENGINEER":
					slot1_sprite = spr_Engineer_Dropdown; 
					break;
				case "BTR":
					slot1_sprite = spr_BTR_Dropdown; 
					break;
				case "LOGI":
					slot1_sprite = spr_Logi_Dropdown; 
					break;
			}
			alarm[0] = 2;
		}
			else if slot2_full == false { 
				slot2_full = true;
				open_slots -= 1;
				switch lunit {
					case "INFANTRY":
						slot2_sprite = spr_Infantry_Dropdown; 
						break;
					case "TANK":
						slot2_sprite = spr_Tank_Dropdown; 
						break;
					case "ENGINEER":
						slot2_sprite = spr_Engineer_Dropdown; 
						break;
					case "BTR":
						slot2_sprite = spr_BTR_Dropdown; 
						break;
					case "LOGI":
						slot2_sprite = spr_Logi_Dropdown; 
						break;
				}
				alarm[0] = 2;
			}
			    else if slot3_full == false { 
					slot3_full = true;
					open_slots -= 1;
					switch lunit {
						case "INFANTRY":
							slot3_sprite = spr_Infantry_Dropdown; 
							break;
						case "TANK":
							slot3_sprite = spr_Tank_Dropdown; 
							break;
						case "ENGINEER":
							slot3_sprite = spr_Engineer_Dropdown; 
							break;
						case "BTR":
							slot3_sprite = spr_BTR_Dropdown; 
							break;
						case "LOGI":
							slot3_sprite = spr_Logi_Dropdown; 
							break;
					}
					alarm[0] = 2;
				} 
			        else if slot4_full == false { 
						slot4_full = true;
						open_slots -= 1;
						switch lunit {
							case "INFANTRY":
								slot4_sprite = spr_Infantry_Dropdown; 
								break;
							case "TANK":
								slot4_sprite = spr_Tank_Dropdown; 
								break;
							case "ENGINEER":
								slot4_sprite = spr_Engineer_Dropdown; 
								break;
							case "BTR":
								slot4_sprite = spr_BTR_Dropdown; 
								break;
							case "LOGI":
								slot4_sprite = spr_Logi_Dropdown; 
								break;
						}
						alarm[0] = 2;
					} 
			            else if slot5_full == false { 
							slot5_full = true; 
							open_slots -= 1;
							switch lunit {
								case "INFANTRY":
								slot5_sprite = spr_Infantry_Dropdown; 
								break;
							case "TANK":
								slot5_sprite = spr_Tank_Dropdown; 
								break;
							case "ENGINEER":
								slot5_sprite = spr_Engineer_Dropdown; 
								break;
							case "BTR":
								slot5_sprite = spr_BTR_Dropdown; 
								break;
							case "LOGI":
								slot5_sprite = spr_Logi_Dropdown; 
								break;
							}
							alarm[0] = 2;
						} 
			                else if slot6_full == false { 
								slot6_full = true; 
								open_slots -= 1;
								switch lunit {
									case "INFANTRY":
										slot6_sprite = spr_Infantry_Dropdown; 
										break;
									case "TANK":
										slot6_sprite = spr_Tank_Dropdown; 
										break;
									case "ENGINEER":
										slot6_sprite = spr_Engineer_Dropdown; 
										break;
									case "BTR":
										slot6_sprite = spr_BTR_Dropdown; 
										break;
									case "LOGI":
										slot6_sprite = spr_Logi_Dropdown; 
										break;
								}
							}
	}
