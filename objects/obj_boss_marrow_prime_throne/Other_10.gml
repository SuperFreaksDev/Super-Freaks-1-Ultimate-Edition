/// @description Step

var _x,
	_y;

if (y < 752)
{
	y = min(y + 4, 752);
	if (y == 752)
	{
		speed_h = choose(-1, 1);
		global.boss_phase = 1;
	}
}
else
{
	x += speed_h;
	
	switch (sign(speed_h))
	{
		case -1:
			if (collision_left_simple())
				speed_h = -speed_h;
			break;
		case 0:
			break;
		case 1:
			if (collision_right_simple())
				speed_h = -speed_h;
			break;
	}
}

if (global.boss_phase > 1)
	platform.solid_y1 = true;
else
{
	_x = x;
	_y = y;
	
	with (obj_boss_marrow_prime_1)
	{
		x = _x;
		y = _y;
	}
}