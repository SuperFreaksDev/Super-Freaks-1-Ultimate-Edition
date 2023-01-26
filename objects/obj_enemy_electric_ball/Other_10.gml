/// @description Step

if (speed_h == 0 && speed_v == 0)
{
	instance_destroy();
	exit;
}

x += speed_h;
y += speed_v;

switch (wall_direction)
{
	case 0: //Ground
		if (!collision_down_simple(x, x, x, y, 8,, true))
		{
			y += abs(speed_h);
			switch sign(speed_h)
			{
				case -1: //Left
					if (collision_right_simple(x, y, y, y, 8,, true))
					{
						wall_direction = 1;
						speed_v = -speed_h;
						speed_h = 0;
					}
					else
						instance_destroy();
					break;
				case 1: //Right
					if (collision_left_simple(x, y, y, y, 8,, true))
					{
						wall_direction = 3;
						speed_v = speed_h;
						speed_h = 0;
					}
					else
						instance_destroy();
					break;
			}
		}
		else
		{
			switch sign(speed_h)
			{
				case -1: //Left
					if (collision_left_simple(x, y - 4, y - 4, y - 4, 4,, true))
					{
						wall_direction = 3;
						speed_v = speed_h;
						speed_h = 0;
					}
					break;
				case 1: //Right
					if (collision_right_simple(x, y - 4, y - 4, y - 4, 4,, true))
					{
						wall_direction = 1;
						speed_v = -speed_h;
						speed_h = 0;
					}
					break;
			}
		}
		break;
	case 1: //Wall to Right
		if (!collision_right_simple(x, y, y, y, 8,, true))
		{
			x += abs(speed_v);
			switch sign(speed_v)
			{
				case -1: //Up
					if (collision_down_simple(x, x, x, y, 8,, true))
					{
						wall_direction = 0;
						speed_h = -speed_v;
						speed_v = 0;
					}
					else
						instance_destroy();
					break;
				case 1: //Down
					if (collision_up_simple(x, x, x, y, 8,, true))
					{
						wall_direction = 2;
						speed_h = speed_v;
						speed_v = 0;
					}
					else
						instance_destroy();
					break;
			}
		}
		else
		{
			switch sign(speed_v)
			{
				case -1: //Up
					if (collision_up_simple(x - 4, x - 4, x - 4, y, 4,, true))
					{
						wall_direction = 2;
						speed_h = speed_v;
						speed_v = 0;
					}
					break;
				case 1: //Down
					if (collision_down_simple(x - 4, x - 4, x - 4, y, 4,, true))
					{
						wall_direction = 0;
						speed_h = -speed_v;
						speed_v = 0;
					}
					break;
			}
		}
		break;
	case 2: //Ceiling
		if (!collision_up_simple(x, x, x, y, 8,, true))
		{
			y -= abs(speed_h);
			switch sign(speed_h)
			{
				case -1: //Left
					if (collision_right_simple(x, y, y, y, 8,, true))
					{
						wall_direction = 1;
						speed_v = speed_h;
						speed_h = 0;
					}
					else
						instance_destroy();
					break;
				case 1: //Right
					if (collision_left_simple(x, y, y, y, 8,, true))
					{
						wall_direction = 3;
						speed_v = -speed_h;
						speed_h = 0;
					}
					else
						instance_destroy();
					break;
			}
		}
		else
		{
			switch sign(speed_h)
			{
				case -1: //Left
					if (collision_left_simple(x, y + 4, y + 4, y + 4, 4,, true))
					{
						wall_direction = 3;
						speed_v = -speed_h;
						speed_h = 0;
					}
					break;
				case 1: //Right
					if (collision_right_simple(x, y + 4, y + 4, y + 4, 4,, true))
					{
						wall_direction = 1;
						speed_v = speed_h;
						speed_h = 0;
					}
					break;
			}
		}
		break;
	case 3: //Wall to Left
		if (!collision_left_simple(x, y, y, y, 8,, true))
		{
			x -= abs(speed_v);
			switch sign(speed_v)
			{
				case -1: //Up
					if (collision_down_simple(x, x, x, y, 8,, true))
					{
						wall_direction = 0;
						speed_h = speed_v;
						speed_v = 0;
					}
					else
						instance_destroy();
					break;
				case 1: //Down
					if (collision_up_simple(x, x, x, y, 8,, true))
					{
						wall_direction = 2;
						speed_h = -speed_v;
						speed_v = 0;
					}
					else
						instance_destroy();
					break;
			}
		}
		else
		{
			switch sign(speed_v)
			{
				case -1: //Up
					if (collision_up_simple(x + 4, x + 4, x + 4, y, 4,, true))
					{
						wall_direction = 2;
						speed_h = -speed_v;
						speed_v = 0;
					}
					break;
				case 1: //Down
					if (collision_down_simple(x + 4, x + 4, x + 4, y, 4,, true))
					{
						wall_direction = 0;
						speed_h = speed_v;
						speed_v = 0;
					}
					break;
			}
		}
		break;
}