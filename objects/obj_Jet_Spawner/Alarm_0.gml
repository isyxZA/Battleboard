/// @description Check for enemy units in sight range
var e;
for (e=0; e<ds_list_size(global.enemyunit_list); e+=1){
    var eu = ds_list_find_value(global.enemyunit_list, e);
    with eu { scr_VisibilityCheck(); }
}

with obj_Trees  { if !discovered { scr_DiscoveryCheck(); } }
with obj_Houses { if !discovered { scr_DiscoveryCheck(); } }

alarm[0] = 20;

