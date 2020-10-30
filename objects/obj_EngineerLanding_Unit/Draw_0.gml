if p_one == true { draw_sprite_ext(spr_VehicleLandingCraft, 0, x-6, y+8, 1.1, 1, rot, c_black, 0.6); }
	else { draw_sprite_ext(spr_VehicleLandingCraft, 0, x+6, y-8, 1.1, 1, rot, c_black, 0.6); }
shader_set(shd_shadows);
mask = shader_get_sampler_index(shd_shadows, "mask");
texture_set_stage(mask, sprite_get_texture(spr_VehicleLandingCraft, 0));
shader_set_uniform_f(bright_x, 1);
shader_set_uniform_f(bright_y, 1);
draw_sprite_ext(spr_VehicleLandingCraft, 0, x, y, 1, 1, rot, c_white, 1);
shader_reset();

if depleted == false{
    var m;
    var ms = min(2, ds_list_size(unit_list));
    for (m=0; m<ms; m+=1){
		draw_sprite_ext(unit_list[| m], 0, x-2, y + (m*v_spacing)+2, xscale, yscale, 0, c_black, 0.5);
        draw_sprite_ext(unit_list[| m], 0, x, y + (m*v_spacing), xscale, yscale, 0, c_white, 1);
    }

    if unit_drag == true { 
        if !ds_list_empty(unit_list) {
            if can_place == true { 
                if p_one == true { draw_sprite_ext(unit_list[| 0], 0, mx-6, my+6, 1, 1, 0, c_black, 0.5); }
					else { draw_sprite_ext(unit_list[| 0], 0, mx+6, my-6, 1, 1, 0, c_black, 0.5); }
                draw_sprite_ext(unit_list[| 0], 0, mx, my, 1, 1, 0, c_white, 0.75); 
            }
                else {
                    draw_sprite_ext(unit_list[| 0], 0, mx, my, 1, 1, 0, c_red, 0.75);
                }
        }
    }
}


