if global.my_turn == true {
    var t = instance_place(x, y, obj_Airdrop_Spawner);
    if t != noone { start_countdown = true; }
}

if start_countdown == true {
    if timer_start == true {
        timer_start = false;
        alarm[0] = global.tick_rate;
    }
}

if explode == true {
    if img > (sprite_get_number(spr_Smoke_1)-1) { 
        global.active_airdrop = false;
        obj_CONTROL.active_airdrop = false;
        global.turn_AP = 0;
        audio_emitter_free(emit);
        with target_depot { 
            resupplying = false; 
            parts_ammo = parts_max;
            ammunition_ammo = ammunition_max;
        }
        instance_destroy(); 
    }
}
