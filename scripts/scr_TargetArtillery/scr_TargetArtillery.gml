function scr_TargetArtillery() {
	//Rotate targeting
	if keyboard_check_pressed(global.LSHIFT) {
	    target_rot += 1;
	    if target_rot > 1 { target_rot = 0; }
	}
	    else if keyboard_check_pressed(global.RSHIFT) {
	        target_rot -= 1;
	        if target_rot < 0 { target_rot = 1; }
	    }

	//Store bomb positions
	bomb_x1 = target_x;
	bomb_y1 = target_y;

	if target_rot == 0 {
	    bomb_x2 = target_x-global.cell_size;
	    bomb_y2 = target_y;
	    bomb_x3 = target_x-global.cell_size*2;
	    bomb_y3 = target_y;
	    bomb_x4 = target_x+global.cell_size;
	    bomb_y4 = target_y;
	    bomb_x5 = target_x+global.cell_size*2;
	    bomb_y5 = target_y;
	    bomb_x6 = target_x;
	    bomb_y6 = target_y-global.cell_size;
	    bomb_x7 = target_x-global.cell_size;
	    bomb_y7 = target_y-global.cell_size;
	    bomb_x8 = target_x-global.cell_size*2;
	    bomb_y8 = target_y-global.cell_size;
	    bomb_x9 = target_x+global.cell_size;
	    bomb_y9 = target_y-global.cell_size;
	    bomb_x10 = target_x+global.cell_size*2;
	    bomb_y10 = target_y-global.cell_size;
	}
	    else if target_rot == 1 {
	        bomb_x2 = target_x;
	        bomb_y2 = target_y-global.cell_size;
	        bomb_x3 = target_x;
	        bomb_y3 = target_y-global.cell_size*2;
	        bomb_x4 = target_x;
	        bomb_y4 = target_y+global.cell_size;
	        bomb_x5 = target_x;
	        bomb_y5 = target_y+global.cell_size*2;
	        bomb_x6 = target_x+global.cell_size;
	        bomb_y6 = target_y;
	        bomb_x7 = target_x+global.cell_size;
	        bomb_y7 = target_y-global.cell_size;
	        bomb_x8 = target_x+global.cell_size;
	        bomb_y8 = target_y-global.cell_size*2;
	        bomb_x9 = target_x+global.cell_size;
	        bomb_y9 = target_y+global.cell_size;
	        bomb_x10 = target_x+global.cell_size;
	        bomb_y10 = target_y+global.cell_size*2;
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
	if (bomb_x8 < min_x) || (bomb_x8 > max_x) || (bomb_y8 < min_y) || (bomb_y8 > max_y) {
	    bomb_x8 = target_x;
	    bomb_y8 = target_y;
	}
	if (bomb_x9 < min_x) || (bomb_x9 > max_x) || (bomb_y9 < min_y) || (bomb_y9 > max_y) {
	    bomb_x9 = target_x;
	    bomb_y9 = target_y;
	}
	if (bomb_x10 < min_x) || (bomb_x10 > max_x) || (bomb_y10 < min_y) || (bomb_y10 > max_y) {
	    bomb_x10= target_x;
	    bomb_y10 = target_y;
	}

}
