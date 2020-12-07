if global.game_state == "IN_GAME" {
    if global.click_count >= 2 {
        global.click_count = 0;
        switch global.dbl_click_unit {
            case "INF_A":
                var i;
                for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
                    var unit = ds_list_find_value(global.myunit_list, i);
                    if unit.unit_type == "INF_A" { 
                        with unit {
                            if active == true && nav_confirmed == false && action_confirmed == false {
                                selected = true; 
                            }
                        }
                    }
                }
                break;
			case "INF_B":
                var i;
                for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
                    var unit = ds_list_find_value(global.myunit_list, i);
                    if unit.unit_type == "INF_B" { 
                        with unit {
                            if active == true && nav_confirmed == false && action_confirmed == false {
                                selected = true; 
                            }
                        }
                    }
                }
                break;
            case "MBT_A":
                var i;
                for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
                    var unit = ds_list_find_value(global.myunit_list, i);
                    if unit.unit_type == "MBT_A" { 
                        with unit {
                            if active == true && nav_confirmed == false && action_confirmed == false {
                                selected = true; 
                            }
                        }
                    }
                }
                break;
			case "MBT_B":
                var i;
                for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
                    var unit = ds_list_find_value(global.myunit_list, i);
                    if unit.unit_type == "MBT_B" { 
                        with unit {
                            if active == true && nav_confirmed == false && action_confirmed == false {
                                selected = true; 
                            }
                        }
                    }
                }
                break;
            case "LAC_A":
                var i;
                for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
                    var unit = ds_list_find_value(global.myunit_list, i);
                    if unit.unit_type == "LAC_A" { 
                        with unit {
                            if active == true && nav_confirmed == false && action_confirmed == false {
                                selected = true; 
                            }
                        }
                    }
                }
                break;
			case "LAC_B":
                var i;
                for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
                    var unit = ds_list_find_value(global.myunit_list, i);
                    if unit.unit_type == "LAC_B" { 
                        with unit {
                            if active == true && nav_confirmed == false && action_confirmed == false {
                                selected = true; 
                            }
                        }
                    }
                }
                break;
            case "LAV_A":
                var i;
                for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
                    var unit = ds_list_find_value(global.myunit_list, i);
                    if unit.unit_type == "LAV_A" { 
                        with unit {
                            if active == true && nav_confirmed == false && action_confirmed == false {
                                selected = true; 
                            }
                        }
                    }
                }
                break;
			case "LAV_B":
                var i;
                for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
                    var unit = ds_list_find_value(global.myunit_list, i);
                    if unit.unit_type == "LAV_B" { 
                        with unit {
                            if active == true && nav_confirmed == false && action_confirmed == false {
                                selected = true; 
                            }
                        }
                    }
                }
                break;
            case "LOGI_A":
                var i;
                for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
                    var unit = ds_list_find_value(global.myunit_list, i);
                    if unit.unit_type == "LOGI_A" { 
                        with unit {
                            if active == true && nav_confirmed == false && action_confirmed == false {
                                selected = true; 
                            }
                        }
                    }
                }
                break;
			case "LOGI_B":
                var i;
                for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
                    var unit = ds_list_find_value(global.myunit_list, i);
                    if unit.unit_type == "LOGI_B" { 
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
                for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
                    var unit = ds_list_find_value(global.myunit_list, i);
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
                for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
                    var unit = ds_list_find_value(global.myunit_list, i);
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
                for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
                    var unit = ds_list_find_value(global.myunit_list, i);
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
                for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
                    var unit = ds_list_find_value(global.myunit_list, i);
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

