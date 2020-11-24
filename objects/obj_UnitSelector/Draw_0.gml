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
		draw_text_colour_shadow(x, y+56, "AR Rifle", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		draw_text_colour_shadow(x, y+66, "GL Launcher", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		draw_text_colour_shadow(x, y+76, "Flares", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		break;
	case "TANK":
		if PLAYER.faction == "US" { 
			draw_set_font(fnt_10);
			draw_text_colour_shadow(x, y+42, "M1A2 Abrams MBT", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_set_font(fnt_8);
			draw_text_colour_shadow(x, y+56, "Armor Piercing", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+66, "Heavy MG", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		}
			else if PLAYER.faction == "RU" {
				draw_set_font(fnt_10);
				draw_text_colour_shadow(x, y+42, "T72B3 MBT", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_set_font(fnt_8);
				draw_text_colour_shadow(x, y+56, "Armor Piercing", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+66, "Heavy MG", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			}
		break;
	case "ENGINEER":
		if PLAYER.faction == "US" {
			draw_set_font(fnt_10);
			draw_text_colour_shadow(x, y+42, "HMMWV Cargo", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_set_font(fnt_8);
			draw_text_colour_shadow(x, y+56, "Depot Station", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+66, "Repair OP", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+76, "TOW Static", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+86, "Mortar Pit", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		}
			else if PLAYER.faction == "RU" {
				draw_set_font(fnt_10);
				draw_text_colour_shadow(x, y+42, "GAZ Tigr Cargo", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_set_font(fnt_8);
				draw_text_colour_shadow(x, y+56, "Depot Station", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+66, "Repair OP", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+76, "TOW Static", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+86, "Mortar Pit", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			}
		break;
	case "BTR":
		if PLAYER.faction == "US" {
			draw_set_font(fnt_10);
			draw_text_colour_shadow(x, y+42, "M3 Bradley IFV", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_set_font(fnt_8);
			draw_text_colour_shadow(x, y+56, "High Explosive", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+66, "Armor Piercing", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		}
			else if PLAYER.faction == "RU" {
				draw_set_font(fnt_10);
				draw_text_colour_shadow(x, y+42, "BMP3 IFV", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_set_font(fnt_8);
				draw_text_colour_shadow(x, y+56, "High Explosive", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+66, "Armor Piercing", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			}
		break;
	case "LOGI":
		if PLAYER.faction == "US" {
			draw_set_font(fnt_10);
			draw_text_colour_shadow(x, y+42, "M35 Cargo", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_set_font(fnt_8);
			draw_text_colour_shadow(x, y+56, "Ammunition", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+66, "Supply Parts", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		}
			else if PLAYER.faction == "RU" {
				draw_set_font(fnt_10);
				draw_text_colour_shadow(x, y+42, "Ural 4320 Cargo", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_set_font(fnt_8);
				draw_text_colour_shadow(x, y+56, "Ammunition", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+66, "Supply Parts", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);	
			}
		break;
}
draw_set_font(fnt_12)
draw_text_colour_shadow(x, y-48, string(unit_cost), c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);



