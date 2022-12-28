room_header(game_states.gameplay, msc_ship, room_directions.up);
tile_data_array_level_ship();
with (global.view)
{
	border[0] = -128;
	border[2] = -128;
}
global.water_height = 320;
global.water_height_previous = 320;
global.water_active = true;
global.water_type = water_types.water;