///@function scr_input_box_unselect();
///@description Set the input box to stop taking input
function scr_input_box_unselect() {
	if (selected == true)
	{
		selected = false;
		selectAll = false;
		vBar = "";
		alarm[0] = -1;
	}
}
