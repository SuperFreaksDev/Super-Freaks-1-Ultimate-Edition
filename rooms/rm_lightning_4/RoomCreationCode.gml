room_header(game_states.gameplay, msc_lightning, room_directions.right);
tile_data_array_level_lightning();
tile_data_array_level_ship();
global.water_height = 784;
global.water_height_previous = 784;
global.water_active = true;
global.water_type = water_types.water;
with (obj_metronome)
{
	interval = 9;
	warn_offset = 3.4;
	strike_offset = 1.4;
	bpm = 147;
}