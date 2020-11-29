if auto_assign == true {
	auto_assign = false;
	switch formation {
		case 1:
			//Assign formation "ONE" from settings
			if file_exists("formation1.sav") {
				ini_open("formation1.sav");
				//Load formation
				var su;
				su = ini_read_string("ALPHA", "A1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
	
				su = ini_read_string("BRAVO", "B1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
	
				su = ini_read_string("CHARLIE", "C1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
	
				su = ini_read_string("DELTA", "D1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
	
				su = ini_read_string("ECHO", "E1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				
				su = ini_read_string("INF", "I1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				su = ini_read_string("INF", "I2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				su = ini_read_string("INF", "I3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				su = ini_read_string("INF", "I4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				
				su = ini_read_string("MBT", "M1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				su = ini_read_string("MBT", "M2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				su = ini_read_string("MBT", "M3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				su = ini_read_string("MBT", "M4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				
				su = ini_read_string("HMV", "H1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				su = ini_read_string("HMV", "H2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				su = ini_read_string("HMV", "H3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				su = ini_read_string("HMV", "H4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				
				su = ini_read_string("LAV", "V1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				su = ini_read_string("LAV", "V2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				su = ini_read_string("LAV", "V3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				su = ini_read_string("LAV", "V4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				
				su = ini_read_string("LOG", "L1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				su = ini_read_string("LOG", "L2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				su = ini_read_string("LOG", "L3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				su = ini_read_string("LOG", "L4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				ini_close();
			}
			//CALCULATE AMOUNT OF FORMATION POINTS USED\\
			var fp = 0;
			var i;
			var l;
			var v;
			if !ds_list_empty(global.temp_alpha)    {
				l = ds_list_size(global.temp_alpha);
				for(i=0; i<l; i+=1) {
					v = ds_list_find_value(global.temp_alpha, i);
					switch v {
						case "INFANTRY":
							fp += INF_1;
							break;
						case "TANK":
							fp += MBT_1;
							break;
						case "ENGINEER":
							fp += HMV_1;
							break;
						case "BTR":
							fp += LAV_1;
							break;
						case "LOGI":
							fp += LOG_1;
							break;
					}
				}
			}
			if !ds_list_empty(global.temp_bravo)    { 
				l = ds_list_size(global.temp_bravo);
				for(i=0; i<l; i+=1) {
					v = ds_list_find_value(global.temp_bravo, i);
					switch v {
						case "INFANTRY":
							fp += INF_1;
							break;
						case "TANK":
							fp += MBT_1;
							break;
						case "ENGINEER":
							fp += HMV_1;
							break;
						case "BTR":
							fp += LAV_1;
							break;
						case "LOGI":
							fp += LOG_1;
							break;
					}
				}
			}
			if !ds_list_empty(global.temp_charlie)  { 
				l = ds_list_size(global.temp_charlie);
				for(i=0; i<l; i+=1) {
					v = ds_list_find_value(global.temp_charlie, i);
					switch v {
						case "INFANTRY":
							fp += INF_1;
							break;
						case "TANK":
							fp += MBT_1;
							break;
						case "ENGINEER":
							fp += HMV_1;
							break;
						case "BTR":
							fp += LAV_1;
							break;
						case "LOGI":
							fp += LOG_1;
							break;
					}
				}
			}
			if !ds_list_empty(global.temp_delta)    { 
				l = ds_list_size(global.temp_delta);
				for(i=0; i<l; i+=1) {
					v = ds_list_find_value(global.temp_delta, i);
					switch v {
						case "INFANTRY":
							fp += INF_1;
							break;
						case "TANK":
							fp += MBT_1;
							break;
						case "ENGINEER":
							fp += HMV_1;
							break;
						case "BTR":
							fp += LAV_1;
							break;
						case "LOGI":
							fp += LOG_1;
							break;
					}
				}
			}
			if !ds_list_empty(global.temp_echo)     { 
				l = ds_list_size(global.temp_echo);
				for(i=0; i<l; i+=1) {
					v = ds_list_find_value(global.temp_echo, i);
					switch v {
						case "INFANTRY":
							fp += INF_1;
							break;
						case "TANK":
							fp += MBT_1;
							break;
						case "ENGINEER":
							fp += HMV_1;
							break;
						case "BTR":
							fp += LAV_1;
							break;
						case "LOGI":
							fp += LOG_1;
							break;
					}
				}
			}
			if !ds_list_empty(global.temp_infantry) { 
				l = ds_list_size(global.temp_infantry);
				for(i=0; i<l; i+=1) {
					v = ds_list_find_value(global.temp_infantry, i);
					switch v {
						case "INFANTRY":
							fp += INF_1;
							break;
						case "TANK":
							fp += MBT_1;
							break;
						case "ENGINEER":
							fp += HMV_1;
							break;
						case "BTR":
							fp += LAV_1;
							break;
						case "LOGI":
							fp += LOG_1;
							break;
					}
				}
			}
			if !ds_list_empty(global.temp_tank)     { 
				l = ds_list_size(global.temp_tank);
				for(i=0; i<l; i+=1) {
					v = ds_list_find_value(global.temp_tank, i);
					switch v {
						case "INFANTRY":
							fp += INF_1;
							break;
						case "TANK":
							fp += MBT_1;
							break;
						case "ENGINEER":
							fp += HMV_1;
							break;
						case "BTR":
							fp += LAV_1;
							break;
						case "LOGI":
							fp += LOG_1;
							break;
					}
				}
			}
			if !ds_list_empty(global.temp_engineer) { 
				l = ds_list_size(global.temp_engineer);
				for(i=0; i<l; i+=1) {
					v = ds_list_find_value(global.temp_engineer, i);
					switch v {
						case "INFANTRY":
							fp += INF_1;
							break;
						case "TANK":
							fp += MBT_1;
							break;
						case "ENGINEER":
							fp += HMV_1;
							break;
						case "BTR":
							fp += LAV_1;
							break;
						case "LOGI":
							fp += LOG_1;
							break;
					}
				}
			}
			if !ds_list_empty(global.temp_btr)      { 
				l = ds_list_size(global.temp_btr);
				for(i=0; i<l; i+=1) {
					v = ds_list_find_value(global.temp_btr, i);
					switch v {
						case "INFANTRY":
							fp += INF_1;
							break;
						case "TANK":
							fp += MBT_1;
							break;
						case "ENGINEER":
							fp += HMV_1;
							break;
						case "BTR":
							fp += LAV_1;
							break;
						case "LOGI":
							fp += LOG_1;
							break;
					}
				}
			}
			if !ds_list_empty(global.temp_logi)     { 
				l = ds_list_size(global.temp_logi);
				for(i=0; i<l; i+=1) {
					v = ds_list_find_value(global.temp_logi, i);
					switch v {
						case "INFANTRY":
							fp += INF_1;
							break;
						case "TANK":
							fp += MBT_1;
							break;
						case "ENGINEER":
							fp += HMV_1;
							break;
						case "BTR":
							fp += LAV_1;
							break;
						case "LOGI":
							fp += LOG_1;
							break;
					}
				}
			}
			//ADD A CHECK HERE TO ENSURE POINTS USED ARE IN RANGE\\
			formation_points = start_points - fp;
			with obj_SquadAssigner {
				open_slots = 6;
				lpos = -1;
				alarm[0] = 2;
			}
			with obj_ReserveAssigner {
				open_slots = 4;
				lpos = -1;
				alarm[0] = 2;
			}
			break;
		case 2:
			//Assign formation "TWO" from settings
			if file_exists("formation2.sav") {
				ini_open("formation2.sav");
				//Load formation
				var su;
				su = ini_read_string("ALPHA", "A1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
	
				su = ini_read_string("BRAVO", "B1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
	
				su = ini_read_string("CHARLIE", "C1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
	
				su = ini_read_string("DELTA", "D1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
	
				su = ini_read_string("ECHO", "E1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("INF", "I1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				su = ini_read_string("INF", "I2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				su = ini_read_string("INF", "I3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				su = ini_read_string("INF", "I4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				
				su = ini_read_string("MBT", "M1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				su = ini_read_string("MBT", "M2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				su = ini_read_string("MBT", "M3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				su = ini_read_string("MBT", "M4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				
				su = ini_read_string("HMV", "H1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				su = ini_read_string("HMV", "H2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				su = ini_read_string("HMV", "H3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				su = ini_read_string("HMV", "H4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				
				su = ini_read_string("LAV", "V1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				su = ini_read_string("LAV", "V2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				su = ini_read_string("LAV", "V3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				su = ini_read_string("LAV", "V4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				
				su = ini_read_string("LOG", "L1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				su = ini_read_string("LOG", "L2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				su = ini_read_string("LOG", "L3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				su = ini_read_string("LOG", "L4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				ini_close();
			}
			if !ds_list_empty(global.temp_alpha) {
				formation_points = 0;
				with obj_SquadAssigner {
					open_slots = 0;
					lpos = -1;
					alarm[0] = 2;
				}
				with obj_ReserveAssigner {
					open_slots = 0;
					lpos = -1;
					alarm[0] = 2;
				}
			}
				else { formation_points = start_points; }
			break;
		case 3:
			//Assign formation "THREE" from settings
			if file_exists("formation3.sav") {
				ini_open("formation3.sav");
				//Load formation
				var su;
				su = ini_read_string("ALPHA", "A1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
	
				su = ini_read_string("BRAVO", "B1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
	
				su = ini_read_string("CHARLIE", "C1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
	
				su = ini_read_string("DELTA", "D1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
	
				su = ini_read_string("ECHO", "E1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("INF", "I1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				su = ini_read_string("INF", "I2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				su = ini_read_string("INF", "I3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				su = ini_read_string("INF", "I4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				
				su = ini_read_string("MBT", "M1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				su = ini_read_string("MBT", "M2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				su = ini_read_string("MBT", "M3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				su = ini_read_string("MBT", "M4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				
				su = ini_read_string("HMV", "H1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				su = ini_read_string("HMV", "H2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				su = ini_read_string("HMV", "H3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				su = ini_read_string("HMV", "H4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				
				su = ini_read_string("LAV", "V1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				su = ini_read_string("LAV", "V2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				su = ini_read_string("LAV", "V3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				su = ini_read_string("LAV", "V4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				
				su = ini_read_string("LOG", "L1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				su = ini_read_string("LOG", "L2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				su = ini_read_string("LOG", "L3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				su = ini_read_string("LOG", "L4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				ini_close();
			}
			if !ds_list_empty(global.temp_alpha) {
				formation_points = 0;
				with obj_SquadAssigner {
					open_slots = 0;
					lpos = -1;
					alarm[0] = 2;
				}
				with obj_ReserveAssigner {
					open_slots = 0;
					lpos = -1;
					alarm[0] = 2;
				}
			}
				else { formation_points = start_points; }
			break;
		case 4:
			//Assign formation "FOUR" from settings
			if file_exists("formation4.sav") {
				ini_open("formation4.sav");
				//Load formation
				var su;
				su = ini_read_string("ALPHA", "A1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
	
				su = ini_read_string("BRAVO", "B1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
	
				su = ini_read_string("CHARLIE", "C1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
	
				su = ini_read_string("DELTA", "D1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
	
				su = ini_read_string("ECHO", "E1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("INF", "I1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				su = ini_read_string("INF", "I2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				su = ini_read_string("INF", "I3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				su = ini_read_string("INF", "I4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				
				su = ini_read_string("MBT", "M1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				su = ini_read_string("MBT", "M2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				su = ini_read_string("MBT", "M3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				su = ini_read_string("MBT", "M4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				
				su = ini_read_string("HMV", "H1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				su = ini_read_string("HMV", "H2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				su = ini_read_string("HMV", "H3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				su = ini_read_string("HMV", "H4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				
				su = ini_read_string("LAV", "V1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				su = ini_read_string("LAV", "V2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				su = ini_read_string("LAV", "V3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				su = ini_read_string("LAV", "V4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				
				su = ini_read_string("LOG", "L1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				su = ini_read_string("LOG", "L2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				su = ini_read_string("LOG", "L3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				su = ini_read_string("LOG", "L4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				ini_close();
			}
			if !ds_list_empty(global.temp_alpha) {
				formation_points = 0;
				with obj_SquadAssigner {
					open_slots = 0;
					lpos = -1;
					alarm[0] = 2;
				}
				with obj_ReserveAssigner {
					open_slots = 0;
					lpos = -1;
					alarm[0] = 2;
				}
			}
				else { formation_points = start_points; }
			break;
		case 5:
			//Assign formation "FIVE" from settings
			if file_exists("formation5.sav") {
				ini_open("formation5.sav");
				//Load formation
				var su;
				su = ini_read_string("ALPHA", "A1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
				su = ini_read_string("ALPHA", "A6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_alpha, su); }
	
				su = ini_read_string("BRAVO", "B1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
				su = ini_read_string("BRAVO", "B6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_bravo, su); }
	
				su = ini_read_string("CHARLIE", "C1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
				su = ini_read_string("CHARLIE", "C6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_charlie, su); }
	
				su = ini_read_string("DELTA", "D1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
				su = ini_read_string("DELTA", "D6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_delta, su); }
	
				su = ini_read_string("ECHO", "E1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E5", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("ECHO", "E6", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_echo, su); }
				su = ini_read_string("INF", "I1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				su = ini_read_string("INF", "I2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				su = ini_read_string("INF", "I3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				su = ini_read_string("INF", "I4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_infantry, su); }
				
				su = ini_read_string("MBT", "M1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				su = ini_read_string("MBT", "M2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				su = ini_read_string("MBT", "M3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				su = ini_read_string("MBT", "M4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_tank, su); }
				
				su = ini_read_string("HMV", "H1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				su = ini_read_string("HMV", "H2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				su = ini_read_string("HMV", "H3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				su = ini_read_string("HMV", "H4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_engineer, su); }
				
				su = ini_read_string("LAV", "V1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				su = ini_read_string("LAV", "V2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				su = ini_read_string("LAV", "V3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				su = ini_read_string("LAV", "V4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_btr, su); }
				
				su = ini_read_string("LOG", "L1", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				su = ini_read_string("LOG", "L2", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				su = ini_read_string("LOG", "L3", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				su = ini_read_string("LOG", "L4", "NOONE");
				if su != "NOONE" { ds_list_add(global.temp_logi, su); }
				ini_close();
			}
			if !ds_list_empty(global.temp_alpha) {
				formation_points = 0;
				with obj_SquadAssigner {
					open_slots = 0;
					lpos = -1;
					alarm[0] = 2;
				}
				with obj_ReserveAssigner {
					open_slots = 0;
					lpos = -1;
					alarm[0] = 2;
				}
			}
				else { formation_points = start_points; }
			break;
	}
}
		
/*
if clear == true {
    clear = false;
    auto_assign = false;
    ready = false;

    ds_list_clear(selector_list);
    ds_list_add(selector_list, us1.id);
    ds_list_add(selector_list, us2.id);
    ds_list_add(selector_list, us3.id);
    ds_list_add(selector_list, us4.id);
    ds_list_add(selector_list, us5.id);
    
    ds_list_clear(assigner_list);
    ds_list_add(assigner_list, sa1.id);
    ds_list_add(assigner_list, sa2.id);
    ds_list_add(assigner_list, sa3.id);
    ds_list_add(assigner_list, sa4.id);
    ds_list_add(assigner_list, sa5.id);
}

if ready == false {
	if auto_assign == true {
		//Loop thru unit selector and squad assigner lists 
		//First identify available slots in the assigner abjects
		//Place available units into available squad slots
		if !ds_list_empty(selector_list) {
		    var i;
		    var ssize = ds_list_size(selector_list);
		    for(i=0; i<ssize; i+=1;){
		        var u = ds_list_find_value(selector_list, i);
		        if u.unit_amount > 0 {
		            var ii;
		            var asize = ds_list_size(assigner_list);
		            for(ii=0; ii<asize; ii+=1;){ 
		                var a = ds_list_find_value(assigner_list, ii);
		                if a.open_slots >= 1 {
		                    //Assign unit
		                    a.temp_sprite = u.icon_sprite;
		                    a.place_unit  = u.my_unit;
		                    a.selector    = u.id;
		                    break;
		                }
		                    else { ds_list_delete(assigner_list, ii); break; }
		            }
		        }
		            else { ds_list_delete(selector_list, i); break; }
		    }
		}
	}
}
*/


