if global.game_state == "IN_GAME" {
	
    if global.click_count >= 2 {
        global.click_count = 0;
        switch global.dbl_click_unit {
            case "INF_A":
                var i;
                for (i=0; i<ds_list_size(global.infa_list); i+=1) {
                    var unit = ds_list_find_value(global.infa_list, i);
                    with unit {
                        if (active == true) && (nav_confirmed == false) && (action_confirmed == false) {
                            selected = true; 
                        }
                    }
                }
                break;
			case "INF_B":
                var i;
                for (i=0; i<ds_list_size(global.infb_list); i+=1) {
                    var unit = ds_list_find_value(global.infb_list, i);
                    with unit {
                        if (active == true) && (nav_confirmed == false) && (action_confirmed == false) {
                            selected = true; 
                        }
                    }
                }
                break;
            case "MBT_A":
                var i;
                for (i=0; i<ds_list_size(global.mbta_list); i+=1) {
                    var unit = ds_list_find_value(global.mbta_list, i);
                    with unit {
                        if (active == true) && (nav_confirmed == false) && (action_confirmed == false) {
                            selected = true; 
                        }
                    }
                }
                break;
			case "MBT_B":
                var i;
                for (i=0; i<ds_list_size(global.mbtb_list); i+=1) {
                    var unit = ds_list_find_value(global.mbtb_list, i);
                    with unit {
                        if (active == true) && (nav_confirmed == false) && (action_confirmed == false) {
                            selected = true; 
                        }
                    }
                }
                break;
            case "LAC_A":
                var i;
                for (i=0; i<ds_list_size(global.laca_list); i+=1) {
                    var unit = ds_list_find_value(global.laca_list, i);
                    with unit {
                        if (active == true) && (nav_confirmed == false) && (action_confirmed == false) {
                            selected = true; 
                        }
                    }
                }
                break;
			case "LAC_B":
                var i;
                for (i=0; i<ds_list_size(global.lacb_list); i+=1) {
                    var unit = ds_list_find_value(global.lacb_list, i);
                    with unit {
                        if (active == true) && (nav_confirmed == false) && (action_confirmed == false) {
                            selected = true; 
                        }
                    }
                }
                break;
            case "LAV_A":
                var i;
                for (i=0; i<ds_list_size(global.lava_list); i+=1) {
                    var unit = ds_list_find_value(global.lava_list, i);
                    with unit {
                        if (active == true) && (nav_confirmed == false) && (action_confirmed == false) {
                            selected = true; 
                        }
                    }
                }
                break;
			case "LAV_B":
                var i;
                for (i=0; i<ds_list_size(global.lavb_list); i+=1) {
                    var unit = ds_list_find_value(global.lavb_list, i);
                    with unit {
                        if (active == true) && (nav_confirmed == false) && (action_confirmed == false) {
                            selected = true; 
                        }
                    }
                }
                break;
            case "LOGI_A":
                var i;
                for (i=0; i<ds_list_size(global.logia_list); i+=1) {
                    var unit = ds_list_find_value(global.logia_list, i);
                    with unit {
                        if (active == true) && (nav_confirmed == false) && (action_confirmed == false) {
                            selected = true; 
                        }
                    }
                }
                break;
			case "LOGI_B":
                var i;
                for (i=0; i<ds_list_size(global.logib_list); i+=1) {
                    var unit = ds_list_find_value(global.logib_list, i);
                    with unit {
                        if (active == true) && (nav_confirmed == false) && (action_confirmed == false) {
                            selected = true; 
                        }
                    }
                }
                break;
            case "DEPOT":
                var i;
                for (i=0; i<ds_list_size(global.depot_list); i+=1) {
                    var unit = ds_list_find_value(global.depot_list, i);
                    with unit {
                        if (active == true) && (nav_confirmed == false) && (action_confirmed == false) {
                            selected = true; 
                        }
                    }
                }
                break;
            case "REPAIR":
                var i;
                for (i=0; i<ds_list_size(global.repair_list); i+=1) {
                    var unit = ds_list_find_value(global.repair_list, i);
                    with unit {
                        if (active == true) && (nav_confirmed == false) && (action_confirmed == false) {
                            selected = true; 
                        }
                    }
                }
                break;
            case "TOW":
                var i;
                for (i=0; i<ds_list_size(global.tow_list); i+=1) {
                    var unit = ds_list_find_value(global.tow_list, i);
                    with unit {
                        if (active == true) && (nav_confirmed == false) && (action_confirmed == false) {
                            selected = true; 
                        }
                    }
                }
                break;
            case "MORTAR":
                var i;
                for (i=0; i<ds_list_size(global.mortar_list); i+=1) {
                    var unit = ds_list_find_value(global.mortar_list, i);
                    with unit {
                        if (active == true) && (nav_confirmed == false) && (action_confirmed == false) {
                            selected = true; 
                        }
                    }
                }
                break;
            default:
                break;
        }  
    }
}

