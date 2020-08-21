if action_confirmed == true {
    if shoot_mg == true {
        if !shoot_mask.t_line { 
            //Add alert to gui
            ds_list_add(global.action_alert_list, "Repair OP Firing");
            shoot_mg = false;
            timer_target = 3;
            timer_count = timer_target;
            timer_start = true;
            shoot_amount -= 1;
        }
            else {
                shoot_mg = false;
                timer_start = false;
                action_confirmed = false;
                //Ammo amount to be returned
                mg_ammo += shoot_amount*mg_rate;
                //Action points to be returned
                var pp = shoot_amount*ap_cost;
                action_points += pp;
                global.turn_AP += pp;
                global.ap_return = pp;
                global.draw_apreturn = true;
                shoot_amount = 0;
                alert_display = true;
                alert_text = "Cancelled!"; 
                alert_colour = c_red;
                alarm[3] = global.tick_rate*3;
                global.units_running -= 1;
            }
    }
        else if shoot_repair == true { 
            //Add alert to gui
            ds_list_add(global.action_alert_list, "Repairing");
            shoot_repair = false;
            timer_target = 3;
            timer_count = timer_target;
            timer_start = true;
            shoot_amount -= 1;
        }
        else {}
}

if timer_start == true {
    timer_start = false;
    alarm[2] = global.tick_rate;
}

if mp_depleted == true {
    mp_depleted = false;
    alert_display = true;
    alert_text = "MP Depleted!";
    alert_colour = c_red;
    alarm[3] = global.tick_rate*3;
}

if ap_depleted == true {
    ap_depleted = false;
    alert_display = true;
    alert_text = "AP Depleted!";
    alert_colour = c_red;
    alarm[3] = global.tick_rate*3;
}

if ammo_check == true {
    ammo_check = false;
    if (mg_ammo < mg_rate) && (repair_ammo < repair_rate) { 
        alert_display = true;
        alert_text = "Ammo Depleted!"; 
        alert_colour = c_red;
        alarm[3] = global.tick_rate*3;
    }
        else if (mg_ammo < (mg_rate*4)) || (repair_ammo < (repair_rate*2)) {
            alert_display = true;
            alert_text = "Low Ammo!"; 
            alert_colour = c_orange;
            alarm[3] = global.tick_rate*3;
        }
            else { }

}

//Toggle tile highlights
if build_pos == 2 {
    if selected {
        if global.highlight_supply != true && global.highlight_move != true {
            //Highlight tiles within action range
            if keyboard_check_pressed(ord("F")) {
                if highlight_shoot == false { 
                    highlight_shoot = true;
                    global.highlight_shoot = true;
                    //Check which game tiles are in range
                    if !ds_list_empty(global.tile_list){
                        var i;
                        for (i=0; i<ds_list_size(global.tile_list); i+=1){
                            var z = ds_list_find_value(global.tile_list, i);
                            if point_in_circle(z.tile_x,z.tile_y, x, y, action_range){
                                 z.unit_count += 1;
                                 z.alarm[1] = random_range(6,32);
                            }
                        }
                    }
                }
            }
        }
        if global.highlight_supply != true && global.highlight_shoot != true {
            //Highlight tiles within movement range
            if keyboard_check_pressed(ord("T")) {
                if highlight_move == false { 
                    highlight_move = true;
                    global.highlight_move = true;
                    //Check which game tiles are in range
                    if !ds_list_empty(global.tile_list){
                        var i;
                        for (i=0; i<ds_list_size(global.tile_list); i+=1){
                            var z = ds_list_find_value(global.tile_list, i);
                            if point_in_circle(z.tile_x,z.tile_y, x, y, view_radius){
                                 z.unit_count += 1;
                                 z.alarm[1] = random_range(6,32);
                            }
                        }
                    }
                }
            }
        }
    }
}
//Deactivate highlighting shoot tiles
if keyboard_check_released(ord("F")) {
    if highlight_shoot == true { 
        highlight_shoot = false;
        global.highlight_shoot = false;
        //Remove game tile visibility
        if !ds_list_empty(global.tile_list){
            var i;
            for (i=0; i<ds_list_size(global.tile_list); i+=1){
                var z = ds_list_find_value(global.tile_list, i);
                if point_in_circle(z.tile_x,z.tile_y, x, y, action_range){
                    if z.unit_count > 0 { 
                        z.unit_count -= 1; 
                        z.alarm[1] = 1;
                    }
                }
            }
        }
    }
}
if highlight_shoot == true { 
    if global.nav_menu == true {
        highlight_shoot = false;
        global.highlight_shoot = false;
        //Remove game tile visibility
        if !ds_list_empty(global.tile_list){
            var i;
            for (i=0; i<ds_list_size(global.tile_list); i+=1){
                var z = ds_list_find_value(global.tile_list, i);
                if point_in_circle(z.tile_x,z.tile_y, x, y, action_range){
                    if z.unit_count > 0 { 
                        z.unit_count -= 1; 
                        z.alarm[1] = 1;
                    }
                }
            }
        }
    }
}

//Deactivate highlighting move tiles
if keyboard_check_released(ord("T")) {
    if highlight_move == true { 
        highlight_move = false;
        global.highlight_move = false;
        //Remove game tile visibility
        if !ds_list_empty(global.tile_list){
            var i;
            for (i=0; i<ds_list_size(global.tile_list); i+=1){
                var z = ds_list_find_value(global.tile_list, i);
                if point_in_circle(z.tile_x,z.tile_y, x, y, view_radius){
                    if z.unit_count > 0 { 
                        z.unit_count -= 1; 
                        z.alarm[1] = 1;
                    }
                }
            }
        }
    }
}
if highlight_move == true { 
    if global.nav_menu == true {
        highlight_move = false;
        global.highlight_move = false;
        //Remove game tile visibility
        if !ds_list_empty(global.tile_list){
            var i;
            for (i=0; i<ds_list_size(global.tile_list); i+=1){
                var z = ds_list_find_value(global.tile_list, i);
                if point_in_circle(z.tile_x,z.tile_y, x, y, view_radius){
                    if z.unit_count > 0 { 
                        z.unit_count -= 1; 
                        z.alarm[1] = 1;
                    }
                }
            }
        }
    }
}


/* */
/*  */
