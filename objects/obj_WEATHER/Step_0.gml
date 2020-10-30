if fade_in == true {
    global.light_level = ease_linear(timer_count, day_start, day_change, day_duration);
	hour               = ease_linear(timer_count, h_start, h_change, day_duration);
} 
    else {
        global.light_level = ease_linear(timer_count, day_start, -day_change, day_duration);
		hour               = ease_linear(timer_count, h_start, h_change, day_duration);
    }
   
timer_count++;
        
if (timer_count > day_duration) {
    timer_count = 0;
	day_start   = global.light_level;
    if fade_in  == true { fade_in = false; hour = 12; h_start = hour;  } 
        else { fade_in = true; hour = 0; h_start = hour; }
}

//Game Hue Control
var hr = floor(hour)
if hr == 19 && n_trigger    == false { n_trigger    = true; }
if hr == 17 && set_trigger  == false { set_trigger  = true; }
if hr == 5  && rise_trigger == false { rise_trigger = true; }

if n_trigger == true {
	n_count ++;
	if n_count >= n_duration { 
		if n_fade_in == true {
			n_count = 0; 
			n_fade_in = false; 
			n_start  = n_alpha;
			n_alpha  = n_start;
			n_duration = 18000;
		}
			else {
				n_trigger = false; 
				n_count = 0; 
				n_fade_in = true; 
				n_start  = 0;
				n_alpha  = n_start;
				n_duration = 12000;
			}
	}
	if n_fade_in == true {
		//Begin fading in night hue at 19h00
		n_alpha  = ease_linear(n_count, n_start, n_change, n_duration);
	}
		else {
			//Begin fading out night hue at 05h00
			n_alpha  = ease_in_expo(n_count, n_start, -n_change , n_duration);
		}
}

if set_trigger == true {
	set_count ++;
	if set_count >= set_duration { 
		if set_fade_in == true {
			set_count   = 0; 
			set_fade_in = false; 
			set_start   = set_alpha;
			set_alpha   = set_start;
		}
			else {
				set_trigger = false; 
				set_count = 0; 
				set_fade_in = true; 
				set_start  = 0;
				set_alpha  = set_start;
			}
	}
	if set_fade_in == true {
		//Begin fading in sunset hue at 17h00
		set_alpha  = ease_linear(set_count, set_start, set_change, set_duration);
	}
		else {
			//Begin fading out sunset hue at 19h00
			set_alpha  = ease_linear(set_count, set_start, -set_change , set_duration);
		}
}

if rise_trigger == true {
	rise_count ++;
	if rise_count >= rise_duration { 
		if rise_fade_in == true {
			rise_count   = 0; 
			rise_fade_in = false; 
			rise_start   = rise_alpha;
			rise_alpha   = rise_start;
			rise_duration = 4000;
		}
			else {
				rise_trigger = false; 
				rise_count   = 0; 
				rise_fade_in = true; 
				rise_start   = 0;
				rise_alpha   = rise_start;
				rise_duration = 6000;
			}
	}
	if rise_fade_in == true {
		//Begin fading in sunrise hue at 05h00
		rise_alpha  = ease_linear(rise_count, rise_start, rise_change, rise_duration);
	}
		else {
			//Begin fading out sunrise hue at 07h00
			rise_alpha  = ease_linear(rise_count, rise_start, -rise_change , rise_duration);
		}
}