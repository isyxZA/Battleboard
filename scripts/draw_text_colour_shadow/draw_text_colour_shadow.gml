/// @description draw_text_colour_shadow(x, y, string, c1, c2, c3, c4, shadow length, shadow direction, shadow colour, shadow alpha);
/// @param x
/// @param  y
/// @param  string
/// @param  c1
/// @param  c2
/// @param  c3
/// @param  c4
/// @param  shadow length
/// @param  shadow direction
/// @param  shadow colour
/// @param  shadow alpha
function draw_text_colour_shadow(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) {
	// @tehwave

	/*  Argument            Description

	0   x                   The x coordinate of the drawn string. 
	1   y                   The y coordinate of the drawn string. 
	2   string              The string to draw.
	3   c1                  The colour for the top left of the shadow.
	4   c2                  The colour for the top right of the shadow.
	5   c3                  The colour for the bottom right of the shadow.
	6   c4                  The colour for the bottom left of the shadow.  

	7   shadow length       The distance in pixels between text and shadow.      
	8   shadow direction    The angle of the shadow.
	9   shadow colour       The colour of the shadow.
	10  shadow alpha        The alpha of the shadow.
	*/

	//init & assign vars
	var xx = argument0, yy = argument1, str = argument2, sh_len = argument7,
	    sh_dir = argument8, prev_alpha = draw_get_alpha(), prev_col = draw_get_colour();
    
	//draw text shadow
	draw_set_colour(argument9);
	draw_set_alpha(argument10);
	draw_text(xx+lengthdir_x(sh_len,sh_dir),yy+lengthdir_y(sh_len,sh_dir), string_hash_to_newline(str));

	//draw text
	draw_text_colour(xx, yy, string_hash_to_newline(str), argument3, argument4, argument5, argument6,prev_alpha);

	//reset to the previous color and alpha
	draw_set_alpha(prev_alpha);
	draw_set_colour(prev_col);



}
