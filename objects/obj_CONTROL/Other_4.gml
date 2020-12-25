if global.new_game == true {
    global.new_game = false;
	var p_side    = PLAYER.player;
    var p_faction = PLAYER.faction;
	var ispritea;
	var tspritea; 
	var espritea;
	var bspritea;
	var lspritea;
	var ispriteb;
	var tspriteb; 
	var espriteb;
	var bspriteb;
	var lspriteb;
	if p_side == "ONE" {
		//Set faction sprites
		switch p_faction {
			case "US":
				ispritea = spr_Infantry_A1;
				tspritea = spr_Tank_A1_Icon;
				espritea = spr_Engineer_A1;
				bspritea = spr_BTR_A1_Icon;
				lspritea = spr_Logi_A1;
				ispriteb = spr_Infantry_A1a;
				tspriteb = spr_Tank_A1a_Icon;
				espriteb = spr_Engineer_A1a_Icon;
				bspriteb = spr_BTR_A1a_Icon;
				lspriteb = spr_Logi_A1a;
				break;
			case "RU":
				ispritea = spr_Infantry_B1;
				tspritea = spr_Tank_B1_Icon;
				espritea = spr_Engineer_B1;
				bspritea = spr_BTR_B1_Icon;
				lspritea = spr_Logi_B1;
				ispriteb = spr_Infantry_B1a;
				tspriteb = spr_Tank_B1a_Icon;
				espriteb = spr_Engineer_B1a_Icon;
				bspriteb = spr_BTR_B1a_Icon;
				lspriteb = spr_Logi_B1a;
				break;
		}
		//Spawn landing craft, reinforcement spawners and start game effects objects
		//ALPHA SPAWN
		with instance_create_layer(3360, 5888, "Ships", obj_LogiLanding_Unit) {
			my_squad = "ALPHA";
			sprite_index = spr_SoldierLandingCraft;
			y_to = y-320;
			var i;
			for (i=0; i<ds_list_size(global.temp_alpha); i+=1) {
			    var v = ds_list_find_value(global.temp_alpha, i);
			    switch v {
			        case "INF_A":
			            unit_list[| i] = ispritea;
			            break;
					case "INF_B":
			            unit_list[| i] = ispriteb;
			            break;
			        case "MBT_A":
			            unit_list[| i] = tspritea;
			            break;
					case "MBT_B":
			            unit_list[| i] = tspriteb;
			            break;
			        case "LAC_A":
			            unit_list[| i] = espritea;
			            break;
					case "LAC_B":
			            unit_list[| i] = espriteb;
			            break;
			        case "LAV_A":
			            unit_list[| i] = bspritea;
			            break;
					case "LAV_B":
			            unit_list[| i] = bspriteb;
			            break;
			        case "LOGI_A":
			            unit_list[| i] = lspritea;
			            break;
					case "LOGI_B":
			            unit_list[| i] = lspriteb;
			            break;
			    }
			}
			ds_list_destroy(global.temp_alpha);
			global.temp_alpha = -1;
		}
		//BRAVO SPAWN
		with instance_create_layer(3104, 5888, "Ships", obj_SoldierLanding_Unit) {
			my_squad = "BRAVO";
			sprite_index = spr_SoldierLandingCraft;
			y_to = y-256;
			var i;
			for (i=0; i<ds_list_size(global.temp_bravo); i+=1) {
			    var v = ds_list_find_value(global.temp_bravo, i);
			    switch v {
			        case "INF_A":
			            unit_list[| i] = ispritea;
			            break;
					case "INF_B":
			            unit_list[| i] = ispriteb;
			            break;
			        case "MBT_A":
			            unit_list[| i] = tspritea;
			            break;
					case "MBT_B":
			            unit_list[| i] = tspriteb;
			            break;
			        case "LAC_A":
			            unit_list[| i] = espritea;
			            break;
					case "LAC_B":
			            unit_list[| i] = espriteb;
			            break;
			        case "LAV_A":
			            unit_list[| i] = bspritea;
			            break;
					case "LAV_B":
			            unit_list[| i] = bspriteb;
			            break;
			        case "LOGI_A":
			            unit_list[| i] = lspritea;
			            break;
					case "LOGI_B":
			            unit_list[| i] = lspriteb;
			            break;
			    }
			}
			ds_list_destroy(global.temp_bravo);
			global.temp_bravo = -1;
		}
		//CHARLIE SPAWN
		with instance_create_layer(3616, 5888, "Ships", obj_SoldierLanding_Unit) {
			my_squad = "CHARLIE";
			sprite_index = spr_SoldierLandingCraft;
			y_to = y-256;
			var i;
			for (i=0; i<ds_list_size(global.temp_charlie); i+=1) {
			    var v = ds_list_find_value(global.temp_charlie, i);
			    switch v {
			        case "INF_A":
			            unit_list[| i] = ispritea;
			            break;
					case "INF_B":
			            unit_list[| i] = ispriteb;
			            break;
			        case "MBT_A":
			            unit_list[| i] = tspritea;
			            break;
					case "MBT_B":
			            unit_list[| i] = tspriteb;
			            break;
			        case "LAC_A":
			            unit_list[| i] = espritea;
			            break;
					case "LAC_B":
			            unit_list[| i] = espriteb;
			            break;
			        case "LAV_A":
			            unit_list[| i] = bspritea;
			            break;
					case "LAV_B":
			            unit_list[| i] = bspriteb;
			            break;
			        case "LOGI_A":
			            unit_list[| i] = lspritea;
			            break;
					case "LOGI_B":
			            unit_list[| i] = lspriteb;
			            break;
			    }
			}
			ds_list_destroy(global.temp_charlie);
			global.temp_charlie = -1;
		}
		//DELTA SPAWN
		with instance_create_layer(2848, 5952, "Ships", obj_SoldierLanding_Unit) {
			my_squad = "DELTA";
			sprite_index = spr_SoldierLandingCraft;
			y_to = y-256;
			var i;
			for (i=0; i<ds_list_size(global.temp_delta); i+=1) {
			    var v = ds_list_find_value(global.temp_delta, i);
			    switch v {
			        case "INF_A":
			            unit_list[| i] = ispritea;
			            break;
					case "INF_B":
			            unit_list[| i] = ispriteb;
			            break;
			        case "MBT_A":
			            unit_list[| i] = tspritea;
			            break;
					case "MBT_B":
			            unit_list[| i] = tspriteb;
			            break;
			        case "LAC_A":
			            unit_list[| i] = espritea;
			            break;
					case "LAC_B":
			            unit_list[| i] = espriteb;
			            break;
			        case "LAV_A":
			            unit_list[| i] = bspritea;
			            break;
					case "LAV_B":
			            unit_list[| i] = bspriteb;
			            break;
			        case "LOGI_A":
			            unit_list[| i] = lspritea;
			            break;
					case "LOGI_B":
			            unit_list[| i] = lspriteb;
			            break;
			    }
			}
			ds_list_destroy(global.temp_delta);
			global.temp_delta = -1;
		}
		//ECHO SPAWN
		with instance_create_layer(3872, 5952, "Ships", obj_SoldierLanding_Unit) {
			my_squad = "ECHO";
			sprite_index = spr_SoldierLandingCraft;
			y_to = y-256;
			var i;
			for (i=0; i<ds_list_size(global.temp_echo); i+=1) {
			    var v = ds_list_find_value(global.temp_echo, i);
			    switch v {
			        case "INF_A":
			            unit_list[| i] = ispritea;
			            break;
					case "INF_B":
			            unit_list[| i] = ispriteb;
			            break;
			        case "MBT_A":
			            unit_list[| i] = tspritea;
			            break;
					case "MBT_B":
			            unit_list[| i] = tspriteb;
			            break;
			        case "LAC_A":
			            unit_list[| i] = espritea;
			            break;
					case "LAC_B":
			            unit_list[| i] = espriteb;
			            break;
			        case "LAV_A":
			            unit_list[| i] = bspritea;
			            break;
					case "LAV_B":
			            unit_list[| i] = bspriteb;
			            break;
			        case "LOGI_A":
			            unit_list[| i] = lspritea;
			            break;
					case "LOGI_B":
			            unit_list[| i] = lspriteb;
			            break;
			    }
			}
			ds_list_destroy(global.temp_echo);
			global.temp_echo = -1;
		}
		//Set reinforce points
		instance_create_layer(1824, 5600, "GroundFX", obj_Ship_Spawn);
		instance_create_layer(2016, 5664, "GroundFX", obj_Ship_Spawn);
		instance_create_layer(2208, 5568, "GroundFX", obj_Ship_Spawn);
		instance_create_layer(2400, 5664, "GroundFX", obj_Ship_Spawn);
		instance_create_layer(2592, 5568, "GroundFX", obj_Ship_Spawn);
		
		instance_create_layer(4128, 5568, "GroundFX", obj_Ship_Spawn);
		instance_create_layer(4320, 5664, "GroundFX", obj_Ship_Spawn);
		instance_create_layer(4512, 5568, "GroundFX", obj_Ship_Spawn);
		instance_create_layer(4704, 5664, "GroundFX", obj_Ship_Spawn);
		instance_create_layer(4896, 5600, "GroundFX", obj_Ship_Spawn);
		//Spawn intro jets
		//Middle
		with instance_create_layer(3360, 6624, "Aircraft", obj_Jet_Spawner) {
			my_path = path_add();
			path_set_kind(my_path, 1);
			path_add_point(my_path, xstart, ystart, 20);
			path_add_point(my_path, xstart, ystart-room_height, 20);
			path_set_closed(my_path, false);
		}
		//Bank Left
		with instance_create_layer(3008, 6720, "Aircraft", obj_Jet_Spawner) {
			my_path = path_add();
			path_set_kind(my_path, 1);
			path_add_point(my_path, xstart, ystart, 20);
			path_add_point(my_path, xstart, ystart-1520, 20);
			path_add_point(my_path, xstart-2000, ystart-5000, 20);
			path_set_closed(my_path, false);
		}
		//Bank Right
		with instance_create_layer(3776, 6720, "Aircraft", obj_Jet_Spawner) {
			my_path = path_add();
			path_set_kind(my_path, 1);
			path_add_point(my_path, xstart, ystart, 20);
			path_add_point(my_path, xstart, ystart-1520, 20);
			path_add_point(my_path, xstart+2000, ystart-5000, 20);
			path_set_closed(my_path, false);
		}
		//Spawn Bombs for intro
		//Left
		with instance_create_layer(2928, 5040, "ParticleFX", obj_Bomb_F18) { fuse = 20; }
		with instance_create_layer(2832, 4944, "ParticleFX", obj_Bomb_F18) { fuse = 40; }
		with instance_create_layer(2736, 4848, "ParticleFX", obj_Bomb_F18) { fuse = 60; }
		with instance_create_layer(2640, 4752, "ParticleFX", obj_Bomb_F18) { fuse = 80; }
		//Middle
		with instance_create_layer(3312, 5040, "ParticleFX", obj_Bomb_F18) { fuse = 10; }
		with instance_create_layer(3408, 4944, "ParticleFX", obj_Bomb_F18) { fuse = 30; }
		with instance_create_layer(3312, 4848, "ParticleFX", obj_Bomb_F18) { fuse = 50; }
		with instance_create_layer(3408, 4752, "ParticleFX", obj_Bomb_F18) { fuse = 70; }
		//Right
		with instance_create_layer(3792, 5040, "ParticleFX", obj_Bomb_F18) { fuse = 25; }
		with instance_create_layer(3888, 4944, "ParticleFX", obj_Bomb_F18) { fuse = 45; }
		with instance_create_layer(3984, 4848, "ParticleFX", obj_Bomb_F18) { fuse = 65; }
		with instance_create_layer(4080, 4752, "ParticleFX", obj_Bomb_F18) { fuse = 85; }
		
		//SPAWN AI CONTROLLER if neeeded
		if PLAYER.net_status == "NONE" { instance_create_layer(3360, 1152, "Units", obj_EnemyControl_B); }
		instance_create_layer(3360, 5344, "Paths", obj_ARROWS);
	}
		//As PLAYER 2
		else if p_side == "TWO" {
			//Set faction sprites
			switch p_faction {
				case "US":
					ispritea = spr_Infantry_A2;
					tspritea = spr_Tank_A2_Icon;
					espritea = spr_Engineer_A2;
					bspritea = spr_BTR_A2_Icon;
					lspritea = spr_Logi_A2;
					ispriteb = spr_Infantry_A2a;
					tspriteb = spr_Tank_A2a_Icon;
					espriteb = spr_Engineer_A2a_Icon;
					bspriteb = spr_BTR_A2a_Icon;
					lspriteb = spr_Logi_A2a;
					break;
				case "RU":
					ispritea = spr_Infantry_B2;
					tspritea = spr_Tank_B2_Icon;
					espritea = spr_Engineer_B2;
					bspritea = spr_BTR_B2_Icon;
					lspritea = spr_Logi_B2;
					ispriteb = spr_Infantry_B2a;
					tspriteb = spr_Tank_B2a_Icon;
					espriteb = spr_Engineer_B2a_Icon;
					bspriteb = spr_BTR_B2a_Icon;
					lspriteb = spr_Logi_B2a;
					break;
			}
			//Spawn landing craft, reinforcement spawners and start game effects objects
			//ALPHA SPAWN
			with instance_create_layer(3360, 832, "Ships", obj_LogiLanding_Unit) {
				my_squad = "ALPHA";
				my_sprite = spr_SoldierLandingCraft;
				y_to = y+320;
				var i;
				for (i=0; i<ds_list_size(global.temp_alpha); i+=1) {
				    var v = ds_list_find_value(global.temp_alpha, i);
				    switch v {
				        case "INF_A":
				            unit_list[| i] = ispritea;
				            break;
						case "INF_B":
				            unit_list[| i] = ispriteb;
				            break;
				        case "MBT_A":
				            unit_list[| i] = tspritea;
				            break;
						case "MBT_B":
				            unit_list[| i] = tspriteb;
				            break;
				        case "LAC_A":
				            unit_list[| i] = espritea;
				            break;
						case "LAC_B":
				            unit_list[| i] = espriteb;
				            break;
				        case "LAV_A":
				            unit_list[| i] = bspritea;
				            break;
						case "LAV_B":
				            unit_list[| i] = bspriteb;
				            break;
				        case "LOGI_A":
				            unit_list[| i] = lspritea;
				            break;
						case "LOGI_B":
				            unit_list[| i] = lspriteb;
				            break;
				    }
				}

				ds_list_destroy(global.temp_alpha);
				global.temp_alpha = -1;
			}
			//BRAVO SPAWN
			with instance_create_layer(3616, 832, "Ships", obj_SoldierLanding_Unit) {
				my_squad = "BRAVO";
				my_sprite = spr_SoldierLandingCraft;
				y_to = y+256;
				var i;
				for (i=0; i<ds_list_size(global.temp_bravo); i+=1) {
				    var v = ds_list_find_value(global.temp_bravo, i);
				    switch v {
				        case "INF_A":
				            unit_list[| i] = ispritea;
				            break;
						case "INF_B":
				            unit_list[| i] = ispriteb;
				            break;
				        case "MBT_A":
				            unit_list[| i] = tspritea;
				            break;
						case "MBT_B":
				            unit_list[| i] = tspriteb;
				            break;
				        case "LAC_A":
				            unit_list[| i] = espritea;
				            break;
						case "LAC_B":
				            unit_list[| i] = espriteb;
				            break;
				        case "LAV_A":
				            unit_list[| i] = bspritea;
				            break;
						case "LAV_B":
				            unit_list[| i] = bspriteb;
				            break;
				        case "LOGI_A":
				            unit_list[| i] = lspritea;
				            break;
						case "LOGI_B":
				            unit_list[| i] = lspriteb;
				            break;
				    }
				}

				ds_list_destroy(global.temp_bravo);
				global.temp_bravo = -1;
			}
			//CHARLIE SPAWN
			with instance_create_layer(3104, 832, "Ships", obj_SoldierLanding_Unit) {
				my_squad = "CHARLIE";
				my_sprite = spr_SoldierLandingCraft;
				y_to = y+256;
				var i;
				for (i=0; i<ds_list_size(global.temp_charlie); i+=1) {
				    var v = ds_list_find_value(global.temp_charlie, i);
				    switch v {
				        case "INF_A":
				            unit_list[| i] = ispritea;
				            break;
						case "INF_B":
				            unit_list[| i] = ispriteb;
				            break;
				        case "MBT_A":
				            unit_list[| i] = tspritea;
				            break;
						case "MBT_B":
				            unit_list[| i] = tspriteb;
				            break;
				        case "LAC_A":
				            unit_list[| i] = espritea;
				            break;
						case "LAC_B":
				            unit_list[| i] = espriteb;
				            break;
				        case "LAV_A":
				            unit_list[| i] = bspritea;
				            break;
						case "LAV_B":
				            unit_list[| i] = bspriteb;
				            break;
				        case "LOGI_A":
				            unit_list[| i] = lspritea;
				            break;
						case "LOGI_B":
				            unit_list[| i] = lspriteb;
				            break;
				    }
				}

				ds_list_destroy(global.temp_charlie);
				global.temp_charlie = -1;
			}
			//DELTA SPAWN
			with instance_create_layer(3872, 768, "Ships", obj_SoldierLanding_Unit) {
				my_squad = "DELTA";
				my_sprite = spr_SoldierLandingCraft;
				y_to = y+256;
				var i;
				for (i=0; i<ds_list_size(global.temp_delta); i+=1) {
				    var v = ds_list_find_value(global.temp_delta, i);
				    switch v {
				        case "INF_A":
				            unit_list[| i] = ispritea;
				            break;
						case "INF_B":
				            unit_list[| i] = ispriteb;
				            break;
				        case "MBT_A":
				            unit_list[| i] = tspritea;
				            break;
						case "MBT_B":
				            unit_list[| i] = tspriteb;
				            break;
				        case "LAC_A":
				            unit_list[| i] = espritea;
				            break;
						case "LAC_B":
				            unit_list[| i] = espriteb;
				            break;
				        case "LAV_A":
				            unit_list[| i] = bspritea;
				            break;
						case "LAV_B":
				            unit_list[| i] = bspriteb;
				            break;
				        case "LOGI_A":
				            unit_list[| i] = lspritea;
				            break;
						case "LOGI_B":
				            unit_list[| i] = lspriteb;
				            break;
				    }
				}

				ds_list_destroy(global.temp_delta);
				global.temp_delta = -1;
			}
			//ECHO SPAWN
			with instance_create_layer(2848, 768, "Ships", obj_SoldierLanding_Unit) {
				my_squad = "ECHO";
				my_sprite = spr_SoldierLandingCraft;
				y_to = y+256;
				var i;
				for (i=0; i<ds_list_size(global.temp_echo); i+=1) {
				    var v = ds_list_find_value(global.temp_echo, i);
				    switch v {
				        case "INF_A":
				            unit_list[| i] = ispritea;
				            break;
						case "INF_B":
				            unit_list[| i] = ispriteb;
				            break;
				        case "MBT_A":
				            unit_list[| i] = tspritea;
				            break;
						case "MBT_B":
				            unit_list[| i] = tspriteb;
				            break;
				        case "LAC_A":
				            unit_list[| i] = espritea;
				            break;
						case "LAC_B":
				            unit_list[| i] = espriteb;
				            break;
				        case "LAV_A":
				            unit_list[| i] = bspritea;
				            break;
						case "LAV_B":
				            unit_list[| i] = bspriteb;
				            break;
				        case "LOGI_A":
				            unit_list[| i] = lspritea;
				            break;
						case "LOGI_B":
				            unit_list[| i] = lspriteb;
				            break;
				    }
				}

				ds_list_destroy(global.temp_echo);
				global.temp_echo = -1;
			}
			//Set reinforce points
			instance_create_layer(1824, 1120, "GroundFX", obj_Ship_Spawn);
			instance_create_layer(2016, 1056, "GroundFX", obj_Ship_Spawn);
			instance_create_layer(2208, 1152, "GroundFX", obj_Ship_Spawn);
			instance_create_layer(2400, 1056, "GroundFX", obj_Ship_Spawn);
			instance_create_layer(2592, 1152, "GroundFX", obj_Ship_Spawn);
		
			instance_create_layer(4128, 1152, "GroundFX", obj_Ship_Spawn);
			instance_create_layer(4320, 1056, "GroundFX", obj_Ship_Spawn);
			instance_create_layer(4512, 1152, "GroundFX", obj_Ship_Spawn);
			instance_create_layer(4704, 1056, "GroundFX", obj_Ship_Spawn);
			instance_create_layer(4896, 1120, "GroundFX", obj_Ship_Spawn);
			//Spawn intro jets
			//Middle
			with instance_create_layer(3360, 96, "Aircraft", obj_Jet_Spawner) {
				my_path = path_add();
				path_set_kind(my_path, 1);
				path_add_point(my_path, xstart, ystart, 20);
				path_add_point(my_path, xstart, ystart+room_height, 20);
				path_set_closed(my_path, false);
			}
			//Bank Right
			with instance_create_layer(3008, 0, "Aircraft", obj_Jet_Spawner) {
				my_path = path_add();
				path_set_kind(my_path, 1);
				path_add_point(my_path, xstart, ystart, 20);
				path_add_point(my_path, xstart, ystart+1520, 20);
				path_add_point(my_path, xstart-2000, ystart+5000, 20);
				path_set_closed(my_path, false);
			}
			//Bank Left
			with instance_create_layer(3776, 0, "Aircraft", obj_Jet_Spawner) {
				my_path = path_add();
				path_set_kind(my_path, 1);
				path_add_point(my_path, xstart, ystart, 20);
				path_add_point(my_path, xstart, ystart+1520, 20);
				path_add_point(my_path, xstart+2000, ystart+5000, 20);
				path_set_closed(my_path, false);
			}
			//Spawn Bombs for intro
			//Left
			with instance_create_layer(2928, 1680, "ParticleFX", obj_Bomb_F18) { fuse = 20; }
			with instance_create_layer(2832, 1776, "ParticleFX", obj_Bomb_F18) { fuse = 40; }
			with instance_create_layer(2736, 1872, "ParticleFX", obj_Bomb_F18) { fuse = 60; }
			with instance_create_layer(2640, 1968, "ParticleFX", obj_Bomb_F18) { fuse = 80; }
			//Middle
			with instance_create_layer(3312, 1680, "ParticleFX", obj_Bomb_F18) { fuse = 10; }
			with instance_create_layer(3408, 1776, "ParticleFX", obj_Bomb_F18) { fuse = 30; }
			with instance_create_layer(3312, 1872, "ParticleFX", obj_Bomb_F18) { fuse = 50; }
			with instance_create_layer(3408, 1968, "ParticleFX", obj_Bomb_F18) { fuse = 70; }
			//Right
			with instance_create_layer(3792, 1680, "ParticleFX", obj_Bomb_F18) { fuse = 25; }
			with instance_create_layer(3888, 1776, "ParticleFX", obj_Bomb_F18) { fuse = 45; }
			with instance_create_layer(3984, 1872, "ParticleFX", obj_Bomb_F18) { fuse = 65; }
			with instance_create_layer(4080, 1968, "ParticleFX", obj_Bomb_F18) { fuse = 85; }
			
			//SPAWN AI CONTROLLER if neeeded
			if PLAYER.net_status == "NONE" { instance_create_layer(3360, 5568, "Units", obj_EnemyControl_B); }
			instance_create_layer(3360, 1376, "Paths", obj_ARROWS);
		}
    display_txt = "";
    //Time allowed for landingcraft animation
    timer_count = 0;
    turn_timer = 2;
	global.set_ui = false;
	ui_ratio = global.ui_scale;
	s_dist   = 36*global.ui_scale;
	clamp(s_dist, 24, 36);
	ui_tx    = (mid_x - (ui_width*global.ui_scale)*0.5);
	ui_bx    = ui_tx;
	ui_by    = display_get_gui_height()-(ui_height*global.ui_scale);
}
	else if global.restart_game == true {
		//Restart the game
		game_restart();
	}