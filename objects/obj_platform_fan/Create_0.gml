/// @description Init

var _width = image_xscale * sprite_get_width(sprite_index);
var _height = image_yscale * sprite_get_height(sprite_index);
var _width_half = _width / 2;

// Inherit the parent event
event_inherited();

collider.shape_y1 = -16;
collider.shape_y2 = -2;
hitbox = new comp_hitbox_AABB(,,,,, -_width_half, -_height, _width_half, -16);
despawn_area[1] = -_height;
despawn_area[3] = 0;

timer = 0;

if (on)
	state_next_set(0);
else
	state_next_set(1);
	
depth = 6;