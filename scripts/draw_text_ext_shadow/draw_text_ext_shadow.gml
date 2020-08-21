/// @description draw_text_ext_shadow(x, y, string, sep, w, shadow length, shadow direction, shadow color, shadow alpha);
/// @param x
/// @param  y
/// @param  string
/// @param  sep
/// @param  w
/// @param  shadow length
/// @param  shadow direction
/// @param  shadow color
/// @param  shadow alpha
function draw_text_ext_shadow(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	//@tehwave

	/*  Argument            Description

	0   x                   The x coordinate of the drawn string. 
	1   y                   The y coordinate of the drawn string. 
	2   string              The string to draw. 
	3   sep                 The distance in pixels between lines of text. 
	4   w                   The maximum width in pixels of the string before a line break.
    
	5   shadow length       The distance in pixels between text and shadow.
	6   shadow direction    The angle of the shadow.
	7   shadow color        The color of the shadow.
	8   shadow alpha        The alpha of the shadow.
	*/

	//init & assign vars
	var xx = argument0; 
	var yy = argument1;
	var str = argument2; 
	var sh_len = argument5;
	var sh_dir = argument6; 
	var prev_alpha = draw_get_alpha();
	var prev_col = draw_get_color();
	var sep = argument3;
	var w = argument4;
    
	//draw text shadow
	draw_set_color(argument7);
	draw_set_alpha(argument8);
	draw_text_ext(xx+lengthdir_x(sh_len,sh_dir),yy+lengthdir_y(sh_len,sh_dir),string_hash_to_newline(str), sep, w);

	//draw text
	draw_set_color(prev_col);
	draw_set_alpha(prev_alpha);
	draw_text_ext(xx, yy, string_hash_to_newline(str), sep, w);




}
