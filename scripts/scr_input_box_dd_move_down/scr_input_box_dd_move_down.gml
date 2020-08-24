///@function scr_input_box_dd_move_down();
///@description Move the selection down
function scr_input_box_dd_move_down() {
	if (selected == true)
	{
		if (selection < array_length_1d(dropdownOptions)-1)
		{selection += 1;}
	}


}
