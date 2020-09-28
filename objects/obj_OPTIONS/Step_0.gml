if can_create == true {
	can_create = false;
	//Spawn options/settings objects
	var camw = camera_get_view_width(cam);
	//var camh = camera_get_view_height(cam);
	with instance_create_layer(x+(camw*0.5)-256, y+1032, "Pause", obj_MENUBUTTON) { txt = "Surrender"; }
	with instance_create_layer(x+(camw*0.5)    , y+1032, "Pause", obj_MENUBUTTON) { txt = "Continue"; }
	with instance_create_layer(x+(camw*0.5)+256, y+1032, "Pause", obj_MENUBUTTON) { txt = "Quit"; }
	
	instance_create_layer(x+(camw*0.5), y+240, "Options", obj_Music_Bar);
	instance_create_layer(x+(camw*0.5), y+368, "Options", obj_Effects_Bar);
	instance_create_layer(x+(camw*0.5), y+496, "Options", obj_Pan_Bar);
	instance_create_layer(x+(camw*0.5), y+624, "Options", obj_Zoom_Bar);
	instance_create_layer(x+(camw*0.5), y+752, "Options", obj_Scale_Bar);

	instance_create_layer(x+784 , y+896, "Options", obj_Checkbox_PanON );
	instance_create_layer(x+880 , y+896, "Options", obj_Checkbox_PanOFF);
	instance_create_layer(x+1040, y+896, "Options", obj_Checkbox_VsyncON );
	instance_create_layer(x+1136, y+896, "Options", obj_Checkbox_VsyncOFF);
	
	with instance_create_layer(x+288, y+144, "Options", obj_Menu_Box ) { txt = "W"; }
	with instance_create_layer(x+240, y+192, "Options", obj_Menu_Box ) { txt = "A"; }
	with instance_create_layer(x+288, y+240, "Options", obj_Menu_Box ) { txt = "S"; }
	with instance_create_layer(x+336, y+192, "Options", obj_Menu_Box ) { txt = "D"; }
	
	with instance_create_layer(x+160, y+336, "Options", obj_Menu_Box ) { txt = "Q"; }
	with instance_create_layer(x+160, y+400, "Options", obj_Menu_Box ) { txt = "E"; }
	with instance_create_layer(x+160, y+464, "Options", obj_Menu_Box ) { txt = "X"; }
	with instance_create_layer(x+160, y+528, "Options", obj_Menu_Box ) { txt = "Z"; }
	with instance_create_layer(x+160, y+592, "Options", obj_Menu_Box ) { txt = "C"; }
	
	with instance_create_layer(x+288, y+656, "Options", obj_Menu_Box ) { txt = "Right Mouse"; }
	with instance_create_layer(x+288, y+768, "Options", obj_Menu_Box ) { txt = "Left Mouse"; }
	with instance_create_layer(x+288, y+880, "Options", obj_Menu_Box ) { txt = "Middle Mouse"; }
	with instance_create_layer(x+288, y+944, "Options", obj_Menu_Box ) { txt = "Scroll Wheel"; }
	
	with instance_create_layer(x+1488, y+160, "Options", obj_Menu_Box ) { txt = "T"; }
	with instance_create_layer(x+1488, y+240, "Options", obj_Menu_Box ) { txt = "R"; }
	with instance_create_layer(x+1488, y+320, "Options", obj_Menu_Box ) { txt = "F"; }
	with instance_create_layer(x+1488, y+400, "Options", obj_Menu_Box ) { txt = "V"; }
	with instance_create_layer(x+1488, y+480, "Options", obj_Menu_Box ) { txt = "H"; }
	with instance_create_layer(x+1488, y+560, "Options", obj_Menu_Box ) { txt = "G"; }
	with instance_create_layer(x+1488, y+640, "Options", obj_Menu_Box ) { txt = "Tab"; }
	with instance_create_layer(x+1488, y+720, "Options", obj_Menu_Box ) { txt = "Esc"; }
	with instance_create_layer(x+1488, y+800, "Options", obj_Menu_Box ) { txt = "O"; }
	with instance_create_layer(x+1488, y+880, "Options", obj_Menu_Box ) { txt = "P"; }
	with instance_create_layer(x+1488, y+960, "Options", obj_Menu_Box ) { txt = "Spacebar"; }
	
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
