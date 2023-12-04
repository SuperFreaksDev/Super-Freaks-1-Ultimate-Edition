/// @function lerp_360
/// @param _angle_1
/// @param _angle_2
/// @param _amount = 0
function lerp_360(_angle_1, _angle_2, _amount = 0)
{
	return _angle_1 - (angle_difference(_angle_1, _angle_2) * _amount);
	
	gml_pragma("forceinline");
}

/// @function approach
/// @param _start
/// @param _target
/// @param _shift
function approach(_start, _target, _shift) 
{
    if (_start < _target)
        return min(_start + _shift, _target);
    else
        return max(_start - _shift, _target);
}