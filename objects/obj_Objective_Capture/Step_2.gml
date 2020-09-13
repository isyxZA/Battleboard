if keyboard_check_pressed(ord("O")) {
	if global.highlight_objective == false {
		var vis_count = 0;
		//Check the unit positions
		if !ds_list_empty(global.myunit_list) {
		    var ui;
		    for (ui=0; ui<ds_list_size(global.myunit_list); ui+=1){
		        var eu = ds_list_find_value(global.myunit_list, ui);
		        var ud = point_distance(x, y, eu.x, eu.y);
		        var ur = eu.view_radius;//+global.cell_size;
		        if ud <= ur { vis_count += 1; }
		    }
		}
		if vis_count > 0 {
			global.highlight_objective = true;
			//Check which game tiles are in range
		    if !ds_list_empty(global.tile_list){
		        var i;
		        for (i=0; i<ds_list_size(global.tile_list); i+=1){
		            var z = ds_list_find_value(global.tile_list, i);
		            if point_in_circle(z.tile_x,z.tile_y, x, y, capture_radius) {
		                    z.unit_count += 1;
		                    z.alarm[1] = random_range(6,32);
		            }
		        }
		    }
		}
	}
}

if keyboard_check_released(ord("O")) {
	if global.highlight_objective == true {
		global.highlight_objective = false;
		//Remove game tile visibility
	    if !ds_list_empty(global.tile_list) {
	        var i;
	        for (i=0; i<ds_list_size(global.tile_list); i+=1){
	            var z = ds_list_find_value(global.tile_list, i);
	            if point_in_circle(z.tile_x,z.tile_y, x, y, capture_radius) {
	                if z.unit_count > 0 { 
	                    z.unit_count -= 1; 
	                    z.alarm[1] = 1;
	                }
	            }
	        }
	    }
	}
}