/// @description Debug Kill Boss

if (global.debug && global.game_state == game_states.gameplay)
{
	with (obj_boss)
	{
		hp = 0;
	}
}