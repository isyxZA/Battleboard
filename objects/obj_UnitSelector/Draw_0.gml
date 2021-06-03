draw_sprite_ext(my_indicator, 0, x, y-48, 1, 1, 0, c_white, 1);
draw_sprite_ext(my_sprite, 0, x, y, 1, 1, 0, c_white, 1);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(fnt_10);

switch my_unit {
	case "INF_A":
		if PLAYER.faction == "US" { 
			draw_set_font(fnt_10);
			draw_text_colour_shadow(x, y+42, "Riflemen", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_set_font(fnt_8);
			draw_text_colour_shadow(x, y+56, "Action Points 10", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+76, "AR Rifle x 100", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+86, "AT4 x 2", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+96, "Flares x 1", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		}
			else if PLAYER.faction == "RU" {
				draw_set_font(fnt_10);
				draw_text_colour_shadow(x, y+42, "Riflemen", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_set_font(fnt_8);
				draw_text_colour_shadow(x, y+56, "Action Points 10", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+76, "AR Rifle x 100", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+86, "RPG x 2", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+96, "Flares x 1", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			}
		break;
	case "INF_B":
		draw_set_font(fnt_10);
		draw_text_colour_shadow(x, y+42, "Recon Scouts", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		draw_set_font(fnt_8);
		draw_text_colour_shadow(x, y+56 , "Action Points 10", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		draw_text_colour_shadow(x, y+76 , "AR Rifle x 100", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		draw_text_colour_shadow(x, y+86 , "GL 40mm x 2", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		draw_text_colour_shadow(x, y+96 , "Flares x 4", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		draw_text_colour_shadow(x, y+106, "Vision ++", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		break;
	case "MBT_A":
		if PLAYER.faction == "US" { 
			draw_set_font(fnt_10);
			draw_text_colour_shadow(x, y+42, "M1A2 Abrams MBT", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_set_font(fnt_8);
			draw_text_colour_shadow(x, y+56, "Action Points 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+76, "AP 120mm x 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+86, "MG 12.7mm x 600", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		}
			else if PLAYER.faction == "RU" {
				draw_set_font(fnt_10);
				draw_text_colour_shadow(x, y+42, "T-72B3 MBT", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_set_font(fnt_8);
				draw_text_colour_shadow(x, y+56, "Action Points 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+76, "AP 120mm x 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+86, "MG 12.7mm x 600", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			}
		break;
	case "MBT_B":
		if PLAYER.faction == "US" { 
			draw_set_font(fnt_10);
			draw_text_colour_shadow(x, y+42, "M1A1 Abrams MBT", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_set_font(fnt_8);
			draw_text_colour_shadow(x, y+56, "Action Points 10", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+76, "AP 120mm x 10", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+86, "MG 12.7mm x 600", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		}
			else if PLAYER.faction == "RU" {
				draw_set_font(fnt_10);
				draw_text_colour_shadow(x, y+42, "T-62 MBT", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_set_font(fnt_8);
				draw_text_colour_shadow(x, y+56, "Action Points 10", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+76, "AP 115mm x 10", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+86, "MG 12.7mm x 600", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			}
		break;
	case "LAC_A":
		if PLAYER.faction == "US" {
			draw_set_font(fnt_10);
			draw_text_colour_shadow(x, y+42, "M1097A2 Cargo", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_set_font(fnt_8);
			draw_text_colour_shadow(x, y+56, "Action Points 10", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+76, "Depot x 1", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+86, "Repair OP x 1", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+96, "Static TOW x 1", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+106, "Mortar Pit x 1", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		}
			else if PLAYER.faction == "RU" {
				draw_set_font(fnt_10);
				draw_text_colour_shadow(x, y+42, "GAZ Tigr Cargo", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_set_font(fnt_8);
				draw_text_colour_shadow(x, y+56, "Action Points 10", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+76, "Depot x 1", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+86, "Repair OP x 1", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+96, "Static ATGM x 1", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+106, "Mortar Pit x 1", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			}
		break;
	case "LAC_B":
		if PLAYER.faction == "US" {
			draw_set_font(fnt_10);
			draw_text_colour_shadow(x, y+42, "M1097A2 TOW", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_set_font(fnt_8);
			draw_text_colour_shadow(x, y+56, "Action Points 10", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+76, "TOW II x 6", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		}
			else if PLAYER.faction == "RU" {
				draw_set_font(fnt_10);
				draw_text_colour_shadow(x, y+42, "GAZ Tigr ATGM", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_set_font(fnt_8);
				draw_text_colour_shadow(x, y+56, "Action Points 10", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+76, "ATGM x 6", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			}
		break;
	case "LAV_A":
		if PLAYER.faction == "US" {
			draw_set_font(fnt_10);
			draw_text_colour_shadow(x, y+42, "M3 Bradley IFV", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_set_font(fnt_8);
			draw_text_colour_shadow(x, y+56, "Action Points 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+76, "HE 30mm x 40", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+86, "AP 30mm x 40", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+96, "MG 12.7mm x 600", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+106, "TOW II x 2", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+116, "Squad Capacity x 2", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		}
			else if PLAYER.faction == "RU" {
				draw_set_font(fnt_10);
				draw_text_colour_shadow(x, y+42, "BMP-3M Ataka IFV", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_set_font(fnt_8);
				draw_text_colour_shadow(x, y+56, "Action Points 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+76, "HE 30mm x 40", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+86, "AP 30mm x 40", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+96, "MG 12.7mm x 600", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+106, "Ataka ATGM x 2", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+116, "Squad Capacity x 2", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			}
		break;
	case "LAV_B":
		if PLAYER.faction == "US" {
			draw_set_font(fnt_10);
			draw_text_colour_shadow(x, y+42, "M1126 Stryker APC", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_set_font(fnt_8);
			draw_text_colour_shadow(x, y+56, "Action Points 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+76, "HE 30mm x 40", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+86, "AP 30mm x 40", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+96, "MG 12.7mm x 600", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+106, "Squad Capacity x 4", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		}
			else if PLAYER.faction == "RU" {
				draw_set_font(fnt_10);
				draw_text_colour_shadow(x, y+42, "BTR-80 APC", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_set_font(fnt_8);
				draw_text_colour_shadow(x, y+56, "Action Points 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+76, "HE 30mm x 40", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+86, "AP 30mm x 40", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+96, "MG 12.7mm x 600", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+106, "Squad Capacity x 4", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			}
		break;
	case "LOGI_A":
		if PLAYER.faction == "US" {
			draw_set_font(fnt_10);
			draw_text_colour_shadow(x, y+42, "M35 Cargo", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_set_font(fnt_8);
			draw_text_colour_shadow(x, y+56, "Action Points 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+76, "Ammunition x 100", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+86, "Parts x 100", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		}
			else if PLAYER.faction == "RU" {
				draw_set_font(fnt_10);
				draw_text_colour_shadow(x, y+42, "Ural 4320 Cargo", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_set_font(fnt_8);
				draw_text_colour_shadow(x, y+56, "Action Points 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+76, "Ammunition x 100", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+86, "Parts x 100", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);	
			}
		break;
	case "LOGI_B":
		if PLAYER.faction == "US" {
			draw_set_font(fnt_10);
			draw_text_colour_shadow(x, y+42, "M35 Transport", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_set_font(fnt_8);
			draw_text_colour_shadow(x, y+56, "Action Points 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+76, "Ammunition x 50", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			draw_text_colour_shadow(x, y+86, "Squad Capacity x 6", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
		}
			else if PLAYER.faction == "RU" {
				draw_set_font(fnt_10);
				draw_text_colour_shadow(x, y+42, "Ural 4320 Transport", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_set_font(fnt_8);
				draw_text_colour_shadow(x, y+56, "Action Points 12", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+76, "Ammunition x 50", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
				draw_text_colour_shadow(x, y+86, "Squad Capacity x 6", c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
			}
		break;
}
draw_set_font(fnt_12)
draw_text_colour_shadow(x, y-48, string(unit_cost), c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);



