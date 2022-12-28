/// @function boolean_string
/// @param {Boolean} _boolean
function boolean_string(_boolean)
{
	if (_boolean)
		return "True";
	else
		return "False";
		
	gml_pragma("forceinline");
}

/// @function boolean_string_yesno
/// @param {Boolean} _boolean
function boolean_string_yesno(_boolean)
{
	if (_boolean)
		return "Yes";
	else
		return "No";
		
	gml_pragma("forceinline");
}

/// @function boolean_string_onoff
/// @param {Boolean} _boolean
function boolean_string_onoff(_boolean)
{
	if (_boolean)
		return "On";
	else
		return "Off";
		
	gml_pragma("forceinline");
}

/// @function y_intercept_get
/// @description Returns the y-intercept of a sloped line
/// @param _x
/// @param _y
/// @param _slope
function y_intercept_get(_x, _y, _slope)
{
	return (_y - _slope * _x);
	
	gml_pragma("forceinline");
}

/// @function lerp_360
/// @param _angle_1
/// @param _angle_2
/// @param _amount = 0
function lerp_360(_angle_1, _angle_2, _amount = 0)
{
	return _angle_1 - (angle_difference(_angle_1, _angle_2) * _amount) mod 360;
	
	gml_pragma("forceinline");
}

/// @function circle_in_circle
/// @description Checks if two circles are overlapping
/// @param _circle1_x
/// @param _circle1_y
/// @param _circle1_radius
/// @param _circle2_x
/// @param _circle2_y
/// @param _circle2_radius
function circle_in_circle(_circle1_x, _circle1_y, _circle1_radius, _circle2_x, _circle2_y, _circle2_radius)
{
	var _dist_x = _circle1_x - _circle2_x;
	var _dist_y = _circle1_y - _circle2_y;
	var _distance = sqrt((_dist_x*_dist_x) + (_dist_y*_dist_y));
	
	gml_pragma("forceinline");
	
	if (_distance <= (_circle1_radius + _circle2_radius))
	    return true;
		
	return false;
}
