timer_count -= 1;

if timer_count > 0 { timer_start = true; }
    else if timer_count <= 0 {
        if shoot_amount > 0 {
            switch weapon {
                case "RIFLE":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_INFA" { 
                                rifle_ammo += other.rfl_supply_rate; 
                            }
                        }
                    }
                    break;
                case "RPG":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_INFA" { 
                                rpg_ammo += other.rpg_supply_rate;
                            }
                        }
                    }
                    break;
                case "FLARE":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_INFA" { 
                                flare_ammo += other.flr_supply_rate;
                            }
                        }
                    }
                    break;
                case "CANNON":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_MBTA" { 
                                cannon_ammo += other.mbtap_supply_rate;
                            }
                        }
                    }
                    break;
                case "MG":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_MBTA" { 
                                mg_ammo += other.mbtmg_supply_rate; 
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
                            if unit_type == "E_LACA" { 
                                depot_supply += 1;
                            }
                        }
                    }
                    break;
                case "REPAIR":
                    shoot_parts = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_LACA" { 
                                repair_supply += 1;
                            }
                        }
                    }
                    break;
                case "TOW":
                    shoot_parts = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_LACA" { 
                                tow_supply += 1;
                            }
                        }
                    }
                    break;
                case "MORTAR":
                    shoot_parts = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_LACA" { 
                                mortar_supply += 1;
                            }
                        }
                    }
                    break;
                case "HE":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_LAVA" { 
                                he_ammo += other.lavhe_supply_rate;
                            }
                        }
                    }
                    break;
                case "AP":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_LAVA" { 
                                ap_ammo += other.lavap_supply_rate;
                            }
                        }
                    }
                    break;
                case "AMMO":
                    shoot_ammunition = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_LOGIA" { 
                                ammo_supply += other.logiamo_supply_rate; 
                            }
                                else if unit_type == "E_DEPOT" { 
                                    ammunition_ammo += other.depotamo_supply_rate; 
                                }
                        }
                    }
                    break;
                case "PARTS":
                    shoot_parts = true;
                    if resupply_unit != noone {
                        with resupply_unit { 
                            if unit_type == "E_LOGIA" { 
                                building_supply += other.logibld_supply_rate; 
                            }
                                else if unit_type == "E_DEPOT" { 
                                    parts_ammo += other.depotbld_supply_rate; 
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
	                            if unit_type == "E_INFA" { 
	                                rifle_ammo += other.rfl_supply_rate; 
	                            }
	                        }
	                    }
	                    break;
	                case "RPG":
	                    shoot_ammunition = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_INFA" { 
	                                rpg_ammo += other.rpg_supply_rate;
	                            }
	                        }
	                    }
	                    break;
	                case "FLARE":
	                    shoot_ammunition = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_INFA" { 
	                                flare_ammo += other.flr_supply_rate;
	                            }
	                        }
	                    }
	                    break;
	                case "CANNON":
	                    shoot_ammunition = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_MBTA" { 
	                                cannon_ammo += other.mbtap_supply_rate;
	                            }
	                        }
	                    }
	                    break;
	                case "MG":
	                    shoot_ammunition = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_MBTA" { 
	                                mg_ammo += other.mbtmg_supply_rate; 
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
	                            if unit_type == "E_LACA" { 
	                                depot_supply += 1;
	                            }
	                        }
	                    }
	                    break;
	                case "REPAIR":
	                    shoot_parts = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_LACA" { 
	                                repair_supply += 1;
	                            }
	                        }
	                    }
	                    break;
	                case "TOW":
	                    shoot_parts = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_LACA" { 
	                                tow_supply += 1;
	                            }
	                        }
	                    }
	                    break;
	                case "MORTAR":
	                    shoot_parts = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_LACA" { 
	                                mortar_supply += 1;
	                            }
	                        }
	                    }
	                    break;
	                case "HE":
	                    shoot_ammunition = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_LAVA" { 
	                                he_ammo += other.lavhe_supply_rate;
	                            }
	                        }
	                    }
	                    break;
	                case "AP":
	                    shoot_ammunition = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_LAVA" { 
	                                ap_ammo += other.lavap_supply_rate;
	                            }
	                        }
	                    }
	                    break;
	                case "AMMO":
	                    shoot_ammunition = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_LOGIA" { 
	                                ammo_supply += other.logiamo_supply_rate; 
	                            }
	                                else if unit_type == "E_DEPOT" { 
	                                    ammunition_ammo += other.depotamo_supply_rate; 
	                                }
	                        }
	                    }
	                    break;
	                case "PARTS":
	                    shoot_parts = true;
	                    if resupply_unit != noone {
	                        with resupply_unit { 
	                            if unit_type == "E_LOGIA" { 
	                                building_supply += other.logibld_supply_rate; 
	                            }
	                                else if unit_type == "E_DEPOT" { 
	                                    parts_ammo += other.depotbld_supply_rate; 
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

