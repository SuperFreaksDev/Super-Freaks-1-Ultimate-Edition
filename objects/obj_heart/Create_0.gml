/// @description 

// Inherit the parent event
event_inherited();

image_index = (x + y) mod image_number;
despawn_area[0] = -16;
despawn_area[1] = -16;
despawn_area[2] = 16;
despawn_area[3] = 16;

if (hearts_maximum_get() == 0)
	instance_destroy();