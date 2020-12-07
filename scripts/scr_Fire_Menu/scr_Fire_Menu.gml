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
		var cw = gpu_get_colorwriteenable();
		cw[3] = false;
		gpu_set_colorwriteenable(cw);
		//Draw the header background
		draw_sprite(spr_Menu_Header, 0, 0, 0);
		//Draw header arrows when more than one unit type is selected
		var uc = 0;
		if global.selected_infa   != 0 uc++;
		if global.selected_infb   != 0 uc++;
		if global.selected_mbta   != 0 uc++;
		if global.selected_mbtb   != 0 uc++;
		if global.selected_laca   != 0 uc++;
		if global.selected_lacb   != 0 uc++;
		if global.selected_lava   != 0 uc++;
		if global.selected_lavb   != 0 uc++;
		if global.selected_logia  != 0 uc++;
		if global.selected_logib  != 0 uc++;
		if global.selected_depot  != 0 uc++;
		if global.selected_repair != 0 uc++;
		if global.selected_tow    != 0 uc++;
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
		//if utyp == "LAV_A" { draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "LAV", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2); }
			//else { draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), utyp, c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2); }
		//Draw the unit firing menu
		var m;
		for (m=0; m<mlen; m+=1) {
		    //Draw border boxes for each menu option
		    draw_sprite(spr_Menu_Border, 0, 0, 0+(m*global.menu_height)+global.menu_height);
		    //Set ammo count to corresponding ammo type
		    if (m < mlen-2) {
				switch utyp {
					case "INF_A":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Rifleman", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
				        switch m {
				            case 0:
				                shoot_amount = global.inf_rfl_amount;
				                ammo_count   = global.inf_rfl_ammo;
				                break;
				            case 1:
				                shoot_amount = global.inf_rpg_amount;
				                ammo_count   = global.inf_rpg_ammo;
				                break;
				            case 2:
				                shoot_amount = global.inf_flr_amount;
				                ammo_count   = global.inf_flr_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				                case 0:
				                    if global.inf_rfl_ammo <= 0 { c1 = c_red; }
				                        else { c1 = c_white; }
				                    break;
				                case 1:
				                    if global.inf_rpg_ammo <= 0 { c1 = c_red; }
				                        else { c1 = c_white; }
				                    break;
				                case 2:
				                    if global.inf_flr_ammo <= 0 { c1 = c_red; }
				                        else { c1 = c_white; }
				                    break;
				                default:
				                    c1 = c_white;
				                    break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "INF_B":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Recon", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
				        switch m {
				            case 0:
				                shoot_amount = global.inf_rfl_amount;
				                ammo_count   = global.inf_rfl_ammo;
				                break;
				            case 1:
				                shoot_amount = global.inf_rpg_amount;
				                ammo_count   = global.inf_rpg_ammo;
				                break;
				            case 2:
				                shoot_amount = global.inf_flr_amount;
				                ammo_count   = global.inf_flr_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				                case 0:
				                    if global.inf_rfl_ammo <= 0 { c1 = c_red; }
				                        else { c1 = c_white; }
				                    break;
				                case 1:
				                    if global.inf_rpg_ammo <= 0 { c1 = c_red; }
				                        else { c1 = c_white; }
				                    break;
				                case 2:
				                    if global.inf_flr_ammo <= 0 { c1 = c_red; }
				                        else { c1 = c_white; }
				                    break;
				                default:
				                    c1 = c_white;
				                    break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "MBT_A":
						//Draw the header text
						if PLAYER.faction == "US" {
							draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "M1A2 MBT", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						}
							else if PLAYER.faction == "RU" {
								draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "T72 MBT", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
							}
						switch m {
				            case 0:
				                shoot_amount = global.mbt_ap_amount;
				                ammo_count   = global.mbt_ap_ammo;
				                break;
				            case 1:
				                shoot_amount = global.mbt_mg_amount;
				                ammo_count   = global.mbt_mg_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.mbt_ap_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.mbt_mg_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "MBT_B":
						//Draw the header text
						if PLAYER.faction == "US" {
							draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "M1A1 MBT", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						}
							else if PLAYER.faction == "RU" {
								draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "T62 MBT", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
							}
						switch m {
				            case 0:
				                shoot_amount = global.mbt_ap_amount;
				                ammo_count   = global.mbt_ap_ammo;
				                break;
				            case 1:
				                shoot_amount = global.mbt_mg_amount;
				                ammo_count   = global.mbt_mg_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.mbt_ap_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.mbt_mg_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LAC_A":
						//Draw the header text
						if PLAYER.faction == "US" {
							draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "M1097 Cargo", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						}
							else if PLAYER.faction == "RU" {
								draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Tigr Cargo", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
							}
						switch m {
				            case 0:
				                shoot_amount = global.lac_dpt_amount;
				                ammo_count   = global.lac_dpt_supply;
				                break;
				            case 1:
				                shoot_amount = global.lac_rpr_amount;
				                ammo_count   = global.lac_rpr_supply;
				                break;
				            case 2:
				                shoot_amount = global.lac_tow_amount;
				                ammo_count   = global.lac_tow_supply;
				                break;
				            case 3:
				                shoot_amount = global.lac_mtr_amount;
				                ammo_count   = global.lac_mtr_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.lac_dpt_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.lac_rpr_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 2:
				                if global.lac_tow_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 3:
				                if global.lac_mtr_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LAC_B":
						//Draw the header text
						if PLAYER.faction == "US" {
							draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "M1097 TOW", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						}
							else if PLAYER.faction == "RU" {
								draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Tigr TOW", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
							}
						switch m {
				            case 0:
				                shoot_amount = global.lac_tow2_amount;
				                ammo_count   = global.lac_tow2_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.lac_tow2_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LAV_A":
						//Draw the header text
						if PLAYER.faction == "US" {
							draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Bradley IFV", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						}
							else if PLAYER.faction == "RU" {
								draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "BMP3 IFV", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
							}
						switch m {
				            case 0:
				                shoot_amount = global.lav_he_amount;
				                ammo_count = global.lav_he_ammo;
				                break;
				            case 1:
				                shoot_amount = global.lav_ap_amount;
				                ammo_count = global.lav_ap_ammo;
				                break;
							case 2:
				                shoot_amount = global.lav_mg_amount;
				                ammo_count = global.lav_mg_ammo;
				                break;
				            case 3:
				                shoot_amount = global.lav_at_amount;
				                ammo_count = global.lav_at_ammo;
				                break;
				            case 4:
				                shoot_amount = global.lav_sq_amount;
				                ammo_count = global.lav_sq_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.lav_he_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.lav_ap_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
							case 2:
				                if global.lav_mg_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 3:
				                if global.lav_at_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 4:
				                if global.lav_sq_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LAV_B":
						//Draw the header text
						if PLAYER.faction == "US" {
							draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Stryker APC", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						}
							else if PLAYER.faction == "RU" {
								draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "BTR-80 APC", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
							}
						switch m {
				            case 0:
				                shoot_amount = global.lav_he_amount;
				                ammo_count = global.lav_he_ammo;
				                break;
				            case 1:
				                shoot_amount = global.lav_ap_amount;
				                ammo_count = global.lav_ap_ammo;
				                break;
							case 2:
				                shoot_amount = global.lav_mg_amount;
				                ammo_count = global.lav_mg_ammo;
				                break;
				            case 3:
				                shoot_amount = global.lav_sq_amount;
				                ammo_count = global.lav_sq_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.lav_he_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.lav_ap_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
							case 2:
				                if global.lav_mg_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 3:
				                if global.lav_sq_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "REPAIR-MG":
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Heavy MG", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = global.repair_mg_amount;
				                ammo_count   = global.repair_mg_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
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
				                break;
				            }
				        }
				            else { c1 = c_gray; }
								break;
					case "TOW":
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "TOW", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = global.towS_amount;
				                ammo_count   = global.tow_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
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
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "MORTAR":
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Mortar", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = global.mortarS_amount;
				                ammo_count   = global.mortar_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
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
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI-INF":
						switch m {
				            case 0:
				                shoot_amount = global.infrfl_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            case 1:
				                shoot_amount = global.infrpg_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            case 2:
				                shoot_amount = global.infflr_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.logi_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.logi_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 2:
				                if global.logi_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI-MBT":
						switch m {
				            case 0:
				                shoot_amount = global.mbtap_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            case 1:
				                shoot_amount = global.mbtmg_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.logi_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.logi_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI-ENG":
						switch m {
				            case 0:
				                shoot_amount = global.lacdpt_l_amount;
				                ammo_count   = global.logi_bld_supply;
				                break;
				            case 1:
				                shoot_amount = global.lacrpr_l_amount;
				                ammo_count   = global.logi_bld_supply;
				                break;
				            case 2:
				                shoot_amount = global.lactow_l_amount;
				                ammo_count   = global.logi_bld_supply;
				                break;
				            case 3:
				                shoot_amount = global.lacmtr_l_amount;
				                ammo_count   = global.logi_bld_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.logi_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.logi_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 2:
				                if global.logi_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 3:
				                if global.logi_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI-LAV":
						switch m {
				            case 0:
				                shoot_amount = global.lavhe_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            case 1:
				                shoot_amount = global.lavap_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.logi_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.logi_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI-LGI":
						switch m {
				            case 0:
				                shoot_amount = global.logiamo_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            case 1:
				                shoot_amount = global.logibld_l_amount;
				                ammo_count   = global.logi_bld_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.logi_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.logi_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI-DPT":
						switch m {
				            case 0:
				                shoot_amount = global.dptbld_l_amount;
				                ammo_count   = global.logi_bld_supply;
				                break;
				            case 1:
				                shoot_amount = global.dptamo_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.logi_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.logi_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI-RPR":
						switch m {
				            case 0:
				                shoot_amount = global.rprbld_l_amount;
				                ammo_count   = global.logi_bld_supply;
				                break;
				            case 1:
				                shoot_amount = global.rprmg_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.logi_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if global.logi_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI-TOW":
						switch m {
				            case 0:
				                shoot_amount = global.towamo_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.logi_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI-MTR":
						switch m {
				            case 0:
				                shoot_amount = global.mtramo_l_amount;
				                ammo_count   = global.ammo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if global.logi_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGI_A":
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
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-INF":
						switch m {
				            case 0:
				                shoot_amount = global.infrfl_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            case 1:
				                shoot_amount = global.infrpg_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            case 2:
				                shoot_amount = global.infflr_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
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
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-MBT":
						switch m {
				            case 0:
				                shoot_amount = global.mbtap_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            case 1:
				                shoot_amount = global.mbtmg_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
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
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-ENG":
						switch m {
				            case 0:
				                shoot_amount = global.lacdpt_d_amount;
				                ammo_count   = global.parts_ammo;
				                break;
				            case 1:
				                shoot_amount = global.lacrpr_d_amount;
				                ammo_count   = global.parts_ammo;
				                break;
				            case 2:
				                shoot_amount = global.lactow_d_amount;
				                ammo_count   = global.parts_ammo;
				                break;
				            case 3:
				                shoot_amount = global.lacmtr_d_amount;
				                ammo_count   = global.parts_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
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
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-LAV":
						switch m {
				            case 0:
				                shoot_amount = global.lavhe_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            case 1:
				                shoot_amount = global.lavap_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
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
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-LGI":
						switch m {
				            case 0:
				                shoot_amount = global.logiamo_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            case 1:
				                shoot_amount = global.logibld_d_amount;
				                ammo_count   = global.parts_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
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
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-DPT":
						switch m {
				            case 0:
				                shoot_amount = global.dptbld_d_amount;
				                ammo_count   = global.parts_ammo;
				                break;
				            case 1:
				                shoot_amount = global.dptamo_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
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
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-RPR":
						switch m {
				            case 0:
				                shoot_amount = global.rprbld_d_amount;
				                ammo_count   = global.parts_ammo;
				                break;
				            case 1:
				                shoot_amount = global.rprmg_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
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
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-TOW":
						switch m {
				            case 0:
				                shoot_amount = global.towamo_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
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
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-MTR":
						switch m {
				            case 0:
				                shoot_amount = global.mtramo_d_amount;
				                ammo_count   = global.ammunition_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
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
				                break;
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
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "SHIP-LGI":
						switch m {
				            case 0:
				                shoot_amount = global.logiamo_s_amount;
				                ammo_count   = global.lc_ammunition_ammo;
				                break;
				            case 1:
				                shoot_amount = global.logibld_s_amount;
				                ammo_count   = global.lc_parts_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
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
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "SHIP-DPT":
						switch m {
				            case 0:
				                shoot_amount = global.dptbld_s_amount;
				                ammo_count   = global.lc_parts_ammo;
				                break;
				            case 1:
				                shoot_amount = global.dptamo_s_amount;
				                ammo_count   = global.lc_ammunition_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
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
				                break;
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
				                break;
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
		cw[3] = true;
		gpu_set_colorwriteenable(cw);
	}
		else {
			global.menu_surf = surface_create(global.menu_width, global.menu_height*(mlen+1));
	        surface_set_target(global.menu_surf);
	        draw_clear_alpha(c_black, 1);
	        surface_reset_target();
		}


}
