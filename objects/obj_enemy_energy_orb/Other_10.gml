/// @description Step

var _speed_h = lengthdir_x(speed, direction);
var _speed_v = lengthdir_y(speed, direction);

x += _speed_h;
y += _speed_v;

if (collision_left_simple() || collision_right_simple() || collision_up_simple() || collision_down_simple())
	instance_destroy();