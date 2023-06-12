/// @description Spawn

// Inherit the parent event
event_inherited();

collected = bit_get(global.trophies, trophy_id);
if (collected)
	image_alpha = 0.5;