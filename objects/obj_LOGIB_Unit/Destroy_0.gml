with obj_Enemy_Parent {
    if !ds_list_empty(target_list) { ds_list_clear(target_list); }
    no_shot = false;
    scr_VisibilityCheck();
}
with shoot_mask { instance_destroy(); }
if is_manning == false { 
	var t = instance_place(x, y, obj_Game_Tile);
	t.occupied = false;
}
mp_grid_clear_rectangle(global.move_grid, x-40, y-40, x+40, y+40);
audio_emitter_free(emit);
part_system_destroy(particle_logi0);
part_system_destroy(particle_logi1);
obj_CONTROL.lost_logi += 1;
switch my_squad {
    case "ALPHA":
        ds_list_delete(global.squad_alpha, ds_list_find_index(global.squad_alpha, id));
        break;
    case "BRAVO":
        ds_list_delete(global.squad_bravo, ds_list_find_index(global.squad_bravo, id));
        break;
    case "CHARLIE":
        ds_list_delete(global.squad_charlie, ds_list_find_index(global.squad_charlie, id));
        break;
    case "DELTA":
        ds_list_delete(global.squad_delta, ds_list_find_index(global.squad_delta, id));
        break;
    case "ECHO":
        ds_list_delete(global.squad_echo, ds_list_find_index(global.squad_echo, id));
        break;
}
ds_list_delete(global.unit_list, ds_list_find_index(global.unit_list, id));//Remove self from unit list
ds_list_delete(global.myunit_list, ds_list_find_index(global.myunit_list, id));//Remove self from unit list
ds_list_delete(global.logib_list, ds_list_find_index(global.logib_list, id));
//Loop thru squad list 
if !ds_list_empty(squad_list) {
	var i;
	for(i=0; i<ds_list_size(squad_list); i+=1) {
		var in1 = ds_list_find_value(squad_list, i);
		var in2 = ds_list_find_value(unit_list , i);
		switch in1 {
			case "ALPHA":
				//Delete unit type from transit squad
				if in2 == "INF_A" {  
					var in3 = ds_list_find_index(global.alpha_transit, "INF_A");
					if in3 != -1 { ds_list_delete(global.alpha_transit, in3); }
				}
					else if in2 == "INF_B" { 
						var in3 = ds_list_find_index(global.alpha_transit, "INF_B");
						if in3 != -1 { ds_list_delete(global.alpha_transit, in3); }
					}
				break;
			case "BRAVO":
				if in2 == "INF_A" {  
					var in3 = ds_list_find_index(global.bravo_transit, "INF_A");
					if in3 != -1 { ds_list_delete(global.bravo_transit, in3); }
				}
					else if in2 == "INF_B" { 
						var in3 = ds_list_find_index(global.bravo_transit, "INF_B");
						if in3 != -1 { ds_list_delete(global.bravo_transit, in3); }
					}
				break;
			case "CHARLIE":
				if in2 == "INF_A" {  
					var in3 = ds_list_find_index(global.charlie_transit, "INF_A");
					if in3 != -1 { ds_list_delete(global.charlie_transit, in3); }
				}
					else if in2 == "INF_B" { 
						var in3 = ds_list_find_index(global.charlie_transit, "INF_B");
						if in3 != -1 { ds_list_delete(global.charlie_transit, in3); }
					}
				break;
			case "DELTA":
				if in2 == "INF_A" {  
					var in3 = ds_list_find_index(global.delta_transit, "INF_A");
					if in3 != -1 { ds_list_delete(global.delta_transit, in3); }
				}
					else if in2 == "INF_B" { 
						var in3 = ds_list_find_index(global.delta_transit, "INF_B");
						if in3 != -1 { ds_list_delete(global.delta_transit, in3); }
					}
				break;
			case "ECHO":
				if in2 == "INF_A" {  
					var in3 = ds_list_find_index(global.echo_transit, "INF_A");
					if in3 != -1 { ds_list_delete(global.echo_transit, in3); }
				}
					else if in2 == "INF_B" { 
						var in3 = ds_list_find_index(global.echo_transit, "INF_B");
						if in3 != -1 { ds_list_delete(global.echo_transit, in3); }
					}
				break;
		}
	}
}
ds_list_destroy(unit_list);
ds_list_destroy(squad_list);
ds_list_destroy(ap_list);
ds_list_destroy(health_list);
ds_list_destroy(rflamo_list);
ds_list_destroy(rpgamo_list);
ds_list_destroy(flramo_list);
path_delete(my_path);
with obj_Destroy_PFX {
	explode_logi = true;
	xp = other.x;
	yp = other.y;
	audio_emitter_position(emit, other.x, other.y, 0);
	audio_play_sound_on(emit, snd_Tank_Explode, false, 1);
}
with instance_create_layer(x, y, "GroundFX", obj_Crater) { sprite_index = other.crater_index; }
