/// @description draw_text_transformed_shadow(x, y, string, xscale, yscale, angle, shadow length, shadow direction, shadow color, shadow alpha);
/// @param x
/// @param  y
/// @param  string
/// @param  xscale
/// @param  yscale
/// @param  angle
/// @param  shadow length
/// @param  shadow direction
/// @param  shadow color
/// @param  shadow alpha
function draw_text_transformed_shadow(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {
	//@tehwave

	/*  Argument            Description

	0   x                   The x coordinate of the drawn string. 
	1   y                   The y coordinate of the drawn string. 
	2   string              The string to draw. 
	3   xscale              The horizontal scale (default 1).
	4   yscale              The vertical scale(default 1).
	5   angle               The angle of the text.
    
	6   shadow length       The distance in pixels between text and shadow.
	7   shadow direction    The angle of the shadow.
	8   shadow color        The color of the shadow.
	9   shadow alpha        The alpha of the shadow.
	*/

	//init & assign vars
	var xx = argument0, yy = argument1, str = argument2, xscale = argument3,
	    yscale = argument4, angle = argument5, sh_len = argument6,
	    sh_dir = argument7, prev_alpha = draw_get_alpha(), prev_col = draw_get_color()
    
	//draw text shadow
	draw_set_color(argument8);
	draw_set_alpha(argument9);
	draw_text_transformed(xx+lengthdir_x(sh_len,sh_dir),yy+lengthdir_y(sh_len,sh_dir),string_hash_to_newline(str), xscale, yscale, angle);

	//draw text
	draw_set_color(prev_col);
	draw_set_alpha(prev_alpha);
	draw_text_transformed(xx, yy, string_hash_to_newline(str), xscale, yscale, angle);




}
