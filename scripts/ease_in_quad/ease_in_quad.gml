/// @description ease_in_quad(time, start, change, duration)
/// @param time
/// @param  start
/// @param  change
/// @param  duration
function ease_in_quad(argument0, argument1, argument2, argument3) {

	/*
	you need to set up a timer for the "time" variable

	time        = the point in time along the graph e.g. at the start 0
	start       = value of the starting point e.g. at the start 100
	change      = the change between starting value and end value e.g. 50 so the end value would be 150
	duration    = amount of "time" it should take to reach the end value e.g. 30 
	*/

	argument0 /= argument3;
	return argument2 * argument0 * argument0 + argument1;



}
