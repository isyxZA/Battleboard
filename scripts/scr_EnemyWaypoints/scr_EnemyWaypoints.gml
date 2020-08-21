function scr_EnemyWaypoints() {
	if p_one == true {
		if global.game_turn > 0 && global.game_turn <= 12 {
			//Center front
			squad_1x = global.min_x+(global.cell_size*choose(21,22,23,24,25,26,27));
			squad_1y = global.min_y+(global.cell_size*choose(18,20,22,24,26,28,30));
			//Center rear
			squad_2x = global.min_x+(global.cell_size*choose(18,20,22,24,26,28,30));
			squad_2y = global.min_y+(global.cell_size*choose(18,19,20,21,22,23,24));
			//Right flank
			squad_3x = global.min_x+(global.cell_size*choose(8 ,9 ,10,11,12,13,14));
			squad_3y = global.min_y+(global.cell_size*choose(12,13,14,15,16,17,22));
			//Left flank
			squad_4x = global.min_x+(global.cell_size*choose(34,35,36,37,38,39,40));
			squad_4y = global.min_y+(global.cell_size*choose(12,13,14,15,16,17,22));
			//Center front
			squad_5x = global.min_x+(global.cell_size*choose(21,22,23,24,25,26,27));
			squad_5y = global.min_y+(global.cell_size*choose(18,20,22,24,26,28,30));
		}
			else if global.game_turn > 12 && global.game_turn <= 24 {
			    squad_1x = global.min_x+(global.cell_size*choose(21,22,23,24,25,26,27));
			    squad_1y = global.min_y+(global.cell_size*choose(30,31,32,33,34,35,36));
			    squad_2x = global.min_x+(global.cell_size*choose(18,20,22,24,26,28,30));
			    squad_2y = global.min_y+(global.cell_size*choose(24,25,26,27,28,29,30));
			    squad_3x = global.min_x+(global.cell_size*choose(4 ,6 ,8 ,10,12,14,16));
			    squad_3y = global.min_y+(global.cell_size*choose(12,13,14,15,16,17,22));
			    squad_4x = global.min_x+(global.cell_size*choose(34,36,38,40,42,44,46));
			    squad_4y = global.min_y+(global.cell_size*choose(12,13,14,15,16,17,22));
			    squad_5x = global.min_x+(global.cell_size*choose(21,22,23,24,25,26,27));
			    squad_5y = global.min_y+(global.cell_size*choose(30,31,32,33,34,35,36));
			}
			    else if global.game_turn > 24 && global.game_turn <= 35 {
			        squad_1x = global.min_x+(global.cell_size*choose(21,22,23,24,25,26,27));
			        squad_1y = global.min_y+(global.cell_size*choose(28,30,32,34,36,38,40));
			        squad_2x = global.min_x+(global.cell_size*choose(18,20,22,24,26,28,30));
			        squad_2y = global.min_y+(global.cell_size*choose(28,30,32,34,36,38,40));
			        squad_3x = global.min_x+(global.cell_size*choose(4 ,6 ,8 ,10,12,14,16));
			        squad_3y = global.min_y+(global.cell_size*choose(12,13,14,15,16,17,22));
			        squad_4x = global.min_x+(global.cell_size*choose(34,36,38,40,42,44,46));
			        squad_4y = global.min_y+(global.cell_size*choose(12,13,14,15,16,17,22));
			        squad_5x = global.min_x+(global.cell_size*choose(21,22,23,24,25,26,27));
			        squad_5y = global.min_y+(global.cell_size*choose(28,30,32,34,36,38,40));
			    }
			        else if global.game_turn > 35 {
						var cf = choose(1,1,1,2,2,3);
						switch cf {
							case 1:
								squad_1x = global.min_x+(global.cell_size*choose(21,22,23,24,25,26,27));
					            squad_1y = global.min_y+(global.cell_size*choose(28,30,32,34,36,38,40));
					            squad_2x = global.min_x+(global.cell_size*choose(18,20,22,24,26,28,30));
					            squad_2y = global.min_y+(global.cell_size*choose(18,20,22,24,26,28,36));
					            squad_3x = global.min_x+(global.cell_size*choose(10,12,14,16,18,20,22));
					            squad_3y = global.min_y+(global.cell_size*choose(12,13,14,15,16,17,32));
					            squad_4x = global.min_x+(global.cell_size*choose(26,28,30,32,34,36,38));
					            squad_4y = global.min_y+(global.cell_size*choose(12,13,14,15,16,17,22));
					            squad_5x = global.min_x+(global.cell_size*choose(21,22,23,24,25,26,27));
					            squad_5y = global.min_y+(global.cell_size*choose(28,30,32,34,36,38,40));
								break;
							case 2:
								squad_1x = global.min_x+(global.cell_size*choose(21,22,23,24,25,26,27));
						        squad_1y = global.min_y+(global.cell_size*choose(28,30,32,34,36,38,40));
						        squad_2x = global.min_x+(global.cell_size*choose(18,20,22,24,26,28,30));
						        squad_2y = global.min_y+(global.cell_size*choose(28,30,32,34,36,38,40));
						        squad_3x = global.min_x+(global.cell_size*choose(4 ,6 ,8 ,10,12,14,16));
						        squad_3y = global.min_y+(global.cell_size*choose(12,13,14,15,16,17,22));
						        squad_4x = global.min_x+(global.cell_size*choose(34,36,38,40,42,44,46));
						        squad_4y = global.min_y+(global.cell_size*choose(12,13,14,15,16,17,22));
						        squad_5x = global.min_x+(global.cell_size*choose(21,22,23,24,25,26,27));
						        squad_5y = global.min_y+(global.cell_size*choose(28,30,32,34,36,38,40));
								break;
							case 3:
								squad_1x = global.min_x+(global.cell_size*choose(21,22,23,24,25,26,27));
							    squad_1y = global.min_y+(global.cell_size*choose(30,31,32,33,34,35,36));
							    squad_2x = global.min_x+(global.cell_size*choose(18,20,22,24,26,28,30));
							    squad_2y = global.min_y+(global.cell_size*choose(24,25,26,27,28,29,30));
							    squad_3x = global.min_x+(global.cell_size*choose(4 ,6 ,8 ,10,12,14,16));
							    squad_3y = global.min_y+(global.cell_size*choose(12,13,14,15,16,17,22));
							    squad_4x = global.min_x+(global.cell_size*choose(34,36,38,40,42,44,46));
							    squad_4y = global.min_y+(global.cell_size*choose(12,13,14,15,16,17,22));
							    squad_5x = global.min_x+(global.cell_size*choose(21,22,23,24,25,26,27));
							    squad_5y = global.min_y+(global.cell_size*choose(30,31,32,33,34,35,36));
								break;
						}
                                    
			        }
	}
		else {
			if global.game_turn > 0 && global.game_turn <= 12 {
				//Center front
				squad_1x = global.max_x-(global.cell_size*choose(21,22,23,24,25,26,27));
				squad_1y = global.max_y-(global.cell_size*choose(18,20,22,24,26,28,30));
				//Center rear
				squad_2x = global.max_x-(global.cell_size*choose(18,20,22,24,26,28,30));
				squad_2y = global.max_y-(global.cell_size*choose(18,19,20,21,22,23,24));
				//Right flank
				squad_3x = global.max_x-(global.cell_size*choose(8 ,9 ,10,11,12,13,14));
				squad_3y = global.max_y-(global.cell_size*choose(12,13,14,15,16,17,22));
				//Left flank
				squad_4x = global.max_x-(global.cell_size*choose(34,35,36,37,38,39,40));
				squad_4y = global.max_y-(global.cell_size*choose(12,13,14,15,16,17,22));
				//Center front
				squad_5x = global.max_x-(global.cell_size*choose(21,22,23,24,25,26,27));
				squad_5y = global.max_y-(global.cell_size*choose(18,20,22,24,26,28,30));
			}
				else if global.game_turn > 12 && global.game_turn <= 24 {
					squad_1x = global.max_x-(global.cell_size*choose(21,22,23,24,25,26,27));
					squad_1y = global.max_y-(global.cell_size*choose(30,31,32,33,34,35,36));
					squad_2x = global.max_x-(global.cell_size*choose(18,20,22,24,26,28,30));
					squad_2y = global.max_y-(global.cell_size*choose(24,25,26,27,28,29,30));
					squad_3x = global.max_x-(global.cell_size*choose(4 ,6 ,8 ,10,12,14,16));
					squad_3y = global.max_y-(global.cell_size*choose(12,13,14,15,16,17,22));
					squad_4x = global.max_x-(global.cell_size*choose(34,36,38,40,42,44,46));
					squad_4y = global.max_y-(global.cell_size*choose(12,13,14,15,16,17,22));
					squad_5x = global.max_x-(global.cell_size*choose(21,22,23,24,25,26,27));
					squad_5y = global.max_y-(global.cell_size*choose(30,31,32,33,34,35,36));
				}
					else if global.game_turn > 24 && global.game_turn <= 35 {
						squad_1x = global.max_x-(global.cell_size*choose(21,22,23,24,25,26,27));
						squad_1y = global.max_y-(global.cell_size*choose(28,30,32,34,36,38,40));
						squad_2x = global.max_x-(global.cell_size*choose(18,20,22,24,26,28,30));
						squad_2y = global.max_y-(global.cell_size*choose(28,30,32,34,36,38,40));
						squad_3x = global.max_x-(global.cell_size*choose(4 ,6 ,8 ,10,12,14,16));
						squad_3y = global.max_y-(global.cell_size*choose(12,13,14,15,16,17,22));
						squad_4x = global.max_x-(global.cell_size*choose(34,36,38,40,42,44,46));
						squad_4y = global.max_y-(global.cell_size*choose(12,13,14,15,16,17,22));
						squad_5x = global.max_x-(global.cell_size*choose(21,22,23,24,25,26,27));
						squad_5y = global.max_y-(global.cell_size*choose(28,30,32,34,36,38,40));
					}
						else if global.game_turn > 35 {
							var cf = choose(1,1,1,2,2,3);
							switch cf {
								case 1:
									squad_1x = global.max_x-(global.cell_size*choose(21,22,23,24,25,26,27));
								    squad_1y = global.max_y-(global.cell_size*choose(28,30,32,34,36,38,40));
								    squad_2x = global.max_x-(global.cell_size*choose(18,20,22,24,26,28,30));
								    squad_2y = global.max_y-(global.cell_size*choose(18,20,22,24,26,28,36));
								    squad_3x = global.max_x-(global.cell_size*choose(10,12,14,16,18,20,22));
								    squad_3y = global.max_y-(global.cell_size*choose(12,13,14,15,16,17,32));
								    squad_4x = global.max_x-(global.cell_size*choose(26,28,30,32,34,36,38));
								    squad_4y = global.max_y-(global.cell_size*choose(12,13,14,15,16,17,22));
								    squad_5x = global.max_x-(global.cell_size*choose(21,22,23,24,25,26,27));
								    squad_5y = global.max_y-(global.cell_size*choose(28,30,32,34,36,38,40));
									break;
								case 2:
									squad_1x = global.max_x-(global.cell_size*choose(21,22,23,24,25,26,27));
									squad_1y = global.max_y-(global.cell_size*choose(28,30,32,34,36,38,40));
									squad_2x = global.max_x-(global.cell_size*choose(18,20,22,24,26,28,30));
									squad_2y = global.max_y-(global.cell_size*choose(28,30,32,34,36,38,40));
									squad_3x = global.max_x-(global.cell_size*choose(4 ,6 ,8 ,10,12,14,16));
									squad_3y = global.max_y-(global.cell_size*choose(12,13,14,15,16,17,22));
									squad_4x = global.max_x-(global.cell_size*choose(34,36,38,40,42,44,46));
									squad_4y = global.max_y-(global.cell_size*choose(12,13,14,15,16,17,22));
									squad_5x = global.max_x-(global.cell_size*choose(21,22,23,24,25,26,27));
									squad_5y = global.max_y-(global.cell_size*choose(28,30,32,34,36,38,40));
									break;
								case 3:
									squad_1x = global.max_x-(global.cell_size*choose(21,22,23,24,25,26,27));
									squad_1y = global.max_y-(global.cell_size*choose(30,31,32,33,34,35,36));
									squad_2x = global.max_x-(global.cell_size*choose(18,20,22,24,26,28,30));
									squad_2y = global.max_y-(global.cell_size*choose(24,25,26,27,28,29,30));
									squad_3x = global.max_x-(global.cell_size*choose(4 ,6 ,8 ,10,12,14,16));
									squad_3y = global.max_y-(global.cell_size*choose(12,13,14,15,16,17,22));
									squad_4x = global.max_x-(global.cell_size*choose(34,36,38,40,42,44,46));
									squad_4y = global.max_y-(global.cell_size*choose(12,13,14,15,16,17,22));
									squad_5x = global.max_x-(global.cell_size*choose(21,22,23,24,25,26,27));
									squad_5y = global.max_y-(global.cell_size*choose(30,31,32,33,34,35,36));
									break;
							}
                                    
						}
		}


}
