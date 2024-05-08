/// @description Step

var _angle, _collision_left, _collision_up, _collision_right, _collision_down, _my_x, _my_y;
var _speed, _target;

// Inherit the parent event
event_inherited();

collision_flags = 0;

// Inherit the parent event
event_inherited();

switch (state)
{
	case BOSS_APEX_STATES.INTRO:
		if (state_begin)
		{
			teleport_timer = 1;
			animate_speed = 0.25;
		}
		
		teleport_timer = max(teleport_timer - 0.00275, 0);
		
		if (teleport_timer == 0)
		{
			with (obj_apex_intro)
				instance_destroy();
			state_next_set(BOSS_APEX_STATES.IDLE);
		}
		break;
	case BOSS_APEX_STATES.IDLE:
		if (state_begin)
		{
			_target = player_nearest_alive();
			if (!is_undefined(_target))
				_angle = point_direction(x, y, _target.x, _target.y);
			else
				_angle = random(360);
			speed_x = lengthdir_x(1, -_angle);
			speed_y = lengthdir_y(1, -_angle);
			timer = 0;
			hitbox.active = hitbox_active.passive;
		}
		
		x += speed_x;
		y += speed_y;

		switch sign(x - x_previous)
		{
			case -1:
				collision_left_simple();
				break;
			case 0:
			case 1:
				collision_right_simple();
				break;
		}

		switch sign(y - y_previous)
		{
			case -1:
				collision_up_simple();
				break;
			case 0:
			case 1:
				collision_down_simple();
				break;
		}
		
		_collision_left = collision_flag_get_left();
		_collision_up = collision_flag_get_up();
		_collision_right = collision_flag_get_right();
		_collision_down = collision_flag_get_down();
		
		if (_collision_left)
		{
			if (speed_x < 0)
				speed_x = -speed_x;
		}
		if (_collision_right)
		{
			if (speed_x > 0)
				speed_x = -speed_x;
		}
		if (_collision_up)
		{
			if (speed_y < 0)
				speed_y = -speed_y;
		}
		if (_collision_down)
		{
			if (speed_y > 0)
				speed_y = -speed_y;
		}
		
		timer++;
		
		//if (timer >= 128)
		//	state_next_set(boss_kranion_final_states.spikes_expand);
		break;
	default:
		break;
}