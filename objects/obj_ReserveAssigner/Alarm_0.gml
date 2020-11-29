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
				open_slots -= 1;
				slot2_full = true;
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
					open_slots -= 1;
					slot3_full = true;
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
						open_slots -= 1;
						slot4_full = true;
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
					}
						else {}
			}
