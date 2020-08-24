///@function scr_input_box_dd_init_options([option1,option2,...]);
///@description Initialize the dropdown box options
///@param [option1,option2,...] The options text to select from in the dropdown box
///Place in Create event
function scr_input_box_dd_init_options() {
	for (var _i=0; _i<argument_count; _i++)
	{dropdownOptions[_i] = argument[_i];}


}
