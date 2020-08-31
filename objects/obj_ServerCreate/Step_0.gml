if obj_MENUBUTTON.start_game == false {
	//Take text input
	scr_input_box_restrict("!","[");
	scr_input_box_input(0,true,true);
}

if global.server_IP != "" && global.server_name != "" { global.can_choose = true; }
	else { global.can_choose = false; }
