if surface_exists (fow_surf) {
    surface_set_target(fow_surf);
    draw_clear(c_black);
	gpu_set_blendmode(bm_subtract);
    with(obj_Unit_Parent){
        draw_sprite_ext(spr_LightPoint01, 0, x*fow1_scale, y*fow1_scale, light_size*fow1_scale, light_size*fow1_scale, 0,c_white, light_strength);
    }
	/*
    with(obj_Trees){
        if discovered == true {
            draw_sprite_ext(forest_cover, 0, x*fow1_scale, y*fow1_scale, xscl*fow1_scale, yscl*fow1_scale, rot+30,c_white, light_strength);
        }
    }
    with(obj_Houses){
        if discovered == true {
            draw_sprite_ext(my_house,0, x*fow1_scale, y*fow1_scale, 1*fow1_scale, 1*fow1_scale, 0,c_white, light_strength);
        }
    }
	*/
    with(obj_UAV_Spawner){
        draw_sprite_ext(spr_LightPoint02,0, x*fow1_scale, y*fow1_scale, light_size*fow1_scale, light_size*fow1_scale, 0,c_white, light_strength);
    }
    with(obj_Bomber_Spawner){
        draw_sprite_ext(spr_LightPoint02,0, x*fow1_scale, y*fow1_scale, light_size*fow1_scale, light_size*fow1_scale, 0,c_white, light_strength);
    }
    with(obj_Airdrop_Spawner){
        draw_sprite_ext(spr_LightPoint02,0, x*fow1_scale, y*fow1_scale, light_size*fow1_scale, light_size*fow1_scale, 0,c_white, light_strength);
    }
	with(obj_Jet_Spawner){
        draw_sprite_ext(spr_LightPoint02,0, x*fow1_scale, y*fow1_scale, light_size*fow1_scale, light_size*fow1_scale, 0,c_white, light_strength);
    }
    with(obj_Bomb_F18){
        if explode == true {
            draw_sprite_ext(spr_LightPoint01,0, x*fow1_scale, y*fow1_scale, light_size*fow1_scale, light_size*fow1_scale, 0,c_white, light_strength);
        }
    }
	with(obj_Bomb){
        if explode == true {
            draw_sprite_ext(spr_LightPoint01,0, x*fow1_scale, y*fow1_scale, light_size*fow1_scale, light_size*fow1_scale, 0,c_white, light_strength);
        }
    }
    with(obj_Missile){
        if explode == true {
            draw_sprite_ext(spr_LightPoint01,0, x*fow1_scale, y*fow1_scale, light_size*fow1_scale, light_size*fow1_scale, 0,c_white, light_strength);
        }
    }
    with(obj_Artillery){
        if explode == true {
            draw_sprite_ext(spr_LightPoint01,0, x*fow1_scale, y*fow1_scale, light_size*fow1_scale, light_size*fow1_scale, 0,c_white, light_strength);
        }
    }
    with(obj_Bullet_Parent){
        draw_sprite_ext(spr_LightPoint01,0, x*fow1_scale, y*fow1_scale, light_size*fow1_scale, light_size*fow1_scale, 0,c_white, light_strength);
    }
	gpu_set_blendmode(bm_add);
	var aa0 = 0.04*global.menu_ratio;
	draw_sprite_tiled_ext(spr_Fog_Lower, 0, fx2, fy1, fw1, fh2, c_white, aa0);
	var aa1 = a1*global.menu_ratio;
	draw_sprite_tiled_ext(spr_Fog_Upper, 0, fx1, fy1, fw1, fh1, c_white, aa1);
	var aa2 = a2*global.menu_ratio;
	draw_sprite_tiled_ext(spr_Fog_Upper, 0, fx2, fy2, fw2, fh2, c_white, aa2);
	
	if global.grid_display == true {
	    //Gridlines for 40x40 grid
	    var s_pos   = 1440*fow_scale;
	    var gap     = 96*fow_scale;
	    var squares = 41;
	    var i = 0;
	    for(i=0; i<squares; i+=1) {
	        //Vertical Lines
	        draw_sprite_ext(spr_GridLine_V, 0, s_pos+(gap*i), s_pos, 0.4, 4, 0, c_white, 1);
	        //Horizontal Lines
	        draw_sprite_ext(spr_GridLine_H, 0, s_pos, s_pos+(gap*i), 4, 0.4, 0, c_white, 1);
	    }
	}
    gpu_set_blendmode(bm_normal);
    surface_reset_target();
    draw_surface_ext(fow_surf, 0, 0, 1/fow_scale, 1/fow_scale, 0, c_white, 1);
}
    else {
        fow_surf = surface_create(surf_h, surf_w);
        surface_set_target(fow_surf);
        draw_clear(c_black);
        surface_reset_target();
    }
