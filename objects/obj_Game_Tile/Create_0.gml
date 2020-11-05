if global.grid_size == 40 { origin = 1440; }
img = -1;
//Tile variables
height_rating = irandom(4);
move_rating   = irandom_range(1, 4);
if PLAYER.player == "ONE" { 
	p_one = true; 
}
	else { 
		p_one = false;
	}
//Tile center point
tile_x = x+(sprite_get_width(sprite_index)*0.5);
tile_y = y+(sprite_get_height(sprite_index)*0.5);
//Store tile in list
ds_list_add(global.tile_list, id);
tile_num = ds_list_find_index(global.tile_list, id)+1;
//Is tile visible to player
is_visible = false;
//Units in view range
unit_count = 0;
//Is tile occupied
occupied = false;
can_draw = true;
my_colour = c_green;
