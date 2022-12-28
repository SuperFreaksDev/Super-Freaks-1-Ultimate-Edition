enum room_transition_data
{
	type = 0,
	room,
	frame,
	state,
}

enum room_transition_types
{
	fade_black = 0,
	fade_white,
	level_start,
}

enum room_transition_states
{
	NA = 0,
	start,
	middle,
	finish,
}

/// @function room_transition_init
function room_transition_init()
{
	global.room_transition = array_create(4, 0);
}

/// @function room_transition_set
/// @param {int} _type = room_transition_types.fade_black
/// @param _room
function room_transition_set(_type = room_transition_types.fade_black, _room)
{
	global.room_transition[room_transition_data.type] = _type;
	global.room_transition[room_transition_data.room] = _room;
	global.room_transition[room_transition_data.frame] = 0;
	global.room_transition[room_transition_data.state] = room_transition_states.start;
}

/// @function room_transition_step
function room_transition_step()
{
	var _type, _frame, _state, _room;
	
	_state = global.room_transition[room_transition_data.state];
	
	if (_state == room_transition_states.NA)
		exit;
		
	_type = global.room_transition[room_transition_data.type];
	_frame = global.room_transition[room_transition_data.frame];
	_frame++;
	_room = global.room_transition[room_transition_data.room];
	
	switch (_state)
	{
		case room_transition_states.start:
			if (_frame == 100)
			{
				global.room_transition[room_transition_data.state] = room_transition_states.middle;
				global.room_transition[room_transition_data.frame] = 0;
			}
			break;
		case room_transition_states.middle:
			global.room_transition[room_transition_data.state] = room_transition_states.finish;
			global.room_transition[room_transition_data.frame] = 0;
			room_goto(_room);
			break;
		case room_transition_states.finish:
			if (_frame == 100)
			{
				global.room_transition[room_transition_data.state] = room_transition_states.NA;
				global.room_transition[room_transition_data.frame] = 0;
			}
			break;
	}
}

/// @function room_transition_active_get
function room_transition_active_get()
{
	return instance_exists(obj_room_transition_parent);
	
	gml_pragma("forceinline");
}
