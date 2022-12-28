enum room_directions
{
	four_way = 0,
	horizontal,
	left,
	right,
	vertical,
	up,
	down,
}

/// @function room_header
/// @param {int} _game_state = game_states.NA
/// @param _music = MUSIC_NA
/// @param _room_direction = room_directions.four_way
function room_header(_game_state = game_states.NA, _music = MUSIC_NA, _room_direction = room_directions.four_way)
{
	game_state_set(_game_state);
	music_set(_music);
	global.water_active = false;
	
	switch (_room_direction)
	{
		case room_directions.horizontal:
			view_borders_set(96, 32, 96, 32);
			break;
		case room_directions.left:
			view_borders_set(128, 32, 64, 32);
			break;
		case room_directions.right:
			view_borders_set(64, 32, 128, 32);
			break;
		case room_directions.vertical:
			view_borders_set(32, 96, 32, 96);
			break;
		case room_directions.up:
			view_borders_set(32, 128, 32, -128);
			break;
		case room_directions.down:
			view_borders_set(32, -128, 32, 128);
			break;
		default:
			view_borders_set(96, 96, 96, 96);
			break;
	}
}
