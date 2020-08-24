///@function scr_input_box_switch(targetObject);
///@description Unselect the currently selected input box and select the target input box (useful e.g. when pressing the Tab key)
///Must be used in conjunction with scr_input_box_switch_Alarm1
///@param {id} targetObject The input box object to select
function scr_input_box_switch(argument0) {
	if (selected == true && alarm[1] < 0)
	{
		if (dd == false)
		{scr_input_box_unselect();}
		else
		{selected = false;}
		with (argument0)
		{
			if (dd == false)
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
					alarm[1] = 1;
				}
			}
			else
			{
				if (selected == false)
				{
					selected = true;
					alarm[1] = 1;
				}
			}
		}
	}


}
