/// @description 

instance_destroy();
sfx_play_global(sfx_heart);
global.hearts++;

if (global.game_mode == game_modes.randomizer)
	global.hearts = min(global.hearts, 4);