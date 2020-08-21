function scr_TargetUAV() {
	//Rotate targeting
	if keyboard_check_pressed(ord("Z")) {
	    target_rot += 1;
	    if target_rot > 3 { target_rot = 0; }
	}
	    else if keyboard_check_pressed(ord("C")) {
	        target_rot -= 1;
	        if target_rot < 0 { target_rot = 3; }
	    }

	if target_rot == 0 {
	    // ------ //
		if p_one == true {
		    uav_x1 = target_x-room_width*0.6;
		    uav_y1 = target_y;
		    uav_x2 = target_x+room_width*0.6;
		    uav_y2 = target_y;
		}
			else {
				uav_x1 = target_x+room_width*0.6;
			    uav_y1 = target_y;
			    uav_x2 = target_x-room_width*0.6;
			    uav_y2 = target_y;
			}
	}
	    else if target_rot == 1 {
	        // ////// //
			if p_one == true {
		        uav_x1 = target_x-room_width*0.6;
		        uav_y1 = target_y+room_height*0.6;
		        uav_x2 = target_x+room_width*0.6;
		        uav_y2 = target_y-room_height*0.6;
			}
				else {
					uav_x1 = target_x+room_width*0.6;
			        uav_y1 = target_y-room_height*0.6;
			        uav_x2 = target_x-room_width*0.6;
			        uav_y2 = target_y+room_height*0.6;
				}
	    }
	        else if target_rot == 2 {
	            // ||||||| //
				if p_one == true {
		            uav_x1 = target_x;
		            uav_y1 = target_y+room_height*0.6;
		            uav_x2 = target_x;
		            uav_y2 = target_y-room_height*0.6;
				}
					else {
						uav_x1 = target_x;
			            uav_y1 = target_y-room_height*0.6;
			            uav_x2 = target_x;
			            uav_y2 = target_y+room_height*0.6;
					}
	        }
	            else if target_rot == 3 {
	                // \\\\\\\ //
					if p_one == true {
		                uav_x1 = target_x+room_width*0.6;
		                uav_y1 = target_y+room_height*0.6;
		                uav_x2 = target_x-room_height*0.6;
		                uav_y2 = target_y-room_height*0.6;
					}
						else {
							uav_x1 = target_x-room_width*0.6;
			                uav_y1 = target_y-room_height*0.6;
			                uav_x2 = target_x+room_height*0.6;
			                uav_y2 = target_y+room_height*0.6;
						}
	            }



}
