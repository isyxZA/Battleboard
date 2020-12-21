start_points = 750;
formation_points = start_points;
formation = 1;
c1 = c_white;
global.temp_alpha   = ds_list_create();
global.temp_bravo   = ds_list_create();
global.temp_charlie = ds_list_create();
global.temp_delta   = ds_list_create();
global.temp_echo    = ds_list_create();
global.temp_infantry  = ds_list_create();
global.temp_tank      = ds_list_create();
global.temp_engineer  = ds_list_create();
global.temp_btr       = ds_list_create();
global.temp_logi      = ds_list_create();

auto_assign = true;
ready = false;
clear = false;

//Spawn selector buttons and assign unit type and amount
us1 = instance_create_layer(712 , 360, "Buttons", obj_UnitSelector);//Infantry
us2 = instance_create_layer(836 , 360, "Buttons", obj_UnitSelector);//Tank
us3 = instance_create_layer(960 , 360, "Buttons", obj_UnitSelector);//Engineer
us4 = instance_create_layer(1084, 360, "Buttons", obj_UnitSelector);//BTR
us5 = instance_create_layer(1208, 360, "Buttons", obj_UnitSelector);//Logi

//Spawn squad assigner ships and assign a squad
sa1 = instance_create_layer(960 , 590, "Buttons", obj_SquadAssigner);//Alpha
sa2 = instance_create_layer(848 , 610, "Buttons", obj_SquadAssigner);//Bravo
sa3 = instance_create_layer(1072, 610, "Buttons", obj_SquadAssigner);//Charlie
sa4 = instance_create_layer(736 , 630, "Buttons", obj_SquadAssigner);//Delta
sa5 = instance_create_layer(1184, 630, "Buttons", obj_SquadAssigner);//Echo

//Spawn reserve assigners and assign unit type
rs1 = instance_create_layer(x-260, 928, "Buttons", obj_ReserveAssigner);//INF
rs2 = instance_create_layer(x-130, 928, "Buttons", obj_ReserveAssigner);//MBT
rs3 = instance_create_layer(x    , 928, "Buttons", obj_ReserveAssigner);//ENG
rs4 = instance_create_layer(x+130, 928, "Buttons", obj_ReserveAssigner);//BTR
rs5 = instance_create_layer(x+260, 928, "Buttons", obj_ReserveAssigner);//LOG

us1.unit_class  = "INF";
us1.my_unit     = "INF_A";
us1.my_sprite   = spr_INFA_Icon;
us1.icon_sprite = spr_INFA_Dropdown;
us1.unit_cost   = INF_1;

us2.unit_class  = "MBT";
us2.my_unit     = "MBT_A";
us2.my_sprite   = spr_MBTA_Icon;
us2.icon_sprite = spr_MBTA_Dropdown;
us2.unit_cost   = MBT_1;

us3.unit_class  = "LAC";
us3.my_unit     = "LAC_A";
us3.my_sprite   = spr_LACA_Icon;
us3.icon_sprite = spr_LACA_Dropdown;
us3.unit_cost   = LAC_1;

us4.unit_class  = "LAV";
us4.my_unit     = "LAV_A";
us4.my_sprite   = spr_LAVA_Icon;
us4.icon_sprite = spr_LAVA_Dropdown;
us4.unit_cost   = LAV_1;

us5.unit_class  = "LOG";
us5.my_unit     = "LOGI_A";
us5.my_sprite   = spr_LOGIA_Icon;
us5.icon_sprite = spr_LOGIA_Dropdown;
us5.unit_cost   = LOG_1;

sa1.my_squad = "ALPHA";
sa1.squad_list = global.temp_alpha;

sa2.my_squad = "BRAVO";
sa2.squad_list = global.temp_bravo;

sa3.my_squad = "CHARLIE";
sa3.squad_list = global.temp_charlie;

sa4.my_squad = "DELTA";
sa4.squad_list = global.temp_delta;

sa5.my_squad = "ECHO";
sa5.squad_list = global.temp_echo;

rs1.my_class   = "INF";
rs1.squad_list = global.temp_infantry;

rs2.my_class   = "MBT";
rs2.squad_list = global.temp_tank;

rs3.my_class   = "LAC";
rs3.squad_list = global.temp_engineer;

rs4.my_class   = "LAV";
rs4.squad_list = global.temp_btr;

rs5.my_class   = "LOG";
rs5.squad_list = global.temp_logi;

