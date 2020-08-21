//Menu surface and scaling setup
global.menu_surf = -1;

global.action_menu[0] = "Move";
global.action_menu[1] = "Action";
global.action_menu[2] = "Cancel";

global.action_repair_menu[0] = "Move";
global.action_repair_menu[1] = "Action";
global.action_repair_menu[2] = "Repair";
global.action_repair_menu[3] = "Cancel";

global.nav_options[0] = "Confirm";
global.nav_options[1] = "Reposition";
global.nav_options[2] = "Cancel";

menu_anim = true;
menu_anim_count = 0;
menu_alpha = 0;
menu_scl = 0;
menu_anim_timer = 20;

//Infantry
i_fire_menu[0] = "Rifle";
i_fire_menu[1] = "RPG";
i_fire_menu[2] = "Flare";
i_fire_menu[3] = "Retarget";
i_fire_menu[4] = "Cancel";
//Tank
t_fire_menu[0] = "Cannon";
t_fire_menu[1] = "MG";
t_fire_menu[2] = "Retarget";
t_fire_menu[3] = "Cancel";
//Logi
l_fire_menu[0] = "Retarget";
l_fire_menu[1] = "Cancel";

li_fire_menu[0] = "Rifle(s)";
li_fire_menu[1] = "RPG(s)";
li_fire_menu[2] = "Flare(s)";
li_fire_menu[3] = "Retarget";
li_fire_menu[4] = "Cancel";

lt_fire_menu[0] = "Cannon(s)";
lt_fire_menu[1] = "MG(s)";
lt_fire_menu[2] = "Retarget";
lt_fire_menu[3] = "Cancel";

lb_fire_menu[0] = "HE(s)";
lb_fire_menu[1] = "AP(s)";
lb_fire_menu[2] = "Retarget";
lb_fire_menu[3] = "Cancel";

le_fire_menu[0] = "Depot(s)";
le_fire_menu[1] = "Repair(s)";
le_fire_menu[2] = "TOW(s)";
le_fire_menu[3] = "Mortar(s)";
le_fire_menu[4] = "Retarget";
le_fire_menu[5] = "Cancel";

ll_fire_menu[0] = "Ammo(s)";
ll_fire_menu[1] = "Parts(s)";
ll_fire_menu[2] = "Retarget";
ll_fire_menu[3] = "Cancel";

ld_fire_menu[0] = "Parts";
ld_fire_menu[1] = "Ammo";
ld_fire_menu[2] = "Retarget";
ld_fire_menu[3] = "Cancel";

lr_fire_menu[0] = "Parts(s)";
lr_fire_menu[1] = "MG(s)";
lr_fire_menu[2] = "Retarget";
lr_fire_menu[3] = "Cancel";

lat_fire_menu[0] = "TOW(s)";
lat_fire_menu[1] = "Retarget";
lat_fire_menu[2] = "Cancel";

lm_fire_menu[0] = "Mortar(s)";
lm_fire_menu[1] = "Retarget";
lm_fire_menu[2] = "Cancel";

//Engineer
e_fire_menu[0] = "Depot";
e_fire_menu[1] = "Repair";
e_fire_menu[2] = "TOW";
e_fire_menu[3] = "Mortar";
e_fire_menu[4] = "Retarget";
e_fire_menu[5] = "Cancel";
//BTR
b_fire_menu[0] = "HE";
b_fire_menu[1] = "AP";
b_fire_menu[2] = "Retarget";
b_fire_menu[3] = "Cancel";
//Depot
d_fire_menu[0] = "Parts";
d_fire_menu[1] = "Ammo";
d_fire_menu[2] = "Retarget";
d_fire_menu[3] = "Cancel";
//Repair
r_fire_menu[0] = "MG";
r_fire_menu[1] = "Retarget";
r_fire_menu[2] = "Cancel";

r_vehicle_menu[0]  = "Repair";
r_vehicle_menu[1]  = "Cancel";
//TOW
at_fire_menu[0] = "TOW";
at_fire_menu[1] = "Retarget";
at_fire_menu[2] = "Cancel";
//Mortar
m_fire_menu[0] = "Mortar";
m_fire_menu[1] = "Retarget";
m_fire_menu[2] = "Cancel";

t_colour = make_colour_rgb(169,169,169);
display_menuinfo = false;
display_tabinfo = false;
select_enable = true;
repair_tab = false;
ammo_count = 0;
ammo_check = true;
//set_ammo = true;
shoot_amount = 0;
move_amount = 0;
queue_reset = true;
target_x = 0;
target_y = 0;

if PLAYER.player == "ONE" { p_one = true; txt_rot = 0; }
	else { p_one = false; txt_rot = 180; }

