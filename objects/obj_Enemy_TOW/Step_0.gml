if action_confirmed == true {
    if shoot_tow == true {
		shoot_tow = false;
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

var d;
if action_confirmed == true || draw_flash == true { 
    d = point_direction(x, y, target_x, target_y)+rot_adj; 
    if turret_rot != d  { turret_rot += (sin(degtorad(turret_rot-d))); }
}


