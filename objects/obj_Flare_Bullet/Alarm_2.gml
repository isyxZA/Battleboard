/// @description Check for enemy units in view range
if fade_out == false {
    view_range += 2;
}
    else if fade_out == true {
        view_range -= 8;
    }
if view_range < 0 view_range = 0;
view_radius = global.cell_size*view_range;
alarm[2] = global.tick_rate*4;

//Check for enemy units in view range
if !ds_list_empty(global.enemyunit_list) {
    var e;
    for (e=0; e<ds_list_size(global.enemyunit_list); e+=1){
        var eu = ds_list_find_value(global.enemyunit_list, e);
        with eu { scr_VisibilityCheck(); }
    }
}

with obj_Trees  { if !discovered { scr_DiscoveryCheck(); } }
with obj_Houses { if !discovered { scr_DiscoveryCheck(); } }

