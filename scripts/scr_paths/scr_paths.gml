enum path_end_actions
{
	stop = 0,
	reverse,
	fall,
}

/// @function path_move
/// @param _path = 0
/// @param _end_action = path_end_actions.stop
function path_move(_path = 0, _end_action = path_end_actions.stop)
{
	var _speed = (1 / path_get_length(_path)) * speed_path;
	var _path_position_previous = path_position;
	
	path_position = path_position + _speed;
		
	if (path_get_closed(_path))
	{
		switch (sign(_speed))
		{
			case -1:
				if (path_position <= 0)
					path_position = 1 - path_position;
				break;
			case 0:
				break;
			case 1:
				path_position = path_position mod 1;
				break;
		}
	}
	else
	{
		if (speed_path > 0 && path_position >= 1)
		{
			switch (_end_action)
			{
				case path_end_actions.stop:
					speed_path = 0;
					path_position = 1;
					break;
				case path_end_actions.reverse:
					speed_path = -speed_path;
					path_position = 1;
					break;
			}
		}
		else if (speed_path < 0 && path_position <= 0)
		{
			switch (_end_action)
			{
				case path_end_actions.stop:
					speed_path = 0;
					path_position = 0;
					break;
				case path_end_actions.reverse:
					speed_path = -speed_path;
					path_position = 0;
					break;
			}
		}
	}
	
	x = path_get_x(_path, path_position);
	y = path_get_y(_path, path_position);
}

/// @function path_closest_point
/// @param _path_index
/// @param _x
/// @param _y
/// @param _precision = 4
/// @description Returns nearest point on a path
function path_closest_point(_path_index, _x, _y, _precision = 4)
{
	var _i, solution;
	var _path_length = path_get_length(_path_index);
	var _marker_x, _marker_y;
	var _path_increments = (1 / _path_length) * _precision;
	var _priority_queue = ds_priority_create();

	for (_i = 0; _i <= 1; _i += _path_increments)
	{
	     _marker_x = path_get_x(_path_index, _i);
	     _marker_y = path_get_y(_path_index, _i);
	     ds_priority_add(_priority_queue, _i, point_distance(_marker_x, _marker_y, _x, _y));
	}

	solution = ds_priority_find_min(_priority_queue);
	ds_priority_destroy(_priority_queue);
	return solution;
}