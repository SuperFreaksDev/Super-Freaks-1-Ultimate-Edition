/// @function draw_pie
/// @param _x
/// @param _y
/// @param _value
/// @param _value_max
/// @param _radius
/// @param _angle_start = 90
/// @description http://www.davetech.co.uk/gamemakercircularhealthbars
function draw_pie(_x, _y, _value, _value_max, _radius, _angle_start = 90)
{
	var i, len, tx, ty, val, numberofsections, sizeofsection;
	
	if (_value <= 0)
		exit;
    
	numberofsections = 30; // there is no draw_get_circle_precision() else I would use that here
	sizeofsection = 360 / numberofsections;
	val = (_value / _value_max) * numberofsections;
    
	if (val > 1) 
	{
		// HTML5 version doesnt like triangle with only 2 sides 
	    draw_primitive_begin(pr_trianglefan);
	    draw_vertex(_x, _y);
        
	    for(i = 0; i <= val; i++) 
		{
	        len = (i * sizeofsection) + _angle_start;
	        tx = lengthdir_x(_radius, len);
	        ty = lengthdir_y(_radius, len);
	        draw_vertex(_x + tx, _y + ty);
	    }
	    draw_primitive_end();
	}
}