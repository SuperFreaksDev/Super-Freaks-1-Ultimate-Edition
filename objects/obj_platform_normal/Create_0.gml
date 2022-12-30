/// @description Init

var _width = image_xscale * sprite_get_width(sprite_index);
var _height = image_yscale * sprite_get_height(sprite_index);
var _width_half = _width / 2;
var _height_half = _height / 2;

// Inherit the parent event
event_inherited();

collider = new comp_collider_AABB(,, -_width_half, -_height_half + 8, _width_half, _height_half);
with (collider)
	solid_y1 = collider_solidity.semi_solid;
despawn_area[0] = -_width_half;
despawn_area[1] = -_height_half;
despawn_area[2] = _width_half;
despawn_area[3] = _height_half;
speed_path = speed_move;
if (my_path != -1)
{
	my_path_pos_start = path_closest_point(my_path, x, y);
	path_position = my_path_pos_start;
	x = path_get_x(my_path, path_position);
	y = path_get_y(my_path, path_position);
}