if spawning == false {
    if can_draw == true {
        if selected == false { 
            var sc;
            var a;
            var c;
            if place_meeting(x, y, obj_MOUSE) { 
                sc = 1.25; 
                a = 0.5; 
                if available == true { c = c_white; } else { c = c_red; }
            } 
                else {
                    sc = 1; 
                    a = 0.5; 
                    if available == true { c = c_green; } else { c = c_red; }
                }
            if obj_COMMAND.draw_ilc == true { draw_sprite_ext(spr_SoldierLandingCraft, 0, x, y, sc, sc, rot, c, a); } 
                else { draw_sprite_ext(spr_VehicleLandingCraft, 0, x, y, sc, sc, rot, c, a); }
            if available == true { draw_sprite_ext(spr_Dot_Green, 0, x, y, 1, 1, 0, c_white, 1); }
        }
            else if selected == true {
                if obj_COMMAND.draw_ilc == true { draw_sprite_ext(spr_SoldierLandingCraft, 0, x, y, 1.25, 1.25, rot, c_white, 0.5); } 
                    else { draw_sprite_ext(spr_VehicleLandingCraft, 0, x, y, 1.25, 1.25, rot, c_white, 0.6); }
                draw_sprite_ext(spr_Dot_Green, x, y, 0, 1.1, 1.1, 0, c_white, 1);
            }
    }
}
    else if spawning == true { 
        draw_sprite_ext(my_sprite, 0, x, y, 1, 1, rot, c_white, 0.5);   
    }
draw_set_halign(fa_center);
var txt;
if spawning == true { txt = "EN-ROUTE"; }
    else if available == true { if obj_COMMAND.confirm_menu == false { txt = "AVAILABLE"; } else { txt = ""; } }
        else txt = "";
draw_set_colour(c_white);
if p_one == true { draw_text(x, y-20, string(txt)); }
	else { draw_text_transformed(x, y-20, string(txt), 1, 1, rot); }
draw_set_colour(c_black);

