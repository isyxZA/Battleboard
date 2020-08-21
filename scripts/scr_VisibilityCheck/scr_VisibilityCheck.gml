/// @description scr_VisibilityCheck();
function scr_VisibilityCheck() {
	//Determine if the enemy unit is within view range of any of the player's units

	vis_count = 0;
	//Check the unit positions
	if !ds_list_empty(global.myunit_list) {
	    var ui;
	    for (ui=0; ui<ds_list_size(global.myunit_list); ui+=1){
	        var eu = ds_list_find_value(global.myunit_list, ui);
	        var ud = point_distance(x_final, y_final, eu.x, eu.y);
	        var ur = eu.view_radius+global.cell_size;
	        if ud <= ur { vis_count += 1; }
	    }
	}

	//Check for active spy drones
	if global.active_uav == true {
	    var uav = instance_nearest(x_final, y_final, obj_UAV_Spawner);
	    if point_distance(x_final, y_final, uav.x, uav.y) <= uav.view_radius { 
	        vis_count += 1;
	    }
	}

	//Check for active flares
	if instance_exists(obj_Flare_Bullet) {
	    var uf = instance_nearest(x_final, y_final, obj_Flare_Bullet);
	    if point_distance(x_final, y_final, uf.x, uf.y) <= uf.view_radius { 
	        vis_count += 1;
	    }
	}

	//Check for active bombers
	if global.active_bomber == true {
	    var bb = instance_nearest(x, y, obj_Bomber_Spawner);
	    if point_distance(x, y, bb.x, bb.y) <= bb.view_radius { 
	        vis_count += 1;
	    }
	}

	//Check for an active airdrop
	if global.active_airdrop == true {
	    var aa = instance_nearest(x, y, obj_Airdrop_Spawner);
	    if point_distance(x, y, aa.x, aa.y) <= aa.view_radius { 
	        vis_count += 1;
	    }
	}

	//Set is_visible flag
	if vis_count > 0 { 
	    is_visible = true;
	    is_spotted = true;
	    spot_count = 3;
	    spotted_x = x_final;
	    spotted_y = y_final;
	    //vis_count = 0;
	}
	    else if vis_count <= 0 {
	        is_visible = false;
	    }



}
