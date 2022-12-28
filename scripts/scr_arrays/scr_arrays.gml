/// @function array_contains
/// @description Returns if an array contains a specific value
/// @param {array} _array
/// @param _value
function array_contains(_array, _value)
{
	var _pos;
	var _array_length = array_length(_array);
	
	gml_pragma("forceinline");
	
	if (_array_length == 0)
		exit;
	
	for (_pos = 0; _pos < _array_length; ++_pos)
	{
		if (_array[_pos] == _value)
			return true;
	}
	
	return false;
}

/// @function array_contains_object
/// @description Returns if an array contains a specific object_index
/// @param {array} _array
/// @param _object_index
function array_contains_object(_array, _object_index)
{
	var _pos;
	var _array_length = array_length(_array);
	var _instance;
	
	gml_pragma("forceinline");
	
	if (_array_length == 0)
		exit;
	
	for (_pos = 0; _pos < _array_length; ++_pos)
	{
		_instance = _array[_pos];
		if (instance_exists(_instance) && _instance.object_index == _object_index)
			return true;
	}
	
	return false;
}

/// @function array_remove_value
/// @description Removes all of one value from an array
/// @param {array} _array
/// @param _value
function array_remove_value(_array, _value)
{
	var _pos;
	var _array_length = array_length(_array);
	
	gml_pragma("forceinline");
	
	if (_array_length == 0)
		exit;
	
	for (_pos = _array_length - 1; _pos >= 0; --_pos)
	{
		if (_array[_pos] == _value)
			array_delete(_array, _pos, 1);
	}
}

/// @function array_randomize
/// @description Randomizes the values of an array. Thanks YellowAfterlife
/// @param {array} _array
function array_randomize(_array)
{
	var _i, _pos, _pos_random;
	var _array_length;
		
	_array_length = array_length(_array);
	if (_array_length == 0)
		exit;
	
	for (_i = 0; _i < _array_length; ++_i)
	{
	    _pos_random = irandom_range(_i, _array_length - 1)
	    if (_i != _pos_random)
	    {
	        _pos = _array[_i];
	        _array[_i] = _array[_pos_random];
	        _array[_pos_random] = _pos;
	    }
	}
}