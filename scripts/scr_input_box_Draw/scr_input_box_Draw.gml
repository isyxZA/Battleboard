///@function scr_input_box_Draw(drawBox,drawBoxFill,boxSelectedColour,boxSelectedFillColour,boxUnselectedColour,boxUnselectedFillColour,textSelectedColour,textUnselectedColour,highlightColour,highlightHeight,hAlign);
///@description Draw the input box
///@param {bool} drawBox Whether to draw the input box border
///@param {bool} drawBoxFill Whether to draw the input box fill
///@param {real} boxSelectedColour The selected colour of the input box border
///@param {real} boxSelectedFillColour The selected colour to fill the input box
///@param {real} boxUnselectedColour The unselected colour of the input box border
///@param {real} boxUnselectedFillColour The unselected colour to fill the input box
///@param {real} textSelectedColour The selected colour of the input text
///@param {real} textUnselectedColour The unselected colour of the input text
///@param {real} highlightColour The colour of highlighting text
///@param {real} highlightHeight The height of the highlighting
///@param {real} hAlign The horizontal alignment of the text (0 = left, 1 = center, 2 = right)
function scr_input_box_Draw(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) {

	var _drawBox = argument0;
	var _drawBoxFill = argument1;
	var _boxSelectedColour = argument2;
	var _boxSelectedFillColour = argument3;
	var _boxUnselectedColour = argument4;
	var _boxUnselectedFillColour = argument5;
	var _textSelectedColour = argument6;
	var _textUnselectedColour = argument7;
	var _highlightColour = argument8;
	var _highlightHeight = argument9;
	var _hAlign = argument10;

	if (hidden == true)
	{draw_set_font(hiddenFont);}
	else
	{draw_set_font(font);}

	if (selected == true)
	{
		if (_drawBoxFill == true)
		{draw_rectangle_colour(left,top,right,bottom,_boxSelectedFillColour,_boxSelectedFillColour,_boxSelectedFillColour,_boxSelectedFillColour,0);}

		if (_drawBox == true)
		{draw_rectangle_colour(left,top,right,bottom,_boxSelectedColour,_boxSelectedColour,_boxSelectedColour,_boxSelectedColour,1);}
	
		draw_set_colour(_textSelectedColour);
		switch (_hAlign)
		{
			case 0:
			if (selectAll == true)
			{draw_rectangle_colour(left+xOffset,top+yOffset,left+xOffset+string_width(displayText),top+yOffset+_highlightHeight,_highlightColour,_highlightColour,_highlightColour,_highlightColour,0);}
			draw_text(left+xOffset,top+yOffset,displayText+vBar);
			break;
			case 1:
			if (selectAll == true)
			{draw_rectangle_colour(((left+right)/2)-(string_width(displayText)/2),top+yOffset,((left+right)/2)+(string_width(displayText)/2),top+yOffset+_highlightHeight,_highlightColour,_highlightColour,_highlightColour,_highlightColour,0);}
			draw_set_halign(fa_center);
			draw_text((left+right)/2,top+yOffset,displayText);
			draw_text(((left+right)/2)+(string_width(displayText)/2)+2,top+yOffset,vBar);
			draw_set_halign(fa_left);
			break;
			case 2:
			if (selectAll == true)
			{draw_rectangle_colour(right-xOffset-string_width(displayText),top+yOffset,right-xOffset,top+yOffset+_highlightHeight,_highlightColour,_highlightColour,_highlightColour,_highlightColour,0);}
			draw_set_halign(fa_right);
			draw_text(right-xOffset,top+yOffset,displayText);
			draw_text(right,top+yOffset,vBar);
			draw_set_halign(fa_left);
			break;
		}
	}
	else
	{
		if (_drawBoxFill == true)
		{draw_rectangle_colour(left,top,right,bottom,_boxUnselectedFillColour,_boxUnselectedFillColour,_boxUnselectedFillColour,_boxUnselectedFillColour,0);}

		if (_drawBox == true)
		{draw_rectangle_colour(left,top,right,bottom,_boxUnselectedColour,_boxUnselectedColour,_boxUnselectedColour,_boxUnselectedColour,1);}
	
		draw_set_colour(_textUnselectedColour);
		switch (_hAlign)
		{
			case 0:
			draw_text(left+xOffset,top+yOffset,displayText);
			break;
			case 1:
			draw_set_halign(fa_center);
			draw_text((left+right)/2,top+yOffset,displayText);
			draw_set_halign(fa_left);
			break;
			case 2:
			draw_set_halign(fa_right);
			draw_text(right-xOffset,top+yOffset,displayText);
			draw_set_halign(fa_left);
			break;
		}
	}
}
