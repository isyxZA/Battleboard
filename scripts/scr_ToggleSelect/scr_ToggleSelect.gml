/// @description scr_ToggleSelect(press_x, press_y, release_x, release_y)
/// @param  press_x
/// @param  press_y
/// @param  release_x
/// @param  release_y
function scr_ToggleSelect(argument0, argument1, argument2, argument3) {

	if pX != -1 && pY != -1 {
	    //Mouse press coords
	    var sX = argument0;
	    var sY = argument1;
	    //Mouse release coords
	    var rX = argument2;
	    var rY = argument3;
    
	    var tlBR = (x > sX && x < rX && y > sY && y < rY);//top-left to bottom-tight
	    var blTR = (x > sX && x < rX && y < sY && y > rY);//bottom-left to top-right
	    var brTL = (x < sX && x > rX && y < sY && y > rY);//bottom-right to top-left
	    var trBL = (x < sX && x > rX && y > sY && y < rY);//top-right to bottom-left
    
	    if (global.can_select == true) && (nav_confirmed == false) && (action_confirmed == false) && (resupplying == false) {   
	        if (blTR || tlBR || brTL || trBL) { selected = true; }
	            else if place_meeting(x, y, obj_MOUSE) {  selected = true; }
	                else { 
	                    selected = false; 
	                    pX = -1;
	                    pY = -1;
	                }
	    }
	}




    
                
                



}
