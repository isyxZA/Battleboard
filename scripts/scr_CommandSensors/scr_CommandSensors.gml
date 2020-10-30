function scr_CommandSensors() {
	if (command_targeting == true) {
	    if ins_rot != 0  { ins_rot -= (sin(degtorad(ins_rot-0))*2); }
	    if tlist_adj0 != 0 { tlist_adj0 = lerp(tlist_adj0, 0, 0.05 ); } 
	    if tlist_adj1 != 0 { tlist_adj1 = lerp(tlist_adj1, 0, 0.05 ); } 
	    if tlist_adj2 != 0 { tlist_adj2 = lerp(tlist_adj2, 0, 0.05 ); } 
	    if tlist_adj3 != 0 { tlist_adj3 = lerp(tlist_adj3, 0, 0.05 ); } 
	    if tlist_adj4 != 0 { tlist_adj4 = lerp(tlist_adj4, 0, 0.05 ); } 
	    if tlist_adj5 != 0 { tlist_adj5 = lerp(tlist_adj5, 0, 0.05 ); } 
	    if tlist_adj6 != 0 { tlist_adj6 = lerp(tlist_adj6, 0, 0.05 ); } 
	    if tlist_adj7 != 0 { tlist_adj7 = lerp(tlist_adj7, 0, 0.05 ); } 
	    if tlist_adj8 != 0 { tlist_adj8 = lerp(tlist_adj8, 0, 0.05 ); } 
	    if tlist_adj9 != 0 { tlist_adj9 = lerp(tlist_adj9, 0, 0.05 ); } 
	    if (global.command_points > 0) {
	        //Tactical
	        if active_bomber == false && global.command_points >= 20 {
	            var d1 = point_distance(ui_bx+(bx_0*ui_ratio), ui_by+(by_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	            if d1 < s_dist {
	                if bomber_timer < 10 { bomber_timer+=1; }
	                if bomber_timer >= 10 {
	                    if mouse_check_button_pressed(mb_left) {
	                        bomber_targeting = true;
	                        command_targeting = false;
	                        bomber_timer = 0;
	                        //Deselect all units
	                        if !ds_list_empty(global.myunit_list) {
	                            var i;
	                            for(i=0; i<ds_list_size(global.myunit_list); i+=1){
	                                var unit = ds_list_find_value(global.myunit_list, i);
	                                with unit { 
	                                    if selected == true { 
	                                        selected = false; 
	                                        ds_list_delete(global.selected_list, ds_list_find_index(global.selected_list, id));
	                                    }
	                                }
	                            }
	                        }
	                    }
	                }
	            }
	                else { 
	                    bomber_timer = 0;
	                }
	        }
	        if active_missile == false && global.command_points >= 10  {
	            var d2 = point_distance(ui_bx+(bx_1*ui_ratio), ui_by+(by_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	            if d2 < s_dist {
	                if missile_timer < 10 { missile_timer+=1; }
	                if missile_timer >= 10 {
	                    if mouse_check_button_pressed(mb_left) {
	                        missile_targeting = true;
	                        command_targeting = false;
	                        missile_timer = 0;
	                        //Deselect all units
	                        if !ds_list_empty(global.myunit_list) {
	                            var i;
	                            for(i=0; i<ds_list_size(global.myunit_list); i+=1){
	                                var unit = ds_list_find_value(global.myunit_list, i);
	                                with unit { 
	                                    if selected == true { 
	                                        selected = false; 
	                                        ds_list_delete(global.selected_list, ds_list_find_index(global.selected_list, id));
	                                    }
	                                }
	                            }
	                        }
	                    }
	                }
	            }
	                else { 
	                    missile_timer = 0; 
	                }
	        }
	        if active_uav == false && global.command_points >= 20 {
	            var d3 = point_distance(ui_bx+(bx_2*ui_ratio), ui_by+(by_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	            if d3 < s_dist {
	                if uav_timer < 10 { uav_timer+=1; }
	                if uav_timer >= 10 {
	                    if mouse_check_button_pressed(mb_left) {
	                        uav_targeting = true;
	                        command_targeting = false;
	                        uav_timer = 0;
	                        //Deselect all units
	                        if !ds_list_empty(global.myunit_list) {
	                            var i;
	                            for(i=0; i<ds_list_size(global.myunit_list); i+=1){
	                                var unit = ds_list_find_value(global.myunit_list, i);
	                                with unit { 
	                                    if selected == true { 
	                                        selected = false; 
	                                        ds_list_delete(global.selected_list, ds_list_find_index(global.selected_list, id));
	                                    }
	                                }
	                            }
	                        }
	                    }
	                }
	            }
	                else { 
	                    uav_timer = 0; 
	                }
	        }
	        if active_artillery == false && global.command_points >= 10 {
	            var d4 = point_distance(ui_bx+(bx_3*ui_ratio), ui_by+(by_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	            if d4 < s_dist {
	                if artillery_timer < 10 { artillery_timer+=1; }
	                if artillery_timer >= 10 {
	                    if mouse_check_button_pressed(mb_left) {
	                        artillery_targeting = true;
	                        command_targeting = false;
	                        artillery_timer = 0;
	                        //Deselect all units
	                        if !ds_list_empty(global.myunit_list) {
	                            var i;
	                            for(i=0; i<ds_list_size(global.myunit_list); i+=1){
	                                var unit = ds_list_find_value(global.myunit_list, i);
	                                with unit { 
	                                    if selected == true { 
	                                        selected = false; 
	                                        ds_list_delete(global.selected_list, ds_list_find_index(global.selected_list, id));
	                                    }
	                                }
	                            }
	                        }
	                    }
	                }
	            }
	                else { 
	                    artillery_timer = 0; 
	                }
	        }
	        if active_airdrop == false && global.command_points >= 20 {
	            var d5 = point_distance(ui_bx+(bx_4*ui_ratio), ui_by+(by_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	            if d5 < s_dist {
	                if airdrop_timer < 10 { airdrop_timer+=1; }
	                if airdrop_timer >= 10 {
	                    if mouse_check_button_pressed(mb_left) {
	                        airdrop_targeting = true;
	                        command_targeting = false;
	                        airdrop_timer = 0;
	                        //Deselect all units
	                        if !ds_list_empty(global.myunit_list) {
	                            var i;
	                            for(i=0; i<ds_list_size(global.myunit_list); i+=1){
	                                var unit = ds_list_find_value(global.myunit_list, i);
	                                with unit { 
	                                    if selected == true { 
	                                        selected = false; 
	                                        ds_list_delete(global.selected_list, ds_list_find_index(global.selected_list, id));
	                                    }
	                                }
	                            }
	                        }
	                    }
	                }
	            }
	                else { 
	                    airdrop_timer = 0; 
	                }
	        }
	        //Reinforcements
	        if active_ilc == false && global.command_points >= 10  {
	            var d6 = point_distance(ui_bx+(bx_5*ui_ratio), ui_by+(by_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	            if d6 < s_dist {
	                if ilc_timer < 10 { ilc_timer+=1; }
	                if ilc_timer >= 10 {
	                    if mouse_check_button_pressed(mb_left) {
	                        ilc_targeting = true;
	                        command_targeting = false;
	                        ilc_timer = 0;
	                        //Deselect all units
	                        if !ds_list_empty(global.myunit_list) {
	                            var i;
	                            for(i=0; i<ds_list_size(global.myunit_list); i+=1){
	                                var unit = ds_list_find_value(global.myunit_list, i);
	                                with unit { 
	                                    if selected == true { 
	                                        selected = false; 
	                                        ds_list_delete(global.selected_list, ds_list_find_index(global.selected_list, id));
	                                    }
	                                }
	                            }
	                        }
	                    }
	                }
	            }
	                else { 
	                    ilc_timer = 0; 
	                }
	        }
	        if active_tlc == false && global.command_points >= 20 {
	            var d7 = point_distance(ui_bx+(bx_6*ui_ratio), ui_by+(by_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	            if d7 < s_dist {
	                if tlc_timer < 10 { tlc_timer+=1; }
	                if tlc_timer >= 10 {
	                    if mouse_check_button_pressed(mb_left) {
	                        tlc_targeting = true;
	                        command_targeting = false;
	                        tlc_timer = 0;
	                        //Deselect all units
	                        if !ds_list_empty(global.myunit_list) {
	                            var i;
	                            for(i=0; i<ds_list_size(global.myunit_list); i+=1){
	                                var unit = ds_list_find_value(global.myunit_list, i);
	                                with unit { 
	                                    if selected == true { 
	                                        selected = false; 
	                                        ds_list_delete(global.selected_list, ds_list_find_index(global.selected_list, id));
	                                    }
	                                }
	                            }
	                        }
	                    }
	                }
	            }
	                else { 
	                    tlc_timer = 0; 
	                }
	        }
	        if active_elc == false && global.command_points >= 20 {
	            var d8 = point_distance(ui_bx+(bx_7*ui_ratio), ui_by+(by_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	            if d8 < s_dist {
	                if elc_timer < 10 { elc_timer+=1; }
	                if elc_timer >= 10 {
	                    if mouse_check_button_pressed(mb_left) {
	                        elc_targeting = true;
	                        command_targeting = false;
	                        elc_timer = 0;
	                        //Deselect all units
	                        if !ds_list_empty(global.myunit_list) {
	                            var i;
	                            for(i=0; i<ds_list_size(global.myunit_list); i+=1){
	                                var unit = ds_list_find_value(global.myunit_list, i);
	                                with unit { 
	                                    if selected == true { 
	                                        selected = false; 
	                                        ds_list_delete(global.selected_list, ds_list_find_index(global.selected_list, id));
	                                    }
	                                }
	                            }
	                        }
	                    }
	                }
	            }
	                else { 
	                    elc_timer = 0; 
	                }
	        }
	        if active_blc == false && global.command_points >= 20 {
	            var d9 = point_distance(ui_bx+(bx_8*ui_ratio), ui_by+(by_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	            if d9 < s_dist {
	                if blc_timer < 10 { blc_timer+=1; }
	                if blc_timer >= 10 {
	                    if mouse_check_button_pressed(mb_left) {
	                        blc_targeting = true;
	                        command_targeting = false;
	                        blc_timer = 0;
	                        //Deselect all units
	                        if !ds_list_empty(global.myunit_list) {
	                            var i;
	                            for(i=0; i<ds_list_size(global.myunit_list); i+=1){
	                                var unit = ds_list_find_value(global.myunit_list, i);
	                                with unit { 
	                                    if selected == true { 
	                                        selected = false; 
	                                        ds_list_delete(global.selected_list, ds_list_find_index(global.selected_list, id));
	                                    }
	                                }
	                            }
	                        }
	                    }
	                }
	            }
	                else { 
	                    blc_timer = 0; 
	                }
	        }
	        if active_llc == false && global.command_points >= 10 {
	            var d10 = point_distance(ui_bx+(bx_9*ui_ratio), ui_by+(by_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	            if d10 < s_dist {
	                if llc_timer < 10 { llc_timer+=1; }
	                if llc_timer >= 10 {
	                    if mouse_check_button_pressed(mb_left) {
	                        llc_targeting = true;
	                        command_targeting = false;
	                        llc_timer = 0;
	                        //Deselect all units
	                        if !ds_list_empty(global.myunit_list) {
	                            var i;
	                            for(i=0; i<ds_list_size(global.myunit_list); i+=1){
	                                var unit = ds_list_find_value(global.myunit_list, i);
	                                with unit { 
	                                    if selected == true { 
	                                        selected = false; 
	                                        ds_list_delete(global.selected_list, ds_list_find_index(global.selected_list, id));
	                                    }
	                                }
	                            }
	                        }
	                    }
	                }
	            }
	                else { 
	                    llc_timer = 0; 
	                }
	        }
	    }
	}
	    else if command_targeting == false {
	        if ins_rot != 270  { ins_rot += (sin(degtorad(ins_rot-270))*2); }
	        //If dragging a command card into the turn list
	        if point_distance(gui_mx, gui_my, ui_tx+(ix_1*ui_ratio), ui_ty+(ty_0*ui_ratio)) < s_dist  {
				if ins_1_count == 0 {
		            ins_1 = true;
		            if tlist_adj0 !=  (t_space*0.25) { tlist_adj0 = lerp(tlist_adj0,  (t_space*0.25), 0.05); } 
		            if tlist_adj1 != -(t_space*0.25) { tlist_adj1 = lerp(tlist_adj1, -(t_space*0.25), 0.05); }
				}
	        } 
	            else { 
	                ins_1 = false; 
	                if tlist_adj0 != 0 { tlist_adj0 = lerp(tlist_adj0, 0, 0.05); }
	            }
	        if point_distance(gui_mx, gui_my, ui_tx+(ix_2*ui_ratio), ui_ty+(ty_0*ui_ratio)) < s_dist  { 
				if ins_2_count == 0 {
					ins_2 = true; 
		            if tlist_adj1 !=  (t_space*0.25) { tlist_adj1 = lerp(tlist_adj1,  (t_space*0.25), 0.05); }
		            if tlist_adj2 != -(t_space*0.25) { tlist_adj2 = lerp(tlist_adj2, -(t_space*0.25), 0.05); }
				}
	        }
	            else { 
	                ins_2 = false; 
	                if ins_1 == false { if tlist_adj1 != 0 { tlist_adj1 = lerp(tlist_adj1, 0, 0.05); } }
	            }
	        if point_distance(gui_mx, gui_my, ui_tx+(ix_3*ui_ratio), ui_ty+(ty_0*ui_ratio)) < s_dist  { 
				if ins_3_count == 0 {
		            ins_3 = true;
		            if tlist_adj2 !=  (t_space*0.25) { tlist_adj2 = lerp(tlist_adj2,  (t_space*0.25), 0.05); }
		            if tlist_adj3 != -(t_space*0.25) { tlist_adj3 = lerp(tlist_adj3, -(t_space*0.25), 0.05); }
				}
	        } 
	            else { 
	                ins_3 = false; 
	                if ins_2 == false { if tlist_adj2 != 0 { tlist_adj2 = lerp(tlist_adj2, 0, 0.05); } }
	            }
	        if point_distance(gui_mx, gui_my, ui_tx+(ix_4*ui_ratio), ui_ty+(ty_0*ui_ratio)) < s_dist  { 
				if ins_4_count == 0 {
		            ins_4 = true;
		            if tlist_adj3 !=  (t_space*0.25) { tlist_adj3 = lerp(tlist_adj3,  (t_space*0.25), 0.05); }
		            if tlist_adj4 != -(t_space*0.25) { tlist_adj4 = lerp(tlist_adj4, -(t_space*0.25), 0.05); } 
				}
	        } 
	            else { 
	                ins_4 = false; 
	                if ins_3 == false { if tlist_adj3 != 0 { tlist_adj3 = lerp(tlist_adj3, 0, 0.05); } }
	            }
	        if point_distance(gui_mx, gui_my, ui_tx+(ix_5*ui_ratio), ui_ty+(ty_0*ui_ratio)) < s_dist  {
				if ins_5_count == 0 {
		            ins_5 = true;
		            if tlist_adj4 !=  (t_space*0.25) { tlist_adj4 = lerp(tlist_adj4,  (t_space*0.25), 0.05); }
		            if tlist_adj5 != -(t_space*0.25) { tlist_adj5 = lerp(tlist_adj5, -(t_space*0.25), 0.05); }
				}
	        } 
	            else { 
	                ins_5 = false; 
	                if ins_4 == false { if tlist_adj4 != 0 { tlist_adj4 = lerp(tlist_adj4, 0, 0.05); } }
	            }
	        if point_distance(gui_mx, gui_my, ui_tx+(ix_6*ui_ratio), ui_ty+(ty_0*ui_ratio)) < s_dist  {
				if ins_6_count == 0 {
		            ins_6 = true;
		            if tlist_adj5 !=  (t_space*0.25) { tlist_adj5 = lerp(tlist_adj5,  (t_space*0.25), 0.05); }
		            if tlist_adj6 != -(t_space*0.25) { tlist_adj6 = lerp(tlist_adj6, -(t_space*0.25), 0.05); } 
				}
	        } 
	            else { 
	                ins_6 = false;
	                if ins_5 == false { if tlist_adj5 != 0 { tlist_adj5 = lerp(tlist_adj5, 0, 0.05); } } 
	            }
	        if point_distance(gui_mx, gui_my, ui_tx+(ix_7*ui_ratio), ui_ty+(ty_0*ui_ratio)) < s_dist  {
				if ins_7_count == 0 {
		            ins_7 = true; 
		            if tlist_adj6 !=  (t_space*0.25) { tlist_adj6 = lerp(tlist_adj6,  (t_space*0.25), 0.05); }
		            if tlist_adj7 != -(t_space*0.25) { tlist_adj7 = lerp(tlist_adj7, -(t_space*0.25), 0.05); }
				}
	        } 
	            else { 
	                ins_7 = false; 
	                if ins_6 == false { if tlist_adj6 != 0 { tlist_adj6 = lerp(tlist_adj6, 0, 0.05); } }
	            }
	        if point_distance(gui_mx, gui_my, ui_tx+(ix_8*ui_ratio), ui_ty+(ty_0*ui_ratio)) < s_dist  {
				if ins_8_count == 0 {
		            ins_8 = true; 
		            if tlist_adj7 !=  (t_space*0.25) { tlist_adj7 = lerp(tlist_adj7,  (t_space*0.25), 0.05); }
		            if tlist_adj8 != -(t_space*0.25) { tlist_adj8 = lerp(tlist_adj8, -(t_space*0.25), 0.05); }
				}
	        } 
	            else { 
	                ins_8 = false; 
	                if ins_7 == false { if tlist_adj7 != 0 { tlist_adj7 = lerp(tlist_adj7, 0, 0.05); } }
	                if ins_9 == false { if tlist_adj8 != 0 { tlist_adj8 = lerp(tlist_adj8, 0, 0.05); } }
	            }
	        if point_distance(gui_mx, gui_my, ui_tx+(ix_9*ui_ratio), ui_ty+(ty_0*ui_ratio)) < s_dist {
				if ins_9_count == 0 {
		            ins_9 = true;
		            if tlist_adj8 !=  (t_space*0.25) { tlist_adj8 = lerp(tlist_adj8,  (t_space*0.25), 0.05); }
		            if tlist_adj9 != -(t_space*0.25) { tlist_adj9 = lerp(tlist_adj9, -(t_space*0.25), 0.05); }
				}
	        } 
	            else { 
	                ins_9 = false; 
	                if tlist_adj9 != 0 { tlist_adj9 = lerp(tlist_adj9, 0, 0.05); }
	            }
            
	        if mouse_check_button_released(mb_left) {
	            var ins_txt = "";
	            command_targeting = true;
	            if bomber_targeting == true {  bomber_targeting = false; ins_txt = "BOMBER"; }
	                else if missile_targeting == true { missile_targeting = false; ins_txt = "MISSILE"; }
	                    else if artillery_targeting == true { artillery_targeting = false; ins_txt = "ARTILLERY"; }
	                        else if uav_targeting == true { uav_targeting = false; ins_txt = "UAV"; }
	                            else if airdrop_targeting == true { airdrop_targeting = false; ins_txt = "AIRDROP"; }
	                                else if ilc_targeting == true { ilc_targeting = false; ins_txt = "ILC"; }
	                                    else if tlc_targeting == true { tlc_targeting = false; ins_txt = "TLC"; }
	                                        else if elc_targeting == true { elc_targeting = false; ins_txt = "ELC"; }   
	                                            else if blc_targeting == true { blc_targeting = false; ins_txt = "BLC"; }
	                                                else if llc_targeting == true { llc_targeting = false; ins_txt = "LLC"; }
	            if ins_1 == true { 
					var pos = 1;
	                ds_list_insert(global.turn_list, pos, ins_txt); 
					var atype = 1;
					ins_1_count = 12;
	                switch ins_txt {
	                    case "BOMBER":
							global.command_points -= 20; 
							global.draw_cpcost = true;
							cp_cost = 20;
				            active_bomber = true;
				            break;
				        case "MISSILE":
							global.command_points -= 10; 
							global.draw_cpcost = true;
							cp_cost = 10;
				            active_missile = true;
				            break;
				        case "ARTILLERY":
							global.command_points -= 10; 
							global.draw_cpcost = true;
							cp_cost = 10;
				            active_artillery = true;
				            break;
				        case "UAV":
							global.command_points -= 20; 
							global.draw_cpcost = true;
							cp_cost = 20;
				            active_uav = true;
				            break;
				        case "AIRDROP":
							global.command_points -= 20; 
							global.draw_cpcost = true;
							cp_cost = 20;
				            active_airdrop = true;
				            break;
				        case "ILC":
							global.command_points -= 10; 
							global.draw_cpcost = true;
							cp_cost = 10;
				            active_ilc = true;
				            break;
				        case "TLC":
							global.command_points -= 20; 
							global.draw_cpcost = true;
							cp_cost = 20;
				            active_tlc = true;
				            break;
				        case "ELC":
							global.command_points -= 20; 
							global.draw_cpcost = true;
							cp_cost = 20;
				            active_elc = true;
				            break;
				        case "BLC":
							global.command_points -= 20; 
							global.draw_cpcost = true;
							cp_cost = 20;
				            active_blc = true;
				            break;
				        case "LLC":
							global.command_points -= 10; 
							global.draw_cpcost = true;
							cp_cost = 10;
				            active_llc = true;
				            break;
	                } 
					if PLAYER.net_status == "HOST" {
						//Send list update signal to client
						var cc = ds_list_size(global.clients);
						if cc > 0 { 
							var i;
							for (i=0;i<cc;i++) {
								var csocket = ds_list_find_value(global.clients, i);
								net_write_client(csocket, 
									buffer_u8, NET_TLUPDATE,
									buffer_u8, atype,
									buffer_u8, pos,
									buffer_string, ins_txt
								);
							}
						}
					}
						else if PLAYER.net_status == "CLIENT" {
							//Send list update signal to host 
							net_write_server(
								buffer_u8, NET_TLUPDATE,
								buffer_u8, atype,
								buffer_u8, pos,
								buffer_string, ins_txt
							);
						}
	            }
	                else if ins_2 == true { 
	                    var ls = ds_list_size(global.turn_list);
	                    var pos = 2;
	                    if (ls < pos) { var atype = 2; ds_list_add(global.turn_list, ins_txt); }
	                        else { var atype = 1; ds_list_insert(global.turn_list, pos, ins_txt); } 
						ins_2_count = 12;
	                    switch ins_txt {
	                        case "BOMBER":
								global.command_points -= 20; 
								global.draw_cpcost = true;
								cp_cost = 20;
				                active_bomber = true;
				                break;
				            case "MISSILE":
								global.command_points -= 10; 
								global.draw_cpcost = true;
								cp_cost = 10;
				                active_missile = true;
				                break;
				            case "ARTILLERY":
								global.command_points -= 10; 
								global.draw_cpcost = true;
								cp_cost = 10;
				                active_artillery = true;
				                break;
				            case "UAV":
								global.command_points -= 20; 
								global.draw_cpcost = true;
								cp_cost = 20;
				                active_uav = true;
				                break;
				            case "AIRDROP":
								global.command_points -= 20; 
								global.draw_cpcost = true;
								cp_cost = 20;
				                active_airdrop = true;
				                break;
				            case "ILC":
								global.command_points -= 10; 
								global.draw_cpcost = true;
								cp_cost = 10;
				                active_ilc = true;
				                break;
				            case "TLC":
								global.command_points -= 20; 
								global.draw_cpcost = true;
								cp_cost = 20;
				                active_tlc = true;
				                break;
				            case "ELC":
								global.command_points -= 20; 
								global.draw_cpcost = true;
								cp_cost = 20;
				                active_elc = true;
				                break;
				            case "BLC":
								global.command_points -= 20; 
								global.draw_cpcost = true;
								cp_cost = 20;
				                active_blc = true;
				                break;
				            case "LLC":
								global.command_points -= 10; 
								global.draw_cpcost = true;
								cp_cost = 10;
				                active_llc = true;
				                break;
	                    }
						if PLAYER.net_status == "HOST" {
							//Send list update signal to client
							var cc = ds_list_size(global.clients);
							if cc > 0 { 
								var i;
								for (i=0;i<cc;i++) {
									var csocket = ds_list_find_value(global.clients, i);
									net_write_client(csocket, 
										buffer_u8, NET_TLUPDATE,
										buffer_u8, atype,
										buffer_u8, pos,
										buffer_string, ins_txt
									);
								}
							}
						}
							else if PLAYER.net_status == "CLIENT" {
								//Send list update signal to host
								net_write_server(
									buffer_u8, NET_TLUPDATE,
									buffer_u8, atype,
									buffer_u8, pos,
									buffer_string, ins_txt
								);
							}
	                }
	                    else if ins_3 == true { 
	                        var ls = ds_list_size(global.turn_list);
	                        var pos = 3;
	                        if (ls < pos) { var atype = 2; ds_list_add(global.turn_list, ins_txt); }
	                            else { var atype = 1; ds_list_insert(global.turn_list, pos, ins_txt); } 
							ins_3_count = 12;
	                        switch ins_txt {
	                            case "BOMBER":
									global.command_points -= 20; 
									global.draw_cpcost = true;
									cp_cost = 20;
				                    active_bomber = true;
				                    break;
				                case "MISSILE":
									global.command_points -= 10; 
									global.draw_cpcost = true;
									cp_cost = 10;
				                    active_missile = true;
				                    break;
				                case "ARTILLERY":
									global.command_points -= 10; 
									global.draw_cpcost = true;
									cp_cost = 10;
				                    active_artillery = true;
				                    break;
				                case "UAV":
									global.command_points -= 20; 
									global.draw_cpcost = true;
									cp_cost = 20;
				                    active_uav = true;
				                    break;
				                case "AIRDROP":
									global.command_points -= 20; 
									global.draw_cpcost = true;
									cp_cost = 20;
				                    active_airdrop = true;
				                    break;
				                case "ILC":
									global.command_points -= 10; 
									global.draw_cpcost = true;
									cp_cost = 10;
				                    active_ilc = true;
				                    break;
				                case "TLC":
									global.command_points -= 20; 
									global.draw_cpcost = true;
									cp_cost = 20;
				                    active_tlc = true;
				                    break;
				                case "ELC":
									global.command_points -= 20; 
									global.draw_cpcost = true;
									cp_cost = 20;
				                    active_elc = true;
				                    break;
				                case "BLC":
									global.command_points -= 20; 
									global.draw_cpcost = true;
									cp_cost = 20;
				                    active_blc = true;
				                    break;
				                case "LLC":
									global.command_points -= 10; 
									global.draw_cpcost = true;
									cp_cost = 10;
				                    active_llc = true;
				                    break;
	                        }
							if PLAYER.net_status == "HOST" {
								//Send list update signal to client
								var cc = ds_list_size(global.clients);
								if cc > 0 { 
									var i;
									for (i=0;i<cc;i++) {
										var csocket = ds_list_find_value(global.clients, i);
										net_write_client(csocket, 
											buffer_u8, NET_TLUPDATE,
											buffer_u8, atype,
											buffer_u8, pos,
											buffer_string, ins_txt
										);
									}
								}
							}
								else if PLAYER.net_status == "CLIENT" {
									//Send list update signal to host
									net_write_server(
										buffer_u8, NET_TLUPDATE,
										buffer_u8, atype,
										buffer_u8, pos,
										buffer_string, ins_txt
									);
								}
	                    }
	                        else if ins_4 == true { 
	                            var ls = ds_list_size(global.turn_list);
	                            var pos = 4;
	                            if (ls < pos) { var atype = 2; ds_list_add(global.turn_list, ins_txt); }
	                                else { var atype = 1; ds_list_insert(global.turn_list, pos, ins_txt); }  
								ins_4_count = 12;
	                            switch ins_txt {
	                                case "BOMBER":
										global.command_points -= 20; 
										global.draw_cpcost = true;
										cp_cost = 20;
				                        active_bomber = true;
				                        break;
				                    case "MISSILE":
										global.command_points -= 10; 
										global.draw_cpcost = true;
										cp_cost = 10;
				                        active_missile = true;
				                        break;
				                    case "ARTILLERY":
										global.command_points -= 10; 
										global.draw_cpcost = true;
										cp_cost = 10;
				                        active_artillery = true;
				                        break;
				                    case "UAV":
										global.command_points -= 20; 
										global.draw_cpcost = true;
										cp_cost = 20;
				                        active_uav = true;
				                        break;
				                    case "AIRDROP":
										global.command_points -= 20; 
										global.draw_cpcost = true;
										cp_cost = 20;
				                        active_airdrop = true;
				                        break;
				                    case "ILC":
										global.command_points -= 10; 
										global.draw_cpcost = true;
										cp_cost = 10;
				                        active_ilc = true;
				                        break;
				                    case "TLC":
										global.command_points -= 20; 
										global.draw_cpcost = true;
										cp_cost = 20;
				                        active_tlc = true;
				                        break;
				                    case "ELC":
										global.command_points -= 20; 
										global.draw_cpcost = true;
										cp_cost = 20;
				                        active_elc = true;
				                        break;
				                    case "BLC":
										global.command_points -= 20; 
										global.draw_cpcost = true;
										cp_cost = 20;
				                        active_blc = true;
				                        break;
				                    case "LLC":
										global.command_points -= 10; 
										global.draw_cpcost = true;
										cp_cost = 10;
				                        active_llc = true;
				                        break;
	                            }
								if PLAYER.net_status == "HOST" {
									//Send list update signal to client
									var cc = ds_list_size(global.clients);
									if cc > 0 { 
										var i;
										for (i=0;i<cc;i++) {
											var csocket = ds_list_find_value(global.clients, i);
											net_write_client(csocket, 
												buffer_u8, NET_TLUPDATE,
												buffer_u8, atype,
												buffer_u8, pos,
												buffer_string, ins_txt
											);
										}
									}
								}
									else if PLAYER.net_status == "CLIENT" {
										//Send list update signal to host
										net_write_server(
											buffer_u8, NET_TLUPDATE,
											buffer_u8, atype,
											buffer_u8, pos,
											buffer_string, ins_txt
										);
									}
	                        }
	                            else if ins_5 == true { 
	                                var ls = ds_list_size(global.turn_list);
	                                var pos = 5;
	                                if (ls < pos) { var atype = 2; ds_list_add(global.turn_list, ins_txt); }
	                                    else { var atype = 1; ds_list_insert(global.turn_list, pos, ins_txt); } 
									ins_5_count = 12;
	                                switch ins_txt {
	                                    case "BOMBER":
											global.command_points -= 20; 
											global.draw_cpcost = true;
											cp_cost = 20;
					                        active_bomber = true;
					                        break;
					                    case "MISSILE":
											global.command_points -= 10; 
											global.draw_cpcost = true;
											cp_cost = 10;
					                        active_missile = true;
					                        break;
					                    case "ARTILLERY":
											global.command_points -= 10; 
											global.draw_cpcost = true;
											cp_cost = 10;
					                        active_artillery = true;
					                        break;
					                    case "UAV":
											global.command_points -= 20; 
											global.draw_cpcost = true;
											cp_cost = 20;
					                        active_uav = true;
					                        break;
					                    case "AIRDROP":
											global.command_points -= 20; 
											global.draw_cpcost = true;
											cp_cost = 20;
					                        active_airdrop = true;
					                        break;
					                    case "ILC":
											global.command_points -= 10; 
											global.draw_cpcost = true;
											cp_cost = 10;
					                        active_ilc = true;
					                        break;
					                    case "TLC":
											global.command_points -= 20; 
											global.draw_cpcost = true;
											cp_cost = 20;
					                        active_tlc = true;
					                        break;
					                    case "ELC":
											global.command_points -= 20; 
											global.draw_cpcost = true;
											cp_cost = 20;
					                        active_elc = true;
					                        break;
					                    case "BLC":
											global.command_points -= 20; 
											global.draw_cpcost = true;
											cp_cost = 20;
					                        active_blc = true;
					                        break;
					                    case "LLC":
											global.command_points -= 10; 
											global.draw_cpcost = true;
											cp_cost = 10;
					                        active_llc = true;
					                        break;
	                                }
									if PLAYER.net_status == "HOST" {
										//Send list update signal to client
										var cc = ds_list_size(global.clients);
										if cc > 0 { 
											var i;
											for (i=0;i<cc;i++) {
												var csocket = ds_list_find_value(global.clients, i);
												net_write_client(csocket, 
													buffer_u8, NET_TLUPDATE,
													buffer_u8, atype,
													buffer_u8, pos,
													buffer_string, ins_txt
												);
											}
										}
									}
										else if PLAYER.net_status == "CLIENT" {
											//Send list update signal to host
											net_write_server(
												buffer_u8, NET_TLUPDATE,
												buffer_u8, atype,
												buffer_u8, pos,
												buffer_string, ins_txt
											);
										}
	                            }
	                                else if ins_6 == true { 
	                                    var ls = ds_list_size(global.turn_list);
	                                    var pos = 6;
	                                    if (ls < pos) { var atype = 2; ds_list_add(global.turn_list, ins_txt); }
	                                        else { var atype = 1; ds_list_insert(global.turn_list, pos, ins_txt); } 
										ins_6_count = 12;
	                                    switch ins_txt {
	                                        case "BOMBER":
												global.command_points -= 20; 
												global.draw_cpcost = true;
												cp_cost = 20;
						                        active_bomber = true;
						                        break;
						                    case "MISSILE":
												global.command_points -= 10; 
												global.draw_cpcost = true;
												cp_cost = 10;
						                        active_missile = true;
						                        break;
						                    case "ARTILLERY":
												global.command_points -= 10; 
												global.draw_cpcost = true;
												cp_cost = 10;
						                        active_artillery = true;
						                        break;
						                    case "UAV":
												global.command_points -= 20; 
												global.draw_cpcost = true;
												cp_cost = 20;
						                        active_uav = true;
						                        break;
						                    case "AIRDROP":
												global.command_points -= 20; 
												global.draw_cpcost = true;
												cp_cost = 20;
						                        active_airdrop = true;
						                        break;
						                    case "ILC":
												global.command_points -= 10; 
												global.draw_cpcost = true;
												cp_cost = 10;
						                        active_ilc = true;
						                        break;
						                    case "TLC":
												global.command_points -= 20; 
												global.draw_cpcost = true;
												cp_cost = 20;
						                        active_tlc = true;
						                        break;
						                    case "ELC":
												global.command_points -= 20; 
												global.draw_cpcost = true;
												cp_cost = 20;
						                        active_elc = true;
						                        break;
						                    case "BLC":
												global.command_points -= 20; 
												global.draw_cpcost = true;
												cp_cost = 20;
						                        active_blc = true;
						                        break;
						                    case "LLC":
												global.command_points -= 10; 
												global.draw_cpcost = true;
												cp_cost = 10;
						                        active_llc = true;
						                        break;
	                                    }
										if PLAYER.net_status == "HOST" {
											//Send list update signal to client
											var cc = ds_list_size(global.clients);
											if cc > 0 { 
												var i;
												for (i=0;i<cc;i++) {
													var csocket = ds_list_find_value(global.clients, i);
													net_write_client(csocket, 
														buffer_u8, NET_TLUPDATE,
														buffer_u8, atype,
														buffer_u8, pos,
														buffer_string, ins_txt
													);
												}
											}
										}
											else if PLAYER.net_status == "CLIENT" {
												//Send list update signal to host
												net_write_server(
													buffer_u8, NET_TLUPDATE,
													buffer_u8, atype,
													buffer_u8, pos,
													buffer_string, ins_txt
												);
											}
	                                }
	                                    else if ins_7 == true { 
	                                        var ls = ds_list_size(global.turn_list);
	                                        var pos = 7;
	                                        if (ls < pos) { var atype = 2; ds_list_add(global.turn_list, ins_txt); }
	                                            else { var atype = 1; ds_list_insert(global.turn_list, pos, ins_txt); } 
											ins_7_count = 12;
	                                        switch ins_txt {
	                                            case "BOMBER":
													global.command_points -= 20; 
													global.draw_cpcost = true;
													cp_cost = 20;
							                        active_bomber = true;
							                        break;
							                    case "MISSILE":
													global.command_points -= 10; 
													global.draw_cpcost = true;
													cp_cost = 10;
							                        active_missile = true;
							                        break;
							                    case "ARTILLERY":
													global.command_points -= 10; 
													global.draw_cpcost = true;
													cp_cost = 10;
							                        active_artillery = true;
							                        break;
							                    case "UAV":
													global.command_points -= 20; 
													global.draw_cpcost = true;
													cp_cost = 20;
							                        active_uav = true;
							                        break;
							                    case "AIRDROP":
													global.command_points -= 20; 
													global.draw_cpcost = true;
													cp_cost = 20;
							                        active_airdrop = true;
							                        break;
							                    case "ILC":
													global.command_points -= 10; 
													global.draw_cpcost = true;
													cp_cost = 10;
							                        active_ilc = true;
							                        break;
							                    case "TLC":
													global.command_points -= 20; 
													global.draw_cpcost = true;
													cp_cost = 20;
							                        active_tlc = true;
							                        break;
							                    case "ELC":
													global.command_points -= 20; 
													global.draw_cpcost = true;
													cp_cost = 20;
							                        active_elc = true;
							                        break;
							                    case "BLC":
													global.command_points -= 20; 
													global.draw_cpcost = true;
													cp_cost = 20;
							                        active_blc = true;
							                        break;
							                    case "LLC":
													global.command_points -= 10; 
													global.draw_cpcost = true;
													cp_cost = 10;
							                        active_llc = true;
							                        break;
	                                        }
											if PLAYER.net_status == "HOST" {
												//Send list update signal to client
												var cc = ds_list_size(global.clients);
												if cc > 0 { 
													var i;
													for (i=0;i<cc;i++) {
														var csocket = ds_list_find_value(global.clients, i);
														net_write_client(csocket, 
															buffer_u8, NET_TLUPDATE,
															buffer_u8, atype,
															buffer_u8, pos,
															buffer_string, ins_txt
														);
													}
												}
											}
												else if PLAYER.net_status == "CLIENT" {
													//Send list update signal to host
													net_write_server(
														buffer_u8, NET_TLUPDATE,
														buffer_u8, atype,
														buffer_u8, pos,
														buffer_string, ins_txt
													);
												}
	                                    }
	                                        else if ins_8 == true { 
	                                            var ls = ds_list_size(global.turn_list);
	                                            var pos = 8;
	                                            if (ls < pos) { var atype = 2; ds_list_add(global.turn_list, ins_txt); } 
	                                                else { var atype = 1; ds_list_insert(global.turn_list, pos, ins_txt); } 
												ins_8_count = 12;
	                                            switch ins_txt {
	                                                case "BOMBER":
														global.command_points -= 20; 
														global.draw_cpcost = true;
														cp_cost = 20;
								                        active_bomber = true;
								                        break;
								                    case "MISSILE":
														global.command_points -= 10; 
														global.draw_cpcost = true;
														cp_cost = 10;
								                        active_missile = true;
								                        break;
								                    case "ARTILLERY":
														global.command_points -= 10; 
														global.draw_cpcost = true;
														cp_cost = 10;
								                        active_artillery = true;
								                        break;
								                    case "UAV":
														global.command_points -= 20; 
														global.draw_cpcost = true;
														cp_cost = 20;
								                        active_uav = true;
								                        break;
								                    case "AIRDROP":
														global.command_points -= 20; 
														global.draw_cpcost = true;
														cp_cost = 20;
								                        active_airdrop = true;
								                        break;
								                    case "ILC":
														global.command_points -= 10; 
														global.draw_cpcost = true;
														cp_cost = 10;
								                        active_ilc = true;
								                        break;
								                    case "TLC":
														global.command_points -= 20; 
														global.draw_cpcost = true;
														cp_cost = 20;
								                        active_tlc = true;
								                        break;
								                    case "ELC":
														global.command_points -= 20; 
														global.draw_cpcost = true;
														cp_cost = 20;
								                        active_elc = true;
								                        break;
								                    case "BLC":
														global.command_points -= 20; 
														global.draw_cpcost = true;
														cp_cost = 20;
								                        active_blc = true;
								                        break;
								                    case "LLC":
														global.command_points -= 10; 
														global.draw_cpcost = true;
														cp_cost = 10;
								                        active_llc = true;
								                        break;
	                                            }
												if PLAYER.net_status == "HOST" {
													//Send list update signal to client
													var cc = ds_list_size(global.clients);
													if cc > 0 { 
														var i;
														for (i=0;i<cc;i++) {
															var csocket = ds_list_find_value(global.clients, i);
															net_write_client(csocket, 
																buffer_u8, NET_TLUPDATE,
																buffer_u8, atype,
																buffer_u8, pos,
																buffer_string, ins_txt
															);
														}
													}
												}
													else if PLAYER.net_status == "CLIENT" {
														//Send list update signal to host
														net_write_server(
															buffer_u8, NET_TLUPDATE,
															buffer_u8, atype,
															buffer_u8, pos,
															buffer_string, ins_txt
														);
													}
	                                        }
	                                            else if ins_9 == true { 
	                                                var ls = ds_list_size(global.turn_list);
	                                                var pos = 9;
	                                                if (ls < pos) { var atype = 2; ds_list_add(global.turn_list, ins_txt); } 
	                                                    else { var atype = 1; ds_list_insert(global.turn_list, pos, ins_txt); } 
													ins_9_count = 12;
	                                                switch ins_txt {
	                                                    case "BOMBER":
															global.command_points -= 20; 
															global.draw_cpcost = true;
															cp_cost = 20;
									                        active_bomber = true;
									                        break;
									                    case "MISSILE":
															global.command_points -= 10; 
															global.draw_cpcost = true;
															cp_cost = 10;
									                        active_missile = true;
									                        break;
									                    case "ARTILLERY":
															global.command_points -= 10; 
															global.draw_cpcost = true;
															cp_cost = 10;
									                        active_artillery = true;
									                        break;
									                    case "UAV":
															global.command_points -= 20; 
															global.draw_cpcost = true;
															cp_cost = 20;
									                        active_uav = true;
									                        break;
									                    case "AIRDROP":
															global.command_points -= 20; 
															global.draw_cpcost = true;
															cp_cost = 20;
									                        active_airdrop = true;
									                        break;
									                    case "ILC":
															global.command_points -= 10; 
															global.draw_cpcost = true;
															cp_cost = 10;
									                        active_ilc = true;
									                        break;
									                    case "TLC":
															global.command_points -= 20; 
															global.draw_cpcost = true;
															cp_cost = 20;
									                        active_tlc = true;
									                        break;
									                    case "ELC":
															global.command_points -= 20; 
															global.draw_cpcost = true;
															cp_cost = 20;
									                        active_elc = true;
									                        break;
									                    case "BLC":
															global.command_points -= 20; 
															global.draw_cpcost = true;
															cp_cost = 20;
									                        active_blc = true;
									                        break;
									                    case "LLC":
															global.command_points -= 10; 
															global.draw_cpcost = true;
															cp_cost = 10;
									                        active_llc = true;
									                        break;
	                                                }
													if PLAYER.net_status == "HOST" {
														//Send list update signal to client
														var cc = ds_list_size(global.clients);
														if cc > 0 { 
															var i;
															for (i=0;i<cc;i++) {
																var csocket = ds_list_find_value(global.clients, i);
																net_write_client(csocket, 
																	buffer_u8, NET_TLUPDATE,
																	buffer_u8, atype,
																	buffer_u8, pos,
																	buffer_string, ins_txt
																);
															}
														}
													}
														else if PLAYER.net_status == "CLIENT" {
															//Send list update signal to host
															net_write_server(
																buffer_u8, NET_TLUPDATE,
																buffer_u8, atype,
																buffer_u8, pos,
																buffer_string, ins_txt
															);
														}
	                                            }
	        }
	    }



}
