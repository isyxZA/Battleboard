draw_set_font(fnt_12);
draw_set_colour(c_white); 
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
//If it's my turn
if global.my_turn == true || global.waiting == true {
    if global.game_turn == 0 {
        if global.vis_mask == true { draw_sprite_ext(spr_Octagon_Gray, 0, x, y, 1, 1, 0, c_white, 1); }
		mask = shader_get_sampler_index(shd_shadows, "mask");
		shader_set(shd_shadows);
		texture_set_stage(mask, sprite_get_texture(my_sprite, 0));
		shader_set_uniform_f(bright_x, 0.5);
		shader_set_uniform_f(bright_y, 0.5);
        draw_sprite_ext(my_sprite, 0, x, y, scl, scl, rot, c_white, 1);
		texture_set_stage(mask, sprite_get_texture(my_turret, 0));
        draw_sprite_ext(my_turret, 0, x, y, scl, scl, turret_rot, c_white, 1);
		shader_reset();
    }
        else {
            //If not pathing
            if nav_confirmed == false {
                if selected {
                    if global.vis_mask == true { 
                        if taking_damage == false { draw_sprite_ext(spr_Octagon_Green, 0, x, y, 1, 1, 0, c_white, 1); } 
                            else { draw_sprite_ext(spr_Octagon_Red, 0, x, y, 1, 1, 0, c_white, 1); }
                    }
                    draw_sprite_ext(my_sprite, 0, x, y, scl, scl, rot, c_white, 1); 
                    draw_sprite_ext(my_turret, 0, x, y, scl, scl, turret_rot, c_white, 1); 
                    if global.nav_select == true && anim_select == false  {
                        var na;
                        if nav_split == true { na = 0.75; } else { na = 0.25; }
                        //Draw icon to show potential waypoint location 
                        draw_sprite_ext(my_sprite, 0, x_end, y_end, 0.75, 0.75, rot, c_white, na);
                        draw_sprite_ext(my_turret, 0, x_end, y_end, 0.75, 0.75, turret_rot, c_white, na);
                    }
                        //If selected and not selecting a path
                        else if global.nav_select == false {
                            //Nav menu is up (CONFIRM, CANCEL)
                            if global.nav_menu == true {
                                //Draw icon at current waypoint location 
                                if p_one == true { draw_sprite_ext(my_sprite, 0, x_end-4, y_end+2, 0.8, 0.8, rot, c_black, 0.5); }
									else { draw_sprite_ext(my_sprite, 0, x_end+4, y_end-2, 0.8, 0.8, rot, c_black, 0.5); } 
                                draw_sprite_ext(my_sprite, 0, x_end, y_end, 0.75, 0.75, rot, c_white, 1);
                                draw_sprite_ext(my_turret, 0, x_end, y_end, 0.75, 0.75, turret_rot, c_white, 1);
                            }
                        }
                }
                    //If not selected then draw unit at current location without effects
                    else { 
                        if action_confirmed == true { 
                            if global.vis_mask == true { 
                                if taking_damage == false { draw_sprite_ext(spr_Octagon_Orange, 0, x, y, 1, 1, 0, c_white, 1); } 
                                    else { draw_sprite_ext(spr_Octagon_Red, 0, x, y, 1, 1, 0, c_white, 1); }
                            }
                        }
                            else { 
                                if global.vis_mask == true { 
                                    if taking_damage == false { draw_sprite_ext(spr_Octagon_Gray, 0, x, y, 1, 1, 0, c_white, 1); } 
                                        else { draw_sprite_ext(spr_Octagon_Red, 0, x, y, 1, 1, 0, c_white, 1); }
                                }
                            }
						mask = shader_get_sampler_index(shd_shadows, "mask");
                        shader_set(shd_shadows);
						texture_set_stage(mask, sprite_get_texture(my_sprite, 0));
						shader_set_uniform_f(bright_x, 0.5);
						shader_set_uniform_f(bright_y, 0.5);
				        draw_sprite_ext(my_sprite, 0, x, y, scl, scl, rot, c_white, 1);
						texture_set_stage(mask, sprite_get_texture(my_turret, 0));
				        draw_sprite_ext(my_turret, 0, x, y, scl, scl, turret_rot, c_white, 1);
						shader_reset();
                    }
            }
                //If pathing
                else if nav_confirmed == true {
                    //Draw the unit at path end
                    if global.vis_mask == true { 
                        if taking_damage == false { draw_sprite_ext(spr_Octagon_Orange, 0, x_final, y_final, 1, 1, 0, c_white, 1); } 
                            else { draw_sprite_ext(spr_Octagon_Red, 0, x_final, y_final, 1, 1, 0, c_white, 1); }
                    }
                    var pa = max(0.5, path_position);
                    draw_sprite_ext(my_sprite, 0, x_final, y_final, scl, scl, rot, c_white, pa);
                    draw_sprite_ext(my_turret, 0, x_final, y_final, scl, scl, turret_rot, c_white, pa);
                }
    }
}
    //If it's not my turn
    else {
        if global.vis_mask == true { 
            if taking_damage == false { draw_sprite_ext(spr_Octagon_Gray, 0, x, y, 1, 1, 0, c_white, 1); } 
                else { draw_sprite_ext(spr_Octagon_Red, 0, x, y, 1, 1, 0, c_white, 1); }
        }
		mask = shader_get_sampler_index(shd_shadows, "mask");
        shader_set(shd_shadows);
		texture_set_stage(mask, sprite_get_texture(my_sprite, 0));
		shader_set_uniform_f(bright_x, 0.5);
		shader_set_uniform_f(bright_y, 0.5);
        draw_sprite_ext(my_sprite, 0, x, y, scl, scl, rot, c_white, 1);
		texture_set_stage(mask, sprite_get_texture(my_turret, 0));
        draw_sprite_ext(my_turret, 0, x, y, scl, scl, turret_rot, c_white, 1);
		shader_reset();
    }
	
if show_armor == true { 
	draw_sprite_ext(my_armor , 0, x_final, y_final, scl, scl, rot, c_white, 1);
    draw_sprite_ext(my_turret_armor, 0, x_final, y_final, scl, scl, turret_rot, c_white, 1);
}

scr_DrawSquad(my_squad);


//draw_set_color(c_white);
//draw_text(x, y-16, string(rot));
//draw_text(x, y+16, string(rot_offset));


/*
if selected || action_confirmed {
	//Determine bullet impact angle
	var edir = round(point_direction(global.target_x, global.target_y, x, y));
	draw_set_color(c_white);
	draw_text(x, y-16, string(edir));
}
draw_text(x, y+16, target_impact);
*/

/*
draw_set_alpha(0.1);
draw_circle_colour(x, y, view_radius, c_fuchsia, c_fuchsia, false);
draw_set_alpha(1);
*/

draw_set_colour(c_black);

