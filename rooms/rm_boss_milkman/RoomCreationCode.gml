var _music = msc_boss_1;

if (global.game_mode == game_modes.boss_rush)
	_music = msc_bossrush;

room_header(game_states.gameplay, _music, room_directions.down);
with (global.view)
{
	border[0] = -128;
	border[2] = -128;
}
tile_data_array_level_park();
with (obj_metronome)
{
	interval = 2;
	warn_offset = 0;
	strike_offset = 0;
	bpm = 162;
}