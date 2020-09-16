if can_create == true {
	can_create = false;
	//Spawn options/settings objects
	var camw = camera_get_view_width(cam);
	//var camh = camera_get_view_height(cam);
	with instance_create_layer(x+(camw*0.5)-256, y+1032, "Pause", obj_MENUBUTTON) { txt = "Surrender"; }
	with instance_create_layer(x+(camw*0.5)    , y+1032, "Pause", obj_MENUBUTTON) { txt = "Continue"; }
	with instance_create_layer(x+(camw*0.5)+256, y+1032, "Pause", obj_MENUBUTTON) { txt = "Quit"; }
	
	b1 = instance_create_layer(x+(camw*0.5), y+240, "Options", obj_Music_Bar);
	b2 = instance_create_layer(x+(camw*0.5), y+368, "Options", obj_Effects_Bar);
	b3 = instance_create_layer(x+(camw*0.5), y+496, "Options", obj_Pan_Bar);
	b4 = instance_create_layer(x+(camw*0.5), y+624, "Options", obj_Zoom_Bar);
	b5 = instance_create_layer(x+(camw*0.5), y+752, "Options", obj_Scale_Bar);

	b6 = instance_create_layer(x+784 , y+896, "Options", obj_Checkbox_PanON );
	b7 = instance_create_layer(x+880 , y+896, "Options", obj_Checkbox_PanOFF);
	b8 = instance_create_layer(x+1040, y+896, "Options", obj_Checkbox_VsyncON );
	b9 = instance_create_layer(x+1136, y+896, "Options", obj_Checkbox_VsyncOFF);
}

if at_width == false {
	x = camera_get_view_x(cam);
	y = camera_get_view_y(cam);
	if floor(camera_get_view_width(cam)) == 1920 { 
		at_width = true;
		can_create = true;
	}
}

if (a < 0.5) { a = lerp(a, 1, 0.005); } 
