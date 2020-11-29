//Formation Setup\\
draw_sprite_ext(spr_SetupBG_2, 0, x, y, 1, 1, 0, c_white, 1);
draw_roundrect_colour_ext(x, y, x+699, y+932, 4, 4, c1, c_dkgray, true);
draw_sprite_ext(spr_Menu_Button, 0, x+350, y, 1, 1, 0, c_white, 1);
draw_set_font(fnt_14);
draw_text_colour_shadow(x+350, y, "Formations", c1, c1, c1, c1, 1, 330, c_black, 0.7);
draw_set_font(fnt_12);
draw_set_alpha(1);