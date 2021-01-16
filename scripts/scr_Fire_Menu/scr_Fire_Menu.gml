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
		var uc = ds_list_size(tabs);
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
				                shoot_amount = infa_rfl_amount;
				                ammo_count   = infa_rfl_ammo;
				                break;
				            case 1:
				                shoot_amount = infa_rpg_amount;
				                ammo_count   = infa_rpg_ammo;
				                break;
				            case 2:
				                shoot_amount = infa_flr_amount;
				                ammo_count   = infa_flr_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				                case 0:
				                    if infa_rfl_ammo <= 0 { c1 = c_red; }
				                        else { c1 = c_white; }
				                    break;
				                case 1:
				                    if infa_rpg_ammo <= 0 { c1 = c_red; }
				                        else { c1 = c_white; }
				                    break;
				                case 2:
				                    if infa_flr_ammo <= 0 { c1 = c_red; }
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
				                shoot_amount = infb_rfl_amount;
				                ammo_count   = infb_rfl_ammo;
				                break;
				            case 1:
				                shoot_amount = infb_rpg_amount;
				                ammo_count   = infb_rpg_ammo;
				                break;
				            case 2:
				                shoot_amount = infb_flr_amount;
				                ammo_count   = infb_flr_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				                case 0:
				                    if infb_rfl_ammo <= 0 { c1 = c_red; }
				                        else { c1 = c_white; }
				                    break;
				                case 1:
				                    if infb_rpg_ammo <= 0 { c1 = c_red; }
				                        else { c1 = c_white; }
				                    break;
				                case 2:
				                    if infb_flr_ammo <= 0 { c1 = c_red; }
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
				                shoot_amount = mbta_ap_amount;
				                ammo_count   = mbta_ap_ammo;
				                break;
				            case 1:
				                shoot_amount = mbta_mg_amount;
				                ammo_count   = mbta_mg_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if mbta_ap_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if mbta_mg_ammo<= 0 { c1 = c_red; }
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
				                shoot_amount = mbtb_ap_amount;
				                ammo_count   = mbtb_ap_ammo;
				                break;
				            case 1:
				                shoot_amount = mbtb_mg_amount;
				                ammo_count   = mbtb_mg_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if mbtb_ap_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if mbtb_mg_ammo<= 0 { c1 = c_red; }
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
				                shoot_amount = laca_dpt_amount;
				                ammo_count   = laca_dpt_supply;
				                break;
				            case 1:
				                shoot_amount = laca_rpr_amount;
				                ammo_count   = laca_rpr_supply;
				                break;
				            case 2:
				                shoot_amount = laca_tow_amount;
				                ammo_count   = laca_tow_supply;
				                break;
				            case 3:
				                shoot_amount = laca_mtr_amount;
				                ammo_count   = laca_mtr_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if laca_dpt_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if laca_rpr_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 2:
				                if laca_tow_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 3:
				                if laca_mtr_supply <= 0 { c1 = c_red; }
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
				                shoot_amount = lacb_tow_amount;
				                ammo_count   = lacb_tow_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if lacb_tow_ammo <= 0 { c1 = c_red; }
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
				                shoot_amount = lava_he_amount;
				                ammo_count = lava_he_ammo;
				                break;
				            case 1:
				                shoot_amount = lava_ap_amount;
				                ammo_count = lava_ap_ammo;
				                break;
							case 2:
				                shoot_amount = lava_mg_amount;
				                ammo_count = lava_mg_ammo;
				                break;
				            case 3:
				                shoot_amount = lava_at_amount;
				                ammo_count = lava_at_ammo;
				                break;
				            case 4:
				                shoot_amount = lava_sq_amount;
				                ammo_count = lava_sq_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if lava_he_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if lava_ap_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
							case 2:
				                if lava_mg_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 3:
				                if lava_at_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 4:
				                if lava_sq_ammo <= 0 { c1 = c_red; }
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
				                shoot_amount = lavb_he_amount;
				                ammo_count   = lavb_he_ammo;
				                break;
				            case 1:
				                shoot_amount = lavb_ap_amount;
				                ammo_count   = lavb_ap_ammo;
				                break;
							case 2:
				                shoot_amount = lavb_mg_amount;
				                ammo_count   = lavb_mg_ammo;
				                break;
				            case 3:
				                shoot_amount = lavb_sq_amount;
				                ammo_count   = lavb_sq_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if lavb_he_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if lavb_ap_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
							case 2:
				                if lavb_mg_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 3:
				                if lavb_sq_ammo <= 0 { c1 = c_red; }
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
				                shoot_amount = repair_mg_amount;
				                ammo_count   = repair_mg_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if repair_mg_ammo <= 0 { c1 = c_red; }
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
				                shoot_amount = towS_amount;
				                ammo_count   = tow_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if tow_ammo <= 0 { c1 = c_red; }
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
				                shoot_amount = mortarS_amount;
				                ammo_count   = mortar_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if mortar_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIA-INFA":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = infrfl_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            case 1:
				                shoot_amount = infrpg_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            case 2:
				                shoot_amount = infflr_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 2:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIA-INFB":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = infrfl_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            case 1:
				                shoot_amount = infrpg_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            case 2:
				                shoot_amount = infflr_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 2:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIA-MBTA":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = mbtap_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            case 1:
				                shoot_amount = mbtmg_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIA-MBTB":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = mbtap_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            case 1:
				                shoot_amount = mbtmg_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIA-LACA":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = lacdpt_l_amount;
				                ammo_count   = logia_bld_supply;
				                break;
				            case 1:
				                shoot_amount = lacrpr_l_amount;
				                ammo_count   = logia_bld_supply;
				                break;
				            case 2:
				                shoot_amount = lactow_l_amount;
				                ammo_count   = logia_bld_supply;
				                break;
				            case 3:
				                shoot_amount = lacmtr_l_amount;
				                ammo_count   = logia_bld_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logia_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if logia_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 2:
				                if logia_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 3:
				                if logia_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIA-LACB":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = lactow2_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIA-LAVA":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = lavhe_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            case 1:
				                shoot_amount = lavap_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
							case 2:
				                shoot_amount = lavmg_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            case 3:
				                shoot_amount = lavat_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
							case 2:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 3:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIA-LAVB":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = lavhe_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            case 1:
				                shoot_amount = lavap_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
							case 2:
				                shoot_amount = lavmg_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
							case 2:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIA-LOGIA":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = logiamo_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            case 1:
				                shoot_amount = logibld_l_amount;
				                ammo_count   = logia_bld_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if logia_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIA-LOGIB":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = logiamo_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIA-DEPOT":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = dptbld_l_amount;
				                ammo_count   = logia_bld_supply;
				                break;
				            case 1:
				                shoot_amount = dptamo_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logia_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIA-REPAIR":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = rprbld_l_amount;
				                ammo_count   = logia_bld_supply;
				                break;
				            case 1:
				                shoot_amount = rprmg_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logia_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIA-TOW":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = towamo_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIA-MORTAR":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = mtramo_l_amount;
				                ammo_count   = logia_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logia_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIA_A":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
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
					case "LOGIB-INFA":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = infrfl_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            case 1:
				                shoot_amount = infrpg_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            case 2:
				                shoot_amount = infflr_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 2:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIB-INFB":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = infrfl_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            case 1:
				                shoot_amount = infrpg_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            case 2:
				                shoot_amount = infflr_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 2:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIB-MBTA":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = mbtap_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            case 1:
				                shoot_amount = mbtmg_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIB-MBTB":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = mbtap_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            case 1:
				                shoot_amount = mbtmg_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIB-LACB":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = lactow2_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIB-LAVA":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = lavhe_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            case 1:
				                shoot_amount = lavap_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
							case 2:
				                shoot_amount = lavmg_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            case 3:
				                shoot_amount = lavat_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
							case 2:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 3:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIB-LAVB":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = lavhe_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            case 1:
				                shoot_amount = lavap_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
							case 2:
				                shoot_amount = lavmg_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
							case 2:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIB-LOGIA":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = logiamo_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIB-LOGIB":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = logiamo_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIB-DEPOT":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = dptamo_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIB-REPAIR":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = rprmg_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIB-TOW":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = towamo_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIB-MORTAR":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = mtramo_l_amount;
				                ammo_count   = logib_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logib_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIB-SQUAD":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Deploy", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = logisqd_l_amount;
				                ammo_count   = logib_sqd_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if logib_sqd_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "LOGIB_A":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
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
					case "DEPOT-INFA":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = infrfl_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            case 1:
				                shoot_amount = infrpg_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            case 2:
				                shoot_amount = infflr_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 2:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-INFB":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = infrfl_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            case 1:
				                shoot_amount = infrpg_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            case 2:
				                shoot_amount = infflr_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 2:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-MBTA":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = mbtap_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            case 1:
				                shoot_amount = mbtmg_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-MBTB":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = mbtap_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            case 1:
				                shoot_amount = mbtmg_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-LACA":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = lacdpt_d_amount;
				                ammo_count   = dpt_bld_supply;
				                break;
				            case 1:
				                shoot_amount = lacrpr_d_amount;
				                ammo_count   = dpt_bld_supply;
				                break;
				            case 2:
				                shoot_amount = lactow_d_amount;
				                ammo_count   = dpt_bld_supply;
				                break;
				            case 3:
				                shoot_amount = lacmtr_d_amount;
				                ammo_count   = dpt_bld_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if dpt_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if dpt_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 2:
				                if dpt_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 3:
				                if dpt_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-LACB":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = lactow2_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-LAVA":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = lavhe_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            case 1:
				                shoot_amount = lavap_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
							case 2:
				                shoot_amount = lavmg_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            case 3:
				                shoot_amount = lavat_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-LAVB":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = lavhe_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            case 1:
				                shoot_amount = lavap_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
							case 2:
				                shoot_amount = lavmg_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
							case 2:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-LOGIA":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = logiamo_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            case 1:
				                shoot_amount = logibld_d_amount;
				                ammo_count   = dpt_bld_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if dpt_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-LOGIB":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = logiamo_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-DEPOT":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = dptbld_d_amount;
				                ammo_count   = dpt_bld_supply;
				                break;
				            case 1:
				                shoot_amount = dptamo_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if dpt_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-REPAIR":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = rprbld_d_amount;
				                ammo_count   = dpt_bld_supply;
				                break;
				            case 1:
				                shoot_amount = rprmg_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if dpt_bld_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
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
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = towamo_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "DEPOT-MORTAR":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = mtramo_d_amount;
				                ammo_count   = dpt_amo_supply;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if dpt_amo_supply <= 0 { c1 = c_red; }
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
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
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
					case "SHIP-LOGIA":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = logiamo_s_amount;
				                ammo_count   = lc_amo_ammo;
				                break;
				            case 1:
				                shoot_amount = logibld_s_amount;
				                ammo_count   = lc_bld_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if lc_amo_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if lc_bld_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "SHIP-LOGIB":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = logiamo_s_amount;
				                ammo_count   = lc_amo_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if lc_amo_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "SHIP-DEPOT":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
						switch m {
				            case 0:
				                shoot_amount = dptbld_s_amount;
				                ammo_count   = lc_bld_ammo;
				                break;
				            case 1:
				                shoot_amount = dptamo_s_amount;
				                ammo_count   = lc_amo_ammo;
				                break;
				            default:
				                shoot_amount = 0;
				                break;
				        }
				        var c1;
				        if m == global.fire_option { 
				            switch m {
				            case 0:
				                if lc_bld_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            case 1:
				                if lc_amo_ammo <= 0 { c1 = c_red; }
				                    else { c1 = c_white; }
				                break;
				            default:
				                c1 = c_white;
				                break;
				            }
				        }
				            else { c1 = c_gray; }
						break;
					case "SHIP":
						//Draw the header text
						draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "Re-Supply", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
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
