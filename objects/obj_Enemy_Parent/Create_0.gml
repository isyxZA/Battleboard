unit_type = "NOONE";
light_size = 1;
light_strength = 1;
shoot_mask = noone;
view_radius = 0;
unit_health = 100;
health_max = 100;
action_range = 0;
action_points = 0;
temp_ap = 0;
start_ap = 0;
ap_cost = 0;
ap_depleted = false;
mp_cost = 0;
mp_adjust = 0;
mp_depleted = false;
selected = false;
my_tile = noone;
my_tile_x = x;
my_tile_y = y;
target_list = ds_list_create();
target_unit = noone;
no_shot = false;
no_move = false;
mx = 0;
my = 0;
x_end = 0;
y_end = 0;
x_final = 0;
y_final = 0;
nav_grid = -1;
my_squad = "";
my_sound = -1;

threat_x = x;
threat_y = y;

target_x = 0;
target_y = 0;
target_impact = "";
ttx = x;
tty = y;

nav_split = false;
nav_allow = true;
nav_display = false;

nav_confirmed = false;
action_confirmed = false;

my_path = path_add();
my_squad = "NOONE";
manned_unit = noone;

path_confirm = false;
move_count = 0;
move_amount = 0;
move_max = 0;
can_move = false;
can_shoot = false;
shoot_amount = 0;
ammo_check = false;

point_count = 0;
point_change = true;
my_path_pos = 0;

count_start = false;
timer_count = 0;
timer_target = -1;
timer_start = false;

my_speed = 0;

diag = false;
weapon = "NOONE";

alert_display = false;
alert_text = "No Alert";
alert_colour = c_red;

is_manning = false;
can_be_manned = false;
is_manned = false;
is_occupied = false;

repairing_unit = false;
resupplying = false;

my_sprite = -1;
my_colour = c_white;
my_icon = -1;

rot = 0;
rot_offset = 0;
txt_rot = 0;
rot_adj = 0;
my_alpha = 1;
scl = 1;

draw_flash = false;
flash_index = -1;

incr = 0.025;
line_alpha = 1;
l_c1 = c_dkgray;
l_c2 = make_colour_rgb(139,0,0);
fade_switch = false;

spot_mask = -1;
mask_alpha = 0;
is_visible = false;
is_spotted = false;
vis_count = 0;
spot_count = 0;
spotted_x = x;
spotted_y = y;

idle_state = 0;

p_one = -1;

net_id = -1;

//Shader Setup
bright_x = shader_get_uniform(shd_shadows, "bright_x");
bright_y = shader_get_uniform(shd_shadows, "bright_y");
mask = -1;

