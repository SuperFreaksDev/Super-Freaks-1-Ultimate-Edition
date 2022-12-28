/// @description Hit

if (countdown == false)
{
	countdown = true;
	speed_walk = 3;
	timer_seek.frames = 8;
	sound_run = sfx_play_global(sfx_walk_rapid, true);
}