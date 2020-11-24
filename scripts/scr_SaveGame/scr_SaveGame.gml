/// @description Save the game state
function scr_SaveGame(){
	
	
	var save_list = ds_list_create();
	
	with obj_Unit_Parent {
		var s_map = ds_map_create();
		ds_list_add(save_list, s_map);
		ds_list_mark_as_map(save_list, ds_list_size(save_list)-1);
		
		switch unit_type {
			case "INFANTRY":
				ds_map_add(s_map, "x", x);
				ds_map_add(s_map, "y", y);
				ds_map_add(s_map, "unit"  , unit_type);
				ds_map_add(s_map, "health", unit_health);
				ds_map_add(s_map, "rifle" , rifle_ammo);
				ds_map_add(s_map, "rpg"   , rpg_ammo);
				ds_map_add(s_map, "flare" , flare_ammo);
				ds_map_add(s_map, "squad" , my_squad);
				break;
			case "TANK":
				ds_map_add(s_map, "x", x);
				ds_map_add(s_map, "y", y);
				ds_map_add(s_map, "unit"  , unit_type);
				ds_map_add(s_map, "health", unit_health);
				ds_map_add(s_map, "cannon", cannon_ammo);
				ds_map_add(s_map, "mg"    , mg_ammo);
				ds_map_add(s_map, "squad" , my_squad);
				break;
			case "ENGINEER":
				ds_map_add(s_map, "x", x);
				ds_map_add(s_map, "y", y);
				ds_map_add(s_map, "unit"  , unit_type);
				ds_map_add(s_map, "health", unit_health);
				ds_map_add(s_map, "depot" , depot_supply);
				ds_map_add(s_map, "repair", repair_supply);
				ds_map_add(s_map, "tow"   , tow_supply);
				ds_map_add(s_map, "mortar", mortar_supply);
				ds_map_add(s_map, "squad" , my_squad);
				break;
			case "BTR":
				ds_map_add(s_map, "x", x);
				ds_map_add(s_map, "y", y);
				ds_map_add(s_map, "unit"  , unit_type);
				ds_map_add(s_map, "health", unit_health);
				ds_map_add(s_map, "he"    , he_ammo);
				ds_map_add(s_map, "ap"    , ap_ammo);
				ds_map_add(s_map, "squad" , my_squad);
				break;
			case "LOGI":
				ds_map_add(s_map, "x", x);
				ds_map_add(s_map, "y", y);
				ds_map_add(s_map, "unit"  , unit_type);
				ds_map_add(s_map, "health", unit_health);
				ds_map_add(s_map, "ammo"  , ammo_supply);
				ds_map_add(s_map, "parts" , building_supply);
				ds_map_add(s_map, "squad" , my_squad);
				break;
		}
	}
	
	with obj_Enemy_Parent {
		
	}
	
	
}