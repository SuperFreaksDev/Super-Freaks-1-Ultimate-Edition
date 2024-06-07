/// @description Step

var _fast_forward = fast_forward_level_get() + global.frame_machine_level.multiplier,
	_speed = 4;

// Inherit the parent event
event_inherited();

if (global.difficulty > difficulty_levels.easy)
	_speed += 2;
	
y += (_speed);
	
screen_shake(0, 3);

rectangle_fade = min(rectangle_fade + 0.05, 0.5);

if (y > room_height + 112)
	instance_destroy();