//Game Setup\\
draw_sprite_ext(spr_SetupBG_1, 0, x, y, 1, 1, 0, c_white, 1);


draw_set_alpha(0.1);
draw_roundrect_colour_ext(x+50, y+70 , x+450, y+270, 4, 4, c_dkgray, c_dkgray, false);
draw_roundrect_colour_ext(x+50, y+320, x+450, y+520, 4, 4, c_dkgray, c_dkgray, false);
draw_roundrect_colour_ext(x+50, y+580, x+450, y+780, 4, 4, c_dkgray, c_dkgray, false);
draw_set_alpha(1);
draw_roundrect_colour_ext(x, y, x+499, y+799, 4, 4, c1, c_dkgray, true);
draw_roundrect_colour_ext(x+50, y+70 , x+450, y+270, 4, 4, c_dkgray, c_dkgray, true);
draw_roundrect_colour_ext(x+50, y+320, x+450, y+520, 4, 4, c_dkgray, c_dkgray, true);
draw_roundrect_colour_ext(x+50, y+580, x+450, y+780, 4, 4, c_dkgray, c_dkgray, true);


draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(fnt_14);
draw_sprite_ext(spr_Menu_Button, 0, x+250, y, 1, 1, 0, c_white, 1);
draw_text_colour_shadow(x+250, y, "Game Setup", c1, c1, c1, c1, 1, 330, c_black, 0.7);

draw_sprite_ext(spr_Menu_Button, 0, x+250, y+70, 1, 1, 0, c_white, 1);
draw_text_colour_shadow(x+250, y+70, "Position", c1, c1, c1, c1, 1, 330, c_black, 0.7);

draw_sprite_ext(spr_Menu_Button, 0, x+250, y+320, 1, 1, 0, c_white, 1);
draw_text_colour_shadow(x+250, y+320, "Turn Timer", c1, c1, c1, c1, 1, 330, c_black, 0.7);

draw_sprite_ext(spr_Menu_Button, 0, x+250, y+580, 1, 1, 0, c_white, 1);
draw_text_colour_shadow(x+250, y+580, "Scenario", c1, c1, c1, c1, 1, 330, c_black, 0.7);
