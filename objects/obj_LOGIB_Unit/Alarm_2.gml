timer_count -= 1;

if timer_count > 0 { timer_start = true; }
    else if timer_count <= 0 {
        if shoot_amount > 0 {
            switch weapon {
				case "SQUAD":
					shoot_squad = true;
	                //Switch off gui alert
	                var i;
	                for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
	                    var z = ds_list_find_value(global.action_alert_list, i);
	                    if z == "Logi Deploying Squad" { 
	                        ds_list_delete(global.action_alert_list, i); 
	                        break;
	                    }
	                }
					break;
                case "RIFLE":
                    shoot_ammo = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "INF_A" || unit_type == "INF_B" { 
                                rifle_ammo += other.rfl_supply_rate; 
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
                        if z == "Logi Supplying Ammo" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "RPG":
                    shoot_ammo = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "INF_A" || unit_type == "INF_B" { 
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
                        if z == "Logi Supplying Ammo" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "FLARE":
                    shoot_ammo = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "INF_A" || unit_type == "INF_B" { 
                                flare_ammo += other.flr_supply_rate;
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
                        if z == "Logi Supplying Ammo" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "CANNON":
                    shoot_ammo = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "MBT_A" || unit_type == "MBT_B" { 
                                cannon_ammo += other.mbtap_supply_rate;
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
                        if z == "Logi Supplying Ammo" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "MG":
                    shoot_ammo = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "MBT_A" || unit_type == "MBT_B" { 
                                mg_ammo += other.mbtmg_supply_rate;
                                alert_display = true;
                                alert_text = "+20 MG Ammo"; 
                                alert_colour = c_green;
                                alarm[3] = global.tick_rate*2; 
                            }
								else if unit_type == "LAV_A" || unit_type == "LAV_B" { 
	                                mg_ammo += other.lavmg_supply_rate;
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
                        if z == "Logi Supplying Ammo" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "HE":
                    shoot_ammo = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "LAV_A" || unit_type == "LAV_B" { 
                                he_ammo += other.lavhe_supply_rate;
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
                        if z == "Logi Supplying Ammo" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "AP":
                    shoot_ammo = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "LAV_A" || unit_type == "LAV_B" { 
                                ap_ammo += other.lavap_supply_rate;
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
                        if z == "Logi Supplying Ammo" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
				case "TOWMOBILE":
                    shoot_ammo = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "LAC_B" || unit_type == "LAV_A" { 
                                tow_ammo += other.lavat_supply_rate; 
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
                        if z == "Logi Supplying Ammo" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "AMMO":
                    shoot_ammo = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "LOGI_A" || unit_type == "LOGI_B" { 
                                ammo_supply += other.logiamo_supply_rate; 
                                alert_display = true;
                                alert_text = "+10 Ammo"; 
                                alert_colour = c_green;
                                alarm[3] = global.tick_rate*2;
                            }
                                else if unit_type == "DEPOT" { 
                                    ammunition_ammo += other.depotamo_supply_rate; 
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
                        if z == "Logi Supplying Ammo" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "TOWSTATIC":
                    shoot_ammo = true;
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
                        if z == "Logi Supplying Ammo" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "MORTARSTATIC":
                    shoot_ammo = true;
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
                        if z == "Logi Supplying Ammo" { 
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
                //resupply_unit.resupplying = false;
                switch weapon {
					case "SQUAD":
		                //Switch off gui alert
		                var i;
		                for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
		                    var z = ds_list_find_value(global.action_alert_list, i);
		                    if z == "Logi Deploying Squad" { 
		                        ds_list_delete(global.action_alert_list, i); 
		                        break;
		                    }
		                }
						break;
                    case "RIFLE":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "INF_A" || unit_type == "INF_B" { 
                                    rifle_ammo += other.rfl_supply_rate; 
                                    alert_display = true;
                                    alert_text = "+20 Rifle Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2;
                                }
								resupplying = false;
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
                            if z == "Logi Supplying Ammo" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "RPG":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "INF_A" || unit_type == "INF_B" { 
                                    rpg_ammo += other.rpg_supply_rate;
                                    alert_display = true;
                                    alert_text = "+1 RPG Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2; 
                                }
								resupplying = false;
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
                            if z == "Logi Supplying Ammo" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "FLARE":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "INF_A" || unit_type == "INF_B" { 
                                    flare_ammo += other.flr_supply_rate;
                                    alert_display = true;
                                    alert_text = "+1 Flare Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2; 
                                }
								resupplying = false;
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
                            if z == "Logi Supplying Ammo" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "CANNON":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "MBT_A" || unit_type == "MBT_B" { 
                                    cannon_ammo += other.mbtap_supply_rate;
                                    alert_display = true;
                                    alert_text = "+1 Cannon Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2; 
                                }
								resupplying = false;
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
                            if z == "Logi Supplying Ammo" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "MG":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "MBT_A" || unit_type == "MBT_B" { 
                                    mg_ammo += other.mbtmg_supply_rate;
                                    alert_display = true;
                                    alert_text = "+20 MG Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2; 
                                }
									else if unit_type == "LAV_A" || unit_type == "LAV_B" { 
		                                mg_ammo += other.lavmg_supply_rate;
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
								resupplying = false;
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
                            if z == "Logi Supplying Ammo" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "HE":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "LAV_A" || unit_type == "LAV_B" { 
                                    he_ammo += other.lavhe_supply_rate;
                                    alert_display = true;
                                    alert_text = "+4 HE Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2; 
                                }
								resupplying = false;
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
                            if z == "Logi Supplying Ammo" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "AP":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "LAV_A" || unit_type == "LAV_B" { 
                                    ap_ammo += other.lavap_supply_rate;
                                    alert_display = true;
                                    alert_text = "+4 AP Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2; 
                                }
								resupplying = false;
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
                            if z == "Logi Supplying Ammo" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
					case "TOWMOBILE":
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "LAC_B" || unit_type == "LAV_A" { 
	                                tow_ammo += other.lavat_supply_rate; 
	                                alert_display = true;
	                                alert_text = "+1 TOW Ammo"; 
	                                alert_colour = c_green;
	                                alarm[3] = global.tick_rate*2;
	                            }
								resupplying = false;
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
	                        if z == "Logi Supplying Ammo" { 
	                            ds_list_delete(global.action_alert_list, i); 
	                            break;
	                        }
	                    }
                    break;
                    case "AMMO":
                        if resupply_unit != noone {
                            with resupply_unit { 
                                if unit_type == "LOGI_A" || unit_type == "LOGI_B" { 
                                    ammo_supply += other.logiamo_supply_rate; 
                                    alert_display = true;
                                    alert_text = "+10 Ammo"; 
                                    alert_colour = c_green;
                                    alarm[3] = global.tick_rate*2;
                                }
                                    else if unit_type == "DEPOT" { 
                                        ammunition_ammo += other.depotamo_supply_rate; 
                                        alert_display = true;
                                        alert_text = "+10 Ammo"; 
                                        alert_colour = c_green;
                                        alarm[3] = global.tick_rate*2;
                                    }
								resupplying = false;
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
                            if z == "Logi Supplying Ammo" { 
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
								resupplying = false;
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
                            if z == "Logi Supplying Ammo" { 
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
								resupplying = false;
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
                            if z == "Logi Supplying Ammo" { 
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

