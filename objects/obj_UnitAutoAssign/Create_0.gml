global.temp_alpha = ds_list_create();
global.temp_bravo = ds_list_create();
global.temp_charlie = ds_list_create();
global.temp_delta = ds_list_create();
global.temp_echo = ds_list_create();

selector_list = ds_list_create();
assigner_list = ds_list_create();
auto_assign = false;
ready = false;
clear = false;

//Spawn selector buttons and assign unit type and amount
us1 = instance_create_layer(1364, 368, "Buttons", obj_UnitSelector);//Infantry
us2 = instance_create_layer(1476, 368, "Buttons", obj_UnitSelector);//Tank
us3 = instance_create_layer(1588, 368, "Buttons", obj_UnitSelector);//Engineer
us4 = instance_create_layer(1700, 368, "Buttons", obj_UnitSelector);//BTR
us5 = instance_create_layer(1812, 368, "Buttons", obj_UnitSelector);//Logi

//Spawn squad assigner ships and assign a squad
sa1 = instance_create_layer(1588, 624, "Buttons", obj_SquadAssigner);//Alpha
sa2 = instance_create_layer(1476, 656, "Buttons", obj_SquadAssigner);//Bravo
sa3 = instance_create_layer(1700, 656, "Buttons", obj_SquadAssigner);//Charlie
sa4 = instance_create_layer(1364, 688, "Buttons", obj_SquadAssigner);//Delta
sa5 = instance_create_layer(1812, 688, "Buttons", obj_SquadAssigner);//Echo

us1.my_unit = "INFANTRY";
us1.my_sprite = spr_Infantry_Icon;
us1.start_units = 14;
ds_list_add(selector_list, us1.id);

us2.my_unit = "TANK";
us2.my_sprite = spr_Tank_Icon;
us2.start_units = 4;
ds_list_add(selector_list, us2.id);

us3.my_unit = "ENGINEER";
us3.my_sprite = spr_Engineer_Icon;
us3.start_units = 4;
ds_list_add(selector_list, us3.id);

us4.my_unit = "BTR";
us4.my_sprite = spr_BTR_Icon;
us4.start_units = 6;
ds_list_add(selector_list, us4.id);

us5.my_unit = "LOGI";
us5.my_sprite = spr_Logi_Icon;
us5.start_units = 2;
ds_list_add(selector_list, us5.id);

sa1.my_squad = "ALPHA";
sa1.squad_list = global.temp_alpha;
ds_list_add(assigner_list, sa1.id);

sa2.my_squad = "BRAVO";
sa2.squad_list = global.temp_bravo;
ds_list_add(assigner_list, sa2.id);

sa3.my_squad = "CHARLIE";
sa3.squad_list = global.temp_charlie;
ds_list_add(assigner_list, sa3.id);

sa4.my_squad = "DELTA";
sa4.squad_list = global.temp_delta;
ds_list_add(assigner_list, sa4.id);

sa5.my_squad = "ECHO";
sa5.squad_list = global.temp_echo;
ds_list_add(assigner_list, sa5.id);


