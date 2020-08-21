function scr_TargetBombs() {
	//Rotate targeting
	if keyboard_check_pressed(ord("Z")) {
	    target_rot += 1;
	    if target_rot > 3 { target_rot = 0; }
	}
	    else if keyboard_check_pressed(ord("C")) {
	        target_rot -= 1;
	        if target_rot < 0 { target_rot = 3; }
	    }
    
	//Store bomb positions
	bomb_x1 = target_x;
	bomb_y1 = target_y;

	if target_rot == 0 {
	    // ------ //
	    bomb_x2 = target_x-global.cell_size;
	    bomb_y2 = target_y;
	    bomb_x3 = target_x-global.cell_size*2;
	    bomb_y3 = target_y;
	    bomb_x4 = target_x-global.cell_size*3;
	    bomb_y4 = target_y;
    
	    bomb_x5 = target_x+global.cell_size;
	    bomb_y5 = target_y;
	    bomb_x6 = target_x+global.cell_size*2;
	    bomb_y6 = target_y;
	    bomb_x7 = target_x+global.cell_size*3;
	    bomb_y7 = target_y;
    
		if p_one == true {
		    bomber_x1 = target_x-room_width*0.6;
		    bomber_y1 = target_y;
		    bomber_x2 = target_x+room_width*0.6;
		    bomber_y2 = target_y;
		}
			else {
				bomber_x1 = target_x+room_width*0.6;
			    bomber_y1 = target_y;
			    bomber_x2 = target_x-room_width*0.6;
			    bomber_y2 = target_y;
			}
	}
	    else if target_rot == 1 {
	        // ////// //
	        bomb_x2 = target_x-global.cell_size;
	        bomb_y2 = target_y+global.cell_size;
	        bomb_x3 = target_x-global.cell_size*2;
	        bomb_y3 = target_y+global.cell_size*2;
	        bomb_x4 = target_x-global.cell_size*3;
	        bomb_y4 = target_y+global.cell_size*3
        
	        bomb_x5 = target_x+global.cell_size;
	        bomb_y5 = target_y-global.cell_size;
	        bomb_x6 = target_x+global.cell_size*2;
	        bomb_y6 = target_y-global.cell_size*2;
	        bomb_x7 = target_x+global.cell_size*3;
	        bomb_y7 = target_y-global.cell_size*3;
        
			if p_one == true {
		        bomber_x1 = target_x-room_width*0.6;
		        bomber_y1 = target_y+room_height*0.6;
		        bomber_x2 = target_x+room_width*0.6;
		        bomber_y2 = target_y-room_height*0.6;
			}
				else {
					bomber_x1 = target_x+room_width*0.6;
			        bomber_y1 = target_y-room_height*0.6;
			        bomber_x2 = target_x-room_width*0.6;
			        bomber_y2 = target_y+room_height*0.6;
				}
	    }
	        else if target_rot == 2 {
	            // ||||||| //
	            bomb_x2 = target_x;
	            bomb_y2 = target_y+global.cell_size;
	            bomb_x3 = target_x;
	            bomb_y3 = target_y+global.cell_size*2;
	            bomb_x4 = target_x;
	            bomb_y4 = target_y+global.cell_size*3;
            
	            bomb_x5 = target_x;
	            bomb_y5 = target_y-global.cell_size;
	            bomb_x6 = target_x;
	            bomb_y6 = target_y-global.cell_size*2;
	            bomb_x7 = target_x;
	            bomb_y7 = target_y-global.cell_size*3;
            
				if p_one == true {
		            bomber_x1 = target_x;
		            bomber_y1 = target_y+room_height*0.6;
		            bomber_x2 = target_x;
		            bomber_y2 = target_y-room_height*0.6;
				}
					else {
						bomber_x1 = target_x;
			            bomber_y1 = target_y-room_height*0.6;
			            bomber_x2 = target_x;
			            bomber_y2 = target_y+room_height*0.6;
					}
	        }
	            else if target_rot == 3 {
	                // \\\\\\\ //
	                bomb_x2 = target_x-global.cell_size;
	                bomb_y2 = target_y-global.cell_size;
	                bomb_x3 = target_x-global.cell_size*2;
	                bomb_y3 = target_y-global.cell_size*2;
	                bomb_x4 = target_x-global.cell_size*3;
	                bomb_y4 = target_y-global.cell_size*3;
                
	                bomb_x5 = target_x+global.cell_size;
	                bomb_y5 = target_y+global.cell_size;
	                bomb_x6 = target_x+global.cell_size*2;
	                bomb_y6 = target_y+global.cell_size*2;
	                bomb_x7 = target_x+global.cell_size*3;
	                bomb_y7 = target_y+global.cell_size*3;
                
					if p_one == true {
		                bomber_x1 = target_x+room_width*0.6;
		                bomber_y1 = target_y+room_height*0.6;
		                bomber_x2 = target_x-room_height*0.6;
		                bomber_y2 = target_y-room_height*0.6;
					}
						else {
							bomber_x1 = target_x-room_width*0.6;
			                bomber_y1 = target_y-room_height*0.6;
			                bomber_x2 = target_x+room_height*0.6;
			                bomber_y2 = target_y+room_height*0.6;
						}
	            }
            
	//Keep bombs within the play area
	if (bomb_x2 < min_x) || (bomb_x2 > max_x) || (bomb_y2 < min_y) || (bomb_y2 > max_y) {
	    bomb_x2 = target_x;
	    bomb_y2 = target_y;
	}
	if (bomb_x3 < min_x) || (bomb_x3 > max_x) || (bomb_y3 < min_y) || (bomb_y3 > max_y) {
	    bomb_x3 = target_x;
	    bomb_y3 = target_y;
	}
	if (bomb_x4 < min_x) || (bomb_x4 > max_x) || (bomb_y4 < min_y) || (bomb_y4 > max_y) {
	    bomb_x4 = target_x;
	    bomb_y4 = target_y;
	}
	if (bomb_x5 < min_x) || (bomb_x5 > max_x) || (bomb_y5 < min_y) || (bomb_y5 > max_y) {
	    bomb_x5 = target_x;
	    bomb_y5 = target_y;
	}
	if (bomb_x6 < min_x) || (bomb_x6 > max_x) || (bomb_y6 < min_y) || (bomb_y6 > max_y) {
	    bomb_x6 = target_x;
	    bomb_y6 = target_y;
	}
	if (bomb_x7 < min_x) || (bomb_x7 > max_x) || (bomb_y7 < min_y) || (bomb_y7 > max_y) {
	    bomb_x7 = target_x;
	    bomb_y7 = target_y;
	}



}
