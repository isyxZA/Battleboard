particle_mortar0 = part_system_create();
particle_mortar1 = part_system_create();
part_system_depth(particle_mortar0, -12);
part_system_depth(particle_mortar1, -3);

//Fireball particle
part1 = part_type_create();
part_type_sprite(part1, spr_Explosion_08, true, true, false);
part_type_scale(part1, 0.7, 0.7);
part_type_alpha2(part1, 1, 0.5);
part_type_blend(part1, true);
part_type_life(part1, 80,80);

//Line particle
part2 = part_type_create();
//how it looks
part_type_sprite(part2, spr_Pixel_Line, false, true, false);
part_type_size(part2, 0.25,0.5,0.005,0);
part_type_orientation(part2,0,359,0,0,true);
part_type_color3(part2,c_gray,c_dkgray,c_black);
part_type_alpha2(part2,1,0.2);
//how it moves
part_type_direction(part2,0,360,0,0);
part_type_speed(part2,0.5,1,-0.001,0);
//how long it lasts
part_type_life(part2,30,40);

//Smoke particle
part3 = part_type_create();
part_type_sprite(part3, spr_Smoke_3, true, true, false);
part_type_scale(part3, 1, 1);
part_type_size(part3, 0.2, 0.6, 0.00015, 0);
part_type_direction(part3, 0, 359, 0, 0);
part_type_speed(part3, 0.05, 0.1, -0.0005, 0);
part_type_orientation(part3, 0, 359, 0, 0, true);
part_type_alpha3(part3,0.7,1,0);
part_type_life(part3, 220, 260);

//Shrapnel particle
part4 = part_type_create();
//how it looks
part_type_sprite(part4, spr_Debris_00, false, true, true);
part_type_size(part4,0.1,0.1,0.0125,0);
part_type_orientation(part4,0,360,0,0,0);
part_type_color2(part4,c_silver,c_orange);
part_type_alpha2(part4,1,0.5);
//how it moves
part_type_direction(part4,0,360,0,0);
part_type_speed(part4,1.75,2,-0.025,0);
//how long it lasts
part_type_life(part4,20,40);

explosion0_emitter = part_emitter_create(particle_mortar0);
explosion1_emitter = part_emitter_create(particle_mortar1);

//Mortar
explode_mortar1 = false;
mortar_x = 0;
mortar_y = 0;
burst_trigger = false;
burst_1 = false;
burst_2 = false;

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 0.75);






