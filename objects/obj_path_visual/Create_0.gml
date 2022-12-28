/// @description Init

var _i;

// Inherit the parent event
event_inherited();

x = 0;
y = 0;
depth = 10;
despawn_area[0] = path_get_point_x(my_path, 0);
despawn_area[1] = path_get_point_y(my_path, 0);
despawn_area[2] = path_get_point_x(my_path, 0);
despawn_area[3] = path_get_point_y(my_path, 0);

for (_i = 1; _i < path_get_number(my_path); ++_i)
{
	despawn_area[0] = min(despawn_area[0], path_get_point_x(my_path, _i));
	despawn_area[1] = min(despawn_area[1], path_get_point_y(my_path, _i));
	despawn_area[2] = max(despawn_area[2], path_get_point_x(my_path, _i));
	despawn_area[3] = max(despawn_area[3], path_get_point_y(my_path, _i));
}

despawn_area[0] -= 16;
despawn_area[1] -= 16;
despawn_area[2] += 16;
despawn_area[3] += 16;