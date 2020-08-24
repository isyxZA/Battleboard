///@function scr_input_box_dd_init(left,top,right,rowHeight,xOffset,yOffset,font,defaultOption);
///@description Initialize the dropdown box
///@param {real} left The x coordinate to start drawing the dropdown box
///@param {real} top The y coordinate to start drawing the dropdown box
///@param {real} right The x coordinate to finish drawing the dropdown box
///@param {real} rowHeight The height of each row in the dropdown box
///@param {real} xOffset The amount of pixels from left to start drawing the dropdown text
///@param {real} yOffset The amount of pixels from top to start drawing the dropdown text
///@param {id} font The font of the input text
///@param {real} defaultOption The option to be selected as default (0 for first option)
///Place in Create event
function scr_input_box_dd_init(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {
	left = argument0;
	top = argument1;
	right = argument2;
	rowHeight = argument3;
	xOffset = argument4;
	yOffset = argument5;
	font = argument6;
	defaultOption = argument7;
	selection = defaultOption;
	selected = false;
	dd = true;//is a dropdown box (used for switching)
	mouseX = mouse_x;
	mouseY = mouse_y;


}
