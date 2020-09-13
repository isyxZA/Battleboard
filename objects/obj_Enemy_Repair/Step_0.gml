if action_confirmed == true {
    if shoot_mg == true {
	    shoot_mg = false;
	    timer_target = 3;
	    timer_count = timer_target;
	    timer_start = true;
	    shoot_amount -= 1;
    }
        else if shoot_repair == true { 
            shoot_repair = false;
            timer_target = 3;
            timer_count = timer_target;
            timer_start = true;
            shoot_amount -= 1;
        }
}

if timer_start == true {
    timer_start = false;
    alarm[2] = global.tick_rate;
}