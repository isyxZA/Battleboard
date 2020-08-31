/// @description scr_InView(x, y, camera);
/// @param x
/// @param y
/// @param camera
function scr_InView(argument0, argument1, argument2) {

	var xx = argument0;
	var yy = argument1;
	var cc = argument2;

	//Deactivate when outside of view
	var vx1 = camera_get_view_x(cc)-global.cell_size;
	var vy1 = camera_get_view_y(cc)-global.cell_size;

	var vx2 = camera_get_view_x(cc)+(camera_get_view_width(cc) +global.cell_size);
	var vy2 = camera_get_view_y(cc)+(camera_get_view_height(cc)+global.cell_size);

	if (xx > vx1) && (yy > vy1) && (xx < vx2) && (yy < vy2) {
	    can_draw = true;
	}
	    else { 
	        can_draw = false; 
	    }

}
