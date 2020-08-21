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

if nav_confirmed == true { alarm[9] = 20; }

