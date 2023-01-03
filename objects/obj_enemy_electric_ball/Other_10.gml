/// @description Step

if (speed_move == 0)
{
	instance_destroy();
	exit;
}

switch (wall_direction)
{
	case 0: //Ground
		x += speed_move;
		
		if (!collision_down_simple(x, x, x, y, 16,, true))
		{
			y += abs(speed_move);
			switch sign(x - x_previous)
			{
				case -1: //Left
					if (collision_right(x, y, y, y, 16, true))
						wall_direction = 1;
					else
						instance_destroy();
					break;
				case 1: //Right
					if (collision_left(x, y, y, y, 16, true))
						wall_direction = 3;
					else
						instance_destroy();
					break;
			}
		}
		else
		{
			switch sign(x - x_previous)
			{
				case -1: //Left
					if (collision_left(x, y - 8, y - 8, y - 8, 16, true))
						wall_direction = 3;
					break;
				case 1: //Right
					if (collision_right(x, y - 8, y - 8, y - 8, 16, true))
						wall_direction = 1;
					break;
			}
		}
		break;
	case 1: //Wall to Right
		y -= speed_move;
		
		if (!collision_right(x, y, y, y, 16, true))
		{
			x += abs(speed_move);
			switch sign(y - y_previous)
			{
				case -1: //Up
					if (collision_down_simple(x, x, x, y, 16,, true))
						wall_direction = 0;
					else
						instance_destroy();
					break;
				case 1: //Down
					if (collision_up_simple(x, x, x, y, 16,, true))
						wall_direction = 2;
					else
						instance_destroy();
					break;
			}
		}
		else
		{
			switch sign(y - y_previous)
			{
				case -1: //Up
					if (collision_up_simple(x - 8, x - 8, x - 8, y, 16,, true))
						wall_direction = 2;
					break;
				case 1: //Down
					if (collision_down_simple(x - 8, x - 8, x - 8, y, 16,, true))
						wall_direction = 0;
					break;
			}
		}
		break;
	case 2: //Ceiling
		x -= speed_move;
		
		if (!collision_up(x, x, x, y, 16, true))
		{
			y -= abs(speed_move);
			switch sign(x - x_previous)
			{
				case -1: //Left
					if (collision_right(x, y, y, y, 16, true))
						wall_direction = 1;
					else
						instance_destroy();
					break;
				case 1: //Right
					if (collision_left(x, y, y, y, 16, true))
						wall_direction = 3;
					else
						instance_destroy();
					break;
			}
		}
		else
		{
			switch sign(x - x_previous)
			{
				case -1: //Left
					if (collision_left(x, y - 8, y - 8, y - 8, 16, true))
						wall_direction = 3;
					break;
				case 1: //Right
					if (collision_right(x, y - 8, y - 8, y - 8, 16, true))
						wall_direction = 1;
					break;
			}
		}
		break;
	case 3: //Wall to Left
		y += speed_move;
		
		if (!collision_left(x, y, y, y, 16, true))
		{
			x -= abs(speed_move);
			switch sign(y - y_previous)
			{
				case -1: //Up
					if (collision_down_simple(x, x, x, y, 16,, true))
						wall_direction = 0;
					else
						instance_destroy();
					break;
				case 1: //Down
					if (collision_up_simple(x, x, x, y, 16,, true))
						wall_direction = 2;
					else
						instance_destroy();
					break;
			}
		}
		else
		{
			switch sign(y - y_previous)
			{
				case -1: //Up
					if (collision_up_simple(x - 8, x - 8, x - 8, y, 16,, true))
						wall_direction = 2;
					break;
				case 1: //Down
					if (collision_down_simple(x - 8, x - 8, x - 8, y, 16,, true))
						wall_direction = 0;
					break;
			}
		}
		break;
}