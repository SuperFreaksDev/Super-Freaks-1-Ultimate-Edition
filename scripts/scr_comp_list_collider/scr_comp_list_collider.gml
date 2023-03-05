/// @function comp_list_collider_init
function comp_list_collider_init()
{
	comp_list_collider = [];
	broad_phase_collider = array_create(4);
	broad_phase_collider[0] = array_create(2);
	broad_phase_collider[1] = array_create(2);
	broad_phase_collider[2] = array_create(2);
	broad_phase_collider[3] = array_create(2);
}

/// @function comp_list_collider_move
function comp_list_collider_move()
{
	var _list = comp_list_collider, _pos;
	var _comp;
	
	for (_pos = array_length(_list) - 1; _pos >= 0; --_pos)
	{
		_comp = _list[_pos];
		
		if (!weak_ref_alive(_comp))
		{
			array_delete(_list, _pos, 1);
			continue;
		}
		
		_comp = _comp.ref;
		
		with (_comp)
			move();
	}
}

/// @function comp_list_collider_step
function comp_list_collider_step()
{
	var _list, _pos;
	var _comp;
	var _pos_x1, _pos_y1, _pos_x2, _pos_y2;
	var _cell_x1, _cell_y1, _cell_x2, _cell_y2;
	var _cells_x_check = false, _cells_y_check = false;
	
	var _hashmap_width = global.hashmap_collision_width;
	var _hashmap_height = global.hashmap_collision_height;
	var _hashmap_add = false;
	
	var _broad_phase_x1 = 0;
	var _broad_phase_y1 = 0;
	var _broad_phase_x2 = 0;
	var _broad_phase_y2 = 0;
	
	_list = comp_list_collider;
		
	for (_pos = array_length(_list) - 1; _pos >= 0; --_pos)
	{
		_comp = _list[_pos];
		
		if (!weak_ref_alive(_comp))
		{
			array_delete(_list, _pos, 1);
			continue;
		}
		
		_comp = _comp.ref;
		
		with (_comp)
		{
			step();
			switch (instanceof(_comp))
			{
				case "comp_collider":
					_broad_phase_x1 = min(_broad_phase_x1, x_offset);
					_broad_phase_y1 = min(_broad_phase_y1, y_offset);
					_broad_phase_x2 = max(_broad_phase_x2, x_offset);
					_broad_phase_y2 = max(_broad_phase_y2, y_offset);
					break;
				case "comp_collider_AABB":
					_broad_phase_x1 = min(_broad_phase_x1, x_offset + shape_x1, x_offset + shape_x2);
					_broad_phase_y1 = min(_broad_phase_y1, y_offset + shape_y1, y_offset + shape_y2);
					_broad_phase_x2 = max(_broad_phase_x2, x_offset + shape_x1, x_offset + shape_x2);
					_broad_phase_y2 = max(_broad_phase_y2, y_offset + shape_y1, y_offset + shape_y2);
					break;
				case "comp_collider_line":
					if (shape_x1 == shape_x2)
					{
						_broad_phase_x1 = min(_broad_phase_x1, x_offset + shape_x1);
						_broad_phase_x2 = max(_broad_phase_x2, x_offset + shape_x1);
					}
					else
					{
						_broad_phase_x1 = min(_broad_phase_x1, x_offset + shape_x1, x_offset + shape_x2);
						_broad_phase_x2 = max(_broad_phase_x2, x_offset + shape_x1, x_offset + shape_x2);
					}
					_broad_phase_y1 = min(_broad_phase_y1, y_offset + shape_y1, y_offset + shape_y2);
					_broad_phase_y2 = max(_broad_phase_y2, y_offset + shape_y1, y_offset + shape_y2);
					break;
				case "comp_collider_circle":
					_broad_phase_x1 = min(_broad_phase_x1, x_offset - radius);
					_broad_phase_y1 = min(_broad_phase_y1, y_offset - radius);
					_broad_phase_x2 = max(_broad_phase_x2, x_offset + radius);
					_broad_phase_y2 = max(_broad_phase_y2, y_offset + radius);
					break;
				default:
					break;
			}
		}
	}
	
	if (broad_phase_collider[0][broad_phase.pos] != _broad_phase_x1)
	{
		broad_phase_collider[0][broad_phase.pos] = _broad_phase_x1;
		_cells_x_check = true;
	}
	if (broad_phase_collider[1][broad_phase.pos] != _broad_phase_y1)
	{
		broad_phase_collider[1][broad_phase.pos] = _broad_phase_y1;
		_cells_y_check = true;
	}
	if (broad_phase_collider[2][broad_phase.pos] != _broad_phase_x2)
	{
		broad_phase_collider[2][broad_phase.pos] = _broad_phase_x2;
		_cells_x_check = true;
	}
	if (broad_phase_collider[3][broad_phase.pos] != _broad_phase_y2)
	{
		broad_phase_collider[3][broad_phase.pos] = _broad_phase_y2;
		_cells_y_check = true;
	}
	
	//if (x != x_previous)
	//	_cells_x_check = true;
	//if (y != y_previous)
	//	_cells_y_check = true;
	
	if (x != x_previous || y != y_previous)
	{
		_cells_x_check = true;
		_cells_y_check = true;
	}
		
	if (_cells_x_check)
	{
		_pos_x1 = clamp(x + _broad_phase_x1, 0, room_width - 1);
		_pos_x2 = clamp(x + _broad_phase_x2, 0, room_width - 1);
		
		_cell_x1 = clamp(_pos_x1 div HASHMAP_BUCKET_SIZE, 0, _hashmap_width);
		_cell_x2 = clamp(_pos_x2 div HASHMAP_BUCKET_SIZE, 0, _hashmap_width);
	
		if (broad_phase_collider[0][broad_phase.cell] != _cell_x1)
		{
			broad_phase_collider[0][broad_phase.cell] = _cell_x1;
			_hashmap_add = true;
		}
		if (broad_phase_collider[2][broad_phase.cell] != _cell_x2)
		{
			broad_phase_collider[2][broad_phase.cell] = _cell_x2;
			_hashmap_add = true;
		}
	}
	
	if (_cells_y_check)
	{
		_pos_y1 = clamp(y + _broad_phase_y1, 0, room_height - 1);
		_pos_y2 = clamp(y + _broad_phase_y2, 0, room_height - 1);
		
		_cell_y1 = clamp(_pos_y1 div HASHMAP_BUCKET_SIZE, 0, _hashmap_height - 1);
		_cell_y2 = clamp(_pos_y2 div HASHMAP_BUCKET_SIZE, 0, _hashmap_height - 1);
		
		if (broad_phase_collider[1][broad_phase.cell] != _cell_y1)
		{
			broad_phase_collider[1][broad_phase.cell] = _cell_y1;
			_hashmap_add = true;
		}
		if (broad_phase_collider[3][broad_phase.cell] != _cell_y2)
		{
			broad_phase_collider[3][broad_phase.cell] = _cell_y2;
			_hashmap_add = true;
		}
	}
		
	if (array_length(_list) > 0)
	{
		if (_hashmap_add)
			hashmap_collider_cells_add_to(broad_phase_collider[0][broad_phase.cell], broad_phase_collider[1][broad_phase.cell], broad_phase_collider[2][broad_phase.cell], broad_phase_collider[3][broad_phase.cell]);
	}
	else
	{
		if (array_length(hashmap_collider_cells) > 0)
			hashmap_cells_remove_from_collider();
	}
	
	//comp_list_collider_move();
		
	gml_pragma("forceinline");
}

/// @function comp_list_collider_spawn
function comp_list_collider_spawn()
{
	var _list = comp_list_collider, _pos;
	var _comp;
	var _pos_x1, _pos_y1, _pos_x2, _pos_y2;
	var _cell_x1, _cell_y1, _cell_x2, _cell_y2;
	
	var _hashmap_width = global.hashmap_collision_width;
	var _hashmap_height = global.hashmap_collision_height;
	
	var _broad_phase_x1 = 0;
	var _broad_phase_y1 = 0;
	var _broad_phase_x2 = 0;
	var _broad_phase_y2 = 0;
		
	for (_pos = array_length(_list) - 1; _pos >= 0; --_pos)
	{
		_comp = _list[_pos];
		
		if (!weak_ref_alive(_comp))
		{
			array_delete(_list, _pos, 1);
			continue;
		}
		
		_comp = _comp.ref;
		
		with (_comp)
		{
			switch (instanceof(_comp))
			{
				case "comp_collider":
					_broad_phase_x1 = min(_broad_phase_x1, x_offset);
					_broad_phase_y1 = min(_broad_phase_y1, y_offset);
					_broad_phase_x2 = max(_broad_phase_x2, x_offset);
					_broad_phase_y2 = max(_broad_phase_y2, y_offset);
					break;
				case "comp_collider_AABB":
				case "comp_collider_line":
					_broad_phase_x1 = min(_broad_phase_x1, x_offset + shape_x1, x_offset + shape_x2);
					_broad_phase_y1 = min(_broad_phase_y1, y_offset + shape_y1, y_offset + shape_y2);
					_broad_phase_x2 = max(_broad_phase_x2, x_offset + shape_x1, x_offset + shape_x2);
					_broad_phase_y2 = max(_broad_phase_y2, y_offset + shape_y1, y_offset + shape_y2);
					break;
				case "comp_collider_circle":
					_broad_phase_x1 = min(_broad_phase_x1, x_offset - radius);
					_broad_phase_y1 = min(_broad_phase_y1, y_offset - radius);
					_broad_phase_x2 = max(_broad_phase_x2, x_offset + radius);
					_broad_phase_y2 = max(_broad_phase_y2, y_offset + radius);
					break;
				default:
					break;
			}
			move();
		}
	}
		
	_pos_x1 = clamp(x + _broad_phase_x1, 0, room_width - 1);
	_pos_x2 = clamp(x + _broad_phase_x2, 0, room_width - 1);
		
	_cell_x1 = clamp(_pos_x1 div HASHMAP_BUCKET_SIZE, 0, _hashmap_width);
	_cell_x2 = clamp(_pos_x2 div HASHMAP_BUCKET_SIZE, 0, _hashmap_width);
		
	broad_phase_collider[0][broad_phase.cell] = _cell_x1;
	broad_phase_collider[2][broad_phase.cell] = _cell_x2;
	
	_pos_y1 = clamp(y + _broad_phase_y1, 0, room_height - 1);
	_pos_y2 = clamp(y + _broad_phase_y2, 0, room_height - 1);
		
	_cell_y1 = clamp(_pos_y1 div HASHMAP_BUCKET_SIZE, 0, _hashmap_height - 1);
	_cell_y2 = clamp(_pos_y2 div HASHMAP_BUCKET_SIZE, 0, _hashmap_height - 1);
		
	broad_phase_collider[1][broad_phase.cell] = _cell_y1;
	broad_phase_collider[3][broad_phase.cell] = _cell_y2;
		
	if (array_length(_list) > 0)
		hashmap_collider_cells_add_to(broad_phase_collider[0][broad_phase.cell], broad_phase_collider[1][broad_phase.cell], broad_phase_collider[2][broad_phase.cell], broad_phase_collider[3][broad_phase.cell]);
		
	gml_pragma("forceinline");
}

/// @function comp_list_collider_draw
function comp_list_collider_draw()
{
	var _list = comp_list_collider;
	var _pos;
	var _comp;
	var _x_offset, _y_offset;
	var _shape_x1, _shape_y1, _shape_x2, _shape_y2;
	var _owner_x = x, _owner_y = y;

	for (_pos = array_length(_list) - 1; _pos >= 0; --_pos)
	{
		_comp = _list[_pos];
		
		if (!weak_ref_alive(_comp))
		{
			array_delete(_list, _pos, 1);
			continue;
		}
		
		_comp = _comp.ref;
		
		with (_comp)
		{
			_x_offset = x_offset + _owner_x;
			_y_offset = y_offset + _owner_y;
			
			switch (instanceof(_comp))
			{
				case "comp_collider_AABB":
					_shape_x1 = _x_offset + shape_x1;
					_shape_y1 = _y_offset + shape_y1;
					_shape_x2 = _x_offset + shape_x2;
					_shape_y2 = _y_offset + shape_y2;
					draw_rectangle(_shape_x1, _shape_y1, _shape_x2, _shape_y2, true);
					break;
				case "comp_collider_line":
					_shape_x1 = _x_offset + shape_x1;
					_shape_y1 = _y_offset + shape_y1;
					_shape_x2 = _x_offset + shape_x2;
					_shape_y2 = _y_offset + shape_y2;
					draw_line(_shape_x1, _shape_y1, _shape_x2, _shape_y2);
					break;
				case "comp_collider_circle":
					_shape_x1 = radius;
					draw_circle(_x_offset, _y_offset, _shape_x1, true);
					break;
				default:
					draw_point(_x_offset, _y_offset);
					break;
			}
		}
	}
}
