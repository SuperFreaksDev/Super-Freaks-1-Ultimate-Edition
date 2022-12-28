/// @description Init

// Inherit the parent event
event_inherited();

hitbox = new comp_hitbox_circle(,,, enemy_hitbox_behaviors.hazard,, 32 * abs(image_xscale));

my_path_pos_start = path_closest_point(my_path, x, y);
path_position = my_path_pos_start;
x = path_get_x(my_path, path_position);
y = path_get_y(my_path, path_position);
speed_path = my_speed;

buzzsaw_angle = 0;
buzzsaw_angle_previous = 0;

animate_speed = 0.125;