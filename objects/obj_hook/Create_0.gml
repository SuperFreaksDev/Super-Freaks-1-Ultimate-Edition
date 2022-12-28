/// @description Init

// Inherit the parent event
event_inherited();

hitbox = new comp_hitbox_AABB(,,,,, -20, 48, 20, 48);

my_path_pos_start = path_closest_point(my_path, x, y);
path_position = my_path_pos_start;
x = path_get_x(my_path, path_position);
y = path_get_y(my_path, path_position);
speed_path = my_speed;