/// @description DRAW ORANGE INDICATORS
if global.my_turn == true || global.waiting == true {
    with obj_Unit_Parent {
        if selected {
            if global.menu_create == true {
                //If not currently using the targeting reticule or choosing fire/ammo options
                if global.reticule_display == false {
                    //draw_sprite(spr_Dot_Green, 0, x_end, y_end);
                }
                    else if global.reticule_display == true {
                        //draw_sprite(spr_Dot_Green, 0, x, y);
                    }
            }
                else if global.menu_create == false {
                    if global.nav_menu == true {
                        draw_sprite(spr_Dot_Orange, 0, x_end, y_end);
                        //draw_sprite(spr_Dot_Green, 0, x, y);
                    }
                        else if global.nav_menu == false {
                            if global.nav_select == false { 
                                if unit_type == "LANDINGCRAFT" {
                                }
                                    else {
                                        //draw_sprite(spr_Dot_Green, 0, x, y);
                                    }
                            }
                                else if global.nav_select == true {
                                    if nav_split == true { draw_sprite(spr_Dot_Orange, 0, x_end, y_end); 
									}
                                    //draw_sprite(spr_Dot_Green, 0, x, y);
                                    if nav_offset != 0 { 
                                        var n = nav_offset/global.cell_size;
                                        if n > 0 { draw_sprite_ext(spr_Arrowhead_Green, 0, x_end+17, y_end, 0.5, 0.5,  0, c_white, 1); }
                                            else if n < 0 { draw_sprite_ext(spr_Arrowhead_Green, 0, x_end-16, y_end, 0.5, 0.5, 180, c_white, 1); }
                                    }
                                }
                        }
                }
        }
            else {
                if resupplying == true { 
                    draw_sprite(spr_Dot_Orange, 0, x, y);
                    if manned_unit != noone {
                        draw_set_colour(c_white);
                        draw_set_font(fnt_12);
						if p_one == true { draw_text_transformed_shadow(x, y, string(manned_unit.timer_count), 0.9, 0.9, txt_rot, 2, 245, c_black, 1); }
							else { draw_text_transformed_shadow(x+2, y, string(manned_unit.timer_count), 0.9, 0.9, txt_rot, 2, 65, c_black, 1); }
                        draw_set_colour(c_black);
                    }
                }
                if nav_confirmed == true {
                    draw_sprite(spr_Dot_Orange, 0, x_final, y_final);
                }
                    else if nav_confirmed == false { 
                        if global.game_turn != 0 { 
                            //draw_sprite(spr_Dot_Green, 0, x, y);
                        }
                    }
                if action_confirmed == true {
                    if unit_type != "REPAIR" {
                        draw_sprite(spr_Dot_Orange, 0, x, y);
                        draw_set_colour(c_white);
                        draw_set_font(fnt_12);
						if p_one == true { draw_text_transformed_shadow(x, y, string(timer_count), 0.9, 0.9, txt_rot, 2, 245, c_black, 1); }
							else { draw_text_transformed_shadow(x+2, y, string(timer_count), 0.9, 0.9, txt_rot, 2, 65, c_black, 1); }
                        draw_set_colour(c_black);
                    }
                        else if unit_type == "REPAIR" {
                            if manned_unit != noone {
                            }
                                else {
                                    draw_sprite(spr_Dot_Orange, 0, x, y);
                                    draw_set_colour(c_white);
                                    draw_set_font(fnt_12);
                                    if p_one == true { draw_text_transformed_shadow(x, y, string(timer_count), 0.9, 0.9, txt_rot, 2, 245, c_black, 1); }
										else { draw_text_transformed_shadow(x+2, y, string(timer_count), 0.9, 0.9, txt_rot, 2, 65, c_black, 1); }
                                    draw_set_colour(c_black);
                                }
                        }
                }
            }
    }
    with obj_Ship_Spawn { if spawning == true { draw_sprite_ext(spr_Dot_Orange, 0, x, y, 1.1, 1.1, 0, c_white, 1); } }
}
    else if global.opponent_turn == true || global.enemy_waiting == true  {
        with obj_Enemy_Parent {
            if is_visible == true {
                if action_confirmed == true { draw_sprite(spr_Dot_Orange, 0, x, y); }
                    else if nav_confirmed == true { draw_sprite(spr_Dot_Orange, 0, x_final, y_final); }
                        //else { draw_sprite(spr_Dot_Gray, 0, x, y); }
            }
        }
    }
    

