/// @description Step

event_inherited();

pos = pos + (5 - hp) mod 360;

angle_previous = angle;
angle = angle - 10;
if (angle < 0)
	angle += 360;

x = start_x + lengthdir_x(24, pos);
y = start_y + lengthdir_y(24, pos);