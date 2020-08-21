if global.game_state == "IN_GAME" {
    if global.click_count >= 2 {
        global.click_count = 0;
        switch global.dbl_click_unit {
            case "INFANTRY":
                var i;
                for (i=0; i<ds_list_size(global.unit_list); i+=1) {
                    var unit = ds_list_find_value(global.unit_list, i);
                    if unit.unit_type == "INFANTRY" { 
                        with unit {
                            if active == true && nav_confirmed == false && action_confirmed == false {
                                selected = true; 
                            }
                        }
                    }
                }
                break;
            case "TANK":
                var i;
                for (i=0; i<ds_list_size(global.unit_list); i+=1) {
                    var unit = ds_list_find_value(global.unit_list, i);
                    if unit.unit_type == "TANK" { 
                        with unit {
                            if active == true && nav_confirmed == false && action_confirmed == false {
                                selected = true; 
                            }
                        }
                    }
                }
                break;
            case "ENGINEER":
                var i;
                for (i=0; i<ds_list_size(global.unit_list); i+=1) {
                    var unit = ds_list_find_value(global.unit_list, i);
                    if unit.unit_type == "ENGINEER" { 
                        with unit {
                            if active == true && nav_confirmed == false && action_confirmed == false {
                                selected = true; 
                            }
                        }
                    }
                }
                break;
            case "BTR":
                var i;
                for (i=0; i<ds_list_size(global.unit_list); i+=1) {
                    var unit = ds_list_find_value(global.unit_list, i);
                    if unit.unit_type == "BTR" { 
                        with unit {
                            if active == true && nav_confirmed == false && action_confirmed == false {
                                selected = true; 
                            }
                        }
                    }
                }
                break;
            case "LOGI":
                var i;
                for (i=0; i<ds_list_size(global.unit_list); i+=1) {
                    var unit = ds_list_find_value(global.unit_list, i);
                    if unit.unit_type == "LOGI" { 
                        with unit {
                            if active == true && nav_confirmed == false && action_confirmed == false {
                                selected = true; 
                            }
                        }
                    }
                }
                break;
            case "DEPOT":
                var i;
                for (i=0; i<ds_list_size(global.unit_list); i+=1) {
                    var unit = ds_list_find_value(global.unit_list, i);
                    if unit.unit_type == "DEPOT" { 
                        with unit {
                            if active == true && nav_confirmed == false && action_confirmed == false {
                                selected = true; 
                            }
                        }
                    }
                }
                break;
            case "REPAIR":
                var i;
                for (i=0; i<ds_list_size(global.unit_list); i+=1) {
                    var unit = ds_list_find_value(global.unit_list, i);
                    if unit.unit_type == "REPAIR" { 
                        with unit {
                            if active == true && nav_confirmed == false && action_confirmed == false {
                                selected = true; 
                            }
                        }
                    }
                }
                break;
            case "TOW":
                var i;
                for (i=0; i<ds_list_size(global.unit_list); i+=1) {
                    var unit = ds_list_find_value(global.unit_list, i);
                    if unit.unit_type == "TOW" { 
                        with unit {
                            if active == true && nav_confirmed == false && action_confirmed == false {
                                selected = true; 
                            }
                        }
                    }
                }
                break;
            case "MORTAR":
                var i;
                for (i=0; i<ds_list_size(global.unit_list); i+=1) {
                    var unit = ds_list_find_value(global.unit_list, i);
                    if unit.unit_type == "MORTAR" { 
                        with unit {
                            if active == true && nav_confirmed == false && action_confirmed == false {
                                selected = true; 
                            }
                        }
                    }
                }
                break;
            default:
                break;
        }  
    }
}

