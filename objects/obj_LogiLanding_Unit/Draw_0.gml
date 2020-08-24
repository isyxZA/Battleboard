if p_one == true { draw_sprite_ext(spr_VehicleLandingCraft, 0, x-6, y+8, 1.1, 1, rot, c_black, 0.6); }
	else { draw_sprite_ext(spr_VehicleLandingCraft, 0, x+6, y-8, 1.1, 1, rot, c_black, 0.6); }
draw_sprite_ext(spr_VehicleLandingCraft, 0, x, y, 1, 1, rot, c_white, 1);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(fnt_12);
draw_set_color(c_black);

if depleted == false{
    var m;
    var ms = min(3, ds_list_size(unit_list));//How much of the list to display
    for (m=0; m<ms; m+=1){
		draw_sprite_ext(unit_list[| m], 0, x-2, y + (m*v_spacing)+2, xscale, yscale, 0, c_black, 0.5);
        draw_sprite_ext(unit_list[| m], 0, x, y + (m*v_spacing), xscale, yscale, 0, c_white, 1);
    }

    if unit_drag == true { 
        if !ds_list_empty(unit_list) {
            if can_place == true { 
                if p_one == true { draw_sprite_ext(unit_list[| 0], 0, mx-6, my+6, 1, 1, 0, c_black, 0.5); }
					else { draw_sprite_ext(unit_list[| 0], 0, mx+6, my-6, 1, 1, 0, c_black, 0.5); }
                draw_sprite_ext(unit_list[| 0], 0, mx, my, 1, 1, 0, c_white, 0.75); 
            }
                else {
                    draw_sprite_ext(unit_list[| 0], 0, mx, my, 1, 1, 0, c_red, 0.75);
                }
        }
    }
}
    else if depleted == true {
        if supply_display == true {
        }
        if action_confirmed == true { 
            draw_line_width_colour(x,   y, target_x, target_y, 8, c_black, c_black);
            draw_set_alpha(0.6);
            draw_line_width_colour(x,   y, target_x, target_y, 6, c_green, c_orange);
            draw_set_alpha(1);
            draw_sprite(spr_Dot_Orange, 0, x, y);
            draw_set_colour(c_white);
            draw_text_transformed(x, y, string(timer_count), 1, 1, txt_rot); 
            draw_set_colour(c_black);
        } 
        if alert_display == true {
            draw_sprite_ext(spr_Alert_Box01, 0, x, y-20, 1, 1, 0, c_white, 0.9);
            draw_set_font(fnt_12);
            draw_set_colour(alert_colour); 
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text_transformed(x, y-20, string(alert_text), 1, 1, txt_rot);
            draw_set_colour(c_black); 
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
        }
    }
	





