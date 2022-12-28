/// @description Init

// Inherit the parent event
event_inherited();

speed_grv = 0.25;
timer = 0;
path_move_speed = path_speed_start;
my_path_pos_start = path_closest_point(my_path, x, y);
path_position = my_path_pos_start;
x = path_get_x(my_path, path_position);
y = path_get_y(my_path, path_position);
if (already_moving)
	state_next_set(2);
else
	state_next_set(0);

///Path End Actions
// 0 - Stop
// 1 - Reverse
// 2 - Fall