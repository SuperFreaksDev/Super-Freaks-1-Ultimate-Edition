/// @function comp_list_camera_init
function comp_list_camera_init()
{
	global.comp_list_camera = [];
}

/// @function comp_list_camera_step
function comp_list_camera_step()
{
	var _list, _list_length, _list_pos;
	var _comp;
	
	_list = global.comp_list_camera;
	_list_length = array_length(_list);
		
	for (_list_pos = _list_length - 1; _list_pos >= 0; --_list_pos)
	{
		_comp = _list[_list_pos];
			
		if !weak_ref_alive(_comp)
		{
			array_delete(_list, _list_pos, 1);
			continue;
		}
			
		_comp = _comp.ref;
			
		if !instance_exists(_comp.owner)
		{
			array_delete(_list, _list_pos, 1);
			continue;
		}
			
		with (_comp)
			step();
	}
}

/// @function comp_list_camera_average
/// @description Returns the average point of all of the camera points as an array, as well as the distances between them
function comp_list_camera_average()
{
	var _list, _list_length, _list_pos;
	var _comp;
	var _x = 0, _x_min = 0, _x_max = 0, _x_distance = 0;
	var _y = 0, _y_min = 0, _y_max = 0, _y_distance = 0;
	var _count = 0;
	var _return = array_create(4);
	
	_list = global.comp_list_camera;
	_list_length = array_length(_list);
		
	for (_list_pos = _list_length - 1; _list_pos >= 0; --_list_pos)
	{
		_comp = _list[_list_pos];
			
		if !weak_ref_alive(_comp)
		{
			array_delete(_list, _list_pos, 1);
			continue;
		}
			
		_comp = _comp.ref;
			
		if !instance_exists(_comp.owner)
		{
			array_delete(_list, _list_pos, 1);
			continue;
		}
			
		with (_comp)
		{
			if (active == true)
			{
				_x += x;
				_y += y;
				if (_count == 0)
				{
					_x_min = x;
					_y_min = y;
					_x_max = x;
					_y_max = y;
				}
				else
				{
					_x_min = min(_x_min, x);
					_y_min = min(_y_min, y);
					_x_max = max(_x_max, x);
					_y_max = max(_y_max, y);
				}
				_count++;
			}
		}
	}
	
	switch (_count)
	{
		case 0:
			_x = undefined;
			_y = undefined;
			_x_distance = 0;
			_y_distance = 0;
			break;
		case 1:
			_x_distance = 0;
			_y_distance = 0;
			break;
		default:
			_x /= _count;
			_y /= _count;
			_x_distance = _x_max - _x_min;
			_y_distance = _y_max - _y_min;
			break;
	}
	
	_return[0] = _x;
	_return[1] = _y;
	_return[2] = _x_distance;
	_return[3] = _y_distance;
	
	return _return;
}
