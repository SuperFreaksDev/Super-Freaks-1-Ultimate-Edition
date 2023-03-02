/// @description 

var _width = abs(image_xscale * sprite_get_width(sprite_index));
var _height = abs(image_yscale * sprite_get_height(sprite_index));
var _width_half = _width / 2;
var _height_half = _height / 2;

// Inherit the parent event
event_inherited();

despawn_area[0] = -_width_half;
despawn_area[1] = -_height;
despawn_area[2] = _width_half;
despawn_area[3] = 0;

timer = timer_delay;