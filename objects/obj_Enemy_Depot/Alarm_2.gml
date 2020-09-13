timer_count -= 1;

if timer_count > 0 { timer_start = true; }
    else if timer_count <= 0 {
        if shoot_amount > 0 {
            switch weapon {
                case "RIFLE":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_INFANTRY" { 
                                rifle_ammo += other.rifle_supply_rate; 
                            }
                        }
                    }
                    break;
                case "RPG":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_INFANTRY" { 
                                rpg_ammo += other.rpg_supply_rate;
                            }
                        }
                    }
                    break;
                case "FLARE":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_INFANTRY" { 
                                flare_ammo += other.flare_supply_rate;
                            }
                        }
                    }
                    break;
                case "CANNON":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_TANK" { 
                                cannon_ammo += other.cannon_supply_rate;
                            }
                        }
                    }
                    break;
                case "MG":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_TANK" { 
                                mg_ammo += other.mg_supply_rate; 
                            }
                                else if unit_type == "E_REPAIR" { 
                                    mg_ammo += other.repairmg_supply_rate;
                                }
                        }
                    }
                    break;
                case "DEPOT":
                    shoot_parts = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_ENGINEER" { 
                                depot_supply += 1;
                            }
                        }
                    }
                    break;
                case "REPAIR":
                    shoot_parts = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_ENGINEER" { 
                                repair_supply += 1;
                            }
                        }
                    }
                    break;
                case "TOW":
                    shoot_parts = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_ENGINEER" { 
                                tow_supply += 1;
                            }
                        }
                    }
                    break;
                case "MORTAR":
                    shoot_parts = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_ENGINEER" { 
                                mortar_supply += 1;
                            }
                        }
                    }
                    break;
                case "HE":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_BTR" { 
                                he_ammo += other.he_supply_rate;
                            }
                        }
                    }
                    break;
                case "AP":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_BTR" { 
                                ap_ammo += other.ap_supply_rate;
                            }
                        }
                    }
                    break;
                case "AMMO":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_LOGI" { 
                                ammo_supply += other.ammo_supply_rate; 
                            }
                                else if unit_type == "E_DEPOT" { 
                                    ammunition_ammo += other.depotammo_supply_rate; 
                                }
                        }
                    }
                    break;
                case "PARTS":
                    shoot_parts = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_LOGI" { 
                                building_supply += other.building_supply_rate; 
                            }
                                else if unit_type == "E_DEPOT" { 
                                    parts_ammo += other.depotparts_supply_rate; 
                                }
                                    else if unit_type == "E_REPAIR" { 
                                        repair_ammo += other.repairS_supply_rate; 
                                    }
                        }
                    }
                    break;
                case "TOWSTATIC":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_TOW" { 
                                tow_ammo += other.towS_supply_rate;
                            }
                        }
                    }
                    break;
                case "MORTARSTATIC":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_MORTAR" { 
                                mortar_ammo += other.mortarS_supply_rate;
                            }
                        }
                    }
                    break;
                default:
                    break;
            }
        }
            else {
                timer_start = false;
                alarm[8] = 60;
                action_confirmed = false;
                resupply_unit.resupplying = false;
                switch weapon {
                    case "RIFLE":
	                    shoot_ammunition = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_INFANTRY" { 
	                                rifle_ammo += other.rifle_supply_rate; 
	                            }
	                        }
	                    }
	                    break;
	                case "RPG":
	                    shoot_ammunition = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_INFANTRY" { 
	                                rpg_ammo += other.rpg_supply_rate;
	                            }
	                        }
	                    }
	                    break;
	                case "FLARE":
	                    shoot_ammunition = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_INFANTRY" { 
	                                flare_ammo += other.flare_supply_rate;
	                            }
	                        }
	                    }
	                    break;
	                case "CANNON":
	                    shoot_ammunition = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_TANK" { 
	                                cannon_ammo += other.cannon_supply_rate;
	                            }
	                        }
	                    }
	                    break;
	                case "MG":
	                    shoot_ammunition = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_TANK" { 
	                                mg_ammo += other.mg_supply_rate; 
	                            }
	                                else if unit_type == "E_REPAIR" { 
	                                    mg_ammo += other.repairmg_supply_rate;
	                                }
	                        }
	                    }
	                    break;
	                case "DEPOT":
	                    shoot_parts = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_ENGINEER" { 
	                                depot_supply += 1;
	                            }
	                        }
	                    }
	                    break;
	                case "REPAIR":
	                    shoot_parts = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_ENGINEER" { 
	                                repair_supply += 1;
	                            }
	                        }
	                    }
	                    break;
	                case "TOW":
	                    shoot_parts = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_ENGINEER" { 
	                                tow_supply += 1;
	                            }
	                        }
	                    }
	                    break;
	                case "MORTAR":
	                    shoot_parts = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_ENGINEER" { 
	                                mortar_supply += 1;
	                            }
	                        }
	                    }
	                    break;
	                case "HE":
	                    shoot_ammunition = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_BTR" { 
	                                he_ammo += other.he_supply_rate;
	                            }
	                        }
	                    }
	                    break;
	                case "AP":
	                    shoot_ammunition = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_BTR" { 
	                                ap_ammo += other.ap_supply_rate;
	                            }
	                        }
	                    }
	                    break;
	                case "AMMO":
	                    shoot_ammunition = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_LOGI" { 
	                                ammo_supply += other.ammo_supply_rate; 
	                            }
	                                else if unit_type == "E_DEPOT" { 
	                                    ammunition_ammo += other.depotammo_supply_rate; 
	                                }
	                        }
	                    }
	                    break;
	                case "PARTS":
	                    shoot_parts = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_LOGI" { 
	                                building_supply += other.building_supply_rate; 
	                            }
	                                else if unit_type == "E_DEPOT" { 
	                                    parts_ammo += other.depotparts_supply_rate; 
	                                }
	                                    else if unit_type == "E_REPAIR" { 
	                                        repair_ammo += other.repairS_supply_rate; 
	                                    }
	                        }
	                    }
	                    break;
	                case "TOWSTATIC":
	                    shoot_ammunition = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_TOW" { 
	                                tow_ammo += other.towS_supply_rate;
	                            }
	                        }
	                    }
	                    break;
	                case "MORTARSTATIC":
	                    shoot_ammunition = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_MORTAR" { 
	                                mortar_ammo += other.mortarS_supply_rate;
	                            }
	                        }
	                    }
	                    break;
	                default:
	                    break;
                }
            }
    }

