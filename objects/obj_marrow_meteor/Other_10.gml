/// @description Step

// Inherit the parent event
event_inherited();

y += 8;
screen_shake(0, 3);

if (y > room_height + 112)
	instance_destroy();