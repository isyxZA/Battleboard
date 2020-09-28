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
		    case "INFANTRY":
		        if is_manning == false {
		            if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		                else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		            draw_text_colour(xx, yy-39, string(unit_type), clr1, clr1, clr1, clr1, 1);
		            var h1 = 18;
		            var h2 = 28;
		            draw_set_halign(fa_right);
		            //Health
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Health, 0, xx-(h1+4), yy-20, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-h2, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		            //AP
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-(h1-1), yy, "AP", clr1, clr1, clr1, clr1, 1);
		            draw_text_colour(xx-(h2+7), yy, string(action_points), clr1, clr1, clr1, clr1, 1);
		            draw_set_halign(fa_left);
		            //Rifle Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Rifle_Icon, 0, xx+h1, yy-16, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+h2, yy-18, string(rifle_ammo), c_white, c_white, c_white, c_white, 1);
		            //RPG Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_RPG_Icon,   0, xx+h1, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+h2, yy, string(rpg_ammo), c_white, c_white, c_white, c_white, 1);
		            //Flare Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Flare_Icon, 0, xx+h1, yy+18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+h2, yy+18, string(flare_ammo), c_white, c_white, c_white, c_white, 1);
		            draw_set_halign(fa_center);
		        }
		        break;
		    case "TANK":
		        if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		                else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		        draw_text_colour(xx, yy-39, string(unit_type), clr1, clr1, clr1, clr1, 1);
		        if is_manning == false {
		            var h1 = 18;
		            var h2 = 28;
		            draw_set_halign(fa_right);
		            //Health
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Health, 0, xx-(h1+4), yy-20, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-h2, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		            //AP
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-(h1-1), yy, "AP", clr1, clr1, clr1, clr1, 1);
		            draw_text_colour(xx-(h2+7), yy, string(action_points), clr1, clr1, clr1, clr1, 1);
		            draw_set_halign(fa_left);
		            //Cannon Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Cannon_Icon, 0, xx+h1, yy-18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+h2, yy-18, string(cannon_ammo), c_white, c_white, c_white, c_white, 1);
		            //MG Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_MG_Icon,     0, xx+h1, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+h2, yy, string(mg_ammo), c_white, c_white, c_white, c_white, 1);
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
		    case "ENGINEER":
		        if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		                else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		        draw_text_colour(xx, yy-39, string(unit_type), clr1, clr1, clr1, clr1, 1);
		        if is_manning == false {
		            var h1 = 18;
		            var h2 = 28;
		            draw_set_halign(fa_right);
		            //Health
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Health, 0, xx-(h1+4), yy-20, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-h2, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		            //AP
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-(h1-1), yy, "AP", clr1, clr1, clr1, clr1, 1);
		            draw_text_colour(xx-(h2+7), yy, string(action_points), clr1, clr1, clr1, clr1, 1);
		            draw_set_halign(fa_left);
		            //Depot 
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Depot_Icon,  0, xx+(h1+8), yy-18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+(h2+8), yy-18, string(depot_supply), c_white, c_white, c_white, c_white, 1);
		            //Repair
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Repair_Icon, 0, xx+(h1+8), yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+(h2+8), yy, string(repair_supply), c_white, c_white, c_white, c_white, 1);
		            //AT
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_AT_Icon,     0, xx+(h1+8), yy+18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+(h2+8), yy+18, string(tow_supply), c_white, c_white, c_white, c_white, 1);
		            //AA
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+36, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_AA_Icon,     0, xx+(h1+8), yy+36, 1, 1, 0, c_white, 1);
		            draw_text_colour(x+(h2+8), yy+36, string(mortar_supply), c_white, c_white, c_white, c_white, 1);
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
		    case "BTR":
		        if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		                else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		        draw_text_colour(xx, yy-39, "LAV", clr1, clr1, clr1, clr1, 1);
		        if is_manning == false {
		            var h1 = 18;
		            var h2 = 28;
		            draw_set_halign(fa_right);
		            //Health
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Health, 0, xx-(h1+4), yy-20, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-h2, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		            //AP
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-(h1-1), yy, "AP", clr1, clr1, clr1, clr1, 1);
		            draw_text_colour(xx-(h2+7), yy, string(action_points), clr1, clr1, clr1, clr1, 1);
		            draw_set_halign(fa_left);
		            //HE Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_HE_Icon, 0, xx+h1, yy-18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+h2, yy-18, string(he_ammo), c_white, c_white, c_white, c_white, 1);
		            //AP Ammo
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_AP_Icon, 0, xx+h1, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+h2, yy, string(ap_ammo), c_white, c_white, c_white, c_white, 1);
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
		    case "LOGI": 
		        if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		                else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy-39, 1, 1, 0, c_white, 1); }
		        draw_text_colour(xx, yy-39, string(unit_type), clr1, clr1, clr1, clr1, 1);
		        if is_manning == false {
		            var h1 = 18;
		            var h2 = 28;
		            draw_set_halign(fa_right);
		            //Health
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Health, 0, xx-(h1+4), yy-20, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-h2, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		            //AP
		            draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx-(h1-1), yy, "AP", clr1, clr1, clr1, clr1, 1);
		            draw_text_colour(xx-(h2+7), yy, string(action_points), clr1, clr1, clr1, clr1, 1);
		            draw_set_halign(fa_left);
		            //Ammo Supply
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Ammo_Icon,     0, xx+(h1-2), yy-18, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+(h2-2), yy-18, string(ammo_supply), c_white, c_white, c_white, c_white, 1);
		            //Building Supply
		            draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, 0, c_white, 1);
		            draw_sprite_ext(spr_Building_Icon, 0, xx+(h1-2), yy, 1, 1, 0, c_white, 1);
		            draw_text_colour(xx+(h2-2), yy, string(building_supply), c_white, c_white, c_white, c_white, 1);
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
		        draw_text_colour(xx, yy-39, string(unit_type), clr1, clr1, clr1, clr1, 1);
		        if can_be_manned == true {
		            var h1 = 18;
		            var h2 = 28;
		            if is_manned == true {
		                draw_set_halign(fa_right);
		                //Health
		                draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
		                draw_sprite_ext(spr_Health, 0, xx-(h1+4), yy-20, 1, 1, 0, c_white, 1);
		                draw_text_colour(xx-h2, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		                //AP
		                draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
		                draw_text_colour(xx-(h1-1), yy, "AP", clr1, clr1, clr1, clr1, 1);
		                draw_text_colour(xx-(h2+7), yy, string(action_points), clr1, clr1, clr1, clr1, 1);
		                draw_set_halign(fa_left);
		                //Parts Supply
		                draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		                draw_sprite_ext(spr_Building_Icon,     0, xx+(h1-2), yy-18, 1, 1, 0, c_white, 1);
		                draw_text_colour(xx+(h2-2), y-18, string(parts_ammo), c_white, c_white, c_white, c_white, 1);
		                //Ammunition Supply
		                draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, 0, c_white, 1);
		                draw_sprite_ext(spr_Ammo_Icon, 0, xx+(h1-2), yy, 1, 1, 0, c_white, 1);
		                draw_text_colour(xx+(h2-2), yy, string(ammunition_ammo), c_white, c_white, c_white, c_white, 1);
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
		            draw_text_colour(xx, yy-39, string(unit_type), clr1, clr1, clr1, clr1, 1);
		            if can_be_manned == true {
		                var h1 = 18;
		                var h2 = 28;
		                if is_manned == true {
		                    draw_set_halign(fa_right);
		                    //Health
		                    draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
		                    draw_sprite_ext(spr_Health, 0, xx-(h1+4), yy-20, 1, 1, 0, c_white, 1);
		                    draw_text_colour(xx-h2, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		                    //AP
		                    draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
		                    draw_text_colour(xx-(h1-1), yy, "AP", clr1, clr1, clr1, clr1, 1);
		                    draw_text_colour(xx-(h2+7), yy, string(action_points), clr1, clr1, clr1, clr1, 1);
		                    draw_set_halign(fa_left);
		                    //Repair Supply
		                    draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		                    draw_sprite_ext(spr_Building_Icon, 0, xx+h1, yy-18, 1, 1, 0, c_white, 1);
		                    draw_text_colour(xx+h2, yy-18, string(repair_ammo), c_white, c_white, c_white, c_white, 1);
		                    //MG Ammo
		                    draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, 0, c_white, 1);
		                    draw_sprite_ext(spr_MG_Icon, 0, xx+h1, yy, 1, 1, 0, c_white, 1);
		                    draw_text_colour(xx+h2, yy, string(mg_ammo), c_white, c_white, c_white, c_white, 1);
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
		        draw_text_colour(xx, yy-39, string(unit_type), clr1, clr1, clr1, clr1, 1);
		        if can_be_manned == true && alert_display == false {
		            var h1 = 18;
		            var h2 = 28;
		            if is_manned == true {
		                draw_set_halign(fa_right);
		                //Health
		                draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
		                draw_sprite_ext(spr_Health, 0, xx-(h1+4), yy-20, 1, 1, 0, c_white, 1);
		                draw_text_colour(xx-h2, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		                //AP
		                draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
		                draw_text_colour(xx-(h1-1), yy, "AP", clr1, clr1, clr1, clr1, 1);
		                draw_text_colour(xx-(h2+7), yy, string(action_points), clr1, clr1, clr1, clr1, 1);
		                draw_set_halign(fa_left);
		                //TOW Ammo
		                draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		                draw_sprite_ext(spr_Flare_Icon, 0, xx+h1, yy-18, 1, 1, 0, c_white, 1);
		                draw_text_colour(xx+h2, yy-18, string(tow_ammo), c_white, c_white, c_white, c_white, 1);
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
		        draw_text_colour(xx, yy-39, string(unit_type), clr1, clr1, clr1, clr1, 1);
		        if can_be_manned == true {
		            var h1 = 18;
		            var h2 = 28;
		            if is_manned == true {
		                draw_set_halign(fa_right);
		                //Health
		                draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, 0, c_white, 1);
		                draw_sprite_ext(spr_Health, 0, xx-(h1+4), yy-20, 1, 1, 0, c_white, 1);
		                draw_text_colour(xx-h2, yy-18, string(unit_health), c_white, c_white, c_white, c_white, 1);
		                //AP
		                draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, 0, c_white, 1);
		                draw_text_colour(xx-(h1-1), yy, "AP", clr1, clr1, clr1, clr1, 1);
		                draw_text_colour(xx-(h2+7), yy, string(action_points), clr1, clr1, clr1, clr1, 1);
		                draw_set_halign(fa_left);
		                //Mortar Ammo
		                draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy-18, 1, 1, 0, c_white, 1);
		                draw_sprite_ext(spr_Flare_Icon, 0, xx+h1, yy-18, 1, 1, 0, c_white, 1);
		                draw_text_colour(xx+h2, yy-18, string(mortar_ammo), c_white, c_white, c_white, c_white, 1);
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
		                draw_text_colour(x, y-76, "INFANTRY SHIP", c_white, c_white, c_white, c_white, 1);
		                break;
		            case "Engineer":
		                draw_text_colour(x, y-76, "ENGINEER SHIP", c_white, c_white, c_white, c_white, 1);
		                break;
		            case "Tank":
		                draw_text_colour(x, y-76, "ARMOR SHIP", c_white, c_white, c_white, c_white, 1);
		                break;
		            case "BTR":
		                draw_text_colour(x, y-76, "ASSAULT SHIP", c_white, c_white, c_white, c_white, 1);
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
				case "INFANTRY":
					if is_manning == false {
						if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, txt_rot, c_white, 1); }
							else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, txt_rot, c_white, 1); }
						draw_text_transformed_colour(xx, yy+39, string(unit_type), 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
						var h1 = 18;
						var h2 = 28;
						draw_set_halign(fa_right);
						//Health
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Health, 0, xx+(h1+4), yy+20, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+h2, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//AP
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+(h1-1), yy, "AP", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
						draw_text_transformed_colour(xx+(h2+7), yy, string(action_points), 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
						draw_set_halign(fa_left);
						//Rifle Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Rifle_Icon, 0, xx-h1, yy+16, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-h2, yy+18, string(rifle_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//RPG Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_RPG_Icon,   0, xx-h1, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-h2, yy, string(rpg_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//Flare Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Flare_Icon, 0, xx-h1, yy-18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-h2, yy-18, string(flare_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						draw_set_halign(fa_center);
					}
					break;
				case "TANK":
					if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, txt_rot, c_white, 1); }
							else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, txt_rot, c_white, 1); }
					draw_text_transformed_colour(xx, yy+39, string(unit_type), 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
					if is_manning == false {
						var h1 = 18;
						var h2 = 28;
						draw_set_halign(fa_right);
						//Health
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Health, 0, xx+(h1+4), yy+20, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+h2, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//AP
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+(h1-1), yy, "AP", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
						draw_text_transformed_colour(xx+(h2+7), yy, string(action_points), 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
						draw_set_halign(fa_left);
						//Cannon Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Cannon_Icon, 0, xx-h1, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-h2, yy+18, string(cannon_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//MG Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_MG_Icon,     0, xx-h1, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-h2, yy, string(mg_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
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
				case "ENGINEER":
					if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, txt_rot, c_white, 1); }
							else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, txt_rot, c_white, 1); }
					draw_text_transformed_colour(xx, yy+39, string(unit_type), 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
					if is_manning == false {
						var h1 = 18;
						var h2 = 28;
						draw_set_halign(fa_right);
						//Health
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Health, 0, xx+(h1+4), yy+20, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+h2, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//AP
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+(h1-1), yy, "AP", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
						draw_text_transformed_colour(xx+(h2+7), yy, string(action_points), 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
						draw_set_halign(fa_left);
						//Depot 
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Depot_Icon,  0, xx-(h1+8), yy+18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-(h2+8), yy+18, string(depot_supply), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//Repair
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Repair_Icon, 0, xx-(h1+8), yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-(h2+8), yy, string(repair_supply), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//TOW
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_AT_Icon,     0, xx-(h1+8), yy-18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-(h2+8), yy-18, string(tow_supply), 1, 1, txt_rot,c_white, c_white, c_white, c_white, 1);
						//MORTAR
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy-36, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_AA_Icon,     0, xx-(h1+8), yy-36, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(x-(h2+8), yy-36, string(mortar_supply), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
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
				case "BTR":
					if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, txt_rot, c_white, 1); }
							else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, txt_rot, c_white, 1); }
					draw_text_transformed_colour(xx, yy+39, "LAV", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
					if is_manning == false {
						var h1 = 18;
						var h2 = 28;
						draw_set_halign(fa_right);
						//Health
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Health, 0, xx+(h1+4), yy+20, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+h2, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//AP
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+(h1-1), yy, "AP", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
						draw_text_transformed_colour(xx+(h2+7), yy, string(action_points), 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
						draw_set_halign(fa_left);
						//HE Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_HE_Icon, 0, xx-h1, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-h2, yy+18, string(he_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//AP Ammo
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_AP_Icon, 0, xx-h1, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-h2, yy, string(ap_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
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
				case "LOGI": 
					if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, txt_rot, c_white, 1); }
							else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, txt_rot, c_white, 1); }
					draw_text_transformed_colour(xx, yy+39, string(unit_type), 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
					if is_manning == false {
						var h1 = 18;
						var h2 = 28;
						draw_set_halign(fa_right);
						//Health
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Health, 0, xx+(h1+4), yy+20, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+h2, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//AP
						draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx+(h1-1), yy, "AP", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
						draw_text_transformed_colour(xx+(h2+7), yy, string(action_points), 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
						draw_set_halign(fa_left);
						//Ammo Supply
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Ammo_Icon,     0, xx-(h1-2), yy+18, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-(h2-2), yy+18, string(ammo_supply), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
						//Building Supply
						draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, txt_rot, c_white, 1);
						draw_sprite_ext(spr_Building_Icon, 0, xx-(h1-2), yy, 1, 1, txt_rot, c_white, 1);
						draw_text_transformed_colour(xx-(h2-2), yy, string(building_supply), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
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
					if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, txt_rot, c_white, 1); }
							else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, txt_rot, c_white, 1); }
					draw_text_transformed_colour(xx, yy+39, string(unit_type), 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
					if can_be_manned == true {
						var h1 = 18;
						var h2 = 28;
						if is_manned == true {
							draw_set_halign(fa_right);
							//Health
							draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Health, 0, xx+(h1+4), yy+20, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx+h2, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							//AP
							draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx+(h1-1), yy, "AP", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							draw_text_transformed_colour(xx+(h2+7), yy, string(action_points), 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							draw_set_halign(fa_left);
							//Parts Supply
							draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Building_Icon,     0, xx-(h1-2), yy+18, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx-(h2-2), y+18, string(parts_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							//Ammunition Supply
							draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Ammo_Icon, 0, xx-(h1-2), yy, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx-(h2-2), yy, string(ammunition_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
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
						if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, txt_rot, c_white, 1); }
							else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, txt_rot, c_white, 1); }
						draw_text_transformed_colour(xx, yy+39, string(unit_type), 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
						if can_be_manned == true {
							var h1 = 18;
							var h2 = 28;
							if is_manned == true {
							    draw_set_halign(fa_right);
							    //Health
							    draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
							    draw_sprite_ext(spr_Health, 0, xx+(h1+4), yy+20, 1, 1, txt_rot, c_white, 1);
							    draw_text_transformed_colour(xx+h2, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							    //AP
							    draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1,txt_rot, c_white, 1);
							    draw_text_transformed_colour(xx+(h1-1), yy, "AP", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							    draw_text_transformed_colour(xx+(h2+7), yy, string(action_points), 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							    draw_set_halign(fa_left);
							    //Repair Supply
							    draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
							    draw_sprite_ext(spr_Building_Icon, 0, xx-h1, yy+18, 1, 1, txt_rot, c_white, 1);
							    draw_text_transformed_colour(xx-h2, yy+18, string(repair_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							    //MG Ammo
							    draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy, 1, 1, txt_rot, c_white, 1);
							    draw_sprite_ext(spr_MG_Icon, 0, xx-h1, yy, 1, 1, txt_rot, c_white, 1);
							    draw_text_transformed_colour(xx-h2, yy, string(mg_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
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
					if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, txt_rot, c_white, 1); }
							else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, txt_rot, c_white, 1); }
					draw_text_transformed_colour(xx, yy+39, string(unit_type), 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
					if can_be_manned == true && alert_display == false {
						var h1 = 18;
						var h2 = 28;
						if is_manned == true {
							draw_set_halign(fa_right);
							//Health
							draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Health, 0, xx+(h1+4), yy+20, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx+h2, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							//AP
							draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx+(h1-1), yy, "AP", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							draw_text_transformed_colour(xx+(h2+7), yy, string(action_points), 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							draw_set_halign(fa_left);
							//TOW Ammo
							draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Flare_Icon, 0, xx-h1, yy+18, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx-h2, yy+18, string(tow_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
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
					if selected != true { draw_sprite_ext(spr_Label_Border, 0, xx, yy+39, 1, 1, txt_rot, c_white, 1); }
							else { draw_sprite_ext(spr_Label_Border_Green, 0, xx, yy+39, 1, 1, txt_rot, c_white, 1); }
					draw_text_transformed_colour(xx, yy+39, string(unit_type), 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
					if can_be_manned == true {
						var h1 = 18;
						var h2 = 28;
						if is_manned == true {
							draw_set_halign(fa_right);
							//Health
							draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Health, 0, xx+(h1+4), yy+20, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx+h2, yy+18, string(unit_health), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							//AP
							draw_sprite_ext(spr_Stat_Background, 0, xx+26, yy, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx+(h1-1), yy, "AP", 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							draw_text_transformed_colour(xx+(h2+7), yy, string(action_points), 1, 1, txt_rot, clr1, clr1, clr1, clr1, 1);
							draw_set_halign(fa_left);
							//Mortar Ammo
							draw_sprite_ext(spr_Stat_Background, 0, xx-26, yy+18, 1, 1, txt_rot, c_white, 1);
							draw_sprite_ext(spr_Flare_Icon, 0, xx-h1, yy+18, 1, 1, txt_rot, c_white, 1);
							draw_text_transformed_colour(xx-h2, yy+18, string(mortar_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
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
							draw_text_transformed_colour(x, y+76, "INFANTRY SHIP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							break;
						case "Engineer":
							draw_text_transformed_colour(x, y+76, "ENGINEER SHIP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							break;
						case "Tank":
							draw_text_transformed_colour(x, y+76, "ARMOR SHIP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
							break;
						case "BTR":
							draw_text_transformed_colour(x, y+76, "ASSAULT SHIP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
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
