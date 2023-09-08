/// @description Hit

var _yorb;
var _speed;
var _direction;
var _offset_x, _offset_y;

repeat (yorb_amount)
{
	_offset_x = x_offset_yorb + random_range(-16, 16);
	_offset_y = y_offset_yorb + random_range(-16, 16);
	_yorb = instance_create_layer(x + _offset_x, y + _offset_y, "layer_instances", obj_yorb_physics);
	_speed = random_range(6, 10);
	_direction = random_range(67.5, 112.5);
	with (_yorb)
	{
		speed_h = lengthdir_x(_speed, _direction);
		speed_v = lengthdir_y(_speed, _direction);
	}
}


