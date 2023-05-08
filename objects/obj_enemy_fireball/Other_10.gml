/// @description Step

var _speed_h = lengthdir_x(speed, direction);
var _speed_v = lengthdir_y(speed, direction);

x += _speed_h;
y += _speed_v;

switch (sign(_speed_h))
{
	case -1:
		if (collision_left_simple())
			instance_destroy();
		break;
	case 0:
		break;
	case 1:
		if (collision_right_simple())
			instance_destroy();
		break;
}

switch (sign(_speed_v))
{
	case -1:
		if (collision_up_simple())
			instance_destroy();
		break;
	case 0:
		break;
	case 1:
		if (collision_down_simple())
			instance_destroy();
		break;
}