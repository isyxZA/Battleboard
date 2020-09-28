light_size = 24;
light_strength = 1;

active = false;
turn_start = false;
can_execute = true;

turn_ap = 0;
ap_max = turn_ap;

state = "IDLE";
can_spawn = true;
can_move = false;
can_fire = false;

active_timer = 0;
if global.turn_timer == 99 { turn_max = 20; }
	else { turn_max = 15; }

active_squad = "NOONE";
active_list = -1;
active_x = 0;
active_y = 0;

squad_1_active = false;
squad_2_active = false;
squad_3_active = false;
squad_4_active = false;
squad_5_active = false;

squad_1x = 0;
squad_1y = 0;
squad_2x = 0;
squad_2y = 0;
squad_3x = 0;
squad_3y = 0;
squad_4x = 0;
squad_4y = 0;
squad_5x = 0;
squad_5y = 0;

tile_list = ds_list_create();

target_x = x;
target_y = y;

can_reinforce = true;
idle_count = 0;

infantry_amount = 10;
tank_amount = 8;
engineer_amount = 2;
btr_amount = 12;
logi_amount = 2;

spawn_infantry = true;
spawn_tank = false;
spawn_engineer = false;
spawn_btr = false;
spawn_logi = false;

objective1_x = global.objective_1.x;
objective1_y = global.objective_1.y;
objective2_x = global.objective_2.x;
objective2_y = global.objective_2.y;
objective3_x = global.objective_3.x;
objective3_y = global.objective_3.y;

with obj_CONTROL { enemy_controller = other.id; }

if PLAYER.player == "ONE" { 
	p_one = true; 
}
	else { 
		p_one = false; 
	}
	

