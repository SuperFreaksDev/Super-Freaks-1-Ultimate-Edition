enum hitbox_collision_stored_data
{
	hitbox = 0,
	hitbox_other,
}

/// @function hitbox_collision_stored_init
function hitbox_collision_stored_init()
{
	global.hitbox_collision_stored = array_create(2);
}

/// @function collisions_check
function collisions_check()
{
	var _hashmap = global.hashmap_collision;
	var _my_id, _my_object_index;
	var _instance;
	var _cell, _cell_list, _cell_list_pos;
	var _instance_list, _instance_list_pos;
	var _blacklist = [];
	
	if (hitbox_check_flag == false)
		exit;
		
	_my_id = id;
	_my_object_index = object_index;
	
	_cell_list = hashmap_hitbox_cells;
		
	for (_cell_list_pos = 0; _cell_list_pos < array_length(_cell_list); ++_cell_list_pos)
	{
		_cell = _cell_list[_cell_list_pos];
		_instance_list = _hashmap[_cell][hashmap_cell_data.hitbox];
			
		for (_instance_list_pos = 0; _instance_list_pos < array_length(_instance_list); ++_instance_list_pos)
		{
			_instance = _instance_list[_instance_list_pos];
				
			if (_instance == _my_id || _instance.hitbox_check_done == true || array_contains(_blacklist, _instance))
				continue;
				
			instance_collision_check(_instance);
			array_push(_blacklist, _instance);
		}
	}
		
	hitbox_check_done = true;
}

/// @function collisions_resolve
function collisions_resolve()
{
	var _collision_list, _collision_list_pos, _collision_list_length;
	var _instance, _my_id = id;
	
	_collision_list = hitbox_collisions;
	_collision_list_length = array_length(_collision_list);
	
	if (_collision_list_length == 0)
		exit;
	
	for (_collision_list_pos = _collision_list_length - 1; _collision_list_pos >= 0; --_collision_list_pos)
	{
		_instance = _collision_list[_collision_list_pos][0];
		global.hitbox_collision_stored[hitbox_collision_stored_data.hitbox] = _collision_list[_collision_list_pos][1];
		global.hitbox_collision_stored[hitbox_collision_stored_data.hitbox_other] = _collision_list[_collision_list_pos][2];
		
		with (_instance)
		{
			with (_my_id)
				event_perform(ev_collision, _instance.object_index);
		}
	}
	
	array_resize(hitbox_collisions, 0);
}

/// @function instance_collision_check
/// @param _instance
function instance_collision_check(_instance)
{
	var _my_id = id;
	
	var _hitbox_collision_global = global.hitbox_collision_stored;
	var _hitbox_collisions_self = hitbox_collisions;
	var _hitbox_collisions_other = _instance.hitbox_collisions;
	
	var _hitbox_list_self = comp_list_hitbox;
	var _hitbox_list_self_pos;
	var _hitbox_self;
	
	var _hitbox_list_other = _instance.comp_list_hitbox;
	var _hitbox_list_other_pos;
	var _hitbox_other;
	
	var _collision_array;
			
	for (_hitbox_list_self_pos = 0; _hitbox_list_self_pos < array_length(_hitbox_list_self); ++_hitbox_list_self_pos)
	{
		_hitbox_self = _hitbox_list_self[_hitbox_list_self_pos].ref;
		
		if (_hitbox_self.active == hitbox_active.inactive)
			continue;
		
		for (_hitbox_list_other_pos = 0; _hitbox_list_other_pos < array_length(_hitbox_list_other); ++_hitbox_list_other_pos)
		{
			_hitbox_other = _hitbox_list_other[_hitbox_list_other_pos].ref;
			
			if (_hitbox_other.active == hitbox_active.inactive)
				continue;
			
			if (hitbox_collision_check(_hitbox_self, _hitbox_other))
			{
				//show_debug_message(string(global.frame) + " COLLISION BETWEEN " + string(id) + " " + string(object_get_name(object_index)) + " AND " + string(_instance.id) + " " + string(object_get_name(_instance.object_index)));
				_hitbox_collision_global[hitbox_collision_stored_data.hitbox] = _hitbox_self;
				_hitbox_collision_global[hitbox_collision_stored_data.hitbox_other] = _hitbox_other;
				_collision_array = array_create(3);
				_collision_array[0] = _instance;
				_collision_array[1] = _hitbox_self;
				_collision_array[2] = _hitbox_other;
				array_push(_hitbox_collisions_self, _collision_array);
				_collision_array = array_create(3);
				_collision_array[0] = _my_id;
				_collision_array[1] = _hitbox_other;
				_collision_array[2] = _hitbox_self;
				array_push(_hitbox_collisions_other, _collision_array);
				return true;
			}
		}
	}
	
	return false;
}

/// @function hitbox_collision_check
/// @param _hitbox_1
/// @param _hitbox_2
function hitbox_collision_check(_hitbox_1, _hitbox_2)
{
	var _hitbox_1_owner = _hitbox_1.owner;
	var _hitbox_1_x = _hitbox_1_owner.x + _hitbox_1.x_offset;
	var _hitbox_1_y = _hitbox_1_owner.y + _hitbox_1.y_offset;
	var _hitbox_2_owner = _hitbox_2.owner;
	var _hitbox_2_x = _hitbox_2_owner.x + _hitbox_2.x_offset;
	var _hitbox_2_y = _hitbox_2_owner.y + _hitbox_2.y_offset;
	
	gml_pragma("forceinline");
	
	switch (instanceof(_hitbox_1))
	{
		case "comp_hitbox_AABB":
			switch (instanceof(_hitbox_2))
			{
				case "comp_hitbox_AABB":
					if rectangle_in_rectangle(_hitbox_1_x + _hitbox_1.shape_x1, _hitbox_1_y + _hitbox_1.shape_y1, _hitbox_1_x + _hitbox_1.shape_x2, _hitbox_1_y + _hitbox_1.shape_y2,
											  _hitbox_2_x + _hitbox_2.shape_x1, _hitbox_2_y + _hitbox_2.shape_y1, _hitbox_2_x + _hitbox_2.shape_x2, _hitbox_2_y + _hitbox_2.shape_y2)
						return true;
					break;
				case "comp_hitbox_circle":
					if rectangle_in_circle(_hitbox_1_x + _hitbox_1.shape_x1, _hitbox_1_y + _hitbox_1.shape_y1, _hitbox_1_x + _hitbox_1.shape_x2, _hitbox_1_y + _hitbox_1.shape_y2,
										   _hitbox_2_x, _hitbox_2_y, _hitbox_2.radius)
						return true;
					break;
				case "comp_hitbox_triangle":
					if rectangle_in_triangle(_hitbox_1_x + _hitbox_1.shape_x1, _hitbox_1_y + _hitbox_1.shape_y1, _hitbox_1_x + _hitbox_1.shape_x2, _hitbox_1_y + _hitbox_1.shape_y2,
											 _hitbox_2_x + _hitbox_2.shape_x1, _hitbox_2_y + _hitbox_2.shape_y1, _hitbox_2_x + _hitbox_2.shape_x2, _hitbox_2_y + _hitbox_2.shape_y2, _hitbox_2_x + _hitbox_2.shape_x3, _hitbox_2_y + _hitbox_2.shape_y3)
						return true;
					break;
				case "comp_hitbox_capsule":
					break;
				default: //None
					break;
			}
			break;
		case "comp_hitbox_circle":
			switch (instanceof(_hitbox_2))
			{
				case "comp_hitbox_AABB":
					if rectangle_in_circle(_hitbox_2_x + _hitbox_2.shape_x1, _hitbox_2_y + _hitbox_2.shape_y1, _hitbox_2_x + _hitbox_2.shape_x2, _hitbox_2_y + _hitbox_2.shape_y2,
										   _hitbox_1_x, _hitbox_1_y, _hitbox_1.radius)
						return true;
					break;
				case "comp_hitbox_circle":
					if circle_in_circle(_hitbox_1_x, _hitbox_1_y, _hitbox_1.radius, _hitbox_2_x, _hitbox_2_y, _hitbox_2.radius)
						return true;
					break;
				case "comp_hitbox_triangle":
					if circle_in_triangle(_hitbox_1_x, _hitbox_1_y, _hitbox_1.radius,
										  _hitbox_2_x + _hitbox_2.shape_x1, _hitbox_2_y + _hitbox_2.shape_y1, _hitbox_2_x + _hitbox_2.shape_x2, _hitbox_2_y + _hitbox_2.shape_y2, _hitbox_2_x + _hitbox_2.shape_x3, _hitbox_2_y + _hitbox_2.shape_y3)
						return true;
					break;
				case "comp_hitbox_capsule":
					if circle_in_capsule(_hitbox_1_x, _hitbox_1_y, _hitbox_1.radius, 
										 _hitbox_2_x + _hitbox_2.shape_x1, _hitbox_2_y + _hitbox_2.shape_y1, _hitbox_2_x + _hitbox_2.shape_x2, _hitbox_2_y + _hitbox_2.shape_y2, _hitbox_2.radius)
						return true;
					break;
				default: //None
					break;
			}
			break;
		case "comp_hitbox_triangle":
			switch (instanceof(_hitbox_2))
			{
				case "comp_hitbox_AABB":
					if rectangle_in_triangle(_hitbox_2_x + _hitbox_2.shape_x1, _hitbox_2_y + _hitbox_2.shape_y1, _hitbox_2_x + _hitbox_2.shape_x2, _hitbox_2_y + _hitbox_2.shape_y2,
											 _hitbox_1_x + _hitbox_1.shape_x1, _hitbox_1_y + _hitbox_1.shape_y1, _hitbox_1_x + _hitbox_1.shape_x2, _hitbox_1_y + _hitbox_1.shape_y2, _hitbox_1_x + _hitbox_1.shape_x3, _hitbox_1_y + _hitbox_1.shape_y3)
						return true;
					break;
				case "comp_hitbox_circle":
					if circle_in_triangle(_hitbox_2_x, _hitbox_2_y, _hitbox_2.radius,
										  _hitbox_1_x + _hitbox_1.shape_x1, _hitbox_1_y + _hitbox_1.shape_y1, _hitbox_1_x + _hitbox_1.shape_x2, _hitbox_1_y + _hitbox_1.shape_y2, _hitbox_1_x + _hitbox_1.shape_x3, _hitbox_1_y + _hitbox_1.shape_y3)
						return true;
					break;
				case "comp_hitbox_triangle":
					if triangle_in_triangle(_hitbox_1_x + _hitbox_1.shape_x1, _hitbox_1_y + _hitbox_1.shape_y1, _hitbox_1_x + _hitbox_1.shape_x2, _hitbox_1_y + _hitbox_1.shape_y2, _hitbox_1_x + _hitbox_1.shape_x3, _hitbox_1_y + _hitbox_1.shape_y3,
											_hitbox_2_x + _hitbox_2.shape_x1, _hitbox_2_y + _hitbox_2.shape_y1, _hitbox_2_x + _hitbox_2.shape_x2, _hitbox_2_y + _hitbox_2.shape_y2, _hitbox_2_x + _hitbox_2.shape_x3, _hitbox_2_y + _hitbox_2.shape_y3)
					break;
				case "comp_hitbox_capsule":
					break;
				default: //None
					break;
			}
			break;
		case "comp_hitbox_capsule":
			switch (instanceof(_hitbox_2))
			{
				case "comp_hitbox_AABB":
					break;
				case "comp_hitbox_circle":
					if circle_in_capsule(_hitbox_2_x, _hitbox_2_y, _hitbox_2.radius, 
										 _hitbox_1_x + _hitbox_1.shape_x1, _hitbox_1_y + _hitbox_1.shape_y1, _hitbox_1_x + _hitbox_1.shape_x2, _hitbox_1_y + _hitbox_1.shape_y2, _hitbox_1.radius)
						return true;
					break;
				case "comp_hitbox_triangle":
					break;
				case "comp_hitbox_capsule":
					if capsule_in_capsule(_hitbox_1_x + _hitbox_1.shape_x1, _hitbox_1_y + _hitbox_1.shape_y1, _hitbox_1_x + _hitbox_1.shape_x2, _hitbox_1_y + _hitbox_1.shape_y2, _hitbox_1.radius, 
										  _hitbox_2_x + _hitbox_2.shape_x1, _hitbox_2_y + _hitbox_2.shape_y1, _hitbox_2_x + _hitbox_2.shape_x2, _hitbox_2_y + _hitbox_2.shape_y2, _hitbox_2.radius)
						return true;
					break;
				default: //None
					break;
			}
			break;
	}
	
	return false;
}

/// @function hitbox_collision_instance_other_get
function hitbox_collision_instance_other_get()
{
	return global.hitbox_collision_stored[hitbox_collision_stored_data.hitbox_other].owner;
	
	gml_pragma("forceinline");
}
