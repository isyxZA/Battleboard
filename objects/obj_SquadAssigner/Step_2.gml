if lcheck == true {
	lcheck = false;
	slot1_full = false;
	slot2_full = false;
	slot3_full = false;
	slot4_full = false;
	slot5_full = false;
	slot6_full = false;
	slot1_sprite = spr_Dropdown_Empty;
	slot2_sprite = spr_Dropdown_Empty;
	slot3_sprite = spr_Dropdown_Empty;
	slot4_sprite = spr_Dropdown_Empty;
	slot5_sprite = spr_Dropdown_Empty;
	slot6_sprite = spr_Dropdown_Empty;
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
					break;
				case 1:
					slot2_full = true;
					slu = ds_list_find_value(squad_list, sli);
					switch slu {
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
					break;
				case 2:
					slot3_full = true;
					slu = ds_list_find_value(squad_list, sli);
					switch slu {
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
							slot3_sprite = spr_Logi_Dropdown;
							break;
					}
					break;
				case 3:
					slot4_full = true;
					slu = ds_list_find_value(squad_list, sli);
					switch slu {
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
					break;
				case 4:
					slot5_full = true;
					slu = ds_list_find_value(squad_list, sli);
					switch slu {
						case "INF_A":
							slot5_sprite = spr_Infantry_Dropdown;
							break;
						case "INF_B":
							slot5_sprite = spr_Infantry_Dropdown;
							break;
						case "MBT_A":
							slot5_sprite = spr_Tank_Dropdown;
							break;
						case "MBT_B":
							slot5_sprite = spr_Tank_Dropdown;
							break;
						case "LAC_A":
							slot5_sprite = spr_Engineer_Dropdown;
							break;
						case "LAC_B":
							slot5_sprite = spr_Engineer_Dropdown;
							break;
						case "LAV_A":
							slot5_sprite = spr_BTR_Dropdown;
							break;
						case "LAV_B":
							slot5_sprite = spr_BTR_Dropdown;
							break;
						case "LOGI_A":
							slot5_sprite = spr_Logi_Dropdown;
							break;
						case "LOGI_B":
							slot5_sprite = spr_Logi_Dropdown;
							break;
					}
					break;
				case 5:
					slot6_full = true;
					slu = ds_list_find_value(squad_list, sli);
					switch slu {
						case "INF_A":
							slot6_sprite = spr_Infantry_Dropdown;
							break;
						case "INF_B":
							slot6_sprite = spr_Infantry_Dropdown;
							break;
						case "MBT_A":
							slot6_sprite = spr_Tank_Dropdown;
							break;
						case "MBT_B":
							slot6_sprite = spr_Tank_Dropdown;
							break;
						case "LAC_A":
							slot6_sprite = spr_Engineer_Dropdown;
							break;
						case "LAC_B":
							slot6_sprite = spr_Engineer_Dropdown;
							break;
						case "LAV_A":
							slot6_sprite = spr_BTR_Dropdown;
							break;
						case "LAV_B":
							slot6_sprite = spr_BTR_Dropdown;
							break;
						case "LOGI_A":
							slot6_sprite = spr_Logi_Dropdown;
							break;
						case "LOGI_B":
							slot6_sprite = spr_Logi_Dropdown;
							break;
					}
					break;
			}
		}
	}
}
