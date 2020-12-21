/// @description scr_DrawSquadUnits(squad);
/// @param squad
function scr_DrawSquadUnits(argument0) {

	var squad = argument0;

	//Find middle of list
	var lmid = floor(ds_list_size(squad)/2);
	//Determine if list size is even or odd and adjust draw position accordingly
	var adj;
	if ((ds_list_size(squad) mod 2) == 0) { adj = s_space*0.5; } else { adj = 0; }
	//Loop thru squad list and draw unit icons
	var i;
	for (i = 0; i<ds_list_size(squad); i += 1) {
	    var unit = ds_list_find_value(squad, i);
	    if unit.unit_health >= 75 { icon_colour = c_green; }
	        else if unit.unit_health >= 25 { icon_colour = c_orange; }
	            else { icon_colour = c_red; }
	    switch unit.unit_type {
	        case "INF_A":
	            draw_sprite_ext(spr_INFA_Dropdown, 0, (ui_midx+adj)+((i-lmid)*s_space), ty_2, 1, 1, 0, icon_colour, 1);
	            break;
			case "INF_B":
	            draw_sprite_ext(spr_INFB_Dropdown, 0, (ui_midx+adj)+((i-lmid)*s_space), ty_2, 1, 1, 0, icon_colour, 1);
	            break;
	        case "MBT_A":
	            draw_sprite_ext(spr_MBTA_Dropdown, 0, (ui_midx+adj)+((i-lmid)*s_space), ty_2, 1, 1, 0, icon_colour, 1);
	            break;
			case "MBT_B":
	            draw_sprite_ext(spr_MBTB_Dropdown, 0, (ui_midx+adj)+((i-lmid)*s_space), ty_2, 1, 1, 0, icon_colour, 1);
	            break;
	        case "LAC_A":
	            draw_sprite_ext(spr_LACA_Dropdown, 0, (ui_midx+adj)+((i-lmid)*s_space), ty_2, 1, 1, 0, icon_colour, 1);
	            break;
			case "LAC_B":
	            draw_sprite_ext(spr_LACB_Dropdown, 0, (ui_midx+adj)+((i-lmid)*s_space), ty_2, 1, 1, 0, icon_colour, 1);
	            break;
	        case "LAV_A":
	            draw_sprite_ext(spr_LAVA_Dropdown, 0, (ui_midx+adj)+((i-lmid)*s_space), ty_2, 1, 1, 0, icon_colour, 1);
	            break;
			case "LAV_B":
	            draw_sprite_ext(spr_LAVB_Dropdown, 0, (ui_midx+adj)+((i-lmid)*s_space), ty_2, 1, 1, 0, icon_colour, 1);
	            break;
	        case "LOGI_A":
	            draw_sprite_ext(spr_LOGIA_Dropdown, 0, (ui_midx+adj)+((i-lmid)*s_space), ty_2, 1, 1, 0, icon_colour, 1);
	            break;
			case "LOGI_B":
	            draw_sprite_ext(spr_LOGIB_Dropdown, 0, (ui_midx+adj)+((i-lmid)*s_space), ty_2, 1, 1, 0, icon_colour, 1);
	            break;
			case "DEPOT":
	            draw_sprite_ext(spr_Depot_Dropdown, 0, (ui_midx+adj)+((i-lmid)*s_space), ty_2, 1.2, 1.2, 0, icon_colour, 1);
	            break;
			case "REPAIR":
	            draw_sprite_ext(spr_Repair_Dropdown, 0, (ui_midx+adj)+((i-lmid)*s_space), ty_2, 1.2, 1.2, 0, icon_colour, 1);
	            break;
			case "TOW":
	            draw_sprite_ext(spr_TOW_Dropdown, 0, (ui_midx+adj)+((i-lmid)*s_space), ty_2, 1.2, 1.2, 0, icon_colour, 1);
	            break;
			case "MORTAR":
	            draw_sprite_ext(spr_Mortar_Dropdown, 0, (ui_midx+adj)+((i-lmid)*s_space), ty_2, 1.2, 1.2, 0, icon_colour, 1);
	            break;
	    }
	}

}
