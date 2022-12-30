function player_state_climb()
{
	var _collision_left = false, _collision_right = false, _collision_up = false, _collision_down = false;
	var _move_h = 0, _move_v = 0;
	var _climb_obj, _climb_boundaries = false;
	
	if (state_begin)
	{
		visible = true;
		camera.active = true;
		physics = player_physics_modifiers.normal;
		ball = false;
		speed_h = 0;
		speed_v = 0;
		lock_controls_horizontal = 0;
		lock_controls_vertical = 0;
		lock_friction = 0;
		lock_gravity = 0;
		collider_attach_clear();
		with (hitbox)
			active = hitbox_active.active;
		rubber_band_can_slingshot = false;
		physics = player_physics_modifiers.normal;
	}
	
	animate_speed = 0;
	hurt_timer_step();
	player_water_step();
		
	if (button_left == controls_action_states.hold) || (button_left == controls_action_states.press)
		_move_h -= 1;
	if (button_right == controls_action_states.hold) || (button_right == controls_action_states.press)
		_move_h += 1;
			
	if (button_up == controls_action_states.hold) || (button_up == controls_action_states.press)
		_move_v -= 1;
	if (button_down == controls_action_states.hold) || (button_down == controls_action_states.press)
		_move_v += 1;
	
	switch (_move_h)
	{
		case -1:
			x -= 3;
			face = -1;
			animate_speed = 0.125;
			break;
		case 0:
			break;
		case 1:
			x += 3;
			face = 1;
			animate_speed = 0.125;
			break;
	}
	
	switch (_move_v)
	{
		case -1:
			y -= 3;
			animate_speed = 0.125;
			break;
		case 0:
			speed_v = 0;
			break;
		case 1:
			y += 3;
			animate_speed = 0.125;
			break;
	}
		
	if (!room_transition_active_get() && button_pause == controls_action_states.press)
		game_pause(player_number);
		
	if (button_jump == controls_action_states.press)
	{
		jump_buffer = JUMP_BUFFER_MAX;
		state_next_set(player_states.normal, 5);
		sfx_play_global(sfx_jump);
		ball = true;
		speed_v = -speed_jump;
		ground_on = false;
		coyote_time = 0;
		instance_attach = undefined;
	}
	jump_buffer = max(jump_buffer - 1, 0);
	
	if (!is_undefined(instance_attach))
		_climb_boundaries = true;
		
	if (lock_friction == 0)
	{
		speed_h -= min(abs(speed_h), speed_frc) * sign(speed_h);
		speed_v -= min(abs(speed_v), speed_frc) * sign(speed_v);
	}
		
	x += speed_h;
	y += speed_v;
		
	switch sign(x - x_previous)
	{
		case -1:
			if (_climb_boundaries)
			{
				if (!place_meeting(instance_attach.bbox_left - 24, y, obj_climb_mesh))
					x = max(x, instance_attach.bbox_left + 24);
			}
			collision_right(,,,,,, false);
			collision_left();
			behavior_wall_left = global.collider_collision[collider_collision.behavior];
			break;
		case 0:
			collision_left();
			behavior_wall_left = global.collider_collision[collider_collision.behavior];
			collision_right();
			behavior_wall_right = global.collider_collision[collider_collision.behavior];
			break;
		case 1:
			if (_climb_boundaries)
			{
				if (!place_meeting(instance_attach.bbox_right + 24, y, obj_climb_mesh))
					x = min(x, instance_attach.bbox_right - 24);
			}
			collision_left(,,,,,, false);
			collision_right();
			behavior_wall_right = global.collider_collision[collider_collision.behavior];
			break;
	}
	
	switch sign(y - y_previous)
	{
		case -1:
			if (_climb_boundaries)
			{
				if (!place_meeting(x, instance_attach.bbox_top - 32, obj_climb_mesh))
					y = max(y, instance_attach.bbox_top + 32);
			}
			collision_down(,,,,,, false);
			collision_up();
			behavior_ceiling = global.collider_collision[collider_collision.behavior];
			break;
		case 0:
			collision_up();
			behavior_ceiling = global.collider_collision[collider_collision.behavior];
			collision_down();
			behavior_floor = global.collider_collision[collider_collision.behavior];
			break;
		case 1:
			if (_climb_boundaries)
			{
				if (!place_meeting(x, instance_attach.bbox_bottom + 32, obj_climb_mesh))
					y = min(y, instance_attach.bbox_bottom - 32);
			}
			collision_up(,,,,,, false);
			collision_down();
			behavior_floor = global.collider_collision[collider_collision.behavior];
			break;
	}
	
	_collision_left = collision_flag_get_left();
	_collision_up = collision_flag_get_up();
	_collision_right = collision_flag_get_right();
	_collision_down = collision_flag_get_down();
		
	if (_collision_left)
	{
		if (speed_h < 0)
			speed_h = 0;
		switch (behavior_wall_left)
		{
			case collider_behaviors_solid.hazard:
				player_hurt();
				break;
			default:
				break;
		}
	}
	if (_collision_right)
	{
		if (speed_h > 0)
			speed_h = 0;
		switch (behavior_wall_right)
		{
			case collider_behaviors_solid.hazard:
				player_hurt();
				break;
			default:
				break;
		}
	}
	if (_collision_up)
	{
		if (speed_v < 0)
			speed_v = 0;
		switch (behavior_ceiling)
		{
			case collider_behaviors_solid.hazard:
				player_hurt();
				break;
			default:
				break;
		}
	}
	if (_collision_down)
	{
		if (speed_v > 0)
			speed_v = 0;
			
		instance_attach = undefined;
		ground_on = true;
		coyote_time = 0;
		switch (behavior_floor)
		{
			case collider_behaviors_solid.hazard:
				player_hurt();
				break;
			default:
				state_next_set(player_states.normal, 5);
				break;
		}
	}
	
	player_fall();
	
	#region Sprites
		sprite_index = player_animation_get(character_index, player_animations.climb);
	#endregion
}
