function scr_Repair_Vehicle_Menu() {
	var mlen = array_length(r_vehicle_menu);

	if surface_exists(global.menu_surf) {
		surface_set_target(global.menu_surf);
		var cw = gpu_get_colorwriteenable();
		cw[3] = false;
		gpu_set_colorwriteenable(cw);
		//Draw the unit header
		draw_sprite(spr_Menu_Header, 0, 0, 0);
		draw_text_colour_shadow(0+(global.menu_width*0.5), 0+(global.menu_height*0.5), "REPAIR-V", c_gray, c_gray, c_gray, c_gray, 1, 300, c_black, 0.2);
		//Draw the unit firing menu
		var m;
		for (m=0; m<mlen; m+=1){
		    //Draw border boxes for each menu option
			draw_sprite(spr_Menu_Border, 0, 0, global.menu_height+(m*global.menu_height));
		    //Set ammo count to corresponding ammo type
		    if (m < mlen-1) {
		        switch m {
		            case 0:
		                shoot_amount = global.repair_v_amount;
		                ammo_count   = global.repair_ammo;
		                break;
		            default:
		                shoot_amount = 0;
		                break;
		        }
		        var c1;
		        if m == global.fire_option { 
		            switch m {
		            case 0:
		                if global.repair_ammo <= 0 { c1 = c_red; }
		                    else { c1 = c_white; }
		                break;
		            default:
		                c1 = c_white;
		                break
		            }
		        }
		            else { c1 = c_gray; }
		        //Draw the text from the corresponding fire_menu option and ammo count 
				draw_text_colour_shadow(0+(global.menu_width*0.5), (0+(global.menu_height*0.5))+(m*global.menu_height)+global.menu_height, r_vehicle_menu[m] + " " + "x" + " " + string(shoot_amount), c1, c1, c1, c1, 1, 300, c_black, 0.2);
		    }
		        else {
		            var c3;
		            if m == global.fire_option { c3 = c_red; } else { c3 = c_gray; }
		            //For CANCEL
		            draw_text_colour_shadow(0+(global.menu_width*0.5), (0+(global.menu_height*0.5))+(m*global.menu_height)+global.menu_height, r_vehicle_menu[m], c3, c3, c3, c3, 1, 300, c_black, 0.2);
		        }
		    if m == global.fire_option { draw_sprite(spr_Menu_Glass, 0, 0, 0+(m*global.menu_height)+global.menu_height); }
		}
		surface_reset_target();
		draw_surface_ext(global.menu_surf, global.menu_x, global.menu_y, (1*global.menu_ratio)*menu_scl, (1*global.menu_ratio)*menu_scl, txt_rot, c_white, menu_alpha);
		cw[3] = true;
		gpu_set_colorwriteenable(cw);
	}
		else {
			global.menu_surf = surface_create(global.menu_width, global.menu_height*(mlen+1));
	        surface_set_target(global.menu_surf);
	        draw_clear_alpha(c_black, 1);
	        surface_reset_target();
		}


}
