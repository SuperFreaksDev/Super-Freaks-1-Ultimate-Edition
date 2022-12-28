/// @description Debug Finish Level

if (global.debug && global.game_state == game_states.gameplay && !room_transition_active_get())
{
	global.frame_machine_level.pause = true;
	global.frame_machine_player.pause = true;
	audio_stop_all();
	level_beat();
}

