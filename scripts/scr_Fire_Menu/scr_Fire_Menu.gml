/// @description scr_Fire_Menu(menu_list, menu_length, unit_type)
/// @param menu_list 
/// @param menu_length 
/// @param unit_type 
function scr_Fire_Menu(argument0, argument1, argument2) {

	var mlis = argument0;
	var mlen = argument1;
	var utyp = argument2;
	if surface_exists(global.menu_surf) {
		surface_set_target(global.menu_surf);
		//Draw the header background
		draw_sprite(spr_Menu_Header, 0, 0, 0);
		//Draw header arrows when more than one unit type is selected
		var uc = 0;
		if global.selected_infantry != 0 uc++;
		if global.selected_tank != 0 uc++;
		if global.selected_engineer != 0 uc++;
		if global.selected_btr != 0 uc++;
		if global.selected_logi != 0 uc++;
		if global.selected_depot != 0 uc++;
		if global.selected_repair != 0 uc++;
		if global.selected_tow != 0 uc++;
		if global.selected_mortar != 0 uc++;
		if uc > 1 {
		    var hs;
		    if global.header_highlight == false { hs = spr_Arrowhead_White; } else { 
		        hs = spr_Arrowhead_Green; 
		        obj_ACTIONMENU.display_tabinfo = true;
		    }
		    gpu_set_blendmode(bm_add);
			draw_sprite_ext(hs, 0, 0+(global.menu_width*0.2), (0+global.menu_height*0.5), 0.25, 0.25, 0, c_white, 0.2);
			draw_sprite_ext(hs, 0, 0+(global.menu_width*0.5), (0+global.menu_height*0.5), 0.5 , 0.5 , 0, c_white, 0.5); 
			draw_sprite_ext(hs, 0, 0+(global.menu_width*0.8), (0+global.menu_height*0.5), 0.75, 0.75, 0, c_white, 1  );
		    gpu_set_blendmode(bm_normal);
		}
		//Draw the header text
		draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), utyp, c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
		//Draw the unit firing menu
		var m;
		for (m=0; m<mlen; m+=1) {
		    //Draw border boxes for each menu option
		    draw_sprite(spr_Menu_Border, 0, 0, 0+(m*global.menu_height)+global.menu_height);
		    //Set ammo count to corresponding ammo type
		    if (m < mlen-2) {
				switch utyp {
					case "INFANTRY":
				        switch m {
				            case 0:
				                shoot_amount = global.rifle_amount;
				                ammo_count   = global.rifle_ammo;
				                break;
				            case 1:
				                shoot_amount = global.rpg_amount;
				                ammo_count   = global.rpg_ammo;
				                break;
				            case 2:
				                shoot_amount = global.flare_amount;
				                ammo_count   = global.flare_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				                case 0:
				                    if global.rifle_ammo <= 0 { c1 = c_red; }
				                        else { c1 = c_white; }
				                    break;
				                case 1:
				                    if global.rpg_ammo <= 0 { c1 = c_red; }
				                        else { c1 = c_white; }
				                    break;
				                case 2:
				                    if global.flare_ammo <= 0 { c1 = c_red; }
				                        else { c1 = c_white; }
				                    break;
				                default:
				                    c1 = c_white;
				                    break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "TANK":
						switch m {
				            case 0:
				                shoot_amount = global.cannon_amount;
				                ammo_count   = global.cannon_ammo;
				                break;
				            case 1:
				                shoot_amount = global.mg_tank_amount;
				                ammo_count   = global.mg_tank_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.cannon_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.mg_tank_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "ENGINEER":
						switch m {
				            case 0:
				                shoot_amount = global.depot_amount;
				                ammo_count   = global.depot_supply;
				                break;
				            case 1:
				                shoot_amount = global.repair_amount;
				                ammo_count   = global.repair_supply;
				                break;
				            case 2:
				                shoot_amount = global.tow_amount;
				                ammo_count   = global.tow_supply;
				                break;
				            case 3:
				                shoot_amount = global.mortar_amount;
				                ammo_count   = global.mortar_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.depot_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.repair_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 2:
				                if global.tow_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 3:
				                if global.mortar_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "BTR":
						switch m {
				            case 0:
				                shoot_amount = global.he_amount;
				                ammo_count = global.he_ammo;
				                break;
				            case 1:
				                shoot_amount = global.ap_amount;
				                ammo_count = global.ap_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.he_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.ap_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "REPAIR-MG":
						switch m {
				            case 0:
				                shoot_amount = global.repair_mg_amount;
				                ammo_count   = global.repair_mg_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.repair_mg_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
								break;
					case "TOW":
						switch m {
				            case 0:
				                shoot_amount = global.towS_amount;
				                ammo_count   = global.tow_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.tow_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "MORTAR":
						switch m {
				            case 0:
				                shoot_amount = global.mortarS_amount;
				                ammo_count   = global.mortar_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.mortar_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI-INF":
						switch m {
				            case 0:
				                shoot_amount = global.rifle_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            case 1:
				                shoot_amount = global.rpg_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            case 2:
				                shoot_amount = global.flare_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.ammo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.ammo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 2:
				                if global.ammo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI-MBT":
						switch m {
				            case 0:
				                shoot_amount = global.cannon_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            case 1:
				                shoot_amount = global.tankmg_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.ammo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.ammo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI-ENG":
						switch m {
				            case 0:
				                shoot_amount = global.depot_l_amount;
				                ammo_count   = global.building_supply;
				                break;
				            case 1:
				                shoot_amount = global.repair_l_amount;
				                ammo_count   = global.building_supply;
				                break;
				            case 2:
				                shoot_amount = global.tow_l_amount;
				                ammo_count   = global.building_supply;
				                break;
				            case 3:
				                shoot_amount = global.mortar_l_amount;
				                ammo_count   = global.building_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.building_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.building_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 2:
				                if global.building_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 3:
				                if global.building_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI-LAV":
						switch m {
				            case 0:
				                shoot_amount = global.he_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            case 1:
				                shoot_amount = global.ap_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.ammo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.ammo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI-LGI":
						switch m {
				            case 0:
				                shoot_amount = global.ammo_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            case 1:
				                shoot_amount = global.building_l_amount;
				                ammo_count   = global.building_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.ammo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.building_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI-DPT":
						switch m {
				            case 0:
				                shoot_amount = global.depotParts_l_amount;
				                ammo_count   = global.building_supply;
				                break;
				            case 1:
				                shoot_amount = global.depotAmmo_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.building_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.ammo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI-RPR":
						switch m {
				            case 0:
				                shoot_amount = global.repairS_l_amount;
				                ammo_count   = global.building_supply;
				                break;
				            case 1:
				                shoot_amount = global.repairmg_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.building_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.ammo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI-TOW":
						switch m {
				            case 0:
				                shoot_amount = global.towS_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.ammo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI-MTR":
						switch m {
				            case 0:
				                shoot_amount = global.mortarS_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.ammo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI":
						switch m {
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-INF":
						switch m {
				            case 0:
				                shoot_amount = global.rifle_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            case 1:
				                shoot_amount = global.rpg_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            case 2:
				                shoot_amount = global.flare_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.ammunition_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.ammunition_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 2:
				                if global.ammunition_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-MBT":
						switch m {
				            case 0:
				                shoot_amount = global.cannon_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            case 1:
				                shoot_amount = global.tankmg_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.ammunition_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.ammunition_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-ENG":
						switch m {
				            case 0:
				                shoot_amount = global.depot_d_amount;
				                ammo_count   = global.parts_ammo;
				                break;
				            case 1:
				                shoot_amount = global.repair_d_amount;
				                ammo_count   = global.parts_ammo;
				                break;
				            case 2:
				                shoot_amount = global.tow_d_amount;
				                ammo_count   = global.parts_ammo;
				                break;
				            case 3:
				                shoot_amount = global.mortar_d_amount;
				                ammo_count   = global.parts_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.parts_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.parts_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 2:
				                if global.parts_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 3:
				                if global.parts_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-LAV":
						switch m {
				            case 0:
				                shoot_amount = global.he_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            case 1:
				                shoot_amount = global.ap_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.ammunition_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.ammunition_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-LGI":
						switch m {
				            case 0:
				                shoot_amount = global.ammo_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            case 1:
				                shoot_amount = global.building_d_amount;
				                ammo_count   = global.parts_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.ammunition_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.parts_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-DPT":
						switch m {
				            case 0:
				                shoot_amount = global.depotParts_d_amount;
				                ammo_count   = global.parts_ammo;
				                break;
				            case 1:
				                shoot_amount = global.depotAmmo_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.parts_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.ammunition_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-RPR":
						switch m {
				            case 0:
				                shoot_amount = global.repairS_d_amount;
				                ammo_count   = global.parts_ammo;
				                break;
				            case 1:
				                shoot_amount = global.repairmg_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.parts_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.ammunition_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-TOW":
						switch m {
				            case 0:
				                shoot_amount = global.towS_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.ammunition_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-MTR":
						switch m {
				            case 0:
				                shoot_amount = global.mortarS_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.ammunition_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT":
						switch m {
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "SHIP-LGI":
						switch m {
				            case 0:
				                shoot_amount = global.ammo_s_amount;
				                ammo_count   = global.lc_ammunition_ammo;
				                break;
				            case 1:
				                shoot_amount = global.building_s_amount;
				                ammo_count   = global.lc_parts_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.lc_ammunition_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.lc_parts_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "SHIP-DPT":
						switch m {
				            case 0:
				                shoot_amount = global.depotParts_s_amount;
				                ammo_count   = global.lc_parts_ammo;
				                break;
				            case 1:
				                shoot_amount = global.depotAmmo_s_amount;
				                ammo_count   = global.lc_ammunition_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.lc_parts_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.lc_ammunition_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "SUPPLY SHIP":
						switch m {
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            default:
				                c1 = c_white;
				                break
				            }
				        }
				            else { c1 = c_gray; }
						break;		
				}
		        //Draw the text from the corresponding fire_menu option and ammo count 
				draw_text_colour_shadow(0+(global.menu_width*0.5), (0+(global.menu_height*0.5))+(m*global.menu_height)+global.menu_height, mlis[m] + " " + "x" + " " + string(shoot_amount), c1, c1, c1, c1, 1, 300, c_black, 0.2);
		    }
		        else if (m == mlen-2) {
		            var c2;
		                if m == global.fire_option { c2 = c_white; } else { c2 = c_gray; }
		                //RE-TARGET
						draw_text_colour_shadow(0+(global.menu_width*0.5), (0+(global.menu_height*0.5))+(m*global.menu_height)+global.menu_height, mlis[m], c2, c2, c2, c2, 1, 300, c_black, 0.2);
		        }
		            else {
		                var c3;
		                if m == global.fire_option { c3 = c_red; } else { c3 = c_gray; }
		                //CANCEL
						draw_text_colour_shadow(0+(global.menu_width*0.5), (0+(global.menu_height*0.5))+(m*global.menu_height)+global.menu_height, mlis[m], c3, c3, c3, c3, 1, 300, c_black, 0.2);
		            }
		    if m == global.fire_option { draw_sprite(spr_Menu_Glass, 0, 0, 0 + (m*global.v_spacing)+global.menu_height); }
		}
		surface_reset_target();
		draw_surface_ext(global.menu_surf, global.menu_x, global.menu_y, (1*global.menu_ratio)*menu_scl, (1*global.menu_ratio)*menu_scl, txt_rot, c_white, menu_alpha);
	}
		else {
			global.menu_surf = surface_create(global.menu_width, global.menu_height*(mlen+1));
	        surface_set_target(global.menu_surf);
	        draw_clear_alpha(c_black, 1);
	        surface_reset_target();
		}



}
