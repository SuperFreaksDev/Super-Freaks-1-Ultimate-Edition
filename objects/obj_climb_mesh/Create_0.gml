var _width = image_xscale * sprite_get_width(sprite_index);
var _height = image_yscale * sprite_get_height(sprite_index);
var _width_half = _width / 2;
var _height_half = _height / 2;

// Inherit the parent event
event_inherited();

hitbox = new comp_hitbox_AABB(,,,,, -_width_half, -_height_half, _width_half, _height_half);
despawn_area[0] = -_width_half;
despawn_area[1] = -_height_half;
despawn_area[2] = _width_half;
despawn_area[3] = _height_half;
depth = 10;