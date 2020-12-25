/// @description scr_DiscoveryCheck();
function scr_DiscoveryCheck() {
	//Determine if the object is within view range of any of the player's units

	vis_count = 0;
	//Check the unit positions
	if !ds_list_empty(global.myunit_list) {
	    var ui;
	    for (ui=0; ui<ds_list_size(global.myunit_list); ui+=1){
	        var eu = ds_list_find_value(global.myunit_list, ui);
	        var ud = point_distance(x, y, eu.x, eu.y);
	        var ur = eu.view_radius-global.cell_size;
	        if ud <= ur { vis_count += 1; }
	    }
	}

	//Check for active spy drones
	if global.active_uav == true {
	    var uav = instance_nearest(x, y, obj_UAV_Spawner);
	    if point_distance(x, y, uav.x, uav.y) <= uav.view_radius+(global.cell_size*0.5) { 
	        vis_count += 1;
	    }
	}

	//Check for active bombers
	if global.active_bomber == true {
	    var bb = instance_nearest(x, y, obj_Bomber_Spawner);
	    if point_distance(x, y, bb.x, bb.y) <= bb.view_radius+(global.cell_size*0.5) { 
	        vis_count += 1;
	    }
	}

	//Check for an active airdrop
	if global.active_airdrop == true {
	    var aa = instance_nearest(x, y, obj_Airdrop_Spawner);
	    if point_distance(x, y, aa.x, aa.y) <= aa.view_radius+(global.cell_size*0.5) { 
	        vis_count += 1;
	    }
	}

	//Check for active flares
	if instance_exists(obj_Flare_Bullet) {
	    var uf = instance_nearest(x, y, obj_Flare_Bullet);
	    if point_distance(x, y, uf.x, uf.y) <= uf.view_radius+(global.cell_size*0.5) { 
	        vis_count += 1;
	    }
	}

	var ls = instance_nearest(x, y, obj_LogiLanding_Unit);
	if point_distance(x, y, ls.x, ls.y) <= ls.view_radius+(global.cell_size*0.5) { 
	    vis_count += 1;
	}

	var ss = instance_nearest(x, y, obj_SoldierLanding_Unit);
	if point_distance(x, y, ss.x, ss.y) <= ss.view_radius+(global.cell_size*0.5) { 
	    vis_count += 1;
	}

	if instance_exists(obj_EngineerLanding_Unit) {
	    var es = instance_nearest(x, y, obj_EngineerLanding_Unit);
	    if point_distance(x, y, es.x, es.y) <= es.view_radius+(global.cell_size*0.5) { 
	        vis_count += 1;
	    }
	}

	if instance_exists(obj_TankLanding_Unit) {
	    var ts = instance_nearest(x, y, obj_TankLanding_Unit);
	    if point_distance(x, y, ts.x, ts.y) <= ts.view_radius+(global.cell_size*0.5) { 
	        vis_count += 1;
	    }
	}

	if instance_exists(obj_BTRLanding_Unit) {
	    var bs = instance_nearest(x, y, obj_BTRLanding_Unit);
	    if point_distance(x, y, bs.x, bs.y) <= bs.view_radius+(global.cell_size*0.5) { 
	        vis_count += 1;
	    }
	}

	//Set is_visible flag
	if vis_count > 0 { 
	    discovered = true;
	    if can_light == false { alarm[2] = 30; }
	}



}
