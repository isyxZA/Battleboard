function scr_InitGlobals() {
	global.grid_size = 40;
	global.cell_size = 96;
	global.v_spacing = sprite_get_height(spr_Menu_Border);
	global.h_spacing = sprite_get_width(spr_Menu_Border);
	global.min_x = 0;
	global.max_x = 0;
	global.min_y = 0;
	global.max_y = 0;

	//global.map = "Alpha";

	global.move_grid = noone;
	global.net_move_grid = noone;
	global.turn_list = ds_list_create();
	global.tile_list = ds_list_create();
	global.unit_list = ds_list_create();
	global.myunit_list = ds_list_create();
	global.enemyunit_list = ds_list_create();
	global.selected_list = ds_list_create();
	global.action_alert_list = ds_list_create();

	global.tank_list = ds_list_create();
	global.selected_tank_list = ds_list_create();
	global.infantry_list = ds_list_create();
	global.selected_infantry_list = ds_list_create();
	global.logi_list = ds_list_create();
	global.selected_logi_list = ds_list_create();
	global.btr_list = ds_list_create();
	global.selected_btr_list = ds_list_create();
	global.engineer_list = ds_list_create();
	global.selected_engineer_list = ds_list_create();

	global.depot_list = ds_list_create();
	global.selected_depot_list = ds_list_create();
	global.repair_list = ds_list_create();
	global.selected_repair_list = ds_list_create();
	global.tow_list = ds_list_create();
	global.selected_tow_list = ds_list_create();
	global.mortar_list = ds_list_create();
	global.selected_mortar_list = ds_list_create();

	global.squad_alpha = ds_list_create();
	global.squad_bravo = ds_list_create();
	global.squad_charlie = ds_list_create();
	global.squad_delta = ds_list_create();
	global.squad_echo = ds_list_create();

	global.squad_1 = ds_list_create();
	global.squad_2 = ds_list_create();
	global.squad_3 = ds_list_create();
	global.squad_4 = ds_list_create();
	global.squad_5 = ds_list_create();

	global.selected_LC = false;
	global.selected_infantry = 0;
	global.selected_tank = 0;
	global.selected_logi = 0;
	global.selected_btr = 0;
	global.selected_engineer = 0;
	global.selected_depot = 0;
	global.selected_repair = 0;
	global.selected_tow = 0;
	global.selected_mortar = 0;

	global.total_tank = 0;
	global.total_infantry = 0;
	global.total_engineer = 0;
	global.total_btr = 0;
	global.total_logi = 0;
	global.total_depot = 0;
	global.total_repair = 0;
	global.total_tow = 0;
	global.total_mortar = 0;

	global.debug = false;
	global.pause = false;
	global.current_room = room;
	global.temp_room = room;
	global.transition = false;
	global.victory = false;
	global.defeat = false;
	
	global.can_zoom = false;
	global.can_pan = false;
	global.pan_speed = 40;
	global.zoom_speed = 0.1;
	global.zoom_level = 8;
	global.edge_pan = true;
	global.vsync    = true;
	global.effects_level = 0.5;
	global.music_level   = 0;
	global.display_info = true;
	global.ui_scale = 0.8;
	global.set_ui = false;
	global.grid_display = true;
	global.light_level = 1;
	//global.unit_speed = 1;
	//global.enemy_speed = 1;

	global.command_points = 100;
	global.draw_apcost = false;
	global.draw_cpcost = false;
	global.draw_apreturn = false;
	global.ap_return = 0;

	global.turn_AP = 0;
	global.temp_AP = 0;

	global.game_state = "";
	global.new_game = false;
	global.restart_game = false;
	global.my_turn = false;
	global.opponent_turn = false;
	global.units_running = 0;
	global.enemyunits_running = 0;
	global.waiting = false;
	global.enemy_waiting = false;
	global.game_turn = 0;
	global.tick_rate = 60;
	global.turn_timer = 99;

	global.can_choose = true;
	global.menu_surf    = -1;
	global.target_ratio = 1;
	global.menu_ratio   = 1;
	global.menu_width   = sprite_get_width(spr_Menu_Border);
	global.menu_height  = sprite_get_height(spr_Menu_Border);
	global.menu_x = 0;
	global.menu_y = 0;
	global.menu_option = 0;
	global.fire_option = 0;
	global.nav_select = false;
	global.reticule_display = false;
	global.fire_display = false;
	global.menu_create = false;
	global.nav_menu = false;
	global.target_x = 0;
	global.target_y = 0;
	global.mouse_holdpos = false;
	global.spawning_unit = false; 
	global.repair_display = false;
	global.supply_ship = noone;
	global.header_highlight = false;

	global.active_bomber = false;
	global.active_missile = false;
	global.missile_count = 0;
	global.active_uav = false;
	global.active_artillery = false;
	global.artillery_count = 0;
	global.active_airdrop = false;
	global.active_ilc = false;
	global.active_tlc = false;
	global.active_blc = false;
	global.active_elc = false;
	global.active_llc = false;

	//Unit Action Variables
	//Tank
	global.cannon_ammo = 0;
	global.cannon_amount = 0;
	global.mg_tank_ammo = 0;
	global.mg_tank_amount = 0;
	//Infantry
	global.rifle_ammo = 0;
	global.rifle_amount = 0;
	global.flare_ammo = 0;
	global.flare_amount = 0;
	global.rpg_ammo = 0;
	global.rpg_amount = 0;
	//Logi
	global.ammo_supply = 0;
	global.building_supply = 0;
	//BTR
	global.he_ammo = 0;
	global.he_amount = 0;
	global.ap_ammo = 0;
	global.ap_amount = 0;
	//Engineer
	global.depot_supply = 0;
	global.depot_amount = 0;
	global.repair_supply = 0;
	global.repair_amount = 0;
	global.tow_supply = 0;
	global.tow_amount = 0;
	global.mortar_supply = 0;
	global.mortar_amount = 0;
	//TOW
	global.tow_ammo = 0;
	global.towS_amount = 0;
	//Mortar
	global.mortar_ammo = 0;
	global.mortarS_amount = 0;
	//Depot
	global.ammunition_ammo = 0;
	global.ammunition_amount = 0;
	global.parts_ammo = 0;
	global.parts_amount = 0;
	//Supply ship
	global.lc_ammunition_ammo = 0;
	global.lc_parts_ammo = 0;
	//Repair
	global.repair_ammo = 0;
	global.repair_v_amount = 0;
	global.repair_mg_ammo = 0;
	global.repair_mg_amount = 0;

	//LOGI RESUPPLY VARIABLES
	//Infantry
	global.rifle_l_amount = 0;
	global.rpg_l_amount = 0;
	global.flare_l_amount = 0;
	//Tank
	global.cannon_l_amount = 0;
	global.tankmg_l_amount = 0;
	//BTR
	global.he_l_amount = 0;
	global.ap_l_amount = 0;
	//Engineer
	global.depot_l_amount = 0;
	global.repair_l_amount = 0;
	global.tow_l_amount = 0;
	global.mortar_l_amount = 0;
	//Logi
	global.ammo_l_amount = 0;
	global.building_l_amount = 0;
	//Depot
	global.depotParts_l_amount = 0;
	global.depotAmmo_l_amount = 0;
	//Repair
	global.repairmg_l_amount = 0;
	global.repairS_l_amount = 0;
	//TOW
	global.towS_l_amount = 0;
	//Mortar
	global.mortarS_l_amount = 0;
	//DEPOT RESUPPLY VARIBLES
	//Infantry
	global.rifle_d_amount = 0;
	global.rpg_d_amount = 0;
	global.flare_d_amount = 0;
	//Tank
	global.cannon_d_amount = 0;
	global.tankmg_d_amount = 0;
	//BTR
	global.he_d_amount = 0;
	global.ap_d_amount = 0;
	//Engineer
	global.depot_d_amount = 0;
	global.repair_d_amount = 0;
	global.tow_d_amount = 0;
	global.mortar_d_amount = 0;
	//Logi
	global.ammo_d_amount = 0;
	global.building_d_amount = 0;
	//Depot
	global.depotParts_d_amount = 0;
	global.depotAmmo_d_amount = 0;
	//Repair
	global.repairmg_d_amount = 0;
	global.repairS_d_amount = 0;
	//TOW
	global.towS_d_amount = 0;
	//Mortar
	global.mortarS_d_amount = 0;
	//SHIP RESUPPLY VARIABLES
	//Logi
	global.ammo_s_amount = 0;
	global.building_s_amount = 0;
	//Depot
	global.depotParts_s_amount = 0;
	global.depotAmmo_s_amount = 0;

	global.ammo_tab = "NOONE";
	global.resupply_target = "NOONE";
	global.can_select = true;
	global.show_stats = false;

	global.vis_mask = false;
	global.highlight_supply = false;
	global.highlight_shoot = false;
	global.highlight_move = false;
	global.highlight_objective = false;

	global.targeting_error = false;
	global.navigation_error = false;
	global.friendly_fire = false;

	global.show_cursor = true;
	global.double_click = false;
	global.click_count = 0;
	global.dbl_click_unit = "NOONE";
	
	global.objective_1 = -1;
	global.objective_2 = -1;
	global.objective_3 = -1;

	global.server       = -1;
	global.clients      = -1;
	global.server_name  = "";
	global.server_IP    = "";
	global.server_port  = 0;
	global.green_light  = false;
	global.locked       = false;
	global.broadcast_server = -1;
	global.net_type     = "";
	
	global.clientSocket = 0;
	global.clientConnected = -1 ;

	//DefineMacros
	#macro NET_PING 1
	#macro NET_GREENLIGHT 2
	#macro NET_FACTION 3
	#macro NET_POSITION 4
	#macro NET_MOVE 5
	#macro NET_SHOOT 6
	#macro NET_SPAWN 7
	#macro NET_COMMANDCARD 8
	#macro NET_TLUPDATE 9
	#macro NET_ENDTURN 10
	#macro NET_CONNECT 11
	#macro NET_TIMER 12
	#macro NET_STARTGAME 13
	#macro NET_CANCELSHOOT 14
	#macro NET_ENDRUN 15
	
	#macro INF_1 5
	#macro INF_2 10
	
	#macro MBT_1 40
	#macro MBT_2 30
	
	#macro LAC_1 15
	#macro LAC_2 20
	
	#macro LAV_1 30
	#macro LAV_2 25
	
	#macro LOG_1 15
	#macro LOG_2 10




}
