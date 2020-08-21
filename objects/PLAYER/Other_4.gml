if global.transition = true { global.transition = false; }

if room == rm_MainMenu || room == rm_Pause || room == rm_Options || room == rm_Credits { 
    global.can_choose = true;//Activate menu buttons
    global.game_state = "IN_MENU"; 
}
	else if room == rm_Join { 
		global.can_choose = true;//Activate menu buttons
		global.game_state = "IN_MENU";
		instance_create_layer(0,0,"Control",obj_ServerJoin);
	}
	    else if room == rm_Setup { 
	        global.game_state = "IN_MENU"; 
			if net_status == "HOST" { instance_create_layer(0,0,"Control",obj_SERVER); }
				else if net_status == "CLIENT" { instance_create_layer(0,0,"Control",obj_CLIENT); }
					else if net_status == "NONE" { }
	    }
	        else if room == rm_TEST { 
				if global.restart_game == true { 
					global.game_state = "RESTART";  
					global.can_select = false;
				}
					else { global.game_state = "IN_GAME"; }
			}

