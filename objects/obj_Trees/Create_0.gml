my_health = 100;
my_tile = -1;
cant_shoot = -1;
my_alpha = 1;
alpha_count = 0;
xscl = 0;
yscl = 0;
alpha_duration = 40;
if room == rm_ALPHA {
	xscl_start = 0.55;
	yscl_start = 0.55;
}
	else {
		xscl_start = 0.75;
		yscl_start = 0.75;
	}
fade_in = true;
xscl_change = random_range(0.01, 0.075);
yscl_change = random_range(0.01, 0.075);
anim_duration = round(random_range(200, 300));
anim_count = 0;
can_draw = false;
vis_count = 0;
discovered = false;
light_strength = 0;
light_target = 0.7;
can_light = false;
if PLAYER.player == "ONE" { p_one = true;}
	else { p_one = false; }
var t = instance_place(x, y, obj_Game_Tile);
if t != noone {
    my_tile = t;
	t.my_colour = c_red;
}
cant_shoot = -1;
alarm[3] = 6;
instance_create_layer(x, y, global.ground_layer, obj_Cant_Shoot);
mp_grid_add_rectangle(global.move_grid, x-36, y-36, x+36, y+36);
if PLAYER.net_status != "NONE" { mp_grid_add_rectangle(global.net_move_grid, x-36, y-36, x+36, y+36); }
rot = random_range(0, 359);
forest_cover = -1;
forest_shadow = -1;
fow1_scale = 0.5;
sat_uni = shader_get_uniform(shd_saturation, "Position"); 
sat_level = -0.1;
scr_InView(x, y, obj_CAMERA.my_camera);


//Particles Setup
particle_tree0 = part_system_create();
particle_tree1 = part_system_create();
part_system_depth(particle_tree0, -10);
part_system_depth(particle_tree1, -12);
tree0_emitter = part_emitter_create(particle_tree0);
tree1_emitter = part_emitter_create(particle_tree1);

//Smoke particle
part1 = part_type_create();
part_type_sprite(part1, spr_Smoke_3, true, true, false);
part_type_size(part1, 0.4, 0.4, 0.03, 0.01);
part_type_scale(part1, 0.1, 0.1);
part_type_speed(part1, .2, .3, -0.0025, 0.01);
part_type_direction(part1, 220, 280, 0, 2);
part_type_orientation(part1, 0, 359, 0, 0, true);
part_type_life(part1, 180, 200);

//Pixel particle
part2 = part_type_create();
//how it looks
part_type_sprite(part2, spr_Pixel, false, true, false);
part_type_size(part2, 0.5,0.5,0.05,0.01);
part_type_orientation(part2,0,359,0,0,true);
part_type_color3(part2,c_red,c_orange,c_silver);
part_type_alpha2(part2,1,0);
//how it moves
part_type_direction(part2,180,0,0,2);
part_type_speed(part2,1,1.5,-0.01,0);
part_type_blend(part2, true);
//how long it lasts
part_type_life(part2,30,45);

//Flame particle
part3 = part_type_create();
part_type_sprite(part3, spr_Fireball_01, false, false, true);
part_type_size(part3, 0.5, 0.5, 0.01, 0.02);
part_type_scale(part3, 0.5, 0.5);
part_type_alpha2(part3,0.4,0);
part_type_speed(part3, .3, .4, -0.002, 0);
part_type_direction(part3, 180, 0, 0, 2);
part_type_orientation(part3, 0, 359, 0, 0, true);
part_type_life(part3, 100, 140);
