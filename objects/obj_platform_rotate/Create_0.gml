/// @description Init

var _width = image_xscale * sprite_get_width(sprite_index);
var _height = image_yscale * sprite_get_height(sprite_index);
var _width_half = _width / 2;
var _height_half = _height / 2;

enum platform_rotate_collider_info
{
	line = 0,
	offset_x,
	offset_y,
	width,
	angle,
}

// Inherit the parent event
event_inherited();

angle = 0;
angle_previous = 0;

colliders = [];

/// @function collider_create
/// @param _id
/// @param _offset_x
/// @param _offset_y
/// @param _width
/// @param _angle
collider_create = function(_id, _offset_x, _offset_y, _width, _angle)
{
	colliders[_id][platform_rotate_collider_info.offset_x] = _offset_x;
	colliders[_id][platform_rotate_collider_info.offset_y] = _offset_y;
	colliders[_id][platform_rotate_collider_info.width] = _width;
	colliders[_id][platform_rotate_collider_info.angle] = _angle;
	colliders[_id][platform_rotate_collider_info.line] = new comp_collider_line(_offset_x, _offset_y, 0, 0, lengthdir_x(_width, _angle), lengthdir_y(_width, _angle));
}


/// @function collider_step
/// @param _id
collider_step = function(_id)
{
	var _angle_new = (colliders[_id][platform_rotate_collider_info.angle] + angle) mod 360;
	var _width = colliders[_id][platform_rotate_collider_info.width];
	var _offset_x = colliders[_id][platform_rotate_collider_info.offset_x];
	var _offset_y = colliders[_id][platform_rotate_collider_info.offset_y];
	var _distance = point_distance(0, 0, _offset_x, _offset_y);
	var _direction = (point_direction(0, 0, _offset_x, _offset_y) + angle) mod 360;
	var _offset_x_new = lengthdir_x(_distance, _direction);
	var _offset_y_new = lengthdir_y(_distance, _direction);
	var _line = colliders[_id][platform_rotate_collider_info.line];
	
	_line.x_offset = _offset_x_new;
	_line.y_offset = _offset_y_new;
	_line.shape_x2 = lengthdir_x(_width, _angle_new);
	_line.shape_y2 = lengthdir_y(_width, _angle_new);
	
	if (_angle_new == clamp(_angle_new, 0, 180))
	{
		with (_line)
		{
			collision_flag_set_left();
			collision_flag_clear_right();
		}
	}
	else
	{
		with (_line)
		{
			collision_flag_clear_left();
			collision_flag_set_right();
		}
	}
	
	if (_angle_new == clamp(_angle_new, 90, 270))
	{
		with (_line)
		{
			collision_flag_set_down();
			collision_flag_clear_up();
		}
	}
	else
	{
		with (_line)
		{
			collision_flag_clear_down();
			collision_flag_set_up();
		}
	}
	
	//if (_angle_new <= 67.5 || _angle_new >= 292.5)
	//{
	//	with (_line)
	//		collision_flags_set_all(false, true, false, false);
	//}
	//else if (_angle_new < 112.5)
	//{
	//	with (_line)
	//		collision_flags_set_all(true, true, false, false);
	//}
	//else if (_angle_new < 202.5)
	//{
	//	with (_line)
	//		collision_flags_set_all(false, false, false, true);
	//}
	//else
	//{
	//	with (_line)
	//		collision_flags_set_all(false, true, true, false);
	//}
}

collider_create(0, -_width_half + 8, -_height_half, _width - 16, 0);
collider_create(1, _width_half - 8, -_height_half, 11, 315);
collider_create(2, _width_half, -_height_half + 8, _height - 16, 270);
collider_create(3, _width_half, _height_half - 8, 11, 225);
collider_create(4, _width_half - 8, _height_half, _width - 16, 180);
collider_create(5, -_width_half + 8, _height_half, 11, 135);
collider_create(6, -_width_half, _height_half - 8, _height - 16, 90);
collider_create(7, -_width_half, -_height_half + 8, 11, 45);