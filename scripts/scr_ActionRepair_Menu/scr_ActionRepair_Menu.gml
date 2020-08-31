function scr_ActionRepair_Menu() {
	//Action menu with repair option
	//Set a pivot point where all lines can join before being affected by the menu choice
	var ppx = global.menu_x - global.cell_size;
	var ppy = global.menu_y + ((array_length(global.action_repair_menu)*global.v_spacing)*0.5);
	var adja = global.v_spacing * global.menu_option;
	switch global.menu_option {
	    case 0:
	        draw_line_width_colour(ppx, ppy, global.menu_x-2, global.menu_y+(global.v_spacing*0.5), 3, c_black, c_black);
	        draw_line_colour(ppx, ppy, global.menu_x-2, global.menu_y+(global.v_spacing*0.5)    , c_dkgray, c_silver);
	        break;
	    case 1:
	        draw_line_width_colour(ppx, ppy, global.menu_x-2, global.menu_y+(global.v_spacing*0.5)+adja, 3, c_black, c_black);
	        draw_line_colour(ppx, ppy, global.menu_x-2, global.menu_y+(global.v_spacing*0.5)+adja, c_dkgray, c_silver);
	        break;
	    case 2:
	        draw_line_width_colour(ppx, ppy, global.menu_x-2, global.menu_y+(global.v_spacing*0.5)+adja, 3, c_black, c_black);
	        draw_line_colour(ppx, ppy, global.menu_x-2, global.menu_y+(global.v_spacing*0.5)+adja, c_dkgray, c_silver);
	        break;
	    case 3:
	        draw_line_width_colour(ppx, ppy, global.menu_x-2, global.menu_y+(global.v_spacing*0.5)+adja, 3, c_black, c_black);
	        draw_line_colour(ppx, ppy, global.menu_x-2, global.menu_y+(global.v_spacing*0.5)+adja, c_dkgray, c_silver);
	        break;
	    default:
	        break;
	}
	draw_circle_colour(ppx, ppy, 4, c_black, c_white, false);
	//Draw the unit header
	//draw_sprite(spr_Menu_Header, 0, global.menu_x, global.menu_y - global.v_spacing);
	var m;
	for (m = 0; m < array_length(global.action_repair_menu); m += 1){
	    //Draw menu options from my_menu array
	    var c1;
	    if m == global.menu_option {
	        if m == array_length(global.action_repair_menu)-1 { c1 = c_red; } 
	            else if m == 0 { if global.turn_AP != 0 { c1 = c_white; } else { c1 = c_red; } }
	                else if m == 1 { if global.turn_AP != 0 { c1 = c_white; } else { c1 = c_red; } }
	                    else if m == global.menu_option { c1 = c_white; } 
	                        else { c1 = c_gray; }
	    }
	        else {
	            c1 = c_gray;
	        }
	    draw_sprite(spr_Menu_Border, 0, global.menu_x, global.menu_y + (m * global.v_spacing));
	    draw_text_colour_shadow(global.menu_x+(global.h_spacing*0.5), (global.menu_y+(global.v_spacing*0.5)) + (m * global.v_spacing), global.action_repair_menu[m], c1, c1, c1, c1, 1, 300, c_black, 0.2);
	    if m == global.menu_option { draw_sprite(spr_Menu_Glass, 0, global.menu_x, global.menu_y + (m * global.v_spacing)); }
	}



}
