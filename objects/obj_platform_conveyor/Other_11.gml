/// @description Step 2

var _i, _instance;
var _list = collider.attach_list;
var _speed = conveyor_speed * sign(image_xscale);

for (_i = array_length(_list) - 1; _i >= 0; --_i)
{
	_instance = _list[_i];
	
	with (_instance)
		x += _speed;
}