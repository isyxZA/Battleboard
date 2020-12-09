function scr_LOGIA_Noone_Tab() {
	var f0;
	var f1;
	var f2;

	if p_one == true {
		f0 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+global.menu_height    *global.menu_ratio, obj_MOUSE, false, false);
		f1 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
		f2 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*2)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
	}
		else {
			f0 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y                                         , obj_MOUSE, false, false);
			f1 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-global.menu_height*global.menu_ratio    , obj_MOUSE, false, false);
			f2 = collision_rectangle(global.menu_x, global.menu_y-global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
		}

	if f0 {
	    global.header_highlight = true;
	    obj_ACTIONMENU.display_menuinfo = false;
	}
	    else if f1 { 
	        //RE-TARGET 
	        global.fire_option = 0; 
	        global.can_zoom  = true;
	        global.header_highlight = false;
	        obj_ACTIONMENU.display_tabinfo = false;
	        obj_ACTIONMENU.display_menuinfo = false;
	    }
	        else if f2 {
	            //CANCEL
	            global.fire_option = 1; 
	            global.can_zoom  = true; 
	            global.header_highlight = false;
	            obj_ACTIONMENU.display_tabinfo = false;
	            obj_ACTIONMENU.display_menuinfo = false;
	        }
	            else { 
	                //global.fire_option = 0; 
	                global.can_zoom  = true;
	                global.header_highlight = false;
	                obj_ACTIONMENU.display_tabinfo = false;
	                obj_ACTIONMENU.display_menuinfo = false;
	            }
            
	if mouse_check_button_released(mb_left) {
	    if f0 { 
	        //Switch ammo/fire options tab
			if global.selected_logib != 0 {
		        global.ammo_tab = "LOGI_B";
				//Remove the surface
				if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		        ammo_check = true;
		    }
		        else if global.selected_depot != 0 {
		            global.ammo_tab = "DEPOT";
					//Remove the surface
					if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		            ammo_check = true;
		        }
		            else if global.selected_repair != 0 {
		                global.ammo_tab = "REPAIR";
						//Remove the surface
						if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                ammo_check = true;
		            }
		                else if global.selected_tow != 0 {
		                    global.ammo_tab = "TOW";
							//Remove the surface
							if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                    ammo_check = true;
		                }
		                    else if global.selected_mortar != 0 {
		                        global.ammo_tab = "MORTAR";
								//Remove the surface
								if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                        ammo_check = true;
		                    }
		                        else if global.selected_infa != 0 {
		                            global.ammo_tab = "INF_A"; 
									//Remove the surface
									if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                            ammo_check = true;
		                        }
									else if global.selected_infb != 0 {
			                            global.ammo_tab = "INF_B"; 
										//Remove the surface
										if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
			                            ammo_check = true;
			                        }
			                            else if global.selected_mbta != 0 {
			                                global.ammo_tab = "MBT_A"; 
											//Remove the surface
											if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
			                                ammo_check = true;
			                            }
											else if global.selected_mbtb != 0 {
				                                global.ammo_tab = "MBT_B"; 
												//Remove the surface
												if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
				                                ammo_check = true;
				                            }
				                                else if global.selected_laca != 0 {
				                                    global.ammo_tab = "LAC_A"; 
													//Remove the surface
													if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
				                                    ammo_check = true;
				                                }
													else if global.selected_lacb != 0 {
					                                    global.ammo_tab = "LAC_B"; 
														//Remove the surface
														if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
					                                    ammo_check = true;
					                                }
					                                    else if global.selected_lava != 0 {
					                                        global.ammo_tab = "LAV_A"; 
															//Remove the surface
															if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
					                                        ammo_check = true;
					                                    }
															else if global.selected_lavb != 0 {
						                                        global.ammo_tab = "LAV_B"; 
																//Remove the surface
																if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
						                                        ammo_check = true;
						                                    }
						                                        else {
						                                        }
	    }
	        else if f1 {
	            //RE-TARGET
	            //Stop drawing fire menu and display the targeting reticule
	            global.fire_display = false;
	            global.reticule_display = true;
				//Reset menu animation
				menu_anim = true;
				menu_anim_count = 0;
				menu_alpha = 0;
				menu_scl = 0;
				//Remove the surface
				if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	            queue_reset = true;
	        }
	            else if f2 { 
	                //CANCEL
	                //Stop drawing all menus
	                global.fire_display = false;
	                global.reticule_display = false;
	                global.menu_create = false;
					//Reset menu animation
					menu_anim = true;
					menu_anim_count = 0;
					menu_alpha = 0;
					menu_scl = 0;
					//Remove the surface
					if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                queue_reset = true;

	            }
	}




}
