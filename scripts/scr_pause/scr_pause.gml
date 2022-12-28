/// @function game_pause_set
/// @param {boolean} _pause = true
function game_pause_set(_pause = true)
{
	global.game_pause = _pause;
	global.frame_machine_level.pause = _pause;
	global.frame_machine_player.pause = _pause;
}

/// @function game_pause
/// @param _player_number = 0
function game_pause(_player_number = 0)
{
	global.game_pause = true;
	global.frame_machine_level.pause = true;
	global.frame_machine_player.pause = true;
	with (obj_menu_pause)
	{
		player_number = _player_number;
		state_next_set(pause_menu_states.opening);
	}
}

/// @function game_pause_get
function game_pause_get()
{
	return global.game_pause;
}
