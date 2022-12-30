/// @description Init

// Inherit the parent event
event_inherited();

var _width = image_xscale * sprite_get_width(sprite_index);
var _width_half = _width / 2;

// Inherit the parent event
event_inherited();

image_yscale = 1;
target_y = 0;
animate_speed = 0;
ground_on = false;
state_next_set(0);
timer = -1;

collider = new comp_collider_AABB(,, -_width_half + 8, -32, _width_half - 8, 0);
with (collider)
	solid_y1 = collider_solidity.semi_solid;
despawn_area[0] = -_width_half;
despawn_area[1] = -40;
despawn_area[2] = _width_half;
despawn_area[3] = 0;

collider_detector_up_set(-_width_half + 8, 0, _width_half - 8, 0, -32);
collider_detector_down_set(-_width_half + 8, 0, _width_half - 8, 0, 0);