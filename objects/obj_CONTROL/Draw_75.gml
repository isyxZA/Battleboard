draw_set_alpha(1);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_set_font(fnt_12);

if global.game_state == "IN_GAME" {
    if global.game_turn != 0 { 
        //DRAW UI AS SCALABLE SURFACES\\
        if surface_exists(ui_topsurf) {
            draw_surface_stretched_ext(ui_topsurf, ui_tx, ui_ty+ty_adj, ui_width*ui_ratio, ui_height*ui_ratio, c_white, 1);
        }
            else {
                ui_topsurf = surface_create(ui_width, ui_height);
                surface_set_target(ui_topsurf);
                draw_clear(c_black);
                surface_reset_target();
            }
        if surface_exists(ui_botsurf) {
            draw_surface_stretched_ext(ui_botsurf, ui_bx, ui_by+by_adj, ui_width*ui_ratio, ui_height*ui_ratio, c_white, 1);
        }
            else {
                ui_botsurf = surface_create(ui_width, ui_height);
                surface_set_target(ui_botsurf);
                draw_clear(c_black);
                surface_reset_target();
            }
            
        //Tactical
        if bomber_targeting == true { 
            draw_sprite_ext(spr_Bomber_Icon, 0, gui_mx, gui_my, 1, 1, 0, c_white, 1); 
        }
            else {
                if bomber_timer >= 10 {
                    //Display information box
                    if global.display_info == true {
                        draw_set_colour(t_colour);
                        draw_set_alpha(0.9);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-32, gui_my-10, false);
                        draw_set_colour(c_black);
                        draw_set_alpha(1);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-32, gui_my-10, true);
                        draw_set_font(fnt_10);
                        draw_text_colour(gui_mx-140, gui_my-68, string_hash_to_newline("Bombing Run:"), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-52, string_hash_to_newline("Drag and drop onto turn list."), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-36, string_hash_to_newline("'Z' and 'C' to rotate."), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-20, string_hash_to_newline("Cost 10 CP."), c_black, c_black, c_black, c_black, 1);
                        draw_set_font(fnt_16);
                    }
                }
            }
        if missile_targeting == true { 
            draw_sprite_ext(spr_Missile_Icon, 0, gui_mx, gui_my, 1, 1, 0, c_white, 1); 
        }
            else {
                if missile_timer >= 10 {  
                    //Display information box
                    if global.display_info == true {
                        draw_set_colour(t_colour);
                        draw_set_alpha(0.9);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-32, gui_my-10, false);
                        draw_set_colour(c_black);
                        draw_set_alpha(1);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-32, gui_my-10, true);
                        draw_set_font(fnt_10);
                        draw_text_colour(gui_mx-140, gui_my-68, string_hash_to_newline("Missile Strike:"), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-36, string_hash_to_newline("Drag and drop onto turn list."), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-20, string_hash_to_newline("Cost 10 CP."), c_black, c_black, c_black, c_black, 1);
                        draw_set_font(fnt_16);
                    }
                }
            }
        if uav_targeting == true { 
            draw_sprite_ext(spr_UAV_Icon, 0, gui_mx, gui_my, 1, 1, 0, c_white, 1); 
        }
            else {
                if uav_timer >= 10 {
                    //Display information box
                    if global.display_info == true {
                        draw_set_colour(t_colour);
                        draw_set_alpha(0.9);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-32, gui_my-10, false);
                        draw_set_colour(c_black);
                        draw_set_alpha(1);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-32, gui_my-10, true);
                        draw_set_font(fnt_10);
                        draw_text_colour(gui_mx-140, gui_my-68, string_hash_to_newline("Spy Drone:"), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-52, string_hash_to_newline("Drag and drop onto turn list."), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-36, string_hash_to_newline("'Z' and 'C' to rotate."), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-20, string_hash_to_newline("Cost 10 CP."), c_black, c_black, c_black, c_black, 1);
                        draw_set_font(fnt_16);
                    }
                }
            }
        if artillery_targeting == true { 
            draw_sprite_ext(spr_Artillery_Icon, 0, gui_mx, gui_my, 1, 1, 0, c_white, 1); 
        }
            else {
                if artillery_timer >= 10 {
                    //Display information box
                    if global.display_info == true {
                        draw_set_colour(t_colour);
                        draw_set_alpha(0.9);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-32, gui_my-10, false);
                        draw_set_colour(c_black);
                        draw_set_alpha(1);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-32, gui_my-10, true);
                        draw_set_font(fnt_10);
                        draw_text_colour(gui_mx-140, gui_my-68, string_hash_to_newline("Artillery Barrage:"), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-52, string_hash_to_newline("Drag and drop onto turn list."), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-36, string_hash_to_newline("'Z' and 'C' to rotate."), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-20, string_hash_to_newline("Cost 10 CP."), c_black, c_black, c_black, c_black, 1);
                        draw_set_font(fnt_16);
                    }
            }
        }
        if airdrop_targeting == true { 
            draw_sprite_ext(spr_Airdrop_Icon, 0, gui_mx, gui_my, 1, 1, 0, c_white, 1); 
        }
            else {
                if airdrop_timer >= 10 {
                    //Display information box
                    if global.display_info == true {
                        draw_set_colour(t_colour);
                        draw_set_alpha(0.9);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-32, gui_my-10, false);
                        draw_set_colour(c_black);
                        draw_set_alpha(1);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-32, gui_my-10, true);
                        draw_set_font(fnt_10);
                        draw_text_colour(gui_mx-140, gui_my-68, string_hash_to_newline("Supply Drop:"), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-52, string_hash_to_newline("Drag and drop onto turn list."), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-36, string_hash_to_newline("Target depot for resupply."), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-20, string_hash_to_newline("Cost 10 CP."), c_black, c_black, c_black, c_black, 1);
                        draw_set_font(fnt_16);
                    }
                }
            }
        //Reinforcements
        if ilc_targeting == true { 
            draw_sprite_ext(spr_ILC_Icon, 0, gui_mx, gui_my, 1, 1, 0, c_white, 1); 
        }
            else {
                if ilc_timer >= 10 {
                    //Display information box
                    if global.display_info == true {
                        draw_set_colour(t_colour);
                        draw_set_alpha(0.9);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-32, gui_my-10, false);
                        draw_set_colour(c_black);
                        draw_set_alpha(1);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-32, gui_my-10, true);
                        draw_set_font(fnt_10);
                        draw_text_colour(gui_mx-140, gui_my-68, string_hash_to_newline("Infantry Ship:"), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-52, string_hash_to_newline("Drag and drop onto turn list."), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-36, string_hash_to_newline("Reinforces selected squad."), c_black, c_black, c_black, c_black, 1);
						draw_text_colour(gui_mx-140, gui_my-20, string_hash_to_newline("Cost 10 CP."), c_black, c_black, c_black, c_black, 1);
                        draw_set_font(fnt_16);
                    }
                }
            }
        if tlc_targeting == true { 
            draw_sprite_ext(spr_TLC_Icon, 0, gui_mx, gui_my, 1, 1, 0, c_white, 1); 
        }
            else {
                if tlc_timer >= 10 {
                    //Display information box
                    if global.display_info == true {
                        draw_set_colour(t_colour);
                        draw_set_alpha(0.9);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-32, gui_my-10, false);
                        draw_set_colour(c_black);
                        draw_set_alpha(1);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-32, gui_my-10, true);
                        draw_set_font(fnt_10);
                        draw_text_colour(gui_mx-140, gui_my-68, string_hash_to_newline("Armour Ship:"), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-52, string_hash_to_newline("Drag and drop onto turn list."), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-36, string_hash_to_newline("Reinforces selected squad."), c_black, c_black, c_black, c_black, 1);
						draw_text_colour(gui_mx-140, gui_my-20, string_hash_to_newline("Cost 10 CP."), c_black, c_black, c_black, c_black, 1);
                        draw_set_font(fnt_16);
                    }
                }
            }
        if elc_targeting == true { 
            draw_sprite_ext(spr_ELC_Icon, 0, gui_mx, gui_my, 1, 1, 0, c_white, 1); 
        }
            else {
                if elc_timer >= 10 {
                    //Display information box
                    if global.display_info == true {
                        draw_set_colour(t_colour);
                        draw_set_alpha(0.9);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-32, gui_my-10, false);
                        draw_set_colour(c_black);
                        draw_set_alpha(1);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-32, gui_my-10, true);
                        draw_set_font(fnt_10);
                        draw_text_colour(gui_mx-140, gui_my-68, string_hash_to_newline("Engineer Ship:"), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-52, string_hash_to_newline("Drag and drop onto turn list."), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-36, string_hash_to_newline("Reinforces selected squad."), c_black, c_black, c_black, c_black, 1);
						draw_text_colour(gui_mx-140, gui_my-20, string_hash_to_newline("Cost 10 CP."), c_black, c_black, c_black, c_black, 1);
                        draw_set_font(fnt_16);
                    }
                }
            }
        if blc_targeting == true { 
            draw_sprite_ext(spr_BLC_Icon, 0, gui_mx, gui_my, 1, 1, 0, c_white, 1); 
        }
            else {
                if blc_timer >= 10 {
                    //Display information box
                    if global.display_info == true {
                        draw_set_colour(t_colour);
                        draw_set_alpha(0.9);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-32, gui_my-10, false);
                        draw_set_colour(c_black);
                        draw_set_alpha(1);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-32, gui_my-10, true);
                        draw_set_font(fnt_10);
                        draw_text_colour(gui_mx-140, gui_my-68, string_hash_to_newline("Assault Vehicle Ship:"), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-52, string_hash_to_newline("Drag and drop onto turn list."), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-36, string_hash_to_newline("Reinforces selected squad."), c_black, c_black, c_black, c_black, 1);
						draw_text_colour(gui_mx-140, gui_my-20, string_hash_to_newline("Cost 10 CP."), c_black, c_black, c_black, c_black, 1);
                        draw_set_font(fnt_16);
                    }
                }
            }
        if llc_targeting == true { 
            draw_sprite_ext(spr_LLC_Icon, 0, gui_mx, gui_my, 1, 1, 0, c_white, 1); 
        }
            else {
                if llc_timer >= 10 {  
                    //Display information box
                    if global.display_info == true {
                        draw_set_colour(t_colour);
                        draw_set_alpha(0.9);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-34, gui_my-8, false);
                        draw_set_colour(c_black);
                        draw_set_alpha(1);
                        draw_rectangle(gui_mx-248, gui_my-78, gui_mx-34, gui_my-8, true);
                        draw_set_font(fnt_10);
                        draw_text_colour(gui_mx-140, gui_my-68, string_hash_to_newline("Supply Ship:"), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-52, string_hash_to_newline("Drag and drop onto turn list."), c_black, c_black, c_black, c_black, 1);
                        draw_text_colour(gui_mx-140, gui_my-36, string_hash_to_newline("Reinforces selected squad."), c_black, c_black, c_black, c_black, 1);
						draw_text_colour(gui_mx-140, gui_my-20, string_hash_to_newline("Cost 10 CP."), c_black, c_black, c_black, c_black, 1);
                        draw_set_font(fnt_16);
                    }
                }
            }

        if global.my_turn == true {
            //Show selected units as a list on the right-middle of gui
            if !ds_list_empty(global.selected_list) {
                draw_set_font(fnt_12);
                draw_set_colour(c_white); 
                //Find middle of list
                var lmid2 = floor(ds_list_size(global.selected_list)/2);
                //Determine if list size is even or odd and adjust draw position accordingly
                var adj2;
                if ((ds_list_size(global.selected_list) mod 2) == 0) { adj2 = v_space*0.5; } else { adj2 = 0; }
                var aa;
                for (aa=0; aa<ds_list_size(global.selected_list); aa+=1){
                    unit = ds_list_find_value(global.selected_list, aa);
                    var txt = unit.unit_type;
                    draw_sprite_ext(spr_Alert_Box02, 0, display_get_gui_width()*0.95, (mid_y+adj2)+((aa-lmid2)*v_space), 1, 1, 0, c_white, 0.5);
                    draw_text(display_get_gui_width()*0.95, (mid_y+adj2)+((aa-lmid2)*v_space), string_hash_to_newline(string(txt)));
                }
                draw_set_colour(c_black);
            }
        }
        //Display unit actions as a list on the left-middle of gui
        if !ds_list_empty(global.action_alert_list) { 
            draw_set_font(fnt_12);
            draw_set_colour(c_white);
            //Find middle of list
            var lmid1 = floor(ds_list_size(global.action_alert_list)/2);
            //Determine if list size is even or odd and adjust draw position accordingly
            var adj1;
            if ((ds_list_size(global.action_alert_list) mod 2) == 0) { adj1 = v_space*0.5; } else { adj1 = 0; }
            var a;
            for (a=0; a<ds_list_size(global.action_alert_list); a+=1){
                alert = ds_list_find_value(global.action_alert_list, a);
                draw_sprite_ext(spr_Alert_Box02, 0, display_get_gui_width()*0.05, (mid_y+adj1)+((a-lmid1)*v_space), 1, 1, 0, c_white, 0.5);
                draw_text(display_get_gui_width()*0.05, (mid_y+adj1)+((a-lmid1)*v_space), string_hash_to_newline(string(alert)));
            }
            draw_set_colour(c_black); 
        }
    }
    
    //Center screen text display
	/*
    if global.game_turn == 0 {
        if display_txt != "" {
            draw_set_font(fnt_48);
			//draw_sprite_ext(spr_Text_Background, 0, mid_x, mid_y, 1, 0.9, 0, c_white, txt_a);
            draw_text_colour_shadow(mid_x, mid_y, string(display_txt), c_silver, c_silver, c_silver, c_silver, 4, 220, c_black, 0.6);
        }
    }
	*/

    if global.victory == true || global.defeat == true { 
        draw_set_font(fnt_64);
		//draw_sprite_ext(spr_Text_Background, 0, mid_x, mid_y, 1, 1, 0, c_white, txt_a);
        draw_text_colour_shadow(mid_x, mid_y, string(display_txt), c_silver, c_silver, c_silver, c_silver, 4, 220, c_black, 0.6); 
    }
    draw_set_font(fnt_12);

    //Display hints
    if global.display_info == true && show_options != true {
        if global.my_turn == true && global.units_running == 0 { 
            if global.game_turn == 0 { 
                draw_set_font(fnt_14);
                draw_set_halign(fa_left);
                if ds_list_size(global.myunit_list) < 6 {
                    draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.485, 1.5, 1, 0, c_white, 0.7);
                    draw_text_colour(display_get_width()*0.005, display_get_height()*0.485, string("Left click to select a landing craft."), c_white, c_white, c_white, c_white, 1);
                    draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.515, 2, 1, 0, c_white, 0.7);
                    draw_text_colour(display_get_width()*0.005, display_get_height()*0.515, string("Right click on a green square to place your unit."), c_white, c_white, c_white, c_white, 1);
                }
					else if ds_list_size(global.myunit_list) < 24 {
	                    draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.485, 1.7, 1, 0, c_white, 0.7);
		                draw_text_colour(display_get_width()*0.005, display_get_height()*0.485, string("Press V to toggle enhanced unit visibility."), c_white, c_white, c_white, c_white, 1);
		                draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.515, 1.4, 1, 0, c_white, 0.7);
		                draw_text_colour(display_get_width()*0.005, display_get_height()*0.515, string("Hold TAB to identify your units."), c_white, c_white, c_white, c_white, 1);
	                }
	                    else {
		                    draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.485, 1.5, 1, 0, c_white, 0.7);
		                    draw_text_colour(display_get_width()*0.005, display_get_height()*0.485, string("Press G to toggle grid visibility."), c_white, c_white, c_white, c_white, 1);
	                    }
                draw_set_halign(fa_center);
            }
                else {
					if obj_COMMAND.active == true {
						draw_set_font(fnt_14);
			            draw_set_halign(fa_left);
						switch active_turn {
							case "BOMBER":
							case "UAV":
							case "ARTILLERY":
								draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.485, 1, 1, 0, c_white, 0.7);
								draw_text_colour(display_get_width()*0.005, display_get_height()*0.485, string_hash_to_newline("Z and C to rotate."), c_white, c_white, c_white, c_white, 1);
								draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.515, 1.3, 1, 0, c_white, 0.7);
								draw_text_colour(display_get_width()*0.005, display_get_height()*0.515, string_hash_to_newline("Right Mouse to confirm target."), c_white, c_white, c_white, c_white, 1);
								break;
			                case "MISSILE":
								draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.5, 1.3, 1, 0, c_white, 0.7);
			                    draw_text_colour(display_get_width()*0.005, display_get_height()*0.5, string_hash_to_newline("Right Mouse to confirm target."), c_white, c_white, c_white, c_white, 1);
								break;
			                case "AIRDROP":
								draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.5, 1.3, 1, 0, c_white, 0.7);
			                    draw_text_colour(display_get_width()*0.005, display_get_height()*0.5, string_hash_to_newline("Right-Click on target depot."), c_white, c_white, c_white, c_white, 1);
								break;
			                case "ILC":
			                case "TLC":
			                case "ELC":
			                case "BLC":
			                case "LLC":
								draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.485, 1.8, 1, 0, c_white, 0.7);
								draw_text_colour(display_get_width()*0.005, display_get_height()*0.485, string_hash_to_newline("Right-Click an available landing location."), c_white, c_white, c_white, c_white, 1);
								draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.515, 1.8, 1, 0, c_white, 0.7);
								draw_text_colour(display_get_width()*0.005, display_get_height()*0.515, string_hash_to_newline("Confirm squad to reinforce with Left Mouse."), c_white, c_white, c_white, c_white, 1);
			                    break;
						}
						draw_set_halign(fa_center);
					}
						else {
							if global.game_turn < 6 { 
			                    draw_set_font(fnt_14);
			                    draw_set_halign(fa_left);
			                    if ds_list_size(global.selected_list) == 0 {
			                        draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.47, 2, 1, 0, c_white, 0.7);
			                        draw_text_colour(display_get_width()*0.005, display_get_height()*0.47, string_hash_to_newline("Left Mouse Button to select your units."), c_white, c_white, c_white, c_white, 1);
			                        draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.5, 2, 1, 0, c_white, 0.7);
			                        draw_text_colour(display_get_width()*0.005, display_get_height()*0.5, string_hash_to_newline("Double-Click a unit to select all of the same type."), c_white, c_white, c_white, c_white, 1);
			                        draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.53, 2, 1, 0, c_white, 0.7);
			                        draw_text_colour(display_get_width()*0.005, display_get_height()*0.53, string_hash_to_newline("Left Mouse and drag to create a selection box."), c_white, c_white, c_white, c_white, 1);
                        
			                    }
			                        else if ds_list_size(global.selected_list) > 0 {
			                            if global.nav_select == false {
			                                if global.reticule_display == false {
			                                    if global.nav_menu == false {
			                                        draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.485, 1.8, 1, 0, c_white, 0.7);
			                                        draw_text_colour(display_get_width()*0.005, display_get_height()*0.485, string_hash_to_newline("E to begin movement. Q to begin targeting."), c_white, c_white, c_white, c_white, 1);
			                                        draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.515, 1.8, 1, 0, c_white, 0.7);
			                                        draw_text_colour(display_get_width()*0.005, display_get_height()*0.515, string_hash_to_newline("Or Right-Click to display options."), c_white, c_white, c_white, c_white, 1);
			                                    }
			                                }
			                                    else if global.reticule_display == true {
			                                        if global.fire_display == false {
			                                            draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.5, 2, 1, 0, c_white, 0.7);
			                                            draw_text_colour(display_get_width()*0.005, display_get_height()*0.5, string_hash_to_newline("Q or Mouse Button Right to display unit options."), c_white, c_white, c_white, c_white, 1);
			                                        }
			                                            else if global.fire_display == true {
			                                                draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.5, 1.75, 1, 0, c_white, 0.7);
			                                                draw_text_colour(display_get_width()*0.005, display_get_height()*0.5, string_hash_to_newline("Hold Right Mouse or Q to drag the menu."), c_white, c_white, c_white, c_white, 1);
			                                            }
			                                    }
			                            }
			                                else if global.nav_select == true {
			                                    draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.485, 1.25, 1, 0, c_white, 0.7);
			                                    draw_text_colour(display_get_width()*0.005, display_get_height()*0.485, string_hash_to_newline("Press E to confirm movement."), c_white, c_white, c_white, c_white, 1);
			                                    draw_sprite_ext(spr_Alert_Box03, 0, 0, display_get_height()*0.515, 1.6, 1, 0, c_white, 0.7);
			                                    draw_text_colour(display_get_width()*0.005, display_get_height()*0.515, string_hash_to_newline("Or Right-Click to display unit options."), c_white, c_white, c_white, c_white, 1);
			                                }
			                        }
			                    draw_set_halign(fa_center);
			                }
						}
			}
        }
        if draw_endturn == true {
            draw_set_colour(t_colour);
            draw_set_alpha(0.9);
            draw_rectangle(gui_mx-196, gui_my-48, gui_mx-24, gui_my+4, false);
            draw_set_colour(c_dkgray);
            draw_set_alpha(1);
            draw_rectangle(gui_mx-196, gui_my-48, gui_mx-24, gui_my+4, true);
            draw_set_font(fnt_10);
            draw_text_colour(gui_mx-108, gui_my-36, string_hash_to_newline("Turn Control:"), c_black, c_black, c_black, c_black, 1);
            draw_text_colour(gui_mx-108, gui_my-20, string_hash_to_newline("Left Click to end turn."), c_black, c_black, c_black, c_black, 1);
			draw_text_colour(gui_mx-108, gui_my-4, string_hash_to_newline("Or press Spacebar."), c_black, c_black, c_black, c_black, 1);
            draw_set_font(fnt_16);
        }
    }
    
    //Debug Overlay
    if global.debug == true { 
		var txt1 = string(camera_get_view_x(obj_CAMERA.my_camera));
	    var txt2 = string(camera_get_view_y(obj_CAMERA.my_camera));
	    var txt3 = string(camera_get_view_width(obj_CAMERA.my_camera));
	    var txt4 = string(camera_get_view_height(obj_CAMERA.my_camera));
	    var txt5 = string(active_turn);
	    if global.nav_menu == true { txt6 = "True"; } else { txt6 = "False"; }
	    var txt8;
	    if global.can_zoom == true { txt8 = "True"; } else { txt8 = "False"; }
        draw_set_color(c_red);
        draw_set_valign(fa_top);
        draw_set_halign(fa_left);
        draw_set_font(fnt_14);
        draw_set_alpha(0.9);
        draw_rectangle_colour(2, 790, 248, 1074, c_black, c_black, c_black, c_black, false);
        draw_set_alpha(1);
        draw_rectangle_colour(2, 790, 248, 1074, c_red, c_white, c_white, c_white, true);
        draw_text(8, 792, "FPS: " + string(fps));
        draw_text(8, 808, "Real FPS: " + string(round(fps_real)));
        draw_text(8, 824, "Game State: " + string(global.game_state));
        draw_text(8, 840, "Zoom Level: " + string(global.zoom_level));
        draw_text(8, 856, "View X: " + txt1);
        draw_text(8, 872, "View Y: " + txt2);
        draw_text(8, 888, "View Width: " + txt3);
        draw_text(8, 904, "View Height: " + txt4);
        draw_text(8, 920, "Light Level: " + string(global.light_level));
        draw_text(8, 936, "Ammo Tab: " + string(global.ammo_tab));
        draw_text(8, 952, "Active Squad: " + txt5);
        draw_text(8, 968, "Turn List Size: " + string(ds_list_size(global.turn_list)));
        draw_text(8, 984, "Total Units: " + string(ds_list_size(global.myunit_list)));
        draw_text(8, 1000, "Total Enemy Units: " + string(ds_list_size(global.enemyunit_list)));
        draw_text(8, 1016, "Units Running: " + string(global.units_running));
        draw_text(8, 1032, "Enemy Units Running: " + string(global.enemyunits_running));
        draw_text(8, 1048, "Game Turn: " + string(global.game_turn));
        draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_set_font(fnt_12);
		draw_set_color(c_black);
    }
}
    else if global.game_state == "IN_MENU" {
        if room == rm_MainMenu {
        }
        if room == rm_Pause {
        }
    }
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(fnt_12);
draw_set_color(c_black);
