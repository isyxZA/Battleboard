if global.my_turn == true || global.waiting == true {
    if !ds_list_empty(global.myunit_list) {
        var i;
        for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
            var unit = ds_list_find_value(global.myunit_list, i);
            with unit {
                   if selected {
						//Currently selecting a path
                        if global.nav_select == true {
                            //Draw the unit path
                            var p1;
                            for(p1=1; p1<path_get_number(my_path); p1+=1) {
                                var x1 = path_get_point_x(my_path, p1-1);
                                var y1 = path_get_point_y(my_path, p1-1);
                                var x2 = path_get_point_x(my_path, p1);
                                var y2 = path_get_point_y(my_path, p1);
                                var r = point_direction(x1, y1, x2, y2);
                                draw_set_alpha(0.8);
                                draw_line_width_colour(x1, y1, x2, y2, 3, c_black, c_black);
                                draw_set_alpha(line_alpha);
                                draw_line_width_colour(x1, y1, x2, y2, 3, l_c1, l_c1);
                                draw_set_alpha(1);
                            }
                        }
                            //If selected and not selecting a path
                            else if global.nav_select == false {
                                //Nav menu is up (CONFIRM, CANCEL)
                                if global.nav_menu == true {
                                    //Draw the unit path
                                    var p1;
                                    for(p1=1; p1<path_get_number(my_path); p1+=1) {
                                        var x1 = path_get_point_x(my_path, p1-1);
                                        var y1 = path_get_point_y(my_path, p1-1);
                                        var x2 = path_get_point_x(my_path, p1);
                                        var y2 = path_get_point_y(my_path, p1);
                                        var r = point_direction(x1, y1, x2, y2);
                                        draw_set_alpha(0.8);
                                        draw_line_width_colour(x1, y1, x2, y2, 3, c_black, c_black);
                                        draw_set_alpha(line_alpha);
                                        draw_line_width_colour(x1, y1, x2, y2, 3, l_c2, l_c2);
                                        draw_set_alpha(1);
                                    }
                                }
                            }
                    }
                        //If the unit is not currently selected
                        else {
                            if nav_confirmed == true {
                                if point_count < path_get_number(my_path) {
                                    var px = path_get_point_x(my_path, point_count);    
                                    var py = path_get_point_y(my_path, point_count);
                                    draw_set_alpha(0.8);
                                    draw_line_width_colour(x, y, px, py, 3, c_black, c_black);
                                    draw_set_alpha(line_alpha);
                                    draw_line_width_colour(x, y, px, py, 3, l_c2, l_c2);
                                    draw_set_alpha(1);
                                }
                                //Draw the path as the unit moves along it
                                var p;
                                for(p=1; p<path_get_number(my_path); p+=1) {
                                    if p > point_count && p < path_get_number(my_path) {
                                        var x1 = path_get_point_x(my_path, p-1);
                                        var y1 = path_get_point_y(my_path, p-1);
                                        var x2 = path_get_point_x(my_path, p);
                                        var y2 = path_get_point_y(my_path, p);
                                        var r = point_direction(x1, y1, x2, y2);
                                        draw_set_alpha(0.8);
                                        draw_line_width_colour(x1, y1, x2, y2, 3, c_black, c_black);
                                        draw_set_alpha(line_alpha);
                                        draw_line_width_colour(x1, y1, x2, y2, 3, l_c2, l_c2);
                                        draw_set_alpha(1);
                                    }
                                }
                            }
                        }
            }
        }
    }
   draw_set_alpha(1); 
}
    else {
        if global.opponent_turn == true || global.enemy_waiting == true {
            if !ds_list_empty(global.enemyunit_list) {
                var i;
                for (i=0; i<ds_list_size(global.enemyunit_list); i+=1) {
                    var unit = ds_list_find_value(global.enemyunit_list, i);
                    with unit {
                        if is_visible == true {   
                            if nav_confirmed == true {
                                if point_count < path_get_number(my_path) {
                                    var px = path_get_point_x(my_path, point_count);    
                                    var py = path_get_point_y(my_path, point_count);
                                    draw_set_alpha(0.8);
                                    draw_line_width_colour(x, y, px, py, 3, c_black, c_black);
                                    draw_set_alpha(line_alpha);
                                    draw_line_width_colour(x, y, px, py, 3, l_c1, l_c2);
                                    draw_set_alpha(1);
                                }
                                //Draw the path as the unit moves along it
                                var p;
                                for(p=1; p<path_get_number(my_path); p+=1) {
                                    if p > point_count && p < path_get_number(my_path) {
                                        var x1 = path_get_point_x(my_path, p-1);
                                        var y1 = path_get_point_y(my_path, p-1);
                                        var x2 = path_get_point_x(my_path, p);
                                        var y2 = path_get_point_y(my_path, p);
                                        var r = point_direction(x1, y1, x2, y2);
                                        draw_set_alpha(0.8);
                                        draw_line_width_colour(x1, y1, x2, y2, 3, c_black, c_black);
                                        draw_set_alpha(line_alpha);
                                        draw_line_width_colour(x1, y1, x2, y2, 3, l_c1, l_c2);
                                        draw_set_alpha(1);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        draw_set_alpha(1);
    }

