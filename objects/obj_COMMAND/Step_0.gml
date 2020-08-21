/// @description Command button controls
if active == true {
    //if turn_switch == false { turn_switch = true; }
    if confirm_menu == false {
        //Set target location
        var t = instance_nearest(mouse_x-global.cell_size*0.5, mouse_y-global.cell_size*0.5, obj_Game_Tile);
        target_x = t.tile_x;
        target_y = t.tile_y;
    }
    
    switch target_option {
        case "BOMBER":
            if draw_bomber == false { draw_bomber = true; }
            //Right click to bring up confirmation menu
            if mouse_check_button_pressed(mb_right) {
                if confirm_menu == false { 
                    confirm_menu = true; 
                    confirm_list = 1;
                }
            }
            scr_TargetBombs();
            break;
        case "MISSILE":
            if draw_missile == false { draw_missile = true; }
            //Right click to bring up confirmation menu
            if mouse_check_button_pressed(mb_right) {
                if confirm_menu == false { 
                    confirm_menu = true; 
                    confirm_list = 1;
                }
            }
            scr_TargetMissiles();
            break;
        case "UAV":
            if draw_uav == false { draw_uav = true; }
                //Right click to bring up confirmation menu
                if mouse_check_button_pressed(mb_right) {
                    if confirm_menu == false { 
                        confirm_menu = true; 
                        confirm_list = 1;
                    }
                }
            scr_TargetUAV();
            break;
        case "ARTILLERY":
            if draw_artillery == false { draw_artillery = true; }
            //Right click to bring up confirmation menu
            if mouse_check_button_pressed(mb_right) {
                if confirm_menu == false { 
                    confirm_menu = true; 
                    confirm_list = 1;
                }
            }
            scr_TargetArtillery();
            break;
        case "AIRDROP":
            if draw_airdrop == false { draw_airdrop = true; }
            //Right click to bring up confirmation menu
            if confirm_menu == false { 
                var t = instance_place(mouse_x, mouse_y, obj_Depot_Static);
                if t != noone {
                    if (t.is_manned == true) {
                        can_drop = true;
                        if mouse_check_button_pressed(mb_right) {
                            if confirm_menu == false { 
                                airdrop_depot = t.id;
                                confirm_menu = true; 
                                confirm_list = 1;
                            }
                        }
                    }
                        else {can_drop = false; }
                } 
                    else {can_drop = false; }
                scr_TargetAirdrop();
            }
                else { can_drop = true; }
            break;
        case "ILC":
            if draw_ilc == false { draw_ilc = true; }
            //Right click to bring up confirmation menu
            if mouse_check_button_pressed(mb_right) {
                var t = instance_place(mouse_x, mouse_y, obj_Ship_Spawn);
                if t != noone {
                    if (t.available == true) && (t.spawning == false) {
                        if confirm_menu == false { 
                            ship_x = t.x;
                            ship_y = t.y;
                            spawn_ship = t.id;
                            spawn_ship.selected = true;
                            confirm_menu = true; 
                            confirm_list = 2;
                            with obj_Ship_Spawn { if selected = false { active = false; } }
							//Check current squad levels
							if !ds_list_empty(global.squad_alpha)   { alpha_exists = true;   } else { alpha_exists = false;   }
							if !ds_list_empty(global.squad_bravo)   { bravo_exists = true;   } else { bravo_exists = false;   }
							if !ds_list_empty(global.squad_charlie) { charlie_exists = true; } else { charlie_exists = false; }
							if !ds_list_empty(global.squad_delta)   { delta_exists = true;   } else { delta_exists = false;   }
							if !ds_list_empty(global.squad_echo)    { echo_exists = true;    } else { echo_exists = false;    }
                        }
                    }
                }
            }
            break;
        case "TLC":
            if draw_tlc == false { draw_tlc = true; }
            //Right click to bring up confirmation menu
            if mouse_check_button_pressed(mb_right) {
                var t = instance_place(mouse_x, mouse_y, obj_Ship_Spawn);
                if t != noone {
                    if (t.available == true) && (t.spawning == false) {
                        if confirm_menu == false { 
                            ship_x = t.x;
                            ship_y = t.y;
                            spawn_ship = t.id;
                            spawn_ship.selected = true;
                            confirm_menu = true; 
                            confirm_list = 2;
                            with obj_Ship_Spawn { if selected = false { active = false; } }
							//Check current squad levels
							if !ds_list_empty(global.squad_alpha)   { alpha_exists = true;   } else { alpha_exists = false;   }
							if !ds_list_empty(global.squad_bravo)   { bravo_exists = true;   } else { bravo_exists = false;   }
							if !ds_list_empty(global.squad_charlie) { charlie_exists = true; } else { charlie_exists = false; }
							if !ds_list_empty(global.squad_delta)   { delta_exists = true;   } else { delta_exists = false;   }
							if !ds_list_empty(global.squad_echo)    { echo_exists = true;    } else { echo_exists = false;    }
                        }
                    }
                }
            }
            break;
        case "BLC":
            if draw_blc == false { draw_blc = true; }
            //Right click to bring up confirmation menu
            if mouse_check_button_pressed(mb_right) {
                var t = instance_place(mouse_x, mouse_y, obj_Ship_Spawn);
                if t != noone {
                    if (t.available == true) && (t.spawning == false) {
                        if confirm_menu == false { 
                            ship_x = t.x;
                            ship_y = t.y;
                            spawn_ship = t.id;
                            spawn_ship.selected = true;
                            confirm_menu = true; 
                            confirm_list = 2;
                            with obj_Ship_Spawn { if selected = false { active = false; } }
							//Check current squad levels
							if !ds_list_empty(global.squad_alpha)   { alpha_exists = true;   } else { alpha_exists = false;   }
							if !ds_list_empty(global.squad_bravo)   { bravo_exists = true;   } else { bravo_exists = false;   }
							if !ds_list_empty(global.squad_charlie) { charlie_exists = true; } else { charlie_exists = false; }
							if !ds_list_empty(global.squad_delta)   { delta_exists = true;   } else { delta_exists = false;   }
							if !ds_list_empty(global.squad_echo)    { echo_exists = true;    } else { echo_exists = false;    }
                        }
                    }
                }
            }
            break;
        case "ELC":
            if draw_elc == false { draw_elc = true; }
            //Right click to bring up confirmation menu
            if mouse_check_button_pressed(mb_right) {
                var t = instance_place(mouse_x, mouse_y, obj_Ship_Spawn);
                if t != noone {
                    if (t.available == true) && (t.spawning == false) {
                        if confirm_menu == false { 
                            ship_x = t.x;
                            ship_y = t.y;
                            spawn_ship = t.id;
                            spawn_ship.selected = true;
                            confirm_menu = true; 
                            confirm_list = 2;
                            with obj_Ship_Spawn { if selected = false { active = false; } }
							//Check current squad levels
							if !ds_list_empty(global.squad_alpha)   { alpha_exists = true;   } else { alpha_exists = false;   }
							if !ds_list_empty(global.squad_bravo)   { bravo_exists = true;   } else { bravo_exists = false;   }
							if !ds_list_empty(global.squad_charlie) { charlie_exists = true; } else { charlie_exists = false; }
							if !ds_list_empty(global.squad_delta)   { delta_exists = true;   } else { delta_exists = false;   }
							if !ds_list_empty(global.squad_echo)    { echo_exists = true;    } else { echo_exists = false;    }
                        }
                    }
                }
            }
            break;
        case "LLC":
            if draw_llc == false { draw_llc = true }
                //Right click to bring up confirmation menu
                if mouse_check_button_pressed(mb_right) {
                    var t = instance_place(mouse_x, mouse_y, obj_Ship_Spawn);
                    if t != noone {
                        if (t.available == true) && (t.spawning == false) {
                            if confirm_menu == false { 
                                ship_x = t.x;
                                ship_y = t.y;
                                spawn_ship = t.id;
                                spawn_ship.selected = true;
                                confirm_menu = true;
                                confirm_list = 2; 
                                with obj_Ship_Spawn { if selected = false { active = false; } }
								//Check current squad levels
								if !ds_list_empty(global.squad_alpha)   { alpha_exists = true;   } else { alpha_exists = false;   }
								if !ds_list_empty(global.squad_bravo)   { bravo_exists = true;   } else { bravo_exists = false;   }
								if !ds_list_empty(global.squad_charlie) { charlie_exists = true; } else { charlie_exists = false; }
								if !ds_list_empty(global.squad_delta)   { delta_exists = true;   } else { delta_exists = false;   }
								if !ds_list_empty(global.squad_echo)    { echo_exists = true;    } else { echo_exists = false;    }
                            }
                        }
                    }
                }
            break;
        case "NOONE":
            active = false;
            bomber_targeting = false;
            missile_targeting = false;
            uav_targeting = false;
            artillery_targeting = false;
            airdrop_targeting = false;
            ilc_targeting = false;
            tlc_targeting = false;
            elc_targeting = false;
            blc_targeting = false;
            llc_targeting = false;
            draw_bomber    = false;
            draw_missile   = false;
            draw_uav       = false;
            draw_artillery = false;
            draw_airdrop   = false;
            draw_ilc = false;
            draw_tlc = false;
            draw_blc = false;
            draw_elc = false;
            draw_llc = false;
            confirm_menu = false;
            target_rot = 0;
            spawn_ship = noone;
            airdrop_depot = noone;
            with obj_Ship_Spawn { 
                if spawning == false { 
                    active = true;
                    selected = false;
                } 
            }
            break;
    }
    
    
if confirm_menu == true {
	if menu_anim == true {
		if menu_anim_count < menu_anim_timer { 
			menu_scl   = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
			menu_alpha = ease_out_quad(menu_anim_count, 0, 1, menu_anim_timer);
			menu_anim_count ++; 
		}
			else { menu_anim = false; }
	}
    if confirm_list == 1 {
		if p_one == true {
				var f1 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
				var f2 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*2)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
				//var f3 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*3)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*4)*global.menu_ratio, obj_MOUSE, false, false);
		}
			else {
				var f1 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-global.menu_height*global.menu_ratio    , obj_MOUSE, false, false);
				var f2 = collision_rectangle(global.menu_x, global.menu_y-global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
				//var f3 = collision_rectangle(global.menu_x, global.menu_y-global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
			}
	        if f1 { 
	            //CONFIRM 
	            menu_option = 0; 
	        }
	            else if f2 {
	                //RETARGET
	                menu_option = 1; 
	            }
	                else { 
	                    menu_option = 0; 
	                }
                    
	        if mouse_check_button_pressed(mb_left) {
		        if f1 {
		            //CONFIRM
		            switch target_option {
		                case "BOMBER":
		                    //Set target locations
		                    with instance_create_layer(bomb_x1, bomb_y1, "Command", obj_Bomb) { fuse = 10; }
		                    with instance_create_layer(bomb_x2, bomb_y2, "Command", obj_Bomb) { fuse = 30; }
		                    with instance_create_layer(bomb_x3, bomb_y3, "Command", obj_Bomb) { fuse = 50; }
		                    with instance_create_layer(bomb_x4, bomb_y4, "Command", obj_Bomb) { fuse = 70; }
		                    with instance_create_layer(bomb_x5, bomb_y5, "Command", obj_Bomb) { fuse = 90; }
		                    with instance_create_layer(bomb_x6, bomb_y6, "Command", obj_Bomb) { fuse = 110; }
		                    with instance_create_layer(bomb_x7, bomb_y7, "Command", obj_Bomb) { fuse = 130; }
		                    with instance_create_layer(bomber_x1, bomber_y1, "Aircraft", obj_Bomber_Spawner) { 
		                        my_path = path_add();
		                        path_add_point(my_path, x, y, 40);
		                        path_add_point(my_path, other.bomber_x2, other.bomber_y2, 40);
		                        path_set_closed(my_path, false);
		                        path_position = 0;
		                    }
		                    target_option = "NOONE";
							//Reset menu animation
							menu_anim = true;
							menu_anim_count = 0;
							menu_alpha = 0;
							menu_scl = 0;
							if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                    break;
		                case "MISSILE":
		                    //Set target locations
		                    with instance_create_layer(bomb_x1, bomb_y1, "Command", obj_Missile) { fuse = 10; }
		                    with instance_create_layer(bomb_x2, bomb_y2, "Command", obj_Missile) { fuse = 20; }
		                    with instance_create_layer(bomb_x3, bomb_y3, "Command", obj_Missile) { fuse = 40; }
		                    with instance_create_layer(bomb_x4, bomb_y4, "Command", obj_Missile) { fuse = 50; }
		                    with instance_create_layer(bomb_x5, bomb_y5, "Command", obj_Missile) { fuse = 60; }
		                    with instance_create_layer(bomb_x6, bomb_y6, "Command", obj_Missile) { fuse = 90; }
		                    with instance_create_layer(bomb_x7, bomb_y7, "Command", obj_Missile) { fuse = 120; }
		                    global.active_missile = true;
		                    target_option = "NOONE";
							//Reset menu animation
							menu_anim = true;
							menu_anim_count = 0;
							menu_alpha = 0;
							menu_scl = 0;
							if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                    break;
		                case "UAV":
		                    //Set uav vector and path
		                    with instance_create_layer(uav_x1, uav_y1, "Aircraft", obj_UAV_Spawner) { 
		                        my_path = path_add();
		                        path_add_point(my_path, x, y, 20);
		                        path_add_point(my_path, other.uav_x2, other.uav_y2, 20);
		                        path_set_closed(my_path, false);
		                        path_position = 0;
		                        path_start(my_path, 20, path_action_stop, 0);
		                    }
		                    target_option = "NOONE";
							//Reset menu animation
							menu_anim = true;
							menu_anim_count = 0;
							menu_alpha = 0;
							menu_scl = 0;
							if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                    break;
		                case "ARTILLERY":
		                    //Set target locations
		                    with instance_create_layer(bomb_x1 , bomb_y1 , "Command", obj_Artillery) { fuse = 160; }
		                    with instance_create_layer(bomb_x2 , bomb_y2 , "Command", obj_Artillery) { fuse = 130; }
		                    with instance_create_layer(bomb_x3 , bomb_y3 , "Command", obj_Artillery) { fuse = 90 ; }
		                    with instance_create_layer(bomb_x4 , bomb_y4 , "Command", obj_Artillery) { fuse = 40 ; }
		                    with instance_create_layer(bomb_x5 , bomb_y5 , "Command", obj_Artillery) { fuse = 10 ; }
		                    with instance_create_layer(bomb_x6 , bomb_y6 , "Command", obj_Artillery) { fuse = 20 ; }
		                    with instance_create_layer(bomb_x7 , bomb_y7 , "Command", obj_Artillery) { fuse = 30 ; }
		                    with instance_create_layer(bomb_x8 , bomb_y8 , "Command", obj_Artillery) { fuse = 70 ; }
		                    with instance_create_layer(bomb_x9 , bomb_y9 , "Command", obj_Artillery) { fuse = 110; }
		                    with instance_create_layer(bomb_x10, bomb_y10, "Command", obj_Artillery) { fuse = 150; }
		                    global.active_artillery = true;
		                    target_option = "NOONE";
							//Reset menu animation
							menu_anim = true;
							menu_anim_count = 0;
							menu_alpha = 0;
							menu_scl = 0;
							if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                    break;
		                case "AIRDROP":
		                    //Set target locations
		                    with instance_create_layer(bomb_x1, bomb_y1, "Command", obj_Airdrop) { target_depot = other.airdrop_depot; }
		                    with instance_create_layer(-96, bomb_y1, "Aircraft", obj_Airdrop_Spawner) { 
		                        my_path = path_add();
		                        path_add_point(my_path, x, y, 30);
		                        path_add_point(my_path, room_width+1024, other.bomb_y1, 30);
		                        path_set_closed(my_path, false);
		                        path_position = 0;
		                    }
		                    target_option = "NOONE";
							//Reset menu animation
							menu_anim = true;
							menu_anim_count = 0;
							menu_alpha = 0;
							menu_scl = 0;
							if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                    break;
		                case "NOONE":
		                    break;
		            }
		        }
		            else if f2 {
		                //RE-TARGET
		                confirm_menu = false;
						//Reset menu animation
						menu_anim = true;
						menu_anim_count = 0;
						menu_alpha = 0;
						menu_scl = 0;
						if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		            }
	            }
        }
            else if confirm_list == 2 {
				if p_one == true {
						var f1 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
						var f2 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*2)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
						var f3 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*3)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*4)*global.menu_ratio, obj_MOUSE, false, false);
						var f4 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*4)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*5)*global.menu_ratio, obj_MOUSE, false, false);
						var f5 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*5)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*6)*global.menu_ratio, obj_MOUSE, false, false);
						var f6 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*6)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*7)*global.menu_ratio, obj_MOUSE, false, false);
				}
					else {
						var f1 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-global.menu_height*global.menu_ratio    , obj_MOUSE, false, false);
						var f2 = collision_rectangle(global.menu_x, global.menu_y-global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
						var f3 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*2)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
						var f4 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*3)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*4)*global.menu_ratio, obj_MOUSE, false, false);
						var f5 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*4)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*5)*global.menu_ratio, obj_MOUSE, false, false);
						var f6 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*5)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*6)*global.menu_ratio, obj_MOUSE, false, false);
					}
                if f1 { 
                    //CONFIRM 
                    menu_option = 0; 
                    if alpha_exists == true { reinforce_squad = "ALPHA"; } else { reinforce_squad = "NOONE"; } 
                }
                    else if f2 {
                        menu_option = 1;
                        if bravo_exists == true { reinforce_squad = "BRAVO"; } else { reinforce_squad = "NOONE"; } 
                    }
                        else if f3 {
                            menu_option = 2; 
                            if charlie_exists == true { reinforce_squad = "CHARLIE"; } else { reinforce_squad = "NOONE"; } 
                        }
                            else if f4 {
                                menu_option = 3;
                                if delta_exists == true { reinforce_squad = "DELTA"; } else { reinforce_squad = "NOONE"; }  
                            }
                                else if f5 {
                                    menu_option = 4; 
                                    if echo_exists == true { reinforce_squad = "ECHO"; } else { reinforce_squad = "NOONE"; } 
                                }
                                    else if f6 {
                                        //RETARGET
                                        menu_option = 5; 
                                        reinforce_squad = "NOONE";
                                    }
                                        else { 
                                            menu_option = 0; 
                                            reinforce_squad = "NOONE";
                                        }
                            
                if mouse_check_button_pressed(mb_left) {
	                if f1 || f2 || f3 || f4 || f5 {
	                    //CONFIRM
						if reinforce_squad != "NOONE" {
		                    switch target_option {
		                        case "ILC":
		                            spawn_ship.selected = false;
		                            spawn_ship.spawning = true;
		                            spawn_ship.active = false;
		                            spawn_ship.my_ship = obj_SoldierLanding_Unit;
		                            spawn_ship.my_sprite = spr_SoldierLandingCraft;
		                            spawn_ship.my_squad = reinforce_squad;
		                            target_option = "NOONE";
		                            global.active_ilc = true;
		                            global.units_running = 1;
									//Reset menu animation
									menu_anim = true;
									menu_anim_count = 0;
									menu_alpha = 0;
									menu_scl = 0;
									if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                            break;
		                        case "TLC":
		                            spawn_ship.selected = false;
		                            spawn_ship.spawning = true;
		                            spawn_ship.active = false;
		                            spawn_ship.my_ship = obj_TankLanding_Unit;
		                            spawn_ship.my_sprite = spr_VehicleLandingCraft;
		                            spawn_ship.my_squad = reinforce_squad;
		                            target_option = "NOONE";
		                            global.active_tlc = true;
		                            global.units_running = 1;
									//Reset menu animation
									menu_anim = true;
									menu_anim_count = 0;
									menu_alpha = 0;
									menu_scl = 0;
									if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                            break;
		                        case "BLC":
		                            spawn_ship.selected = false;
		                            spawn_ship.spawning = true;
		                            spawn_ship.active = false;
		                            spawn_ship.my_ship = obj_BTRLanding_Unit;
		                            spawn_ship.my_sprite = spr_VehicleLandingCraft;
		                            spawn_ship.my_squad = reinforce_squad;
		                            target_option = "NOONE";
		                            global.active_blc = true;
		                            global.units_running = 1;
									//Reset menu animation
									menu_anim = true;
									menu_anim_count = 0;
									menu_alpha = 0;
									menu_scl = 0;
									if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                            break;
		                        case "ELC":
		                            spawn_ship.selected = false;
		                            spawn_ship.spawning = true;
		                            spawn_ship.active = false;
		                            spawn_ship.my_ship = obj_EngineerLanding_Unit;
		                            spawn_ship.my_sprite = spr_VehicleLandingCraft;
		                            spawn_ship.my_squad = reinforce_squad;
		                            target_option = "NOONE";
		                            global.active_elc = true;
		                            global.units_running = 1;
									//Reset menu animation
									menu_anim = true;
									menu_anim_count = 0;
									menu_alpha = 0;
									menu_scl = 0;
									if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                            break;
		                        case "LLC":
		                            spawn_ship.selected = false;
		                            spawn_ship.spawning = true;
		                            spawn_ship.active = false;
		                            spawn_ship.my_ship = obj_LogiLanding_Unit;
		                            spawn_ship.my_sprite = spr_VehicleLandingCraft;
		                            spawn_ship.my_squad = reinforce_squad;
		                            target_option = "NOONE";
		                            global.active_llc = true;
		                            global.units_running = 1;
									//Reset menu animation
									menu_anim = true;
									menu_anim_count = 0;
									menu_alpha = 0;
									menu_scl = 0;
									if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                            break;
		                        case "NOONE":
		                            break;
		                    }
						}
	                }
	                    else if f6 {
	                        //RE-TARGET
	                        confirm_menu = false;
							//Reset menu animation
							menu_anim = true;
							menu_anim_count = 0;
							menu_alpha = 0;
							menu_scl = 0;
							if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                        with obj_Ship_Spawn { 
	                            if spawning == false { 
	                                active = true;
	                                selected = false;
	                            } 
	                        }
	                    }
                    }
            }
    }
}




