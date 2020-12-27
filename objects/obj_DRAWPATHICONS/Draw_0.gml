if global.my_turn == true || global.waiting == true {
    if !ds_list_empty(global.myunit_list) {
        var i;
        for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
	        var unit = ds_list_find_value(global.myunit_list, i);
	        with unit {
		        if selected {
		            if global.nav_select == true {
		                //Draw the unit path
		                var p1;
		                for(p1=1; p1<path_get_number(my_path); p1+=1){
		                    var x1 = path_get_point_x(my_path, p1-1);
		                    var y1 = path_get_point_y(my_path, p1-1);
		                    var x2 = path_get_point_x(my_path, p1);
		                    var y2 = path_get_point_y(my_path, p1);
							var r;
							if p_one == true { r = point_direction(x1, y1, x2, y2)-90; }
								else { r = point_direction(x1, y1, x2, y2)+90; }
							gpu_set_blendmode(bm_subtract);
		                    switch unit_type {
		                        case "INF_A":
								case "INF_B":
		                        case "MORTAR":
		                        case "TOW":
		                        case "REPAIR":
		                        case "DEPOT":
		                            draw_sprite_ext(my_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
		                            break;
		                        case "MBT_A":
								case "MBT_B":
		                            draw_sprite_ext(my_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
		                            break;
		                        case "LAC_A":
									draw_sprite_ext(my_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
		                            break;
								case "LAC_B":
		                            draw_sprite_ext(my_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
		                            break;
		                        case "LOGI_A":
								case "LOGI_B":
		                            draw_sprite_ext(my_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
		                            break;
		                        case "LAV_A":
								case "LAV_B":
		                            draw_sprite_ext(my_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
		                            break;
		                        default:
		                            draw_sprite_ext(spr_Arrow_Sml, 0, x1, y1, 0.6, 0.6, r, c_black, 0.6);
		                            break;
		                    }
							gpu_set_blendmode(bm_normal);
		                }
		            }
		                //If selected and not selecting a path
		                else if global.nav_select == false {
		                    //Nav menu is up (CONFIRM, CANCEL)
		                    if global.nav_menu == true {
		                        //Draw the unit path
		                        var p1;
		                        for(p1=1; p1<path_get_number(my_path); p1+=1){
		                            var x1 = path_get_point_x(my_path, p1-1);
		                            var y1 = path_get_point_y(my_path, p1-1);
		                            var x2 = path_get_point_x(my_path, p1);
		                            var y2 = path_get_point_y(my_path, p1);
		                            var r;
									if p_one == true { r = point_direction(x1, y1, x2, y2)-90; }
										else { r = point_direction(x1, y1, x2, y2)+90; }
									gpu_set_blendmode(bm_subtract);
		                            switch unit_type {
		                                case "INF_A":
										case "INF_B":
				                        case "MORTAR":
				                        case "TOW":
				                        case "REPAIR":
				                        case "DEPOT":
				                            draw_sprite_ext(my_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
				                            break;
				                        case "MBT_A":
										case "MBT_B":
				                            draw_sprite_ext(my_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
				                            break;
				                        case "LAC_A":
				                            draw_sprite_ext(my_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
				                            break;
										case "LAC_B":
				                            draw_sprite_ext(my_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
				                            break;
				                        case "LOGI_A":
										case "LOGI_B":
				                            draw_sprite_ext(my_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
				                            break;
				                        case "LAV_A":
										case "LAV_B":
				                            draw_sprite_ext(my_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
				                            break;
				                        default:
				                            draw_sprite_ext(spr_Arrow_Sml, 0, x1, y1, 0.6, 0.6, r, c_black, 0.6);
				                            break;
		                            }
									gpu_set_blendmode(bm_normal);
		                        }
		                    }
		                }
		        }
		            //If the unit is not currently selected
		            else {
		                if nav_confirmed == true {
		                    if point_count < path_get_number(my_path) {
		                    }
		                    //Draw the path as the unit moves along it
		                    var p;
		                    for(p=1; p<path_get_number(my_path); p+=1){
		                        if p > point_count && p < path_get_number(my_path) {
		                            var x1 = path_get_point_x(my_path, p-1);
		                            var y1 = path_get_point_y(my_path, p-1);
		                            var x2 = path_get_point_x(my_path, p);
		                            var y2 = path_get_point_y(my_path, p);
									var r;
									if p_one == true { r = point_direction(x1, y1, x2, y2)-90; }
										else { r = point_direction(x1, y1, x2, y2)+90; }
									gpu_set_blendmode(bm_subtract);
		                            switch unit_type {
		                                case "INF_A":
										case "INF_B":
				                        case "MORTAR":
				                        case "TOW":
				                        case "REPAIR":
				                        case "DEPOT":
				                            draw_sprite_ext(my_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
				                            break;
				                        case "MBT_A":
										case "MBT_B":
				                            draw_sprite_ext(my_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
				                            break;
				                        case "LAC_A":
				                            draw_sprite_ext(my_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
				                            break;
										case "LAC_B":
				                            draw_sprite_ext(my_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
				                            break;
				                        case "LOGI_A":
										case "LOGI_B":
				                            draw_sprite_ext(my_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
				                            break;
				                        case "LAV_A":
										case "LAV_B":
				                            draw_sprite_ext(my_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
				                            break;
				                        default:
				                            draw_sprite_ext(spr_Arrow_Sml, 0, x1, y1, 0.6, 0.6, r, c_black, 0.6);
				                            break;
		                            }
									gpu_set_blendmode(bm_normal);
		                        }
		                    }
		                    switch unit_type {
		                        case "INF_A":
								case "INF_B":
		                        case "MORTAR":
		                        case "TOW":
		                        case "REPAIR":
		                        case "DEPOT":
		                            draw_sprite_ext(my_sprite, 0, x, y, 0.7, 0.7, rot, c_white, 1);
		                            break;
		                        case "MBT_A":
								case "MBT_B":
		                            draw_sprite_ext(my_icon, 0, x, y, 0.7, 0.7, rot, c_white, 1);
		                            break;
		                        case "LAC_A":
		                            draw_sprite_ext(my_sprite, 0, x, y, 0.7, 0.7, rot, c_white, 1);
		                            break;
								case "LAC_B":
		                            draw_sprite_ext(my_icon, 0, x, y, 0.6, 0.6, rot, c_white, 1);
		                            break;
		                        case "LOGI_A":
								case "LOGI_B":
		                            draw_sprite_ext(my_sprite, 0, x, y, 0.7, 0.7, rot, c_white, 1);
		                            break;
		                        case "LAV_A":
								case "LAV_B":
		                            draw_sprite_ext(my_icon, 0, x, y, 0.7, 0.7, rot, c_white, 1);
		                            break;
		                        default:
		                            draw_sprite_ext(spr_Arrow_Sml, 0, x, y, 0.7, 0.7, rot, c_white, 1);
		                            break;
		                    } 
		                }
		            }
            }
        }
    }
   draw_set_alpha(1); 
}
    else {
        if global.opponent_turn == true || global.enemy_waiting == true {
            if !ds_list_empty(global.enemyunit_list) {
                var i;
                for (i=0; i<ds_list_size(global.enemyunit_list); i+=1) {
                    var unit = ds_list_find_value(global.enemyunit_list, i);
                    with unit {
                        if is_visible == true {
                            if nav_confirmed == true {
                                if point_count < path_get_number(my_path) {
                                }
                                //Draw the path as the unit moves along it
                                var p;
                                for(p=1; p<path_get_number(my_path); p+=1){
                                    if p > point_count && p < path_get_number(my_path) {
                                        var x1 = path_get_point_x(my_path, p-1);
                                        var y1 = path_get_point_y(my_path, p-1);
                                        var x2 = path_get_point_x(my_path, p);
                                        var y2 = path_get_point_y(my_path, p);
										var r;
										if p_one == true { r = point_direction(x1, y1, x2, y2)+90; }
											else { r = point_direction(x1, y1, x2, y2)-90; }
										gpu_set_blendmode(bm_subtract);
                                        switch unit_type {
                                            case "E_INFA":
											case "E_INFB":
                                            case "E_MORTAR":
                                            case "E_TOW":
                                            case "E_REPAIR":
                                            case "E_DEPOT":
                                                draw_sprite_ext(spot_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
                                                break;
                                            case "E_MBTA":
											case "E_MBTB":
                                                draw_sprite_ext(spot_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
                                                break;
                                            case "E_LACA":
                                                draw_sprite_ext(spot_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
                                                break;
											case "E_LACB":
                                                draw_sprite_ext(spot_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
                                                break;
                                            case "E_LOGIA":
											case "E_LOGIB":
                                                draw_sprite_ext(spot_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
                                                break;
                                            case "E_LAVA":
											case "E_LAVB":
                                                draw_sprite_ext(spot_mask, 0, x1, y1, 0.6, 0.6, r, c_white, 0.6);
                                                break;
                                            default:
                                                draw_sprite_ext(spr_Arrow_Sml_02, 0, x1, y1, 0.6, 0.6, r, c_black, 0.6);
                                                break;
                                        }
										gpu_set_blendmode(bm_normal);
                                    }
                                }
                                switch unit_type {
                                    case "E_INFA":
									case "E_INFB":
                                    case "E_MORTAR":
                                    case "E_TOW":
                                    case "E_REPAIR":
                                    case "E_DEPOT":
                                        draw_sprite_ext(my_sprite, 0, x, y, 0.7, 0.7, rot, c_white, 1);
                                        break;
                                    case "E_MBTA":
									case "E_MBTB":
                                        draw_sprite_ext(my_icon, 0, x, y, 0.7, 0.7, rot, c_white, 1);
                                        break;
                                    case "E_LACA":
                                        draw_sprite_ext(my_sprite, 0, x, y, 0.7, 0.7, rot, c_white, 1);
                                        break;
									case "E_LACB":
	                                    draw_sprite_ext(my_icon, 0, x, y, 0.6, 0.6, rot, c_white, 1);
	                                    break;
                                    case "E_LOGIA":
									case "E_LOGIB":
                                        draw_sprite_ext(my_sprite, 0, x, y, 0.7, 0.7, rot, c_white, 1);
                                        break;
                                    case "E_LAVA":
									case "E_LAVB":
                                        draw_sprite_ext(my_icon, 0, x, y, 0.7, 0.7, rot, c_white, 1);
                                        break;
                                    default:
                                        draw_sprite_ext(spr_Moving_02, 0, x, y, 0.7, 0.7, rot, c_white, 1);
                                        break;
                                }
                            }
                        }
                    }
                }
            }
        }
        draw_set_alpha(1);
    }

