if PLAYER.net_status != "CLIENT" and global.locked == false  { 
	if place_meeting(x,y, obj_MOUSE) {
	    if mouse_check_button_pressed(mb_left) {
	        if is_checked == false { 
				audio_play_sound(snd_Checkbox, 1, false);
	            global.turn_timer = 30;
				if PLAYER.net_status == "HOST" { 
					var cc = ds_list_size(global.clients);
					if cc > 0 { 
						var i;
						for (i=0;i<cc;i++) {
							var csocket = ds_list_find_value(global.clients, i);
							net_write_client(csocket, 
								buffer_u8, NET_TIMER,
								buffer_u8, global.turn_timer
							);
						}
					}
				}
	            anim_count = 0;
	        }
	    }
	}
}

if global.turn_timer == 30 { is_checked = true; }
    else { is_checked = false; }
    
if is_checked == true { 
    if anim_count < anim_timer { 
        scl = ease_out_quad(anim_count, 0.2, 0.8, anim_timer);
        anim_count ++; 
    }
}

