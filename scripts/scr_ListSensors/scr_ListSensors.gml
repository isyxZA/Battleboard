function scr_ListSensors() {
	if device_mouse_y_to_gui(0) < ((ty_0*ui_ratio)+s_dist) && device_mouse_y_to_gui(0) > ((ty_0*ui_ratio)-s_dist) {
	    var l0 = point_distance(ui_tx+(tx_0*ui_ratio), ui_ty+(ty_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	    if l0 < s_dist {
	        if t0_timer < s_time { t0_timer+=1; }
	        if t0_timer >= s_time { t_pos = 0; }
	    }
	        else { t0_timer = 0; }
        
	    var l1 = point_distance(ui_tx+(tx_1*ui_ratio), ui_ty+(ty_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	    if l1 < s_dist {
	        if t1_timer < s_time { t1_timer+=1; }
	        if t1_timer >= s_time { t_pos = 1; }
	    }
	        else { t1_timer = 0; }
        
	    var l2 = point_distance(ui_tx+(tx_2*ui_ratio), ui_ty+(ty_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	    if l2 < s_dist {
	        if t2_timer < s_time { t2_timer+=1; }
	        if t2_timer >= s_time { t_pos = 2; }
	    }
	        else { t2_timer = 0; }
        
	    var l3 = point_distance(ui_tx+(tx_3*ui_ratio), ui_ty+(ty_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	    if l3 < s_dist {
	        if t3_timer < s_time { t3_timer+=1; }
	        if t3_timer >= s_time { t_pos = 3; }
	    }
	        else { t3_timer = 0; }
    
	    var l4 = point_distance(ui_tx+(tx_4*ui_ratio), ui_ty+(ty_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	    if l4 < s_dist {
	        if t4_timer < s_time { t4_timer+=1; }
	        if t4_timer >= s_time { t_pos = 4; }
	    }
	        else { t4_timer = 0; }
        
	    var l5 = point_distance(ui_tx+(tx_5*ui_ratio), ui_ty+(ty_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	    if l5 < s_dist {
	        if t5_timer < s_time { t5_timer+=1; }
	        if t5_timer >= s_time { t_pos = 5; }
	    }
	        else { t5_timer = 0; }
        
	    var l6 = point_distance(ui_tx+(tx_6*ui_ratio), ui_ty+(ty_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	    if l6 < s_dist {
	        if t6_timer < s_time { t6_timer+=1; }
	        if t6_timer >= s_time { t_pos = 6; }
	    }
	        else { t6_timer = 0; }
        
	    var l7 = point_distance(ui_tx+(tx_7*ui_ratio), ui_ty+(ty_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	    if l7 < s_dist {
	        if t7_timer < s_time { t7_timer+=1; }
	        if t7_timer >= s_time { t_pos = 7; }
	    }
	        else { t7_timer = 0; }
        
	    var l8 = point_distance(ui_tx+(tx_8*ui_ratio), ui_ty+(ty_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	    if l8 < s_dist {
	        if t8_timer < s_time { t8_timer+=1; }
	        if t8_timer >= s_time { t_pos = 8; }
	    }
	        else { t8_timer = 0; }
        
	    var l9 = point_distance(ui_tx+(tx_9*ui_ratio), ui_ty+(ty_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	    if l9 < s_dist {
	        if t9_timer < s_time { t9_timer+=1; }
	        if t9_timer >= s_time { t_pos = 9; }
	    }
	        else { t9_timer = 0; }
        
	    var l10 = point_distance(ui_tx+(tx_10*ui_ratio), ui_ty+(ty_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	    if l10 < s_dist {
	        if t10_timer < s_time { t10_timer+=1; }
	        if t10_timer >= s_time { t_pos = 10; }
	    }
	        else { t10_timer = 0; }
        
	    var l1 = point_distance(ui_tx+(tx_11*ui_ratio), ui_ty+(ty_0*ui_ratio), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	    if l1 < s_dist {
	        if t11_timer < s_time { t11_timer+=1; }
	        if t11_timer >= s_time { t_pos = 11; }
	    }
	        else { t11_timer = 0; }
		if t_pos != -1 && command_targeting == true { squad_intel = true; } else { squad_intel = false; }
	}
	    else { t_pos = -1; squad_intel = false; }



}
