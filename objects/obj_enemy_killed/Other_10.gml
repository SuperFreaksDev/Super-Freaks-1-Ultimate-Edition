/// @description Step

if (speed_v < 6)
	speed_v += min(speed_grv, 6 - speed_v);
	
x += speed_h;
y += speed_v;

angle_previous = angle;
angle += angle_speed;

if (angle < 0)
{
	angle += 360;
	angle_previous += 360;
}
else if (angle >= 360)
{
	angle -= 360;
	angle_previous -= 360;
}