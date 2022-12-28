/// @description Step

var _speed;

switch (state)
{
	case 0:
		break;
	case 1:
		if (state_begin)
			timer = 0;
		timer++;
		y = ystart + ((timer & 1) * 4);
		if (timer >= activate_timer)
			state_next_set(2);
		break;
	case 2:
		if (state_begin)
		{
			timer = 0;
		}
		_speed = (1 / path_get_length(my_path)) * path_move_speed;
		
		if (path_get_closed(my_path))
			path_position = (path_position + _speed) mod 1;
		else
		{
			path_position = path_position + _speed;
			
			if (path_move_speed > 0 && path_position >= 1)
			{
				path_position = 1;
				switch (path_end_action)
				{
					case 0:
						path_move_speed = 0;
						break;
					case 1:
						path_move_speed = -path_move_speed;
						break;
				}
			}
			else if (path_move_speed < 0 && path_position <= 0)
			{
				path_position = 0;
				if (path_end_action == 1)
					path_move_speed = -path_move_speed;
			}
		}
		
		x = path_get_x(my_path, path_position);
		y = path_get_y(my_path, path_position);
		break;
}

// Inherit the parent event
event_inherited();

