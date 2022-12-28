/// @description Spawn

// Inherit the parent event
event_inherited();

path_position = my_path_pos_start;
x = path_get_x(my_path, path_position);
y = path_get_y(my_path, path_position);

buzzsaw_angle = 0;
buzzsaw_angle_previous = 0;