/// @description Debug Get All Trophies

var _i;

if (global.debug && global.game_state == game_states.gameplay && !room_transition_active_get())
{
	for (_i = 0; _i < global.trophies_max; ++_i)
	{
		global.trophies = bit_set(global.trophies, _i);
		sfx_play_global(sfx_unlock_level);
	}
}

