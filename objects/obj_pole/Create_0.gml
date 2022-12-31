/// @description Init

var _height = image_yscale * sprite_get_height(sprite_index);

// Inherit the parent event
event_inherited();

image_xscale = 1;
depth = 9;
hitbox = new comp_hitbox_AABB(,,,,, -8, 0, 8, _height);
animate_speed = 0;
//animate_speed = rotate_speed / 4;

offset = 0;
offset_previous = 0;

despawn_area[0] = -8;
despawn_area[1] = 0;
despawn_area[2] = 8;
despawn_area[3] = _height;