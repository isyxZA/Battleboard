if global.transition = true { global.transition = false; }

switch room {
	case rm_MainMenu:
	case rm_Pause:
	case rm_Credits:
		global.can_choose = true;//Activate menu buttons
		global.game_state = "IN_MENU"; 
		break;
	case rm_Options:
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

