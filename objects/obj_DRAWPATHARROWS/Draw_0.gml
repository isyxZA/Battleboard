if global.my_turn == true || global.waiting == true {
    if !ds_list_empty(global.myunit_list) {
        var i;
        for (i=0; i<ds_list_size(global.myunit_list); i+=1) {
            var unit = ds_list_find_value(global.myunit_list, i);
            with unit {
                   if selected {
						//Currently selecting a path
                        if global.nav_select == true || global.nav_menu == true {
							if move_amount > 0 {
	                            //Draw the unit path
								var pn = path_get_number(my_path);
	                            var p1;
	                            for(p1=1; p1<pn; p1+=1) {
	                                var x1 = path_get_point_x(my_path, p1-1);
	                                var y1 = path_get_point_y(my_path, p1-1);
	                                var x2 = path_get_point_x(my_path, p1);
	                                var y2 = path_get_point_y(my_path, p1);
		                            var r  = floor(point_direction(x1, y1, x2, y2)); 
									//draw_text(x1, y1, string(r));
									switch r {
										case 0:
										case 360:
											//EAST
											draw_sprite_ext(spr_Dir_E, 0, x1, y1, 1, 1, 0, c_white, line_alpha);
											break;
										case 45:
											//NE
											draw_sprite_ext(spr_Dir_NE, 0, x1, y1, 1, 1, 0, c_white, line_alpha);
											break;
										case 90:
											//NORTH
											draw_sprite_ext(spr_Dir_N, 0, x1, y1, 1, 1, 0, c_white, line_alpha);
											break;
										case 135:
											//NW
											draw_sprite_ext(spr_Dir_NW, 0, x1, y1, 1, 1, 0, c_white, line_alpha);
											break;
										case 180:
											//WEST
											draw_sprite_ext(spr_Dir_W, 0, x1, y1, 1, 1, 0, c_white, line_alpha);
											break;
										case 225:
											//SW
											draw_sprite_ext(spr_Dir_SW, 0, x1, y1, 1, 1, 0, c_white, line_alpha);
											break;
										case 270:
											//SOUTH
											draw_sprite_ext(spr_Dir_S, 0, x1, y1, 1, 1, 0, c_white, line_alpha);
											break;
										case 315:
											//SE
											draw_sprite_ext(spr_Dir_SE, 0, x1, y1, 1, 1, 0, c_white, line_alpha);
											break;
									}
	                            }
							}
                        }
                    }
                        //If the unit is not currently selected
                        else {
                            if nav_confirmed == true {
								//Draw the path as the unit moves along it
								var pn = path_get_number(my_path);
								/*
                                if point_count < pn {
                                    var px = path_get_point_x(my_path, point_count);    
                                    var py = path_get_point_y(my_path, point_count);
									var px1 = path_get_point_x(my_path, point_count+1);    
                                    var py1 = path_get_point_y(my_path, point_count+1);
									var r1 = floor(point_direction(px, py, px1, py1));
									switch r1 {
										case 0:
										case 360:
											//EAST
											draw_sprite_ext(spr_Dir_E, 0, px, py, 1, 1, 0, c_white, line_alpha);
											break;
										case 45:
											//NE
											draw_sprite_ext(spr_Dir_NE, 0, px, py, 1, 1, 0, c_white, line_alpha);
											break;
										case 90:
											//NORTH
											draw_sprite_ext(spr_Dir_N, 0, px, py, 1, 1, 0, c_white, line_alpha);
											break;
										case 135:
											//NW
											draw_sprite_ext(spr_Dir_NW, 0, px, py, 1, 1, 0, c_white, line_alpha);
											break;
										case 180:
											//WEST
											draw_sprite_ext(spr_Dir_W, 0, px, py, 1, 1, 0, c_white, line_alpha);
											break;
										case 225:
											//SW
											draw_sprite_ext(spr_Dir_SW, 0, px, py, 1, 1, 0, c_white, line_alpha);
											break;
										case 270:
											//SOUTH
											draw_sprite_ext(spr_Dir_S, 0, px, py, 1, 1, 0, c_white, line_alpha);
											break;
										case 315:
											//SE
											draw_sprite_ext(spr_Dir_SE, 0, px, py, 1, 1, 0, c_white, line_alpha);
											break;
									}	
                                }
								*/
                                var p;
                                for(p=1; p<pn; p+=1) {
                                    if (p>point_count) && (p<pn) {
                                        var x1 = path_get_point_x(my_path, p-1);
                                        var y1 = path_get_point_y(my_path, p-1);
                                        var x2 = path_get_point_x(my_path, p);
                                        var y2 = path_get_point_y(my_path, p);
										var r2 = floor(point_direction(x1, y1, x2, y2));
                                        switch r2 {
											case 0:
											case 360:
												//EAST
												draw_sprite_ext(spr_Dir_E, 0, x1, y1, 1, 1, 0, c_white, line_alpha);
												break;
											case 45:
												//NE
												draw_sprite_ext(spr_Dir_NE, 0, x1, y1, 1, 1, 0, c_white, line_alpha);
												break;
											case 90:
												//NORTH
												draw_sprite_ext(spr_Dir_N, 0, x1, y1, 1, 1, 0, c_white, line_alpha);
												break;
											case 135:
												//NW
												draw_sprite_ext(spr_Dir_NW, 0, x1, y1, 1, 1, 0, c_white, line_alpha);
												break;
											case 180:
												//WEST
												draw_sprite_ext(spr_Dir_W, 0, x1, y1, 1, 1, 0, c_white, line_alpha);
												break;
											case 225:
												//SW
												draw_sprite_ext(spr_Dir_SW, 0, x1, y1, 1, 1, 0, c_white, line_alpha);
												break;
											case 270:
												//SOUTH
												draw_sprite_ext(spr_Dir_S, 0, x1, y1, 1, 1, 0, c_white, line_alpha);
												break;
											case 315:
												//SE
												draw_sprite_ext(spr_Dir_SE, 0, x1, y1, 1, 1, 0, c_white, line_alpha);
												break;
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
    else {
        if global.opponent_turn == true || global.enemy_waiting == true {
            if !ds_list_empty(global.enemyunit_list) {
                var i;
                for (i=0; i<ds_list_size(global.enemyunit_list); i+=1) {
                    var unit = ds_list_find_value(global.enemyunit_list, i);
                    with unit {
                        if is_visible == true {   
                            if nav_confirmed == true {
	                            //Draw the path as the unit moves along it
								var pn = path_get_number(my_path);
								/*
	                            if point_count < pn {
	                                var px = path_get_point_x(my_path, point_count);    
	                                var py = path_get_point_y(my_path, point_count);
									var px1 = path_get_point_x(my_path, point_count+1);    
	                                var py1 = path_get_point_y(my_path, point_count+1);
									var r1 = floor(point_direction(px, py, px1, py1));
									switch r1 {
										case 0:
										case 360:
											//EAST
											draw_sprite_ext(spr_Dir_E, 0, px, py, 1, 1, 0, c_black, line_alpha);
											break;
										case 45:
											//NE
											draw_sprite_ext(spr_Dir_NE, 0, px, py, 1, 1, 0, c_black, line_alpha);
											break;
										case 90:
											//NORTH
											draw_sprite_ext(spr_Dir_N, 0, px, py, 1, 1, 0, c_black, line_alpha);
											break;
										case 135:
											//NW
											draw_sprite_ext(spr_Dir_NW, 0, px, py, 1, 1, 0, c_black, line_alpha);
											break;
										case 180:
											//WEST
											draw_sprite_ext(spr_Dir_W, 0, px, py, 1, 1, 0, c_black, line_alpha);
											break;
										case 225:
											//SW
											draw_sprite_ext(spr_Dir_SW, 0, px, py, 1, 1, 0, c_black, line_alpha);
											break;
										case 270:
											//SOUTH
											draw_sprite_ext(spr_Dir_S, 0, px, py, 1, 1, 0, c_black, line_alpha);
											break;
										case 315:
											//SE
											draw_sprite_ext(spr_Dir_SE, 0, px, py, 1, 1, 0, c_black, line_alpha);
											break;
									}	
	                            }
								*/
	                            var p;
	                            for(p=1; p<pn; p+=1) {
	                                if (p>point_count) && (p<pn) {
	                                    var x1 = path_get_point_x(my_path, p-1);
	                                    var y1 = path_get_point_y(my_path, p-1);
	                                    var x2 = path_get_point_x(my_path, p);
	                                    var y2 = path_get_point_y(my_path, p);
										var r2 = floor(point_direction(x1, y1, x2, y2));
	                                    switch r2 {
											case 0:
											case 360:
												//EAST
												draw_sprite_ext(spr_Dir_E, 0, x1, y1, 1, 1, 0, c_black, line_alpha);
												break;
											case 45:
												//NE
												draw_sprite_ext(spr_Dir_NE, 0, x1, y1, 1, 1, 0, c_black, line_alpha);
												break;
											case 90:
												//NORTH
												draw_sprite_ext(spr_Dir_N, 0, x1, y1, 1, 1, 0, c_black, line_alpha);
												break;
											case 135:
												//NW
												draw_sprite_ext(spr_Dir_NW, 0, x1, y1, 1, 1, 0, c_black, line_alpha);
												break;
											case 180:
												//WEST
												draw_sprite_ext(spr_Dir_W, 0, x1, y1, 1, 1, 0, c_black, line_alpha);
												break;
											case 225:
												//SW
												draw_sprite_ext(spr_Dir_SW, 0, x1, y1, 1, 1, 0, c_black, line_alpha);
												break;
											case 270:
												//SOUTH
												draw_sprite_ext(spr_Dir_S, 0, x1, y1, 1, 1, 0, c_black, line_alpha);
												break;
											case 315:
												//SE
												draw_sprite_ext(spr_Dir_SE, 0, x1, y1, 1, 1, 0, c_black, line_alpha);
												break;
										}
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

