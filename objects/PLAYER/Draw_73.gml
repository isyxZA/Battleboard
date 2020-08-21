//Room change transition
if t_a > 0 {
	draw_set_alpha(t_a);
	if room != rm_TEST { draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false); }
		else {
			var cam = obj_CAMERA.my_camera;
			draw_rectangle_colour(camera_get_view_x(cam), camera_get_view_y(cam), 
								  camera_get_view_x(cam)+camera_get_view_width(cam), camera_get_view_y(cam)+camera_get_view_height(cam), 
								  c_black, c_black, c_black, c_black, false);
		}
	draw_set_alpha(1);
}

if room == rm_TEST {
	
	if global.debug == true {
		//draw_set_alpha(0.2);
		//mp_grid_draw(global.move_grid);
		//draw_set_alpha(1);
		with obj_Unit_Parent  { 
			draw_set_color(c_green);
			draw_text_transformed(x, y, id, 1, 1, txt_rot);
			draw_set_color(c_black);
		}
		with obj_Enemy_Parent { 
			draw_set_color(c_green);
			draw_text_transformed(x, y, net_id, 1, 1, txt_rot);
			draw_set_color(c_black);
		}
	}
}





