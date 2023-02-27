/// @description Init

var _width = abs(image_xscale * sprite_get_width(sprite_index));
var _width_half = _width / 2;

// Inherit the parent event
event_inherited();

collider = new comp_collider_AABB(,, -_width_half, -16, _width_half, -16);
with (collider)
	solid_y1 = collider_solidity.solid;
collider_body = new comp_collider_AABB(,, -_width_half, -16, _width_half, 16);
with (collider_body)
{
	solid_x1 = collider_solidity.solid;
	solid_x2 = collider_solidity.solid;
	solid_y2 = collider_solidity.solid;
}
despawn_area[0] = -_width_half;
despawn_area[1] = -32;
despawn_area[2] = _width_half;
despawn_area[3] = 32;
speed_path = speed_move;
if (my_path != -1)
{
	my_path_pos_start = path_closest_point(my_path, x, y);
	path_position = my_path_pos_start;
	x = path_get_x(my_path, path_position);
	y = path_get_y(my_path, path_position);
}

animate_speed = 0.25;
offset = 0;
offset_previous = 0;