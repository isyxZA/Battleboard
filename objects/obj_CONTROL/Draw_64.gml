///Draw UI to surface
if global.game_state == "IN_GAME" && game_over == false {
    if global.game_turn != 0 {
        //Top UI\\
        if surface_exists(ui_topsurf) {
            surface_set_target(ui_topsurf);
			
            draw_clear_alpha(c_black, 1);
			draw_sprite_ext(spr_UI_Bg1, 0, 0, 0, 1, 1, 0, c_white, 1);
            //Top labels
            draw_set_font(fnt_24);
            draw_text_colour(ui_midx, ty_1, string(display_txt), c_silver, my_colour, my_colour, my_colour, 1);
			//Objectives captured or lost
			var ot;
			for(ot=0; ot<objective_amount; ot++) { 
				draw_sprite(spr_Objective_Silver, 0, (ui_midx-200)-(ot*44), ty_1);
				draw_sprite(spr_Objective_Silver, 0, (ui_midx+200)+(ot*44), ty_1);
			}
			var oc;
			for(oc=0; oc<objectives_controlled; oc++) { 
				draw_sprite(spr_Objective_Gold, 0, (ui_midx-200)-(oc*44), ty_1);
			}
			var ol;
			for(ol=0; ol<objectives_lost; ol++) { 
				draw_sprite(spr_Objective_Red, 0, (ui_midx+200)+(ol*44), ty_1);
			}
			draw_set_font(fnt_16);
            //Action points label
            if global.temp_AP == 0 { draw_text_colour(ui_lx, ty_1+8, "Action Points", c_silver, c_silver, c_silver, c_silver, 1); }
                //Draw AP Cost Alert
                else if global.temp_AP != 0 { 
					var ca = make_colour_rgb(153,25,0);
                    draw_text_colour(ui_lx, ty_1+8, "AP Cost:  " + string(global.temp_AP), c_silver, ca, ca, ca, 1);
                }
            //Turn timer and control label
            draw_text_colour(ui_rx, ty_1+8, "Turn Control", c_silver, c_silver, c_silver, c_silver, 1);
			//Intel label
            //Draw ERROR alerts 
            if targeting_error == true {
                draw_set_font(fnt_18);
				draw_text_colour(ui_midx, ty_2, "TARGETING ERROR!", c_silver, c_red, c_red, c_red, 1);
            }
               else if navigation_error == true {
                    draw_set_font(fnt_18);
					draw_text_colour(ui_midx, ty_2, "CALCULATING NAVIGATION!", c_silver, c_red, c_red, c_red, 1);
                }
                    else if friendly_fire == true {
                        draw_set_font(fnt_18);
						draw_text_colour(ui_midx, ty_2, "FRIENDLY FIRE!", c_silver, c_red, c_red, c_red, 1);
                    }
						else if squad_intel == false  {
							draw_set_font(fnt_12);
							draw_text_colour(ui_midx, ty_2, "---  " + "Intel" + "  ---", c_silver, c_silver, c_silver, c_silver, 1);
						}
            //Draw turn timer and end turn button
            if draw_endturn == false && turn_timer != 99 { 
                var t = (turn_timer - timer_count);
                draw_set_font(fnt_30);
                draw_text_colour(ui_rx, ty_0+12, string(t), c_silver, c_silver, c_silver, c_silver, 1); 
            }
                else { 
					if global.my_turn == true {
	                    if draw_endturn == false {
	                        draw_set_font(fnt_48);
	                        draw_text_colour(ui_rx, ty_0+8, ">", make_colour_rgb(169,169,169), c_orange, c_black, c_orange, 1);
	                    }  
	                        else {
	                            draw_set_font(fnt_64);
	                            draw_text_colour(ui_rx, ty_0+8, ">", make_colour_rgb(169,169,169), c_orange, c_black, c_orange, 1);
	                        }
					}
						else { 
							draw_set_font(fnt_30);
							draw_text_colour(ui_rx, ty_0+8, "--", c_silver, c_silver, c_silver, c_silver, 1); 
						}
                }
            //Cost Alerts
            draw_set_font(fnt_30);
            if draw_apcost == true { draw_text_colour(ui_lx, ty_0+12, "-" + string(ap_cost), c_silver, c_red, c_red, c_red, 1); }
                else if draw_apcost == false{ 
                    if draw_apreturn == true {
                        draw_text_colour(ui_lx, ty_0+12, "+" + string(global.ap_return), c_silver, c_green, c_green, c_green, 1); 
                    }
                        else { 
                            var tap = "";
                            if global.my_turn == true { tap = string(global.turn_AP); } else { tap = "--"; }
                            draw_text_colour(ui_lx, ty_0+12, tap, c_silver, c_silver, c_silver, c_silver, 1); 
                        }
                }
            draw_set_font(fnt_16);
            //Draw turn list
			if ins_1_count == 0 { draw_sprite_ext(spr_Arrowhead_White, 0, ix_1, ty_0, 0.55, 0.65, ins_rot, c_white, 1); }
				else { draw_sprite_ext(spr_Arrowhead_Red, 0, ix_1, ty_0, 0.55, 0.65, 0, c_white, 1); }
            if ins_2_count == 0 { draw_sprite_ext(spr_Arrowhead_White, 0, ix_2, ty_0, 0.55, 0.65, ins_rot, c_white, 1); }
				else { draw_sprite_ext(spr_Arrowhead_Red, 0, ix_2, ty_0, 0.55, 0.65, 0, c_white, 1); }
            if ins_3_count == 0 { draw_sprite_ext(spr_Arrowhead_White, 0, ix_3, ty_0, 0.55, 0.65, ins_rot, c_white, 1); }
				else { draw_sprite_ext(spr_Arrowhead_Red, 0, ix_3, ty_0, 0.55, 0.65, 0, c_white, 1); }
            if ins_4_count == 0 { draw_sprite_ext(spr_Arrowhead_White, 0, ix_4, ty_0, 0.55, 0.65, ins_rot, c_white, 1); }
				else { draw_sprite_ext(spr_Arrowhead_Red, 0, ix_4, ty_0, 0.55, 0.65, 0, c_white, 1); }
            if ins_5_count == 0 { draw_sprite_ext(spr_Arrowhead_White, 0, ix_5, ty_0, 0.55, 0.65, ins_rot, c_white, 1); }
				else { draw_sprite_ext(spr_Arrowhead_Red, 0, ix_5, ty_0, 0.55, 0.65, 0, c_white, 1); }
            if ins_6_count == 0 { draw_sprite_ext(spr_Arrowhead_White, 0, ix_6, ty_0, 0.55, 0.65, ins_rot, c_white, 1); }
				else { draw_sprite_ext(spr_Arrowhead_Red, 0, ix_6, ty_0, 0.55, 0.65, 0, c_white, 1); }
            if ins_7_count == 0 { draw_sprite_ext(spr_Arrowhead_White, 0, ix_7, ty_0, 0.55, 0.65, ins_rot, c_white, 1); }
				else { draw_sprite_ext(spr_Arrowhead_Red, 0, ix_7, ty_0, 0.55, 0.65, 0, c_white, 1); }
            if ins_8_count == 0 { draw_sprite_ext(spr_Arrowhead_White, 0, ix_8, ty_0, 0.55, 0.65, ins_rot, c_white, 1); }
				else { draw_sprite_ext(spr_Arrowhead_Red, 0, ix_8, ty_0, 0.55, 0.65, 0, c_white, 1); }
            if ins_9_count == 0 { draw_sprite_ext(spr_Arrowhead_White, 0, ix_9, ty_0, 0.55, 0.65, ins_rot, c_white, 1); }
				else { draw_sprite_ext(spr_Arrowhead_Red, 0, ix_9, ty_0, 0.55, 0.65, 0, c_white, 1); }
            if !ds_list_empty(global.turn_list) { 
                var li;//List position
                var lx;//X coord to draw at
                var lt = false;//Sensor timer state
                var la = min(10, ds_list_size(global.turn_list));//How much of the list to display
                var lo;
                for (li=0; li<la; li+=1){  
                    turn_id = ds_list_find_value(global.turn_list, li); 
                    switch li {
                        case 0:
                            lx = tx_0+tlist_adj+tlist_adj0;
                            lo = 1;
                            if t0_timer >= s_time { lt = true; }
                            break;
                        case 1:
                            lx = tx_1+tlist_adj+tlist_adj1;
                            lo = 1;
                            if t1_timer >= s_time { lt = true; }
                            break;
                        case 2:
                            lx = tx_2+tlist_adj+tlist_adj2;
                            lo = 1;
                            if t2_timer >= s_time { lt = true; }
                            break;
                        case 3:
                            lx = tx_3+tlist_adj+tlist_adj3;
                            if t3_timer >= s_time { lt = true; }
                            break;
                        case 4:
                            lx = tx_4+tlist_adj+tlist_adj4;
                            lo = 1;
                            if t4_timer >= s_time { lt = true; }
                            break;
                        case 5:
                            lx = tx_5+tlist_adj+tlist_adj5;
                            lo = 1;
                            if t5_timer >= s_time { lt = true; }
                            break;
                        case 6:
                            lx = tx_6+tlist_adj+tlist_adj6;
                            lo = 1;
                            if t6_timer >= s_time { lt = true; }
                            break;
                        case 7:
                            lx = tx_7+tlist_adj+tlist_adj7;
                            lo = 1;
                            if t7_timer >= s_time { lt = true; }
                            break;
                        case 8:
                            lx = tx_8+tlist_adj+tlist_adj8;
                            if t8_timer >= s_time { lt = true; }
                            break;
                        case 9:
                            lx = tx_9+tlist_adj+tlist_adj9;
                            lo = tlist_a;
                            if t9_timer >= s_time { lt = true; }
                            break;
                        default:
                            break;
                    }
                    switch turn_id {
                        case "ALPHA":
                            //Squad ALPHA
                            draw_sprite_ext(spr_Alpha_Icon, 0, lx, ty_0, 1, 1, 0, c_white, lo);
                            if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
                                    if !ds_list_empty(global.squad_alpha) {
                                        scr_DrawSquadUnits(global.squad_alpha);
                                    }
                                } 
                            }          
                            break;
                        case "BRAVO":
                            //Squad BRAVO
                            draw_sprite_ext(spr_Bravo_Icon, 0, lx, ty_0, 1, 1, 0, c_white, lo);
                            if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
                                    if !ds_list_empty(global.squad_bravo) {
                                        scr_DrawSquadUnits(global.squad_bravo);
                                    }
                                }
                             }           
                            break;
                        case "CHARLIE":
                            //Squad CHARLIE
                            draw_sprite_ext(spr_Charlie_Icon, 0, lx, ty_0, 1, 1, 0, c_white, lo);
                            if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
                                    if !ds_list_empty(global.squad_charlie) {
                                        scr_DrawSquadUnits(global.squad_charlie);
                                    }
                                } 
                            }          
                            break;
                        case "DELTA":
                            //Squad DELTA
                            draw_sprite_ext(spr_Delta_Icon, 0, lx, ty_0, 1, 1, 0, c_white, lo);
                            if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
                                    if !ds_list_empty(global.squad_delta) {
                                        scr_DrawSquadUnits(global.squad_delta);
                                    }
                                } 
                            }            
                            break;
                        case "ECHO":
                            //Squad ECHO
                            draw_sprite_ext(spr_Echo_Icon, 0, lx, ty_0, 1, 1, 0, c_white, lo);
                            if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
                                    if !ds_list_empty(global.squad_echo) {
                                        scr_DrawSquadUnits(global.squad_echo);
                                    }
                                } 
                            }          
                            break;
                        case "BOMBER":
                            draw_sprite_ext(spr_Bomber_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Heavy Bomber Requested", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "MISSILE":
                            draw_sprite_ext(spr_Missile_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Preparing Missile Strike", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "ARTILLERY":
                            draw_sprite_ext(spr_Artillery_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Calculating Artillery Coordinates", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "UAV":
                            draw_sprite_ext(spr_UAV_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Spy Drone Incoming", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "AIRDROP":
                            draw_sprite_ext(spr_Airdrop_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Supply Drop Scheduled", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "ILC":
                            draw_sprite_ext(spr_ILC_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Reinforcing Infantry Units", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "TLC":
                            draw_sprite_ext(spr_TLC_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Reinforcing Armor Units", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "BLC":
                            draw_sprite_ext(spr_BLC_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Reinforcing Assault Vehicle Units", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "ELC":
                            draw_sprite_ext(spr_ELC_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Reinforcing Engineer Units", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "LLC":
                            draw_sprite_ext(spr_LLC_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Reinforcing Logistics Units", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "E_1":
                            //Squad ENEMY 1
                            draw_sprite_ext(spr_E1_Icon, 0, lx, ty_0, 1, 1, 0, c_white, lo);
                            if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
                                    if !ds_list_empty(global.squad_1) {
                                        scr_DrawSquadUnits_E(global.squad_1);
                                    }
                                }
                            }       
                            break;
                        case "E_2":
                            //Squad ENEMY 2
                            draw_sprite_ext(spr_E2_Icon, 0, lx, ty_0, 1, 1, 0, c_white, lo);
                            if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
                                    if !ds_list_empty(global.squad_2) {
                                        scr_DrawSquadUnits_E(global.squad_2);
                                    }
                                }
                            }        
                            break;
                        case "E_3":
                            //Squad ENEMY 3
                            draw_sprite_ext(spr_E3_Icon, 0, lx, ty_0, 1, 1, 0, c_white, lo);
                            if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
                                    if !ds_list_empty(global.squad_3) {
                                        scr_DrawSquadUnits_E(global.squad_3);
                                    }
                                } 
                            }     
                            break;
                        case "E_4":
                            //Squad ENEMY 4
                            draw_sprite_ext(spr_E4_Icon, 0, lx, ty_0, 1, 1, 0, c_white, lo);
                            if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
                                    if !ds_list_empty(global.squad_4) {
                                        scr_DrawSquadUnits_E(global.squad_4);
                                    }
                                }
                            }       
                            break;
                        case "E_5":
                            //Squad ENEMY 5
                            draw_sprite_ext(spr_E5_Icon, 0, lx, ty_0, 1, 1, 0, c_white, lo);
                            if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
                                    if !ds_list_empty(global.squad_5) {
                                        scr_DrawSquadUnits_E(global.squad_5);
                                    }
                                }
                            }          
                            break;
						case "E_BOMBER":
                            draw_sprite_ext(spr_Bomber_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Enemy Bomber Detected", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "E_MISSILE":
                            draw_sprite_ext(spr_Missile_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Enemy Missile Strike Imminent", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "E_ARTILLERY":
                            draw_sprite_ext(spr_Artillery_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Enemy Artillery Activity Detected", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "E_UAV":
                            draw_sprite_ext(spr_UAV_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Enemy Drone Active", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "E_AIRDROP":
                            draw_sprite_ext(spr_Airdrop_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Enemy Resupply Aircfaft Inbound", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "E_ILC":
                            draw_sprite_ext(spr_ILC_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Enemy Reinforcements En-Route", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "E_TLC":
                            draw_sprite_ext(spr_TLC_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Enemy Reinforcements En-Route", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "E_BLC":
                            draw_sprite_ext(spr_BLC_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Enemy Reinforcements En-Route", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "E_ELC":
                            draw_sprite_ext(spr_ELC_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Enemy Reinforcements En-Route", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "E_LLC":
                            draw_sprite_ext(spr_LLC_Button, 0, lx, ty_0, 1, 1, 0, c_white, lo);
							if command_targeting == true && targeting_error != true && navigation_error != true && friendly_fire != true {
                                if li == t_pos && lt == true {
									draw_set_font(fnt_14);
									draw_text_colour_shadow(ui_midx, ty_2, "Enemy Reinforcements En-Route", c_gray, c_gray, c_gray, c_gray, 2, 0, c_black, 0.8);
                                } 
                            }
                            break;
                        case "NOONE":
                            break;
                    }
                }
            }
            draw_set_font(fnt_12);
            draw_set_colour(c_black);
            surface_reset_target();
        }
            else {
                ui_topsurf = surface_create(ui_width, ui_height);
                surface_set_target(ui_topsurf);
                draw_clear(c_black);
                surface_reset_target();
            }
        //BOTTOM UI\\    
        if surface_exists(ui_botsurf) {
            surface_set_target(ui_botsurf);
            draw_clear_alpha(c_black, 1);
            //Bottom UI background
			draw_sprite_ext(spr_UI_Bg1, 0, 0, 0, 1, 1, 0, c_white, 1);
            //COMMAND CARDS
			//Command points and cost
            draw_set_font(fnt_24);
			draw_text_colour(ui_midx, by_1, "Command", c_silver, c_silver, c_silver, c_silver, 1);
			draw_set_font(fnt_20);
            if draw_cpcost == false { draw_text_colour_shadow(ui_midx, by_1+36, string(global.command_points), c_silver, c_silver, c_silver, c_silver, 1, 300, c_black, 0.6); }
                else if draw_cpcost == true { draw_text_colour_shadow(ui_midx, by_1+36, "-" + string(cp_cost), c_silver, c_red, c_red, c_red, 1, 300, c_black, 0.6); }
			
			var hr = string(floor(obj_WEATHER.hour));
			draw_text_colour(ui_midx, by_2, string(hr+"h00"), c_silver, c_silver, c_silver, c_silver, 1);
			draw_sprite_ext(p_flag, 0, ui_midx, by_1+72, 0.5, 0.5, 1, c_white, 1);
                
            draw_sprite_ext(spr_Bomber_Button, 0, bx_0, by_0, 1, 1, 0, c_white, 1);
            if active_bomber == true { draw_sprite_ext(spr_UI_Indicator_Orange, 0, bx_0, by_0, 1, 1, 0, c_white, 1); }
                else if global.command_points <= 0 { draw_sprite_ext(spr_UI_Indicator_Red, 0, bx_0, by_0, 1, 1, 0, c_white, 1); }
                    else if bomber_targeting == true { draw_sprite_ext(spr_UI_Indicator_Green, 0, bx_0, by_0, 1, 1, 0, c_white, 1); }
                        else { draw_sprite_ext(spr_UI_Indicator_Gray, 0, bx_0, by_0, 1, 1, 0, c_white, 1); }
                        
            draw_sprite_ext(spr_Missile_Button, 0, bx_1, by_0, 1, 1, 0, c_white, 1);
            if active_missile == true { draw_sprite_ext(spr_UI_Indicator_Orange, 0, bx_1, by_0, 1, 1, 0, c_white, 1); }
                else if global.command_points <= 0 { draw_sprite_ext(spr_UI_Indicator_Red, 0, bx_1, by_0, 1, 1, 0, c_white, 1); }
                    else if missile_targeting == true { draw_sprite_ext(spr_UI_Indicator_Green, 0, bx_1, by_0, 1, 1, 0, c_white, 1); }
                        else { draw_sprite_ext(spr_UI_Indicator_Gray, 0, bx_1, by_0, 1, 1, 0, c_white, 1); }
            draw_set_font(fnt_16);
			draw_text_colour(bx_2, by_1, "---    Tactical    ---", c_gray, c_gray, c_gray, c_gray, 1);
			
            draw_sprite_ext(spr_UAV_Button, 0, bx_2, by_0, 1, 1, 0, c_white, 1);
            if active_uav == true { draw_sprite_ext(spr_UI_Indicator_Orange, 0, bx_2, by_0, 1, 1, 0, c_white, 1); }
                else if global.command_points <= 0 { draw_sprite_ext(spr_UI_Indicator_Red, 0, bx_2, by_0, 1, 1, 0, c_white, 1); }
                    else if uav_targeting == true { draw_sprite_ext(spr_UI_Indicator_Green, 0, bx_2, by_0, 1, 1, 0, c_white, 1); }
                        else { draw_sprite_ext(spr_UI_Indicator_Gray, 0, bx_2, by_0, 1, 1, 0, c_white, 1); }
                        
            draw_sprite_ext(spr_Artillery_Button, 0, bx_3, by_0, 1, 1, 0, c_white, 1);
            if active_artillery == true { draw_sprite_ext(spr_UI_Indicator_Orange, 0, bx_3, by_0, 1, 1, 0, c_white, 1); }
                else if global.command_points <= 0 { draw_sprite_ext(spr_UI_Indicator_Red, 0, bx_3, by_0, 1, 1, 0, c_white, 1); } 
                    else if artillery_targeting == true { draw_sprite_ext(spr_UI_Indicator_Green, 0, bx_3, by_0, 1, 1, 0, c_white, 1); }
                        else { draw_sprite_ext(spr_UI_Indicator_Gray, 0, bx_3, by_0, 1, 1, 0, c_white, 1); }
            
            draw_sprite_ext(spr_Airdrop_Button, 0, bx_4, by_0, 1, 1, 0, c_white, 1);
            if active_airdrop == true { draw_sprite_ext(spr_UI_Indicator_Orange, 0, bx_4, by_0, 1, 1, 0, c_white, 1); }
                else if global.command_points <= 0 { draw_sprite_ext(spr_UI_Indicator_Red, 0, bx_4, by_0, 1, 1, 0, c_white, 1); }
                    else if airdrop_targeting == true { draw_sprite_ext(spr_UI_Indicator_Green, 0, bx_4, by_0, 1, 1, 0, c_white, 1); }
                        else { draw_sprite_ext(spr_UI_Indicator_Gray, 0, bx_4, by_0, 1, 1, 0, c_white, 1); }
                        
            draw_sprite_ext(spr_ILC_Button, 0, bx_5, by_0, 1, 1, 0, c_white, 1);
            if active_ilc == true { draw_sprite_ext(spr_UI_Indicator_Orange, 0, bx_5, by_0, 1, 1, 0, c_white, 1); }
                else if global.command_points <= 0 { draw_sprite_ext(spr_UI_Indicator_Red, 0, bx_5, by_0, 1, 1, 0, c_white, 1); }
                    else if ilc_targeting == true { draw_sprite_ext(spr_UI_Indicator_Green, 0, bx_5, by_0, 1, 1, 0, c_white, 1); }
                        else { draw_sprite_ext(spr_UI_Indicator_Gray, 0, bx_5, by_0, 1, 1, 0, c_white, 1); }
                        
            draw_sprite_ext(spr_TLC_Button, 0, bx_6, by_0, 1, 1, 0, c_white, 1);
            if active_tlc == true { draw_sprite_ext(spr_UI_Indicator_Orange, 0, bx_6, by_0, 1, 1, 0, c_white, 1); }
                else if global.command_points <= 0 { draw_sprite_ext(spr_UI_Indicator_Red, 0, bx_6, by_0, 1, 1, 0, c_white, 1); }
                    else if tlc_targeting == true { draw_sprite_ext(spr_UI_Indicator_Green, 0, bx_6, by_0, 1, 1, 0, c_white, 1); }
                        else { draw_sprite_ext(spr_UI_Indicator_Gray, 0, bx_6, by_0, 1, 1, 0, c_white, 1); }
            
			draw_text_colour(bx_7, by_1, "--- Reinforcements ---", c_gray, c_gray, c_gray, c_gray, 1);
			
            draw_sprite_ext(spr_ELC_Button, 0, bx_7, by_0, 1, 1, 0, c_white, 1);
            if active_elc == true { draw_sprite_ext(spr_UI_Indicator_Orange, 0, bx_7, by_0, 1, 1, 0, c_white, 1); }
                else if global.command_points <= 0 { draw_sprite_ext(spr_UI_Indicator_Red, 0, bx_7, by_0, 1, 1, 0, c_white, 1); }
                    else if elc_targeting == true { draw_sprite_ext(spr_UI_Indicator_Green, 0, bx_7, by_0, 1, 1, 0, c_white, 1); }
                        else { draw_sprite_ext(spr_UI_Indicator_Gray, 0, bx_7, by_0, 1, 1, 0, c_white, 1); }
                        
            draw_sprite_ext(spr_BLC_Button, 0, bx_8, by_0, 1, 1, 0, c_white, 1);
            if active_blc == true { draw_sprite_ext(spr_UI_Indicator_Orange, 0, bx_8, by_0, 1, 1, 0, c_white, 1); }
                else if global.command_points <= 0 { draw_sprite_ext(spr_UI_Indicator_Red, 0, bx_8, by_0, 1, 1, 0, c_white, 1); }
                    else if blc_targeting == true { draw_sprite_ext(spr_UI_Indicator_Green, 0, bx_8, by_0, 1, 1, 0, c_white, 1); }
                        else { draw_sprite_ext(spr_UI_Indicator_Gray, 0, bx_8, by_0, 1, 1, 0, c_white, 1); }
                        
            draw_sprite_ext(spr_LLC_Button, 0, bx_9, by_0, 1, 1, 0, c_white, 1);
            if active_llc == true { draw_sprite_ext(spr_UI_Indicator_Orange, 0, bx_9, by_0, 1, 1, 0, c_white, 1); }
                else if global.command_points <= 0 { draw_sprite_ext(spr_UI_Indicator_Red, 0, bx_9, by_0, 1, 1, 0, c_white, 1); }
                    else if llc_targeting == true { draw_sprite_ext(spr_UI_Indicator_Green, 0, bx_9, by_0, 1, 1, 0, c_white, 1); }
                        else { draw_sprite_ext(spr_UI_Indicator_Gray, 0, bx_9, by_0, 1, 1, 0, c_white, 1); }
                        
            //draw_set_font(fnt_14);
            draw_set_valign(fa_middle);
            draw_set_halign(fa_center);
            //var name = game_display_name;
            //var ver = string(GM_version);
			//draw_text_colour(ui_midx, by_2, string_hash_to_newline(name + " v" + ver), c_silver, c_gray, c_gray, c_gray, 1);
            draw_set_font(fnt_12);
            draw_set_colour(c_black);
            surface_reset_target();
        }
            else {
                ui_botsurf = surface_create(ui_width, ui_height);
                surface_set_target(ui_botsurf);
                draw_clear(c_black);
                surface_reset_target();
            }
    }
}

