with obj_Tank_Unit {
		if unit_health < 100 {
			var pfx1;
			var pfx2;
			var pnum1;
			var pnum2;
			if unit_health <= 25 {
				pfx1 = part3;
				pfx2 = part1;
				pnum1 = -20;
				pnum2 = -6;
			}
				else if unit_health <= 50 {
					pfx1 = part3;
					pfx2 = part1;
					pnum1 = -75;
					pnum2 = -20;
				}
					else if unit_health <= 75 {
						pfx1 = part1;
						pfx2 = part2;
						pnum1 = -20;
						pnum2 = -50;
					}
						else {
							pfx1 = part1;
							pfx2 = part2;
							pnum1 = -75;
							pnum2 = -500;
						}
			
			part_emitter_region(particle_tank0, tank0_emitter, x_final-4, x_final+4, y_final+18, y_final+20, ps_shape_ellipse, ps_distr_invgaussian);
			//Smoke
			part_emitter_stream(particle_tank0, tank0_emitter, pfx1, pnum1);
			
			part_emitter_region(particle_tank1, tank1_emitter, x_final-8, x_final+8, y_final+20, y_final+24, ps_shape_ellipse, ps_distr_invgaussian);
			//Sparks
			part_emitter_stream(particle_tank1, tank1_emitter, pfx2, pnum2);
		}
}

with obj_Engineer_Unit {
		if unit_health < 100 {
			var pfx1;
			var pfx2;
			var pnum1;
			var pnum2;
			if unit_health <= 25 {
				pfx1 = part3;
				pfx2 = part1;
				pnum1 = -20;
				pnum2 = -6;
			}
				else if unit_health <= 50 {
					pfx1 = part3;
					pfx2 = part1;
					pnum1 = -75;
					pnum2 = -20;
				}
					else if unit_health <= 75 {
						pfx1 = part1;
						pfx2 = part2;
						pnum1 = -20;
						pnum2 = -50;
					}
						else {
							pfx1 = part1;
							pfx2 = part2;
							pnum1 = -75;
							pnum2 = -500;
						}
			
			part_emitter_region(particle_eng0, eng0_emitter, x_final-4, x_final+4, y_final-10, y_final-14, ps_shape_ellipse, ps_distr_invgaussian);
			//Smoke
			part_emitter_stream(particle_eng0, eng0_emitter, pfx1, pnum1);
			
			part_emitter_region(particle_eng1, eng1_emitter, x_final-8, x_final+8, y_final-14, y_final-10, ps_shape_ellipse, ps_distr_invgaussian);
			//Sparks
			part_emitter_stream(particle_eng1, eng1_emitter, pfx2, pnum2);
		}
}

with obj_BTR_Unit {
		if unit_health < 100 {
			var pfx1;
			var pfx2;
			var pnum1;
			var pnum2;
			if unit_health <= 25 {
				pfx1 = part3;
				pfx2 = part1;
				pnum1 = -15;
				pnum2 = -5;
			}
				else if unit_health <= 50 {
					pfx1 = part3;
					pfx2 = part1;
					pnum1 = -50;
					pnum2 = -10;
				}
					else if unit_health <= 75 {
						pfx1 = part1;
						pfx2 = part2;
						pnum1 = -20;
						pnum2 = -50;
					}
						else {
							pfx1 = part1;
							pfx2 = part2;
							pnum1 = -50;
							pnum2 = -250;
						}
			
			part_emitter_region(particle_btr0, btr0_emitter, x_final+4, x_final+12, y_final-14, y_final-16, ps_shape_ellipse, ps_distr_invgaussian);
			//Smoke
			part_emitter_stream(particle_btr0, btr0_emitter, pfx1, pnum1);
			
			part_emitter_region(particle_btr1, btr1_emitter, x_final+6, x_final+10, y_final-14, y_final-16, ps_shape_ellipse, ps_distr_invgaussian);
			//Sparks
			part_emitter_stream(particle_btr1, btr1_emitter, pfx2, pnum2);
		}
}

with obj_Logi_Unit {
		if unit_health < 100 {
			var pfx1;
			var pfx2;
			var pnum1;
			var pnum2;
			if unit_health <= 25 {
				pfx1 = part3;
				pfx2 = part1;
				pnum1 = -50;
				pnum2 = -10;
			}
				else if unit_health <= 50 {
					pfx1 = part3;
					pfx2 = part1;
					pnum1 = -75;
					pnum2 = -25;
				}
					else if unit_health <= 75 {
						pfx1 = part3;
						pfx2 = part1;
						pnum1 = -100;
						pnum2 = -50;
					}
						else {
							pfx1 = part2;
							pfx2 = part1;
							pnum1 = -200;
							pnum2 = -100;
						}
			
			part_emitter_region(particle_logi0, logi0_emitter, x_final-2, x_final+2, y_final+4, y_final+10, ps_shape_ellipse, ps_distr_invgaussian);
			//Smoke
			part_emitter_stream(particle_logi0, logi0_emitter, pfx1, pnum1);
			
			part_emitter_region(particle_logi1, logi1_emitter, x_final-2, x_final+2, y_final+4, y_final+10, ps_shape_ellipse, ps_distr_invgaussian);
			//Sparks
			part_emitter_stream(particle_logi1, logi1_emitter, pfx2, pnum2);
		}
}

with obj_Depot_Static {
		if unit_health < 100 {
			var pfx1;
			var pfx2;
			var pnum1;
			var pnum2;
			if unit_health <= 25 {
				pfx1 = part3;
				pfx2 = part1;
				pnum1 = -50;
				pnum2 = -10;
			}
				else if unit_health <= 50 {
					pfx1 = part3;
					pfx2 = part1;
					pnum1 = -75;
					pnum2 = -25;
				}
					else if unit_health <= 75 {
						pfx1 = part3;
						pfx2 = part1;
						pnum1 = -100;
						pnum2 = -50;
					}
						else {
							pfx1 = part2;
							pfx2 = part1;
							pnum1 = -200;
							pnum2 = -100;
						}
			
			part_emitter_region(particle_dep0, dep0_emitter, x, x, y, y, ps_shape_ellipse, ps_distr_invgaussian);
			//Smoke
			part_emitter_stream(particle_dep0, dep0_emitter, pfx1, pnum1);
			
			part_emitter_region(particle_dep1, dep1_emitter, x, x, y, y, ps_shape_ellipse, ps_distr_invgaussian);
			//Sparks
			part_emitter_stream(particle_dep1, dep1_emitter, pfx2, pnum2);
		}
}

with obj_Repair_Static {
		if unit_health < 100 {
			var pfx1;
			var pfx2;
			var pnum1;
			var pnum2;
			if unit_health <= 25 {
				pfx1 = part3;
				pfx2 = part1;
				pnum1 = -50;
				pnum2 = -10;
			}
				else if unit_health <= 50 {
					pfx1 = part3;
					pfx2 = part1;
					pnum1 = -75;
					pnum2 = -25;
				}
					else if unit_health <= 75 {
						pfx1 = part3;
						pfx2 = part1;
						pnum1 = -100;
						pnum2 = -50;
					}
						else {
							pfx1 = part2;
							pfx2 = part1;
							pnum1 = -200;
							pnum2 = -100;
						}
			
			part_emitter_region(particle_rpr0, rpr0_emitter, x, x, y, y, ps_shape_ellipse, ps_distr_invgaussian);
			//Smoke
			part_emitter_stream(particle_rpr0, rpr0_emitter, pfx1, pnum1);
			
			part_emitter_region(particle_rpr1, rpr1_emitter, x, x, y, y, ps_shape_ellipse, ps_distr_invgaussian);
			//Sparks
			part_emitter_stream(particle_rpr1, rpr1_emitter, pfx2, pnum2);
		}
}

with obj_Mortar_Static {
		if unit_health < 100 {
			var pfx1;
			var pfx2;
			var pnum1;
			var pnum2;
			if unit_health <= 25 {
				pfx1 = part3;
				pfx2 = part1;
				pnum1 = -50;
				pnum2 = -10;
			}
				else if unit_health <= 50 {
					pfx1 = part3;
					pfx2 = part1;
					pnum1 = -75;
					pnum2 = -25;
				}
					else if unit_health <= 75 {
						pfx1 = part3;
						pfx2 = part1;
						pnum1 = -100;
						pnum2 = -50;
					}
						else {
							pfx1 = part2;
							pfx2 = part1;
							pnum1 = -200;
							pnum2 = -100;
						}
			
			part_emitter_region(particle_mort0, mort0_emitter, x, x, y, y, ps_shape_ellipse, ps_distr_invgaussian);
			//Smoke
			part_emitter_stream(particle_mort0, mort0_emitter, pfx1, pnum1);
			
			part_emitter_region(particle_mort1, mort1_emitter, x, x, y, y, ps_shape_ellipse, ps_distr_invgaussian);
			//Sparks
			part_emitter_stream(particle_mort1, mort1_emitter, pfx2, pnum2);
		}
}

with obj_TOW_Static {
		if unit_health < 100 {
			var pfx1;
			var pfx2;
			var pnum1;
			var pnum2;
			if unit_health <= 25 {
				pfx1 = part3;
				pfx2 = part1;
				pnum1 = -50;
				pnum2 = -10;
			}
				else if unit_health <= 50 {
					pfx1 = part3;
					pfx2 = part1;
					pnum1 = -75;
					pnum2 = -25;
				}
					else if unit_health <= 75 {
						pfx1 = part3;
						pfx2 = part1;
						pnum1 = -100;
						pnum2 = -50;
					}
						else {
							pfx1 = part2;
							pfx2 = part1;
							pnum1 = -200;
							pnum2 = -100;
						}
			
			part_emitter_region(particle_tow0, tow0_emitter, x, x, y, y, ps_shape_ellipse, ps_distr_invgaussian);
			//Smoke
			part_emitter_stream(particle_tow0, tow0_emitter, pfx1, pnum1);
			
			part_emitter_region(particle_tow1, tow1_emitter, x, x, y, y, ps_shape_ellipse, ps_distr_invgaussian);
			//Sparks
			part_emitter_stream(particle_tow1, tow1_emitter, pfx2, pnum2);
		}
}

with obj_Enemy_Tank {
		if unit_health < 100 {
			var pfx1;
			var pfx2;
			var pnum1;
			var pnum2;
			if unit_health <= 25 {
				pfx1 = part3;
				pfx2 = part1;
				pnum1 = -20;
				pnum2 = -6;
			}
				else if unit_health <= 50 {
					pfx1 = part3;
					pfx2 = part1;
					pnum1 = -75;
					pnum2 = -20;
				}
					else if unit_health <= 75 {
						pfx1 = part1;
						pfx2 = part2;
						pnum1 = -20;
						pnum2 = -50;
					}
						else {
							pfx1 = part1;
							pfx2 = part2;
							pnum1 = -75;
							pnum2 = -500;
						}
			
			part_emitter_region(particle_tank0, tank0_emitter, x_final-4, x_final+4, y_final-18, y_final-20, ps_shape_ellipse, ps_distr_invgaussian);
			//Smoke
			part_emitter_stream(particle_tank0, tank0_emitter, pfx1, pnum1);
			
			part_emitter_region(particle_tank1, tank1_emitter, x_final-8, x_final+8, y_final-20, y_final-24, ps_shape_ellipse, ps_distr_invgaussian);
			//Sparks
			part_emitter_stream(particle_tank1, tank1_emitter, pfx2, pnum2);
		}
}

with obj_Enemy_Engineer {
		if unit_health < 100 {
			var pfx1;
			var pfx2;
			var pnum1;
			var pnum2;
			if unit_health <= 25 {
				pfx1 = part3;
				pfx2 = part1;
				pnum1 = -20;
				pnum2 = -6;
			}
				else if unit_health <= 50 {
					pfx1 = part3;
					pfx2 = part1;
					pnum1 = -75;
					pnum2 = -20;
				}
					else if unit_health <= 75 {
						pfx1 = part1;
						pfx2 = part2;
						pnum1 = -20;
						pnum2 = -50;
					}
						else {
							pfx1 = part1;
							pfx2 = part2;
							pnum1 = -75;
							pnum2 = -500;
						}
			
			part_emitter_region(particle_eng0, eng0_emitter, x_final-4, x_final+4, y_final+10, y_final+14, ps_shape_ellipse, ps_distr_invgaussian);
			//Smoke
			part_emitter_stream(particle_eng0, eng0_emitter, pfx1, pnum1);
			
			part_emitter_region(particle_eng1, eng1_emitter, x_final-8, x_final+8, y_final+14, y_final+10, ps_shape_ellipse, ps_distr_invgaussian);
			//Sparks
			part_emitter_stream(particle_eng1, eng1_emitter, pfx2, pnum2);
		}
}

with obj_Enemy_BTR {
		if unit_health < 100 {
			var pfx1;
			var pfx2;
			var pnum1;
			var pnum2;
			if unit_health <= 25 {
				pfx1 = part3;
				pfx2 = part1;
				pnum1 = -15;
				pnum2 = -5;
			}
				else if unit_health <= 50 {
					pfx1 = part3;
					pfx2 = part1;
					pnum1 = -50;
					pnum2 = -10;
				}
					else if unit_health <= 75 {
						pfx1 = part1;
						pfx2 = part2;
						pnum1 = -20;
						pnum2 = -50;
					}
						else {
							pfx1 = part1;
							pfx2 = part2;
							pnum1 = -50;
							pnum2 = -250;
						}
			
			part_emitter_region(particle_btr0, btr0_emitter, x_final-2, x_final+2, y_final-4, y_final-6, ps_shape_ellipse, ps_distr_invgaussian);
			//Smoke
			part_emitter_stream(particle_btr0, btr0_emitter, pfx1, pnum1);
			
			part_emitter_region(particle_btr1, btr1_emitter, x_final-2, x_final+2, y_final-4, y_final-6, ps_shape_ellipse, ps_distr_invgaussian);
			//Sparks
			part_emitter_stream(particle_btr1, btr1_emitter, pfx2, pnum2);
		}
}

with obj_Enemy_Logi {
		if unit_health < 100 {
			var pfx1;
			var pfx2;
			var pnum1;
			var pnum2;
			if unit_health <= 25 {
				pfx1 = part3;
				pfx2 = part1;
				pnum1 = -50;
				pnum2 = -10;
			}
				else if unit_health <= 50 {
					pfx1 = part3;
					pfx2 = part1;
					pnum1 = -75;
					pnum2 = -25;
				}
					else if unit_health <= 75 {
						pfx1 = part3;
						pfx2 = part1;
						pnum1 = -100;
						pnum2 = -50;
					}
						else {
							pfx1 = part2;
							pfx2 = part1;
							pnum1 = -200;
							pnum2 = -100;
						}
			
			part_emitter_region(particle_logi0, logi0_emitter, x_final-2, x_final+2, y_final-4, y_final-10, ps_shape_ellipse, ps_distr_invgaussian);
			//Smoke
			part_emitter_stream(particle_logi0, logi0_emitter, pfx1, pnum1);
			
			part_emitter_region(particle_logi1, logi1_emitter, x_final-2, x_final+2, y_final-4, y_final-10, ps_shape_ellipse, ps_distr_invgaussian);
			//Sparks
			part_emitter_stream(particle_logi1, logi1_emitter, pfx2, pnum2);
		}
}
