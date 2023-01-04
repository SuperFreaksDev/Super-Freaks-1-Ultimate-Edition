/// @description Step

var _collision_left = false, _collision_right = false, _collision_up = false, _collision_down = false;

x += speed_h;
y += speed_v;

collision_flags = 0;

switch sign(x - x_previous)
{
	case -1:
		collision_left_simple();
		break;
	case 0:
	case 1:
		collision_right_simple();
		break;
}

switch sign(y - y_previous)
{
	case -1:
		collision_up_simple();
		break;
	case 0:
	case 1:
		collision_down_simple();
		break;
}

_collision_left = collision_flag_get_left();
_collision_up = collision_flag_get_up();
_collision_right = collision_flag_get_right();
_collision_down = collision_flag_get_down();
		
if (_collision_left)
{
	if (speed_h < 0)
		speed_h = -speed_h;
}
if (_collision_right)
{
	if (speed_h > 0)
		speed_h = -speed_h;
}
if (_collision_up)
{
	if (speed_v < 0)
		speed_v = -speed_v;
}
if (_collision_down)
{
	if (speed_v > 0)
		speed_v = -speed_v;
}