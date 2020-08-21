if keyboard_check_pressed(ord("3")) { explode_arty1 = true; arty_x = mouse_x; arty_y = mouse_y; }

//Artillery effect emitter
if explode_arty1 == true {
    explode_arty1 = false;
	part_emitter_region(particle_artillery0, explosion0_emitter, arty_x, arty_x, arty_y, arty_y, ps_shape_ellipse, ps_distr_gaussian);
	//Fireball
    part_emitter_burst(particle_artillery0, explosion0_emitter, part1, 1);
	//Line
    part_emitter_burst(particle_artillery0, explosion0_emitter, part2, 18);
    part_emitter_region(particle_artillery1, explosion1_emitter, arty_x, arty_x, arty_y, arty_y, ps_shape_ellipse, ps_distr_invgaussian);
	//Smoke
    part_emitter_burst(particle_artillery1, explosion1_emitter, part3, 8);
	//Shrapnel
	part_emitter_burst(particle_artillery1, explosion1_emitter, part4, 6);
}









