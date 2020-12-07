/// @description DRAWING THE ACTION LINES
if global.my_turn == true || global.waiting == true {
    with obj_Unit_Parent {
        if selected == false {
            if action_confirmed == true || draw_flash == true {
                var rr = make_colour_rgb(139,0,0);
                switch unit_type {
                    case "INF_A":
					case "INF_B":
                        var dir = point_direction(x, y, target_x, target_y);
                        var xdir = lengthdir_x(24, dir);
                        var ydir = lengthdir_y(24, dir);
                        if draw_flash == true { 
                            gpu_set_blendmode(bm_max);
                            if weapon == "RIFLE" {
                                draw_sprite_ext(flash_index, 0, (x-16)+xdir, y+ydir, 1, 1, dir, c_white, 1);
                                draw_sprite_ext(flash_index, 0, (x+16)+xdir, y+ydir, 1, 1, dir, c_white, 1);
                                draw_sprite_ext(flash_index, 0, (x+32)+xdir, (y-16)+ydir, 1, 1, dir, c_white, 1);
                                draw_sprite_ext(flash_index, 0, (x-32)+xdir, (y-16)+ydir, 1, 1, dir, c_white, 1);
                            }
                                else { draw_sprite_ext(flash_index, 0, x+xdir, y+ydir, 1, 1, dir, c_white, 1); }
                            gpu_set_blendmode(bm_normal); 
                        }
                        draw_sprite_ext(spr_Danger_Icon, 0, target_x, target_y, 1, 1, txt_rot, c_white, 1);
                        break;
                    case "MBT_A":
					case "MBT_B":
                        var dir = point_direction(x, y, target_x, target_y);
                        var xdir = lengthdir_x(39, dir);
                        var ydir = lengthdir_y(39, dir);
                        if draw_flash == true { 
                            gpu_set_blendmode(bm_max);
                            draw_sprite_ext(flash_index, 0, x+xdir, y+ydir, 1, 1, dir, c_white, 1);
                            gpu_set_blendmode(bm_normal); 
                        }
                        draw_sprite_ext(spr_Danger_Icon, 0, target_x, target_y, 1, 1, txt_rot, c_white, 1);
                        break;
                    case "LAC_A":
					case "LAC_B":
                        draw_line_width_colour(x, y, target_x, target_y, 8, c_black, c_black);
                        draw_set_alpha(0.6);
                        draw_line_width_colour(x, y, target_x, target_y, 6, c_green, c_orange);
                        draw_set_alpha(1);
						draw_sprite(spr_Dot_Orange, 0, target_x, target_y);
                        break;
                    case "LAV_A":
					case "LAV_B":
                        var dir = point_direction(x, y, target_x, target_y);
                        var xdir = lengthdir_x(22, dir);
                        var ydir = lengthdir_y(22, dir);
                        if draw_flash == true { 
                            gpu_set_blendmode(bm_max);
                            draw_sprite_ext(flash_index, 0, x+xdir, y+ydir, 1, 1, dir, c_white, 1);
                            gpu_set_blendmode(bm_normal); 
                        }
                        draw_sprite_ext(spr_Danger_Icon, 0, target_x, target_y, 1, 1, txt_rot, c_white, 1);
                        break;
                    case "LOGI_A":
					case "LOGI_B":
                        draw_line_width_colour(x,   y, target_x, target_y, 8, c_black, c_black);
                        draw_set_alpha(0.6);
                        draw_line_width_colour(x,   y, target_x, target_y, 6, c_green, c_orange);
                        draw_set_alpha(1);
                        break;
                    case "DEPOT":
                        draw_line_width_colour(x,   y, target_x, target_y, 8, c_black, c_black);
                        draw_set_alpha(0.6);
                        draw_line_width_colour(x,   y, target_x, target_y, 6, c_green, c_orange);
                        draw_set_alpha(1);
                        break;
                    case "REPAIR":
                        if is_occupied == false {
                            var dir = point_direction(x, y, target_x, target_y);
                            var xdir = lengthdir_x(30, dir);
                            var ydir = lengthdir_y(30, dir);
                            if draw_flash == true { 
                                gpu_set_blendmode(bm_max);
                                draw_sprite_ext(flash_index, 0, x+xdir, y+ydir, 1, 1, dir, c_white, 1);
                                gpu_set_blendmode(bm_normal); 
                            }
                            draw_sprite_ext(spr_Danger_Icon, 0, target_x, target_y, 1, 1, txt_rot, c_white, 1);
                        }
                        break;
                    case "TOW":
                        var dir = point_direction(x, y, target_x, target_y);
                        var xdir = lengthdir_x(22, dir);
                        var ydir = lengthdir_y(22, dir);
                        if draw_flash == true { 
                            gpu_set_blendmode(bm_max);
                            draw_sprite_ext(flash_index, 0, x+xdir, y+ydir, 1, 1, dir, c_white, 1);
                            gpu_set_blendmode(bm_normal); 
                        }
                        draw_sprite_ext(spr_Danger_Icon, 0, target_x, target_y, 1, 1, txt_rot, c_white, 1);
                        break;
                    case "MORTAR":
                        draw_sprite_ext(spr_Danger_Icon, 0, target_x, target_y, 1, 1, txt_rot, c_white, 1);
                        break;
                }
                draw_set_alpha(1);
            }
        }
    }
}
    else if global.opponent_turn == true || global.enemy_waiting == true  {
        with obj_Enemy_Parent {
            if action_confirmed == true || draw_flash == true {
                var rr = make_colour_rgb(139,0,0);
                switch unit_type {
                    case "E_INFA":
					case "E_INFB":
                        var dir = point_direction(x, y, target_x, target_y);
                        var xdir = lengthdir_x(24, dir);
                        var ydir = lengthdir_y(24, dir);
                        if draw_flash == true { 
                            gpu_set_blendmode(bm_max);
                            if weapon == "RIFLE" {
                                draw_sprite_ext(flash_index, 0, (x-16)+xdir, y+ydir, 1, 1, dir, c_white, 1);
                                draw_sprite_ext(flash_index, 0, (x+16)+xdir, y+ydir, 1, 1, dir, c_white, 1);
                                draw_sprite_ext(flash_index, 0, (x+32)+xdir, (y-16)+ydir, 1, 1, dir, c_white, 1);
                                draw_sprite_ext(flash_index, 0, (x-32)+xdir, (y-16)+ydir, 1, 1, dir, c_white, 1);
                            }
                                else { draw_sprite_ext(flash_index, 0, x+xdir, y+ydir, 1, 1, dir, c_white, 1); }
                            gpu_set_blendmode(bm_normal); 
                        }
                        break;
                    case "E_MBTA":
					case "E_MBTB":
                        var dir = point_direction(x, y, target_x, target_y);
                        var xdir = lengthdir_x(39, dir);
                        var ydir = lengthdir_y(39, dir);
                        if draw_flash == true { 
                            gpu_set_blendmode(bm_max);
                            draw_sprite_ext(flash_index, 0, x+xdir, y+ydir, 1, 1, dir, c_white, 1);
                            gpu_set_blendmode(bm_normal); 
                        }
                        break;
                    case "E_LACA":
					case "E_LACB":
                        draw_line_width_colour(x,   y, target_x, target_y, 8, c_black, c_black);
                        draw_set_alpha(0.6);
                        draw_line_width_colour(x,   y, target_x, target_y, 6, c_green, c_orange);
                        draw_set_alpha(1);
                        break;
                    case "E_LAVA":
					case "E_LAVB":
                        var dir = point_direction(x, y, target_x, target_y);
                        var xdir = lengthdir_x(22, dir);
                        var ydir = lengthdir_y(22, dir);
                        if draw_flash == true { 
                            gpu_set_blendmode(bm_max);
                            draw_sprite_ext(flash_index, 0, x+xdir, y+ydir, 1, 1, dir, c_white, 1);
                            gpu_set_blendmode(bm_normal); 
                        }
                        break;
                    case "E_LOGIA":
					case "E_LOGIB":
                        draw_line_width_colour(x,   y, target_x, target_y, 8, c_black, c_black);
                        draw_set_alpha(0.6);
                        draw_line_width_colour(x,   y, target_x, target_y, 6, c_green, c_orange);
                        draw_set_alpha(1);
                        break;
                    case "E_DEPOT":
                        draw_line_width_colour(x,   y, target_x, target_y, 8, c_black, c_black);
                        draw_set_alpha(0.6);
                        draw_line_width_colour(x,   y, target_x, target_y, 6, c_green, c_orange);
                        draw_set_alpha(1);
                        break;
                    case "E_REPAIR":
                        if is_occupied == false {
                            var dir = point_direction(x, y, target_x, target_y);
                            var xdir = lengthdir_x(30, dir);
                            var ydir = lengthdir_y(30, dir);
                            if draw_flash == true { 
                                gpu_set_blendmode(bm_max);
                                draw_sprite_ext(flash_index, 0, x+xdir, y+ydir, 1, 1, dir, c_white, 1);
                                gpu_set_blendmode(bm_normal); 
                            }
                        }
                        break;
                    case "E_TOW":
                        var dir = point_direction(x, y, target_x, target_y);
                        var xdir = lengthdir_x(22, dir);
                        var ydir = lengthdir_y(22, dir);
                        if draw_flash == true { 
                            gpu_set_blendmode(bm_max);
                            draw_sprite_ext(flash_index, 0, x+xdir, y+ydir, 1, 1, dir, c_white, 1);
                            gpu_set_blendmode(bm_normal); 
                        }
                        break;
                    case "E_MORTAR":
                        break;
                }
                draw_set_alpha(1);
            }
        }     
    }


