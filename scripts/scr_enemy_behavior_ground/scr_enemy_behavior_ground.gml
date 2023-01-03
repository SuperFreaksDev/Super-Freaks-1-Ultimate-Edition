/// @function enemy_behavior_ground
/// @param _speed_acc = 1
/// @param _speed_dec = 1
/// @param _speed_run = 1
/// @param _speed_grv = 0.25
/// @param _speed_fall = 6
/// @param _ledge_reverse = true
function enemy_behavior_ground(_speed_acc = 1, _speed_dec = 1, _speed_run = 1, _speed_grv = 0.25, _speed_fall = 6, _ledge_reverse = true)
{
	if (!ground_on)
	{
		if (speed_v < _speed_fall)
			speed_v += min(_speed_grv, _speed_fall - speed_v);
			
		angle = 0;
	}
			
	switch (face)
	{
		case -1:
			if (speed_h > 0)
				speed_h += -_speed_dec;
			else
			{
				//speed_h += max(-_speed_acc, -_speed_run - (speed_h));
				speed_h = max(speed_h - _speed_acc, -_speed_run);
				face = -1;
			}
			break;
		case 0:
			break;
		case 1:
			if (speed_h < 0)
				speed_h += _speed_dec;
			else
			{
				//speed_h += min(_speed_acc, _speed_run - (speed_h));
				speed_h = min(speed_h + _speed_acc, _speed_run);
				face = 1;
			}
			break;
	}

	if (ground_on)
	{
		speed_x = lengthdir_x(speed_h, angle_ground);
		speed_y = lengthdir_y(speed_h, angle_ground);
	}
	else
	{
		speed_x = speed_h;
		speed_y = speed_v;
	}
		
	x += speed_x;
	y += speed_y;
		
	switch sign(x - x_previous)
	{
		case -1:
			collision_right(,,,,,, false);
			collision_left();
			break;
		case 0:
			collision_left();
			collision_right();
			break;
		case 1:
			collision_left(,,,,,, false);
			collision_right();
			break;
	}
		
	if (ground_on)
	{
		collision_up_simple();
		if (!collision_down_simple(,,,, 16,, true) && _ledge_reverse)
		{
			if (collision_down_simple(x + collider_detector_down[collider_detector_vertical_data.flat_x1] - (_speed_run * face), x + collider_detector_down[collider_detector_vertical_data.flat_x2] - (_speed_run * face), x - (_speed_run * face),, 16,, true))
			{
				x = x - (_speed_run * face);
				face = -face;
			}
		}
		angle_ground = global.collider_collision[collider_collision.angle];
	}
	else
	{
		switch sign(y - y_previous)
		{
			case -1:
				collision_down(,,, y + collider_detector_down_y_get(), y_start_frame + collider_detector_down_y_get(),,, false);
				collision_up_simple();
				break;
			case 0:
			case 1:
				collision_up_simple();
				collision_down(,,, y_start_frame + collider_detector_down_y_get(), y + collider_detector_down_y_get(),, true);
				angle_ground = global.collider_collision[collider_collision.angle];
				break;
		}
	}
}

/// @function enemy_collisions_ground
/// @param _ledge_reverse = true
function enemy_collisions_ground(_ledge_reverse = true)
{
	switch sign(x - x_previous)
	{
		case -1:
			collision_right(,,,,,, false);
			collision_left();
			break;
		case 0:
			collision_left();
			collision_right();
			break;
		case 1:
			collision_left(,,,,,, false);
			collision_right();
			break;
	}
		
	if (ground_on)
	{
		collision_up_simple();
		if (!collision_down_simple(,,,, 16,, true) && _ledge_reverse)
		{
			if (collision_down_simple(x + collider_detector_down[collider_detector_vertical_data.flat_x1] - (_speed_run * face), x + collider_detector_down[collider_detector_vertical_data.flat_x2] - (_speed_run * face), x - (_speed_run * face),, 16,, true))
			{
				x = x - (_speed_run * face);
				face = -face;
			}
		}
		angle_ground = global.collider_collision[collider_collision.angle];
	}
	else
	{
		switch sign(y - y_previous)
		{
			case -1:
				collision_down(,,, y + collider_detector_down_y_get(), y_start_frame + collider_detector_down_y_get(),,, false);
				collision_up_simple();
				break;
			case 0:
			case 1:
				collision_up_simple();
				collision_down(,,, y_start_frame + collider_detector_down_y_get(), y + collider_detector_down_y_get(),, true);
				angle_ground = global.collider_collision[collider_collision.angle];
				break;
		}
	}
}