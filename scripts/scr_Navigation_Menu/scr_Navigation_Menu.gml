function scr_Navigation_Menu() {
	//Draw lines to selection for visual confirmation
	//Nav menu options
	//Set a pivot point where all lines can join before being affected by the menu choice
	var pxx  = global.menu_x - global.cell_size;
	var pyy  = global.menu_y + ((array_length_1d(global.nav_options)*global.v_spacing)*0.5);
	var adjm = global.v_spacing * global.menu_option;

	switch global.menu_option {
	    case 0:
	        draw_line_width_colour(pxx, pyy, global.menu_x-2, global.menu_y+(global.v_spacing*0.5), 3, c_black, c_black);
	        draw_line_colour(pxx, pyy, global.menu_x-2, global.menu_y+(global.v_spacing*0.5), c_dkgray, c_silver);
	        break;
	    case 1:
	        draw_line_width_colour(pxx, pyy, global.menu_x-2, global.menu_y+(global.v_spacing*0.5)+adjm, 3, c_black, c_black);
	        draw_line_colour(pxx, pyy, global.menu_x-2, global.menu_y+(global.v_spacing*0.5)+adjm, c_dkgray, c_silver);
	        break;
	    case 2:
	        draw_line_width_colour(pxx, pyy, global.menu_x-2, global.menu_y+(global.v_spacing*0.5)+adjm, 3, c_black, c_black);
	        draw_line_colour(pxx, pyy, global.menu_x-2, global.menu_y+(global.v_spacing*0.5)+adjm, c_dkgray, c_silver);
	        break;
	    default:
	        break;
	}
	draw_circle_colour(pxx, pyy, 4, c_black, c_white, false);


	var m;
	for (m = 0; m < array_length_1d(global.nav_options); m += 1){
	    //Draw menu options from menu array
	    var c1;
	    if m == global.menu_option {
	        if m == array_length_1d(global.nav_options)-1 { c1 = c_red; } 
	            else if m == global.menu_option { c1 = c_white; } 
	                else { c1 = c_gray; }
	    }
	        else {
	            c1 = c_gray;
	        }
	    draw_sprite(spr_Menu_Border, 0, global.menu_x, global.menu_y + (m * global.v_spacing));
	    draw_text_colour_shadow(global.menu_x+(global.h_spacing*0.5), (global.menu_y+(global.v_spacing*0.5)) + (m * global.v_spacing), global.nav_options[m], c1, c1, c1, c1, 1, 300, c_black, 0.2);
	    if m == global.menu_option { draw_sprite(spr_Menu_Glass, 0, global.menu_x, global.menu_y + (m * global.v_spacing)); }
	}



}
