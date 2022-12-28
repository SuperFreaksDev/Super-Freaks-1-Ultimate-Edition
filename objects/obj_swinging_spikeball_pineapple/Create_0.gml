/// @description Init

var _width = sprite_get_width(sprite_index);
var _width_half = _width / 2;
var _length = chain_segments * 32;

image_xscale = 1;
image_yscale = 1;

// Inherit the parent event
event_inherited();

hitbox = new comp_hitbox_circle(,,,,, _width_half);

despawn_area[0] = -_length - _width_half;
despawn_area[1] = -_length - 32;
despawn_area[2] = _length + _width_half;
despawn_area[3] = _length + 32;