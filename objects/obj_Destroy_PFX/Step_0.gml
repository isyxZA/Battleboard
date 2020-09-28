if explode_tank == true {
	explode_tank = false;
	part_emitter_region(ps, pe_Effect4, xp+0, xp+0, yp+0, yp+0, ps_shape_ellipse, ps_distr_linear);
	part_emitter_burst(ps, pe_Effect4, pt_Effect4, 6);
	part_emitter_region(ps, pe_Effect3, xp-2, xp+2, yp-2, yp+2, ps_shape_ellipse, ps_distr_invgaussian);
	part_emitter_burst(ps, pe_Effect3, pt_Effect3, 12);
	part_emitter_region(ps, pe_Effect2, xp-8, xp+8, yp-8, yp+8, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(ps, pe_Effect2, pt_Effect2, 32);
	part_emitter_region(ps, pe_Effect1, xp-1, xp+1, yp-1, yp+1, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(ps, pe_Effect1, pt_Effect1, 1);
}

if explode_btr == true {
	explode_btr = false;
	part_emitter_region(ps, pe_Effect4, xp+0, xp+0, yp+0, yp+0, ps_shape_ellipse, ps_distr_linear);
	part_emitter_burst(ps, pe_Effect4, pt_Effect4, 6);
	part_emitter_region(ps, pe_Effect3, xp-2, xp+2, yp-2, yp+2, ps_shape_ellipse, ps_distr_invgaussian);
	part_emitter_burst(ps, pe_Effect3, pt_Effect3, 12);
	part_emitter_region(ps, pe_Effect2, xp-8, xp+8, yp-8, yp+8, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(ps, pe_Effect2, pt_Effect2, 32);
	part_emitter_region(ps, pe_Effect1, xp-1, xp+1, yp-1, yp+1, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(ps, pe_Effect1, pt_Effect1a, 1);
}

if explode_engineer == true {
	explode_engineer = false;
	part_emitter_region(ps, pe_Effect4, xp+0, xp+0, yp+0, yp+0, ps_shape_ellipse, ps_distr_linear);
	part_emitter_burst(ps, pe_Effect4, pt_Effect4, 6);
	part_emitter_region(ps, pe_Effect3, xp-2, xp+2, yp-2, yp+2, ps_shape_ellipse, ps_distr_invgaussian);
	part_emitter_burst(ps, pe_Effect3, pt_Effect3, 12);
	part_emitter_region(ps, pe_Effect2, xp-8, xp+8, yp-8, yp+8, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(ps, pe_Effect2, pt_Effect2, 32);
	part_emitter_region(ps, pe_Effect1, xp-1, xp+1, yp-1, yp+1, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(ps, pe_Effect1, pt_Effect1b, 1);
}

if explode_logi == true {
	explode_logi = false;
	part_emitter_region(ps, pe_Effect4, xp+0, xp+0, yp+0, yp+0, ps_shape_ellipse, ps_distr_linear);
	part_emitter_burst(ps, pe_Effect4, pt_Effect4, 6);
	part_emitter_region(ps, pe_Effect3, xp-2, xp+2, yp-2, yp+2, ps_shape_ellipse, ps_distr_invgaussian);
	part_emitter_burst(ps, pe_Effect3, pt_Effect3, 12);
	part_emitter_region(ps, pe_Effect2, xp-8, xp+8, yp-8, yp+8, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(ps, pe_Effect2, pt_Effect2, 32);
	part_emitter_region(ps, pe_Effect1, xp-1, xp+1, yp-1, yp+1, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(ps, pe_Effect1, pt_Effect1c, 1);
}

if explode_static == true {
	explode_static = false;
	part_emitter_region(ps, pe_Effect4, xp+0, xp+0, yp+0, yp+0, ps_shape_ellipse, ps_distr_linear);
	part_emitter_burst(ps, pe_Effect4, pt_Effect4, 6);
	part_emitter_region(ps, pe_Effect3, xp-2, xp+2, yp-2, yp+2, ps_shape_ellipse, ps_distr_invgaussian);
	part_emitter_burst(ps, pe_Effect3, pt_Effect3, 12);
	part_emitter_region(ps, pe_Effect2, xp-8, xp+8, yp-8, yp+8, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(ps, pe_Effect2, pt_Effect2, 32);
	part_emitter_region(ps, pe_Effect1, xp-1, xp+1, yp-1, yp+1, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(ps, pe_Effect1, pt_Effect1d, 1);
}