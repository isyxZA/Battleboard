if (x_final == x_end) && (y_final == y_end) { nav_split = false; }
    else { nav_split = true; }

my_path_pos = round(path_get_length(my_path)-(path_get_length(my_path)*path_position)); 

if selected { 
    if (global.nav_select == true) || (global.nav_menu == true) {
        if line_alpha >= 0.95 { fade_switch = true; }
            else if line_alpha <= 0.35 { fade_switch = false; }
        if fade_switch == true { line_alpha = lerp(line_alpha, 0, 0.025); } 
            else if fade_switch == false { line_alpha = lerp(line_alpha, 1, 0.025); }
    }
    if global.reticule_display == true {
        target_x = global.target_x;
        target_y = global.target_y;
    }
} 

if anim_select == true { 
    if anim_select_count < anim_select_timer { 
        if selected { scl = ease_out_quad(anim_select_count, 1.2, -0.2, anim_select_timer);  }
            else { scl = ease_out_quad(anim_select_count, 0.8, 0.2, anim_select_timer); }
        anim_select_count ++; 
        if anim_select_count == anim_select_timer { anim_select = false; anim_select_count = 0; }
    }
}

if is_manning == false {
	if !ds_list_empty(global.myunit_list) {
		//If assigned to man a static unit
		var depot = instance_place(x_final, y_final, obj_Depot_Static);
		var repair = instance_place(x_final, y_final, obj_Repair_Static);
		var tow = instance_place(x_final, y_final, obj_TOW_Static);
		var mortar = instance_place(x_final, y_final, obj_Mortar_Static);
		if depot != noone { 
		    is_manning = true; 
			manned_unit = depot.id;
		    depot.is_manned = true;
			depot.active = true;
			depot.can_be_selected = false;
		    depot.alarm[9] = 200;
		    depot.alert_display = false;
		    depot.alert_text = "No Alert";
		    depot.alert_colour = c_green;
		    depot.action_points = action_points;
		    depot.move_points = move_points;
		    depot.rifle_ammo = rifle_ammo;
		    depot.rpg_ammo = rpg_ammo;
		    depot.flare_ammo = flare_ammo;
		    if my_squad != "NOONE" {
		        switch my_squad {
		            case "ALPHA":
		                ds_list_delete(global.squad_alpha, ds_list_find_index(global.squad_alpha, id));
		                my_squad = "NOONE";
		                depot.my_squad = "ALPHA";
		                ds_list_add(global.squad_alpha, depot.id);
		                break;
		            case "BRAVO":
		                ds_list_delete(global.squad_bravo, ds_list_find_index(global.squad_bravo, id));
		                my_squad = "NOONE";
		                depot.my_squad = "BRAVO";
		                ds_list_add(global.squad_bravo, depot.id);
		                break;
		            case "CHARLIE":
		                ds_list_delete(global.squad_charlie, ds_list_find_index(global.squad_charlie, id));
		                my_squad = "NOONE";
		                depot.my_squad = "CHARLIE";
		                ds_list_add(global.squad_charlie, depot.id);
		                break;
		            case "DELTA":
		                ds_list_delete(global.squad_delta, ds_list_find_index(global.squad_delta, id));
		                my_squad = "NOONE";
		                depot.my_squad = "DELTA";
		                ds_list_add(global.squad_delta, depot.id);
		                break;
		            case "ECHO":
		                ds_list_delete(global.squad_echo, ds_list_find_index(global.squad_echo, id));
		                my_squad = "NOONE";
		                depot.my_squad = "ECHO";
		                ds_list_add(global.squad_echo, depot.id);
		                break;
		        }
		    }
		}
		    else if repair != noone { 
		        is_manning = true; 
				manned_unit = repair.id;
		        repair.is_manned = true;
				repair.active = true;
				repair.can_be_selected = false;
		        repair.alarm[9] = 200;
		        repair.alert_display = false;
		        repair.alert_text = "No Alert";
		        repair.alert_colour = c_green;
		        repair.move_points = move_points;
		        repair.action_points = action_points;
		        repair.rifle_ammo = rifle_ammo;
		        repair.rpg_ammo = rpg_ammo;
		        repair.flare_ammo = flare_ammo;
		        if my_squad != "NOONE" {
		            switch my_squad {
		                case "ALPHA":
		                    ds_list_delete(global.squad_alpha, ds_list_find_index(global.squad_alpha, id));
		                    my_squad = "NOONE";
		                    repair.my_squad = "ALPHA";
		                    ds_list_add(global.squad_alpha, repair.id);
		                    break;
		                case "BRAVO":
		                    ds_list_delete(global.squad_bravo, ds_list_find_index(global.squad_bravo, id));
		                    my_squad = "NOONE";
		                    repair.my_squad = "BRAVO";
		                    ds_list_add(global.squad_bravo, repair.id);
		                    break;
		                case "CHARLIE":
		                    ds_list_delete(global.squad_charlie, ds_list_find_index(global.squad_charlie, id));
		                    my_squad = "NOONE";
		                    repair.my_squad = "CHARLIE";
		                    ds_list_add(global.squad_charlie, repair.id);
		                    break;
		                case "DELTA":
		                    ds_list_delete(global.squad_delta, ds_list_find_index(global.squad_delta, id));
		                    my_squad = "NOONE";
		                    repair.my_squad = "DELTA";
		                    ds_list_add(global.squad_delta, repair.id);
		                    break;
		                case "ECHO":
		                    ds_list_delete(global.squad_echo, ds_list_find_index(global.squad_echo, id));
		                    my_squad = "NOONE";
		                    repair.my_squad = "ECHO";
		                    ds_list_add(global.squad_echo, repair.id);
		                    break;
		            }
		        }
		    }
		        else if tow != noone { 
		            is_manning = true; 
					manned_unit = tow.id;
		            tow.is_manned = true;
					tow.active = true;
					tow.can_be_selected = false;
		            tow.alarm[9] = 200;
		            tow.alert_display = false;
		            tow.alert_text = "No Alert";
		            tow.alert_colour = c_green;
		            tow.action_points = action_points;
		            tow.move_points = move_points;
		            tow.rifle_ammo = rifle_ammo;
		            tow.rpg_ammo = rpg_ammo;
		            tow.flare_ammo = flare_ammo;
		            if my_squad != "NOONE" {
		                switch my_squad {
		                    case "ALPHA":
		                        ds_list_delete(global.squad_alpha, ds_list_find_index(global.squad_alpha, id));
		                        my_squad = "NOONE";
		                        tow.my_squad = "ALPHA";
		                        ds_list_add(global.squad_alpha, tow.id);
		                        break;
		                    case "BRAVO":
		                        ds_list_delete(global.squad_bravo, ds_list_find_index(global.squad_bravo, id));
		                        my_squad = "NOONE";
		                        tow.my_squad = "BRAVO";
		                        ds_list_add(global.squad_bravo, tow.id);
		                        break;
		                    case "CHARLIE":
		                        ds_list_delete(global.squad_charlie, ds_list_find_index(global.squad_charlie, id));
		                        my_squad = "NOONE";
		                        tow.my_squad = "CHARLIE";
		                        ds_list_add(global.squad_charlie, tow.id);
		                        break;
		                    case "DELTA":
		                        ds_list_delete(global.squad_delta, ds_list_find_index(global.squad_delta, id));
		                        my_squad = "NOONE";
		                        tow.my_squad = "DELTA";
		                        ds_list_add(global.squad_delta, tow.id);
		                        break;
		                    case "ECHO":
		                        ds_list_delete(global.squad_echo, ds_list_find_index(global.squad_echo, id));
		                        my_squad = "NOONE";
		                        tow.my_squad = "ECHO";
		                        ds_list_add(global.squad_echo, tow.id);
		                        break;
		                }
		            }
		        }
		            else if mortar != noone { 
		                is_manning = true;
						manned_unit = mortar.id;
		                mortar.is_manned = true; 
						mortar.active = true;
						mortar.can_be_selected = false;
		                mortar.alarm[9] = 200;
		                mortar.alert_display = false;
		                mortar.alert_text = "No Alert";
		                mortar.alert_colour = c_green;
		                mortar.action_points = action_points;
		                mortar.move_points = move_points;
		                mortar.rifle_ammo = rifle_ammo;
		                mortar.rpg_ammo = rpg_ammo;
		                mortar.flare_ammo = flare_ammo;
		                if my_squad != "NOONE" {
		                    switch my_squad {
		                        case "ALPHA":
		                            ds_list_delete(global.squad_alpha, ds_list_find_index(global.squad_alpha, id));
		                            my_squad = "NOONE";
		                            mortar.my_squad = "ALPHA";
		                            ds_list_add(global.squad_alpha, mortar.id);
		                            break;
		                        case "BRAVO":
		                            ds_list_delete(global.squad_bravo, ds_list_find_index(global.squad_bravo, id));
		                            my_squad = "NOONE";
		                            mortar.my_squad = "BRAVO";
		                            ds_list_add(global.squad_bravo, mortar.id);
		                            break;
		                        case "CHARLIE":
		                            ds_list_delete(global.squad_charlie, ds_list_find_index(global.squad_charlie, id));
		                            my_squad = "NOONE";
		                            mortar.my_squad = "CHARLIE";
		                            ds_list_add(global.squad_charlie, mortar.id);
		                            break;
		                        case "DELTA":
		                            ds_list_delete(global.squad_delta, ds_list_find_index(global.squad_delta, id));
		                            my_squad = "NOONE";
		                            mortar.my_squad = "DELTA";
		                            ds_list_add(global.squad_delta, mortar.id);
		                            break;
		                        case "ECHO":
		                            ds_list_delete(global.squad_echo, ds_list_find_index(global.squad_echo, id));
		                            my_squad = "NOONE";
		                            mortar.my_squad = "ECHO";
		                            ds_list_add(global.squad_echo, mortar.id);
		                            break;
		                    }
		                }
		            }
		                else { is_manning = false; }
	}
}







