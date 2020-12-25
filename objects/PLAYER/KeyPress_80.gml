/// @description Fullscreen switching

if can_switch == true {
	can_switch = false;
	alarm[0] = 60;
	if fullscreen == false {
		fullscreen = true;
		window_set_fullscreen(true);
	}
		else {
			fullscreen = false;
			window_set_fullscreen(false);
			window_set_size(1280, 720);
		}
}

