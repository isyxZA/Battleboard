///@function scr_input_box_Global_Left_Pressed();
///@description Set the input box to take or stop taking input with mouse click
function scr_input_box_Global_Left_Pressed() {
	if (mouse_x >= left && mouse_y >= top && mouse_x <= right && mouse_y <= bottom)
	{
		if (selected == false)
		{
			keyboard_string = text;
			selected = true;
			if (vBarInterval > -1)
			{
				vBar = "|";
				alarm[0] = vBarInterval;
			}
		}
		else
		if (selectAll == true)
		{selectAll = false;}
	}
	else if (selected == true)
	{scr_input_box_unselect();}


}
