/// @function comp_camera
/// @param _x = other.x
/// @param _y = other.y
function comp_camera(_x = other.x, _y = other.y) constructor
{
	var _my_id = self;
	
	/// @function step
	static step = function()
	{
		xprevious = x;
		yprevious = y;
	}
	
	x = _x;
	y = _y;
	xprevious = _x;
	yprevious = _y;
	owner = other;
	
	active = true;
	
	array_push(global.comp_list_camera, weak_ref_create(_my_id));
}
