/// @description DRAWING THE ACTION MENUS
if global.my_turn == true || global.waiting == true {
    with obj_Unit_Parent {
        if selected {
            draw_set_font(fnt_16);
            draw_set_colour(c_black); 
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            //Draw lines from the unit to the action/fire menus and the corresponding menu choice
            if global.menu_create == true {
                //If shoot/fire rounds or deploy object is selected from action menu then the menu is removed and a targeting reticule is displayed
                if global.reticule_display == true {
                    if in_queue == false {
                        //Draw line to target and visually show if there is line of sight
                        var sc;
                        if can_shoot == true { sc = make_colour_rgb(0,100,0); } else { sc = make_colour_rgb(139,0,0); }
                        draw_set_alpha(0.5);
                        draw_line_width_colour(x_end-2, y_end  , global.target_x, global.target_y, 1, sc, c_black);
                        draw_line_width_colour(x_end-1, y_end  , global.target_x, global.target_y, 1, sc, c_black);
                        draw_line_width_colour(x_end  , y_end+2, global.target_x, global.target_y, 2, sc, c_black);
                        draw_line_width_colour(x_end  , y_end+1, global.target_x, global.target_y, 2, sc, c_black);
                        draw_line_width_colour(x_end  , y_end  , global.target_x, global.target_y, 2, sc, c_black);
                        draw_line_width_colour(x_end  , y_end-1, global.target_x, global.target_y, 2, sc, c_black);
                        draw_line_width_colour(x_end  , y_end-2, global.target_x, global.target_y, 2, sc, c_black);
                        draw_line_width_colour(x_end+1, y_end  , global.target_x, global.target_y, 1, sc, c_black);
                        draw_line_width_colour(x_end+2, y_end  , global.target_x, global.target_y, 1, sc, c_black);
                        draw_set_alpha(1);
                        draw_circle_colour(x, y, 4, c_black, c_white, false);
                    }
                }
            }
                else if global.menu_create == false {
	                if global.nav_menu == false {
	                    if global.nav_select == false { 
	                        if unit_type == "LANDINGCRAFT" {
	                            var mc;
	                            if can_place == true || can_shoot == true { mc = make_colour_rgb(0,100,0); } else { mc = make_colour_rgb(139,0,0); }
	                            var dir = point_direction(x, y, mx, my);
	                            var xdir = lengthdir_x(20, dir);
	                            var ydir = lengthdir_y(20, dir);
	                            draw_sprite(spr_Dot_Orange, 0, mx, my);
	                            draw_circle_colour(mx, my, 4, c_black, c_white, false);
	                            if can_place == true || can_shoot == true { draw_sprite_ext(spr_Arrowhead_Green, 0, mx-xdir, my-ydir, 1, 1, dir, c_white, 1); }
	                                else { draw_sprite_ext(spr_Arrowhead_Red, 0, mx-xdir, my-ydir, 1, 1, dir, c_white, 1); } 
	                            draw_sprite(spr_Dot_Green, 0, x, y);
	                            draw_circle_colour(x, y, 4, c_black, c_white, false);
	                        }
	                            else { }
	                    }
	                }
                }
        }
            else {
            }
    }
    //DRAW THE ACTION MENU
    if global.waiting == false {
        //If not using targeting reticule
        if global.reticule_display == false {
            if global.menu_create == true {
                //Draw lines to selection for visual confirmation
                if repair_tab == false { scr_Action_Menu(global.action_menu, array_length(global.action_menu)); }
                    else { scr_Action_Menu(global.action_repair_menu, array_length(global.action_repair_menu)); }
            }
                else if global.menu_create == false {
                    if global.nav_menu == true { scr_Action_Menu(global.nav_options, array_length(global.nav_options)); }
                        else if global.repair_display == true { scr_Repair_Vehicle_Menu(); }
                }
        }
            //If not using targeting reticule
            else if global.reticule_display == true {
                //Draw the targeting reticule
                draw_sprite_ext(spr_Targeting_Reticule_01, 0, global.target_x, global.target_y, 0.5, 0.5, 0, c_white, 1);
                draw_circle_colour(global.target_x, global.target_y, 4, c_black, c_white, false);
                //DRAW THE FIRE/AMMO MENU ACCORDING TO SELECTED AMMO TAB global.ammo_tab
                if global.fire_display == true {
                    //Draw menu according to ammo tab
                    switch global.ammo_tab {
                        case "INFANTRY":
                            scr_Fire_Menu(i_fire_menu,array_length(i_fire_menu),global.ammo_tab);
                            break;
                        case "TANK":
                            scr_Fire_Menu(t_fire_menu,array_length(t_fire_menu),global.ammo_tab);
                            break;
                        case "ENGINEER":
                            scr_Fire_Menu(e_fire_menu,array_length(e_fire_menu),global.ammo_tab);
                            break;
                        case "BTR":
                            scr_Fire_Menu(b_fire_menu,array_length(b_fire_menu),global.ammo_tab);
                            break;
                        case "LOGI":
                            switch global.resupply_target {
                                case "INFANTRY":
                                    scr_Fire_Menu(li_fire_menu, array_length(li_fire_menu), "LOGI-INF");
                                    break;
                                case "TANK":
                                    scr_Fire_Menu(lt_fire_menu, array_length(lt_fire_menu), "LOGI-MBT");
                                    break;
                                case "ENGINEER":
                                    scr_Fire_Menu(le_fire_menu, array_length(le_fire_menu), "LOGI-ENG");
                                    break;
                                case "BTR":
                                    scr_Fire_Menu(lb_fire_menu, array_length(lb_fire_menu), "LOGI-LAV");
                                    break;
                                case "LOGI":
                                    scr_Fire_Menu(ll_fire_menu, array_length(ll_fire_menu), "LOGI-LGI");
                                    break;
                                case "DEPOT":
                                    scr_Fire_Menu(ld_fire_menu, array_length(ld_fire_menu), "LOGI-DPT");
                                    break;
                                case "REPAIR":
                                    scr_Fire_Menu(lr_fire_menu, array_length(lr_fire_menu), "LOGI-RPR");
                                    break;
                                case "TOW":
                                    scr_Fire_Menu(lat_fire_menu, array_length(lat_fire_menu), "LOGI-TOW");
                                    break;
                                case "MORTAR":
                                    scr_Fire_Menu(lm_fire_menu, array_length(lm_fire_menu), "LOGI-MTR");
                                    break;
                                case "NOONE":
                                    scr_Fire_Menu(l_fire_menu, array_length(l_fire_menu), "LOGI");
                                    break;
								default:
                                    scr_Fire_Menu(l_fire_menu, array_length(l_fire_menu), "LOGI");
                                    break;
                            }
                            break;
                        case "DEPOT":
                            switch global.resupply_target {
                                case "INFANTRY":
                                    scr_Fire_Menu(li_fire_menu, array_length(li_fire_menu), "DEPOT-INF");
                                    break;
                                case "TANK":
                                    scr_Fire_Menu(lt_fire_menu, array_length(lt_fire_menu), "DEPOT-MBT");
                                    break;
                                case "ENGINEER":
                                    scr_Fire_Menu(le_fire_menu, array_length(le_fire_menu), "DEPOT-ENG");
                                    break;
                                case "BTR":
                                    scr_Fire_Menu(lb_fire_menu, array_length(lb_fire_menu), "DEPOT-LAV");
                                    break;
                                case "LOGI":
                                    scr_Fire_Menu(ll_fire_menu, array_length(ll_fire_menu), "DEPOT-LGI");
                                    break;
                                case "DEPOT":
                                    scr_Fire_Menu(ld_fire_menu, array_length(ld_fire_menu), "DEPOT-DPT");
                                    break;
                                case "REPAIR":
                                    scr_Fire_Menu(lr_fire_menu, array_length(lr_fire_menu), "DEPOT-RPR");
                                    break;
                                case "TOW":
                                    scr_Fire_Menu(lat_fire_menu, array_length(lat_fire_menu), "DEPOT-TOW");
                                    break;
                                case "MORTAR":
                                    scr_Fire_Menu(lm_fire_menu, array_length(lm_fire_menu), "DEPOT-MTR");
                                    break;
                                case "NOONE":
                                    scr_Fire_Menu(l_fire_menu, array_length(l_fire_menu), "DEPOT");
                                    break;
								default:
                                    scr_Fire_Menu(l_fire_menu, array_length(l_fire_menu), "DEPOT");
                                    break;
                            }
                            break;
                        case "REPAIR":
                            scr_Fire_Menu(r_fire_menu, array_length(r_fire_menu), "REPAIR-MG");
                            break;
                        case "TOW":
                            scr_Fire_Menu(at_fire_menu,array_length(at_fire_menu), "TOW");
                            break;
                        case "MORTAR":
                            scr_Fire_Menu(m_fire_menu, array_length(m_fire_menu), "MORTAR");
                            break;
                        case "SUPPLY SHIP":
                            switch global.resupply_target {
                                case "LOGI":
                                    scr_Fire_Menu(ll_fire_menu, array_length(ll_fire_menu), "SHIP-LGI");
                                    break;
                                case "DEPOT":
                                    scr_Fire_Menu(ld_fire_menu, array_length(ld_fire_menu), "SHIP-DPT");
                                    break;
                                case "NOONE":
                                    scr_Fire_Menu(l_fire_menu, array_length(l_fire_menu), "SUPPLY SHIP");
                                    break;
								default:
									scr_Fire_Menu(l_fire_menu, array_length(l_fire_menu), "SUPPLY SHIP");
									break;
                            }
                            break;
                        default:
                            break;
                    }
                    if display_menuinfo == true { 
                        //Display information box
                        if global.display_info == true {
							if p_one == true {
	                            draw_set_colour(t_colour);
	                            draw_set_alpha(0.9);
	                            draw_rectangle(mouse_x-328, mouse_y-108, mouse_x-32, mouse_y-40, false);
	                            draw_set_colour(c_dkgray);
	                            draw_set_alpha(1);
	                            draw_set_font(fnt_12);
	                            draw_text_colour(mouse_x-180, mouse_y-100, "Action Menu:", c_black, c_black, c_black, c_black, 1);
	                            draw_text_colour(mouse_x-180, mouse_y-84 , "Mouse wheel scroll to set amount.", c_black, c_black, c_black, c_black, 1);
	                            draw_text_colour(mouse_x-180, mouse_y-68 , "Left click to confirm.", c_black, c_black, c_black, c_black, 1);
	                            draw_text_colour(mouse_x-180, mouse_y-52 , "Shift+Left click to continue targeting.", c_black, c_black, c_black, c_black, 1);
	                            draw_set_font(fnt_16);
							}
								else {
									draw_set_colour(t_colour);
		                            draw_set_alpha(0.9);
		                            draw_rectangle(mouse_x+328, mouse_y+108, mouse_x+32, mouse_y+40, false);
		                            draw_set_colour(c_dkgray);
		                            draw_set_alpha(1);
		                            draw_set_font(fnt_12);
		                            draw_text_transformed_colour(mouse_x+180, mouse_y+100, "Action Menu:", 1, 1, txt_rot, c_black, c_black, c_black, c_black, 1);
		                            draw_text_transformed_colour(mouse_x+180, mouse_y+84 , "Mouse wheel scroll to set amount.", 1, 1, txt_rot, c_black, c_black, c_black, c_black, 1);
		                            draw_text_transformed_colour(mouse_x+180, mouse_y+68 , "Left click to confirm.", 1, 1, txt_rot, c_black, c_black, c_black, c_black, 1);
		                            draw_text_transformed_colour(mouse_x+180, mouse_y+52 , "Shift+Left click to continue targeting.", 1, 1, txt_rot, c_black, c_black, c_black, c_black, 1);
		                            draw_set_font(fnt_16);
								}
                        }
                    }
                        else if display_tabinfo == true {
                            //Display information box
                            if global.display_info == true {
								if p_one == true {
	                                draw_set_colour(t_colour);
	                                draw_set_alpha(0.9);
	                                draw_rectangle(mouse_x-248, mouse_y-76, mouse_x-32, mouse_y-40, false);
	                                draw_set_colour(c_dkgray);
	                                draw_set_alpha(1);
	                                draw_set_font(fnt_12);
	                                draw_text_colour(mouse_x-140, mouse_y-68, "Action Menu:", c_black, c_black, c_black, c_black, 1);
	                                draw_text_colour(mouse_x-140, mouse_y-52, "Left click to switch unit type.", c_black, c_black, c_black, c_black, 1);
	                                draw_set_font(fnt_16);
								}
									else {
										draw_set_colour(t_colour);
		                                draw_set_alpha(0.9);
		                                draw_rectangle(mouse_x+248, mouse_y+76, mouse_x+32, mouse_y+40, false);
		                                draw_set_colour(c_dkgray);
		                                draw_set_alpha(1);
		                                draw_set_font(fnt_12);
		                                draw_text_transformed_colour(mouse_x+140, mouse_y+68, "Action Menu:", 1, 1, txt_rot, c_black, c_black, c_black, c_black, 1);
		                                draw_text_transformed_colour(mouse_x+140, mouse_y+52, "Left click to switch unit type.", 1, 1, txt_rot, c_black, c_black, c_black, c_black, 1);
		                                draw_set_font(fnt_16);
									}
                            }
                        }
                }
            }
        }
}

draw_set_font(fnt_12);
draw_set_colour(c_black); 
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(1);

