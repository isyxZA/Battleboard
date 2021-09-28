///@function scr_input_box_restrict(restrictedCharacter1,...,restrictedCharacterN);
///@description Stop the given characters from being entered in the input box
///@param restrictedCharacter1 The character (as a string) to stop from being entered in the input box
///@param [...,restrictedCharacterN] The character (as a string) to stop from being entered in the input box
///PLACE BEFORE scr_input_box_input in Step event
function scr_input_box_restrict() 
{
	if (selected == true)
	{
		if (argument_count >= 1)
		{
			for (var _i=0; _i<argument_count; _i++)
			{
				keyboard_string = string_replace_all(keyboard_string,argument[_i],"");
			}
		}
	}
}
