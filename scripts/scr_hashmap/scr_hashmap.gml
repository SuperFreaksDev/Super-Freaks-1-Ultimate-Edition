enum hashmap_cell_data
{
	hitbox = 0,
	collider = 1,
}

#macro HASHMAP_BUCKET_SIZE 96

/// @function hashmap_collision_init
function hashmap_collision_init()
{
	with (obj_manager)
	{
		global.hashmap_collision = [];
		global.hashmap_collision_width = 0;
		global.hashmap_collision_height = 0;
	}
}

/// @function hashmap_collision_create
function hashmap_collision_create()
{
	var _hashmap_collision_array = global.hashmap_collision;
	var _cell;
	
	global.hashmap_collision_width = ceil(room_width / HASHMAP_BUCKET_SIZE);
	global.hashmap_collision_height = ceil(room_height / HASHMAP_BUCKET_SIZE);
	
	show_debug_message("-----Collision Hashmap-----");
	show_debug_message("Width in Cells: " + string(global.hashmap_collision_width));
	show_debug_message("Height in Cells: " + string(global.hashmap_collision_height));
	show_debug_message("Total Cells: " + string(global.hashmap_collision_width * global.hashmap_collision_height));
	
	for (_cell = 0; _cell < (global.hashmap_collision_width * global.hashmap_collision_height); ++_cell)
	{
		_hashmap_collision_array[_cell] = array_create(2);
		_hashmap_collision_array[_cell][hashmap_cell_data.hitbox] = [];
		_hashmap_collision_array[_cell][hashmap_cell_data.collider] = [];
	}
}

/// @function hashmap_collision_clean
function hashmap_collision_clean()
{
	var _hashmap_collision_array = global.hashmap_collision;
	var _cell;
	var _cell_list, _cell_pos;
	var _instance;
	
	for (_cell = 0; _cell < (global.hashmap_collision_width * global.hashmap_collision_height); ++_cell)
	{
		_cell_list = _hashmap_collision_array[_cell][hashmap_cell_data.hitbox];
		
		for (_cell_pos = array_length(_cell_list) - 1; _cell_pos >= 0; --_cell_pos)
		{
			_instance = _cell_list[_cell_pos];
			
			if !instance_exists(_instance)
				array_delete(_cell_list, _cell_pos, 1);
		}
		
		_cell_list = _hashmap_collision_array[_cell][hashmap_cell_data.collider];

		for (_cell_pos = array_length(_cell_list) - 1; _cell_pos >= 0; --_cell_pos)
		{
			_instance = _cell_list[_cell_pos];
			
			if !instance_exists(_instance)
				array_delete(_cell_list, _cell_pos, 1);
		}
	}
}

/// @function hashmap_hitbox_cells_add_to
/// @param _cell_x1
/// @param _cell_y1
/// @param _cell_x2
/// @param _cell_y2
function hashmap_hitbox_cells_add_to(_cell_x1, _cell_y1, _cell_x2, _cell_y2)
{
	var _hashmap = global.hashmap_collision;
	var _hashmap_width = global.hashmap_collision_width;
	var _my_cells_previous = hashmap_hitbox_cells;
	var _my_cells = [];
	
	var _cell, _cell_x, _cell_y;
	
	var _array_pos;
	
	//show_debug_message("------------");
	
	//show_debug_message(_my_cells_previous);
	
	if (array_length(comp_list_hitbox) > 0)
	{
		for (_cell_x = _cell_x1; _cell_x <= _cell_x2; ++_cell_x)
		{
			for (_cell_y = _cell_y1; _cell_y <= _cell_y2; ++_cell_y)
			{
				_cell = _cell_x + (_cell_y * _hashmap_width);
				array_push(_my_cells, _cell);
			}
		}
	}
	
	//show_debug_message(_my_cells);
	
	if (!array_equals(_my_cells, _my_cells_previous))
	{
		for (_array_pos = 0; _array_pos < array_length(_my_cells_previous); ++_array_pos)
		{
			_cell = _my_cells_previous[_array_pos];
			
			if (!array_contains(_my_cells, _cell))
				array_remove_value(_hashmap[_cell][hashmap_cell_data.hitbox], id);
		}
		
		for (_array_pos = 0; _array_pos < array_length(_my_cells); ++_array_pos)
		{
			_cell = _my_cells[_array_pos];
			
			if (!array_contains(_hashmap[_cell][hashmap_cell_data.hitbox], id))
				array_push(_hashmap[_cell][hashmap_cell_data.hitbox], id);
		}
	}
	
	hashmap_hitbox_cells = _my_cells;
	
	gml_pragma("forceinline");
}

/// @function hashmap_collider_cells_add_to
/// @param _cell_x1
/// @param _cell_y1
/// @param _cell_x2
/// @param _cell_y2
function hashmap_collider_cells_add_to(_cell_x1, _cell_y1, _cell_x2, _cell_y2)
{
	var _hashmap = global.hashmap_collision;
	var _hashmap_width = global.hashmap_collision_width;
	var _my_cells_previous = hashmap_collider_cells;
	var _my_cells = [];
	
	var _cell, _cell_x, _cell_y;
	
	var _array_pos;
	
	if (array_length(comp_list_collider) > 0)
	{
		for (_cell_x = _cell_x1; _cell_x <= _cell_x2; ++_cell_x)
		{
			for (_cell_y = _cell_y1; _cell_y <= _cell_y2; ++_cell_y)
			{
				_cell = _cell_x + (_cell_y * _hashmap_width);
				array_push(_my_cells, _cell);
			}
		}
	}
	
	if (!array_equals(_my_cells, _my_cells_previous))
	{
		for (_array_pos = 0; _array_pos < array_length(_my_cells_previous); ++_array_pos)
		{
			_cell = _my_cells_previous[_array_pos];
			
			if (!array_contains(_my_cells, _cell))
				array_remove_value(_hashmap[_cell][hashmap_cell_data.collider], id);
		}
		
		for (_array_pos = 0; _array_pos < array_length(_my_cells); ++_array_pos)
		{
			_cell = _my_cells[_array_pos];
			
			if (!array_contains(_hashmap[_cell][hashmap_cell_data.collider], id))
				array_push(_hashmap[_cell][hashmap_cell_data.collider], id);
		}
	}
	
	hashmap_collider_cells = _my_cells;
	
	gml_pragma("forceinline");
}

/// @function hashmap_cells_remove_from
function hashmap_cells_remove_from()
{
	var _hashmap = global.hashmap_collision;
	var _hashmap_length = array_length(_hashmap);
	var _cell, _cell_list, _my_cells;
	var _array_pos;

	if (!is_array(_hashmap) || (array_length(_hashmap) == 0))
		exit;
		
	_my_cells = hashmap_hitbox_cells;
	for (_array_pos = 0; _array_pos < array_length(_my_cells); ++_array_pos)
	{
		_cell = _my_cells[_array_pos];
		if (_cell >= _hashmap_length)
			continue;
		_cell_list = _hashmap[_cell][hashmap_cell_data.hitbox];
			
		array_remove_value(_cell_list, id);
	}
	array_resize(_my_cells, 0);
	_my_cells = hashmap_collider_cells;
	for (_array_pos = 0; _array_pos < array_length(_my_cells); ++_array_pos)
	{
		_cell = _my_cells[_array_pos];
		if (_cell >= _hashmap_length)
			continue;
		_cell_list = _hashmap[_cell][hashmap_cell_data.collider];

		array_remove_value(_cell_list, id);
	}
	array_resize(_my_cells, 0);
	
	gml_pragma("forceinline");
}

/// @function hashmap_cells_remove_from_hitbox
function hashmap_cells_remove_from_hitbox()
{
	var _hashmap = global.hashmap_collision;
	var _hashmap_length = array_length(_hashmap);
	var _cell, _cell_list, _my_cells;
	var _array_pos;

	if (!is_array(_hashmap) || (array_length(_hashmap) == 0))
		exit;
		
	_my_cells = hashmap_hitbox_cells;
	
	for (_array_pos = 0; _array_pos < array_length(_my_cells); ++_array_pos)
	{
		_cell = _my_cells[_array_pos];
		if (_cell >= _hashmap_length)
			continue;
		_cell_list = _hashmap[_cell][hashmap_cell_data.hitbox];

		array_remove_value(_cell_list, id);
	}
	array_resize(_my_cells, 0);
	
	gml_pragma("forceinline");
}

/// @function hashmap_cells_remove_from_collider
function hashmap_cells_remove_from_collider()
{
	var _hashmap = global.hashmap_collision;
	var _hashmap_length = array_length(_hashmap);
	var _cell, _cell_list, _my_cells;
	var _array_pos;

	if (!is_array(_hashmap) || (array_length(_hashmap) == 0))
		exit;
		
	_my_cells = hashmap_collider_cells;
		
	for (_array_pos = 0; _array_pos < array_length(_my_cells); ++_array_pos)
	{
		_cell = _my_cells[_array_pos];
		if (_cell >= _hashmap_length)
			continue;
		_cell_list = _hashmap[_cell][hashmap_cell_data.collider];

		array_remove_value(_cell_list, id);
	}
	array_resize(_my_cells, 0);
	
	gml_pragma("forceinline");
}

