/// @description scr_RotateUnit(threat_x, threat_y);
/// @param threat_x
/// @param threat_y
function scr_RotateUnit(argument0, argument1) {
	
	var threat_x = argument0;
	var threat_y = argument1;
	
	//NORTH FACING
	if p_one == false {
		switch unit_type {
			case "E_MBTA":
			case "E_MBTB":
			case "E_LAVB":
				//Strongest armor is in the front
				//Threat is on same column as unit
				if threat_x == x { 
					//Threat is below unit
					//Rotate towards south
					if threat_y > y {
						switch rot_offset {
							case 0://North
								//Rotate either left or right
								rot_offset = choose(90,270);
								action_points -= 1;
								obj_EnemyControl_B.turn_ap -= 1;
								if action_points < 1 { idle_state = 1; }
								break;
							case 90: //West
							case 270://East
								//Rotate south
								rot_offset = 180;
								action_points -= 1;
								obj_EnemyControl_B.turn_ap -= 1;
								if action_points < 1 { idle_state = 1; }
								break;
							case 180://South
								//Already facing south
								idle_state = 1;
								break;
						}
					}
						//Threat is above unit
						//Rotate towards north
						else if threat_y < y { 
							switch rot_offset {
								case 0://North
									//Already facing north
									idle_state = 1;
									break;
								case 90: //West
								case 270://East
									//Rotate north
									rot_offset = 0;
									action_points -= 1;
									obj_EnemyControl_B.turn_ap -= 1;
									if action_points < 1 { idle_state = 1; }
									break;
								case 180://South
									//Rotate either left or right
									rot_offset = choose(90,270);
									action_points -= 1;
									obj_EnemyControl_B.turn_ap -= 1;
									if action_points < 1 { idle_state = 1; }
									break;
							}
						}
				}
					//Threat is in column left of unit
					else if threat_x < x { 
						//Threat is below unit
						//Rotate towards south
						if threat_y > (y+global.cell_size*2) {
							switch rot_offset {
								case 0://North
									//Rotate either left or right
									rot_offset = choose(90,270);
									action_points -= 1;
									obj_EnemyControl_B.turn_ap -= 1;
									if action_points < 1 { idle_state = 1; }
									break;
								case 90://West
								case 270://East
									//Rotate south
									rot_offset = 180;
									action_points -= 1;
									obj_EnemyControl_B.turn_ap -= 1;
									if action_points < 1 { idle_state = 1; }
									break;
								case 180://South
									//Already facing south
									idle_state = 1;
									break;
							}
						}
							//Threat is above unit
							//Rotate towards north
							else if threat_y < (y-global.cell_size*2) { 
								switch rot_offset {
									case 0://North
										//Already facing north
										idle_state = 1;
										break;
									case 90: //West
									case 270://East
										//Rotate north
										rot_offset = 0;
										action_points -= 1;
										obj_EnemyControl_B.turn_ap -= 1;
										if action_points < 1 { idle_state = 1; }
										break;
									case 180://South
										//Rotate either left or right
										rot_offset = choose(90,270);
										action_points -= 1;
										obj_EnemyControl_B.turn_ap -= 1;
										if action_points < 1 { idle_state = 1; }
										break;
								}
							}
								//Threat is on same row as unit
								//Rotate towards west
								else if threat_y == y {
									switch rot_offset {
										case 0://North
											//Rotate west
											rot_offset = 90;
											action_points -= 1;
											obj_EnemyControl_B.turn_ap -= 1;
											if action_points < 1 { idle_state = 1; }
											break;
										case 90://West
											//Already facing west
											idle_state = 1;
											break;
										case 180://South
											//Rotate west
											rot_offset = 90;
											action_points -= 1;
											obj_EnemyControl_B.turn_ap -= 1;
											if action_points < 1 { idle_state = 1; }
											break;
										case 270://East
											//Rotate either left or right
											rot_offset = choose(0,180);
											action_points -= 1;
											obj_EnemyControl_B.turn_ap -= 1;
											if action_points < 1 { idle_state = 1; }
											break;
									}
								}
					}
						//Threat is in column right of unit
						else if threat_x > x { 
							//Threat is below unit
							//Rotate towards south
							if threat_y > (y+global.cell_size*2) {
								switch rot_offset {
									case 0://North
										//Rotate either left or right
										rot_offset = choose(90,270);
										action_points -= 1;
										obj_EnemyControl_B.turn_ap -= 1;
										if action_points < 1 { idle_state = 1; }
										break;
									case 90: //West
									case 270://East
										//Rotate south
										rot_offset = 180;
										action_points -= 1;
										obj_EnemyControl_B.turn_ap -= 1;
										if action_points < 1 { idle_state = 1; }
										break;
									case 180://South
										//Already facing south
										idle_state = 1;
										break;
								}
							}
								//Threat is above unit
								//Rotate towards north
								else if threat_y < (y-global.cell_size*2) { 
									switch rot_offset {
										case 0://North
											//Already facing north
											idle_state = 1;
											break;
										case 90: //West
										case 270://East
											//Rotate north
											rot_offset = 0;
											action_points -= 1;
											obj_EnemyControl_B.turn_ap -= 1;
											if action_points < 1 { idle_state = 1; }
											break;
										case 180://South
											//Rotate either left or right
											rot_offset = choose(90,270);
											action_points -= 1;
											obj_EnemyControl_B.turn_ap -= 1;
											if action_points < 1 { idle_state = 1; }
											break;
									}
								}
									//Threat is on same row as unit
									//Rotate towards east
									else if threat_y == y {
										switch rot_offset {
											case 0://North
											case 180://South
												//Rotate east
												rot_offset = 270;
												action_points -= 1;
												obj_EnemyControl_B.turn_ap -= 1;
												if action_points < 1 { idle_state = 1; }
												break;
											case 90://West
												//Rotate either left or right
												rot_offset = choose(0,180);
												action_points -= 1;
												obj_EnemyControl_B.turn_ap -= 1;
												if action_points < 1 { idle_state = 1; }
												break;
											case 270://East
												//Already facing east
												idle_state = 1;
												break;
										}
									}
										else { idle_state = 1; }
						}
				break;
			case "E_LAVA":
				//Threat is on same column as unit
				if threat_x == x { 
					//Threat is below unit
					//Rotate towards east/west
					if threat_y > y {
						switch rot_offset {
							case 0://North
							case 180://South
								//Rotate either left or right
								rot_offset = choose(90,270);
								action_points -= 1;
								obj_EnemyControl_B.turn_ap -= 1;
								if action_points < 1 { idle_state = 1; }
								break;
							case 90: //West
							case 270://East
								//Already facing east/west
								idle_state = 1;
								break;
						}
					}
						//Threat is above unit
						//Rotate towards east/west
						else if threat_y < y { 
							switch rot_offset {
								case 0://North
								case 180://South
									//Rotate either left or right
									rot_offset = choose(90,270);
									action_points -= 1;
									obj_EnemyControl_B.turn_ap -= 1;
									if action_points < 1 { idle_state = 1; }
									break;
								case 90: //West
								case 270://East
									//Already facing east/west
									idle_state = 1;
									break;
							}
						}
				}
					//Threat is in column left of unit
					else if threat_x < x { 
						//Threat is below unit
						//Rotate towards west
						if threat_y > (y+global.cell_size*2) {
							switch rot_offset {
								case 0://North
								case 180://South
									//Rotate facing west
									rot_offset = 90;
									action_points -= 1;
									obj_EnemyControl_B.turn_ap -= 1;
									if action_points < 1 { idle_state = 1; }
									break;
								case 90: //West
									//Already facing west
									idle_state = 1;
									break;
								case 270://East
									//Rotate facing north
									rot_offset = 0;
									action_points -= 1;
									obj_EnemyControl_B.turn_ap -= 1;
									if action_points < 1 { idle_state = 1; }
									break;
							}
						}
							//Threat is above unit
							//Rotate towards west
							else if threat_y < (y-global.cell_size*2) { 
								switch rot_offset {
									case 0://North
									case 180://South
										//Rotate facing west
										rot_offset = 90;
										action_points -= 1;
										obj_EnemyControl_B.turn_ap -= 1;
										if action_points < 1 { idle_state = 1; }
										break;
									case 90: //West
										//Already facing west
										idle_state = 1;
										break;
									case 270://East
										//Rotate facing north
										rot_offset = 0;
										action_points -= 1;
										obj_EnemyControl_B.turn_ap -= 1;
										if action_points < 1 { idle_state = 1; }
										break;
								}
							}
								//Threat is on same row as unit
								//Rotate towards north/south
								else if threat_y == y {
									switch rot_offset {
										case 0://North
										case 180://South
											//Already facing north/south
											idle_state = 1;
											break;
										case 90: //West
											//Rotate facing north
											rot_offset = 0;
											action_points -= 1;
											obj_EnemyControl_B.turn_ap -= 1;
											if action_points < 1 { idle_state = 1; }
											break;
										case 270://East
											//Rotate facing north
											rot_offset = 0;
											action_points -= 1;
											obj_EnemyControl_B.turn_ap -= 1;
											if action_points < 1 { idle_state = 1; }
											break;
									}
								}
					}
						//Threat is in column right of unit
						else if threat_x > x { 
							//Threat is below unit
							//Rotate towards east
							if threat_y > (y+global.cell_size*2) {
								switch rot_offset {
									case 0://North
										//Rotate facing east
										rot_offset = 270;
										action_points -= 1;
										obj_EnemyControl_B.turn_ap -= 1;
										if action_points < 1 { idle_state = 1; }
									case 180://South
										//Rotate facing east
										rot_offset = 270;
										action_points -= 1;
										obj_EnemyControl_B.turn_ap -= 1;
										if action_points < 1 { idle_state = 1; }
										break;
									case 90: //West
										//Rotate facing south/north
										rot_offset = 180;
										action_points -= 1;
										obj_EnemyControl_B.turn_ap -= 1;
										if action_points < 1 { idle_state = 1; }
										break;
									case 270://East
										//Already facing east
										idle_state = 1;
										break;
								}
							}
								//Threat is above unit
								//Rotate towards east
								else if threat_y < (y-global.cell_size*2) { 
									switch rot_offset {
										case 0://North
											//Rotate facing east
											rot_offset = 270;
											action_points -= 1;
											obj_EnemyControl_B.turn_ap -= 1;
											if action_points < 1 { idle_state = 1; }
										case 180://South
											//Rotate facing east
											rot_offset = 270;
											action_points -= 1;
											obj_EnemyControl_B.turn_ap -= 1;
											if action_points < 1 { idle_state = 1; }
											break;
										case 90: //West
											//Rotate facing south/north
											rot_offset = 0;
											action_points -= 1;
											obj_EnemyControl_B.turn_ap -= 1;
											if action_points < 1 { idle_state = 1; }
											break;
										case 270://East
											//Already facing east
											idle_state = 1;
											break;
									}
								}
									//Threat is on same row as unit
									//Rotate towards north
									else if threat_y == y {
										switch rot_offset {
											case 0://North
											case 180://South
												//Already facing north/south
												idle_state = 1;
												break;
											case 90: //West
												//Rotate facing north
												rot_offset = 0;
												action_points -= 1;
												obj_EnemyControl_B.turn_ap -= 1;
												if action_points < 1 { idle_state = 1; }
												break;
											case 270://East
												//Rotate facing north
												rot_offset = 0;
												action_points -= 1;
												obj_EnemyControl_B.turn_ap -= 1;
												if action_points < 1 { idle_state = 1; }
												break;
										}
									}
										else { idle_state = 1; }
						}
				break;
		}	
	}
		//SOUTH FACING
		else if p_one == true {
			switch unit_type {
				case "E_MBTA":
				case "E_MBTB":
				case "E_LAVB":
					//Threat is on same column as unit
					if threat_x == x { 
						//Threat is below unit
						//Rotate towards south
						if threat_y > y {
							switch rot_offset {
								case 0://South
									//Already facing south
									idle_state = 1;
									break;
								case 90: //East
								case 270://West
									//Rotate south
									rot_offset = 0;
									action_points -= 1;
									obj_EnemyControl_B.turn_ap -= 1;
									if action_points < 1 { idle_state = 1; }
									break;
								case 180://North
									//Rotate either left or right
									rot_offset = choose(90,270);
									action_points -= 1;
									obj_EnemyControl_B.turn_ap -= 1;
									if action_points < 1 { idle_state = 1; }
									break;
							}
						}
							//Threat is above unit
							//Rotate towards north
							else if threat_y < y { 
								switch rot_offset {
									case 0://South
										//Rotate either left or right
										rot_offset = choose(90,270);
										action_points -= 1;
										if action_points < 1 { idle_state = 1; }
										break;
									case 90: //East
									case 270://West
										//Rotate north
										rot_offset = 180;
										action_points -= 1;
										obj_EnemyControl_B.turn_ap -= 1;
										if action_points < 1 { idle_state = 1; }
										break;
									case 180://North
										//Already facing north
										idle_state = 1;
										break;
								}
							}
					}
						//Threat is in column left of unit
						else if threat_x < x { 
							//Threat is below unit
							//Rotate towards west
							if threat_y > (y+global.cell_size*2) {
								switch rot_offset {
									case 0://South
									case 180://North
										//Rotate facing west
										rot_offset = 270;
										action_points -= 1;
										obj_EnemyControl_B.turn_ap -= 1;
										if action_points < 1 { idle_state = 1; }
										break;
									case 90: //East
										//Rotate south
										rot_offset = 0;
										action_points -= 1;
										obj_EnemyControl_B.turn_ap -= 1;
										if action_points < 1 { idle_state = 1; }
										break;
									case 270://West
										//Already facing west
										idle_state = 1;
										break;
								}
							}
								//Threat is above unit
								//Rotate towards west
								else if threat_y < (y-global.cell_size*2) { 
									switch rot_offset {
										case 0://South
										case 180://North
											//Rotate facing west
											rot_offset = 270;
											action_points -= 1;
											obj_EnemyControl_B.turn_ap -= 1;
											if action_points < 1 { idle_state = 1; }
											break;
										case 90: //East
											//Rotate north
											rot_offset = 180;
											action_points -= 1;
											obj_EnemyControl_B.turn_ap -= 1;
											if action_points < 1 { idle_state = 1; }
											break;
										case 270://West
											//Already facing west
											idle_state = 1;
											break;
									}
								}
									//Threat is on same row as unit
									//Rotate towards west
									else if threat_y == y {
										switch rot_offset {
											case 0://South
											case 180://North
												//Rotate west
												rot_offset = 270;
												action_points -= 1;
												obj_EnemyControl_B.turn_ap -= 1;
												if action_points < 1 { idle_state = 1; }
												break;
											case 90: //East
												//Rotate south
												rot_offset = 0;
												action_points -= 1;
												obj_EnemyControl_B.turn_ap -= 1;
												if action_points < 1 { idle_state = 1; }
												break;
											case 270://West
												//Already facing west
												idle_state = 1;
												break;
										}
									}
						}
							//Threat is in column right of unit
							else if threat_x > x { 
								//Threat is below unit
								//Rotate towards south
								if threat_y > (y+global.cell_size*2) {
									switch rot_offset {
										case 0://South
											//Already facing south
											idle_state = 1;
											break;
										case 180://North
											//Rotate facing east
											rot_offset = 90;
											action_points -= 1;
											obj_EnemyControl_B.turn_ap -= 1;
											if action_points < 1 { idle_state = 1; }
											break;
										case 90: //East
										case 270://West
											//Rotate south
											rot_offset = 0;
											action_points -= 1;
											obj_EnemyControl_B.turn_ap -= 1;
											if action_points < 1 { idle_state = 1; }
											break;
									}
								}
									//Threat is above unit
									//Rotate towards north
									else if threat_y < (y-global.cell_size*2) { 
										switch rot_offset {
											case 0://South
												//Rotate east
												rot_offset = 90;
												action_points -= 1;
												obj_EnemyControl_B.turn_ap -= 1;
												if action_points < 1 { idle_state = 1; }
												break;
											case 180://North
												//Already facing north
												idle_state = 1;
												break;
											case 90: //East
											case 270://West
												//Rotate north
												rot_offset = 180;
												action_points -= 1;
												obj_EnemyControl_B.turn_ap -= 1;
												if action_points < 1 { idle_state = 1; }
												break;
										}
									}
										//Threat is on same row as unit
										//Rotate towards east
										else if threat_y == y {
											switch rot_offset {
												case 0://North
												case 180://South
													//Rotate east
													rot_offset = 90;
													action_points -= 1;
													obj_EnemyControl_B.turn_ap -= 1;
													if action_points < 1 { idle_state = 1; }
													break;
												case 90://East
													//Already facing east
													idle_state = 1;
													break;
												case 270://West
													//Rotate south
													rot_offset = 0;
													action_points -= 1;
													obj_EnemyControl_B.turn_ap -= 1;
													if action_points < 1 { idle_state = 1; }
													break;
											}
										}
											else { idle_state = 1; }
							}
					break;
				case "E_LAVA":
					//Threat is on same column as unit
					if threat_x == x { 
						//Threat is below unit
						//Rotate towards east/west
						if threat_y > y {
							switch rot_offset {
								case 0://South
									//Rotate either left or right
									rot_offset = choose(90,270);
									action_points -= 1;
									obj_EnemyControl_B.turn_ap -= 1;
									if action_points < 1 { idle_state = 1; }
									break;
								case 90: //East
								case 270://West
									//Already facing south
									idle_state = 1;
									break;
								case 180://North
									//Rotate either left or right
									rot_offset = choose(90,270);
									action_points -= 1;
									obj_EnemyControl_B.turn_ap -= 1;
									if action_points < 1 { idle_state = 1; }
									break;
							}
						}
							//Threat is above unit
							//Rotate towards east/west
							else if threat_y < y { 
								switch rot_offset {
									case 0://South
										//Rotate either left or right
										rot_offset = choose(90,270);
										action_points -= 1;
										obj_EnemyControl_B.turn_ap -= 1;
										if action_points < 1 { idle_state = 1; }
										break;
									case 90: //East
									case 270://West
										//Already facing south
										idle_state = 1;
										break;
									case 180://North
										//Rotate either left or right
										rot_offset = choose(90,270);
										action_points -= 1;
										obj_EnemyControl_B.turn_ap -= 1;
										if action_points < 1 { idle_state = 1; }
										break;
								}
							}
					}
						//Threat is in column left of unit
						else if threat_x < x { 
							//Threat is below unit
							//Rotate towards south
							if threat_y > (y+global.cell_size*2) {
								switch rot_offset {
									case 0://South
										//Already facing south
										idle_state = 1;
									case 180://North
										//Rotate facing west
										rot_offset = 270;
										action_points -= 1;
										obj_EnemyControl_B.turn_ap -= 1;
										if action_points < 1 { idle_state = 1; }
										break;
									case 90: //East
									case 270://West
										//Rotate south
										rot_offset = 0;
										action_points -= 1;
										obj_EnemyControl_B.turn_ap -= 1;
										if action_points < 1 { idle_state = 1; }
										break;
								}
							}
								//Threat is above unit
								//Rotate towards north
								else if threat_y < (y-global.cell_size*2) { 
									switch rot_offset {
										case 0://South
											//Rotate facing west
											rot_offset = 270;
											action_points -= 1;
											obj_EnemyControl_B.turn_ap -= 1;
											if action_points < 1 { idle_state = 1; }
										case 180://North
											//Already facing north
											idle_state = 1;
											break;
										case 90: //East
										case 270://West
											//Rotate north
											rot_offset = 180;
											action_points -= 1;
											obj_EnemyControl_B.turn_ap -= 1;
											if action_points < 1 { idle_state = 1; }
											break;
									}
								}
									//Threat is on same row as unit
									//Rotate towards south
									else if threat_y == y {
										switch rot_offset {
											case 0://South
											case 180://North
												//Already facing south/north
												idle_state = 1;
												break;
											case 90: //East
											case 270://West
												//Rotate south
												rot_offset = 0;
												action_points -= 1;
												obj_EnemyControl_B.turn_ap -= 1;
												if action_points < 1 { idle_state = 1; }
												break;
										}
									}
						}
							//Threat is in column right of unit
							else if threat_x > x { 
								//Threat is below unit
								//Rotate towards south
								if threat_y > (y+global.cell_size*2) {
									switch rot_offset {
										case 0://South
											//Already facing south
											idle_state = 1;
										case 180://North
											//Rotate facing east
											rot_offset = 90;
											action_points -= 1;
											obj_EnemyControl_B.turn_ap -= 1;
											if action_points < 1 { idle_state = 1; }
											break;
										case 90: //East
										case 270://West
											//Rotate south
											rot_offset = 0;
											action_points -= 1;
											obj_EnemyControl_B.turn_ap -= 1;
											if action_points < 1 { idle_state = 1; }
											break;
									}
								}
									//Threat is above unit
									//Rotate towards north
									else if threat_y < (y-global.cell_size*2) { 
										switch rot_offset {
											case 0://South
												//Rotate facing east
												rot_offset = 90;
												action_points -= 1;
												obj_EnemyControl_B.turn_ap -= 1;
												if action_points < 1 { idle_state = 1; }
											case 180://North
												//Already facing north
												idle_state = 1;
												break;
											case 90: //East
											case 270://West
												//Rotate south
												rot_offset = 180;
												action_points -= 1;
												obj_EnemyControl_B.turn_ap -= 1;
												if action_points < 1 { idle_state = 1; }
												break;
										}
									}
										//Threat is on same row as unit
										//Rotate towards south
										else if threat_y == y {
											switch rot_offset {
												case 0://North
												case 180://South
													//Already facing north/south
													idle_state = 1;
													break;
												case 90://East
												case 270://East
													//Rotate south
													rot_offset = 0;
													action_points -= 1;
													obj_EnemyControl_B.turn_ap -= 1;
													if action_points < 1 { idle_state = 1; }
													break;
											}
										}
											else { idle_state = 1; }
							}
					break;
			}	
		}

}