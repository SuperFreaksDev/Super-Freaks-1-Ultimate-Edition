/// @description Step

if (slowmo_timer.frames > 0)
{
	slowmo_effect = min(slowmo_effect + 1, 10);
	slowmo_wave++;
	global.frame_machine_level.multiplier = lerp(global.frame_machine_level.multiplier, 0.25, 0.125);
}
else
{
	slowmo_effect = max(slowmo_effect - 1, 0);
	slowmo_wave = lerp(slowmo_wave, 0, 0.125);
	global.frame_machine_level.multiplier = lerp(global.frame_machine_level.multiplier, 1, 0.125);
	
	if (slowmo_effect == 0)
		instance_destroy();
}