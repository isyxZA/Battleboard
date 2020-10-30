map_size = global.cell_size*global.grid_size;
global.min_x = x;
global.max_x = x+map_size;
global.min_y = y;
global.max_y = y+map_size;

//Create ground layer and tilemaps
global.ground_layer  = layer_get_id("Ground");
//Initialise motion planning grid
global.move_grid = mp_grid_create(x, y, global.grid_size, global.grid_size, global.cell_size, global.cell_size);
if PLAYER.net_status != "NONE" {
	global.net_move_grid = mp_grid_create(x, y, global.grid_size, global.grid_size, global.cell_size, global.cell_size);
}
	else global.net_move_grid = -1;

//Create the game board
//Spawn tile objects
var ww = 0;
var hh = 0;
for (hh=0; hh<global.grid_size; hh+=1) {
    for (ww=0; ww<global.grid_size; ww+=1) {
        instance_create_layer(x+(ww*global.cell_size), y+(hh*global.cell_size), global.ground_layer, obj_Game_Tile);
    }
}

instance_create_layer(0, 0, "Ground"  , obj_Shader_Noise);
instance_create_layer(0, 0, "GroundFX", obj_Shader_Reset);

//instance_create_layer(0, 0, "Ground", obj_Shader_Hue);







