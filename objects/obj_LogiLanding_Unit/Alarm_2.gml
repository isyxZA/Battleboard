timer_count -= 1;

if timer_count > 0 { timer_start = true; }
    else if timer_count <= 0 {
        if shoot_amount > 0 {
            switch weapon {
                case "AMMO":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "LOGI" { 
                                ammo_supply += other.ammo_supply_rate; 
                                alert_display = true;
                                alert_text = "+10 Ammo"; 
                                alert_colour = c_green;
                                alarm[3] = global.tick_rate*2;
                            }
                                else if unit_type == "DEPOT" { 
                                    ammunition_ammo += other.depotammo_supply_rate; 
                                    alert_display = true;
                                    alert_text = "+10 Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2;
                                }
                        }
                        alert_display = true;
                        alert_text = "-10 Ammo"; 
                        alert_colour = c_orange;
                        alarm[3] = global.tick_rate*2;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Ship Supplying Ammo" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "PARTS":
                    shoot_parts = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "LOGI" { 
                                building_supply += other.building_supply_rate; 
                                alert_display = true;
                                alert_text = "10 Parts"; 
                                alert_colour = c_green;
                                alarm[3] = global.tick_rate*2;
                            }
                                else if unit_type == "DEPOT" { 
                                    parts_ammo += other.depotparts_supply_rate; 
                                    alert_display = true;
                                    alert_text = "+10 Parts"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2;
                                }
                        }
                        alert_display = true;
                        alert_text = "-10 Parts"; 
                        alert_colour = c_orange;
                        alarm[3] = global.tick_rate*2;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Ship Supplying Parts" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                default:
                    break;
            }
        }
            else {
                timer_start = false;
                //global.units_running -= 1;
                alarm[8] = 60;
                action_confirmed = false;
                resupply_unit.resupplying = false;
                switch weapon {
                    case "AMMO":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "LOGI" { 
                                    ammo_supply += other.ammo_supply_rate; 
                                    alert_display = true;
                                    alert_text = "+10 Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2;
                                }
                                    else if unit_type == "DEPOT" { 
                                        ammunition_ammo += other.depotammo_supply_rate; 
                                        alert_display = true;
                                        alert_text = "+10 Ammo"; 
                                        alert_colour = c_green;
                                        alarm[3] = global.tick_rate*2;
                                    }
                            }
                            alert_display = true;
                            alert_text = "-10 Ammo"; 
                            alert_colour = c_orange;
                            alarm[3] = global.tick_rate*2;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Ship Supplying Ammo" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "PARTS":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "LOGI" { 
                                    building_supply += other.building_supply_rate; 
                                    alert_display = true;
                                    alert_text = "10 Parts"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2;
                                }
                                    else if unit_type == "DEPOT" { 
                                        parts_ammo += other.depotparts_supply_rate; 
                                        alert_display = true;
                                        alert_text = "+10 Parts"; 
                                        alert_colour = c_green;
                                        alarm[3] = global.tick_rate*2;
                                    }
                            }
                            alert_display = true;
                            alert_text = "-10 Parts"; 
                            alert_colour = c_orange;
                            alarm[3] = global.tick_rate*2;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Ship Supplying Parts" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    default:
                        break;
                }
            }
    }

