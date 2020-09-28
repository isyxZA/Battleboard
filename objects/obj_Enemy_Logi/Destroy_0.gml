with shoot_mask { instance_destroy(); }
mp_grid_clear_rectangle(global.move_grid, x-40, y-40, x+40, y+40);
if my_tile != noone { my_tile.occupied = false; }
if nav_confirmed == true || action_confirmed == true { global.enemyunits_running -= 1; }
audio_emitter_free(emit);
ds_list_destroy(target_list);
part_system_destroy(particle_logi0);
part_system_destroy(particle_logi1);
ds_list_delete(global.unit_list, ds_list_find_index(global.unit_list, id));//Remove self from unit list
ds_list_delete(global.enemyunit_list, ds_list_find_index(global.enemyunit_list, id));//Remove self from unit list
obj_CONTROL.destroyed_logi += 1;
switch my_squad {
    case "E_1":
	case "ALPHA":
        ds_list_delete(global.squad_1, ds_list_find_index(global.squad_1, other.id));
        break;
    case "E_2":
	case "BRAVO":
        ds_list_delete(global.squad_2, ds_list_find_index(global.squad_2, other.id));
        break;
    case "E_3":
	case "CHARLIE":
        ds_list_delete(global.squad_3, ds_list_find_index(global.squad_3, other.id));
        break;
    case "E_4":
	case "DELTA":
        ds_list_delete(global.squad_4, ds_list_find_index(global.squad_4, other.id));
        break;
    case "E_5":
	case "ECHO":
        ds_list_delete(global.squad_5, ds_list_find_index(global.squad_5, other.id));
        break;
}

path_delete(my_path);
with obj_Destroy_PFX {
	explode_logi = true;
	xp = other.x;
	yp = other.y;
	audio_emitter_position(emit, other.x, other.y, 0);
	audio_play_sound_on(emit, snd_Tank_Explode, false, 1);
}
with instance_create_layer(x, y, "GroundFX", obj_Crater) { sprite_index = other.crater_index; }
