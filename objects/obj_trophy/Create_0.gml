/// @description 

// Inherit the parent event
event_inherited();

image_index = (x + y) mod image_number;
hitbox.shape_x1 = -32;
hitbox.shape_y1 = -32;
hitbox.shape_x2 = 32;
hitbox.shape_y2 = 32;

collected = bit_get(global.trophies, trophy_id);
flashlight_radius = 48;

if (collected)
	image_alpha = 0.5;
else
	image_alpha = 1;