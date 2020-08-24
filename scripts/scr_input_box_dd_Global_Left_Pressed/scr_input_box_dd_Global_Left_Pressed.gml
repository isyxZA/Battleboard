///@function scr_input_box_dd_Global_Left_Pressed();
///@description Select/unselect the dropdown box
function scr_input_box_dd_Global_Left_Pressed() {
	if (selected == false)
	{
		if (mouse_x >= left && mouse_y >= top && mouse_x <= right && mouse_y <= top+(rowHeight))
		{selected = true;}
	}
	else
	{selected = false;}


}
