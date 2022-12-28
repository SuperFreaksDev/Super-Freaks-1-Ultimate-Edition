/// @description 

var _i;
var _path_length = path_get_length(my_path);
var _marker_x, _marker_y;
var _path_increments = (1 / _path_length) * 16;

for (_i = 0; _i <= 1; _i += _path_increments)
{
    _marker_x = path_get_x(my_path, _i);
    _marker_y = path_get_y(my_path, _i);
	
	draw_sprite(spr_path_orb, 0, _marker_x, _marker_y);
}

if (!path_get_closed(my_path))
{
	_marker_x = path_get_x(my_path, 0);
	_marker_y = path_get_y(my_path, 0);
	draw_sprite(spr_path_orb, 1, _marker_x, _marker_y);
	_marker_x = path_get_x(my_path, 1);
	_marker_y = path_get_y(my_path, 1);
	draw_sprite(spr_path_orb, 1, _marker_x, _marker_y);
}