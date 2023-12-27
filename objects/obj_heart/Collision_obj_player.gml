/// @description 

instance_destroy();
switch (global.story_mode)
{
	case story_modes.super_freaks:
		sfx_play_global(sfx_heart);
		global.hearts = min(global.hearts + 1, hearts_maximum_get());
		break;
	case story_modes.kranion:
	case story_modes.swordsman:
		sfx_play_global(sfx_heart);
		player_meter_collect(15);
		break;
}