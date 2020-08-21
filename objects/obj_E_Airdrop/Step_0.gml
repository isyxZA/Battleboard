if global.opponent_turn == true || global.enemy_waiting == true {
    if timer_start == true {
        timer_start = false;
        alarm[0] = global.tick_rate;
    }
}

if explode == true {
    if image_index > (sprite_get_number(spr_Smoke_1)-1) { 
        ///global.enemy_airdrop = false;
        with target_depot{ 
            resupplying = false; 
            parts_ammo = parts_max;
            ammunition_ammo = ammunition_max;
        }
        instance_destroy(); 
    }
}


