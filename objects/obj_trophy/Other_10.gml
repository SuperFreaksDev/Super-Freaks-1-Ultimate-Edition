/// @description Step

collected = bit_get(global.trophies, trophy_id);
if (collected)
	image_alpha = 0.5;
else
	image_alpha = 1;