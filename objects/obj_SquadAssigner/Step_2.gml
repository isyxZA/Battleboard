if lcheck == true {
	lcheck = false;
	slot1_full = false;
	slot2_full = false;
	slot3_full = false;
	slot4_full = false;
	slot5_full = false;
	slot6_full = false;
	if !ds_list_empty(squad_list) {
		var sli;
		var slu;
		var sll = ds_list_size(squad_list);
		open_slots = (6-sll);
		for(sli=0; sli<sll; sli+=1) {
			switch sli {
				case 0:
					slot1_full = true;
					slu = ds_list_find_value(squad_list, sli);
					switch slu {
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
					break;
				case 1:
					slot2_full = true;
					slu = ds_list_find_value(squad_list, sli);
					switch slu {
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
					break;
				case 2:
					slot3_full = true;
					slu = ds_list_find_value(squad_list, sli);
					switch slu {
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
					break;
				case 3:
					slot4_full = true;
					slu = ds_list_find_value(squad_list, sli);
					switch slu {
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
					break;
				case 4:
					slot5_full = true;
					slu = ds_list_find_value(squad_list, sli);
					switch slu {
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
					break;
				case 5:
					slot6_full = true;
					slu = ds_list_find_value(squad_list, sli);
					switch slu {
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
					break;
			}
		}
	}
}
