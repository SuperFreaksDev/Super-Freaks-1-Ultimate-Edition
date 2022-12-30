/// @description Init

var _width = image_xscale * sprite_get_width(sprite_index);
var _height = image_yscale * sprite_get_height(sprite_index);
var _width_half = _width / 2;
var _height_half = _height / 2;

// Inherit the parent event
event_inherited();

collider = new comp_collider_AABB(,, -_width_half, -_height_half + 8, _width_half, _height_half);
with (collider)
{
	solid_x1 = collider_solidity.solid;
	solid_y1 = collider_solidity.solid;
	solid_x2 = collider_solidity.solid;
	solid_y2 = collider_solidity.solid;
}

start_x = x;
start_y = y;
move_pos = 0;

despawn_area[0] = min(x - _width_half, destination_x - _width_half) - x;
despawn_area[1] = min(y - _height_half, destination_y - _height_half) - y;
despawn_area[2] = max(x + _width_half, destination_x + _width_half) - x;
despawn_area[3] = max(y + _height_half, destination_y + _height_half) - y;