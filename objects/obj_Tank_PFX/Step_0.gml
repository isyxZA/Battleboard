//Tank effect emitter
if explode_tank1 == true {
    explode_tank1 = false;
	part_emitter_region(particle_tank0, explosion0_emitter, tank_x, tank_x, tank_y, tank_y, ps_shape_ellipse, ps_distr_gaussian);
	//Fireball
    part_emitter_burst(particle_tank0, explosion0_emitter, part1, 1);
	//Line
    part_emitter_burst(particle_tank0, explosion0_emitter, part2, 18);
    part_emitter_region(particle_tank1, explosion1_emitter, tank_x, tank_x, tank_y, tank_y, ps_shape_ellipse, ps_distr_invgaussian);
	//Smoke
    part_emitter_burst(particle_tank1, explosion1_emitter, part3, 8);
	//Shrapnel
	part_emitter_burst(particle_tank1, explosion1_emitter, part4, 6);
}









