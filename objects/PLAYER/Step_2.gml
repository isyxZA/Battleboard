if global.game_state != "RESTART" {
	if keyboard_check_pressed(vk_escape) {
	    ///Pause
	    if (room == rm_TEST) || (room == rm_Forest) || (room == rm_Pause) {
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
}

if global.game_state == "IN_GAME" {
    if keyboard_check_pressed(ord("V")) {
        if global.vis_mask == false { global.vis_mask = true; }
            else if global.vis_mask == true { global.vis_mask = false; }
    }
    if keyboard_check_pressed(ord("H")) {
        if global.display_info == false { global.display_info = true; }
            else if global.display_info == true { global.display_info = false; }
    }
	if keyboard_check_pressed(ord("G")) {
        if global.grid_display == false { global.grid_display = true; }
            else if global.grid_display == true { global.grid_display = false; }
    }
}



