enum zone_data
{
	pos = 0,
	list,
	active,
}

enum zone_instance_data
{
	instance = 0,
	x,
	y,
	can_spawn,
	pos,
}

enum zone_spawn_data
{
	instance_num = 0,
	x,
	y,
	side,
}

enum zone_spawn_sides
{
	both = 0,
	left = 1,
	up = 1,
	right = 2,
	down = 2,
}

/// @function zones_init
function zones_init()
{
	global.instance_spawn_list = []; //both instances are added to this list
	global.zones = []; //zones receive spawn data that points to an instance in the instance list
	global.zone_main_sort_x = [];
	global.zone_main_sort_y = [];
}

/// @function zones_fill
function zones_fill()
{
	var _zones = global.zones;
	var _list;
	var _list_length;
	var _id;
	var _width_min = 0, _width_max = room_width, _height_min = 0, _height_max = room_height;
	
	var _instance_num = 0;
	var _despawn_x1, _despawn_y1, _despawn_x2, _despawn_y2;
	var _add_to_level = false;
	
	with (obj_level_obj)
	{
		_add_to_level = false;
		//show_debug_message(difficulty);
		switch (global.difficulty)
		{
			case difficulty_levels.easy:
				if (array_contains(difficulty, "Easy"))
					_add_to_level = true;
				break;
			case difficulty_levels.normal:
				if (array_contains(difficulty, "Normal"))
					_add_to_level = true;
				break;
			case difficulty_levels.hard:
				if (array_contains(difficulty, "Hard"))
					_add_to_level = true;
				break;
		}
		
		if (!_add_to_level)
		{
			instance_destroy();
			continue;
		}
		
		_id = id;
		instance_num = _instance_num;
		_despawn_x1 = x + despawn_area[0];
		_despawn_y1 = y + despawn_area[1]; 
		_despawn_x2 = x + despawn_area[2]; 
		_despawn_y2 = y + despawn_area[3];
		
		array_push(global.instance_spawn_list, [_id, x, y, false]);
		
		if (zone_index == -2 || zone_index == -3 || zone_index == undefined)
		{
			//continue;
		}
		else if (zone_index == -1)
		{
			_width_min = min(_width_min, _despawn_x1);
			_width_max = max(_width_max, _despawn_x2);
			_height_min = min(_height_min, _despawn_y1);
			_height_max = max(_height_max, _despawn_y2);
			
			_list = global.zone_main_sort_x;
			if (_despawn_x1 != _despawn_x2)
			{
				array_push(_list, [_instance_num, _despawn_x1, y, zone_spawn_sides.left]);
				array_push(_list, [_instance_num, _despawn_x2, y, zone_spawn_sides.right]);
			}
			else
				array_push(_list, [_instance_num, x, y, zone_spawn_sides.both]);
				
			_list = global.zone_main_sort_y;
			if (_despawn_y1 != _despawn_y2)
			{
				array_push(_list, [_instance_num, x, _despawn_y1, zone_spawn_sides.up]);
				array_push(_list, [_instance_num, x, _despawn_y2, zone_spawn_sides.down]);
			}
			else
				array_push(_list, [_instance_num, x, y, zone_spawn_sides.both]);
		}
		else
		{
			if (zone_index >= array_length(_zones) || !is_array(_zones[zone_index]))
			{
				_zones[zone_index] = array_create(6);
				_zones[zone_index][zone_data.pos] = array_create(4);
				
				_zones[zone_index][zone_data.pos][3] = _despawn_y2;
				_zones[zone_index][zone_data.pos][2] = _despawn_x2;
				_zones[zone_index][zone_data.pos][1] = _despawn_y1;
				_zones[zone_index][zone_data.pos][0] = _despawn_x1;
				_zones[zone_index][zone_data.active] = -1;
				_zones[zone_index][zone_data.list] = [];
				show_debug_message("Create Zone");
			}
			else
			{
				_zones[zone_index][zone_data.pos][3] = max(_despawn_y2, _zones[zone_index][zone_data.pos][3]);
				_zones[zone_index][zone_data.pos][2] = max(_despawn_x2, _zones[zone_index][zone_data.pos][2]);
				_zones[zone_index][zone_data.pos][1] = min(_despawn_y1, _zones[zone_index][zone_data.pos][1]);
				_zones[zone_index][zone_data.pos][0] = min(_despawn_x1, _zones[zone_index][zone_data.pos][0]);
			}
			
			_list = _zones[zone_index][zone_data.list];
			array_push(_list, [_instance_num, x, y, zone_spawn_sides.both]);
		}
		
		instance_despawn_check();
		_instance_num++;
	}
	
	with (obj_zone)
	{
		if (index >= array_length(_zones) || !is_array(_zones[index]))
		{
			_zones[index][zone_data.pos][3] = bbox_bottom;
			_zones[index][zone_data.pos][2] = bbox_right;
			_zones[index][zone_data.pos][1] = bbox_top;
			_zones[index][zone_data.pos][0] = bbox_left;
			_zones[index][zone_data.active] = -1;
			_zones[index][zone_data.list] = [];
		}
		else
		{
			_zones[index][zone_data.pos][3] = max(bbox_bottom, _zones[index][zone_data.pos][3]);
			_zones[index][zone_data.pos][2] = max(bbox_right, _zones[index][zone_data.pos][2]);
			_zones[index][zone_data.pos][1] = min(bbox_top, _zones[index][zone_data.pos][1]);
			_zones[index][zone_data.pos][0] = min(bbox_left, _zones[index][zone_data.pos][0]);
		}
		
		instance_destroy();
	}
	
	_list = global.zone_main_sort_x;
	_list_length = array_length(_list);
	array_push(_list, [undefined, _width_min - 1, _height_min - 1, zone_spawn_sides.left]);
	array_push(_list, [undefined, _width_max + 1, _height_max + 1, zone_spawn_sides.right]);
	array_sort(_list, function(_index_1, _index_2)
	{
		return _index_1[zone_spawn_data.x] - _index_2[zone_spawn_data.x];
	});
	
	_list = global.zone_main_sort_y;
	_list_length = array_length(_list);
	array_push(_list, [undefined, _width_min - 1, _height_min - 1, zone_spawn_sides.up]);
	array_push(_list, [undefined, _width_max + 1, _height_max + 1, zone_spawn_sides.down]);
	array_sort(_list, function(_index_1, _index_2)
	{
		return _index_1[zone_spawn_data.y] - _index_2[zone_spawn_data.y];
	});
	
	show_debug_message("Master Instance List");
	show_debug_message(global.instance_spawn_list);
	show_debug_message("Master List X Sorted");
	show_debug_message(global.zone_main_sort_x);
	show_debug_message("Master List Y Sorted");
	show_debug_message(global.zone_main_sort_y);
	
	zones_despawn_check();
}

/// @function zones_clear
function zones_clear()
{
	var _list, _list_pos;
	var _instance;
	
	_list = global.instance_spawn_list;
	for (_list_pos = 0; _list_pos < array_length(_list); ++_list_pos)
	{
		_instance = _list[_list_pos][zone_instance_data.instance];
		if (is_undefined(_instance) || !instance_exists(_instance))
			continue;
			
		with (_instance)
			instance_destroy();
	}
	
	zones_init();
}

/// @function zones_step
function zones_step()
{
	var _view = global.view;
	var _view_x1, _view_y1, _view_x2, _view_y2;
	var _zone_list_pos;
	var _zone_x1, _zone_y1, _zone_x2, _zone_y2;
	for (_zone_list_pos = 0; _zone_list_pos < array_length(global.zones); ++_zone_list_pos)
	{
		if !is_array(global.zones[_zone_list_pos])
			continue;
		
		switch (global.zones[_zone_list_pos][zone_data.active])
		{
			case -1:
				_zone_x1 = global.zones[_zone_list_pos][zone_data.pos][0];
				_zone_y1 = global.zones[_zone_list_pos][zone_data.pos][1];
				_zone_x2 = global.zones[_zone_list_pos][zone_data.pos][2];
				_zone_y2 = global.zones[_zone_list_pos][zone_data.pos][3];
			
				with (_view)
				{
					_view_x1 = spawn_area[0];
					_view_y1 = spawn_area[1];
					_view_x2 = spawn_area[2];
					_view_y2 = spawn_area[3];
				}
				if (rectangle_in_rectangle(_zone_x1, _zone_y1, _zone_x2, _zone_y2, _view_x1, _view_y1, _view_x2, _view_y2))
					global.zones[_zone_list_pos][zone_data.active] = true;
				else
				{
					global.zones[_zone_list_pos][zone_data.active] = false;
					zone_deactivate(_zone_list_pos);
				}
				break;
			case false:
				_zone_x1 = global.zones[_zone_list_pos][zone_data.pos][0];
				_zone_y1 = global.zones[_zone_list_pos][zone_data.pos][1];
				_zone_x2 = global.zones[_zone_list_pos][zone_data.pos][2];
				_zone_y2 = global.zones[_zone_list_pos][zone_data.pos][3];
			
				with (_view)
				{
					_view_x1 = spawn_area[0];
					_view_y1 = spawn_area[1];
					_view_x2 = spawn_area[2];
					_view_y2 = spawn_area[3];
				}
				if (rectangle_in_rectangle(_zone_x1, _zone_y1, _zone_x2, _zone_y2, _view_x1, _view_y1, _view_x2, _view_y2))
				{
					global.zones[_zone_list_pos][zone_data.active] = true;
					zone_activate(_zone_list_pos);
				}
				break;
			case true:
				break;
		}
	}
}

/// @function zones_despawn_check
function zones_despawn_check()
{
	var _zone_list_pos;
	for (_zone_list_pos = 0; _zone_list_pos < array_length(global.zones); ++_zone_list_pos)
	{
		if !is_array(global.zones[_zone_list_pos])
			continue;
		
		if (global.zones[_zone_list_pos][zone_data.active] == true)
			global.zones[_zone_list_pos][zone_data.active] = -1;
	}
	
	gml_pragma("forceinline");
}

/// @function zone_activate
/// @param {int} _zone_index
function zone_activate(_zone_index)
{
	var _list = global.zones[_zone_index][zone_data.list];
	var _instance_list = global.instance_spawn_list;
	var _list_pos;
	var _instance, _instance_num;
	
	for (_list_pos = 0; _list_pos < array_length(_list); ++_list_pos)
	{
		_instance_num = _list[_list_pos][zone_spawn_data.instance_num];
		_instance = _instance_list[_instance_num][zone_instance_data.instance];
		
		if (_instance_list[_instance_num][zone_instance_data.can_spawn] == false)
			continue;
			
		instance_activate_object(_instance);
		with (_instance)
		{
			x = _instance_list[_instance_num][zone_instance_data.x];
			y = _instance_list[_instance_num][zone_instance_data.y];
			_instance_list[_instance_num][zone_instance_data.can_spawn] = false;
			instance_spawn();
		}
	}
}

/// @function zone_deactivate
/// @param {int} _zone_index
function zone_deactivate(_zone_index)
{
	var _list = global.zones[_zone_index][zone_data.list];
	var _instance_list = global.instance_spawn_list;
	var _list_pos;
	var _instance, _instance_num;
	
	for (_list_pos = 0; _list_pos < array_length(_list); ++_list_pos)
	{
		_instance_num = _list[_list_pos][zone_spawn_data.instance_num];
		_instance = _instance_list[_instance_num][zone_instance_data.instance];
		
		with (_instance)
			instance_despawn();
	}
}

/// @function zone_main_step
function zone_main_step()
{
	var _instance_list = global.instance_spawn_list;
	var _view = global.view;
	var _view_x1, _view_y1, _view_x2, _view_y2, _view_x1_previous, _view_y1_previous, _view_x2_previous, _view_y2_previous;
	var _zone_x_list = global.zone_main_sort_x;
	var _zone_y_list = global.zone_main_sort_y;
	var _zone_x1, _zone_y1, _zone_x2, _zone_y2;
	var _instance_num;
	var _instance, _x, _y, _side;
	
	if (array_length(_zone_x_list) < 3)
		exit;
	
	with (_view)
	{
		_view_x1 = spawn_area[0];
		_view_y1 = spawn_area[1];
		_view_x2 = spawn_area[2];
		_view_y2 = spawn_area[3];
			
		_view_x1_previous = spawn_area_previous[0];
		_view_y1_previous = spawn_area_previous[1];
		_view_x2_previous = spawn_area_previous[2];
		_view_y2_previous = spawn_area_previous[3];
			
		_zone_x1 = zone_main_spawn_area[0];
		_zone_y1 = zone_main_spawn_area[1];
		_zone_x2 = zone_main_spawn_area[2];
		_zone_y2 = zone_main_spawn_area[3];
	}
		
	switch (sign(_view_x1 - _view_x1_previous))
	{
		case -1: // Left
			while (_zone_x1 > 0)
			{
				_instance_num = _zone_x_list[_zone_x1][zone_spawn_data.instance_num];
				_x = _zone_x_list[_zone_x1][zone_spawn_data.x];
					
				if (_x >= _view_x1)
				{
					if (is_undefined(_instance_num))
					{
						_zone_x1--;
						continue;
					}
					_instance = _instance_list[_instance_num][zone_instance_data.instance];
					_side = _zone_x_list[_zone_x1][zone_spawn_data.side];
					if (is_undefined(_instance) || _side == zone_spawn_sides.left || _instance_list[_instance_num][zone_instance_data.can_spawn] == false)
					{
						_zone_x1--;
						continue;
					}
					
					_x = _instance_list[_instance_num][zone_instance_data.x];
					_y = _instance_list[_instance_num][zone_instance_data.y];
							
					//if (_y == clamp(_y, _view_y1, _view_y2))
					if (rectangle_in_rectangle(0, _view_y1, 0, _view_y2, 0, _y + _instance.despawn_area[1], 0, _y + _instance.despawn_area[3]))
					{
						instance_activate_object(_instance);
						with (_instance)
						{
							x = _x;
							y = _y;
							instance_spawn();
						}
						_instance_list[_instance_num][zone_instance_data.can_spawn] = false;
					}
					_zone_x1--;
				}
				else
					break;
			}
			_view.zone_main_spawn_area[0] = _zone_x1;
			break;
		case 0:  // N/A
			break;
		case 1:  // Right
			while (_zone_x1 < _zone_x2)
			{
				_x = _zone_x_list[_zone_x1][zone_spawn_data.x];
					
				if (_x < _view_x1)
					_zone_x1++;
				else
					break;
			}
			_view.zone_main_spawn_area[0] = _zone_x1;
			break;
	}
		
	switch (sign(_view_x2 - _view_x2_previous))
	{
		case -1: // Left
			while (_zone_x2 > _zone_x1)
			{
				_x = _zone_x_list[_zone_x2][zone_spawn_data.x];
					
				if (_x > _view_x2)
					_zone_x2--;
				else
					break;
			}
			_view.zone_main_spawn_area[2] = _zone_x2;
			break;
		case 0:  // N/A
			break;
		case 1:  // Right
			while (_zone_x2 < (array_length(_zone_x_list) - 1))
			{
				_instance_num = _zone_x_list[_zone_x2][zone_spawn_data.instance_num];
				_x = _zone_x_list[_zone_x2][zone_spawn_data.x];
					
				if (_x <= _view_x2)
				{
					if (is_undefined(_instance_num))
					{
						_zone_x2++;
						continue;
					}
					_instance = _instance_list[_instance_num][zone_instance_data.instance];
					_side = _zone_x_list[_zone_x2][zone_spawn_data.side];
					if (is_undefined(_instance) || _side == zone_spawn_sides.right || _instance_list[_instance_num][zone_instance_data.can_spawn] == false)
					{
						_zone_x2++;
						continue;
					}
					
					_x = _instance_list[_instance_num][zone_instance_data.x];
					_y = _instance_list[_instance_num][zone_instance_data.y];
							
					//if (_y == clamp(_y, _view_y1, _view_y2))
					if (rectangle_in_rectangle(0, _view_y1, 0, _view_y2, 0, _y + _instance.despawn_area[1], 0, _y + _instance.despawn_area[3]))
					{
						instance_activate_object(_instance);
						with (_instance)
						{
							x = _x;
							y = _y;
							instance_spawn();
						}
						_instance_list[_instance_num][zone_instance_data.can_spawn] = false;
					}
					_zone_x2++;
				}
				else
					break;
			}
			_view.zone_main_spawn_area[2] = _zone_x2;
			break;
	}
	
	switch (sign(_view_y1 - _view_y1_previous))
	{
		case -1: // Up
			while (_zone_y1 > 0)
			{
				_instance_num = _zone_y_list[_zone_y1][zone_spawn_data.instance_num];
				_y = _zone_y_list[_zone_y1][zone_spawn_data.y];
					
				if (_y >= _view_y1)
				{
					if (is_undefined(_instance_num))
					{
						_zone_y1--;
						continue;
					}
					_instance = _instance_list[_instance_num][zone_instance_data.instance];
					_side = _zone_y_list[_zone_y1][zone_spawn_data.side];
					if (is_undefined(_instance) || _side == zone_spawn_sides.up || _instance_list[_instance_num][zone_instance_data.can_spawn] == false)
					{
						_zone_y1--;
						continue;
					}
					
					_x = _instance_list[_instance_num][zone_instance_data.x];
					_y = _instance_list[_instance_num][zone_instance_data.y];
							
					//if (_x == clamp(_x, _view_x1, _view_x2))
					if (rectangle_in_rectangle(_view_x1, 0, _view_x2, 0, _x + _instance.despawn_area[0], 0, _x + _instance.despawn_area[2], 0))
					{
						instance_activate_object(_instance);
						with (_instance)
						{
							x = _x;
							y = _y;
							instance_spawn();
						}
						_instance_list[_instance_num][zone_instance_data.can_spawn] = false;
					}
					_zone_y1--;
				}
				else
					break;
			}
			_view.zone_main_spawn_area[1] = _zone_y1;
			break;
		case 0:  // N/A
			break;
		case 1:  // Down
			while (_zone_y1 < _zone_y2)
			{
				_y = _zone_y_list[_zone_y1][zone_spawn_data.y];
					
				if (_y < _view_y1)
					_zone_y1++;
				else
					break;
			}
			_view.zone_main_spawn_area[1] = _zone_y1;
			break;
	}
		
	switch (sign(_view_y2 - _view_y2_previous))
	{
		case -1: // Up
			while (_zone_y2 > _zone_y1)
			{
				_y = _zone_y_list[_zone_y2][zone_spawn_data.y];
					
				if (_y > _view_y2)
					_zone_y2--;
				else
					break;
			}
			_view.zone_main_spawn_area[3] = _zone_y2;
			break;
		case 0:  // N/A
			break;
		case 1:  // Down
			while (_zone_y2 < (array_length(_zone_y_list) - 1))
			{
				_instance_num = _zone_y_list[_zone_y2][zone_spawn_data.instance_num];
				_y = _zone_y_list[_zone_y2][zone_spawn_data.y];
					
				if (_y <= _view_y2)
				{
					if (is_undefined(_instance_num))
					{
						_zone_y2++;
						continue;
					}
					_instance = _instance_list[_instance_num][zone_instance_data.instance];
					_side = _zone_y_list[_zone_y2][zone_spawn_data.side];
					if (is_undefined(_instance) || _side == zone_spawn_sides.down || _instance_list[_instance_num][zone_instance_data.can_spawn] == false)
					{
						_zone_y2++;
						continue;
					}
					
					_x = _instance_list[_instance_num][zone_instance_data.x];
					_y = _instance_list[_instance_num][zone_instance_data.y];
							
					//if (_x == clamp(_x, _view_x1, _view_x2))
					if (rectangle_in_rectangle(_view_x1, 0, _view_x2, 0, _x + _instance.despawn_area[0], 0, _x + _instance.despawn_area[2], 0))
					{
						instance_activate_object(_instance);
						with (_instance)
						{
							x = _x;
							y = _y;
							instance_spawn();
						}
						_instance_list[_instance_num][zone_instance_data.can_spawn] = false;
					}
					_zone_y2++;
				}
				else
					break;
			}
			_view.zone_main_spawn_area[3] = _zone_y2;
			break;
	}
}

/// @function zone_main_start
function zone_main_start()
{
	var _instance_list = global.instance_spawn_list;
	var _view = global.view;
	var _view_x1, _view_y1, _view_x2, _view_y2;
	var _zone_x_list = global.zone_main_sort_x;
	var _zone_y_list = global.zone_main_sort_y;
	var _zone_x1 = 1, _zone_y1 = 1, _zone_x2 = 1, _zone_y2 = 1;
	var _instance_num;
	var _instance, _x, _y, _side;
	
	if (array_length(_zone_x_list) < 3)
		exit;
	
	with (_view)
	{
		_view_x1 = spawn_area[0];
		_view_y1 = spawn_area[1];
		_view_x2 = spawn_area[2];
		_view_y2 = spawn_area[3];
	}
		
	while (_zone_x1 < (array_length(_zone_x_list) - 1))
	{
		_x = _zone_x_list[_zone_x1][zone_spawn_data.x];
					
		if (_x < _view_x1)
			_zone_x1++;
		else
			break;
	}
	_view.zone_main_spawn_area[0] = _zone_x1;
		
	_zone_x2 = _zone_x1;
	while (_zone_x2 < (array_length(_zone_x_list) - 1))
	{
		_instance_num = _zone_x_list[_zone_x2][zone_spawn_data.instance_num];
		_x = _zone_x_list[_zone_x2][zone_spawn_data.x];
					
		if (_x <= _view_x2)
		{
			if (is_undefined(_instance_num))
			{
				_zone_x2++;
				continue;
			}
			_instance = _instance_list[_instance_num][zone_instance_data.instance];
			_side = _zone_x_list[_zone_x2][zone_spawn_data.side];
			if (is_undefined(_instance) || _side == zone_spawn_sides.right || _instance_list[_instance_num][zone_instance_data.can_spawn] == false)
			{
				_zone_x2++;
				continue;
			}
					
			_x = _instance_list[_instance_num][zone_instance_data.x];
			_y = _instance_list[_instance_num][zone_instance_data.y];
							
			//if (_y == clamp(_y, _view_y1, _view_y2))
			if (rectangle_in_rectangle(0, _view_y1, 0, _view_y2, 0, _y + _instance.despawn_area[1], 0, _y + _instance.despawn_area[3]))
			{
				instance_activate_object(_instance);
				with (_instance)
				{
					x = _x;
					y = _y;
					instance_spawn();
				}
				_instance_list[_instance_num][zone_instance_data.can_spawn] = false;
			}
			_zone_x2++;
		}
		else
			break;
	}
	_view.zone_main_spawn_area[2] = _zone_x2;
		
	while (_zone_y1 < (array_length(_zone_y_list) - 1))
	{
		_y = _zone_y_list[_zone_y1][zone_spawn_data.y];
					
		if (_y < _view_y1)
			_zone_y1++;
		else
			break;
	}
	_view.zone_main_spawn_area[1] = _zone_y1;
		
	_zone_y2 = _zone_y1;
	while (_zone_y2 < (array_length(_zone_y_list) - 1))
	{
		_instance_num = _zone_y_list[_zone_y2][zone_spawn_data.instance_num];
		_y = _zone_y_list[_zone_y2][zone_spawn_data.y];
					
		if (_y <= _view_y2)
		{
			if (is_undefined(_instance_num))
			{
				_zone_y2++;
				continue;
			}
			_instance = _instance_list[_instance_num][zone_instance_data.instance];
			_side = _zone_y_list[_zone_y2][zone_spawn_data.side];
			if (is_undefined(_instance) || _side == zone_spawn_sides.down || _instance_list[_instance_num][zone_instance_data.can_spawn] == false)
			{
				_zone_y2++;
				continue;
			}
					
			_x = _instance_list[_instance_num][zone_instance_data.x];
			_y = _instance_list[_instance_num][zone_instance_data.y];
							
			//if (_x == clamp(_x, _view_x1, _view_x2))
			if (rectangle_in_rectangle(_view_x1, 0, _view_x2, 0, _x + _instance.despawn_area[0], 0, _x + _instance.despawn_area[2], 0))
			{
				instance_activate_object(_instance);
				with (_instance)
				{
					x = _x;
					y = _y;
					instance_spawn();
				}
				_instance_list[_instance_num][zone_instance_data.can_spawn] = false;
			}
			_zone_y2++;
		}
		else
			break;
	}
	_view.zone_main_spawn_area[3] = _zone_y2;
}