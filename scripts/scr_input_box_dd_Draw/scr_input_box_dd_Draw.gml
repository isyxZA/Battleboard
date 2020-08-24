///@function scr_input_box_dd_Draw(drawBox,drawBoxFill,boxSelectedColour,boxSelectedFillColour,boxUnselectedColour,boxUnselectedFillColour,textSelectedColour,textUnselectedColour,highlightColour,dropdownArrowSprite);
///@description Draw the dropdown box
///@param {bool} drawBox Whether to draw the dropdown box border
///@param {bool} drawBoxFill Whether to draw the dropdown box fill
///@param {real} boxSelectedColour The selected colour of the dropdown box border
///@param {real} boxSelectedFillColour The selected colour to fill the dropdown box
///@param {real} boxUnselectedColour The unselected colour of the dropdown box border
///@param {real} boxUnselectedFillColour The unselected colour to fill the dropdown box
///@param {real} textSelectedColour The selected colour of the dropdown text
///@param {real} textUnselectedColour The unselected colour of the dropdown text
///@param {real} highlightColour The colour of highlighting text
///@param {id} dropdownArrowSprite The sprite index for the dropdown box arrow
function scr_input_box_dd_Draw(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {

	var _drawBox = argument0;
	var _drawBoxFill = argument1;
	var _boxSelectedColour = argument2;
	var _boxSelectedFillColour = argument3;
	var _boxUnselectedColour = argument4;
	var _boxUnselectedFillColour = argument5;
	var _textSelectedColour = argument6;
	var _textUnselectedColour = argument7;
	var _highlightColour = argument8;
	var _dropdownArrowSprite = argument9;

	if (selected == true)
	{
		//box
		if (_drawBoxFill == true)
		{draw_rectangle_colour(left,top,right,top+rowHeight+(rowHeight*array_length_1d(dropdownOptions)),_boxSelectedFillColour,_boxSelectedFillColour,_boxSelectedFillColour,_boxSelectedFillColour,0);}
		if (_drawBox == true)
		{draw_rectangle_colour(left,top,right,top+rowHeight+(rowHeight*array_length_1d(dropdownOptions)),_boxSelectedColour,_boxSelectedColour,_boxSelectedColour,_boxSelectedColour,1);}
		draw_set_font(font);
		draw_set_colour(_textSelectedColour);
		//selection
		draw_text(left+xOffset,top+yOffset,dropdownOptions[selection]);
		//highlight
		draw_rectangle_colour(left,top+rowHeight+(rowHeight*selection),right,top+rowHeight+(rowHeight*selection)+rowHeight,_highlightColour,_highlightColour,_highlightColour,_highlightColour,0);
		//options
		for (var _i=0; _i<array_length_1d(dropdownOptions); _i++)
		{draw_text(left+xOffset,top+yOffset+rowHeight+(rowHeight*_i),dropdownOptions[_i]);}
	}
	else
	{
		//box
		if (_drawBoxFill == true)
		{draw_rectangle_colour(left,top,right,top+(rowHeight),_boxUnselectedFillColour,_boxUnselectedFillColour,_boxUnselectedFillColour,_boxUnselectedFillColour,0);}
		if (_drawBox == true)
		{draw_rectangle_colour(left,top,right,top+(rowHeight),_boxUnselectedColour,_boxUnselectedColour,_boxUnselectedColour,_boxUnselectedColour,1);}
		draw_set_font(font);
		draw_set_colour(_textUnselectedColour);
		//selection
		draw_text(left+xOffset,top+yOffset,dropdownOptions[selection]);
	}

	draw_sprite(_dropdownArrowSprite,0,right-sprite_get_width(_dropdownArrowSprite),top+(rowHeight/2));


}
