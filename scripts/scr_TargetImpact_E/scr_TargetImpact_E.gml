function scr_TargetImpact_E() {
	
	var bdir = round(point_direction(target_x, target_y, x, y));
	var ftgt = instance_place(target_x, target_y, obj_Unit_Parent);
	var etgt = instance_place(target_x, target_y, obj_Enemy_Parent);
	var toff;
	if ftgt != noone { toff = ftgt.rot_offset; }
		else if etgt != noone { toff = etgt.rot_offset;  }
			else { toff = 0;  }
	if p_one == false {
		//Rear hit
		if bdir >= 30 && bdir <= 150 { 
			//Adjust for target rotation
			switch toff {
				case 0:
					target_impact = "REAR"; 
					break;
				case 90:
					target_impact = "LSIDE"; 
					break;
				case 180:
					target_impact = "FRONT"; 
					break;
				case 270:
					target_impact = "RSIDE"; 
					break;
			}
		}
			//Right side hit
			else if bdir > 150 && bdir < 210 { 
				switch toff {
					case 0:
						target_impact = "RSIDE"; 
						break;
					case 90:
						target_impact = "REAR"; 
						break;
					case 180:
						target_impact = "LSIDE"; 
						break;
					case 270:
						target_impact = "FRONT"; 
						break;
				} 
			}
				//Front hit
				else if bdir >= 210 && bdir <= 330 { 
					switch toff {
						case 0:
							target_impact = "FRONT"; 
							break;
						case 90:
							target_impact = "RSIDE"; 
							break;
						case 180:
							target_impact = "REAR"; 
							break;
						case 270:
							target_impact = "LSIDE"; 
							break;
					}  
				}
					//Left side hit
					else { 
						switch toff {
							case 0:
								target_impact = "LSIDE"; 
								break;
							case 90:
								target_impact = "FRONT"; 
								break;
							case 180:
								target_impact = "RSIDE"; 
								break;
							case 270:
								target_impact = "REAR"; 
								break;
						} 
					}
	}
		//As player two
		else {
			if bdir >= 30 && bdir <= 150 { 
				switch toff {
					case 0:
						target_impact = "FRONT"; 
						break;
					case 90:
						target_impact = "RSIDE"; 
						break;
					case 180:
						target_impact = "REAR"; 
						break;
					case 270:
						target_impact = "LSIDE"; 
						break;
				} 
			}
				else if bdir > 150 && bdir < 210 {
					switch toff {
						case 0:
							target_impact = "LSIDE"; 
							break;
						case 90:
							target_impact = "FRONT"; 
							break;
						case 180:
							target_impact = "RSIDE"; 
							break;
						case 270:
							target_impact = "REAR"; 
							break;
					} 
				}
					else if bdir >= 210 && bdir <= 330 { 
						switch toff {
							case 0:
								target_impact = "REAR"; 
								break;
							case 90:
								target_impact = "LSIDE"; 
								break;
							case 180:
								target_impact = "FRONT"; 
								break;
							case 270:
								target_impact = "RSIDE"; 
								break;
						}  
					}
						else { 
							switch toff {
								case 0:
									target_impact = "RSIDE"; 
									break;
								case 90:
									target_impact = "REAR"; 
									break;
								case 180:
									target_impact = "LSIDE"; 
									break;
								case 270:
									target_impact = "FRONT"; 
									break;
							} 
						}
		}

}