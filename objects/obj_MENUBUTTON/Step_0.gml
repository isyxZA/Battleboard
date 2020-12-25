if global.can_choose == true {
    if place_meeting(x, y, obj_MOUSE) {
		if play_touch == true { 
			play_touch = false; 
			audio_play_sound(snd_Checkbox, 1, false);
		}
		//if txt == "Host Game" || txt == "Join Game" { c1 = c_red; }
			//else { c1 = make_colour_rgb(240,248,255); }
		c1 = make_colour_rgb(240,248,255);
		highlight = true;
        if mouse_check_button_pressed(mb_left) {
			audio_play_sound(snd_Accept, 1, false);
            switch txt {
                case "Campaign"://From Main Menu, Single player..goes to room Setup
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
				case "Host Game"://From Main Menu, Multiplayer...goes to room Host
					PLAYER.net_status = "HOST";
                    PLAYER.player = "ONE";
					PLAYER.faction = "US";
					PLAYER.opponent_faction = "";
                    global.transition = true;
                    global.can_choose = false;
                    obj_SOUND.fade_out = true;
                    obj_SOUND.fade_in = false;
					start_game = true;
                    alarm[6] = 60;
                    break;
				case "Create Game"://From room Host...go to Setup
					//Create server
					if (global.server_IP != "") && (global.server_name != "") && (global.server < 0) {
						global.server = network_create_server(network_socket_tcp,global.server_port,2);
					}
					if global.server >= 0 {
						PLAYER.net_status = "HOST";
	                    PLAYER.player = "ONE";
						PLAYER.faction = "US";
						PLAYER.opponent_faction = "";
	                    global.transition = true;
	                    global.can_choose = false;
	                    obj_SOUND.fade_out = true;
	                    obj_SOUND.fade_in = false;
						start_game = true;
	                    alarm[0] = 60;
					}
                    break;
				case "Join Game"://From Main Menu, Multiplayer...go to room Join
					PLAYER.net_status = "CLIENT";
                    global.transition = true;
                    global.can_choose = false;
                    global.temp_room = rm_MainMenu; 
                    obj_SOUND.fade_out = true;
                    obj_SOUND.fade_in = false;
					start_game = true;
                    alarm[5] = 60;
                    break;
				case "Join Server"://From room Join...Join a valid server and go to Setup
					if (global.server_IP != undefined) && (global.server_port != undefined) && (global.server_name != undefined) && (global.server_name != "") {
						//Sets the types of connection socket.
						global.clientSocket = network_create_socket(network_socket_tcp);
						//Checks whether the client is currently connected.
						global.clientConnected = network_connect(global.clientSocket,global.server_IP,global.server_port);
					}
					if global.clientConnected >= 0 {
						instance_create_layer(0,0,"Control",obj_CLIENT);
						obj_ServerJoin.can_choose = false;
						network_destroy(global.broadcast_server);
						global.broadcast_server = -1;
						global.transition = true;
						global.can_choose = false;
						obj_SOUND.fade_out = true;
						obj_SOUND.fade_in = false;
						start_game = true;
						alarm[0] = 60;
					}
                    break;
				case "Refresh"://In room Join...refresh server list
					if instance_exists(obj_ServerJoin) {
						with obj_ServerJoin {
							ds_list_clear(server_list);
							ds_list_clear(server_ports);
							ds_list_clear(server_names);
							global.server_IP   = undefined;
							global.server_port = undefined;
							global.server_name = undefined;
						}
					}
                    break;
                case "Main Menu"://From Pause room...jump back to previous room to shut off particles etc...then back to Main
                    global.transition = true;
                    global.can_choose = false;
					global.restart_game = true;
					start_main = true;
                    alarm[1] = 80;
                    break;
                case "Resume"://From Pause room..back to previous room
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
                case "Options"://From either Main or Pause rooms...Go to Options room
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
                case "Ready"://From room Setup...ensure all setting are locked in...go to scenario room
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
                case "Back"://Return to previous room
		            global.can_choose = false;
					if room == rm_Options { scr_SaveSettings(); }
		            if global.temp_room == rm_MainMenu {
		                obj_SOUND.fade_in = true;
		                obj_SOUND.fade_out = false;
		            }
		            room_goto(global.temp_room);
                    break;
				case "Continue":
					obj_CONTROL.show_options = false;
					scr_SaveSettings();
					with obj_OPTIONS { instance_destroy(); }
					global.zoom_level = obj_CONTROL.temp_zlevel;
					global.can_zoom = true;
					global.can_pan = true;
					if global.set_ui == true {
						global.set_ui = false;
						obj_CONTROL.ui_ratio = global.ui_scale;
						obj_CONTROL.s_dist   = 36*global.ui_scale;
						clamp(obj_CONTROL.s_dist, 24, 36);
						obj_CONTROL.ui_tx = (obj_CONTROL.mid_x - (obj_CONTROL.ui_width*global.ui_scale)*0.5);
						obj_CONTROL.ui_bx = obj_CONTROL.ui_tx;
						obj_CONTROL.ui_by = display_get_gui_height()-(obj_CONTROL.ui_height*global.ui_scale);
					}
					if global.game_turn != 0 {
						obj_CONTROL.ui_anim  = true;
						obj_CONTROL.y_target = 0;
					}
					instance_destroy();
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
				case "Surrender":
					global.transition = true;
                    global.can_choose = false;
					game_restart();
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
			highlight = false;
			play_touch = true;
			if txt == "Ready" || txt == "Create Game" || txt == "Join Server" { c1 = c_green; }
				else { c1 = c_silver; }
        }
}
    else {
		//Switch text colour when button is selected
		if global.transition == true {
			if txt == "Ready"	    && start_ready   == true { c1 = make_color_rgb(255,170,0); }
			if txt == "Campaign"    && start_game    == true { c1 = make_color_rgb(255,170,0); }
			if txt == "Host Game"   && start_game    == true { c1 = make_color_rgb(255,170,0); }
			if txt == "Join Game"   && start_game    == true { c1 = make_color_rgb(255,170,0); }
			if txt == "Join Server" && start_game    == true { c1 = make_color_rgb(255,170,0); }
			if txt == "Options"     && start_options == true { c1 = make_color_rgb(255,170,0); }
			if txt == "Credits"     && start_credits == true { c1 = make_color_rgb(255,170,0); }
			if txt == "Main Menu"   && start_main    == true { c1 = make_color_rgb(255,170,0); }
		}
			else {
				//Red until all conditions are met
				if txt == "Ready"         { c1 = make_colour_rgb(153,25,0); } 
				if txt == "Create Game"   { c1 = make_colour_rgb(153,25,0); }
				if txt == "Join Server"   { c1 = make_colour_rgb(153,25,0); }
			}
    }


