/// @description scr_DrawSquad(squad)
/// @param squad
function scr_DrawSquad(argument0) {
	if argument0 != "NOONE" {
		var xx;
		var yy;
		var sd;
		draw_set_font(fnt_12);
		if nav_confirmed == true {
			if p_one == true  { xx=x_final; yy=y_final+38; sd=245; }
				else if p_one == false { xx=x_final+2; yy=y_final-38; sd=65; }
		}
			else {
				if p_one == true  { xx=x; yy=y+38; sd=245; }
					else if p_one == false { xx=x+2; yy=y-38; sd=65; }
			}
		
		if active == true {
			var sc1 = make_colour_rgb(240,248,255);
			draw_set_color(sc1);
			draw_text_transformed_shadow(xx, yy, string(argument0), 1, 1, txt_rot, 2, sd, c_black, 1);
		}
		    else {
		        if obj_MOUSE.show_allstats == true || global.game_turn == 0 {
					draw_set_color(c_silver);	
					draw_text_transformed_shadow(xx, yy, string(argument0), 1, 1, txt_rot, 2, sd, c_black, 1);
		        }
		    }
		
		draw_set_color(c_black);
	}




}
