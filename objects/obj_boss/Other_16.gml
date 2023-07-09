/// @description Hit

var _yorb;
var _speed;
var _direction;

repeat (20)
{
	_yorb = instance_create_layer(x, y, "layer_instances", obj_yorb_physics);
	_speed = random_range(6, 10);
	_direction = random_range(67.5, 112.5);
	with (_yorb)
	{
		speed_h = lengthdir_x(_speed, _direction);
		speed_v = lengthdir_y(_speed, _direction);
	}
}


