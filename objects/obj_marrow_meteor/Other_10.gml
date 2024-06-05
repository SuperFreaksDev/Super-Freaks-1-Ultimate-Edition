/// @description Step

// Inherit the parent event
event_inherited();

y += 4;
if (global.difficulty > difficulty_levels.easy)
	y += 2;
	
screen_shake(0, 3);

rectangle_fade = min(rectangle_fade + 0.05, 0.5);

if (y > room_height + 112)
	instance_destroy();