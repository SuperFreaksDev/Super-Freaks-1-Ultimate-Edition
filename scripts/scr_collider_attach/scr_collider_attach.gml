enum collider_attach_data
{
	collider = 0,
	collision_x,
	collision_y,
	speed_x,
	speed_y,
}

/// @function collider_attach_init
function collider_attach_init()
{
	collider_attach = array_create(5);
	collider_attach[collider_attach_data.collider] = undefined;
	collider_attach[collider_attach_data.collision_x] = 0;
	collider_attach[collider_attach_data.collision_y] = 0;
	collider_attach[collider_attach_data.speed_x] = 0;
	collider_attach[collider_attach_data.speed_y] = 0;
	
	gml_pragma("forceinline");
}

/// @function collider_attach_clear
function collider_attach_clear()
{
	var _collider_stored = collider_attach[collider_attach_data.collider];
	
	if (is_array(_collider_stored))
		array_remove_value(_collider_stored.attach_list, id);
	
	collider_attach[collider_attach_data.collider] = undefined;
	collider_attach[collider_attach_data.collision_x] = 0;
	collider_attach[collider_attach_data.collision_y] = 0;
	collider_attach[collider_attach_data.speed_x] = 0;
	collider_attach[collider_attach_data.speed_y] = 0;
	
	gml_pragma("forceinline");
}

/// @function collider_attach_step
function collider_attach_step()
{
	var _collider = collider_attach[collider_attach_data.collider];
	
	if (!is_struct(_collider) || !instance_exists(_collider.owner))
		collider_attach_clear();
		
	gml_pragma("forceinline");
}

/// @function collider_attach_set
/// @param _collider
/// @param _x
/// @param _y
function collider_attach_set(_collider, _x, _y)
{
	if (collider_attach[collider_attach_data.collider] != _collider)
	{
		collider_attach[collider_attach_data.collider] = _collider;
		collider_attach[collider_attach_data.speed_x] = 0;
		collider_attach[collider_attach_data.speed_y] = 0;
				
		if (!array_contains(_collider.attach_list, id))
			array_push(_collider.attach_list, id);
	}
	
	collider_attach[collider_attach_data.collision_x] = _x;
	collider_attach[collider_attach_data.collision_y] = _y;
	
	gml_pragma("forceinline");
}
