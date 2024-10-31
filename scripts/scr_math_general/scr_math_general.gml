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

/// @function bezier_interpolate
/// @param {Real} _start
/// @param {Real} _control_1
/// @param {Real} _control_2
/// @param {Real} _end
/// @param {Real} _t
/// @return {Real}
function bezier_interpolate(_start, _control_1, _control_2, _end, _t)
{
    var _omt = (1.0 - _t);
    var _omt2 = _omt * _omt;
    var _omt3 = _omt2 * _omt;
    var _t2 = _t * _t;
    var _t3 = _t2;
    
    return _start * _omt3 + _control_1 * _omt2 * _t * 3.0 + _control_2 * _omt * _t2 * 3.0 + _end * _t3;
}

/// @function move_toward
/// @param {Real} _from
/// @param {Real} _to
/// @param {Real} _delta
/// @return {Real}
/// @description Thanks Jordan
// You're welcome lmao
function move_toward(_from, _to, _delta) 
{
    return abs(_to - _from) <= _delta ? _to : _from + sign(_to - _from) * _delta;
}

/// @function lengthdir
/// @param {Real} _length
/// @param {Real} _dir
/// @return {Struct} vector2
function lengthdir(_length, _dir) 
{
    return new vector2(_length, 0).rotated(_dir)
}

/// @function inverse_lerp
/// @param {Real} _from
/// @param {Real} _to
/// @param {Real} _value
/// @return {Real}
function inverse_lerp(_from, _to, _value)
{
    return (_value - _from) / (_to - _from);
}

/// @function remap
/// @param {Real} _value
/// @param {Real} _istart
/// @param {Real} _istop
/// @param {Real} _ostart
/// @param {Real} _ostop
/// @return {Real}
function remap(_value, _istart, _istop, _ostart, _ostop)
{
    return lerp(_ostart, _ostop, inverse_lerp(_istart, _istop, _value));
}

enum SIDE 
{
    LEFT = 0,
    TOP,
    RIGHT,
    BOTTOM 
}
