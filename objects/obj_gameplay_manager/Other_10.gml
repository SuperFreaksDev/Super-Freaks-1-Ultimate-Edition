/// @description Step

yorb_effect = max(yorb_effect - 0.25, 0);

if (random(100) < 0.075)	
	sfx_play_global(sfx_metal_pipe);