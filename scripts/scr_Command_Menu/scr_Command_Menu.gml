function scr_Command_Menu() {
	if surface_exists(global.menu_surf) {
		surface_set_target(global.menu_surf);
		var cw = gpu_get_colorwriteenable();
		cw[3] = false;
		gpu_set_colorwriteenable(cw);
		draw_set_font(fnt_16);
		//Draw the unit header
		draw_sprite(spr_Menu_Header, 0, 0, 0);
		var txt;
		if draw_bomber == true { txt = "Bombing Run"; }
		    else if draw_missile == true { txt = "Missile Strike"; }
		        else if draw_uav == true { txt = "Spy Drone"; }
		            else if draw_artillery == true { txt = "Artillery"; }
		                else if draw_airdrop == true { txt = "Airdrop"; }
		                    else if draw_ilc == true { txt = "Infantry"; }
		                        else if draw_tlc == true { txt = "Tank"; }
		                            else if draw_elc == true { txt = "Engineer"; }
		                                else if draw_blc == true { txt = "LAV"; }
		                                    else if draw_llc == true { txt = "Logistics"; }
		                                        else txt = "";
		//Draw the header text
		draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), txt, c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
		//Draw the confirmation menu
		if confirm_list == 1 {
		    var m;
		    for (m = 0; m < array_length(command_menu); m += 1){
		        //Draw border boxes for each menu option
				draw_sprite(spr_Menu_Border, 0, 0, 0+(m*global.menu_height)+global.menu_height);
		        //Set ammo count to corresponding ammo type
		        if (m == 0) {
		            var c1;
		            if m == menu_option { 
		                switch m {
		                default:
		                    c1 = c_white;
		                    break
		                }
		            }
		                else { c1 = c_gray; }
		            //CONFIRM
					draw_text_colour_shadow(0+(global.menu_width*0.5), (0+(global.menu_height*0.5))+(m*global.menu_height)+global.menu_height, command_menu[m], c1, c1, c1, c1, 1, 300, c_black, 0.2);
		        }
		            else if (m == 1) {
		                var c2;
		                    if m == menu_option { c2 = c_white; } else { c2 = c_gray; }
							draw_text_colour_shadow(0+(global.menu_width*0.5), (0+(global.menu_height*0.5))+(m*global.menu_height)+global.menu_height, command_menu[m], c2, c2, c2, c2, 1, 300, c_black, 0.2);
		            }
		                else {
		                    var c3;
		                    if m == menu_option { c3 = c_red; } else { c3 = c_gray; }
		                    //CANCEL
							draw_text_colour_shadow(0+(global.menu_width*0.5), (0+(global.menu_height*0.5))+(m*global.menu_height)+global.menu_height, command_menu[m], c3, c3, c3, c3, 1, 300, c_black, 0.2);
		                }
		        if m == menu_option  { draw_sprite(spr_Menu_Glass, 0, 0, 0+(m*global.menu_height)+global.menu_height); }
		    }
		}
		    else if confirm_list == 2 {
		        var m;
		        for (m = 0; m < array_length(reinforce_menu); m += 1){
		            //Draw border boxes for each menu option
		            draw_sprite(spr_Menu_Border, 0, 0, 0+(m*global.menu_height)+global.menu_height);
		            //Set ammo count to corresponding ammo type
		            if (m < 5) {
		                var c1;
		                if m == menu_option { 
		                    switch m {
								case 0:
									if alpha_exists = true { c1 = c_white; } else { c1 = c_red; }
									break;
								case 1:
									if bravo_exists = true { c1 = c_white; } else { c1 = c_red; }
									break;
								case 2:
									if charlie_exists = true { c1 = c_white; } else { c1 = c_red; }
									break;
								case 3:
									if delta_exists = true { c1 = c_white; } else { c1 = c_red; }
									break;
								case 4:
									if echo_exists = true { c1 = c_white; } else { c1 = c_red; }
									break;
			                    default:
			                        c1 = c_white;
			                        break;
		                    }
		                }
		                    else { c1 = c_gray; }
		                //CONFIRM
		                draw_text_colour_shadow(0+(global.menu_width*0.5), (0+(global.menu_height*0.5))+(m*global.menu_height)+global.menu_height, reinforce_menu[m], c1, c1, c1, c1, 1, 300, c_black, 0.2);
		            }
		                else {
		                    var c2;
		                    if m == menu_option { c2 = c_red; } else { c2 = c_gray; }
		                    //RETARGET
		                    draw_text_colour_shadow(0+(global.menu_width*0.5), (0+(global.menu_height*0.5))+(m*global.menu_height)+global.menu_height, reinforce_menu[m], c2, c2, c2, c2, 1, 300, c_black, 0.2);
		                }
		            if m == menu_option  { draw_sprite(spr_Menu_Glass, 0, 0, 0+(m * global.menu_height)+global.menu_height); }
		        }
		    }
		draw_set_font(fnt_12);
		draw_set_halign(fa_center);
		surface_reset_target();
		draw_surface_ext(global.menu_surf, global.menu_x, global.menu_y, (1*global.menu_ratio)*menu_scl, (1*global.menu_ratio)*menu_scl, txt_rot, c_white, menu_alpha);
		cw[3] = true;
		gpu_set_colorwriteenable(cw);
	}
		else {
			var mlen;
			if confirm_list == 1 { mlen = array_length(command_menu); }
				else if confirm_list == 2 { mlen = array_length(reinforce_menu); }
			global.menu_surf = surface_create(global.menu_width, global.menu_height*(mlen+1));
	        surface_set_target(global.menu_surf);
	        draw_clear_alpha(c_black, 1);
	        surface_reset_target();
		}


}
