function scr_DeselectAll(){
	
	var s_i;
	var s_l = ds_list_size(global.selected_list);
	for(s_i=0; s_i<s_l; s_i+=1) {
		var s_v = ds_list_find_value(global.selected_list, s_i);
		if s_v != undefined { 
			s_v.selected = false;
			s_v.can_be_selected = false;
			s_v.alarm[11] = 20;
			s_v.pX = -1;
	        s_v.pY = -1;
			ds_list_delete(global.selected_list, s_v); 
		}
	}

}