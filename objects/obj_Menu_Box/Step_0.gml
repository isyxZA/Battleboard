if place_meeting(x, y, obj_MOUSE) {
	if global.keybind == false {
		if mouse_check_button_pressed(mb_left) {
			popup = true;
			global.keybind = true;
			alarm[1] = 1;
		}
		hint = true;
	}
		else { hint = false; }
}
	else {
		hint = false;
	}

if popup == true {
	var m1 = collision_rectangle(btn_x1, btn_y, btn_x1+btn_w, btn_y+btn_h, obj_MOUSE, false, false);
	var m2 = collision_rectangle(btn_x2, btn_y, btn_x2+btn_w, btn_y+btn_h, obj_MOUSE, false, false);
	
	if mouse_check_button_pressed(mb_left) {
		//Actions to be executed depending on button selection
		if m1 { 
			if key_temp != -1 && txt_temp != "" && txt_temp != "!?" {  
				//Assign key to global
				switch key {
					case "UP":
						global.UP = key_temp;
						scr_KeyText(global.UP, "PERM");
						break;
					case "LEFT":
						global.LEFT = key_temp;
						scr_KeyText(global.LEFT, "PERM");
						break;
					case "RIGHT":
						global.RIGHT = key_temp;
						scr_KeyText(global.RIGHT, "PERM");
						break;
					case "DOWN":
						global.DOWN = key_temp;
						scr_KeyText(global.DOWN, "PERM");
						break;
					case "SCREEN":
						global.SCREEN = key_temp;
						scr_KeyText(global.SCREEN, "PERM");
						break;
					case "GRID":
						global.GRID = key_temp;
						scr_KeyText(global.GRID, "PERM");
						break;
					case "HINTS":
						global.HINTS = key_temp;
						scr_KeyText(global.HINTS, "PERM");
						break;
					case "TERRAIN":
						global.TERRAIN = key_temp;
						scr_KeyText(global.TERRAIN, "PERM");
						break;
					case "SUPPLY":
						global.SUPPLY = key_temp;
						scr_KeyText(global.SUPPLY, "PERM");
						break;
					case "RANGE":
						global.RANGE = key_temp;
						scr_KeyText(global.RANGE, "PERM");
						break;
					case "VISIBILITY":
						global.VISIBILITY = key_temp;
						scr_KeyText(global.VISIBILITY, "PERM");
						break;
					case "LSHIFT":
						global.LSHIFT = key_temp;
						scr_KeyText(global.LSHIFT, "PERM");
						break;
					case "RSHIFT":
						global.RSHIFT = key_temp;
						scr_KeyText(global.RSHIFT, "PERM");
						break;
					case "STATS":
						global.STATS = key_temp;
						scr_KeyText(global.STATS, "PERM");
						break;
					case "ESCAPE":
						global.ESCAPE = key_temp;
						scr_KeyText(global.ESCAPE, "PERM");
						break;
					case "MMOUSE":
						global.MMOUSE = key_temp;
						scr_KeyText(global.MMOUSE, "PERM");
						break;
					case "LMOUSE":
						global.LMOUSE = key_temp;
						scr_KeyText(global.LMOUSE, "PERM");
						break;
					case "RMOUSE":
						global.RMOUSE = key_temp;
						scr_KeyText(global.RMOUSE, "PERM");
						break;
					case "INCREASE":
						global.INCREASE = key_temp;
						scr_KeyText(global.INCREASE, "PERM");
						break;
					case "DECREASE":
						global.DECREASE = key_temp;
						scr_KeyText(global.DECREASE, "PERM");
						break;
					case "TURNEND":
						global.TURNEND = key_temp;
						scr_KeyText(global.TURNEND, "PERM");
						break;
					case "OBJECTIVES":
						global.OBJECTIVES = key_temp;
						scr_KeyText(global.OBJECTIVES, "PERM");
						break;
					case "CANCEL":
						global.CANCEL = key_temp;
						scr_KeyText(global.CANCEL, "PERM");
						break;
					case "MOVE":
						global.MOVE = key_temp;
						scr_KeyText(global.MOVE, "PERM");
						break;
					case "SHOOT":
						global.SHOOT = key_temp;
						scr_KeyText(global.SHOOT, "PERM");
						break;
				}
				//Find and remove any duplicate assignments
				var myID = id;
				with obj_Menu_Box {
					if self.id != myID {
						switch key {
							case "UP":
								if global.UP == other.key_temp { global.UP = -1; txt = "!?"; }
								break;
							case "LEFT":
								if global.LEFT == other.key_temp { global.LEFT = -1; txt = "!?"; }
								break;
							case "RIGHT":
								if global.RIGHT == other.key_temp { global.RIGHT = -1; txt = "!?"; }
								break;
							case "DOWN":
								if global.DOWN == other.key_temp { global.DOWN = -1; txt = "!?"; }
								break;
							case "SCREEN":
								if global.SCREEN == other.key_temp { global.SCREEN = -1; txt = "!?"; }
								break;
							case "GRID":
								if global.GRID == other.key_temp { global.GRID = -1; txt = "!?"; }
								break;
							case "HINTS":
								if global.HINTS == other.key_temp { global.HINTS = -1; txt = "!?"; }
								break;
							case "TERRAIN":
								if global.TERRAIN == other.key_temp { global.TERRAIN = -1; txt = "!?"; }
								break;
							case "SUPPLY":
								if global.SUPPLY == other.key_temp { global.SUPPLY = -1; txt = "!?"; }
								break;
							case "RANGE":
								if global.RANGE == other.key_temp { global.RANGE = -1; txt = "!?"; }
								break;
							case "VISIBILITY":
								if global.VISIBILITY == other.key_temp { global.VISIBILITY = -1; txt = "!?"; }
								break;
							case "LSHIFT":
								if global.LSHIFT == other.key_temp { global.LSHIFT = -1; txt = "!?"; }
								break;
							case "RSHIFT":
								if global.RSHIFT == other.key_temp { global.RSHIFT = -1; txt = "!?"; }
								break;
							case "STATS":
								if global.STATS == other.key_temp { global.STATS = -1; txt = "!?"; }
								break;
							case "ESCAPE":
								if global.ESCAPE == other.key_temp { global.ESCAPE = -1; txt = "!?"; }
								break;
							case "MMOUSE":
								if global.MMOUSE == other.key_temp { global.MMOUSE = -1; txt = "!?"; }
								break;
							case "LMOUSE":
								if global.LMOUSE == other.key_temp { global.LMOUSE = -1; txt = "!?"; }
								break;
							case "RMOUSE":
								if global.RMOUSE == other.key_temp { global.RMOUSE = -1; txt = "!?"; }
								break;
							case "INCREASE":
								if global.INCREASE == other.key_temp { global.INCREASE = -1; txt = "!?"; }
								break;
							case "DECREASE":
								if global.DECREASE == other.key_temp { global.DECREASE = -1; txt = "!?"; }
								break;
							case "TURNEND":
								if global.TURNEND == other.key_temp { global.TURNEND = -1; txt = "!?"; }
								break;
							case "OBJECTIVES":
								if global.OBJECTIVES == other.key_temp { global.OBJECTIVES = -1; txt = "!?"; }
								break;
							case "CANCEL":
								if global.CANCEL == other.key_temp { global.CANCEL = -1; txt = "!?"; }
								break;
							case "MOVE":
								if global.MOVE == other.key_temp { global.MOVE = -1; txt = "!?"; }
								break;
							case "SHOOT":
								if global.SHOOT == other.key_temp { global.SHOOT = -1; txt = "!?"; }
								break;
						}
					}
				}
			}
			popup = false;
			key_temp = -1;
			txt_temp = "--";
			global.keybind = false;
		}
			else if m2 { 
				popup = false;
				key_temp = -1;
				txt_temp = "--";
				global.keybind = false;
			}
	}
	
	if global.keybind == true && can_click == true {
		if key != "LMOUSE" && key != "RMOUSE" && key != "MMOUSE" {
			if keyboard_check_pressed(vk_anykey) {
				//Check for a valid keypress
				if keyboard_lastkey != -1 {
					//Store the last key press
					key_temp = keyboard_lastkey;
					//Find and set the correct temp text
					scr_KeyText(key_temp, "TEMP");
					//Reset last key press
					keyboard_lastkey = -1;
				}
			}
		}
			else {
				if mouse_check_button_pressed(mb_any) {
					if mouse_lastbutton != 0 {
						//Store the last key press
						key_temp = mouse_lastbutton;
						//Find and set the correct temp text
						scr_KeyText(key_temp, "TEMP");
					}
				}
			}
	}
}
	else { 
		if can_click == true { can_click = false; }
	}

