timer_count -= 1;

if timer_count > 0 { timer_start = true; }
    else if timer_count <= 0 {
        if shoot_amount > 0 {  
            switch weapon {
                case "DEPOT":
                    shoot_depot = true;
                    break;
                case "REPAIR":
                    shoot_repair = true;
                    break;
                case "TOW":
                    shoot_tow = true;
                    break;
                case "MORTAR":
                    shoot_mortar = true;
                    break;
                default:
                    break;
            }
        }
            else { 
                timer_start = false;
                //global.enemyunits_running -= 1;
                alarm[8] = 60;
                action_confirmed = false;
            }
    }

