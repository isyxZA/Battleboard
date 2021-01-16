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

tabs = ds_list_create();
tab_count = 0;

menu_anim = true;
menu_anim_count = 0;
menu_alpha = 0;
menu_scl = 0;
menu_anim_timer = 20;

//INF
ia_fire_menu[0] = "Rifle";
ia_fire_menu[1] = "RPG";
ia_fire_menu[2] = "Flare";
ia_fire_menu[3] = "Retarget";
ia_fire_menu[4] = "Cancel";

ib_fire_menu[0] = "Rifle";
ib_fire_menu[1] = "GL";
ib_fire_menu[2] = "Flare";
ib_fire_menu[3] = "Retarget";
ib_fire_menu[4] = "Cancel";
//MBT
ta_fire_menu[0] = "Cannon";
ta_fire_menu[1] = "MG";
ta_fire_menu[2] = "Retarget";
ta_fire_menu[3] = "Cancel";

tb_fire_menu[0] = "Cannon";
tb_fire_menu[1] = "MG";
tb_fire_menu[2] = "Retarget";
tb_fire_menu[3] = "Cancel";
//LAC
ea_fire_menu[0] = "Depot";
ea_fire_menu[1] = "Repair";
ea_fire_menu[2] = "TOW";
ea_fire_menu[3] = "Mortar";
ea_fire_menu[4] = "Retarget";
ea_fire_menu[5] = "Cancel";

eb_fire_menu[0] = "TOW";
eb_fire_menu[1] = "Retarget";
eb_fire_menu[2] = "Cancel";
//LAV
ba_fire_menu[0] = "HE";
ba_fire_menu[1] = "AP";
ba_fire_menu[2] = "MG";
ba_fire_menu[3] = "TOW";
ba_fire_menu[4] = "Dismount";
ba_fire_menu[5] = "Retarget";
ba_fire_menu[6] = "Cancel";

bb_fire_menu[0] = "HE";
bb_fire_menu[1] = "AP";
bb_fire_menu[2] = "MG";
bb_fire_menu[3] = "Dismount";
bb_fire_menu[4] = "Retarget";
bb_fire_menu[5] = "Cancel";
//LOGI A
l_fire_menu[0] = "Retarget";
l_fire_menu[1] = "Cancel";
//Logi A - INF A
laia_fire_menu[0] = "Rifle(s)";
laia_fire_menu[1] = "RPG(s)";
laia_fire_menu[2] = "Flare(s)";
laia_fire_menu[3] = "Retarget";
laia_fire_menu[4] = "Cancel";
//Logi A - INF B
laib_fire_menu[0] = "Rifle(s)";
laib_fire_menu[1] = "GL(s)";
laib_fire_menu[2] = "Flare(s)";
laib_fire_menu[3] = "Retarget";
laib_fire_menu[4] = "Cancel";
//Logi A - MBT A
lata_fire_menu[0] = "Cannon(s)";
lata_fire_menu[1] = "MG(s)";
lata_fire_menu[2] = "Retarget";
lata_fire_menu[3] = "Cancel";
//Logi A - MBT B
latb_fire_menu[0] = "Cannon(s)";
latb_fire_menu[1] = "MG(s)";
latb_fire_menu[2] = "Retarget";
latb_fire_menu[3] = "Cancel";
//Logi A - LAV A
laba_fire_menu[0] = "HE(s)";
laba_fire_menu[1] = "AP(s)";
laba_fire_menu[2] = "MG(s)";
laba_fire_menu[3] = "TOW(s)";
laba_fire_menu[4] = "Retarget";
laba_fire_menu[5] = "Cancel";
//Logi A - LAV B
labb_fire_menu[0] = "HE(s)";
labb_fire_menu[1] = "AP(s)";
labb_fire_menu[2] = "MG(s)";
labb_fire_menu[3] = "Retarget";
labb_fire_menu[4] = "Cancel";
//Logi A - LAC A
laea_fire_menu[0] = "Depot(s)";
laea_fire_menu[1] = "Repair(s)";
laea_fire_menu[2] = "TOW(s)";
laea_fire_menu[3] = "Mortar(s)";
laea_fire_menu[4] = "Retarget";
laea_fire_menu[5] = "Cancel";
//Logi A - LAC B
laeb_fire_menu[0] = "TOW(s)";
laeb_fire_menu[1] = "Retarget";
laeb_fire_menu[2] = "Cancel";
//Logi A - Logi A
lala_fire_menu[0] = "Ammo(s)";
lala_fire_menu[1] = "Parts(s)";
lala_fire_menu[2] = "Retarget";
lala_fire_menu[3] = "Cancel";
//Logi A - Logi B
lalb_fire_menu[0] = "Ammo(s)";
lalb_fire_menu[1] = "Retarget";
lalb_fire_menu[2] = "Cancel";
//Logi A - Depot
lad_fire_menu[0] = "Parts";
lad_fire_menu[1] = "Ammo";
lad_fire_menu[2] = "Retarget";
lad_fire_menu[3] = "Cancel";
//Logi A - Repair
lar_fire_menu[0] = "Parts(s)";
lar_fire_menu[1] = "MG(s)";
lar_fire_menu[2] = "Retarget";
lar_fire_menu[3] = "Cancel";
//Logi A - TOW
laat_fire_menu[0] = "TOW(s)";
laat_fire_menu[1] = "Retarget";
laat_fire_menu[2] = "Cancel";
//Logi A - Mortar
lam_fire_menu[0] = "Mortar(s)";
lam_fire_menu[1] = "Retarget";
lam_fire_menu[2] = "Cancel";
//Logi B - Logi A
lbla_fire_menu[0] = "Ammo(s)";
lbla_fire_menu[1] = "Retarget";
lbla_fire_menu[2] = "Cancel";
//Logi B - Depot
lbd_fire_menu[0] = "Ammo";
lbd_fire_menu[1] = "Retarget";
lbd_fire_menu[2] = "Cancel";
//Logi B - Repair
lbr_fire_menu[0] = "MG(s)";
lbr_fire_menu[1] = "Retarget";
lbr_fire_menu[2] = "Cancel";
//Logi B - Deploy
lbs_fire_menu[0] = "Dismount";
lbs_fire_menu[1] = "Retarget";
lbs_fire_menu[2] = "Cancel";
//Depot
d_fire_menu[0] = "Parts";
d_fire_menu[1] = "Ammo";
d_fire_menu[2] = "Retarget";
d_fire_menu[3] = "Cancel";
//Repair
r_fire_menu[0] = "MG";
r_fire_menu[1] = "Retarget";
r_fire_menu[2] = "Cancel";

r_vehicle_menu[0] = "Repair";
r_vehicle_menu[1] = "Cancel";
//TOW
at_fire_menu[0] = "TOW";
at_fire_menu[1] = "Retarget";
at_fire_menu[2] = "Cancel";
//Mortar
m_fire_menu[0] = "Mortar";
m_fire_menu[1] = "Retarget";
m_fire_menu[2] = "Cancel";

//Unit Action Variables
//INFA
infa_rfl_ammo   = 0;
infa_flr_ammo   = 0;
infa_rpg_ammo   = 0;
infa_rfl_amount = 0;
infa_flr_amount = 0;
infa_rpg_amount = 0;
//INFB
infb_rfl_ammo   = 0;
infb_flr_ammo   = 0;
infb_rpg_ammo   = 0;
infb_rfl_amount = 0;
infb_flr_amount = 0;
infb_rpg_amount = 0;
//MBTA
mbta_ap_ammo   = 0;
mbta_ap_amount = 0;
mbta_mg_ammo   = 0;
mbta_mg_amount = 0;	
//MBTB
mbtb_ap_ammo   = 0;
mbtb_ap_amount = 0;
mbtb_mg_ammo   = 0;
mbtb_mg_amount = 0;	
//LAVA
lava_he_ammo   = 0;
lava_he_amount = 0;
lava_ap_ammo   = 0;
lava_ap_amount = 0;
lava_at_ammo   = 0;
lava_at_amount = 0;
lava_mg_ammo   = 0;
lava_mg_amount = 0;
lava_sq_ammo   = 0;
lava_sq_amount = 0;	
//LAVB
lavb_he_ammo   = 0;
lavb_he_amount = 0;
lavb_ap_ammo   = 0;
lavb_ap_amount = 0;
lavb_mg_ammo   = 0;
lavb_mg_amount = 0;
lavb_sq_ammo   = 0;
lavb_sq_amount = 0;	
//LACA
laca_dpt_supply = 0;
laca_dpt_amount = 0;
laca_rpr_supply = 0;
laca_rpr_amount = 0;
laca_tow_supply = 0;
laca_tow_amount = 0;
laca_mtr_supply = 0;
laca_mtr_amount = 0;
//LACB
lacb_tow_ammo   = 0;
lacb_tow_amount = 0;
//LOGIA
logia_amo_supply = 0;
logia_bld_supply = 0;
//LOGIB
logib_amo_supply = 0;
logib_sqd_supply = 0;
//TOW
tow_ammo = 0;
towS_amount = 0;
//Mortar
mortar_ammo = 0;
mortarS_amount = 0;
//Depot
dpt_amo_supply = 0;
//dpt_amo_amount = 0;
dpt_bld_supply = 0;
//dpt_bld_amount = 0;
//Repair
repair_v_ammo = 0;
repair_v_amount = 0;
repair_mg_ammo = 0;
repair_mg_amount = 0;
//Supply ship
lc_amo_ammo = 0;
lc_bld_ammo = 0;

//LOGI RESUPPLY VARIABLES
//INF
infrfl_l_amount = 0;
infrpg_l_amount = 0;
infflr_l_amount = 0;
//MBT
mbtap_l_amount = 0;
mbtmg_l_amount = 0;
//LAV
lavhe_l_amount = 0;
lavap_l_amount = 0;
lavmg_l_amount = 0;
lavat_l_amount = 0;
//LAC
lacdpt_l_amount  = 0;
lacrpr_l_amount  = 0;
lactow_l_amount  = 0;
lacmtr_l_amount  = 0;
lactow2_l_amount = 0;
//Logi
logiamo_l_amount = 0;
logibld_l_amount = 0;
logisqd_l_amount = 0;
//Depot
dptbld_l_amount = 0;
dptamo_l_amount = 0;
//Repair
rprmg_l_amount = 0;
rprbld_l_amount = 0;
//TOW
towamo_l_amount = 0;
//Mortar
mtramo_l_amount = 0;
	
//DEPOT RESUPPLY VARIBLES
//INF
infrfl_d_amount = 0;
infrpg_d_amount = 0;
infflr_d_amount = 0;
//MBT
mbtap_d_amount = 0;
mbtmg_d_amount = 0;
//LAV
lavhe_d_amount = 0;
lavap_d_amount = 0;
lavmg_d_amount = 0;
lavat_d_amount = 0;
//LAC
lacdpt_d_amount = 0;
lacrpr_d_amount = 0;
lactow_d_amount = 0;
lacmtr_d_amount = 0;
lactow2_d_amount = 0;
//LOGI
logiamo_d_amount = 0;
logibld_d_amount = 0;
//Depot
dptbld_d_amount = 0;
dptamo_d_amount = 0;
//Repair
rprmg_d_amount = 0;
rprbld_d_amount = 0;
//TOW
towamo_d_amount = 0;
//Mortar
mtramo_d_amount = 0;
//SHIP RESUPPLY VARIABLES
//Logi
logiamo_s_amount = 0;
logibld_s_amount = 0;
//Depot
dptbld_s_amount = 0;
dptamo_s_amount = 0;

t_colour = make_colour_rgb(169,169,169);
display_menuinfo = false;
display_tabinfo = false;
select_enable = true;
repair_tab = false;
ammo_count = 0;
ammo_check = true;
target_tile = noone;
tile_empty = false;
shoot_amount = 0;
move_amount = 0;
queue_reset = true;
amount_reset = true;
target_x = 0;
target_y = 0;

if PLAYER.player == "ONE" { p_one = true; txt_rot = 0; }
	else { p_one = false; txt_rot = 180; }


