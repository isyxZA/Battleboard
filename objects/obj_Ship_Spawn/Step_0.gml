if spawning == false {
    if (active == true) && (selected == false) {
        if obj_COMMAND.draw_ilc == true || obj_COMMAND.draw_tlc == true || obj_COMMAND.draw_elc == true || 
            obj_COMMAND.draw_blc == true || obj_COMMAND.draw_llc == true {
            can_draw = true;
            if instance_exists(obj_SoldierLanding_Unit) {
                var xx = instance_nearest(x, y, obj_SoldierLanding_Unit).x;
                var yy = instance_nearest(x, y, obj_SoldierLanding_Unit).y;
            }
                else {
                    var xx = 500;
                    var yy = 500;
                }
            if instance_exists(obj_EngineerLanding_Unit) {
                var xx1 = instance_nearest(x, y, obj_EngineerLanding_Unit).x;
                var yy1 = instance_nearest(x, y, obj_EngineerLanding_Unit).y;
            }
                else {
                    var xx1 = 500;
                    var yy1 = 500;
                }
            if instance_exists(obj_TankLanding_Unit) {
                var xx2 = instance_nearest(x, y, obj_TankLanding_Unit).x;
                var yy2 = instance_nearest(x, y, obj_TankLanding_Unit).y;
            }
                else {
                    var xx2 = 500;
                    var yy2 = 500;
                }
            if instance_exists(obj_BTRLanding_Unit) {
                var xx3 = instance_nearest(x, y, obj_BTRLanding_Unit).x;
                var yy3 = instance_nearest(x, y, obj_BTRLanding_Unit).y;
            }
                else {
                    var xx3 = 500;
                    var yy3 = 500;
                }
            if instance_exists(obj_LogiLanding_Unit) {
                var xx4 = instance_nearest(x, y, obj_LogiLanding_Unit).x;
                var yy4 = instance_nearest(x, y, obj_LogiLanding_Unit).y;
            }
                else {
                    var xx4 = 500;
                    var yy4 = 500;
                }
            
            if (point_distance(x, y, xx, yy) < range) || (point_distance(x, y, xx1, yy1) < range) || (point_distance(x, y, xx2, yy2) < range) ||
                (point_distance(x, y, xx3, yy3) < range) || (point_distance(x, y, xx4, yy4) < range) { 
                available = true;
            }
                else {
                    available = false;
                }
        }
            else { 
                can_draw = false; 
                available = false;
            }
    }
        else { 
            if selected == false { can_draw = false;  } else { can_draw = true; }
        }
}
    else if spawning == true {
        if spawn_begin == false {
            spawn_begin = true;
            if my_ship != noone {
				var h;
				if PLAYER.player == "ONE" { h = room_height; }
					else { h = 0; }
                with instance_create_layer(x, h, "Ships", my_ship) {
                    my_squad = other.my_squad; 
                    y_to = other.y;
                    s = 2;
                }
            }
        }
    }
