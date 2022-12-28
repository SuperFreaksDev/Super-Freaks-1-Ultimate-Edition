#macro CHECKPOINT_DEATH_MAX 4

enum spawn_point_data
{
	room = 0,
	x,
	y,
	go_to_checkpoint,
	checkpoint_id,
}

/// @function spawn_point_init
function spawn_point_init()
{
	global.room_destination = undefined;
	global.spawn_point = array_create(3);
	global.checkpoint = array_create(5);
	global.checkpoint_death_count = 0;
	spawn_point_set(undefined, 0, 0);
	checkpoint_set(undefined, 0, 0, -1);
}

/// @function room_destination_set
/// @param _room = undefined
function room_destination_set(_room = undefined)
{
	global.room_destination = _room;
}

/// @function room_destination_step
function room_destination_step()
{
	if (!is_undefined(global.room_destination))
	{
		room_goto(global.room_destination);
		global.room_destination = undefined;
	}
}

/// @function spawn_point_set
/// @param _room = undefined
/// @param _x = undefined
/// @param _y = undefined
function spawn_point_set(_room = undefined, _x = undefined, _y = undefined)
{
	global.spawn_point[spawn_point_data.room] = _room;
	global.spawn_point[spawn_point_data.x] = _x;
	global.spawn_point[spawn_point_data.y] = _y;
}

/// @function spawn_point_room_get
function spawn_point_room_get()
{
	return global.spawn_point[spawn_point_data.room];
}

/// @function spawn_point_x_get
function spawn_point_x_get()
{
	return global.spawn_point[spawn_point_data.x];
}

/// @function spawn_point_y_get
function spawn_point_y_get()
{
	return global.spawn_point[spawn_point_data.y];
}

/// @function checkpoint_set
/// @param _room = undefined
/// @param _x = undefined
/// @param _y = undefined
/// @param {int} checkpoint_id = -1
function checkpoint_set(_room = undefined, _x = undefined, _y = undefined, _checkpoint_id = -1)
{
	global.checkpoint[spawn_point_data.room] = _room;
	global.checkpoint[spawn_point_data.x] = _x;
	global.checkpoint[spawn_point_data.y] = _y;
	global.checkpoint[spawn_point_data.checkpoint_id] = _checkpoint_id;
}

/// @function checkpoint_room_get
function checkpoint_room_get()
{
	return global.checkpoint[spawn_point_data.room];
	
	gml_pragma("forceinline");
}

/// @function checkpoint_x_get
function checkpoint_x_get()
{
	return global.checkpoint[spawn_point_data.x];
	
	gml_pragma("forceinline");
}

/// @function checkpoint_y_get
function checkpoint_y_get()
{
	return global.checkpoint[spawn_point_data.y];
	
	gml_pragma("forceinline");
}

/// @function checkpoint_id_get
function checkpoint_id_get()
{
	return global.checkpoint[spawn_point_data.checkpoint_id];
	
	gml_pragma("forceinline");
}
