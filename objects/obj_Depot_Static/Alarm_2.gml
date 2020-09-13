timer_count -= 1;

if timer_count > 0 { timer_start = true; }
    else if timer_count <= 0 {
        if shoot_amount > 0 {
            switch weapon {
                case "RIFLE":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "INFANTRY" { 
                                rifle_ammo += other.rifle_supply_rate; 
                                alert_display = true;
                                alert_text = "+20 Rifle Ammo"; 
                                alert_colour = c_green;
                                alarm[3] = global.tick_rate*2;
                            }
                        }
                        alert_display = true;
                        alert_text = "-20 Ammo"; 
                        alert_colour = c_orange;
                        alarm[3] = global.tick_rate*2;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Depot Supplying Ammo" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "RPG":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "INFANTRY" { 
                                rpg_ammo += other.rpg_supply_rate;
                                alert_display = true;
                                alert_text = "+1 RPG Ammo"; 
                                alert_colour = c_green;
                                alarm[3] = global.tick_rate*2; 
                            }
                        }
                        alert_display = true;
                        alert_text = "-1 Ammo"; 
                        alert_colour = c_orange;
                        alarm[3] = global.tick_rate*2;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Depot Supplying Ammo" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "FLARE":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "INFANTRY" { 
                                flare_ammo += other.flare_supply_rate;
                                alert_display = true;
                                alert_text = "+1 Flare Ammo"; 
                                alert_colour = c_green;
                                alarm[3] = global.tick_rate*2; 
                            }
                        }
                        alert_display = true;
                        alert_text = "-1 Ammo"; 
                        alert_colour = c_orange;
                        alarm[3] = global.tick_rate*2;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Depot Supplying Ammo" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "CANNON":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "TANK" { 
                                cannon_ammo += other.cannon_supply_rate;
                                alert_display = true;
                                alert_text = "+1 Cannon Ammo"; 
                                alert_colour = c_green;
                                alarm[3] = global.tick_rate*2; 
                            }
                        }
                        alert_display = true;
                        alert_text = "-1 Ammo"; 
                        alert_colour = c_orange;
                        alarm[3] = global.tick_rate*2;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Depot Supplying Ammo" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "MG":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "TANK" { 
                                mg_ammo += other.mg_supply_rate;
                                alert_display = true;
                                alert_text = "+20 MG Ammo"; 
                                alert_colour = c_green;
                                alarm[3] = global.tick_rate*2; 
                            }
                                else if unit_type == "REPAIR" { 
                                    mg_ammo += other.repairmg_supply_rate;
                                    alert_display = true;
                                    alert_text = "+20 MG Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2; 
                                }
                        }
                        alert_display = true;
                        alert_text = "-20 Ammo"; 
                        alert_colour = c_orange;
                        alarm[3] = global.tick_rate*2;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Depot Supplying Ammo" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "DEPOT":
                    shoot_parts = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "ENGINEER" { 
                                depot_supply += 1;
                                alert_display = true;
                                alert_text = "+1 Depot"; 
                                alert_colour = c_green;
                                alarm[3] = global.tick_rate*2; 
                            }
                        }
                        alert_display = true;
                        alert_text = "-10 Supply"; 
                        alert_colour = c_orange;
                        alarm[3] = global.tick_rate*2;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Depot Supplying Parts" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "REPAIR":
                    shoot_parts = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "ENGINEER" { 
                                repair_supply += 1;
                                alert_display = true;
                                alert_text = "+1 Repair OP"; 
                                alert_colour = c_green;
                                alarm[3] = global.tick_rate*2; 
                            }
                        }
                        alert_display = true;
                        alert_text = "-10 Supply"; 
                        alert_colour = c_orange;
                        alarm[3] = global.tick_rate*2;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Depot Supplying Parts" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "TOW":
                    shoot_parts = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "ENGINEER" { 
                                tow_supply += 1;
                                alert_display = true;
                                alert_text = "+1 TOW"; 
                                alert_colour = c_green;
                                alarm[3] = global.tick_rate*2; 
                            }
                        }
                        alert_display = true;
                        alert_text = "-10 Supply"; 
                        alert_colour = c_orange;
                        alarm[3] = global.tick_rate*2;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Depot Supplying Parts" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "MORTAR":
                    shoot_parts = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "ENGINEER" { 
                                mortar_supply += 1;
                                alert_display = true;
                                alert_text = "+1 Mortar"; 
                                alert_colour = c_green;
                                alarm[3] = global.tick_rate*2; 
                            }
                        }
                        alert_display = true;
                        alert_text = "-10 Supply"; 
                        alert_colour = c_orange;
                        alarm[3] = global.tick_rate*2;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Depot Supplying Parts" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "HE":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "BTR" { 
                                he_ammo += other.he_supply_rate;
                                alert_display = true;
                                alert_text = "+4 HE Ammo"; 
                                alert_colour = c_green;
                                alarm[3] = global.tick_rate*2; 
                            }
                        }
                        alert_display = true;
                        alert_text = "-4 Ammo"; 
                        alert_colour = c_orange;
                        alarm[3] = global.tick_rate*2;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Depot Supplying Ammo" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "AP":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "BTR" { 
                                ap_ammo += other.ap_supply_rate;
                                alert_display = true;
                                alert_text = "+4 AP Ammo"; 
                                alert_colour = c_green;
                                alarm[3] = global.tick_rate*2; 
                            }
                        }
                        alert_display = true;
                        alert_text = "-4 Ammo"; 
                        alert_colour = c_orange;
                        alarm[3] = global.tick_rate*2;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Depot Supplying Ammo" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
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
                        if z == "Depot Supplying Ammo" { 
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
                                    else if unit_type == "REPAIR" { 
                                        repair_ammo += other.repairS_supply_rate; 
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
                        if z == "Depot Supplying Parts" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "TOWSTATIC":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "TOW" { 
                                tow_ammo += other.towS_supply_rate;
                                alert_display = true;
                                alert_text = "+1 TOW Ammo"; 
                                alert_colour = c_green;
                                alarm[3] = global.tick_rate*2; 
                            }
                        }
                        alert_display = true;
                        alert_text = "-1 Ammo"; 
                        alert_colour = c_orange;
                        alarm[3] = global.tick_rate*2;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Depot Supplying Ammo" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "MORTARSTATIC":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "MORTAR" { 
                                mortar_ammo += other.mortarS_supply_rate;
                                alert_display = true;
                                alert_text = "+4 Mortar Ammo"; 
                                alert_colour = c_green;
                                alarm[3] = global.tick_rate*2; 
                            }
                        }
                        alert_display = true;
                        alert_text = "-4 Ammo"; 
                        alert_colour = c_orange;
                        alarm[3] = global.tick_rate*2;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Depot Supplying Ammo" { 
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
                alarm[8] = 60;
                action_confirmed = false;
                resupply_unit.resupplying = false;
                switch weapon {
                    case "RIFLE":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "INFANTRY" { 
                                    rifle_ammo += other.rifle_supply_rate; 
                                    alert_display = true;
                                    alert_text = "+20 Rifle Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2;
                                }
                            }
                            alert_display = true;
                            alert_text = "-20 Ammo"; 
                            alert_colour = c_orange;
                            alarm[3] = global.tick_rate*2;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Depot Supplying Ammo" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "RPG":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "INFANTRY" { 
                                    rpg_ammo += other.rpg_supply_rate;
                                    alert_display = true;
                                    alert_text = "+1 RPG Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2; 
                                }
                            }
                            alert_display = true;
                            alert_text = "-1 Ammo"; 
                            alert_colour = c_orange;
                            alarm[3] = global.tick_rate*2;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Depot Supplying Ammo" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "FLARE":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "INFANTRY" { 
                                    flare_ammo += other.flare_supply_rate;
                                    alert_display = true;
                                    alert_text = "+1 Flare Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2; 
                                }
                            }
                            alert_display = true;
                            alert_text = "-1 Ammo"; 
                            alert_colour = c_orange;
                            alarm[3] = global.tick_rate*2;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Depot Supplying Ammo" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "CANNON":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "TANK" { 
                                    cannon_ammo += other.cannon_supply_rate;
                                    alert_display = true;
                                    alert_text = "+1 Cannon Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2; 
                                }
                            }
                            alert_display = true;
                            alert_text = "-1 Ammo"; 
                            alert_colour = c_orange;
                            alarm[3] = global.tick_rate*2;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Depot Supplying Ammo" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "MG":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "TANK" { 
                                    mg_ammo += other.mg_supply_rate;
                                    alert_display = true;
                                    alert_text = "+20 MG Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2; 
                                }
                                    else if unit_type == "REPAIR" { 
                                        mg_ammo += other.repairmg_supply_rate;
                                        alert_display = true;
                                        alert_text = "+20 MG Ammo"; 
                                        alert_colour = c_green;
                                        alarm[3] = global.tick_rate*2; 
                                    }
                            }
                            alert_display = true;
                            alert_text = "-20 Ammo"; 
                            alert_colour = c_orange;
                            alarm[3] = global.tick_rate*2;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Depot Supplying Ammo" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "DEPOT":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "ENGINEER" { 
                                    depot_supply += 1;
                                    alert_display = true;
                                    alert_text = "+1 Depot"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2; 
                                }
                            }
                            alert_display = true;
                            alert_text = "-10 Supply"; 
                            alert_colour = c_orange;
                            alarm[3] = global.tick_rate*2;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Depot Supplying Parts" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "REPAIR":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "ENGINEER" { 
                                    repair_supply += 1;
                                    alert_display = true;
                                    alert_text = "+1 Repair OP"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2; 
                                }
                            }
                            alert_display = true;
                            alert_text = "-10 Supply"; 
                            alert_colour = c_orange;
                            alarm[3] = global.tick_rate*2;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Depot Supplying Parts" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "TOW":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "ENGINEER" { 
                                    tow_supply += 1;
                                    alert_display = true;
                                    alert_text = "+1 TOW"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2; 
                                }
                            }
                            alert_display = true;
                            alert_text = "-10 Supply"; 
                            alert_colour = c_orange;
                            alarm[3] = global.tick_rate*2;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Depot Supplying Parts" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "MORTAR":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "ENGINEER" { 
                                    mortar_supply += 1;
                                    alert_display = true;
                                    alert_text = "+1 Mortar"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2; 
                                }
                            }
                            alert_display = true;
                            alert_text = "-10 Supply"; 
                            alert_colour = c_orange;
                            alarm[3] = global.tick_rate*2;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Depot Supplying Parts" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "HE":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "BTR" { 
                                    he_ammo += other.he_supply_rate;
                                    alert_display = true;
                                    alert_text = "+4 HE Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2; 
                                }
                            }
                            alert_display = true;
                            alert_text = "-4 Ammo"; 
                            alert_colour = c_orange;
                            alarm[3] = global.tick_rate*2;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Depot Supplying Ammo" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "AP":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "BTR" { 
                                    ap_ammo += other.ap_supply_rate;
                                    alert_display = true;
                                    alert_text = "+4 AP Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2; 
                                }
                            }
                            alert_display = true;
                            alert_text = "-4 Ammo"; 
                            alert_colour = c_orange;
                            alarm[3] = global.tick_rate*2;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Depot Supplying Ammo" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
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
                            if z == "Depot Supplying Ammo" { 
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
                                        else if unit_type == "REPAIR" { 
                                            repair_ammo += other.repairS_supply_rate; 
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
                            if z == "Depot Supplying Parts" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "TOWSTATIC":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "TOW" { 
                                    tow_ammo += other.towS_supply_rate;
                                    alert_display = true;
                                    alert_text = "+1 TOW Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2; 
                                }
                            }
                            alert_display = true;
                            alert_text = "-1 Ammo"; 
                            alert_colour = c_orange;
                            alarm[3] = global.tick_rate*2;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Depot Supplying Ammo" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "MORTARSTATIC":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "MORTAR" { 
                                    mortar_ammo += other.mortarS_supply_rate;
                                    alert_display = true;
                                    alert_text = "+4 Mortar Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2; 
                                }
                            }
                            alert_display = true;
                            alert_text = "-4 Ammo"; 
                            alert_colour = c_orange;
                            alarm[3] = global.tick_rate*2;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Depot Supplying Ammo" { 
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

