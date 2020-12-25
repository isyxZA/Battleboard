if PLAYER.net_status == "NONE" {
	if place_meeting(x,y, obj_MOUSE) {
	    if mouse_check_button_pressed(mb_left) {
	        if is_checked == false { 
				audio_play_sound(snd_Checkbox, 1, false);
	            PLAYER.opponent_faction = "RU";
	            anim_count = 0;
	        }
	    }
	}
}

if PLAYER.opponent_faction = "RU" { is_checked = true; }
    else { is_checked = false; }

if is_checked == true { 
    if anim_count < anim_timer { 
        scl = ease_out_quad(anim_count, 0.2, 0.8, anim_timer);
        anim_count ++; 
    }
}

