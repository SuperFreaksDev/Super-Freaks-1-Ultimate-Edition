var _music = msc_boss_dino;

if (global.game_mode == game_modes.boss_rush)
	_music = msc_bossrush;
else if (global.boss_phase == 1 && global.game_mode != game_modes.boss_rush)
	_music = msc_boss_dino_2;

room_header(game_states.gameplay, _music, room_directions.down);
with (global.view)
{
	border[0] = -128;
	border[2] = -128;
}
tile_data_array_level_ship();