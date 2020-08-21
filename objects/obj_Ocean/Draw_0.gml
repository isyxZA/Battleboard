if surface_exists(ocean_surf){
    surface_set_target(ocean_surf);
    draw_clear(c_black);
    
    draw_sprite_tiled_ext(spr_Ocean_02, 0,  x*ratio      ,  y*ratio      , (1+sx_2)*ratio, (1+sx_2)*ratio, c_white, a1);
    draw_sprite_tiled_ext(spr_Ocean_01, 0, (x+sh_1)*ratio, (y+sv_1)*ratio, (1+sx_1)*ratio, (1+sx_1)*ratio, c_white, 0.25);
	
    draw_sprite_tiled_ext(spr_Ocean_02, 0, (x+sh_1)*ratio, (y+sv_1)*ratio, (1+sx_1)*ratio, (1+sx_1)*ratio, c_white, a2);
    draw_sprite_tiled_ext(spr_Ocean_01, 0, (x+sh_2)*ratio, (y+sv_2)*ratio, (1+sx_2)*ratio, (1+sx_2)*ratio, c_white, 0.25);
    
    surface_reset_target();
    draw_surface_ext(ocean_surf, 0, 0, 1/ratio, 1/ratio, 0, c_white, 1);
}
    else {
        ocean_surf = surface_create(room_width*ratio, room_height*ratio);
        surface_set_target(ocean_surf);
        draw_clear(c_black);
        surface_reset_target();
    }


/*
//Without a surface
draw_sprite_tiled_ext(spr_Ocean_01, 0, x     , y     , 1+sx_2, 1+sx_2, c_white, 0.3);
draw_sprite_tiled_ext(spr_Ocean_01, 0, x+sh_1, y+sv_1, 1+sx_1, 1+sx_1, c_white, 0.3);
draw_sprite_tiled_ext(spr_Ocean_01, 0, x+sh_2, y+sv_2, 1+sx_2, 1+sx_2, c_white, 0.3);
*/

