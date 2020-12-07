function scr_SupplyShip_Logi_Menu() {
	/*
	lala_fire_menu[0] = "Ammunition";
	lala_fire_menu[1] = "Parts";
	lala_fire_menu[2] = "Retarget";
	lala_fire_menu[3] = "Cancel";
	*/

	//Draw the unit header
	draw_sprite(spr_Menu_Header, 0, global.menu_x, global.menu_y - global.v_spacing);
	draw_text_colour_shadow(global.menu_x+(global.h_spacing*0.5), (global.menu_y - global.v_spacing*0.5), "SUPPLY SHIP", c_gray, c_gray, c_gray, c_gray, 1, 0, c_black, 1);
	//Draw the unit resupply menu
	var m;
	for (m = 0; m < array_length(lala_fire_menu); m += 1){
	    //Draw border boxes for each menu option
	    draw_sprite(spr_Menu_Border, 0, global.menu_x, global.menu_y + (m * global.v_spacing));
	    //Set ammo count to corresponding ammo type
	    if (m < array_length(lala_fire_menu)-2) {
		
		
	        switch m {
	            case 0:
	                shoot_amount = global.logiamo_s_amount;
	                ammo_count   = global.lc_ammunition_ammo;
	                break;
	            case 1:
	                shoot_amount = global.logibld_s_amount;
	                ammo_count   = global.lc_parts_ammo;
	                break;
	            default:
	                shoot_amount = 0;
	                break
	        }
	        var c1;
	        if m == global.fire_option { 
	            switch m {
	            case 0:
	                if global.lc_ammunition_ammo <= 0 { c1 = c_red; }
	                    else { c1 = c_white; }
	                break;
	            case 1:
	                if global.lc_parts_ammo <= 0 { c1 = c_red; }
	                    else { c1 = c_white; }
	                break;
	            default:
	                c1 = c_white;
	                break
	            }
	        }
	            else { c1 = c_gray; }
			
			
	        //Draw the text from the corresponding fire_menu option and ammo count 
	        draw_text_colour_shadow(global.menu_x+(global.h_spacing*0.5), (global.menu_y+(global.v_spacing*0.5)) + (m * global.v_spacing), lala_fire_menu[m] + " " + "x" + " " + string(shoot_amount), c1, c1, c1, c1, 1, 300, c_black, 0.2);
	    }
	        else if (m == array_length(lala_fire_menu)-2) {
	            var c2;
	                if m == global.fire_option { c2 = c_white; } else { c2 = c_gray; }
	                //For RE-TARGET
	                draw_text_colour_shadow(global.menu_x+(global.h_spacing*0.5), (global.menu_y+(global.v_spacing*0.5)) + (m * global.v_spacing), lala_fire_menu[m], c2, c2, c2, c2, 1, 300, c_black, 0.2);
	        }
	            else {
	                var c3;
	                if m == global.fire_option { c3 = c_red; } else { c3 = c_gray; }
	                //For CANCEL
	                draw_text_colour_shadow(global.menu_x+(global.h_spacing*0.5), (global.menu_y+(global.v_spacing*0.5)) + (m * global.v_spacing), lala_fire_menu[m], c3, c3, c3, c3, 1, 300, c_black, 0.2);
	            }
	    if m == global.fire_option  { draw_sprite(spr_Menu_Glass, 0, global.menu_x, global.menu_y + (m * global.v_spacing)); }
	}



}
