/// @function comp_list_hitbox_init
function comp_list_hitbox_init()
{
	comp_list_hitbox = [];
	broad_phase_hitbox = array_create(4);
	broad_phase_hitbox[0] = array_create(2);
	broad_phase_hitbox[1] = array_create(2);
	broad_phase_hitbox[2] = array_create(2);
	broad_phase_hitbox[3] = array_create(2);
	hitbox_collisions = [];
	hitbox_check_flag = false;
	hitbox_check_done = false;
}

/// @function comp_list_hitbox_step
function comp_list_hitbox_step()
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
	
	var _hitbox_check_flag = false;
	
	if (is_undefined(comp_list_hitbox))
		exit;
		
	_list = comp_list_hitbox;
		
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
				case "comp_hitbox":
					_broad_phase_x1 = min(_broad_phase_x1, x_offset);
					_broad_phase_y1 = min(_broad_phase_y1, y_offset);
					_broad_phase_x2 = max(_broad_phase_x2, x_offset);
					_broad_phase_y2 = max(_broad_phase_y2, y_offset);
					break;
				case "comp_hitbox_AABB":
				case "comp_hitbox_line":
					_broad_phase_x1 = min(_broad_phase_x1, x_offset + shape_x1, x_offset + shape_x2);
					_broad_phase_y1 = min(_broad_phase_y1, y_offset + shape_y1, y_offset + shape_y2);
					_broad_phase_x2 = max(_broad_phase_x2, x_offset + shape_x1, x_offset + shape_x2);
					_broad_phase_y2 = max(_broad_phase_y2, y_offset + shape_y1, y_offset + shape_y2);
					break;
				case "comp_hitbox_circle":
					_broad_phase_x1 = min(_broad_phase_x1, x_offset - radius);
					_broad_phase_y1 = min(_broad_phase_y1, y_offset - radius);
					_broad_phase_x2 = max(_broad_phase_x2, x_offset + radius);
					_broad_phase_y2 = max(_broad_phase_y2, y_offset + radius);
					break;
				default:
					break;
			}
			
			if (active == hitbox_active.active)
				_hitbox_check_flag = true;
		}
	}
	
	if (broad_phase_hitbox[0][broad_phase.pos] != _broad_phase_x1)
	{
		broad_phase_hitbox[0][broad_phase.pos] = _broad_phase_x1;
		_cells_x_check = true;
	}
	if (broad_phase_hitbox[1][broad_phase.pos] != _broad_phase_y1)
	{
		broad_phase_hitbox[1][broad_phase.pos] = _broad_phase_y1;
		_cells_y_check = true;
	}
	if (broad_phase_hitbox[2][broad_phase.pos] != _broad_phase_x2)
	{
		broad_phase_hitbox[2][broad_phase.pos] = _broad_phase_x2;
		_cells_x_check = true;
	}
	if (broad_phase_hitbox[3][broad_phase.pos] != _broad_phase_y2)
	{
		broad_phase_hitbox[3][broad_phase.pos] = _broad_phase_y2;
		_cells_y_check = true;
	}
	
	//if (x != x_previous)
		//_cells_x_check = true;
	//if (y != y_previous)
		//_cells_y_check = true;
		
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
	
		if (broad_phase_hitbox[0][broad_phase.cell] != _cell_x1)
		{
			broad_phase_hitbox[0][broad_phase.cell] = _cell_x1;
			_hashmap_add = true;
		}
		if (broad_phase_hitbox[2][broad_phase.cell] != _cell_x2)
		{
			broad_phase_hitbox[2][broad_phase.cell] = _cell_x2;
			_hashmap_add = true;
		}
	}
	
	if (_cells_y_check)
	{
		_pos_y1 = clamp(y + _broad_phase_y1, 0, room_height - 1);
		_pos_y2 = clamp(y + _broad_phase_y2, 0, room_height - 1);
		
		_cell_y1 = clamp(_pos_y1 div HASHMAP_BUCKET_SIZE, 0, _hashmap_height - 1);
		_cell_y2 = clamp(_pos_y2 div HASHMAP_BUCKET_SIZE, 0, _hashmap_height - 1);
		
		if (broad_phase_hitbox[1][broad_phase.cell] != _cell_y1)
		{
			broad_phase_hitbox[1][broad_phase.cell] = _cell_y1;
			_hashmap_add = true;
		}
		if (broad_phase_hitbox[3][broad_phase.cell] != _cell_y2)
		{
			broad_phase_hitbox[3][broad_phase.cell] = _cell_y2;
			_hashmap_add = true;
		}
	}
		
	if (array_length(_list) > 0)
	{
		if (_hashmap_add)
			hashmap_hitbox_cells_add_to(broad_phase_hitbox[0][broad_phase.cell], broad_phase_hitbox[1][broad_phase.cell], broad_phase_hitbox[2][broad_phase.cell], broad_phase_hitbox[3][broad_phase.cell]);
	}
	else
	{
		if (array_length(hashmap_hitbox_cells) > 0)
			hashmap_cells_remove_from_hitbox();
	}
	
	hitbox_check_flag = _hitbox_check_flag;
	hitbox_check_done = false;
		
	gml_pragma("forceinline");
}

/// @function comp_list_hitbox_spawn
function comp_list_hitbox_spawn()
{
	var _list = comp_list_hitbox, _pos;
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
				case "comp_hitbox":
					_broad_phase_x1 = min(_broad_phase_x1, x_offset);
					_broad_phase_y1 = min(_broad_phase_y1, y_offset);
					_broad_phase_x2 = max(_broad_phase_x2, x_offset);
					_broad_phase_y2 = max(_broad_phase_y2, y_offset);
					break;
				case "comp_hitbox_AABB":
				case "comp_hitbox_line":
					_broad_phase_x1 = min(_broad_phase_x1, x_offset + shape_x1, x_offset + shape_x2);
					_broad_phase_y1 = min(_broad_phase_y1, y_offset + shape_y1, y_offset + shape_y2);
					_broad_phase_x2 = max(_broad_phase_x2, x_offset + shape_x1, x_offset + shape_x2);
					_broad_phase_y2 = max(_broad_phase_y2, y_offset + shape_y1, y_offset + shape_y2);
					break;
				case "comp_hitbox_circle":
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
		
	_pos_x1 = clamp(x + _broad_phase_x1, 0, room_width - 1);
	_pos_x2 = clamp(x + _broad_phase_x2, 0, room_width - 1);
		
	_cell_x1 = clamp(_pos_x1 div HASHMAP_BUCKET_SIZE, 0, _hashmap_width);
	_cell_x2 = clamp(_pos_x2 div HASHMAP_BUCKET_SIZE, 0, _hashmap_width);
		
	broad_phase_hitbox[0][broad_phase.cell] = _cell_x1;
	broad_phase_hitbox[2][broad_phase.cell] = _cell_x2;
	
	_pos_y1 = clamp(y + _broad_phase_y1, 0, room_height - 1);
	_pos_y2 = clamp(y + _broad_phase_y2, 0, room_height - 1);
		
	_cell_y1 = clamp(_pos_y1 div HASHMAP_BUCKET_SIZE, 0, _hashmap_height - 1);
	_cell_y2 = clamp(_pos_y2 div HASHMAP_BUCKET_SIZE, 0, _hashmap_height - 1);
		
	broad_phase_hitbox[1][broad_phase.cell] = _cell_y1;
	broad_phase_hitbox[3][broad_phase.cell] = _cell_y2;
		
	if (array_length(_list) > 0)
		hashmap_hitbox_cells_add_to(broad_phase_hitbox[0][broad_phase.cell], broad_phase_hitbox[1][broad_phase.cell], broad_phase_hitbox[2][broad_phase.cell], broad_phase_hitbox[3][broad_phase.cell]);
		
	gml_pragma("forceinline");
}

/// @function comp_list_hitbox_draw
function comp_list_hitbox_draw()
{
	var _list = comp_list_hitbox;
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
				case "comp_hitbox_AABB":
					_shape_x1 = _x_offset + shape_x1;
					_shape_y1 = _y_offset + shape_y1;
					_shape_x2 = _x_offset + shape_x2;
					_shape_y2 = _y_offset + shape_y2;
					draw_rectangle(_shape_x1, _shape_y1, _shape_x2, _shape_y2, true);
					break;
				case "comp_hitbox_line":
					_shape_x1 = _x_offset + shape_x1;
					_shape_y1 = _y_offset + shape_y1;
					_shape_x2 = _x_offset + shape_x2;
					_shape_y2 = _y_offset + shape_y2;
					draw_line(_shape_x1, _shape_y1, _shape_x2, _shape_y2);
					break;
				case "comp_hitbox_circle":
					_shape_x1 = radius;
					draw_circle(_x_offset, _y_offset, _shape_x1, true);
					break;
				default:
					draw_point(_x_offset, _y_offset);
					break;
			}
			
			switch (active)
			{
				case hitbox_active.inactive:
					draw_text(_x_offset, _y_offset, "I");
					break;
				case hitbox_active.active:
					draw_text(_x_offset, _y_offset, "A");
					break;
				case hitbox_active.passive:
					draw_text(_x_offset, _y_offset, "P");
					break;
			}
		}
	}
}
