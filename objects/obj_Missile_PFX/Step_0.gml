if keyboard_check_pressed(ord("2")) { explode_missile1 = true; missile_x = mouse_x; missile_y = mouse_y; }

//Missile effect emitter
if explode_missile1 == true {
    explode_missile1 = false;
	
    part_emitter_region(particle_missile0, explosion0_emitter, missile_x, missile_x, missile_y, missile_y, ps_shape_ellipse, ps_distr_gaussian);
	//Fireball
    part_emitter_burst(particle_missile0, explosion0_emitter, part1, 1);
	//Line
    part_emitter_burst(particle_missile0, explosion0_emitter, part2, 6);
	
    part_emitter_region(particle_missile1, explosion1_emitter, missile_x, missile_x, missile_y, missile_y, ps_shape_ellipse, ps_distr_invgaussian);
	//Smoke
    part_emitter_burst(particle_missile1, explosion1_emitter, part3, 12);
	//Shrapnel
    part_emitter_burst(particle_missile1, explosion1_emitter, part4, 24);
}







