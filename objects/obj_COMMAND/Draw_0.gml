//Bomber targeting
if draw_bomber == true {
    //Left of center
    //4
    draw_sprite_ext(spr_Bomb, 0, bomb_x4, bomb_y4, 1, 1, txt_rot, c_white, 1);
    //3
    draw_sprite_ext(spr_Bomb, 0, bomb_x3, bomb_y3, 1, 1, txt_rot, c_white, 1);
    //2
    draw_sprite_ext(spr_Bomb, 0, bomb_x2, bomb_y2, 1, 1, txt_rot, c_white, 1);
    //Target X
    draw_sprite_ext(spr_Bomb, 0, bomb_x1, bomb_y1, 1, 1, txt_rot, c_white, 1);
    //Right of center
    //5
    draw_sprite_ext(spr_Bomb, 0, bomb_x5, bomb_y5, 1, 1, txt_rot, c_white, 1);
    //6
    draw_sprite_ext(spr_Bomb, 0, bomb_x6, bomb_y6, 1, 1, txt_rot, c_white, 1);
    //7
    draw_sprite_ext(spr_Bomb, 0, bomb_x7, bomb_y7, 1, 1, txt_rot, c_white, 1);
    if confirm_menu == true {
        draw_sprite_ext(spr_Dot_Green, 0, bomb_x4, bomb_y4, 1, 1, 0, c_white, 1);
        draw_sprite_ext(spr_Dot_Green, 0, bomb_x3, bomb_y3, 1, 1, 0, c_white, 1);
        draw_sprite_ext(spr_Dot_Green, 0, bomb_x2, bomb_y2, 1, 1, 0, c_white, 1);
        draw_sprite_ext(spr_Dot_Green, 0, bomb_x1, bomb_y1, 1, 1, 0, c_white, 1);
        draw_sprite_ext(spr_Dot_Green, 0, bomb_x5, bomb_y5, 1, 1, 0, c_white, 1);
        draw_sprite_ext(spr_Dot_Green, 0, bomb_x6, bomb_y6, 1, 1, 0, c_white, 1);
        draw_sprite_ext(spr_Dot_Green, 0, bomb_x7, bomb_y7, 1, 1, 0, c_white, 1);
    }
}
    //Cruise missile targeting
    else if draw_missile == true {
        //Left of center
        //4
        draw_sprite_ext(spr_Missile, 0, bomb_x4, bomb_y4, 1, 1, txt_rot, c_white, 1);
        //3
        draw_sprite_ext(spr_Missile, 0, bomb_x3, bomb_y3, 1, 1, txt_rot, c_white, 1);
        //2
        draw_sprite_ext(spr_Missile, 0, bomb_x2, bomb_y2, 1, 1, txt_rot, c_white, 1);
        //Target
        draw_sprite_ext(spr_Missile, 0, bomb_x1, bomb_y1, 1, 1, txt_rot, c_white, 1);
        //Right of center
        //5
        draw_sprite_ext(spr_Missile, 0, bomb_x5, bomb_y5, 1, 1, txt_rot, c_white, 1);
        //6
        draw_sprite_ext(spr_Missile, 0, bomb_x6, bomb_y6, 1, 1, txt_rot, c_white, 1);
        //7
        draw_sprite_ext(spr_Missile, 0, bomb_x7, bomb_y7, 1, 1, txt_rot, c_white, 1);
        if confirm_menu == true {
            draw_sprite_ext(spr_Dot_Green, 0, bomb_x4, bomb_y5, 1, 1, 0, c_white, 1);
            draw_sprite_ext(spr_Dot_Green, 0, bomb_x3, bomb_y3, 1, 1, 0, c_white, 1);
            draw_sprite_ext(spr_Dot_Green, 0, bomb_x2, bomb_y2, 1, 1, 0, c_white, 1);
            draw_sprite_ext(spr_Dot_Green, 0, bomb_x1, bomb_y1, 1, 1, 0, c_white, 1);
            draw_sprite_ext(spr_Dot_Green, 0, bomb_x5, bomb_y5, 1, 1, 0, c_white, 1);
            draw_sprite_ext(spr_Dot_Green, 0, bomb_x6, bomb_y6, 1, 1, 0, c_white, 1);
            draw_sprite_ext(spr_Dot_Green, 0, bomb_x7, bomb_y7, 1, 1, 0, c_white, 1);
        }
    }
        //UAV targeting
        else if draw_uav == true {
            //Target
            var rr = point_direction(uav_x1, uav_y1, uav_x2, uav_y2);
            draw_line_width_colour(uav_x1, uav_y1, uav_x2, uav_y2, 8, c_black, c_black);
            draw_line_width_colour(uav_x1, uav_y1, uav_x2, uav_y2, 6, make_colour_rgb(0,100,0), make_colour_rgb(0,100,0));
            draw_sprite_ext(s_uav, 0, target_x, target_y, 1, 1, rr, c_white, 1);
            draw_sprite(spr_Dot_Green, 0, target_x, target_y);
        }
            //Artillery targeting
            else if draw_artillery == true {
                //Left of center
                //4
                draw_sprite_ext(spr_Artillery, 0, bomb_x4 , bomb_y4 , 1, 1, txt_rot, c_white, 1);
                //3
                draw_sprite_ext(spr_Artillery, 0, bomb_x3 , bomb_y3 , 1, 1, txt_rot, c_white, 1);
                //2
                draw_sprite_ext(spr_Artillery, 0, bomb_x2 , bomb_y2 , 1, 1, txt_rot, c_white, 1);
                //Target
                draw_sprite_ext(spr_Artillery, 0, bomb_x1 , bomb_y1 , 1, 1, txt_rot, c_white, 1);
                //Right of center
                //5
                draw_sprite_ext(spr_Artillery, 0, bomb_x5 , bomb_y5 , 1, 1, txt_rot, c_white, 1);
                //6
                draw_sprite_ext(spr_Artillery, 0, bomb_x6 , bomb_y6 , 1, 1, txt_rot, c_white, 1);
                //7
                draw_sprite_ext(spr_Artillery, 0, bomb_x7 , bomb_y7 , 1, 1, txt_rot, c_white, 1);
                //8
                draw_sprite_ext(spr_Artillery, 0, bomb_x8 , bomb_y8 , 1, 1, txt_rot, c_white, 1);
                //9
                draw_sprite_ext(spr_Artillery, 0, bomb_x9 , bomb_y9 , 1, 1, txt_rot, c_white, 1);
                //10
                draw_sprite_ext(spr_Artillery, 0, bomb_x10, bomb_y10, 1, 1, txt_rot, c_white, 1);
                
                if confirm_menu == true {
                    //4
                    draw_sprite_ext(spr_Dot_Green, 0, bomb_x4, bomb_y4, 1, 1, 0, c_white, 1);
                    draw_sprite_ext(spr_Dot_Green, 0, bomb_x3, bomb_y3, 1, 1, 0, c_white, 1);
                    draw_sprite_ext(spr_Dot_Green, 0, bomb_x2, bomb_y2, 1, 1, 0, c_white, 1);
                    draw_sprite_ext(spr_Dot_Green, 0, bomb_x1, bomb_y1, 1, 1, 0, c_white, 1);
                    draw_sprite_ext(spr_Dot_Green, 0, bomb_x5, bomb_y5, 1, 1, 0, c_white, 1);
                    draw_sprite_ext(spr_Dot_Green, 0, bomb_x6, bomb_y6, 1, 1, 0, c_white, 1);
                    draw_sprite_ext(spr_Dot_Green, 0, bomb_x7, bomb_y7, 1, 1, 0, c_white, 1);
                    draw_sprite_ext(spr_Dot_Green, 0, bomb_x8, bomb_y8, 1, 1, 0, c_white, 1);
                    draw_sprite_ext(spr_Dot_Green, 0, bomb_x9, bomb_y9, 1, 1, 0, c_white, 1);
                    draw_sprite_ext(spr_Dot_Green, 0, bomb_x10, bomb_y10, 1, 1, 0, c_white, 1);
                }
            }
                //Airdrop targeting
                else if draw_airdrop == true {
                    if can_drop == true { draw_sprite_ext(spr_Airdrop_Green, 0, bomb_x1, bomb_y1, 1, 1, txt_rot, c_white, 1); }
                        else { draw_sprite_ext(spr_Airdrop_Red, 0, bomb_x1, bomb_y1, 1, 1, txt_rot, c_white, 1); }
                    //Target
                    if confirm_menu == true {
                        draw_sprite_ext(spr_Dot_Green, 0, bomb_x1, bomb_y1, 1, 1, 0, c_white, 1);
                    }
                }
                    //Infantry reinforcement ship
                    else if draw_ilc == true || draw_tlc == true || draw_blc == true || draw_elc == true || draw_llc == true {
                        if confirm_menu == true {
                            draw_sprite_ext(spr_Dot_Orange, 0, ship_x, ship_y, 1, 1, 0, c_white, 1);
                        }
                    }
                                    
if confirm_menu == true {
	scr_Command_Menu();
}
