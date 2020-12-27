with obj_Enemy_Parent {
    if !ds_list_empty(target_list) { ds_list_clear(target_list); }
    no_shot = false;
    scr_VisibilityCheck();
}
with shoot_mask { instance_destroy(); }
if is_manned == true { 
	var t = instance_place(x, y, obj_Game_Tile);
	t.occupied = false;
}
audio_emitter_free(emit);
part_system_destroy(particle_rpr0);
part_system_destroy(particle_rpr1);
obj_CONTROL.lost_repair += 1;
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
ds_list_delete(global.repair_list, ds_list_find_index(global.repair_list, id));//Remove self from unit list
path_delete(my_path);
with obj_Destroy_PFX {
	explode_static = true;
	xp = other.x;
	yp = other.y;
	audio_emitter_position(emit, other.x, other.y, 0);
	audio_play_sound_on(emit, snd_Tank_Explode, false, 1);
}
with instance_create_layer(x, y, "GroundFX", obj_Crater) { sprite_index = other.crater_index; }

