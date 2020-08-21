if global.game_state == "IN_GAME" {
    //Assigns selected units to a squad
    if keyboard_check_direct(vk_control) { set_squad = true; } 
        else { 
            set_squad = false; 
            squad_key = noone;
        }
    if set_squad == true {
        if keyboard_check_pressed(ord("1")) { squad_key = "ALPHA"; }
            else if keyboard_check_pressed(ord("2")) { squad_key = "BRAVO"; }
                else if keyboard_check_pressed(ord("3"))  { squad_key = "CHARLIE"; }
                    else if keyboard_check_pressed(ord("4"))  { squad_key = "DELTA"; }
                        else if keyboard_check_pressed(ord("5"))  { squad_key = "ECHO"; }
                            else { squad_key = noone; }
        switch squad_key {
            case "ALPHA":
                //Remove all units already assigned to the squad
                if !keyboard_check_direct(vk_lshift) { if !ds_list_empty(global.squad_alpha) { ds_list_clear(global.squad_alpha); } }
                //Assign selected units to the squad
                if !ds_list_empty(global.selected_list) {
                    var ii=0;
                    for (ii=0; ii<ds_list_size(global.selected_list); ii+=1) {
                        var unit = ds_list_find_value(global.selected_list, ii);
                        //If the unit is currently assigned to another squad
                        if unit.my_squad != noone {
                            //Remove the unit from its current squad list
                            switch unit.my_squad {
                                case "Alpha":
                                    if !keyboard_check_direct(vk_lshift) {
                                        //Add the unit to this squad list
                                        ds_list_add(global.squad_alpha, unit);
                                        unit.my_squad = "Alpha";
                                    }
                                    break;
                                case "Bravo":
                                    ds_list_delete(global.squad_bravo, ds_list_find_index(global.squad_bravo, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_alpha, unit);
                                    unit.my_squad = "Alpha";
                                    break;
                                case "Charlie":
                                    ds_list_delete(global.squad_charlie, ds_list_find_index(global.squad_charlie, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_alpha, unit);
                                    unit.my_squad = "Alpha";
                                    break;
                                case "Delta":
                                    ds_list_delete(global.squad_delta, ds_list_find_index(global.squad_delta, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_alpha, unit);
                                    unit.my_squad = "Alpha";
                                    break;
                                case "Echo":
                                    ds_list_delete(global.squad_echo, ds_list_find_index(global.squad_echo, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_alpha, unit);
                                    unit.my_squad = "Alpha";
                                    break;
                                default:
                                    break;
                            }
                        }
                            else { 
                                //Add the unit to this squad list
                                ds_list_add(global.squad_alpha, unit);
                                unit.my_squad = "Alpha";
                            }
                    }
                }
                squad_key = noone;
                squad_check = true;
                break;
            case "BRAVO":
                //Remove all units already assigned to the squad
                if !keyboard_check_direct(vk_lshift) { if !ds_list_empty(global.squad_bravo) { ds_list_clear(global.squad_bravo); } }
                //Assign selected units to the squad
                if !ds_list_empty(global.selected_list) {
                    var ii=0;
                    for (ii=0; ii<ds_list_size(global.selected_list); ii+=1) {
                        var unit = ds_list_find_value(global.selected_list, ii);
                        //If the unit is currently assigned to another squad
                        if unit.my_squad != noone {
                            //Remove the unit from its current squad list
                            switch unit.my_squad {
                                case "Alpha":
                                    ds_list_delete(global.squad_alpha, ds_list_find_index(global.squad_alpha, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_bravo, unit);
                                    unit.my_squad = "Bravo";
                                    break;
                                case "Bravo":
                                    if !keyboard_check_direct(vk_lshift) {
                                        //Add the unit to this squad list
                                        ds_list_add(global.squad_bravo, unit);
                                        unit.my_squad = "Bravo";
                                    }
                                    break;
                                case "Charlie":
                                    ds_list_delete(global.squad_charlie, ds_list_find_index(global.squad_charlie, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_bravo, unit);
                                    unit.my_squad = "Bravo";
                                    break;
                                case "Delta":
                                    ds_list_delete(global.squad_delta, ds_list_find_index(global.squad_delta, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_bravo, unit);
                                    unit.my_squad = "Bravo";
                                    break;
                                case "Echo":
                                    ds_list_delete(global.squad_echo, ds_list_find_index(global.squad_echo, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_bravo, unit);
                                    unit.my_squad = "Bravo";
                                    break;
                                default:
                                    break;
                            }
                        }
                            else { 
                                //Add the unit to this squad list
                                ds_list_add(global.squad_bravo, unit);
                                unit.my_squad = "Bravo";
                            }
                    }
                }
                squad_key = noone;
                squad_check = true;
                break;
            case "CHARLIE":
                //Remove all units already assigned to the squad
                if !keyboard_check_direct(vk_lshift) { if !ds_list_empty(global.squad_charlie) { ds_list_clear(global.squad_charlie); } }
                //Assign selected units to the squad
                if !ds_list_empty(global.selected_list) {
                    var ii=0;
                    for (ii=0; ii<ds_list_size(global.selected_list); ii+=1) {
                        var unit = ds_list_find_value(global.selected_list, ii);
                        //If the unit is currently assigned to another squad
                        if unit.my_squad != noone {
                            //Remove the unit from its current squad list
                            switch unit.my_squad {
                                case "Alpha":
                                    ds_list_delete(global.squad_alpha, ds_list_find_index(global.squad_alpha, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_charlie, unit);
                                    unit.my_squad = "Charlie";
                                    break;
                                case "Bravo":
                                    ds_list_delete(global.squad_bravo, ds_list_find_index(global.squad_bravo, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_charlie, unit);
                                    unit.my_squad = "Charlie";
                                    break;
                                case "Charlie":
                                    if !keyboard_check_direct(vk_lshift) {
                                        //Add the unit to this squad list
                                        ds_list_add(global.squad_charlie, unit);
                                        unit.my_squad = "Charlie";
                                    }
                                    break;
                                case "Delta":
                                    ds_list_delete(global.squad_delta, ds_list_find_index(global.squad_delta, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_charlie, unit);
                                    unit.my_squad = "Charlie";
                                    break;
                                case "Echo":
                                    ds_list_delete(global.squad_echo, ds_list_find_index(global.squad_echo, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_charlie, unit);
                                    unit.my_squad = "Charlie";
                                    break;
                                default:
                                    break;
                            }
                        }
                            else { 
                                //Add the unit to this squad list
                                ds_list_add(global.squad_charlie, unit);
                                unit.my_squad = "Charlie";
                            }
                    }
                }
                squad_key = noone;
                squad_check = true;
                break;
            case "DELTA":
                //Remove all units already assigned to the squad
                if !keyboard_check_direct(vk_lshift) { if !ds_list_empty(global.squad_delta) { ds_list_clear(global.squad_delta); } }
                //Assign selected units to the squad
                if !ds_list_empty(global.selected_list) {
                    var ii=0;
                    for (ii=0; ii<ds_list_size(global.selected_list); ii+=1) {
                        var unit = ds_list_find_value(global.selected_list, ii);
                        //If the unit is currently assigned to another squad
                        if unit.my_squad != noone {
                            //Remove the unit from its current squad list
                            switch unit.my_squad {
                                case "Alpha":
                                    ds_list_delete(global.squad_alpha, ds_list_find_index(global.squad_alpha, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_delta, unit);
                                    unit.my_squad = "Delta";
                                    break;
                                case "Bravo":
                                    ds_list_delete(global.squad_bravo, ds_list_find_index(global.squad_bravo, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_delta, unit);
                                    unit.my_squad = "Delta";
                                    break;
                                case "Charlie":
                                    ds_list_delete(global.squad_charlie, ds_list_find_index(global.squad_charlie, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_delta, unit);
                                    unit.my_squad = "Delta";
                                    break;
                                case "Delta":
                                    if !keyboard_check_direct(vk_lshift) {
                                        //Add the unit to this squad list
                                        ds_list_add(global.squad_delta, unit);
                                        unit.my_squad = "Delta";
                                    }
                                    break;
                                case "Echo":
                                    ds_list_delete(global.squad_echo, ds_list_find_index(global.squad_echo, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_delta, unit);
                                    unit.my_squad = "Delta";
                                    break;
                                default:
                                    break;
                            }
                        }
                            else { 
                                //Add the unit to this squad list
                                ds_list_add(global.squad_delta, unit);
                                unit.my_squad = "Delta";
                            }
                        
                    }
                }
                squad_key = noone;
                squad_check = true;
                break;
            case "ECHO":
                //Remove all units already assigned to the squad
                if !keyboard_check_direct(vk_lshift) { if !ds_list_empty(global.squad_echo) { ds_list_clear(global.squad_echo); } }
                //Assign selected units to the squad
                if !ds_list_empty(global.selected_list) {
                    var ii=0;
                    for (ii=0; ii<ds_list_size(global.selected_list); ii+=1) {
                        var unit = ds_list_find_value(global.selected_list, ii);
                        //If the unit is currently assigned to another squad
                        if unit.my_squad != noone {
                            //Remove the unit from its current squad list
                            switch unit.my_squad {
                                case "Alpha":
                                    ds_list_delete(global.squad_alpha, ds_list_find_index(global.squad_alpha, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_echo, unit);
                                    unit.my_squad = "Echo";
                                    break;
                                case "Bravo":
                                    ds_list_delete(global.squad_bravo, ds_list_find_index(global.squad_bravo, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_echo, unit);
                                    unit.my_squad = "Echo";
                                    break;
                                case "Charlie":
                                    ds_list_delete(global.squad_charlie, ds_list_find_index(global.squad_charlie, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_echo, unit);
                                    unit.my_squad = "Echo";
                                    break;
                                case "Delta":
                                    ds_list_delete(global.squad_delta, ds_list_find_index(global.squad_delta, unit.id));
                                    //Add the unit to this squad list
                                    ds_list_add(global.squad_echo, unit);
                                    unit.my_squad = "Echo";
                                    break;
                                case "Echo":
                                    if !keyboard_check_direct(vk_lshift) {
                                        //Add the unit to this squad list
                                        ds_list_add(global.squad_echo, unit);
                                        unit.my_squad = "Echo";
                                    }
                                    break;
                            }
                        }
                            else { 
                                //Add the unit to this squad list
                                ds_list_add(global.squad_echo, unit);
                                unit.my_squad = "Echo";
                            }
                    }
                }
                squad_key = noone;
                squad_check = true;
                break;
            case "NOONE":
                break;
        }
    }
}

