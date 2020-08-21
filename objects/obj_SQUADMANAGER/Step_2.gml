//Go thru all the squad lists and set unit designation accordingly
if squad_check == true {
    squad_check = false;
    if !ds_list_empty(global.unit_list) {
        var i=0;
        for (i=0; i<ds_list_size(global.unit_list); i+=1) {
            var unit = ds_list_find_value(global.unit_list, i);
            unit.my_squad = noone;
        }
    }
    if !ds_list_empty(global.squad_alpha) {
        var i=0;
        for (i=0; i<ds_list_size(global.squad_alpha); i+=1) {
            var unit = ds_list_find_value(global.squad_alpha, i);
            unit.my_squad = "Alpha";
        }
    }
    if !ds_list_empty(global.squad_bravo) {
        var i=0;
        for (i=0; i<ds_list_size(global.squad_bravo); i+=1) {
            var unit = ds_list_find_value(global.squad_bravo, i);
            unit.my_squad = "Bravo";
        }
    }
    if !ds_list_empty(global.squad_charlie) {
        var i=0;
        for (i=0; i<ds_list_size(global.squad_charlie); i+=1) {
            var unit = ds_list_find_value(global.squad_charlie, i);
            unit.my_squad = "Charlie";
        }
    }
    if !ds_list_empty(global.squad_delta) {
        var i=0;
        for (i=0; i<ds_list_size(global.squad_delta); i+=1) {
            var unit = ds_list_find_value(global.squad_delta, i);
            unit.my_squad = "Delta";
        }
    }
    if !ds_list_empty(global.squad_echo) {
        var i=0;
        for (i=0; i<ds_list_size(global.squad_echo); i+=1) {
            var unit = ds_list_find_value(global.squad_echo, i);
            unit.my_squad = "Echo";
        }
    }
}

if global.game_turn != 0 {
    if global.my_turn == true {
        if global.menu_create != true && global.nav_menu != true && global.nav_select != true && global.fire_display != true {
            if !keyboard_check_direct(vk_control) {
                if keyboard_check_pressed(ord("1")) {
                    var i;
                    for (i = 0; i<ds_list_size(global.unit_list); i+=1) {
                        var unit = ds_list_find_value(global.unit_list, i);
                        with unit {
                            if my_squad == "Alpha" { 
                                if (global.can_select != false) && (nav_confirmed != true) && (action_confirmed != true) && (resupplying != true) {
                                    if selected == false { selected = true; } 
                                }
                            }
                                else { selected = false; }
                    
                        }
                    }
                }
                    else if keyboard_check_pressed(ord("2")) {
                        var i;
                        for (i = 0; i<ds_list_size(global.unit_list); i+=1) {
                            var unit = ds_list_find_value(global.unit_list, i);
                            with unit {
                                if my_squad == "Bravo" { 
                                    if (global.can_select != false) && (nav_confirmed != true) && (action_confirmed != true) && (resupplying != true) {
                                        if selected == false { selected = true; } 
                                    }
                                }
                                    else { selected = false; }
                        
                            }
                        }
                    }
                        else if keyboard_check_pressed(ord("3")) {
                            var i;
                            for (i = 0; i<ds_list_size(global.unit_list); i+=1) {
                                var unit = ds_list_find_value(global.unit_list, i);
                                with unit {
                                    if my_squad == "Charlie" { 
                                        if (global.can_select != false) && (nav_confirmed != true) && (action_confirmed != true) && (resupplying != true) {
                                            if selected == false { selected = true; } 
                                        }
                                    }
                                        else { selected = false; }
                            
                                }
                            }
                        }
                            else if keyboard_check_pressed(ord("4")) {
                                var i;
                                for (i = 0; i<ds_list_size(global.unit_list); i+=1) {
                                    var unit = ds_list_find_value(global.unit_list, i);
                                    with unit {
                                        if my_squad == "Delta" { 
                                            if (global.can_select != false) && (nav_confirmed != true) && (action_confirmed != true) && (resupplying != true) {
                                                if selected == false { selected = true; } 
                                            }
                                        }
                                            else { selected = false; }
                                
                                    }
                                }
                            }
                                else if keyboard_check_pressed(ord("5")) {
                                    var i;
                                    for (i = 0; i<ds_list_size(global.unit_list); i+=1) {
                                        var unit = ds_list_find_value(global.unit_list, i);
                                        with unit {
                                            if my_squad == "Echo" { 
                                                if (global.can_select != false) && (nav_confirmed != true) && (action_confirmed != true) && (resupplying != true) {
                                                    if selected == false { selected = true; } 
                                                }
                                            }
                                                else { selected = false; }
                                    
                                        }
                                    }
                                }
                                    else {
                                    }
            }
        }   
    }
}

