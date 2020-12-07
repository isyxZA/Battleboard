/// @description Draw ship stats
function scr_DrawShipStats_2() {
	with obj_LogiLanding_Unit {
		var yy;
		if p_one == true { yy = y-76; }
			else { yy = y+76; }
	    draw_sprite_ext(spr_Label_Border_L, 0, x, yy, 1.25, 1.5, txt_rot, c_white, 1);
	    draw_set_font(fnt_12);
	    draw_set_colour(c_black);
	    draw_set_halign(fa_center);
	    draw_set_valign(fa_middle);
	    draw_text_transformed_colour(x, yy, "LOGISTICS SHIP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
	    if depleted == true {
			var xx0;
				var xx1;
				var xx2;
				var xx3;
				var xx4;
				var xx5;
				if p_one == true { 
					xx0 = x+50;
					xx1 = x+32;
					xx2 = x+57;
					xx3 = x-50;
					xx4 = x-32;
					xx5 = x-57;
				}
					else { 
						xx0 = x-50;
						xx1 = x-32;
						xx2 = x-57;
						xx3 = x+50;
						xx4 = x+32;
						xx5 = x+57;
					}
	        draw_set_font(fnt_10);
	        //Parts Supply
	        draw_sprite_ext(spr_Stat_Background, 0, xx0, y, 1.5, 1.5, txt_rot, c_white, 1);
	        draw_sprite_ext(spr_Building_Icon,     0, xx1, y, 1, 1, txt_rot, c_white, 1);
	        draw_text_transformed_colour(xx2, y, string(parts_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
	        //Ammunition Supply
	        draw_sprite_ext(spr_Stat_Background, 0, xx3, y, 1.5, 1.5, txt_rot, c_white, 1);
	        draw_sprite_ext(spr_Ammo_Icon, 0, xx4, y, 1, 1, txt_rot, c_white, 1);
	        draw_text_transformed_colour(xx5, y, string(ammunition_ammo), 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
			draw_set_font(fnt_12);
	    }
	}
	with obj_SoldierLanding_Unit {
		var yy;
		if p_one == true { yy = y-76; }
			else { yy = y+76; }
	    draw_sprite_ext(spr_Label_Border_L, 0, x, yy, 1.25, 1.5, txt_rot, c_white, 1);
	    draw_set_font(fnt_12);
	    draw_set_colour(c_black);
	    draw_set_halign(fa_center);
	    draw_set_valign(fa_middle);
	    draw_text_transformed_colour(x, yy, "LANDING SHIP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
	}
	with obj_EngineerLanding_Unit {
		var yy;
		if p_one == true { yy = y-76; }
			else { yy = y+76; }
	    draw_sprite_ext(spr_Label_Border_L, 0, x, yy, 1.25, 1.5, txt_rot, c_white, 1);
	    draw_set_font(fnt_12);
	    draw_set_colour(c_black);
	    draw_set_halign(fa_center);
	    draw_set_valign(fa_middle);
	    draw_text_transformed_colour(x, yy, "LAC SHIP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
	}
	with obj_TankLanding_Unit {
		var yy;
		if p_one == true { yy = y-76; }
			else { yy = y+76; }
	    draw_sprite_ext(spr_Label_Border_L, 0, x, yy, 1.25, 1.5, txt_rot, c_white, 1);
	    draw_set_font(fnt_12);
	    draw_set_colour(c_black);
	    draw_set_halign(fa_center);
	    draw_set_valign(fa_middle);
	    draw_text_transformed_colour(x, yy, "MBT SHIP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1); 
	}
	with obj_BTRLanding_Unit { 
		var yy;
		if p_one == true { yy = y-76; }
			else { yy = y+76; }
	    draw_sprite_ext(spr_Label_Border_L, 0, x, yy, 1.25, 1.5, txt_rot, c_white, 1);
	    draw_set_font(fnt_12);
	    draw_set_colour(c_black);
	    draw_set_halign(fa_center);
	    draw_set_valign(fa_middle);
	    draw_text_transformed_colour(x, yy, "LAV SHIP", 1, 1, txt_rot, c_white, c_white, c_white, c_white, 1);
	}






}
