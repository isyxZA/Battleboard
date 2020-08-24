///@function scr_input_box_dd_selection();
///@description Set the dropdown box selection
///Place in Step event
function scr_input_box_dd_selection() {
	if (selected == true)
	{
		if (mouse_x >= left && mouse_y >= top && mouse_x <= right && mouse_y <= top+rowHeight+(rowHeight*array_length_1d(dropdownOptions)))
		{
			if (mouseX != mouse_x || mouseY != mouse_y)
			{
				mouseX = mouse_x;
				mouseY = mouse_y;
				for (var _i=0; _i<array_length_1d(dropdownOptions); _i++)
				{
					if (mouse_y >= top+rowHeight+(rowHeight*_i) && mouse_y <= top+rowHeight+(rowHeight*_i)+rowHeight)
					{selection = _i;}
				}
			}
		}
	}


}
