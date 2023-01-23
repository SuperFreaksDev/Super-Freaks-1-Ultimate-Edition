/// @description Step

if (value == 0)
{
	speed_y += 0.5;
	alpha -= 0.05;
}
else
	speed_y += 0.25;

if (speed_y > 2)
	instance_destroy();

if (speed_y < 0)
	y += speed_y;