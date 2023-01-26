/// @description 

global.trophies = bit_set(global.trophies, trophy_id);
sfx_play_global(sfx_unlock_level);
if (instance_exists(obj_gameplay_manager))
{
	with (obj_gameplay_manager)
		the_trophy_appears = 100;
}
event_inherited();