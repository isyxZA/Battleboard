/// @description Draw unit stats
function scr_DrawUnitStats() {
	draw_set_font(fnt_10);
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	var clr1 = make_colour_rgb(255,255,255);
	var xx;
	var yy;
	if nav_confirmed == true {
	    xx = x_final;
	    yy = y_final;
	}
	    else {
	        xx = x;
	        yy = y;
	    }

	if p_one == true {
		switch unit_type {
		    case "INF_A":
		        if is_manning == false {
		            if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		                else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
					switch p_faction {
						case "US":
							draw_text_colour(xx, yy-38, "Riflemen", clr1, clr1, clr1, clr1, 1);
							break;
						case "RU":
							draw_text_colour(xx, yy-38, "Riflemen", clr1, clr1, clr1, clr1, 1);
							break;
					}
		            draw_set_halign(fa_right);
		            //Health
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Health,          0, xx-16, yy-20, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-22, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		            //AP
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-9, yy, "AP",                  c_white, c_white, c_white, c_white, 1);
		            draw_text_colour(xx-29, yy, string(action_points), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_left);
		            //Rifle Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Rifle_Icon,      0, xx+14, yy-16, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+24, yy-18, string(rifle_ammo), c_white, c_white, c_white, c_white, 1);
		            //RPG Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_RPG_Icon,        0, xx+14, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+24, yy, string(rpg_ammo), c_white, c_white, c_white, c_white, 1);
		            //Flare Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Flare_Icon,      0, xx+14, yy+18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+24, yy+18, string(flare_ammo), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_center);
		        }
		        break;
			case "INF_B":
		        if is_manning == false {
		            if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		                else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
					switch p_faction {
						case "US":
							draw_text_colour(xx, yy-38, "Recon", clr1, clr1, clr1, clr1, 1);
							break;
						case "RU":
							draw_text_colour(xx, yy-38, "Recon", clr1, clr1, clr1, clr1, 1);
							break;
					}
		            draw_set_halign(fa_right);
		            //Health
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Health,          0, xx-16, yy-20, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-22, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		            //AP
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-9, yy, "AP",                   c_white, c_white, c_white, c_white, 1);
		            draw_text_colour(xx-29, yy, string(action_points), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_left);
		            //Rifle Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Rifle_Icon,      0, xx+14, yy-16, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+24, yy-18, string(rifle_ammo), c_white, c_white, c_white, c_white, 1);
		            //RPG Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_RPG_Icon,        0, xx+14, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+24, yy, string(rpg_ammo), c_white, c_white, c_white, c_white, 1);
		            //Flare Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Flare_Icon,      0, xx+14, yy+18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+24, yy+18, string(flare_ammo), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_center);
		        }
		        break;
		    case "MBT_A":
		        if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		                else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
				switch p_faction {
					case "US":
						draw_text_colour(xx, yy-38, "M1A2 MBT", clr1, clr1, clr1, clr1, 1);
						break;
					case "RU":
						draw_text_colour(xx, yy-38, "T-72 MBT", clr1, clr1, clr1, clr1, 1);
						break;
				}
		        if is_manning == false {
		            draw_set_halign(fa_right);
		            //Health
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Health,          0, xx-16, yy-20, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-22, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		            //AP
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-9, yy, "AP",                   c_white, c_white, c_white, c_white, 1);
		            draw_text_colour(xx-29, yy, string(action_points), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_left);
		            //Cannon Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Cannon_Icon,     0, xx+15, yy-18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+25, yy-18, string(cannon_ammo), c_white, c_white, c_white, c_white, 1);
		            //MG Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_MG_Icon,         0, xx+15, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+25, yy, string(mg_ammo), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_center);
		        }
		            else if is_manning == true {
		                //Health
		                draw_sprite_ext(spr_Stat_Background, 0, x, y-18, 1, 1, 0, c_white, 1);
		                draw_sprite_ext(spr_Health, 0, x-14, y-20, 1, 1, 0, c_white, 1);
		                draw_text_colour(x+6, y-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		                draw_sprite_ext(spr_Stat_Background, 0, x-28, y, 1, 1, 0, c_white, 1);
		                draw_text_colour(x-28, y, string(action_points) + " AP", c_white, c_white, c_white, c_white, 1);
						if manned_unit != noone {
			                draw_sprite_ext(spr_Stat_Background, 0, x+28, y, 1, 1, 0, c_white, 1);
			                draw_sprite_ext(spr_Repair_Icon, 0, x+20, y, 1, 1, 0, c_white, 1);
			                draw_text_colour(x+38, y, string(manned_unit.repair_ammo), c_white, c_white, c_white, c_white, 1);
						}
		            }
		        break;
			case "MBT_B":
		        if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		            else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
				switch p_faction {
					case "US":
						draw_text_colour(xx, yy-38, "M1A1 MBT", clr1, clr1, clr1, clr1, 1);
						break;
					case "RU":
						draw_text_colour(xx, yy-38, "T-62 MBT", clr1, clr1, clr1, clr1, 1);
						break;
				}
		        if is_manning == false {
		            draw_set_halign(fa_right);
		            //Health
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Health,          0, xx-16, yy-20, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-22, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		            //AP
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-9, yy, "AP",                   c_white, c_white, c_white, c_white, 1);
		            draw_text_colour(xx-29, yy, string(action_points), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_left);
		            //Cannon Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Cannon_Icon,     0, xx+15, yy-18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+25, yy-18, string(cannon_ammo), c_white, c_white, c_white, c_white, 1);
		            //MG Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_MG_Icon,         0, xx+15, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+25, yy, string(mg_ammo), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_center);
		        }
		            else if is_manning == true {
		                //Health
		                draw_sprite_ext(spr_Stat_Background, 0, x, y-18, 1, 1, 0, c_white, 1);
		                draw_sprite_ext(spr_Health, 0, x-14, y-20, 1, 1, 0, c_white, 1);
		                draw_text_colour(x+6, y-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		                draw_sprite_ext(spr_Stat_Background, 0, x-28, y, 1, 1, 0, c_white, 1);
		                draw_text_colour(x-28, y, string(action_points) + " AP", c_white, c_white, c_white, c_white, 1);
						if manned_unit != noone {
			                draw_sprite_ext(spr_Stat_Background, 0, x+28, y, 1, 1, 0, c_white, 1);
			                draw_sprite_ext(spr_Repair_Icon, 0, x+20, y, 1, 1, 0, c_white, 1);
			                draw_text_colour(x+38, y, string(manned_unit.repair_ammo), c_white, c_white, c_white, c_white, 1);
						}
		            }
		        break;
		    case "LAC_A":
		        if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		            else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
				switch p_faction {
					case "US":
						draw_text_colour(xx, yy-38, "M1097 Cargo", clr1, clr1, clr1, clr1, 1);
						break;
					case "RU":
						draw_text_colour(xx, yy-38, "Tigr Cargo", clr1, clr1, clr1, clr1, 1);
						break;
				}
		        if is_manning == false {
		            draw_set_halign(fa_right);
		            //Health
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Health,          0, xx-16, yy-20, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-22, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		            //AP
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-9, yy, "AP",                   c_white, c_white, c_white, c_white, 1);
		            draw_text_colour(xx-29, yy, string(action_points), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_left);
		            //Depot 
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Depot_Icon,      0, xx+22, yy-18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+32, yy-18, string(depot_supply), c_white, c_white, c_white, c_white, 1);
		            //Repair
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Repair_Icon,     0, xx+22, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+32, yy, string(repair_supply), c_white, c_white, c_white, c_white, 1);
		            //AT
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_AT_Icon,         0, xx+22, yy+18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+32, yy+18, string(tow_supply), c_white, c_white, c_white, c_white, 1);
		            //AA
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+36, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_AA_Icon,         0, xx+22, yy+36, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+32, yy+36, string(mortar_supply), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_center);
		        }
		            else if is_manning == true {
		                //Health
		                draw_sprite_ext(spr_Stat_Background, 0, x, y-18, 1, 1, 0, c_white, 1);
		                draw_sprite_ext(spr_Health, 0, x-14, y-20, 1, 1, 0, c_white, 1);
		                draw_text_colour(x+6, y-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		                draw_sprite_ext(spr_Stat_Background, 0, x-28, y, 1, 1, 0, c_white, 1);
		                draw_text_colour(x-28, y, string(action_points) + " AP", c_white, c_white, c_white, c_white, 1);
						if manned_unit != noone {
		                    draw_sprite_ext(spr_Stat_Background, 0, x+28, y, 1, 1, 0, c_white, 1);
		                    draw_sprite_ext(spr_Repair_Icon, 0, x+20, y, 1, 1, 0, c_white, 1);
		                    draw_text_colour(x+38, y, string(manned_unit.repair_ammo), c_white, c_white, c_white, c_white, 1);
		                }
		            }
		        break;
			case "LAC_B":
		        if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		            else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
				switch p_faction {
					case "US":
						draw_text_colour(xx, yy-38, "M1097 TOW", clr1, clr1, clr1, clr1, 1);
						break;
					case "RU":
						draw_text_colour(xx, yy-38, "Tigr ATGM", clr1, clr1, clr1, clr1, 1);
						break;
				}
		        if is_manning == false {
		            draw_set_halign(fa_right);
		            //Health
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Health,          0, xx-16, yy-20, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-22, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		            //AP
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-9, yy, "AP",                   c_white, c_white, c_white, c_white, 1);
		            draw_text_colour(xx-29, yy, string(action_points), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_left);
		            //TOW
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_AT_Icon,         0, xx+24, yy-18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+34, yy-18, string(tow_ammo), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_center);
		        }
		            else if is_manning == true {
		                //Health
		                draw_sprite_ext(spr_Stat_Background, 0, x, y-18, 1, 1, 0, c_white, 1);
		                draw_sprite_ext(spr_Health, 0, x-14, y-20, 1, 1, 0, c_white, 1);
		                draw_text_colour(x+6, y-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		                draw_sprite_ext(spr_Stat_Background, 0, x-28, y, 1, 1, 0, c_white, 1);
		                draw_text_colour(x-28, y, string(action_points) + " AP", c_white, c_white, c_white, c_white, 1);
						if manned_unit != noone {
		                    draw_sprite_ext(spr_Stat_Background, 0, x+28, y, 1, 1, 0, c_white, 1);
		                    draw_sprite_ext(spr_Repair_Icon, 0, x+20, y, 1, 1, 0, c_white, 1);
		                    draw_text_colour(x+38, y, string(manned_unit.repair_ammo), c_white, c_white, c_white, c_white, 1);
		                }
		            }
		        break;
		    case "LAV_A":
		        if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		            else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
				switch p_faction {
					case "US":
						draw_text_colour(xx, yy-38, "M3 IFV", clr1, clr1, clr1, clr1, 1);
						break;
					case "RU":
						draw_text_colour(xx, yy-38, "BMP3 IFV", clr1, clr1, clr1, clr1, 1);
						break;
				}
		        if is_manning == false {
		            draw_set_halign(fa_right);
		            //Health
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Health,          0, xx-16, yy-20, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-22, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		            //AP
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-9, yy, "AP",                  c_white, c_white, c_white, c_white, 1);
		            draw_text_colour(xx-29, yy, string(action_points), c_white, c_white, c_white, c_white, 1);
					//SQUADS
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-9, yy+18, "SQ",                  c_white, c_white, c_white, c_white, 1);
		            draw_text_colour(xx-29, yy+18, string(sqd_ammo), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_left);
		            //HE Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_HE_Icon, 0, xx+15, yy-18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+25, yy-18, string(he_ammo), c_white, c_white, c_white, c_white, 1);
		            //AP Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_AP_Icon, 0, xx+15, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+25, yy, string(ap_ammo), c_white, c_white, c_white, c_white, 1);
					//MG Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_MG_Icon, 0, xx+15, yy+18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+25, yy+18, string(mg_ammo), c_white, c_white, c_white, c_white, 1);
					//AT Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+36, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_AT_Icon, 0, xx+15, yy+36, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+25, yy+36, string(tow_ammo), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_center);
		        }
		            else if is_manning == true {
		                //Health
		                draw_sprite_ext(spr_Stat_Background, 0, x, y-18, 1, 1, 0, c_white, 1);
		                draw_sprite_ext(spr_Health, 0, x-14, y-20, 1, 1, 0, c_white, 1);
		                draw_text_colour(x+6, y-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		                draw_sprite_ext(spr_Stat_Background, 0, x-28, y, 1, 1, 0, c_white, 1);
		                draw_text_colour(x-28, y, string(action_points) + " AP", c_white, c_white, c_white, c_white, 1);
						if manned_unit != noone {
		                    draw_sprite_ext(spr_Stat_Background, 0, x+28, y, 1, 1, 0, c_white, 1);
		                    draw_sprite_ext(spr_Repair_Icon, 0, x+20, y, 1, 1, 0, c_white, 1);
		                    draw_text_colour(x+38, y, string(manned_unit.repair_ammo), c_white, c_white, c_white, c_white, 1);
		                }
		            }
		        break;
			case "LAV_B":
		        if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		            else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
				switch p_faction {
					case "US":
						draw_text_colour(xx, yy-38, "M1126 APC", clr1, clr1, clr1, clr1, 1);
						break;
					case "RU":
						draw_text_colour(xx, yy-38, "BTR-80 APC", clr1, clr1, clr1, clr1, 1);
						break;
				}
		        if is_manning == false {
		            draw_set_halign(fa_right);
		            //Health
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Health,          0, xx-16, yy-20, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-22, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		            //AP
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-9, yy, "AP",                  c_white, c_white, c_white, c_white, 1);
		            draw_text_colour(xx-29, yy, string(action_points), c_white, c_white, c_white, c_white, 1);
					//SQUADS
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-9, yy+18, "SQ",                  c_white, c_white, c_white, c_white, 1);
		            draw_text_colour(xx-29, yy+18, string(sqd_ammo), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_left);
		            //HE Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_HE_Icon, 0, xx+18, yy-18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+28, yy-18, string(he_ammo), c_white, c_white, c_white, c_white, 1);
		            //AP Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_AP_Icon, 0, xx+18, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+28, yy, string(ap_ammo), c_white, c_white, c_white, c_white, 1);
					//MG Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_MG_Icon, 0, xx+15, yy+18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+25, yy+18, string(mg_ammo), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_center);
		        }
		            else if is_manning == true {
		                //Health
		                draw_sprite_ext(spr_Stat_Background, 0, x, y-18, 1, 1, 0, c_white, 1);
		                draw_sprite_ext(spr_Health, 0, x-14, y-20, 1, 1, 0, c_white, 1);
		                draw_text_colour(x+6, y-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		                draw_sprite_ext(spr_Stat_Background, 0, x-28, y, 1, 1, 0, c_white, 1);
		                draw_text_colour(x-28, y, string(action_points) + " AP", c_white, c_white, c_white, c_white, 1);
						if manned_unit != noone {
		                    draw_sprite_ext(spr_Stat_Background, 0, x+28, y, 1, 1, 0, c_white, 1);
		                    draw_sprite_ext(spr_Repair_Icon, 0, x+20, y, 1, 1, 0, c_white, 1);
		                    draw_text_colour(x+38, y, string(manned_unit.repair_ammo), c_white, c_white, c_white, c_white, 1);
		                }
		            }
		        break;
		    case "LOGI_A": 
		        if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		            else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
				switch p_faction {
					case "US":
						draw_text_colour(xx, yy-38, "M35 Cargo", clr1, clr1, clr1, clr1, 1);
						break;
					case "RU":
						draw_text_colour(xx, yy-38, "Ural Cargo", clr1, clr1, clr1, clr1, 1);
						break;
				}
		        if is_manning == false {
		            draw_set_halign(fa_right);
		            //Health
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Health,          0, xx-16, yy-20, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-22, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		            //AP
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-9, yy, "AP",                  c_white, c_white, c_white, c_white, 1);
		            draw_text_colour(xx-29, yy, string(action_points), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_left);
		            //Ammo Supply
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Ammo_Icon,     0, xx+16, yy-18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+26, yy-18, string(ammo_supply), c_white, c_white, c_white, c_white, 1);
		            //Building Supply
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Building_Icon, 0, xx+16, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+26, yy, string(building_supply), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_center);
		        }
		            else if is_manning == true {
		                //Health
		                draw_sprite_ext(spr_Stat_Background, 0, x, y-18, 1, 1, 0, c_white, 1);
		                draw_sprite_ext(spr_Health, 0, x-14, y-20, 1, 1, 0, c_white, 1);
		                draw_text_colour(x+6, y-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		                draw_sprite_ext(spr_Stat_Background, 0, x-28, y, 1, 1, 0, c_white, 1);
		                draw_text_colour(x-28, y, string(action_points) + " AP", c_white, c_white, c_white, c_white, 1);
						if manned_unit != noone {
		                    draw_sprite_ext(spr_Stat_Background, 0, x+28, y, 1, 1, 0, c_white, 1);
		                    draw_sprite_ext(spr_Repair_Icon, 0, x+20, y, 1, 1, 0, c_white, 1);
		                    draw_text_colour(x+38, y, string(manned_unit.repair_ammo), c_white, c_white, c_white, c_white, 1);
		                }
		            }
		        break;
			case "LOGI_B": 
		        if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		            else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
				switch p_faction {
					case "US":
						draw_text_colour(xx, yy-38, "M35 Carrier", clr1, clr1, clr1, clr1, 1);
						break;
					case "RU":
						draw_text_colour(xx, yy-38, "Ural Carrier", clr1, clr1, clr1, clr1, 1);
						break;
				}
		        if is_manning == false {
		            draw_set_halign(fa_right);
		            //Health
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Health,          0, xx-16, yy-20, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-22, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		            //AP
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-9, yy, "AP",                  c_white, c_white, c_white, c_white, 1);
		            draw_text_colour(xx-29, yy, string(action_points), c_white, c_white, c_white, c_white, 1);
					//SQUADS
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-9, yy+18, "SQ",                  c_white, c_white, c_white, c_white, 1);
		            draw_text_colour(xx-29, yy+18, string(sqd_ammo), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_left);
		            //Ammo Supply
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Ammo_Icon,     0, xx+16, yy-18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+26, yy-18, string(ammo_supply), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_center);
		        }
		            else if is_manning == true {
		                //Health
		                draw_sprite_ext(spr_Stat_Background, 0, x, y-18, 1, 1, 0, c_white, 1);
		                draw_sprite_ext(spr_Health, 0, x-14, y-20, 1, 1, 0, c_white, 1);
		                draw_text_colour(x+6, y-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		                draw_sprite_ext(spr_Stat_Background, 0, x-28, y, 1, 1, 0, c_white, 1);
		                draw_text_colour(x-28, y, string(action_points) + " AP", c_white, c_white, c_white, c_white, 1);
						if manned_unit != noone {
		                    draw_sprite_ext(spr_Stat_Background, 0, x+28, y, 1, 1, 0, c_white, 1);
		                    draw_sprite_ext(spr_Repair_Icon, 0, x+20, y, 1, 1, 0, c_white, 1);
		                    draw_text_colour(x+38, y, string(manned_unit.repair_ammo), c_white, c_white, c_white, c_white, 1);
		                }
		            }
		        break;
		    case "DEPOT":
		        if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		            else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		        draw_text_colour(xx, yy-38, "Depot", clr1, clr1, clr1, clr1, 1);
		        if can_be_manned == true {
		            if is_manned == true {
		                draw_set_halign(fa_right);
		                //Health
			            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
			            draw_sprite_ext(spr_Health,          0, xx-16, yy-20, 1, 1, 0, c_white, 1);
			            draw_text_colour(xx-22, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
			            //AP
			            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
			            draw_text_colour(xx-9, yy, "AP",                  c_white, c_white, c_white, c_white, 1);
			            draw_text_colour(xx-29, yy, string(action_points), c_white, c_white, c_white, c_white, 1);
			            draw_set_halign(fa_left);
		                //Parts Supply
		                draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		                draw_sprite_ext(spr_Building_Icon,     0, xx+16, yy-18, 1, 1, 0, c_white, 1);
		                draw_text_colour(xx+26, y-18, string(parts_ammo), c_white, c_white, c_white, c_white, 1);
		                //Ammunition Supply
		                draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, 0, c_white, 1);
		                draw_sprite_ext(spr_Ammo_Icon, 0, xx+16, yy, 1, 1, 0, c_white, 1);
		                draw_text_colour(xx+26, yy, string(ammunition_ammo), c_white, c_white, c_white, c_white, 1);
		            }
		                else if is_manned == false {
		                    //Health
		                    draw_sprite_ext(spr_Stat_Background, 0, xx, yy-18, 1, 1, 0, c_white, 1);
		                    draw_sprite_ext(spr_Health, 0, xx-14, yy-20, 1, 1, 0, c_white, 1);
		                    draw_text_colour(xx+6, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		                }
		            draw_set_halign(fa_center);
		        }
		        break;
		    case "REPAIR":
		        if is_occupied == false {
		            if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
						else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		            draw_text_colour(xx, yy-38, "Repair", clr1, clr1, clr1, clr1, 1);
		            if can_be_manned == true {
		                if is_manned == true {
		                    draw_set_halign(fa_right);
		                    //Health
				            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
				            draw_sprite_ext(spr_Health,          0, xx-16, yy-20, 1, 1, 0, c_white, 1);
				            draw_text_colour(xx-22, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
				            //AP
				            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
				            draw_text_colour(xx-9, yy, "AP",                  c_white, c_white, c_white, c_white, 1);
				            draw_text_colour(xx-29, yy, string(action_points), c_white, c_white, c_white, c_white, 1);
				            draw_set_halign(fa_left);
		                    //Repair Supply
		                    draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		                    draw_sprite_ext(spr_Building_Icon, 0, xx+18, yy-18, 1, 1, 0, c_white, 1);
		                    draw_text_colour(xx+28, yy-18, string(repair_ammo), c_white, c_white, c_white, c_white, 1);
		                    //MG Ammo
		                    draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, 0, c_white, 1);
		                    draw_sprite_ext(spr_MG_Icon, 0, xx+18, yy, 1, 1, 0, c_white, 1);
		                    draw_text_colour(xx+28, yy, string(mg_ammo), c_white, c_white, c_white, c_white, 1);
		                }
		                    else if is_manned == false {
		                        //Health
		                        draw_sprite_ext(spr_Stat_Background, 0, xx, yy-18, 1, 1, 0, c_white, 1);
		                        draw_sprite_ext(spr_Health, 0, xx-14, yy-20, 1, 1, 0, c_white, 1);
		                        draw_text_colour(xx+6, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		                    }
		                draw_set_halign(fa_center);
		            }
		        }
		        break;
		    case "TOW":
		        if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		            else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		        draw_text_colour(xx, yy-38, "Anti-Tank", clr1, clr1, clr1, clr1, 1);
		        if can_be_manned == true && alert_display == false {
		            if is_manned == true {
		                draw_set_halign(fa_right);
		                //Health
			            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
			            draw_sprite_ext(spr_Health,          0, xx-16, yy-20, 1, 1, 0, c_white, 1);
			            draw_text_colour(xx-22, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
			            //AP
			            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
			            draw_text_colour(xx-9, yy, "AP",                  c_white, c_white, c_white, c_white, 1);
			            draw_text_colour(xx-29, yy, string(action_points), c_white, c_white, c_white, c_white, 1);
			            draw_set_halign(fa_left);
		                //TOW Ammo
		                draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		                draw_sprite_ext(spr_Flare_Icon, 0, xx+18, yy-18, 1, 1, 0, c_white, 1);
		                draw_text_colour(xx+28, yy-18, string(tow_ammo), c_white, c_white, c_white, c_white, 1);
		            }
		                else if is_manned == false {
		                    //Health
		                    draw_sprite_ext(spr_Stat_Background, 0, xx, yy-18, 1, 1, 0, c_white, 1);
		                    draw_sprite_ext(spr_Health, 0, xx-14, yy-20, 1, 1, 0, c_white, 1);
		                    draw_text_colour(xx+6, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		                }
		            draw_set_halign(fa_center);
		            }
		        break;
		    case "MORTAR":
		        if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		            else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		        draw_text_colour(xx, yy-38, "Mortar", clr1, clr1, clr1, clr1, 1);
		        if can_be_manned == true {
		            if is_manned == true {
		                draw_set_halign(fa_right);
		                //Health
			            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
			            draw_sprite_ext(spr_Health,          0, xx-16, yy-20, 1, 1, 0, c_white, 1);
			            draw_text_colour(xx-22, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
			            //AP
			            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
			            draw_text_colour(xx-9, yy, "AP",                  c_white, c_white, c_white, c_white, 1);
			            draw_text_colour(xx-29, yy, string(action_points), c_white, c_white, c_white, c_white, 1);
			            draw_set_halign(fa_left);
		                //Mortar Ammo
		                draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		                draw_sprite_ext(spr_Flare_Icon, 0, xx+18, yy-18, 1, 1, 0, c_white, 1);
		                draw_text_colour(xx+28, yy-18, string(mortar_ammo), c_white, c_white, c_white, c_white, 1);
		            }
		                else if is_manned == false {
		                    //Health
		                    draw_sprite_ext(spr_Stat_Background, 0, xx, yy-18, 1, 1, 0, c_white, 1);
		                    draw_sprite_ext(spr_Health, 0, xx-14, yy-20, 1, 1, 0, c_white, 1);
		                    draw_text_colour(xx+6, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		                }
		            draw_set_halign(fa_center);
		        }
		        break;
		    case "LANDINGCRAFT":
		        draw_set_font(fnt_12);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
		        draw_sprite_ext(spr_Label_Border_L, 0, x, y-76, 1.25, 1.5, 0, c_white, 1);
		        switch ship_type {
		            case "Supply":
		                draw_text_colour(x, y-76, "SUPPLY SHIP", c_white, c_white, c_white, c_white, 1);
		                if depleted == true {
		                    draw_set_font(fnt_10);
		                    //Parts Supply
					        draw_sprite_ext(spr_Stat_Background, 0, x+50, y, 1.5, 1.5, 0, c_white, 1);
					        draw_sprite_ext(spr_Building_Icon,     0, x+32, y, 1, 1, 0, c_white, 1);
					        draw_text_colour(x+57, y, string(parts_ammo), c_white, c_white, c_white, c_white, 1);
					        //Ammunition Supply
					        draw_sprite_ext(spr_Stat_Background, 0, x-50, y, 1.5, 1.5, 0, c_white, 1);
					        draw_sprite_ext(spr_Ammo_Icon, 0, x-32, y, 1, 1, 0, c_white, 1);
					        draw_text_colour(x-57, y, string(ammunition_ammo), c_white, c_white, c_white, c_white, 1);
		                }
		                break;
		            case "Infantry":
		                draw_text_colour(x, y-76, "TROOP SHIP", c_white, c_white, c_white, c_white, 1);
		                break;
		            case "Engineer":
		                draw_text_colour(x, y-76, "LAC SHIP", c_white, c_white, c_white, c_white, 1);
		                break;
		            case "Tank":
		                draw_text_colour(x, y-76, "MBT SHIP", c_white, c_white, c_white, c_white, 1);
		                break;
		            case "LAV_A":
		                draw_text_colour(x, y-76, "LAV SHIP", c_white, c_white, c_white, c_white, 1);
		                break;
		        }
		        break;
		    default:
		        break;
		}
	}
		//If playing as player 2
		else {
			switch unit_type {
				case "INF_A":
					if is_manning == false {
						if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
							else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
						switch p_faction {
							case "US":
								draw_text_transformed_colour(xx, yy+40, "Riflemen", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
								break;
							case "RU":
								draw_text_transformed_colour(xx, yy+40, "Riflemen", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
								break;
						}
						draw_set_halign(fa_right);
						//Health
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Health,          0, xx+16, yy+20, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+22, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//AP
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+10, yy, "AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_text_transformed_colour(xx+28, yy, string(action_points), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_left);
						//Rifle Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Rifle_Icon,      0, xx-14, yy+16, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-24, yy+18, string(rifle_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//RPG Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_RPG_Icon,   0, xx-14, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-24, yy, string(rpg_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//Flare Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Flare_Icon,      0, xx-14, yy-18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-24, yy-18, string(flare_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_center);
					}
					break;
				case "INF_B":
					if is_manning == false {
						if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
							else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
						switch p_faction {
							case "US":
								draw_text_transformed_colour(xx, yy+40, "Recon", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
								break;
							case "RU":
								draw_text_transformed_colour(xx, yy+40, "Recon", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
								break;
						}
						draw_set_halign(fa_right);
						//Health
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Health,          0, xx+16, yy+20, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+22, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//AP
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+10, yy, "AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_text_transformed_colour(xx+28, yy, string(action_points), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_left);
						//Rifle Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Rifle_Icon,      0, xx-14, yy+16, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-24, yy+18, string(rifle_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//RPG Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_RPG_Icon,   0, xx-14, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-24, yy, string(rpg_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//Flare Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Flare_Icon,      0, xx-14, yy-18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-24, yy-18, string(flare_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_center);
					}
					break;
				case "MBT_A":
					if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
						else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
					switch p_faction {
						case "US":
							draw_text_transformed_colour(xx, yy+40, "M1A2 MBT", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							break;
						case "RU":
							draw_text_transformed_colour(xx, yy+40, "T-72 MBT", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							break;
					}
					if is_manning == false {
						draw_set_halign(fa_right);
						//Health
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Health,          0, xx+16, yy+20, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+22, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//AP
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+10, yy, "AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_text_transformed_colour(xx+28, yy, string(action_points), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_left);
						//Cannon Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Cannon_Icon,     0, xx-14, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-24, yy+18, string(cannon_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//MG Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_MG_Icon,         0, xx-14, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-24, yy, string(mg_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_center);
					}
						else if is_manning == true {
							//Health
							draw_sprite_ext(spr_Stat_Background, 0, x, y+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Health, 0, x+14, y+20, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(x-6, y+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							draw_sprite_ext(spr_Stat_Background, 0, x+28, y, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(x+28, y, string(action_points) + " AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							if manned_unit != noone {
								draw_sprite_ext(spr_Stat_Background, 0, x-28, y, 1, 1, txt_rot, c_white, 1);
								draw_sprite_ext(spr_Repair_Icon, 0, x-20, y, 1, 1, txt_rot, c_white, 1);
								draw_text_transformed_colour(x-38, y, string(manned_unit.repair_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							}
						}
					break;
				case "MBT_B":
					if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
						else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
					switch p_faction {
						case "US":
							draw_text_transformed_colour(xx, yy+40, "M1A1 MBT", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							break;
						case "RU":
							draw_text_transformed_colour(xx, yy+40, "T-62 MBT", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							break;
					}
					if is_manning == false {
						draw_set_halign(fa_right);
						//Health
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Health,          0, xx+16, yy+20, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+22, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//AP
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+10, yy, "AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_text_transformed_colour(xx+28, yy, string(action_points), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_left);
						//Cannon Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Cannon_Icon, 0, xx-14, yy+16, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-24, yy+18, string(cannon_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//MG Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_MG_Icon,     0, xx-14, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-24, yy, string(mg_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_center);
					}
						else if is_manning == true {
							//Health
							draw_sprite_ext(spr_Stat_Background, 0, x, y+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Health, 0, x+14, y+20, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(x-6, y+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							draw_sprite_ext(spr_Stat_Background, 0, x+28, y, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(x+28, y, string(action_points) + " AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							if manned_unit != noone {
								draw_sprite_ext(spr_Stat_Background, 0, x-28, y, 1, 1, txt_rot, c_white, 1);
								draw_sprite_ext(spr_Repair_Icon, 0, x-20, y, 1, 1, txt_rot, c_white, 1);
								draw_text_transformed_colour(x-38, y, string(manned_unit.repair_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							}
						}
					break;
				case "LAC_A":
					if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
						else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
					switch p_faction {
						case "US":
							draw_text_transformed_colour(xx, yy+40, "M1097 Cargo", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							break;
						case "RU":
							draw_text_transformed_colour(xx, yy+40, "Tigr Cargo", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							break;
					}
					if is_manning == false {
						draw_set_halign(fa_right);
						//Health
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Health,          0, xx+16, yy+20, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+22, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//AP
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+10, yy, "AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_text_transformed_colour(xx+28, yy, string(action_points), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_left);
						//Depot 
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Depot_Icon,      0, xx-22, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-32, yy+18, string(depot_supply), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//Repair
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Repair_Icon,     0, xx-22, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-32, yy, string(repair_supply), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//TOW
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_AT_Icon,         0, xx-22, yy-18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-32, yy-18, string(tow_supply), 1, 1, txt_rot,c_white, c_white, c_white, c_white, 1);
						//MORTAR
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-36, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_AA_Icon,         0, xx-22, yy-36, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-32, yy-36, string(mortar_supply), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_center);
					}
						else if is_manning == true {
							//Health
							draw_sprite_ext(spr_Stat_Background, 0, x, y+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Health, 0, x+14, y+20, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(x-6, y+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							draw_sprite_ext(spr_Stat_Background, 0, x+28, y, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(x+28, y, string(action_points) + " AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							if manned_unit != noone {
							    draw_sprite_ext(spr_Stat_Background, 0, x-28, y, 1, 1, txt_rot, c_white, 1);
							    draw_sprite_ext(spr_Repair_Icon, 0, x-20, y, 1, 1, txt_rot, c_white, 1);
							    draw_text_transformed_colour(x-38, y, string(manned_unit.repair_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							}
						}
					break;
				case "LAC_B":
					if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
						else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
					switch p_faction {
						case "US":
							draw_text_transformed_colour(xx, yy+40, "M1097 TOW", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							break;
						case "RU":
							draw_text_transformed_colour(xx, yy+40, "Tigr ATGM", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							break;
					}
					if is_manning == false {
						draw_set_halign(fa_right);
						//Health
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Health,          0, xx+16, yy+20, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+22, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//AP
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+10, yy, "AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_text_transformed_colour(xx+28, yy, string(action_points), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_left);
						//TOW
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_AT_Icon,     0, xx-22, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-32, yy+18, string(tow_ammo), 1, 1, txt_rot,c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_center);
					}
						else if is_manning == true {
							//Health
							draw_sprite_ext(spr_Stat_Background, 0, x, y+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Health, 0, x+14, y+20, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(x-6, y+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							draw_sprite_ext(spr_Stat_Background, 0, x+28, y, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(x+28, y, string(action_points) + " AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							if manned_unit != noone {
							    draw_sprite_ext(spr_Stat_Background, 0, x-28, y, 1, 1, txt_rot, c_white, 1);
							    draw_sprite_ext(spr_Repair_Icon, 0, x-20, y, 1, 1, txt_rot, c_white, 1);
							    draw_text_transformed_colour(x-38, y, string(manned_unit.repair_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							}
						}
					break;
				case "LAV_A":
					if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
						else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
					switch p_faction {
						case "US":
							draw_text_transformed_colour(xx, yy+40, "M3 IFV", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							break;
						case "RU":
							draw_text_transformed_colour(xx, yy+40, "BMP3 IFV", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							break;
					}
					if is_manning == false {
						draw_set_halign(fa_right);
						//Health
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Health,          0, xx+16, yy+20, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+22, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//AP
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+10, yy, "AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_text_transformed_colour(xx+28, yy, string(action_points), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//SQUADS
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+10, yy-18, "SQ", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_text_transformed_colour(xx+28, yy-18, string(sqd_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_left);
						//HE Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_HE_Icon, 0, xx-18, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-28, yy+18, string(he_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//AP Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_AP_Icon, 0, xx-18, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-28, yy, string(ap_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//MG Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_MG_Icon, 0, xx-18, yy-18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-28, yy-18, string(mg_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//AT Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-36, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_AT_Icon, 0, xx-18, yy-36, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-28, yy-36, string(tow_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_center);
					}
						else if is_manning == true {
							//Health
							draw_sprite_ext(spr_Stat_Background, 0, x, y+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Health, 0, x+14, y+20, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(x-6, y+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							draw_sprite_ext(spr_Stat_Background, 0, x+28, y, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(x+28, y, string(action_points) + " AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							if manned_unit != noone {
							    draw_sprite_ext(spr_Stat_Background, 0, x-28, y, 1, 1, txt_rot, c_white, 1);
							    draw_sprite_ext(spr_Repair_Icon, 0, x-20, y, 1, 1, txt_rot, c_white, 1);
							    draw_text_transformed_colour(x-38, y, string(manned_unit.repair_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							}
						}
					break;
				case "LAV_B":
					if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
						else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
					switch p_faction {
						case "US":
							draw_text_transformed_colour(xx, yy+40, "M1126 APC", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							break;
						case "RU":
							draw_text_transformed_colour(xx, yy+40, "BTR-80 APC", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							break;
					}
					if is_manning == false {
						draw_set_halign(fa_right);
						//Health
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Health,          0, xx+16, yy+20, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+22, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//AP
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+10, yy, "AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_text_transformed_colour(xx+28, yy, string(action_points), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//SQUADS
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+10, yy-18, "SQ", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_text_transformed_colour(xx+28, yy-18, string(sqd_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_left);
						//HE Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_HE_Icon, 0, xx-18, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-28, yy+18, string(he_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//AP Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_AP_Icon, 0, xx-18, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-28, yy, string(ap_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//MG Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_MG_Icon, 0, xx-18, yy-18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-28, yy-18, string(mg_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_center);
					}
						else if is_manning == true {
							//Health
							draw_sprite_ext(spr_Stat_Background, 0, x, y+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Health, 0, x+14, y+20, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(x-6, y+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							draw_sprite_ext(spr_Stat_Background, 0, x+28, y, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(x+28, y, string(action_points) + " AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							if manned_unit != noone {
							    draw_sprite_ext(spr_Stat_Background, 0, x-28, y, 1, 1, txt_rot, c_white, 1);
							    draw_sprite_ext(spr_Repair_Icon, 0, x-20, y, 1, 1, txt_rot, c_white, 1);
							    draw_text_transformed_colour(x-38, y, string(manned_unit.repair_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							}
						}
					break;
				case "LOGI_A": 
					if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
						else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
					switch p_faction {
						case "US":
							draw_text_transformed_colour(xx, yy+40, "M35 Cargo", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							break;
						case "RU":
							draw_text_transformed_colour(xx, yy+40, "Ural Cargo", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							break;
					}
					if is_manning == false {
						draw_set_halign(fa_right);
						//Health
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Health,          0, xx+16, yy+20, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+22, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//AP
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+10, yy, "AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_text_transformed_colour(xx+28, yy, string(action_points), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_left);
						//Ammo Supply
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Ammo_Icon,       0, xx-14, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-24, yy+18, string(ammo_supply), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//Building Supply
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Building_Icon,   0, xx-14, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-24, yy, string(building_supply), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_center);
					}
						else if is_manning == true {
							//Health
							draw_sprite_ext(spr_Stat_Background, 0, x, y+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Health, 0, x+14, y+20, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(x-6, y+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							draw_sprite_ext(spr_Stat_Background, 0, x+28, y, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(x+28, y, string(action_points) + " AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							if manned_unit != noone {
							    draw_sprite_ext(spr_Stat_Background, 0, x-28, y, 1, 1, txt_rot, c_white, 1);
							    draw_sprite_ext(spr_Repair_Icon, 0, x-20, y, 1, 1, txt_rot, c_white, 1);
							    draw_text_transformed_colour(x-38, y, string(manned_unit.repair_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							}
						}
					break;
				case "LOGI_B": 
					if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
						else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
					switch p_faction {
						case "US":
							draw_text_transformed_colour(xx, yy+40, "M35 Carrier", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							break;
						case "RU":
							draw_text_transformed_colour(xx, yy+40, "Ural Carrier", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							break;
					}
					if is_manning == false {
						draw_set_halign(fa_right);
						//Health
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Health,          0, xx+16, yy+20, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+22, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//AP
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+10, yy, "AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_text_transformed_colour(xx+28, yy, string(action_points), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//SQUADS
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+10, yy-18, "SQ", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_text_transformed_colour(xx+28, yy-18, string(sqd_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_left);
						//Ammo Supply
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Ammo_Icon,       0, xx-14, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-24, yy+18, string(ammo_supply), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_center);
					}
						else if is_manning == true {
							//Health
							draw_sprite_ext(spr_Stat_Background, 0, x, y+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Health, 0, x+14, y+20, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(x-6, y+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							draw_sprite_ext(spr_Stat_Background, 0, x+28, y, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(x+28, y, string(action_points) + " AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							if manned_unit != noone {
							    draw_sprite_ext(spr_Stat_Background, 0, x-28, y, 1, 1, txt_rot, c_white, 1);
							    draw_sprite_ext(spr_Repair_Icon, 0, x-20, y, 1, 1, txt_rot, c_white, 1);
							    draw_text_transformed_colour(x-38, y, string(manned_unit.repair_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							}
						}
					break;
				case "DEPOT":
					if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
						else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
					draw_text_transformed_colour(xx, yy+40, "Depot", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
					if can_be_manned == true {
						if is_manned == true {
							draw_set_halign(fa_right);
							//Health
							draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Health,          0, xx+16, yy+20, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx+22, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							//AP
							draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx+10, yy, "AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							draw_text_transformed_colour(xx+28, yy, string(action_points), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							draw_set_halign(fa_left);
							//Parts Supply
							draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Building_Icon,   0, xx-16, yy+18, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx-26, y+18, string(parts_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							//Ammunition Supply
							draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Ammo_Icon, 0, xx-16, yy, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx-26, yy, string(ammunition_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						}
							else if is_manned == false {
							    //Health
							    draw_sprite_ext(spr_Stat_Background, 0, xx, yy+18, 1, 1, txt_rot, c_white, 1);
							    draw_sprite_ext(spr_Health, 0, xx+14, yy+20, 1, 1, txt_rot, c_white, 1);
							    draw_text_transformed_colour(xx-6, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							}
						draw_set_halign(fa_center);
					}
					break;
				case "REPAIR":
					if is_occupied == false {
						if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
							else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
						draw_text_transformed_colour(xx, yy+40, "Repair", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
						if can_be_manned == true {
							if is_manned == true {
							    draw_set_halign(fa_right);
							    //Health
								draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
								draw_sprite_ext(spr_Health,          0, xx+16, yy+20, 1, 1, txt_rot, c_white, 1);
								draw_text_transformed_colour(xx+22, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
								//AP
								draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
								draw_text_transformed_colour(xx+10, yy, "AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
								draw_text_transformed_colour(xx+28, yy, string(action_points), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
								draw_set_halign(fa_left);
							    //Repair Supply
							    draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
							    draw_sprite_ext(spr_Building_Icon, 0, xx-18, yy+18, 1, 1, txt_rot, c_white, 1);
							    draw_text_transformed_colour(xx-28, yy+18, string(repair_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							    //MG Ammo
							    draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, txt_rot, c_white, 1);
							    draw_sprite_ext(spr_MG_Icon, 0, xx-18, yy, 1, 1, txt_rot, c_white, 1);
							    draw_text_transformed_colour(xx-28, yy, string(mg_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							}
							    else if is_manned == false {
							        //Health
							        draw_sprite_ext(spr_Stat_Background, 0, xx, yy+18, 1, 1, txt_rot, c_white, 1);
							        draw_sprite_ext(spr_Health, 0, xx+14, yy+20, 1, 1, txt_rot, c_white, 1);
							        draw_text_transformed_colour(xx-6, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							    }
							draw_set_halign(fa_center);
						}
					}
					break;
				case "TOW":
					if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
						else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
					draw_text_transformed_colour(xx, yy+40, "TOW", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
					if can_be_manned == true && alert_display == false {
						if is_manned == true {
							draw_set_halign(fa_right);
							//Health
							draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Health,          0, xx+16, yy+20, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx+22, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							//AP
							draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx+10, yy, "AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							draw_text_transformed_colour(xx+28, yy, string(action_points), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							draw_set_halign(fa_left);
							//TOW Ammo
							draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Flare_Icon, 0, xx-18, yy+18, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx-28, yy+18, string(tow_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						}
							else if is_manned == false {
							    //Health
							    draw_sprite_ext(spr_Stat_Background, 0, xx, yy+18, 1, 1, txt_rot, c_white, 1);
							    draw_sprite_ext(spr_Health, 0, xx+14, yy+20, 1, 1, txt_rot, c_white, 1);
							    draw_text_transformed_colour(xx-6, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							}
						draw_set_halign(fa_center);
						}
					break;
				case "MORTAR":
					if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
						else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, 0, c_white, 1); }
					draw_text_transformed_colour(xx, yy+40, "Mortar", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
					if can_be_manned == true {
						if is_manned == true {
							draw_set_halign(fa_right);
							//Health
							draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Health,          0, xx+16, yy+20, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx+22, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							//AP
							draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx+10, yy, "AP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							draw_text_transformed_colour(xx+28, yy, string(action_points), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							draw_set_halign(fa_left);
							//Mortar Ammo
							draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Flare_Icon, 0, xx-18, yy+18, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx-28, yy+18, string(mortar_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						}
							else if is_manned == false {
							    //Health
							    draw_sprite_ext(spr_Stat_Background, 0, xx, yy+18, 1, 1, txt_rot, c_white, 1);
							    draw_sprite_ext(spr_Health, 0, xx+14, yy+20, 1, 1, txt_rot, c_white, 1);
							    draw_text_transformed_colour(xx-6, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							}
						draw_set_halign(fa_center);
					}
					break;
				case "LANDINGCRAFT":
					draw_set_font(fnt_12);
					draw_set_halign(fa_center);
					draw_set_valign(fa_middle);
					draw_sprite_ext(spr_Label_Border_L, 0, x, y+76, 1.25, 1.5, txt_rot, c_white, 1);
					switch ship_type {
						case "Supply":
							draw_text_transformed_colour(x, y+76, "SUPPLY SHIP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							if depleted == true {
							    draw_set_font(fnt_10);
							    //Parts Supply
								draw_sprite_ext(spr_Stat_Background, 0, x-50, y, 1.5, 1.5, txt_rot, c_white, 1);
								draw_sprite_ext(spr_Building_Icon,     0, x-32, y, 1, 1, txt_rot, c_white, 1);
								draw_text_transformed_colour(x-57, y, string(parts_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
								//Ammunition Supply
								draw_sprite_ext(spr_Stat_Background, 0, x+50, y, 1.5, 1.5, txt_rot, c_white, 1);
								draw_sprite_ext(spr_Ammo_Icon, 0, x+32, y, 1, 1, 0, c_white, 1);
								draw_text_transformed_colour(x+57, y, string(ammunition_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							}
							break;
						case "Infantry":
							draw_text_transformed_colour(x, y+76, "TROOP SHIP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							break;
						case "Engineer":
							draw_text_transformed_colour(x, y+76, "LAC SHIP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							break;
						case "Tank":
							draw_text_transformed_colour(x, y+76, "MBT SHIP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							break;
						case "LAV_A":
							draw_text_transformed_colour(x, y+76, "LAV SHIP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							break;
					}
					break;
				default:
					break;
			}
		}

	draw_set_font(fnt_12);
	draw_set_colour(c_black);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

}
