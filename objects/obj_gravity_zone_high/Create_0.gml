/// @description Init

var _width = image_xscale * 32;
var _height = image_yscale * 32;

// Inherit the parent event
event_inherited();

offset = 0;
offset_previous = 0;
animate_speed = 0.125;

hitbox = new comp_hitbox_AABB(,,,,, 0, 0, _width, _height);
despawn_area[0] = 0;
despawn_area[1] = 0;
despawn_area[2] = _width;
despawn_area[3] = _height;

depth = 4;