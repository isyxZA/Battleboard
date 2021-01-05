if net_status == "NONE" && global.game_state != "RESTART" {
	if keyboard_check_pressed(global.ESCAPE) {
		//As single player go to pause room
		///Pause
		if (room == rm_ALPHA) || (room == rm_BRAVO) || (room == rm_Pause) {
			if global.pause == false {
			    global.pause = true;
			    global.current_room = room;
			    obj_SOUND.fade_out = true;
			    obj_SOUND.fade_in = false;
			    audio_pause_all();
			    with obj_SOUND { if s != -1 { audio_resume_sound(s); } }
			    room_goto(rm_Pause);
			}
			    else if global.pause == true {
			        global.pause = false;
			        obj_SOUND.fade_in = true;
			        obj_SOUND.fade_out = false;
			        audio_resume_all();
			        room_goto(global.current_room);
			    }
		}
	}
	if keyboard_check_pressed(global.SCREEN) {
		if global.keybind == false {
			if can_switch == true {
				can_switch = false;
				alarm[0] = 60;
				if fullscreen == false {
					fullscreen = true;
					window_set_fullscreen(true);
				}
					else {
						fullscreen = false;
						window_set_fullscreen(false);
						window_set_size(1280, 720);
					}
			}
		}
	}
}

if global.game_state == "IN_GAME" {
    if keyboard_check_pressed(global.VISIBILITY) {
        if global.vis_mask == false { global.vis_mask = true; }
            else if global.vis_mask == true { global.vis_mask = false; }
    }
    if keyboard_check_pressed(global.HINTS) {
        if global.display_info == false { global.display_info = true; }
            else if global.display_info == true { global.display_info = false; }
    }
	if keyboard_check_pressed(global.GRID) {
        if global.grid_display == false { global.grid_display = true; }
            else if global.grid_display == true { global.grid_display = false; }
    }
}



