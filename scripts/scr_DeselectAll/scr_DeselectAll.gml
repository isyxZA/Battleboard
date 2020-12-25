function scr_DeselectAll(){
	
	var s_i;
	var s_l = ds_list_size(global.selected_list);
	for(s_i=0; s_i<s_l; s_i+=1) {
		var s_v = ds_list_find_value(global.selected_list, s_i);
		if s_v != undefined { 
			with s_v {
				selected = false;
				can_be_selected = false;
				alarm[11] = 20;
				pX = -1;
		        pY = -1;
				ds_list_delete(global.selected_list, id); 
			}
		}
	}

}