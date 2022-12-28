enum player_physics_modifiers
{
	normal = 0,
	ice,
	slime,
	rail,
}

/// @function player_physics_set_normal
function player_physics_set_normal()
{
	speed_acc = 0.3;
	speed_dec = 0.25;
	speed_frc = 0.3;
	speed_frc_air = 0.96875;
	speed_grv = 0.25;

	speed_jump = 7.15;
	speed_run = 3;
	speed_fall = 6;
	
	physics = player_physics_modifiers.normal;
}

/// @function player_physics_set_ice
function player_physics_set_ice()
{
	speed_acc = 0.05;
	speed_dec = 0.05;
	speed_frc = 0.05;
	speed_frc_air = 0.96875;
	speed_grv = 0.25;

	speed_jump = 7.15;
	speed_run = 3;
	speed_fall = 6;
	
	physics = player_physics_modifiers.ice;
}

/// @function player_friction_normal
function player_friction_normal()
{
	if (ground_on)
	{
		if (lock_friction == 0)
			speed_h -= min(abs(speed_h), speed_frc) * sign(speed_h);
		if (speed_h == 0)
			skid = false;
	}
	else
	{
		if (lock_friction == 0 && platform_jump_off == false)
			speed_h *= speed_frc_air;
	}
	
	gml_pragma("forceinline");
}

///@function player_rubberband_physics
function player_rubberband_physics()
{
	var _move_x_sign = 0;
	var _average_x, _average_y, _average_x_previous, _average_y_previous;
	var _facing_average_x_sign = 0, _dist_to_average = 0;
	var _bottom_y = 0;
	
	_average_x = global.player_rubberband_average[0];
	_average_y = global.player_rubberband_average[1];
	_average_x_previous = global.player_rubberband_average_previous[0];
	_average_y_previous = global.player_rubberband_average_previous[1];
	
	if (!player_is_alive() || !rubber_band || is_undefined(_average_x))
		exit;
	
	_move_x_sign = sign(x - x_previous);
	_dist_to_average = point_distance(x, y, _average_x, _average_y);
	_facing_average_x_sign = sign(x - _average_x);
	_bottom_y = max(_average_y, _average_y + lengthdir_y(96, point_direction(_average_x, _average_y, x, y)));
	
    //Horizontal Movement
	if (x < _average_x - 96)
	{
		if (_move_x_sign == -1)
			_average_x += (x - (_average_x - 96));
		else
			speed_h += 0.5;
	}
	else if (x > _average_x + 96)
	{
		if (_move_x_sign == 1)
			_average_x += (x - (_average_x + 96));
		else
			speed_h -= 0.5;
	}
	
    //Vertical Movement
    if (y > _bottom_y)
    {
		ground_on = false;
			
	    if (button_down == controls_action_states.hold && rubber_band_can_slingshot == true)
			speed_v += 0.35 / (96 / distance_to_point(x, _average_y));
	    else
			speed_v -= 2 / (96 / distance_to_point(x, _average_y));
			
	    speed_h -= 0.5 * _facing_average_x_sign;
    }
}