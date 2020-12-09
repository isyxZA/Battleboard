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
				case "INF_A":
					slot1_sprite = spr_Infantry_Dropdown; 
					break;
				case "INF_B":
					slot1_sprite = spr_Infantry_Dropdown; 
					break;
				case "MBT_A":
					slot1_sprite = spr_Tank_Dropdown; 
					break;
				case "MBT_B":
					slot1_sprite = spr_Tank_Dropdown; 
					break;
				case "LAC_A":
					slot1_sprite = spr_Engineer_Dropdown; 
					break;
				case "LAC_B":
					slot1_sprite = spr_Engineer_Dropdown; 
					break;
				case "LAV_A":
					slot1_sprite = spr_BTR_Dropdown; 
					break;
				case "LAV_B":
					slot1_sprite = spr_BTR_Dropdown; 
					break;
				case "LOGI_A":
					slot1_sprite = spr_Logi_Dropdown; 
					break;
				case "LOGI_B":
					slot1_sprite = spr_Logi_Dropdown; 
					break;
			}
			alarm[0] = 2;
		}
			else if slot2_full == false { 
				open_slots -= 1;
				slot2_full = true;
				switch lunit {
					case "INF_A":
						slot2_sprite = spr_Infantry_Dropdown; 
						break;
					case "INF_B":
						slot2_sprite = spr_Infantry_Dropdown; 
						break;
					case "MBT_A":
						slot2_sprite = spr_Tank_Dropdown; 
						break;
					case "MBT_B":
						slot2_sprite = spr_Tank_Dropdown; 
						break;
					case "LAC_A":
						slot2_sprite = spr_Engineer_Dropdown; 
						break;
					case "LAC_B":
						slot2_sprite = spr_Engineer_Dropdown; 
						break;
					case "LAV_A":
						slot2_sprite = spr_BTR_Dropdown; 
						break;
					case "LAV_B":
						slot2_sprite = spr_BTR_Dropdown; 
						break;
					case "LOGI_A":
						slot2_sprite = spr_Logi_Dropdown; 
						break;
					case "LOGI_B":
						slot2_sprite = spr_Logi_Dropdown; 
						break;
				}
				alarm[0] = 2;
			}
			    else if slot3_full == false {
					open_slots -= 1;
					slot3_full = true;
					switch lunit {
						case "INF_A":
							slot3_sprite = spr_Infantry_Dropdown; 
							break;
						case "INF_B":
							slot3_sprite = spr_Infantry_Dropdown; 
							break;
						case "MBT_A":
							slot3_sprite = spr_Tank_Dropdown; 
							break;
						case "MBT_B":
							slot3_sprite = spr_Tank_Dropdown; 
							break;
						case "LAC_A":
							slot3_sprite = spr_Engineer_Dropdown; 
							break;
						case "LAC_B":
							slot3_sprite = spr_Engineer_Dropdown; 
							break;
						case "LAV_A":
							slot3_sprite = spr_BTR_Dropdown; 
							break;
						case "LAV_B":
							slot3_sprite = spr_BTR_Dropdown; 
							break;
						case "LOGI_A":
							slot3_sprite = spr_Logi_Dropdown; 
							break;
						case "LOGI_B":
							slot1_sprite = spr_Logi_Dropdown; 
							break;
					}
					alarm[0] = 2;
				} 
			        else if slot4_full == false { 
						open_slots -= 1;
						slot4_full = true;
						switch lunit {
							case "INF_A":
								slot4_sprite = spr_Infantry_Dropdown; 
								break;
							case "INF_B":
								slot4_sprite = spr_Infantry_Dropdown; 
								break;
							case "MBT_A":
								slot4_sprite = spr_Tank_Dropdown; 
								break;
							case "MBT_B":
								slot4_sprite = spr_Tank_Dropdown; 
								break;
							case "LAC_A":
								slot4_sprite = spr_Engineer_Dropdown; 
								break;
							case "LAC_B":
								slot4_sprite = spr_Engineer_Dropdown; 
								break;
							case "LAV_A":
								slot4_sprite = spr_BTR_Dropdown; 
								break;
							case "LAV_B":
								slot4_sprite = spr_BTR_Dropdown; 
								break;
							case "LOGI_A":
								slot4_sprite = spr_Logi_Dropdown; 
								break;
							case "LOGI_B":
								slot4_sprite = spr_Logi_Dropdown; 
								break;
						}
					}
						else {}
			}
