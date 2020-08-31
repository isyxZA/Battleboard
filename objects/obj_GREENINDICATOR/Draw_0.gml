/// @description DRAW GREEN INDICATORS
if global.my_turn == true || global.waiting == true {
    with obj_Unit_Parent {
        if selected {
            if global.menu_create == true {
                //If not currently using the targeting reticule or choosing fire/ammo options
                if global.reticule_display == false {
                    draw_sprite(spr_Dot_Green, 0, x_end, y_end);
                }
                    else if global.reticule_display == true {
                        draw_sprite(spr_Dot_Green, 0, x, y);
                    }
            }
                else if global.menu_create == false {
                    if global.nav_menu == true {
                        draw_sprite(spr_Dot_Green, 0, x, y);
                    }
                        else if global.nav_menu == false {
                            if global.nav_select == false { 
								draw_sprite(spr_Dot_Green, 0, x, y);
                            }
                                else if global.nav_select == true { draw_sprite(spr_Dot_Green, 0, x, y); }
                        }
                }
        }
            else {
                if nav_confirmed == true { }
                    else if nav_confirmed == false { 
                        if global.game_turn != 0 { 
                            if unit_type != "LANDINGCRAFT" { 
                                if active == true { draw_sprite(spr_Dot_Green, 0, x, y); } 
									//else { draw_sprite(spr_Dot_Gray, 0, x, y); } 
                            }
                                else {
                                    if can_move == false {
                                        if depleted == false { draw_sprite(spr_Dot_Green, 0, x, y); } 
                                            else if depleted == true {
                                                if ship_type == "Supply" && active == true {
                                                    if (parts_ammo >= parts_rate) && (ammunition_ammo >= ammunition_rate) { draw_sprite(spr_Dot_Green, 0, x, y); }
                                                        //else { draw_sprite(spr_Dot_Gray, 0, x, y); }
                                                }
                                                    //else { draw_sprite(spr_Dot_Gray, 0, x, y); }
                                            } 
                                    }
                                }
                        }
                            else if global.game_turn == 0 { 
                                if unit_type == "LANDINGCRAFT" {    
                                    if depleted == false { draw_sprite(spr_Dot_Green, 0, x, y); }
                                        else if depleted == true { draw_sprite(spr_Dot_Gray, 0, x, y); }
                                }
                            }
                    }
            }
    }
}
    

