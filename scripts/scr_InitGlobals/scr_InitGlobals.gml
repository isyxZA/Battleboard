function scr_InitGlobals() {
	
	global.grid_size = 40;
	global.cell_size = 96;
	global.v_spacing = sprite_get_height(spr_Menu_Border);
	//global.h_spacing = sprite_get_width(spr_Menu_Border);
	global.min_x = 0;
	global.max_x = 0;
	global.min_y = 0;
	global.max_y = 0;

	global.move_grid = noone;
	global.net_move_grid = noone;
	global.turn_list = ds_list_create();
	global.tile_list = ds_list_create();
	global.unit_list = ds_list_create();
	global.myunit_list = ds_list_create();
	global.enemyunit_list = ds_list_create();
	global.selected_list = ds_list_create();
	global.action_alert_list = ds_list_create();

	global.mbta_list = ds_list_create();
	global.selected_mbta_list = ds_list_create();
	global.infa_list = ds_list_create();
	global.selected_infa_list = ds_list_create();
	global.logia_list = ds_list_create();
	global.selected_logia_list = ds_list_create();
	global.lava_list = ds_list_create();
	global.selected_lava_list = ds_list_create();
	global.laca_list = ds_list_create();
	global.selected_laca_list = ds_list_create();
	
	global.mbtb_list = ds_list_create();
	global.selected_mbtb_list = ds_list_create();
	global.infb_list = ds_list_create();
	global.selected_infb_list = ds_list_create();
	global.logib_list = ds_list_create();
	global.selected_logib_list = ds_list_create();
	global.lavb_list = ds_list_create();
	global.selected_lavb_list = ds_list_create();
	global.lacb_list = ds_list_create();
	global.selected_lacb_list = ds_list_create();

	global.depot_list = ds_list_create();
	global.selected_depot_list = ds_list_create();
	global.repair_list = ds_list_create();
	global.selected_repair_list = ds_list_create();
	global.tow_list = ds_list_create();
	global.selected_tow_list = ds_list_create();
	global.mortar_list = ds_list_create();
	global.selected_mortar_list = ds_list_create();

	global.squad_alpha   = ds_list_create();
	global.squad_bravo   = ds_list_create();
	global.squad_charlie = ds_list_create();
	global.squad_delta   = ds_list_create();
	global.squad_echo    = ds_list_create();
	
	global.alpha_transit   = ds_list_create();
	global.bravo_transit   = ds_list_create();
	global.charlie_transit = ds_list_create();
	global.delta_transit   = ds_list_create();
	global.echo_transit    = ds_list_create();

	global.squad_1 = ds_list_create();
	global.squad_2 = ds_list_create();
	global.squad_3 = ds_list_create();
	global.squad_4 = ds_list_create();
	global.squad_5 = ds_list_create();

	global.selected_LC = false;
	global.selected_infa = 0;
	global.selected_mbta = 0;
	global.selected_logia = 0;
	global.selected_lava = 0;
	global.selected_laca = 0;
	global.selected_infb = 0;
	global.selected_mbtb = 0;
	global.selected_logib = 0;
	global.selected_lavb = 0;
	global.selected_lacb = 0;
	global.selected_depot = 0;
	global.selected_repair = 0;
	global.selected_tow = 0;
	global.selected_mortar = 0;

	global.total_mbta = 0;
	global.total_infa = 0;
	global.total_laca = 0;
	global.total_lava = 0;
	global.total_logia = 0;
	global.total_mbtb = 0;
	global.total_infb = 0;
	global.total_lacb = 0;
	global.total_lavb = 0;
	global.total_logib = 0;
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
	global.vsync = true;
	global.effects_level = 0.5;
	global.music_level = 0;
	global.display_info = true;
	global.ui_scale = 0.8;
	global.set_ui = false;
	global.grid_display = true;
	global.light_level = 1;

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
	global.menu_surf = -1;
	global.target_ratio = 1;
	global.menu_ratio = 1;
	global.menu_width = sprite_get_width(spr_Menu_Border);
	global.menu_height = sprite_get_height(spr_Menu_Border);
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
	
	global.keybind = false;

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
	
	//Networking
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
	
	//Key map default
	global.UP      = 87;
	global.DOWN    = 83;
	global.LEFT    = 65;
	global.RIGHT   = 68;
	global.LSHIFT  = 90;
	global.RSHIFT  = 67;
	global.SHOOT   = 81;
	global.MOVE    = 69;
	global.CANCEL  = 88;
	global.STATS   = 9;
	global.RANGE   = 70;
	global.TERRAIN = 84;
	global.SUPPLY  = 82;
	global.GRID    = 71;
	global.TURNEND = 32;
	global.HINTS   = 72;
	global.OBJECTIVES = 79;
	global.VISIBILITY = 86;
	global.SCREEN     = 80;
	global.ESCAPE     = 27;
	global.LMOUSE = 1;
	global.RMOUSE = 2;
	global.MMOUSE = 3;
	global.INCREASE = 107;
	global.DECREASE = 109;
	
	//Macros
	//Networking
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
	
	//Squad formation costs
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
