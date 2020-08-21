/// @description scr_Action_Menu(menu_list, menu_length)
/// @param menu_list
/// @param menu_length
function scr_Action_Menu(argument0, argument1) {

	var mlis = argument0;
	var mlen = argument1;

	if surface_exists(global.menu_surf) {
		surface_set_target(global.menu_surf);
		//draw_clear_alpha(c_black, 1);
		var m;
		for (m=0; m<mlen; m+=1){
			//Draw menu options from menu array
			var c1;
			if m == global.menu_option {
			    if m == mlen-1 { c1 = c_red; } 
			        else if m == 0 { if global.turn_AP != 0 { c1 = c_white; } else { c1 = c_red; } }
			            else if m == 1 { if global.turn_AP != 0 { c1 = c_white; } else { c1 = c_red; } }
			                else if m == global.menu_option { c1 = c_white; } 
			                    else { c1 = c_gray; }
			}
			    else {
			        c1 = c_gray;
			    }
			draw_sprite(spr_Menu_Border, 0, 0, 0+(m*global.menu_height));
			draw_text_colour_shadow(0+(global.menu_width*0.5), (0+(global.menu_height*0.5))+(m*global.menu_height), mlis[m], c1, c1, c1, c1, 1, 300, c_black, 0.2);
			if m == global.menu_option { draw_sprite(spr_Menu_Glass, 0, 0, 0+(m*global.menu_height)); }
		}
		surface_reset_target();
		draw_surface_ext(global.menu_surf, global.menu_x, global.menu_y, (1*global.menu_ratio)*menu_scl, (1*global.menu_ratio)*menu_scl, txt_rot, c_white, menu_alpha);
	}
		else {
			global.menu_surf = surface_create(global.menu_width, global.menu_height*mlen);
	        surface_set_target(global.menu_surf);
	        draw_clear_alpha(c_black, 1);
	        surface_reset_target();
		}


}
