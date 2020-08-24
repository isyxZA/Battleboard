/// @description Unselect
var _unselect = selected;

scr_input_box_dd_Key_Pressed_Enter();

//Now you can act on the selection:
if (selected == false && _unselect == true)//if was selected and now unselected
{
	switch (selection)
	{
		case 0://option 1
		//Do this
		break;
		case 1://option 2
		//Do that
		break;
		case 2://option 3
		//Do another thing
		break;
	}
}