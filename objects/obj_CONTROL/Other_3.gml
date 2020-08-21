//Delete all data structures in memory
ds_list_destroy(global.turn_list);
ds_list_destroy(global.tile_list);
ds_list_destroy(global.unit_list);
ds_list_destroy(global.myunit_list);
ds_list_destroy(global.enemyunit_list);
ds_list_destroy(global.selected_list);
ds_list_destroy(global.action_alert_list);

ds_list_destroy(global.tank_list);
ds_list_destroy(global.selected_tank_list);
ds_list_destroy(global.infantry_list);
ds_list_destroy(global.selected_infantry_list);
ds_list_destroy(global.logi_list);
ds_list_destroy(global.selected_logi_list);
ds_list_destroy(global.btr_list);
ds_list_destroy(global.selected_btr_list);
ds_list_destroy(global.engineer_list);
ds_list_destroy(global.selected_engineer_list);

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