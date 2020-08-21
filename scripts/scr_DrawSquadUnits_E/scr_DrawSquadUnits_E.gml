/// @description scr_DrawSquadUnits_E(squad);
/// @param squad
function scr_DrawSquadUnits_E(argument0) {

	var squad = argument0;

	//Determine how many units in squad are visible or have been spotted
	var i;
	var n = 0;
	for (i = 0; i<ds_list_size(squad); i += 1) {
	    var unit = ds_list_find_value(squad, i);
		if unit.is_visible == true || unit.is_spotted == true {
			n+=1;
		}
	}

	if n > 0 {
		//Find middle of visible units in squad
		var lmid = n/2;
		//Determine if size is even or odd and adjust draw position accordingly
		var adj;
		if ((n mod 2) == 0) { adj = s_space*0.5; } else { adj = 0; }
		var ii;
		for (ii = 0; ii<ds_list_size(squad); ii += 1) {
		    var unit = ds_list_find_value(squad, ii);
			if unit.is_visible == true || unit.is_spotted == true {
			    if unit.unit_health >= 75 { icon_colour = c_green; }
			        else if unit.unit_health >= 25 { icon_colour = c_orange; }
			            else { icon_colour = c_red; }
			    switch unit.unit_type {
			        case "E_INFANTRY":
			            draw_sprite_ext(spr_Infantry_Dropdown, 0, (ui_midx+adj)+((ii-lmid)*s_space), ty_2, 1, 1, 0, icon_colour, 1);
			            break;
			        case "E_TANK":
			            draw_sprite_ext(spr_Tank_Dropdown, 0, (ui_midx+adj)+((ii-lmid)*s_space), ty_2, 1, 1, 0, icon_colour, 1);
			            break;
			        case "E_ENGINEER":
			            draw_sprite_ext(spr_Engineer_Dropdown, 0, (ui_midx+adj)+((ii-lmid)*s_space), ty_2, 1, 1, 0, icon_colour, 1);
			            break;
			        case "E_BTR":
			            draw_sprite_ext(spr_BTR_Dropdown, 0, (ui_midx+adj)+((ii-lmid)*s_space), ty_2, 1, 1, 0, icon_colour, 1);
			            break;
			        case "E_LOGI":
			            draw_sprite_ext(spr_Logi_Dropdown, 0, (ui_midx+adj)+((ii-lmid)*s_space), ty_2, 1, 1, 0, icon_colour, 1);
			            break;
			    }
			}
		}
	}



}
