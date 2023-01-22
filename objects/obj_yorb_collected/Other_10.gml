/// @description Step

speed_y += speed_dec;

if (speed_y > 2)
	instance_destroy();

if (speed_y < 0)
	y += speed_y;