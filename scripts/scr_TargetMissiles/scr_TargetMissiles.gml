function scr_TargetMissiles() {
	target_rot = 0; 

	//Store bomb positions
	bomb_x1 = target_x;
	bomb_y1 = target_y;

	bomb_x2 = target_x;
	bomb_y2 = target_y-global.cell_size;

	bomb_x3 = target_x;
	if p_one == true { bomb_y3 = target_y-global.cell_size*2; }
		else { bomb_y3 = target_y+global.cell_size; }

	bomb_x4 = target_x-global.cell_size;
	bomb_y4 = target_y;

	bomb_x5 = target_x+global.cell_size;
	bomb_y5 = target_y;

	bomb_x6 = target_x+global.cell_size;
	bomb_y6 = target_y-global.cell_size;

	bomb_x7 = target_x-global.cell_size;
	bomb_y7 = target_y-global.cell_size;

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
