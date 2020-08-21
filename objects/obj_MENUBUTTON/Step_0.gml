if global.game_state == "IN_MENU" {
    if global.can_choose == true {
        if place_meeting(x, y, obj_MOUSE) {
			if txt == "Host Game" || txt == "Join Game" {
					c1 = c_red;
			}
				else { c1 = c_white; }
            if mouse_check_button_pressed(mb_left) {
                switch txt {
                    case "Campaign":
						PLAYER.net_status = "NONE";
						PLAYER.player = "ONE";
						PLAYER.faction = "US";
						PLAYER.opponent_faction = "RU";
                        global.transition = true;
                        global.can_choose = false;
                        obj_SOUND.fade_out = true;
                        obj_SOUND.fade_in = false;
						start_game = true;
                        alarm[0] = 60;
                        break;
					case "Host Game":
						PLAYER.net_status = "HOST";
                        PLAYER.player = "ONE";
						PLAYER.faction = "US";
						//PLAYER.opponent_faction = "RU";
                        global.transition = true;
                        global.can_choose = false;
                        obj_SOUND.fade_out = true;
                        obj_SOUND.fade_in = false;
						start_game = true;
                        alarm[0] = 60;
                        break;
					case "Join Game":
						PLAYER.net_status = "CLIENT";
                        global.transition = true;
                        global.can_choose = false;
                        global.temp_room = rm_MainMenu; 
                        obj_SOUND.fade_out = true;
                        obj_SOUND.fade_in = false;
						start_game = true;
                        alarm[5] = 60;
                        break;
					case "Join Server":
						//If a valid server is selected then join the server and go to setup 
						//PLAYER.net_status = "CLIENT";
                        //global.transition = true;
                        //global.can_choose = false;
                        //obj_SOUND.fade_out = true;
                        //obj_SOUND.fade_in = false;
						//start_game = true;
                        //alarm[0] = 60;
                        break;
					case "Refresh":
						if instance_exists(obj_ServerJoin) {
							with obj_ServerJoin {
								ds_list_clear(server_list);
								ds_list_clear(server_ports);
								ds_list_clear(server_names);
							}
						}
                        break;
                    case "Main Menu":
                        global.transition = true;
                        global.can_choose = false;
						global.restart_game = true;
						start_main = true;
                        alarm[1] = 80;
                        break;
                    case "Resume":
                        global.can_choose = false;
                        // return to previous room / continue
                        if (global.pause == true) {
                            global.pause = false;
                            room_goto(global.current_room);
                            obj_SOUND.fade_in = true;
                            obj_SOUND.fade_out = false;
                            audio_resume_all();
                        }
                        break;
                    case "Options":
                        global.transition = true;
                        global.can_choose = false;
                        if room == rm_MainMenu { 
                            global.temp_room = rm_MainMenu; 
                            obj_SOUND.fade_out = true;
                            obj_SOUND.fade_in = false;
                        }
                            else if room == rm_Pause { global.temp_room = rm_Pause; }
						start_options = true;
                        alarm[2] = 60;
                        break;
                    case "Ready":
						if PLAYER.net_status == "NONE" {
	                        global.transition = true;
	                        global.can_choose = false;
							start_ready = true;
	                        alarm[3] = 80;
						}
							else if PLAYER.net_status == "HOST" {
								if global.green_light == true {
				                    global.transition = true;
				                    global.can_choose = false;
									global.locked = true;
									start_ready = true;
				                    alarm[3] = 80;
									//Send game start signal to client
									var cc = ds_list_size(global.clients);
									if cc > 0 { 
										var i;
										for (i=0;i<cc;i++) {
											var csocket = ds_list_find_value(global.clients, i);
											net_write_client(csocket, 
												buffer_u8, NET_STARTGAME
											);
										}
									}
								}
									else {
										global.locked = true;
									}
							}
								else if PLAYER.net_status == "CLIENT" {
									if global.green_light == false {
										global.green_light = true;
										//Send green light signal to host
										net_write_server(
											buffer_u8, NET_GREENLIGHT,
											buffer_bool, global.green_light
										);
										global.can_choose = false;
										global.locked = true;
										start_ready = true;
									}
								}
                        break;
                    case "Back":
		                global.can_choose = false;
		                if global.temp_room == rm_MainMenu {
		                    obj_SOUND.fade_in = true;
		                    obj_SOUND.fade_out = false;
		                }
		                room_goto(global.temp_room);
                        break;
                    case "Credits":
                        global.transition = true;
                        global.can_choose = false;
                        global.temp_room = rm_MainMenu;
                        obj_SOUND.fade_out = true;
                        obj_SOUND.fade_in = false;
						start_credits = true;
                        alarm[4] = 60;
                        break;
                    case "Quit":
                        global.transition = true;
                        global.can_choose = false;
                        // quit
                        audio_stop_all();
                        game_end();
                        break;
                }
            }
        }
            else { 
                c1 = c_gray;
            }
    }
        else {
			if global.transition == true {
				if txt == "Ready"	   && start_ready   == true	    { c1 = make_color_rgb(255,170,0); }
				if txt == "Campaign"   && start_game    == true		{ c1 = make_color_rgb(255,170,0); }
				if txt == "Host Game"  && start_game    == true		{ c1 = make_color_rgb(255,170,0); }
				if txt == "Join Game"  && start_game    == true		{ c1 = make_color_rgb(255,170,0); }
				if txt == "Options"    && start_options == true	    { c1 = make_color_rgb(255,170,0); }
				if txt == "Credits"    && start_credits == true	    { c1 = make_color_rgb(255,170,0); }
				if txt == "Main Menu"  && start_main    == true		{ c1 = make_color_rgb(255,170,0); }
			}
				else { if txt == "Ready" { c1 = make_colour_rgb(153,25,0); } }
        }
}


