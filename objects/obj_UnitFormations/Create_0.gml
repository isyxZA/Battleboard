start_points = 500;
formation_points = start_points;
formation = 1;

global.temp_alpha   = ds_list_create();
global.temp_bravo   = ds_list_create();
global.temp_charlie = ds_list_create();
global.temp_delta   = ds_list_create();
global.temp_echo    = ds_list_create();
//selector_list = ds_list_create();//Unit select buttons
//assigner_list = ds_list_create();//Unit squad ship

auto_assign = true;
ready = false;
clear = false;

//Spawn selector buttons and assign unit type and amount
us1 = instance_create_layer(1346, 420, "Buttons", obj_UnitSelector);//Infantry
us2 = instance_create_layer(1470, 420, "Buttons", obj_UnitSelector);//Tank
us3 = instance_create_layer(1588, 420, "Buttons", obj_UnitSelector);//Engineer
us4 = instance_create_layer(1706, 420, "Buttons", obj_UnitSelector);//BTR
us5 = instance_create_layer(1830, 420, "Buttons", obj_UnitSelector);//Logi

//Spawn squad assigner ships and assign a squad
sa1 = instance_create_layer(1588, 664, "Buttons", obj_SquadAssigner);//Alpha
sa2 = instance_create_layer(1476, 696, "Buttons", obj_SquadAssigner);//Bravo
sa3 = instance_create_layer(1700, 696, "Buttons", obj_SquadAssigner);//Charlie
sa4 = instance_create_layer(1364, 728, "Buttons", obj_SquadAssigner);//Delta
sa5 = instance_create_layer(1812, 728, "Buttons", obj_SquadAssigner);//Echo

us1.my_unit     = "INFANTRY";
us1.my_sprite   = spr_Infantry_Icon;
us1.icon_sprite = spr_Infantry_Dropdown;
us1.unit_cost   = 5;
//us1.start_units = 14;
//ds_list_add(selector_list, us1.id);

us2.my_unit     = "TANK";
us2.my_sprite   = spr_Tank_Icon;
us2.icon_sprite = spr_Tank_Dropdown;
us2.unit_cost   = 40;
//us2.start_units = 4;
//ds_list_add(selector_list, us2.id);

us3.my_unit     = "ENGINEER";
us3.my_sprite   = spr_Engineer_Icon;
us3.icon_sprite = spr_Engineer_Dropdown;
us3.unit_cost   = 15;
//us3.start_units = 4;
//ds_list_add(selector_list, us3.id);

us4.my_unit     = "BTR";
us4.my_sprite   = spr_BTR_Icon;
us4.icon_sprite = spr_BTR_Dropdown;
us4.unit_cost   = 30;
//us4.start_units = 6;
//ds_list_add(selector_list, us4.id);

us5.my_unit     = "LOGI";
us5.my_sprite   = spr_Logi_Icon;
us5.icon_sprite = spr_Logi_Dropdown;
us5.unit_cost   = 15;
//us5.start_units = 2;
//ds_list_add(selector_list, us5.id);

sa1.my_squad = "ALPHA";
sa1.squad_list = global.temp_alpha;
//ds_list_add(assigner_list, sa1.id);

sa2.my_squad = "BRAVO";
sa2.squad_list = global.temp_bravo;
//ds_list_add(assigner_list, sa2.id);

sa3.my_squad = "CHARLIE";
sa3.squad_list = global.temp_charlie;
//ds_list_add(assigner_list, sa3.id);

sa4.my_squad = "DELTA";
sa4.squad_list = global.temp_delta;
//ds_list_add(assigner_list, sa4.id);

sa5.my_squad = "ECHO";
sa5.squad_list = global.temp_echo;
//ds_list_add(assigner_list, sa5.id);


