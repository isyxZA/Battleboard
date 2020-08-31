/// @description Check for enemy units in view range
if fade_out == false {
    view_range += 2;
}
    else if fade_out == true {
        view_range -= 8;
    }
if view_range < 0 view_range = 0;
view_radius = global.cell_size*view_range;
alarm[2] = global.tick_rate*4;




