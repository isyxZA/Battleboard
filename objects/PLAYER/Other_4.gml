if global.transition = true { global.transition = false; }

switch room {
	case rm_MainMenu:
	case rm_Pause:
	case rm_Credits:
		global.can_choose = true;//Activate menu buttons
		global.game_state = "IN_MENU"; 
		break;
	case rm_Options:
		if music_pos   != 0 { obj_Music_Slider.x = music_pos; }
		if effects_pos != 0 { obj_Effects_Slider.x = effects_pos; }
		if zoom_pos    != 0 { obj_Zoom_Slider.x = zoom_pos; }
		if pan_pos     != 0 { obj_Pan_Slider.x = pan_pos; }
		if scale_pos   != 0 { obj_Scale_Slider.x = scale_pos; }
		global.can_choose = true;//Activate menu buttons
		global.game_state = "IN_MENU"; 
		break;
	case rm_Join:
		global.can_choose = false;//Activate menu buttons
		global.game_state = "IN_MENU";
		instance_create_layer(0,0,"Control",obj_ServerJoin);
		break;
	case rm_Host:
		//global.can_choose = true;//Activate menu buttons
		global.game_state = "IN_MENU";
		instance_create_layer(0,0,"Control",obj_ServerCreate);
		break;
	case rm_Setup:
		global.game_state = "IN_MENU"; 
		if net_status == "HOST" { instance_create_layer(0,0,"Control",obj_SERVER); }
			else if net_status == "CLIENT" { instance_create_layer(0,0,"Control",obj_CLIENT); }
				else if net_status == "NONE" { }
		break;
	case rm_TEST:
	case rm_Forest:
		if global.restart_game == true { 
			global.game_state = "RESTART";  
			global.can_select = false;
		}
			else { global.game_state = "IN_GAME"; }
		break;
}

