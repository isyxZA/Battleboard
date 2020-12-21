my_tile.my_colour = c_green;
if cant_shoot != -1 { with cant_shoot { instance_destroy(); } }
mp_grid_clear_rectangle(global.move_grid    , x-40, y-40, x+40, y+40);
mp_grid_clear_rectangle(global.inf_move_grid, x-40, y-40, x+40, y+40);
if PLAYER.net_status != "NONE" { mp_grid_clear_rectangle(global.net_move_grid, x-40, y-40, x+40, y+40); }
instance_destroy();

