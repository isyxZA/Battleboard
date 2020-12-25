if txt != "Back" { 
	draw_sprite_ext(sprite_index, 0, x, y, 1.01, 1.09, 0, c_dkgray, 0.6);
	draw_self();
	if highlight == true { 
		gpu_set_blendmode(bm_add);
		draw_sprite(spr_Menu_Button_Highlight, 0, x, y); 
		gpu_set_blendmode(bm_normal);
	}
}
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(fnt_16);
draw_text_colour_shadow(x, y, txt, c1, c1, c1, c1, 1, 330, c_black, 0.7);
draw_set_font(fnt_12);


