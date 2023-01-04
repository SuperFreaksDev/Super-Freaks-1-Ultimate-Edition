/// @description Step

var _width = image_xscale * sprite_get_width(sprite_index);
var _width_half = _width / 2;
var _i, _instance;
var _list = collider.attach_list;
var _move_down = false;

collider.shape_x1 = -_width_half;
collider.shape_x2 = _width_half;

for (_i = array_length(_list) - 1; _i >= 0; --_i)
{
	_instance = _list[_i];
	
	if (instance_exists(_instance) && _instance.object_index == obj_player)
		_move_down = true;
}

if (_move_down)
{
	if (y <= start_y)
	{
		y = start_y;
		speed_v = 0;
	}
	speed_v = min(speed_v + 0.125, 3);
}
else
{
	if (y <= start_y)
	{
		y = start_y;
		speed_v = 0;
	}
	else
		speed_v = max(speed_v - 0.125, -3);
}

x += speed_h;
y += speed_v;

switch (sign(x - x_previous))
{
	case -1:
		if (collision_exists_left_simple(x - _width_half, y, y, y))
			speed_h = -speed_h;
		break;
	case 0:
		break;
	case 1:
		if (collision_exists_right_simple(x + _width_half, y, y, y))
			speed_h = -speed_h;
		break;
}