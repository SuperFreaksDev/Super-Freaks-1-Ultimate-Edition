/// @description Step

var _angle;
var _length = chain_segments * 32;

angle = (angle + swing_speed);
if (angle < 0)
	angle += 360;
angle = angle mod 360;

if (circle_angle < 360)
	_angle = (lengthdir_x(circle_angle, angle) + 270) mod 360;
else
	_angle = (angle + 270) mod 360;

thing_x = lengthdir_x(_length, _angle);
thing_y = lengthdir_y(_length, _angle);