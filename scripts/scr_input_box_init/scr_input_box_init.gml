///@function scr_input_box_init(left,top,right,bottom,xOffset,yOffset,maxWidth,font,hidden,hiddenFont,hiddenSymbol,defaultText,startSelected,vBarInterval);
///@description Initialize the input box variables
///@param {real} left The x coordinate to start drawing the input box
///@param {real} top The y coordinate to start drawing the input box
///@param {real} right The x coordinate to finish drawing the input box
///@param {real} bottom The y coordinate to finish drawing the input box
///@param {real} xOffset The amount of pixels from left to start drawing the input text
///@param {real} yOffset The amount of pixels from top to start drawing the input text
///@param {real} maxWidth The max width in pixels the input text can be
///@param {id} font The font of the input text
///@param {bool} hidden Whether the input text is converted to the hiddensymbol
///@param {id} hiddenFont The font to use for the hidden text
///@param {string} hiddenSymbol The symbol to use for the hidden text (e.g. *)
///@param {string} defaultText The default text shown in the input box
///@param {bool} startSelected Whether the input box will take input as soon as its created or must be clicked first
///@param {real} vBarInterval The amount of steps/frames for the vbar to be shown/hidden (-1 to not show a vbar)
///Place in Create event
function scr_input_box_init(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13) 
{

	left = argument0;
	top = argument1;
	right = argument2;
	bottom = argument3;
	xOffset = argument4;
	yOffset = argument5;
	maxWidth = argument6;
	font = argument7;
	hidden = argument8;
	hiddenFont = argument9;
	hiddenSymbol = argument10;
	text = argument11;
	selected = argument12;
	vBarInterval = argument13;

	displayText = text;
	selectAll = false;
	if (vBarInterval > -1)
	{vBar = "|";}
	else
	{vBar = "";}

	//start selected
	if (selected == true)
	{
		keyboard_string = text;
		if (vBarInterval > -1)
		{alarm[0] = vBarInterval;}	
	}

	//not a dropdown box (used for switching)
	dd = false;
}
