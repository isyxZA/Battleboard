with obj_Enemy_Parent {
    if !ds_list_empty(target_list) { ds_list_clear(target_list); }
    no_shot = false;
    scr_VisibilityCheck();
}
with shoot_mask { instance_destroy(); }
if is_manning == false { 
	var t = instance_place(x, y, obj_Game_Tile);
	t.occupied = false;
	mp_grid_clear_rectangle(global.move_grid, x-40, y-40, x+40, y+40); 
}
	else if is_manning == true {
		if manned_unit != noone { 
			if manned_unit.unit_type == "REPAIR" { mp_grid_clear_rectangle(global.move_grid, x-40, y-40, x+40, y+40); } 
		}
			else  { mp_grid_clear_rectangle(global.move_grid, x-40, y-40, x+40, y+40); }
	}
audio_emitter_free(emit);
if unit_health <= 0 { obj_CONTROL.lost_infantry += 1; }
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
ds_list_delete(global.infb_list, ds_list_find_index(global.infb_list, id));//Remove self from unit list
path_delete(my_path);

