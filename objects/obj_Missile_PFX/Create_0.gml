particle_missile0 = part_system_create();
particle_missile1 = part_system_create();
part_system_depth(particle_missile0, -12);
part_system_depth(particle_missile1, -3);

//Fireball particle
part1 = part_type_create();
part_type_sprite(part1, spr_Explosion_03, true, true, false);
part_type_scale(part1, 0.9, 0.9);
part_type_alpha2(part1, 1, 0);
part_type_life(part1, 180,180);

//Line particle
part2 = part_type_create();
//how it looks
part_type_sprite(part2, spr_Pixel, false, true, false);
part_type_size(part2,.1,.2,0,.005);
part_type_orientation(part2,0,0,0,0,1);
part_type_color3(part2,c_white,c_orange,c_red);
part_type_alpha3(part2,1,.75,0);
//how it moves
part_type_direction(part2,0,360,0,0);
part_type_speed(part2,1,2,0,0);
part_type_gravity(part2,.01,270);
//how long it lasts
part_type_life(part2,30,40);

//Smoke particle
part3 = part_type_create();
part_type_sprite(part3, spr_Smoke_3, true, true, false);
part_type_scale(part3, 0.8, 0.8);
part_type_size(part3, 0.25, 1, 0.0005, 0);
part_type_direction(part3, 0, 359, 0, 0);
part_type_speed(part3, 0.6, 1, -0.04, 0);
part_type_orientation(part3, 0, 359, 0, 0, true);
part_type_alpha3(part3,0,1,0);
part_type_life(part3, 340, 360);

//Shrapnel particle
part4 = part_type_create();
//how it looks
part_type_sprite(part4, spr_Debris_00, false, true, true);
part_type_size(part4,0.3,0.4,0.01,0);
part_type_orientation(part4,0,360,0,0.1,true);
part_type_color3(part4,c_silver,c_orange,c_dkgray);
part_type_alpha2(part4,1,0.1);
part_type_blend(part4,true);
//how it moves
part_type_direction(part4,0,360,0,0);
part_type_speed(part4,0.5,1,-0.01,0);
//how long it lasts
part_type_life(part4,60,80);

//Smoke particle
part5 = part_type_create();
part_type_sprite(part5, spr_Smoke_3, true, true, false);
part_type_size(part5, 0.5, 1, 0.005, 0);
part_type_scale(part5, 0.5, 0.5);
part_type_alpha2(part5, 0.1, 0);
part_type_speed(part5, .75, .95, -0.0725, 0);
part_type_direction(part5, 0, 359, 0, 0);
part_type_orientation(part5, 0, 359, 0, 0, true);
part_type_life(part5, 60, 80);

part_type_death(part1, 6, part5);

explosion0_emitter = part_emitter_create(particle_missile0);
explosion1_emitter = part_emitter_create(particle_missile1);

//Missile
explode_missile1 = false;
missile_x = 0;
missile_y = 0;





