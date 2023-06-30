/// @description Step

get_total_hp();

if (active)
{
	if (bit_get(global.boss_phase, 0) && bit_get(global.boss_phase, 1) && bit_get(global.boss_phase, 2) && bit_get(global.boss_phase, 3))
	{
		music_stop();
		active = false;
	}
}
else
{
	timer--;
	
	if (timer <= 0)
		level_beat();
}