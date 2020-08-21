function scr_DeselectAll() {
	//Deselect all units
	if !ds_list_empty(global.myunit_list) {
	    var i;
	    for(i=0; i<ds_list_size(global.myunit_list); i+=1){
	        var unit = ds_list_find_value(global.myunit_list, i);
	        with unit { 
	            if selected == true { 
	                selected = false; 
	                //ds_list_delete(global.selected_list, ds_list_find_index(global.selected_list, id));
	            }
	            if active == true { active = false; }
	        }
	    }
	}



}
