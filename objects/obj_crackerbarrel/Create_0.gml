/// @description 

var _size;

// Inherit the parent event
event_inherited();

_size = abs(image_xscale);
image_yscale = _size;

collider_detector_up_set(-12 * _size, 0, 12 * _size, 0, -10 * _size);
collider_detector_down_set(-12 * _size, 0, 12 * _size, 0, 16 * _size);
collider_detector_sides_set(-8 * _size, 0, 8 * _size, 0, 16 * _size);
hitbox = new comp_hitbox_circle(,,,,, 16 * _size);

animate_speed = 0;
is_moving = false;
speed_initial = 0;
speed_move = 0;

if (bouncy)
	sprite_index = spr_crackerbarrel_bouncy;