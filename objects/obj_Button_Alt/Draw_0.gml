if txt != "Back" { 
	draw_self();
	if highlight == true { 
		gpu_set_blendmode(bm_add);
		if txt == "Save" || txt == "Clear" { draw_sprite_ext(spr_Menu_Button_Highlight, 0, x, y, 0.7, 0.8, 0, c_white, 1); draw_set_font(fnt_12);  }
			else { draw_sprite(spr_Menu_Button_Highlight, 0, x, y); draw_set_font(fnt_16);  }
		gpu_set_blendmode(bm_normal);
	}
}
	else { draw_set_font(fnt_16); }
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_colour_shadow(x, y, txt, c1, c1, c1, c1, 1, 330, c_black, 0.7);
draw_set_font(fnt_12);



