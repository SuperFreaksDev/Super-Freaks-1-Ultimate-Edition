/// @description 

if (!active)
{
	animate_speed = 0.125;
	checkpoint_set(room, x, y, checkpoint_id);
	global.checkpoint_death_count = 0;
}
