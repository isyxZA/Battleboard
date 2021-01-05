if global.game_state == "IN_GAME" {
    if global.show_cursor == true {
        if global.reticule_display == false {
            if global.nav_select == true {
				window_set_cursor(cr_arrow);
			}
                else {
                    if mouse_check_button(global.MMOUSE) {
                        dragging = true; 
						window_set_cursor(cr_cross);
                    } 
                        else {
                            dragging = false; 
							window_set_cursor(cr_arrow);
                        }
                }
        }
            else if global.reticule_display == true {
                if global.fire_display == false {
					window_set_cursor(cr_arrow);
                }
                    else {
                        if mouse_check_button(global.MMOUSE) {
                            dragging = true; 
							window_set_cursor(cr_cross);
                        } 
                            else {
                                dragging = false; 
								window_set_cursor(cr_arrow);
                            }
                    }
            }
    }
        else {
			window_set_cursor(cr_arrow);
        }
    //CAMERA ZOOM CONTROL//
    //Set zoom level
    if global.zoom_speed != 0 {
        if global.can_zoom == true {
            if mouse_wheel_up() || keyboard_check_pressed(global.INCREASE) { 
                if global.zoom_level != 0 {
                    global.zoom_level -= 2;
                    if global.zoom_level < 0 { global.zoom_level = 0; }
                    var ee; 
                    if global.effects_level > 0 { ee =(global.effects_level-(global.zoom_level*(0.1*global.effects_level)))+0.05; }
                        else ee = 0;
                    var el = 0.1+(global.zoom_level*0.1);
                    audio_group_set_gain(Effects, ee, 200);
                    audio_group_set_gain(Soundscape, el, 200);
                }
            } 
            if mouse_wheel_down() || keyboard_check_pressed(global.DECREASE) { 
                if global.zoom_level != 10 {
                    global.zoom_level += 2;
                    if global.zoom_level > 10 { global.zoom_level = 10; }
                    var ee; 
                    if global.effects_level > 0 { ee =(global.effects_level-(global.zoom_level*(0.1*global.effects_level)))+0.05; }
                        else ee = 0;
                    var el = 0.1+(global.zoom_level*0.1);
                    audio_group_set_gain(Effects, ee, 200);
                    audio_group_set_gain(Soundscape, el, 200); 
                }
            }
        }
        //Set target width and height according to zoom level
        switch global.zoom_level {
            case 0:
                target_width  = 1920;
				global.target_ratio = 0.75;
                break;
            case 1:
                target_width  = 2138;
				global.target_ratio = 0.8;
                break;
            case 2:
                target_width  = 2355;
				global.target_ratio = 0.85;
                break;
            case 3:
                target_width  = 2573;
				global.target_ratio = 0.9;
                break;
            case 4:
                target_width  = 2790;
				global.target_ratio = 0.95;
                break;
            case 5:
                target_width  = 3008;
				global.target_ratio = 1;
                break;
            case 6:
                target_width  = 3226;
				global.target_ratio = 1.05;
                break;
            case 7:
                target_width  = 3443;
				global.target_ratio = 1.1;
                break;
            case 8:
                target_width  = 3661;
				global.target_ratio = 1.15;
                break
            case 9:
                target_width  = 3878;
				global.target_ratio = 1.2;
                break;
            case 10:
                target_width  = 4096;
				global.target_ratio = 1.25;
                break;
        }
        //Zoom the view to target
        if camera_get_view_width(my_camera) != target_width {
            var view_dif = (camera_get_view_width(my_camera)-target_width);
            start_view_x = camera_get_view_width(my_camera);
            start_view_y = camera_get_view_height(my_camera);
            if camera_get_view_width(my_camera) < target_width {
				camera_set_view_size(my_camera, camera_get_view_width(my_camera)-(view_dif*(global.zoom_speed*zspeed_adj)), camera_get_view_height(my_camera));
				camera_set_view_size(my_camera, camera_get_view_width(my_camera), camera_get_view_width(my_camera)/view_ratio);
                //Center the view
				camera_set_view_pos(my_camera, camera_get_view_x(my_camera)-(abs(camera_get_view_width(my_camera) -start_view_x)/2), 
				                               camera_get_view_y(my_camera)-(abs(camera_get_view_height(my_camera)-start_view_y)/2));
            }
                else if camera_get_view_width(my_camera) > target_width { 
					camera_set_view_size(my_camera, camera_get_view_width(my_camera)+(view_dif*-(global.zoom_speed*zspeed_adj)), camera_get_view_height(my_camera));
					camera_set_view_size(my_camera, camera_get_view_width(my_camera), camera_get_view_width(my_camera)/view_ratio);
                    //Center the view
					camera_set_view_pos(my_camera, camera_get_view_x(my_camera)+(abs(camera_get_view_width(my_camera) -start_view_x)/2), 
				                                   camera_get_view_y(my_camera)+(abs(camera_get_view_height(my_camera)-start_view_y)/2));
                }
			
            if moving == false { 
                with obj_Trees  { scr_InView(x, y, other.my_camera); }
                with obj_Houses { scr_InView(x, y, other.my_camera); }
            }
			cam_x = camera_get_view_x(my_camera);
			cam_y = camera_get_view_y(my_camera);
			cam_w = camera_get_view_width(my_camera);
			cam_h = camera_get_view_height(my_camera);
        }
        //Keeps the view inside the room
        camera_set_view_pos(my_camera, clamp(camera_get_view_x(my_camera), 128, room_width -(camera_get_view_width(my_camera) +128)),
									   clamp(camera_get_view_y(my_camera), 128, room_height-(camera_get_view_height(my_camera)+128)));
									   
		if global.menu_ratio != global.target_ratio {
			var menu_diff = abs(global.menu_ratio-global.target_ratio);
			if global.menu_ratio < global.target_ratio { global.menu_ratio += menu_diff*0.1; }
				else if global.menu_ratio > global.target_ratio { global.menu_ratio -= menu_diff*0.1; }
		}
    }
    
    if mouse_check_button_pressed(global.MMOUSE) {
        drag_x = mouse_x;
        drag_y = mouse_y;
    }
    
    //Move the viewport
    if global.can_pan == true {
        if (dragging == true) {
			camera_set_view_pos(my_camera, drag_x-(mouse_x-camera_get_view_x(my_camera)), drag_y-(mouse_y-camera_get_view_y(my_camera)));
            //Keeps the view inside the room
            camera_set_view_pos(my_camera, clamp(camera_get_view_x(my_camera), 128, room_width -(camera_get_view_width(my_camera) +128)),
									       clamp(camera_get_view_y(my_camera), 128, room_height-(camera_get_view_height(my_camera)+128)));
            moving = true;
        }
            else {
                if global.edge_pan == true {
                    if (device_mouse_x_to_gui(0) < move_border)                           { edge_pan_l = true; } else { edge_pan_l = false; } 
                    if (device_mouse_x_to_gui(0) > view_get_wport(my_view) - move_border) { edge_pan_r = true; } else { edge_pan_r = false; }
                    if (device_mouse_y_to_gui(0) < move_border)                           { edge_pan_u = true; } else { edge_pan_u = false; }
                    if (device_mouse_y_to_gui(0) > view_get_hport(my_view) - move_border) { edge_pan_d = true; } else { edge_pan_d = false; } 
                }
                    else {
                        edge_pan_l = false;
                        edge_pan_r = false;
                        edge_pan_u = false;
                        edge_pan_d = false;
                    }
                if player == "ONE" {  
	                if edge_pan_l == true || keyboard_check(global.LEFT)  { cam_move_l = true; camera_set_view_pos(my_camera, camera_get_view_x(my_camera)-(pan_speed_l), camera_get_view_y(my_camera));               } else { cam_move_l = false; }
	                if edge_pan_r == true || keyboard_check(global.RIGHT) { cam_move_r = true; camera_set_view_pos(my_camera, camera_get_view_x(my_camera)+(pan_speed_r), camera_get_view_y(my_camera));               } else { cam_move_r = false; }
	                if edge_pan_u == true || keyboard_check(global.UP)    { cam_move_u = true; camera_set_view_pos(my_camera, camera_get_view_x(my_camera)              , camera_get_view_y(my_camera)-(pan_speed_u)); } else { cam_move_u = false; }
	                if edge_pan_d == true || keyboard_check(global.DOWN)  { cam_move_d = true; camera_set_view_pos(my_camera, camera_get_view_x(my_camera)              , camera_get_view_y(my_camera)+(pan_speed_d)); } else { cam_move_d = false; }
				}
					else if player == "TWO" {  
		                if edge_pan_l == true || keyboard_check(global.LEFT)  { cam_move_r = true; camera_set_view_pos(my_camera, camera_get_view_x(my_camera)+(pan_speed_r), camera_get_view_y(my_camera));               } else { cam_move_r = false; }
		                if edge_pan_r == true || keyboard_check(global.RIGHT) { cam_move_l = true; camera_set_view_pos(my_camera, camera_get_view_x(my_camera)-(pan_speed_l), camera_get_view_y(my_camera));               } else { cam_move_l = false; }
		                if edge_pan_u == true || keyboard_check(global.UP)    { cam_move_d = true; camera_set_view_pos(my_camera, camera_get_view_x(my_camera)              , camera_get_view_y(my_camera)+(pan_speed_d)); } else { cam_move_d = false; }
		                if edge_pan_d == true || keyboard_check(global.DOWN)  { cam_move_u = true; camera_set_view_pos(my_camera, camera_get_view_x(my_camera)              , camera_get_view_y(my_camera)-(pan_speed_u)); } else { cam_move_u = false; }
					}

                //Camera easing
                var speed_adj = -10+global.zoom_level;
                //LEFT
                if (cam_move_l == true) { 
                    pan_speed_l = ease_out_quint(time_l, 0, global.pan_speed+speed_adj, pan_duration);
                    if time_l < pan_duration { time_l ++; }
                } 
                    else { 
                        if pan_speed_l != 0 { 
                            stop_speed_l = pan_speed_l; 
                            stop_ref_l   = pan_speed_l;
                            time_ls = 0;
                        }
                        if time_ls < stop_duration {
                            stop_speed_l = ease_out_quint(time_ls, stop_ref_l, 0, stop_duration);
                            time_ls ++; 
							camera_set_view_pos(my_camera, camera_get_view_x(my_camera)-(stop_speed_l), camera_get_view_y(my_camera));
                        }
                        pan_speed_l = 0;
                        time_l = 0;
                    }
                //RIGHT
                if (cam_move_r == true) { 
                    pan_speed_r = ease_out_quint(time_r, 0, global.pan_speed+speed_adj, pan_duration); 
                    if time_r < pan_duration { time_r ++; }
                } 
                    else {
                        if pan_speed_r != 0 { 
                            stop_speed_r = pan_speed_r; 
                            stop_ref_r   = pan_speed_r;
                            time_rs = 0;
                        }
                        if time_rs < stop_duration {
                            stop_speed_r = ease_out_quint(time_rs, stop_ref_r, 0, stop_duration);
                            time_rs ++; 
							camera_set_view_pos(my_camera, camera_get_view_x(my_camera)+(stop_speed_r), camera_get_view_y(my_camera));
                        }
                        pan_speed_r = 0;
                        time_r = 0;
                    }
                //UP
                if (cam_move_u == true) { 
                    pan_speed_u = ease_out_quint(time_u, 0, global.pan_speed+speed_adj, pan_duration); 
                    if time_u < pan_duration { time_u ++; }
                } 
                    else {
                        if pan_speed_u != 0 { 
                            stop_speed_u = pan_speed_u; 
                            stop_ref_u   = pan_speed_u;
                            time_us = 0;
                        }
                        if time_us < stop_duration {
                            stop_speed_u = ease_out_quint(time_us, stop_ref_u, 0, stop_duration);
                            time_us ++; 
							camera_set_view_pos(my_camera, camera_get_view_x(my_camera), camera_get_view_y(my_camera)-(stop_speed_u));
                        }
                        pan_speed_u = 0;
                        time_u = 0;
                    }
                //DOWN
                if (cam_move_d == true) { 
                    pan_speed_d = ease_out_quint(time_d, 0, global.pan_speed+speed_adj, pan_duration);
                    if time_d < pan_duration { time_d ++; }
                } 
                    else {
                        if pan_speed_d != 0 { 
                            stop_speed_d = pan_speed_d; 
                            stop_ref_d   = pan_speed_d;
                            time_ds = 0;
                        }
                        if time_ds < stop_duration {
                            stop_speed_d = ease_out_quint(time_ds, stop_ref_d, 0, stop_duration);
                            time_ds ++; 
							camera_set_view_pos(my_camera, camera_get_view_x(my_camera), camera_get_view_y(my_camera)+(stop_speed_d));
                        }
                        pan_speed_d = 0;
                        time_d = 0;
                    }
                
                if (cam_move_l == true) || (cam_move_r == true) || (cam_move_u == true) || (cam_move_d == true) { moving = true; }  
                    else { if dragging == false { moving = false; } }
            }
    }
        else { moving = false; }
	/*
	if ds_list_empty(global.selected_list) {
		if keyboard_check_pressed(ord("E")) {
			var cang = camera_get_view_angle(my_camera)+10;
			camera_set_view_angle(my_camera, cang);
		}
			else if keyboard_check_pressed(ord("Q")) {
				var cang = camera_get_view_angle(my_camera)-10;
				camera_set_view_angle(my_camera, cang);
			}
	}
	*/
}

//Keeps the view inside the room
camera_set_view_pos(my_camera, clamp(camera_get_view_x(my_camera), 128, room_width -(camera_get_view_width(my_camera) +128)),
							   clamp(camera_get_view_y(my_camera), 128, room_height-(camera_get_view_height(my_camera)+128)));

//Center the camera object
x = camera_get_view_x(my_camera) + (camera_get_view_width(my_camera) *0.5);
y = camera_get_view_y(my_camera) + (camera_get_view_height(my_camera)*0.5);

audio_listener_position(x, y, 0);

//Deactivate objects outside of view
if moving == true { 
    with obj_Houses { scr_InView(x, y, other.my_camera); }
    with obj_Trees  { scr_InView(x, y, other.my_camera); }
}







    







