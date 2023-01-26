/// @description Init

var _width = image_xscale * sprite_get_width(sprite_index);
var _width_half = _width / 2;

// Inherit the parent event
event_inherited();

collider = new comp_collider_line(,, -_width_half, 0, _width_half, 0);
with (collider)
	solid_y1 = collider_solidity.semi_solid;
if (ice)
	collider.behavior[1] = collider_behaviors_solid.ice;
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

angle_previous = 0;
angle = 0;
angle_speed = 0;
return_to_start_angle = true;

//Path Movement Styles
//0 - Move Automatically
//1 - Move When Stood On
//2 - Move When Tilted