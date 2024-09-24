/// @function player_camera_extend_x
/// @param _multiplier = 2.5
function player_camera_extend_x(_multiplier = 1.5)
{
	camera.x += ((x - x_start_frame) * _multiplier);
	camera.x = clamp(camera.x, x - 64, x + 64);
	
	gml_pragma("forceinline");
}

/// @function player_camera_extend_y
/// @param _multiplier = 2.5
function player_camera_extend_y(_multiplier = 1.5)
{
	camera.y += ((y - y_start_frame) * _multiplier);
	camera.y = clamp(camera.y, y - 48, y + 32);
	
	gml_pragma("forceinline");
}

/// @function player_view_boundaries
function player_view_boundaries()
{
	var _view_x1 = camera_get_view_x(view_camera[view_current]);
	var _view_x2 = _view_x1 + camera_get_view_width(view_camera[view_current]);
	var _width = collider_detector_sides[collider_detector_sides_data.width] * 0.5;
	
	if (x - _width <= _view_x1)
	{
		x = _view_x1 + _width;
		crush_flags = bit_set(crush_flags, collision_flag_bits.left);
		if (speed_h > 0)
		{
			if (physics == player_physics_modifiers.rail)
				speed_h = max(speed_h, -3);
			else
				speed_h = 0;
		}
	}
	
	if (x + _width >= _view_x2)
	{
		crush_flags = bit_set(crush_flags, collision_flag_bits.right);
		x = _view_x2 - _width;
		if (speed_h > 0)
		{
			if (physics == player_physics_modifiers.rail)
				speed_h = min(speed_h, 3);
			else
				speed_h = 0;
		}
	}
	
	gml_pragma("forceinline");
}