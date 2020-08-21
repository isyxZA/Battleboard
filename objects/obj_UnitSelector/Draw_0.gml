draw_sprite_ext(my_indicator, 0, x, y-48, 1, 1, 0, c_white, 1);
draw_sprite_ext(my_sprite, 0, x, y, 1, 1, 0, c_white, 1);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(fnt_14);
var t;
if my_unit == "BTR" { t = "LAV"; }
	else if my_unit == "LOGI" { t = "LOGISTICS"; }
		else t = my_unit;
draw_text_colour_shadow(x, y+42, string(t), c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
draw_set_font(fnt_12);
draw_text_colour_shadow(x, y-48, string(unit_amount), c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);



