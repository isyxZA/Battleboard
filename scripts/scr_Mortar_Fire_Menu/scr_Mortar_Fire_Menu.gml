function scr_Mortar_Fire_Menu() {
	//Draw the unit header
	draw_sprite(spr_Menu_Header, 0, global.menu_x, global.menu_y - global.v_spacing);

	if global.selected_tank != 0 || global.selected_engineer != 0 || global.selected_btr != 0 
	    || global.selected_logi != 0 || global.selected_depot != 0 || global.selected_repair != 0  
	        || global.selected_tow != 0  || global.selected_infantry != 0 {
	    var hs;
	    if global.header_highlight == false { hs = spr_Arrowhead_White; } else { 
	        hs = spr_Arrowhead_Green; 
	        obj_ACTIONMENU.display_tabinfo = true;
	    }
	    gpu_set_blendmode(bm_add);
	    draw_sprite_ext(hs, 0, global.menu_x+(global.h_spacing*0.2), (global.menu_y - global.v_spacing*0.5), 0.25, 0.25, 0, c_white, 0.2);
	    draw_sprite_ext(hs, 0, global.menu_x+(global.h_spacing*0.5), (global.menu_y - global.v_spacing*0.5), 0.5, 0.5, 0, c_white, 0.5); 
	    draw_sprite_ext(hs, 0, global.menu_x+(global.h_spacing*0.8), (global.menu_y - global.v_spacing*0.5), 0.75, 0.75, 0, c_white, 1);
	    gpu_set_blendmode(bm_normal);
	}

	draw_text_colour_shadow(global.menu_x+(global.h_spacing*0.5), (global.menu_y - global.v_spacing*0.5), "MORTAR", c_gray, c_gray, c_gray, c_gray, 1, 0, c_black, 1);

	//Draw the unit firing menu
	var m;
	for (m = 0; m < array_length(m_fire_menu); m += 1){
	    //Draw border boxes for each menu option
	    draw_sprite(spr_Menu_Border, 0, global.menu_x, global.menu_y + (m * global.v_spacing));
	    //Set ammo count to corresponding ammo type
	    if (m < array_length(m_fire_menu)-2) {
		
		
	        switch m {
	            case 0:
	                shoot_amount = global.mortarS_amount;
	                ammo_count   = global.mortar_ammo;
	                break;
	            default:
	                shoot_amount = 0;
	                break
	        }
	        var c1;
	        if m == global.fire_option { 
	            switch m {
	            case 0:
	                if global.mortar_ammo <= 0 { c1 = c_red; }
	                    else { c1 = c_white; }
	                break;
	            default:
	                c1 = c_white;
	                break
	            }
	        }
	            else { c1 = c_gray; }
			
			
	        //Draw the text from the corresponding fire_menu option and ammo count 
	        draw_text_colour_shadow(global.menu_x+(global.h_spacing*0.5), (global.menu_y+(global.v_spacing*0.5)) + (m * global.v_spacing), m_fire_menu[m] + " " + "x" + " " + string(shoot_amount), c1, c1, c1, c1, 1, 300, c_black, 0.2);
	    }
	        else if (m == array_length(m_fire_menu)-2) {
	            var c2;
	                if m == global.fire_option { c2 = c_white; } else { c2 = c_gray; }
	                //For RE-TARGET
	                draw_text_colour_shadow(global.menu_x+(global.h_spacing*0.5), (global.menu_y+(global.v_spacing*0.5)) + (m * global.v_spacing), m_fire_menu[m], c2, c2, c2, c2, 1, 300, c_black, 0.2);
	        }
	            else {
	                var c3;
	                if m == global.fire_option { c3 = c_red; } else { c3 = c_gray; }
	                //For CANCEL
	                draw_text_colour_shadow(global.menu_x+(global.h_spacing*0.5), (global.menu_y+(global.v_spacing*0.5)) + (m * global.v_spacing), m_fire_menu[m], c3, c3, c3, c3, 1, 300, c_black, 0.2);
	            }
	    if m == global.fire_option  { draw_sprite(spr_Menu_Glass, 0, global.menu_x, global.menu_y + (m * global.v_spacing)); }
	}



}
