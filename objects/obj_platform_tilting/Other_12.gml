/// @description Spawn

// Inherit the parent event
event_inherited();

if (my_path != -1)
{
	path_position = my_path_pos_start;
	x = path_get_x(my_path, path_position);
	y = path_get_y(my_path, path_position);
}

angle_previous = 0;
angle = 0;