/// @description Init

var _width = image_xscale * sprite_get_width(sprite_index);
var _width_half = _width / 2;
var _length = chain_segments * 32;

image_yscale = 1;

// Inherit the parent event
event_inherited();

collider = new comp_collider_AABB(,, -_width_half, 0, _width_half, 32);
with (collider)
	collision_flag_set_up();

despawn_area[0] = -_length - _width_half;
despawn_area[1] = -_length - 32;
despawn_area[2] = _length + _width_half;
despawn_area[3] = _length + 32;