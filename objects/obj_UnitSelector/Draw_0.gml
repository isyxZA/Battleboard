draw_sprite_ext(my_indicator, 0, x, y-48, 1, 1, 0, c_white, 1);
draw_sprite_ext(my_sprite, 0, x, y, 1, 1, 0, c_white, 1);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(fnt_10);

switch my_unit {
	case "INFANTRY":
		draw_set_font(fnt_10);
		draw_text_colour_shadow(x, y+42, "Infantry Regular", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		draw_set_font(fnt_8);
		draw_text_colour_shadow(x, y+56, "Action Points 10", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		draw_text_colour_shadow(x, y+76, "AR Rifle x 100", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		draw_text_colour_shadow(x, y+86, "GL Launcher x 1", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		draw_text_colour_shadow(x, y+96, "Flares x 2", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		break;
	case "TANK":
		if PLAYER.faction == "US" { 
			draw_set_font(fnt_10);
			draw_text_colour_shadow(x, y+42, "M1A2 Abrams MBT", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_set_font(fnt_8);
			draw_text_colour_shadow(x, y+56, "Action Points 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+76, "Armor Piercing x 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+86, "Heavy MG x 100", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		}
			else if PLAYER.faction == "RU" {
				draw_set_font(fnt_10);
				draw_text_colour_shadow(x, y+42, "T72B3 MBT", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_set_font(fnt_8);
				draw_text_colour_shadow(x, y+56, "Action Points 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+76, "Armor Piercing x 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+86, "Heavy MG x 100", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			}
		break;
	case "ENGINEER":
		if PLAYER.faction == "US" {
			draw_set_font(fnt_10);
			draw_text_colour_shadow(x, y+42, "M1097A2 Cargo", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_set_font(fnt_8);
			draw_text_colour_shadow(x, y+56, "Action Points 10", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+76, "Depot x 1", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+86, "Repair OP x 1", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+96, "TOW Static x 1", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+106, "Mortar Pit x 1", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		}
			else if PLAYER.faction == "RU" {
				draw_set_font(fnt_10);
				draw_text_colour_shadow(x, y+42, "GAZ Tigr Cargo", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_set_font(fnt_8);
				draw_text_colour_shadow(x, y+56, "Action Points 10", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+76, "Depot x 1", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+86, "Repair OP x 1", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+96, "TOW Static x 1", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+106, "Mortar Pit x 1", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			}
		break;
	case "BTR":
		if PLAYER.faction == "US" {
			draw_set_font(fnt_10);
			draw_text_colour_shadow(x, y+42, "M3 Bradley IFV", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_set_font(fnt_8);
			draw_text_colour_shadow(x, y+56, "Action Points 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+76, "High Explosive x 40", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+86, "Armor Piercing x 40", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		}
			else if PLAYER.faction == "RU" {
				draw_set_font(fnt_10);
				draw_text_colour_shadow(x, y+42, "BMP3 IFV", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_set_font(fnt_8);
				draw_text_colour_shadow(x, y+56, "Action Points 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+76, "High Explosive x 40", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+86, "Armor Piercing x 40", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			}
		break;
	case "LOGI":
		if PLAYER.faction == "US" {
			draw_set_font(fnt_10);
			draw_text_colour_shadow(x, y+42, "M35 Cargo", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_set_font(fnt_8);
			draw_text_colour_shadow(x, y+56, "Action Points 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+76, "Ammunition x 100", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+86, "Supply x 100", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		}
			else if PLAYER.faction == "RU" {
				draw_set_font(fnt_10);
				draw_text_colour_shadow(x, y+42, "Ural 4320 Cargo", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_set_font(fnt_8);
				draw_text_colour_shadow(x, y+56, "Action Points 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+76, "Ammunition x 100", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+86, "Supply x 100", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);	
			}
		break;
}
draw_set_font(fnt_12)
draw_text_colour_shadow(x, y-48, string(unit_cost), c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);



