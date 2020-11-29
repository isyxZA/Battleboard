//Unit Setup\\
draw_sprite_ext(spr_SetupBG_1, 0, x, y, 1, 1, 0, c_white, 1);
draw_roundrect_colour_ext(x, y, x+499, y+799, 4, 4, c1, c_dkgray, true);
		
draw_set_alpha(0.1);
draw_roundrect_colour_ext(x+50, y+100, x+450, y+300, 4, 4, c_dkgray, c_dkgray, false);
draw_roundrect_colour_ext(x+50, y+500, x+450, y+700, 4, 4, c_dkgray, c_dkgray, false);
		
draw_set_alpha(1);
draw_roundrect_colour_ext(x+50, y+100, x+450, y+300, 4, 4, c1, c_dkgray, true);
draw_roundrect_colour_ext(x+50, y+500, x+450, y+700, 4, 4, c1, c_dkgray, true);

draw_set_font(fnt_14);
draw_sprite_ext(spr_Menu_Button, 0, x+250, y, 1, 1, 0, c_white, 1);
draw_text_colour_shadow(x+250, y, "Unit Setup", c1, c1, c1, c1, 1, 330, c_black, 0.7);
draw_sprite_ext(spr_Menu_Button, 0, x+250, y+100, 1.2, 1, 0, c_white, 1);
draw_text_colour_shadow(x+250, y+100, "Your Faction", c1, c1, c1, c1, 1, 330, c_black, 0.7);
draw_sprite_ext(spr_Menu_Button, 0, x+250, y+500, 1.2, 1, 0, c_white, 1);
draw_text_colour_shadow(x+250, y+500, "Opponent Faction", c1, c1, c1, c1, 1, 330, c_black, 0.7);
draw_set_font(fnt_12);
