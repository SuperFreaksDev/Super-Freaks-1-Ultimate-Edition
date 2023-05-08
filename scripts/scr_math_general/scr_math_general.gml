/// @function lerp_360
/// @param _angle_1
/// @param _angle_2
/// @param _amount = 0
function lerp_360(_angle_1, _angle_2, _amount = 0)
{
	return _angle_1 - (angle_difference(_angle_1, _angle_2) * _amount);
	
	gml_pragma("forceinline");
}