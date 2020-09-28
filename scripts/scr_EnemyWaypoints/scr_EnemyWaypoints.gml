function scr_EnemyWaypoints() {
	
	
	if global.game_turn > 0 && global.game_turn <= 32 {
		if p_one == true {
			//Left flank
			squad_1x = objective2_x+(global.cell_size*floor(random_range(-6, 6)));
			squad_1y = objective2_y+(global.cell_size*floor(random_range(-6, 2)));
			//Left flank
			squad_2x = objective2_x+(global.cell_size*floor(random_range(-8, 8)));
			squad_2y = objective2_y+(global.cell_size*floor(random_range(-6, 2)));
			//Center board
			squad_3x = global.min_x+(global.cell_size*floor(random_range(14, 26)));
			squad_3y = global.min_y+(global.cell_size*floor(random_range(16, 24)));
			//Right flank
			squad_4x = objective3_x+(global.cell_size*floor(random_range(-6, 6)));
			squad_4y = objective3_y+(global.cell_size*floor(random_range(-6, 2)));
			//Right flank
			squad_5x = objective3_x+(global.cell_size*floor(random_range(-8, 8)));
			squad_5y = objective3_y+(global.cell_size*floor(random_range(-6, 2)));
		}
			else {
				//Left flank
				squad_1x = objective1_x+(global.cell_size*floor(random_range(-6, 6)));
				squad_1y = objective1_y+(global.cell_size*floor(random_range(-2, 6)));
				//Left flank
				squad_2x = objective1_x+(global.cell_size*floor(random_range(-8, 8)));
				squad_2y = objective1_y+(global.cell_size*floor(random_range(-2, 6)));
				//Center board
				squad_3x = global.min_x+(global.cell_size*floor(random_range(14, 26)));
				squad_3y = global.min_y+(global.cell_size*floor(random_range(16, 24)));
				//Right flank
				squad_4x = objective2_x+(global.cell_size*floor(random_range(-6, 6)));
				squad_4y = objective2_y+(global.cell_size*floor(random_range(-2, 6)));
				//Right flank
				squad_5x = objective2_x+(global.cell_size*floor(random_range(-8, 8)));
				squad_5y = objective2_y+(global.cell_size*floor(random_range(-2, 6)));
			}
	}
		else if global.game_turn > 32 && global.game_turn <= 64 {
			if p_one == true {
				//Left flank...defend position
				squad_1x = objective2_x+(global.cell_size*floor(random_range(-8, 8)));
				squad_1y = objective2_y+(global.cell_size*floor(random_range(-6, 6)));
				//Left flank...move to capture
				squad_2x = objective1_x+(global.cell_size*floor(random_range(-6, 6)));
				squad_2y = objective1_y+(global.cell_size*floor(random_range(-6, 2)));
				//Center board...move forward
				squad_3x = global.min_x+(global.cell_size*floor(random_range(16, 24)));
				squad_3y = global.min_y+(global.cell_size*floor(random_range(20, 28)));
				//Right flank...move to capture
				squad_4x = objective1_x+(global.cell_size*floor(random_range(-6, 6)));
				squad_4y = objective1_y+(global.cell_size*floor(random_range(-6, 2)));
				//Right flank...defend position
				squad_5x = objective3_x+(global.cell_size*floor(random_range(-8, 8)));
				squad_5y = objective3_y+(global.cell_size*floor(random_range(-6, 6)));
			}
				else {
					//Left flank...defend position
					squad_1x = objective1_x+(global.cell_size*floor(random_range(-8, 8)));
					squad_1y = objective1_y+(global.cell_size*floor(random_range(-6, 6)));
					//Left flank...move to capture
					squad_2x = objective3_x+(global.cell_size*floor(random_range(-6, 6)));
					squad_2y = objective3_y+(global.cell_size*floor(random_range(-2, 6)));
					//Center board...move forward
					squad_3x = global.min_x+(global.cell_size*floor(random_range(16, 24)));
					squad_3y = global.min_y+(global.cell_size*floor(random_range(12, 20)));
					//Right flank...move to capture
					squad_4x = objective3_x+(global.cell_size*floor(random_range(-6, 6)));
					squad_4y = objective3_y+(global.cell_size*floor(random_range(-2, 6)));
					//Right flank...defend position
					squad_5x = objective2_x+(global.cell_size*floor(random_range(-8, 8)));
					squad_5y = objective2_y+(global.cell_size*floor(random_range(-6, 6)));
				}
		}
			else if global.game_turn > 64 && global.game_turn <= 96 {
				if p_one == true {
					//Left flank...patrol objective area
					squad_1x = objective2_x+(global.cell_size*floor(random_range(-12, 12)));
					squad_1y = objective2_y+(global.cell_size*floor(random_range(-6, 12)));
					//Left flank...fall back to defend
					squad_2x = objective2_x+(global.cell_size*floor(random_range(-6, 6)));
					squad_2y = objective2_y+(global.cell_size*floor(random_range(-6, 2)));
					//Center board...move to capture
					squad_3x = objective1_x+(global.cell_size*floor(random_range(-8, 8)));
					squad_3y = objective1_y+(global.cell_size*floor(random_range(-6, 6)));
					//Right flank...fall back to defend
					squad_4x = objective3_x+(global.cell_size*floor(random_range(-6, 6)));
					squad_4y = objective3_y+(global.cell_size*floor(random_range(-6, 2)));
					//Right flank...patrol objective area
					squad_5x = objective3_x+(global.cell_size*floor(random_range(-12, 12)));
					squad_5y = objective3_y+(global.cell_size*floor(random_range(-6, 12)));
				}
					else {
						//Left flank...patrol objective area
						squad_1x = objective1_x+(global.cell_size*floor(random_range(-12, 12)));
						squad_1y = objective1_y+(global.cell_size*floor(random_range(-12, 6)));
						//Left flank...fall back to defend
						squad_2x = objective1_x+(global.cell_size*floor(random_range(-6, 6)));
						squad_2y = objective1_y+(global.cell_size*floor(random_range(-2, 6)));
						//Center board...move to capture
						squad_3x = objective3_x+(global.cell_size*floor(random_range(-8, 8)));
						squad_3y = objective3_y+(global.cell_size*floor(random_range(-6, 6)));
						//Right flank...fall back to defend
						squad_4x = objective2_x+(global.cell_size*floor(random_range(-6, 6)));
						squad_4y = objective2_y+(global.cell_size*floor(random_range(-2, 6)));
						//Right flank...patrol objective area
						squad_5x = objective2_x+(global.cell_size*floor(random_range(-12, 12)));
						squad_5y = objective2_y+(global.cell_size*floor(random_range(-12, 6)));
					}
			}
				else if global.game_turn > 96 {
					if p_one == true {
						//Determine which objectives can still  be captured
						if global.objective_3.capture_pos > -10 { 
							//Send squads to capture objective
							//Left flank...patrol objective area
							squad_1x = objective2_x+(global.cell_size*floor(random_range(-12, 12)));
							squad_1y = objective2_y+(global.cell_size*floor(random_range(-6, 12)));
							//Left flank...fall back to defend
							squad_2x = objective2_x+(global.cell_size*floor(random_range(-6, 6)));
							squad_2y = objective2_y+(global.cell_size*floor(random_range(-6, 2)));
							//Center board...move to capture
							squad_3x = objective3_x+(global.cell_size*floor(random_range(-8, 8)));
							squad_3y = objective3_y+(global.cell_size*floor(random_range(-6, 6)));
							//Right flank...secure objective
							squad_4x = objective3_x+(global.cell_size*floor(random_range(-6, 6)));
							squad_4y = objective3_y+(global.cell_size*floor(random_range(-6, 2)));
							//Right flank...secure objective
							squad_5x = objective3_x+(global.cell_size*floor(random_range(-8, 8)));
							squad_5y = objective3_y+(global.cell_size*floor(random_range(-6, 2)));
						}
							else if global.objective_2.capture_pos > -10 { 
								//Left flank...secure objective
								squad_1x = objective2_x+(global.cell_size*floor(random_range(-6, 6)));
								squad_1y = objective2_y+(global.cell_size*floor(random_range(-6, 2)));
								//Left flank...secure objective
								squad_2x = objective2_x+(global.cell_size*floor(random_range(-8, 8)));
								squad_2y = objective2_y+(global.cell_size*floor(random_range(-6, 2)));
								//Center board...move to capture
								squad_3x = objective2_x+(global.cell_size*floor(random_range(-8, 8)));
								squad_3y = objective2_y+(global.cell_size*floor(random_range(-6, 6)));
								//Right flank...fall back to defend
								squad_4x = objective3_x+(global.cell_size*floor(random_range(-6, 6)));
								squad_4y = objective3_y+(global.cell_size*floor(random_range(-6, 2)));
								//Right flank...patrol objective area
								squad_5x = objective3_x+(global.cell_size*floor(random_range(-12, 12)));
								squad_5y = objective3_y+(global.cell_size*floor(random_range(-6, 12)));
							}
								else if global.objective_1.capture_pos > -10 { 
									//Left flank...defend position
									squad_1x = objective2_x+(global.cell_size*floor(random_range(-8, 8)));
									squad_1y = objective2_y+(global.cell_size*floor(random_range(-6, 6)));
									//Left flank...move to capture
									squad_2x = objective1_x+(global.cell_size*floor(random_range(-6, 6)));
									squad_2y = objective1_y+(global.cell_size*floor(random_range(-6, 2)));
									//Center board...move to capture
									squad_3x = objective1_x+(global.cell_size*floor(random_range(-8, 8)));
									squad_3y = objective1_y+(global.cell_size*floor(random_range(-6, 6)));
									//Right flank...move to capture
									squad_4x = objective1_x+(global.cell_size*floor(random_range(-6, 6)));
									squad_4y = objective1_y+(global.cell_size*floor(random_range(-6, 2)));
									//Right flank...defend position
									squad_5x = objective3_x+(global.cell_size*floor(random_range(-8, 8)));
									squad_5y = objective3_y+(global.cell_size*floor(random_range(-6, 6)));	
								}
									else {
										//Left flank...patrol objective area
										squad_1x = objective2_x+(global.cell_size*floor(random_range(-12, 12)));
										squad_1y = objective2_y+(global.cell_size*floor(random_range(-6, 12)));
										//Left flank...fall back to defend
										squad_2x = objective2_x+(global.cell_size*floor(random_range(-6, 6)));
										squad_2y = objective2_y+(global.cell_size*floor(random_range(-6, 2)));
										//Center board...move to capture
										squad_3x = objective1_x+(global.cell_size*floor(random_range(-8, 8)));
										squad_3y = objective1_y+(global.cell_size*floor(random_range(-6, 6)));
										//Right flank...fall back to defend
										squad_4x = objective3_x+(global.cell_size*floor(random_range(-6, 6)));
										squad_4y = objective3_y+(global.cell_size*floor(random_range(-6, 2)));
										//Right flank...patrol objective area
										squad_5x = objective3_x+(global.cell_size*floor(random_range(-12, 12)));
										squad_5y = objective3_y+(global.cell_size*floor(random_range(-6, 12)));
									}
					}
						else {
							//Determine which objectives can still  be captured
							if global.objective_1.capture_pos > -10 { 
								//Left flank...defend position
								squad_1x = objective2_x+(global.cell_size*floor(random_range(-8, 8)));
								squad_1y = objective2_y+(global.cell_size*floor(random_range(-6, 6)));
								//Left flank...move to capture
								squad_2x = objective1_x+(global.cell_size*floor(random_range(-6, 6)));
								squad_2y = objective1_y+(global.cell_size*floor(random_range(-2, 6)));
								//Center board...move to capture
								squad_3x = objective1_x+(global.cell_size*floor(random_range(-8, 8)));
								squad_3y = objective1_y+(global.cell_size*floor(random_range(-6, 6)));
								//Right flank...move to capture
								squad_4x = objective1_x+(global.cell_size*floor(random_range(-6, 6)));
								squad_4y = objective1_y+(global.cell_size*floor(random_range(-2, 6)));
								//Right flank...defend position
								squad_5x = objective3_x+(global.cell_size*floor(random_range(-8, 8)));
								squad_5y = objective3_y+(global.cell_size*floor(random_range(-6, 6)));	
							}
								else if global.objective_2.capture_pos > -10 { 
									//Left flank...secure objective
									squad_1x = objective2_x+(global.cell_size*floor(random_range(-6, 6)));
									squad_1y = objective2_y+(global.cell_size*floor(random_range(-2, 6)));
									//Left flank...secure objective
									squad_2x = objective2_x+(global.cell_size*floor(random_range(-8, 8)));
									squad_2y = objective2_y+(global.cell_size*floor(random_range(-2, 6)));
									//Center board...move to capture
									squad_3x = objective2_x+(global.cell_size*floor(random_range(-8, 8)));
									squad_3y = objective2_y+(global.cell_size*floor(random_range(-6, 6)));
									//Right flank...fall back to defend
									squad_4x = objective3_x+(global.cell_size*floor(random_range(-6, 6)));
									squad_4y = objective3_y+(global.cell_size*floor(random_range(-2, 6)));
									//Right flank...patrol objective area
									squad_5x = objective3_x+(global.cell_size*floor(random_range(-12, 12)));
									squad_5y = objective3_y+(global.cell_size*floor(random_range(-12, 6)));
								}
									else if global.objective_3.capture_pos > -10 { 
										//Send squads to capture objective
										//Left flank...patrol objective area
										squad_1x = objective2_x+(global.cell_size*floor(random_range(-12, 12)));
										squad_1y = objective2_y+(global.cell_size*floor(random_range(6, -12)));
										//Left flank...fall back to defend
										squad_2x = objective2_x+(global.cell_size*floor(random_range(-6, 6)));
										squad_2y = objective2_y+(global.cell_size*floor(random_range(-6, 2)));
										//Center board...move to capture
										squad_3x = objective3_x+(global.cell_size*floor(random_range(-8, 8)));
										squad_3y = objective3_y+(global.cell_size*floor(random_range(-6, 6)));
										//Right flank...secure objective
										squad_4x = objective3_x+(global.cell_size*floor(random_range(-6, 6)));
										squad_4y = objective3_y+(global.cell_size*floor(random_range(-6, 2)));
										//Right flank...secure objective
										squad_5x = objective3_x+(global.cell_size*floor(random_range(-8, 8)));
										squad_5y = objective3_y+(global.cell_size*floor(random_range(-6, 2)));
									}
										else {
											//Left flank...patrol objective area
											squad_1x = objective2_x+(global.cell_size*floor(random_range(-12, 12)));
											squad_1y = objective2_y+(global.cell_size*floor(random_range(-12, 6)));
											//Left flank...fall back to defend
											squad_2x = objective2_x+(global.cell_size*floor(random_range(-6, 6)));
											squad_2y = objective2_y+(global.cell_size*floor(random_range(-2, 6)));
											//Center board...move to capture
											squad_3x = objective1_x+(global.cell_size*floor(random_range(-8, 8)));
											squad_3y = objective1_y+(global.cell_size*floor(random_range(-6, 6)));
											//Right flank...fall back to defend
											squad_4x = objective3_x+(global.cell_size*floor(random_range(-6, 6)));
											squad_4y = objective3_y+(global.cell_size*floor(random_range(-2, 6)));
											//Right flank...patrol objective area
											squad_5x = objective3_x+(global.cell_size*floor(random_range(-12, 12)));
											squad_5y = objective3_y+(global.cell_size*floor(random_range(-12, 6)));
										}
						}             
				}
					
					
}
