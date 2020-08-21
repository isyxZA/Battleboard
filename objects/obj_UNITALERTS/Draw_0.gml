with obj_Unit_Parent {
    if alert_display == true {
        draw_set_alpha(1);
        draw_set_font(fnt_12);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        switch unit_type {
            case "INFANTRY":
                var xx;
                var yy;
                if nav_confirmed == true { 
                    xx = x_final; 
                    yy = y_final;
                } 
                    else { 
                        xx = x; 
                        yy = y;
                    }
				if p_one == true { yy = yy-20; }
					else { yy = yy+20; }
                draw_sprite_ext(spr_Alert_Box01, 0, xx, yy, 1, 1, 0, c_white, 1);
				draw_text_transformed_colour(xx, yy, string(alert_text), 1, 1, txt_rot, c_gray, alert_colour, c_gray, alert_colour, 1);
                break;
            case "TANK":
                var xx;
                var yy;
                if nav_confirmed == true { 
                    xx = x_final; 
                    yy = y_final;
                } 
                    else { 
                        xx = x; 
                        yy = y;
                    }
				if p_one == true { yy = yy-20; }
					else { yy = yy+20; }
                draw_sprite_ext(spr_Alert_Box01, 0, xx, yy, 1, 1, 0, c_white, 1);
				draw_text_transformed_colour(xx, yy, string(alert_text), 1, 1, txt_rot, c_gray, alert_colour, c_gray, alert_colour, 1);
                break;
            case "ENGINEER":
                var xx;
                var yy;
                if nav_confirmed == true { 
                    xx = x_final; 
                    yy = y_final;
                } 
                    else { 
                        xx = x; 
                        yy = y;
                    }
				if p_one == true { yy = yy-20; }
					else { yy = yy+20; }
                draw_sprite_ext(spr_Alert_Box01, 0, xx, yy, 1, 1, 0, c_white, 1);
				draw_text_transformed_colour(xx, yy, string(alert_text), 1, 1, txt_rot, c_gray, alert_colour, c_gray, alert_colour, 1);
                break;
            case "BTR":
                var xx;
                var yy;
                if nav_confirmed == true { 
                    xx = x_final; 
                    yy = y_final;
                } 
                    else { 
                        xx = x; 
                        yy = y;
                    }
				if p_one == true { yy = yy-20; }
					else { yy = yy+20; }
                draw_sprite_ext(spr_Alert_Box01, 0, xx, yy, 1, 1, 0, c_white, 1);
				draw_text_transformed_colour(xx, yy, string(alert_text), 1, 1, txt_rot, c_gray, alert_colour, c_gray, alert_colour, 1);
                break;
            case "LOGI":
                var xx;
                var yy;
                if nav_confirmed == true { 
                    xx = x_final; 
                    yy = y_final;
                } 
                    else { 
                        xx = x; 
                        yy = y;
                    }
				if p_one == true { yy = yy-20; }
					else { yy = yy+20; }
                draw_sprite_ext(spr_Alert_Box01, 0, xx, yy, 1, 1, 0, c_white, 1);
				draw_text_transformed_colour(xx, yy, string(alert_text), 1, 1, txt_rot, c_gray, alert_colour, c_gray, alert_colour, 1);
                break;
            case "DEPOT":
				var yy;
				if p_one == true { yy = y-20; }
					else { yy = y+20; }
                draw_sprite_ext(spr_Alert_Box01, 0, x, yy, 1, 1, 0, c_white, 1);
				draw_text_transformed_colour(x, yy, string(alert_text), 1, 1, txt_rot, c_gray, alert_colour, c_gray, alert_colour, 1);
                break;
            case "REPAIR":
				var yy;
				if p_one == true { yy = y-20; }
					else { yy = y+20; }
                draw_sprite_ext(spr_Alert_Box01, 0, x, yy, 1, 1, 0, c_white, 1);
				draw_text_transformed_colour(x, yy, string(alert_text), 1, 1, txt_rot, c_gray, alert_colour, c_gray, alert_colour, 1);
                break;
            case "TOW":
				var yy;
				if p_one == true { yy = y-20; }
					else { yy = y+20; }
                draw_sprite_ext(spr_Alert_Box01, 0, x, yy, 1, 1, 0, c_white, 1);
				draw_text_transformed_colour(x, yy, string(alert_text), 1, 1, txt_rot, c_gray, alert_colour, c_gray, alert_colour, 1);
                break;
            case "MORTAR":
				var yy;
				if p_one == true { yy = y-20; }
					else { yy = y+20; }
                draw_sprite_ext(spr_Alert_Box01, 0, x, yy, 1, 1, 0, c_white, 1);
				draw_text_transformed_colour(x, yy, string(alert_text), 1, 1, txt_rot, c_gray, alert_colour, c_gray, alert_colour, 1);
                break;
        }
        draw_set_font(fnt_12);
        draw_set_colour(c_black); 
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_alpha(1);
    }
}
//Enemy unit alerts
with obj_Enemy_Parent {
    if alert_display == true {
        draw_set_alpha(1);
        draw_set_font(fnt_12);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        switch unit_type {
            case "E_INFANTRY":
                var xx;
                var yy;
                if nav_confirmed == true { 
                    xx = x_final; 
                    yy = y_final;
                } 
                    else { 
                        xx = x; 
                        yy = y;
                    }
				if p_one == true { yy = yy-20; }
					else { yy = yy+20; }
                draw_sprite_ext(spr_Alert_Box01, 0, xx, yy, 1, 1, 0, c_white, 1);
				draw_text_transformed_colour(xx, yy, string(alert_text), 1, 1, txt_rot, c_gray, alert_colour, c_gray, alert_colour, 1);
                break;
            case "E_TANK":
                var xx;
                var yy;
                if nav_confirmed == true { 
                    xx = x_final; 
                    yy = y_final;
                } 
                    else { 
                        xx = x; 
                        yy = y;
                    }
				if p_one == true { yy = yy-20; }
					else { yy = yy+20; }
                draw_sprite_ext(spr_Alert_Box01, 0, xx, yy, 1, 1, 0, c_white, 1);
				draw_text_transformed_colour(xx, yy, string(alert_text), 1, 1, txt_rot, c_gray, alert_colour, c_gray, alert_colour, 1);
                break;
            case "E_ENGINEER":
                var xx;
                var yy;
                if nav_confirmed == true { 
                    xx = x_final; 
                    yy = y_final;
                } 
                    else { 
                        xx = x; 
                        yy = y;
                    }
				if p_one == true { yy = yy-20; }
					else { yy = yy+20; }
                draw_sprite_ext(spr_Alert_Box01, 0, xx, yy, 1, 1, 0, c_white, 1);
				draw_text_transformed_colour(xx, yy, string(alert_text), 1, 1, txt_rot, c_gray, alert_colour, c_gray, alert_colour, 1);
                break;
            case "E_BTR":
                var xx;
                var yy;
                if nav_confirmed == true { 
                    xx = x_final; 
                    yy = y_final;
                } 
                    else { 
                        xx = x; 
                        yy = y;
                    }
				if p_one == true { yy = yy-20; }
					else { yy = yy+20; }
                draw_sprite_ext(spr_Alert_Box01, 0, xx, yy, 1, 1, 0, c_white, 1);
				draw_text_transformed_colour(xx, yy, string(alert_text), 1, 1, txt_rot, c_gray, alert_colour, c_gray, alert_colour, 1);
                break;
            case "E_LOGI":
                var xx;
                var yy;
                if nav_confirmed == true { 
                    xx = x_final; 
                    yy = y_final;
                } 
                    else { 
                        xx = x; 
                        yy = y;
                    }
				if p_one == true { yy = yy-20; }
					else { yy = yy+20; }
                draw_sprite_ext(spr_Alert_Box01, 0, xx, yy, 1, 1, 0, c_white, 1);
				draw_text_transformed_colour(xx, yy, string(alert_text), 1, 1, txt_rot, c_gray, alert_colour, c_gray, alert_colour, 1);
                break;
            case "E_DEPOT":
				var yy;
				if p_one == true { yy = y-20; }
					else { yy = y+20; }
                draw_sprite_ext(spr_Alert_Box01, 0, x, yy, 1, 1, 0, c_white, 1);
				draw_text_transformed_colour(x, yy, string(alert_text), 1, 1, txt_rot, c_gray, alert_colour, c_gray, alert_colour, 1);
                break;
            case "E_REPAIR":
				var yy;
				if p_one == true { yy = y-20; }
					else { yy = y+20; }
                draw_sprite_ext(spr_Alert_Box01, 0, x, yy, 1, 1, 0, c_white, 1);
				draw_text_transformed_colour(x, yy, string(alert_text), 1, 1, txt_rot, c_gray, alert_colour, c_gray, alert_colour, 1);
                break;
            case "E_TOW":
				var yy;
				if p_one == true { yy = y-20; }
					else { yy = y+20; }
                draw_sprite_ext(spr_Alert_Box01, 0, x, yy, 1, 1, 0, c_white, 1);
				draw_text_transformed_colour(x, yy, string(alert_text), 1, 1, txt_rot, c_gray, alert_colour, c_gray, alert_colour, 1);
                break;
            case "E_MORTAR":
				var yy;
				if p_one == true { yy = y-20; }
					else { yy = y+20; }
                draw_sprite_ext(spr_Alert_Box01, 0, x, yy, 1, 1, 0, c_white, 1);
				draw_text_transformed_colour(x, yy, string(alert_text), 1, 1, txt_rot, c_gray, alert_colour, c_gray, alert_colour, 1);
                break;
        }
        draw_set_font(fnt_12);
        draw_set_colour(c_black); 
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_alpha(1);
    }
}

