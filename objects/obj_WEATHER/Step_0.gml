if fade_in == true {
    global.light_level = ease_inout_sine(timer_count, day_start, day_change, day_duration);
	n_alpha            = ease_inout_sine(timer_count, n_start, -n_change, day_duration);
} 
    else {
        global.light_level = ease_inout_sine(timer_count, day_start, -day_change, day_duration);
		n_alpha            = ease_inout_sine(timer_count, n_start, n_change, day_duration);
    }
   
timer_count++;
        
if (timer_count > day_duration) {
    timer_count = 0;
	day_start   = global.light_level;
	n_start     = n_alpha;
    if fade_in  == true { fade_in = false; } 
        else { fade_in = true; }
}
