var _music = msc_boss_apex;

room_header(game_states.gameplay, _music, room_directions.down);
with (global.view)
{
	border[0] = -128;
	border[2] = -128;
	border[1] = -128;
	border[3] = -128;
}
tile_data_array_level_ship();