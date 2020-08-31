my_health = 100;
my_tile = -1;
cant_shoot = -1;
my_alpha = 1;
alpha_count = 0;
xscl = 0;
yscl = 0;
alpha_duration = 40;
xscl_start = 0.55;
yscl_start = 0.55;
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

