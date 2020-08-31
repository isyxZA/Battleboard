my_health = 100;
my_tile = -1;
var t = instance_place(x, y, obj_Game_Tile);
if t != noone {
    my_tile = t;
	t.my_colour = c_red;
}
if PLAYER.player == "ONE" { p_one = true; }	
	else { p_one = false; }
cant_shoot = -1;
alarm[3] = 6;
instance_create_layer(x, y, global.ground_layer, obj_Cant_Shoot);
mp_grid_add_rectangle(global.move_grid, x-36, y-36, x+36, y+36);
if PLAYER.net_status != "NONE" { mp_grid_add_rectangle(global.net_move_grid, x-36, y-36, x+36, y+36); }
discovered = false;
vis_count = 0;
can_draw = false;
light_strength = 0;
light_target = 0.5;
can_light = false;
my_alpha = 1;
alpha_count = 0;
alpha_duration = 40;
my_house = -1;
img = 0;
fow1_scale = 0.5;
sat_uni = shader_get_uniform(shd_saturation, "Position"); 
sat_level = -0.1;
scr_InView(x, y, obj_CAMERA.my_camera);


