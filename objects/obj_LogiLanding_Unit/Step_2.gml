if action_confirmed == true {
    if shoot_parts == true { 
        //Add alert to gui
        ds_list_add(global.action_alert_list, "Ship Supplying Parts");
        shoot_parts = false;
        timer_target = 3;
        timer_count = timer_target;
        timer_start = true;
        shoot_amount -= 1;
    }
        else if shoot_ammunition == true {
            //Add alert to gui
            ds_list_add(global.action_alert_list, "Ship Supplying Ammo");
            shoot_ammunition = false;
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

if ap_depleted == true {
    ap_depleted = false;
    alert_display = true;
    alert_text = "AP Depleted!";
    alert_colour = c_red;
    alarm[3] = global.tick_rate*3;
}

if ammo_check == true {
    ammo_check = false;
    if (parts_ammo < parts_rate) && (ammunition_ammo < ammunition_rate) { 
        alert_display = true;
        alert_text = "Supply Depleted!"; 
        alert_colour = c_red;
        alarm[3] = global.tick_rate*3;
    }
        else if (parts_ammo < parts_rate) || (ammunition_ammo < ammunition_rate) {
            alert_display = true;
            alert_text = "Low Supply!"; 
            alert_colour = c_orange;
            alarm[3] = global.tick_rate*3;
        }
            else { }
}


