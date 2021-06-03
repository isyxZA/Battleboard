//Explosion3 Particle System
ps = part_system_create();
part_system_depth(ps, -15);

//Explosion3 Particle Types
//Effect1
pt_Effect1 = part_type_create();
part_type_shape(pt_Effect1, pt_shape_pixel);
part_type_sprite(pt_Effect1, spr_Explosion_03, 1, 1, 0);
part_type_size(pt_Effect1, 1, 1, 0, 0);
part_type_scale(pt_Effect1, 1, 1);
part_type_orientation(pt_Effect1, 0, 360, 0, 0, 0);
part_type_alpha3(pt_Effect1, 1, 0.75, 0.50);
part_type_blend(pt_Effect1, 0);
part_type_life(pt_Effect1, 140, 140);
part_type_speed(pt_Effect1, 0, 0, 0, 0);
part_type_direction(pt_Effect1, 0, 360, 0, 0);
part_type_gravity(pt_Effect1, 0, 0);

pt_Effect1a = part_type_create();
part_type_shape(pt_Effect1a, pt_shape_pixel);
part_type_sprite(pt_Effect1a, spr_Explosion_04, 1, 1, 0);
part_type_size(pt_Effect1a, 1, 1, 0, 0);
part_type_scale(pt_Effect1a, 1, 1);
part_type_orientation(pt_Effect1a, 0, 360, 0, 0, 0);
part_type_alpha3(pt_Effect1a, 1, 0.75, 0.50);
part_type_blend(pt_Effect1a, 0);
part_type_life(pt_Effect1a, 140, 140);
part_type_speed(pt_Effect1a, 0, 0, 0, 0);
part_type_direction(pt_Effect1a, 0, 360, 0, 0);
part_type_gravity(pt_Effect1a, 0, 0);

pt_Effect1b = part_type_create();
part_type_shape(pt_Effect1b, pt_shape_pixel);
part_type_sprite(pt_Effect1b, spr_Explosion_07, 1, 1, 0);
part_type_size(pt_Effect1b, 1, 1, 0, 0);
part_type_scale(pt_Effect1b, 1, 1);
part_type_orientation(pt_Effect1b, 0, 360, 0, 0, 0);
part_type_alpha3(pt_Effect1b, 1, 0.75, 0.50);
part_type_blend(pt_Effect1b, 0);
part_type_life(pt_Effect1b, 140, 140);
part_type_speed(pt_Effect1b, 0, 0, 0, 0);
part_type_direction(pt_Effect1b, 0, 360, 0, 0);
part_type_gravity(pt_Effect1b, 0, 0);

pt_Effect1c = part_type_create();
part_type_shape(pt_Effect1c, pt_shape_pixel);
part_type_sprite(pt_Effect1c, spr_Explosion_05, 1, 1, 0);
part_type_size(pt_Effect1c, 1, 1, 0, 0);
part_type_scale(pt_Effect1c, 1, 1);
part_type_orientation(pt_Effect1c, 0, 360, 0, 0, 0);
part_type_alpha3(pt_Effect1c, 1, 0.75, 0.50);
part_type_blend(pt_Effect1c, 0);
part_type_life(pt_Effect1c, 140, 140);
part_type_speed(pt_Effect1c, 0, 0, 0, 0);
part_type_direction(pt_Effect1c, 0, 360, 0, 0);
part_type_gravity(pt_Effect1c, 0, 0);

pt_Effect1d = part_type_create();
part_type_shape(pt_Effect1d, pt_shape_pixel);
part_type_sprite(pt_Effect1d, spr_Explosion_09, 1, 1, 0);
part_type_size(pt_Effect1d, 1, 1, 0, 0);
part_type_scale(pt_Effect1d, 1, 1);
part_type_orientation(pt_Effect1d, 0, 360, 0, 0, 0);
part_type_alpha3(pt_Effect1d, 1, 0.75, 0.50);
part_type_blend(pt_Effect1d, 0);
part_type_life(pt_Effect1d, 140, 140);
part_type_speed(pt_Effect1d, 0, 0, 0, 0);
part_type_direction(pt_Effect1d, 0, 360, 0, 0);
part_type_gravity(pt_Effect1d, 0, 0);

//Effect2
pt_Effect2 = part_type_create();
part_type_shape(pt_Effect2, pt_shape_smoke);
part_type_sprite(pt_Effect2, spr_Smoke_1, 1, 1, 0);
part_type_size(pt_Effect2, 0.50, 1, 0.01, 0);
part_type_scale(pt_Effect2, 1, 1);
part_type_orientation(pt_Effect2, 0, 360, 0, 0, 0);
part_type_alpha3(pt_Effect2, 0, 1, 0);
part_type_blend(pt_Effect2, 0);
part_type_life(pt_Effect2, 180, 200);
part_type_speed(pt_Effect2, 0.30, 0.40, 0, 0);
part_type_direction(pt_Effect2, 0, 360, 0, 0);
part_type_gravity(pt_Effect2, 0, 0);

//Effect3
pt_Effect3 = part_type_create();
part_type_shape(pt_Effect3, pt_shape_pixel);
part_type_sprite(pt_Effect3, spr_Debris_00, 0, 0, 1);
part_type_size(pt_Effect3, 1, 1, 0, 0);
part_type_scale(pt_Effect3, 1, 1);
part_type_orientation(pt_Effect3, 0, 360, 0, 0, 0);
part_type_alpha3(pt_Effect3, 0, 0.60, 0);
part_type_blend(pt_Effect3, 1);
part_type_life(pt_Effect3, 25, 45);
part_type_speed(pt_Effect3, 0.50, 1, 0.05, 0);
part_type_direction(pt_Effect3, 0, 360, 0, 0);
part_type_gravity(pt_Effect3, 0, 0);

//Effect4
pt_Effect4 = part_type_create();
part_type_shape(pt_Effect4, pt_shape_line);
part_type_sprite(pt_Effect4, spr_Pixel_Line, 1, 0, 0);
part_type_size(pt_Effect4, 1, 1, 0, 0);
part_type_scale(pt_Effect4, 1, 1);
part_type_orientation(pt_Effect4, 0, 360, 0, 0, 0);
part_type_alpha3(pt_Effect4, 1, 0.50, 0);
part_type_blend(pt_Effect4, 0);
part_type_life(pt_Effect4, 40, 50);
part_type_speed(pt_Effect4, 1, 1.20, 0, 0);
part_type_direction(pt_Effect4, 0, 360, 0, 0);
part_type_gravity(pt_Effect4, 0, 0);

//Explosion3 Emitters
pe_Effect1 = part_emitter_create(ps);
pe_Effect2 = part_emitter_create(ps);
pe_Effect3 = part_emitter_create(ps);
pe_Effect4 = part_emitter_create(ps);

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 0.75);

xp = 0;
yp = 0;

explode_tank = false;
explode_btr = false;
explode_engineer = false;
explode_logi = false;
explode_static = false;