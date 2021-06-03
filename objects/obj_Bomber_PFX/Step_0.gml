if keyboard_check_pressed(ord("1")) { explode_bomb1 = true; bomb_x = mouse_x; bomb_y = mouse_y; }

//Bomb effect emitter
if explode_bomb1 == true {
    explode_bomb1 = false;
    part_emitter_region(particle_bomber0, explosion0_emitter, bomb_x, bomb_x, bomb_y, bomb_y, ps_shape_ellipse, ps_distr_gaussian);
	//Fireball
    part_emitter_burst(particle_bomber0, explosion0_emitter, part1, 1);
	//Line
    part_emitter_burst(particle_bomber0, explosion0_emitter, part2, 16);
    part_emitter_region(particle_bomber1, explosion1_emitter, bomb_x, bomb_x, bomb_y, bomb_y, ps_shape_ellipse, ps_distr_invgaussian);
	//Smoke
    part_emitter_burst(particle_bomber1, explosion1_emitter, part3, 60);
	//Shrapnel
    part_emitter_burst(particle_bomber1, explosion1_emitter, part4, 20);
}







