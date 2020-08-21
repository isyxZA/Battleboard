//Deactivate
if deactivate == true { 
    deactivate = false;
    //TURN OFF
    //Stop displaying the menu
    //Deactivate all targeting
    bomber_targeting    = false;
    missile_targeting   = false;
    uav_targeting       = false;
    artillery_targeting = false;
    airdrop_targeting   = false;
    ilc_targeting = false;
    tlc_targeting = false;
    blc_targeting = false;
    elc_targeting = false;
    llc_targeting = false;
    target_x = 0;
    target_y = 0;
    ship_x = 0;
    ship_y = 0;
    depot_x = 0;
    depot_y = 0;
    uav_x1 = 0;
    uav_y1 = 0;
    uav_x2 = 0;
    uav_y2 = 0;
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
}

if confirm_menu == true {
	if keyboard_check_pressed(ord("X")) {
		confirm_menu = false;
		//Reset menu animation
		menu_anim = true;
		menu_anim_count = 0;
		menu_alpha = 0;
		menu_scl = 0;
		if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		if confirm_list == 2 {
			with obj_Ship_Spawn { 
		        if spawning == false { 
		            active = true;
		            selected = false;
		        } 
		    }
		}
	}
}

