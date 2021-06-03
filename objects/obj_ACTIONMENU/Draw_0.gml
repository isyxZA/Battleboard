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
						//Draw the targeting reticule
			            draw_sprite_ext(spr_Targeting_Reticule_01, 0, global.target_x, global.target_y, 0.5, 0.5, 0, c_white, 1);
			            draw_circle_colour(global.target_x, global.target_y, 4, c_black, c_white, false);
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
				scr_Action_Menu(global.action_menu, array_length(global.action_menu));
				/*
                if repair_tab == false { scr_Action_Menu(global.action_menu, array_length(global.action_menu)); }
                    else { scr_Action_Menu(global.action_repair_menu, array_length(global.action_repair_menu)); }
				*/
            }
                else if global.menu_create == false {
                    if global.nav_menu == true { scr_Action_Menu(global.nav_options, array_length(global.nav_options)); }
                        //else if global.repair_display == true { scr_Repair_Vehicle_Menu(); }
                }
        }
            //If targeting
            else if global.reticule_display == true {
                //Draw the targeting reticule
                //draw_sprite_ext(spr_Targeting_Reticule_01, 0, global.target_x, global.target_y, 0.5, 0.5, 0, c_white, 1);
                //draw_circle_colour(global.target_x, global.target_y, 4, c_black, c_white, false);
                //DRAW THE FIRE/AMMO MENU ACCORDING TO SELECTED AMMO TAB global.ammo_tab
                if global.fire_display == true {
                    //Draw menu according to ammo tab
                    switch global.ammo_tab {
                        case "INF_A":
							//Draw the targeting reticule
			                draw_sprite_ext(spr_Targeting_Reticule_01, 0, global.target_x, global.target_y, 0.5, 0.5, 0, c_white, 1);
			                draw_circle_colour(global.target_x, global.target_y, 4, c_black, c_white, false);
                            scr_Fire_Menu(ia_fire_menu,array_length(ia_fire_menu),global.ammo_tab);
                            break;
						case "INF_B":
							//Draw the targeting reticule
			                draw_sprite_ext(spr_Targeting_Reticule_01, 0, global.target_x, global.target_y, 0.5, 0.5, 0, c_white, 1);
			                draw_circle_colour(global.target_x, global.target_y, 4, c_black, c_white, false);
                            scr_Fire_Menu(ib_fire_menu,array_length(ib_fire_menu),global.ammo_tab);
                            break;
                        case "MBT_A":
							//Draw the targeting reticule
			                draw_sprite_ext(spr_Targeting_Reticule_01, 0, global.target_x, global.target_y, 0.5, 0.5, 0, c_white, 1);
			                draw_circle_colour(global.target_x, global.target_y, 4, c_black, c_white, false);
                            scr_Fire_Menu(ta_fire_menu,array_length(ta_fire_menu),global.ammo_tab);
                            break;
						case "MBT_B":
							//Draw the targeting reticule
			                draw_sprite_ext(spr_Targeting_Reticule_01, 0, global.target_x, global.target_y, 0.5, 0.5, 0, c_white, 1);
			                draw_circle_colour(global.target_x, global.target_y, 4, c_black, c_white, false);
                            scr_Fire_Menu(tb_fire_menu,array_length(tb_fire_menu),global.ammo_tab);
                            break;
                        case "LAC_A":
							//Draw the targeting reticule
			                draw_sprite_ext(spr_Targeting_Reticule_01, 0, global.target_x, global.target_y, 0.5, 0.5, 0, c_white, 1);
			                draw_circle_colour(global.target_x, global.target_y, 4, c_black, c_white, false);
                            scr_Fire_Menu(ea_fire_menu,array_length(ea_fire_menu),global.ammo_tab);
                            break;
						case "LAC_B":
							//Draw the targeting reticule
			                draw_sprite_ext(spr_Targeting_Reticule_01, 0, global.target_x, global.target_y, 0.5, 0.5, 0, c_white, 1);
			                draw_circle_colour(global.target_x, global.target_y, 4, c_black, c_white, false);
                            scr_Fire_Menu(eb_fire_menu,array_length(eb_fire_menu),global.ammo_tab);
                            break;
                        case "LAV_A":
							//Draw the targeting reticule
			                draw_sprite_ext(spr_Targeting_Reticule_01, 0, global.target_x, global.target_y, 0.5, 0.5, 0, c_white, 1);
			                draw_circle_colour(global.target_x, global.target_y, 4, c_black, c_white, false);
                            scr_Fire_Menu(ba_fire_menu,array_length(ba_fire_menu),global.ammo_tab);
                            break;
						case "LAV_B":
							//Draw the targeting reticule
			                draw_sprite_ext(spr_Targeting_Reticule_01, 0, global.target_x, global.target_y, 0.5, 0.5, 0, c_white, 1);
			                draw_circle_colour(global.target_x, global.target_y, 4, c_black, c_white, false);
                            scr_Fire_Menu(bb_fire_menu,array_length(bb_fire_menu),global.ammo_tab);
                            break;
                        case "LOGI_A":
							//Draw the targeting reticule
			                draw_sprite_ext(spr_Targeting_Reticule_01, 0, global.target_x, global.target_y, 0.5, 0.5, 0, c_white, 1);
			                draw_circle_colour(global.target_x, global.target_y, 4, c_black, c_white, false);
                            switch global.resupply_target {
                                case "INF_A":
                                    scr_Fire_Menu(laia_fire_menu, array_length(laia_fire_menu), "LOGIA-INFA");
                                    break;
								case "INF_B":
                                    scr_Fire_Menu(laib_fire_menu, array_length(laib_fire_menu), "LOGIA-INFB");
                                    break;
                                case "MBT_A":
                                    scr_Fire_Menu(lata_fire_menu, array_length(lata_fire_menu), "LOGIA-MBTA");
                                    break;
								case "MBT_B":
                                    scr_Fire_Menu(latb_fire_menu, array_length(latb_fire_menu), "LOGIA-MBTB");
                                    break;
                                case "LAC_A":
                                    scr_Fire_Menu(laea_fire_menu, array_length(laea_fire_menu), "LOGIA-LACA");
                                    break;
								case "LAC_B":
                                    scr_Fire_Menu(laeb_fire_menu, array_length(laeb_fire_menu), "LOGIA-LACB");
                                    break;
                                case "LAV_A":
                                    scr_Fire_Menu(laba_fire_menu, array_length(laba_fire_menu), "LOGIA-LAVA");
                                    break;
								case "LAV_B":
                                    scr_Fire_Menu(labb_fire_menu, array_length(labb_fire_menu), "LOGIA-LAVB");
                                    break;
								case "LOGI_A":
                                    scr_Fire_Menu(lala_fire_menu, array_length(lala_fire_menu), "LOGIA-LOGIA");
                                    break;
								case "LOGI_B":
                                    scr_Fire_Menu(lalb_fire_menu, array_length(lalb_fire_menu), "LOGIA-LOGIB");
                                    break;
                                case "DEPOT":
                                    scr_Fire_Menu(lad_fire_menu, array_length(lad_fire_menu), "LOGIA-DEPOT");
                                    break;
                                case "REPAIR":
                                    scr_Fire_Menu(lar_fire_menu, array_length(lar_fire_menu), "LOGIA-REPAIR");
                                    break;
                                case "TOW":
                                    scr_Fire_Menu(laat_fire_menu, array_length(laat_fire_menu), "LOGIA-TOW");
                                    break;
                                case "MORTAR":
                                    scr_Fire_Menu(lam_fire_menu, array_length(lam_fire_menu), "LOGIA-MORTAR");
                                    break;
                                case "NOONE":
                                    scr_Fire_Menu(l_fire_menu, array_length(l_fire_menu), "LOGIA_A");
                                    break;
								default:
                                    scr_Fire_Menu(l_fire_menu, array_length(l_fire_menu), "LOGIA_A");
                                    break;
                            }
                            break;
						case "LOGI_B":
							//Draw the targeting reticule
			                draw_sprite_ext(spr_Targeting_Reticule_01, 0, global.target_x, global.target_y, 0.5, 0.5, 0, c_white, 1);
			                draw_circle_colour(global.target_x, global.target_y, 4, c_black, c_white, false);
                            switch global.resupply_target {
                                case "INF_A":
                                    scr_Fire_Menu(laia_fire_menu, array_length(laia_fire_menu), "LOGIB-INFA");
                                    break;
								case "INF_B":
                                    scr_Fire_Menu(laib_fire_menu, array_length(laib_fire_menu), "LOGIB-INFB");
                                    break;
                                case "MBT_A":
                                    scr_Fire_Menu(lata_fire_menu, array_length(lata_fire_menu), "LOGIB-MBTA");
                                    break;
								case "MBT_B":
                                    scr_Fire_Menu(latb_fire_menu, array_length(latb_fire_menu), "LOGIB-MBTB");
                                    break;
								case "LAC_B":
                                    scr_Fire_Menu(laeb_fire_menu, array_length(laeb_fire_menu), "LOGIB-LACB");
                                    break;
                                case "LAV_A":
                                    scr_Fire_Menu(laba_fire_menu, array_length(laba_fire_menu), "LOGIB-LAVA");
                                    break;
								case "LAV_B":
                                    scr_Fire_Menu(labb_fire_menu, array_length(labb_fire_menu), "LOGIB-LAVB");
                                    break;
								case "LOGI_A":
                                    scr_Fire_Menu(lbla_fire_menu, array_length(lbla_fire_menu), "LOGIB-LOGIA");
                                    break;
								case "LOGI_B":
                                    scr_Fire_Menu(lbla_fire_menu, array_length(lbla_fire_menu), "LOGIB-LOGIB");
                                    break;
                                case "DEPOT":
                                    scr_Fire_Menu(lbd_fire_menu, array_length(lbd_fire_menu), "LOGIB-DEPOT");
                                    break;
                                case "REPAIR":
                                    scr_Fire_Menu(lbr_fire_menu, array_length(lbr_fire_menu), "LOGIB-REPAIR");
                                    break;
                                case "TOW":
                                    scr_Fire_Menu(laat_fire_menu, array_length(laat_fire_menu), "LOGIB-TOW");
                                    break;
                                case "MORTAR":
                                    scr_Fire_Menu(lam_fire_menu, array_length(lam_fire_menu), "LOGIB-MORTAR");
                                    break;
								case "SQUAD":
                                    scr_Fire_Menu(lbs_fire_menu, array_length(lbs_fire_menu), "LOGIB-SQUAD");
                                    break;
                                case "NOONE":
                                    scr_Fire_Menu(l_fire_menu, array_length(l_fire_menu), "LOGIB_A");
                                    break;
								default:
                                    scr_Fire_Menu(l_fire_menu, array_length(l_fire_menu), "LOGIB_A");
                                    break;
                            }
                            break;
                        case "DEPOT":
							//Draw the targeting reticule
			                draw_sprite_ext(spr_Targeting_Reticule_01, 0, global.target_x, global.target_y, 0.5, 0.5, 0, c_white, 1);
			                draw_circle_colour(global.target_x, global.target_y, 4, c_black, c_white, false);
                            switch global.resupply_target {
                                case "INF_A":
                                    scr_Fire_Menu(laia_fire_menu, array_length(laia_fire_menu), "DEPOT-INFA");
                                    break;
								case "INF_B":
                                    scr_Fire_Menu(laia_fire_menu, array_length(laia_fire_menu), "DEPOT-INFB");
                                    break;
                                case "MBT_A":
                                    scr_Fire_Menu(lata_fire_menu, array_length(lata_fire_menu), "DEPOT-MBTA");
                                    break;
								case "MBT_B":
                                    scr_Fire_Menu(lata_fire_menu, array_length(lata_fire_menu), "DEPOT-MBTB");
                                    break;
                                case "LAC_A":
                                    scr_Fire_Menu(laea_fire_menu, array_length(laea_fire_menu), "DEPOT-LACA");
                                    break;
								case "LAC_B":
                                    scr_Fire_Menu(laeb_fire_menu, array_length(laeb_fire_menu), "DEPOT-LACB");
                                    break;
                                case "LAV_A":
                                    scr_Fire_Menu(laba_fire_menu, array_length(laba_fire_menu), "DEPOT-LAVA");
                                    break;
								case "LAV_B":
                                    scr_Fire_Menu(labb_fire_menu, array_length(labb_fire_menu), "DEPOT-LAVB");
                                    break;
                                case "LOGI_A":
                                    scr_Fire_Menu(lala_fire_menu, array_length(lala_fire_menu), "DEPOT-LOGIA");
                                    break;
								case "LOGI_B":
                                    scr_Fire_Menu(lalb_fire_menu, array_length(lalb_fire_menu), "DEPOT-LOGIB");
                                    break;
                                case "DEPOT":
                                    scr_Fire_Menu(lad_fire_menu, array_length(lad_fire_menu), "DEPOT-DEPOT");
                                    break;
                                case "REPAIR":
                                    scr_Fire_Menu(lar_fire_menu, array_length(lar_fire_menu), "DEPOT-REPAIR");
                                    break;
                                case "TOW":
                                    scr_Fire_Menu(laat_fire_menu, array_length(laat_fire_menu), "DEPOT-TOW");
                                    break;
                                case "MORTAR":
                                    scr_Fire_Menu(lam_fire_menu, array_length(lam_fire_menu), "DEPOT-MORTAR");
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
							//Draw the targeting reticule
			                draw_sprite_ext(spr_Targeting_Reticule_01, 0, global.target_x, global.target_y, 0.5, 0.5, 0, c_white, 1);
			                draw_circle_colour(global.target_x, global.target_y, 4, c_black, c_white, false);
                            scr_Fire_Menu(r_fire_menu, array_length(r_fire_menu), "REPAIR-MG");
                            break;
                        case "TOW":
							//Draw the targeting reticule
			                draw_sprite_ext(spr_Targeting_Reticule_01, 0, global.target_x, global.target_y, 0.5, 0.5, 0, c_white, 1);
			                draw_circle_colour(global.target_x, global.target_y, 4, c_black, c_white, false);
                            scr_Fire_Menu(at_fire_menu,array_length(at_fire_menu), "TOW");
                            break;
                        case "MORTAR":
							//Draw the targeting reticule
			                draw_sprite_ext(spr_Targeting_Reticule_01, 0, global.target_x, global.target_y, 0.5, 0.5, 0, c_white, 1);
			                draw_circle_colour(global.target_x, global.target_y, 4, c_black, c_white, false);
                            scr_Fire_Menu(m_fire_menu, array_length(m_fire_menu), "MORTAR");
                            break;
						case "REPAIR OP":
							//Draw the targeting reticule
			                draw_sprite_ext(spr_Targeting_Reticule_01, 0, x, y, 0.5, 0.5, 0, c_white, 1);
			                //draw_circle_colour(global.target_x, global.target_y, 4, c_black, c_white, false);
							scr_Repair_Vehicle_Menu();
							break;
                        case "SUPPLY SHIP":
							//Draw the targeting reticule
			                draw_sprite_ext(spr_Targeting_Reticule_01, 0, global.target_x, global.target_y, 0.5, 0.5, 0, c_white, 1);
			                draw_circle_colour(global.target_x, global.target_y, 4, c_black, c_white, false);
                            switch global.resupply_target {
                                case "LOGI_A":
                                    scr_Fire_Menu(lala_fire_menu, array_length(lala_fire_menu), "SHIP-LOGIA");
                                    break;
								case "LOGI_B":
                                    scr_Fire_Menu(lalb_fire_menu, array_length(lalb_fire_menu), "SHIP-LOGIB");
                                    break;
                                case "DEPOT":
                                    scr_Fire_Menu(lad_fire_menu, array_length(lad_fire_menu), "SHIP-DEPOT");
                                    break;
                                case "NOONE":
                                    scr_Fire_Menu(l_fire_menu, array_length(l_fire_menu), "SHIP");
                                    break;
								default:
									scr_Fire_Menu(l_fire_menu, array_length(l_fire_menu), "SHIP");
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

