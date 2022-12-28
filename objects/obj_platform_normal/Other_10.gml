/// @description Step

var _width = image_xscale * sprite_get_width(sprite_index);
//var _height = image_yscale * sprite_get_height(sprite_index);
var _width_half = _width / 2;
var _collider_y1, _collider_y2;

collider.shape_x1 = -_width_half;
collider.shape_x2 = _width_half;
_collider_y1 = collider.shape_y1;
_collider_y2 = collider.shape_y2;

if (my_path == -1)
{
	x += speed_path;

	switch (sign(x - x_previous))
	{
		case -1:
			if (collision_exists_left(x - _width_half, y + _collider_y1, y + _collider_y2, y + _collider_y2))
				speed_path = -speed_path;
			break;
		case 0:
			break;
		case 1:
			if (collision_exists_right(x + _width_half, y + _collider_y1, y + _collider_y2, y + _collider_y2))
				speed_path = -speed_path;
			break;
	}
}
else
{
	path_move(my_path, path_end_actions.reverse);
}

if (water)
	y = global.water_height - 8;