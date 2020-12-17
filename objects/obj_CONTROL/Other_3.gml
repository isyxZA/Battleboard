//Delete all data structures in memory
ds_list_destroy(global.turn_list);
ds_list_destroy(global.tile_list);
ds_list_destroy(global.unit_list);
ds_list_destroy(global.myunit_list);
ds_list_destroy(global.enemyunit_list);
ds_list_destroy(global.selected_list);
ds_list_destroy(global.action_alert_list);

ds_list_destroy(global.mbta_list);
ds_list_destroy(global.selected_mbta_list);
ds_list_destroy(global.infa_list);
ds_list_destroy(global.selected_infa_list);
ds_list_destroy(global.logia_list);
ds_list_destroy(global.selected_logia_list);
ds_list_destroy(global.lava_list);
ds_list_destroy(global.selected_lava_list);
ds_list_destroy(global.laca_list);
ds_list_destroy(global.selected_laca_list);

ds_list_destroy(global.mbtb_list);
ds_list_destroy(global.selected_mbtb_list);
ds_list_destroy(global.infb_list);
ds_list_destroy(global.selected_infb_list);
ds_list_destroy(global.logib_list);
ds_list_destroy(global.selected_logib_list);
ds_list_destroy(global.lavb_list);
ds_list_destroy(global.selected_lavb_list);
ds_list_destroy(global.lacb_list);
ds_list_destroy(global.selected_lacb_list);

ds_list_destroy(global.depot_list);
ds_list_destroy(global.selected_depot_list);
ds_list_destroy(global.repair_list);
ds_list_destroy(global.selected_repair_list);
ds_list_destroy(global.tow_list); 
ds_list_destroy(global.selected_tow_list);
ds_list_destroy(global.mortar_list); 
ds_list_destroy(global.selected_mortar_list);

ds_list_destroy(global.squad_alpha);
ds_list_destroy(global.squad_bravo);
ds_list_destroy(global.squad_charlie); 
ds_list_destroy(global.squad_delta);
ds_list_destroy(global.squad_echo);

ds_list_destroy(global.squad_1);
ds_list_destroy(global.squad_2);
ds_list_destroy(global.squad_3);
ds_list_destroy(global.squad_4); 
ds_list_destroy(global.squad_5);

if surface_exists(ui_topsurf) { surface_free (ui_topsurf); }
if surface_exists(ui_botsurf) { surface_free (ui_botsurf); }