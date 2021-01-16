if popup == true {
	draw_set_alpha(0.6);
	draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	if surface_exists(surf) {
		surface_set_target(surf);
		draw_sprite_ext(spr_KeybindBG    , 0,  0 ,  0, 1, 1, 0, c_white, 1);
		draw_sprite_ext(spr_Select_Button, 0, 32 , 90, 1, 1, 0, c_white, 1);
		draw_sprite_ext(spr_Select_Button, 0, 148, 90, 1, 1, 0, c_white, 1);
		draw_set_font(fnt_14);
		draw_set_color(c_silver);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(128, 24, "Press a key to bind.");
		draw_set_font(fnt_16);
		draw_text(128, 64, txt_temp);
		draw_set_font(fnt_12);
		draw_text(32+x_adj , 90+y_adj, "Accept");
		draw_text(148+x_adj, 90+y_adj, "Cancel");
		draw_set_color(c_black);
		surface_reset_target();
		draw_surface_ext(surf, surf_x, surf_y, 1*surf_s, 1*surf_s, 0, c_white, surf_a);
	}
		else {
			surf = surface_create(surf_w, surf_h);
	        surface_set_target(surf);
	        draw_clear_alpha(c_black, 1);
	        surface_reset_target();
		}
}
	else { 
		if hint == true { 
			draw_rectangle_color(mouse_x-48, mouse_y-38, mouse_x+48, mouse_y-12, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(mouse_x-47, mouse_y-37, mouse_x+47, mouse_y-13, c_silver, c_silver, c_silver, c_silver, true);
			draw_set_font(fnt_12);
			draw_set_color(c_silver);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_text(mouse_x, mouse_y-24, "Click to bind");
			draw_set_color(c_black);
		}
		if surface_exists(surf) { surface_free(surf); }
	}
