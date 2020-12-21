var t = instance_place(x, y, obj_Game_Tile);
if t != noone {
	t.my_colour = c_red;
}
mp_grid_add_rectangle(global.move_grid    , x-36, y-36, x+36, y+36);
mp_grid_add_rectangle(global.inf_move_grid, x-36, y-36, x+36, y+36);
if PLAYER.net_status != "NONE" { mp_grid_add_rectangle(global.net_move_grid, x-36, y-36, x+36, y+36); }

alarm[0] = round(random(180));
