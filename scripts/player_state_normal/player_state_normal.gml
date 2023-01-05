function player_state_normal()
{
	var _collider, _collider_speed_x, _collider_speed_y;
	var _collision_left = false, _collision_right = false, _collision_up = false, _collision_down = false;
	var _move_h = 0, _move_v = 0;
	var _speed_fall = speed_fall;
	var _speed_acc = speed_acc, _speed_dec = speed_dec, _speed_frc = speed_frc;
	
	if (state_begin)
	{
		visible = true;
		camera.active = true;
		rubber_band_can_slingshot = true;
		with (hitbox)
			active = hitbox_active.active;
	}
	
	behavior_ceiling = 0;
	behavior_floor = 0;
	behavior_wall = 0;
	behavior_wall_left = 0;
	behavior_wall_right = 0;
	
	hurt_timer_step();
	player_water_step();
	if (underwater)
		_speed_fall = max(_speed_fall - 2, 0);
	instance_attach = undefined;
		
	if (!room_transition_active_get() && button_pause == controls_action_states.press)
		game_pause(player_number);
		
	switch (physics)
	{
		case player_physics_modifiers.slime:
		case player_physics_modifiers.rail:
			break;
		default:
			if (lock_controls_horizontal == 0)
			{
				if (button_left == controls_action_states.hold) || (button_left == controls_action_states.press)
					_move_h -= 1;
				if (button_right == controls_action_states.hold) || (button_right == controls_action_states.press)
					_move_h += 1;
			}
			break;
	}
	if (lock_controls_vertical == 0)
	{
		if (button_up == controls_action_states.hold) || (button_up == controls_action_states.press)
			_move_v -= 1;
		if (button_down == controls_action_states.hold) || (button_down == controls_action_states.press)
			_move_v += 1;
	}
			
	if (button_jump == controls_action_states.press)
		jump_buffer = JUMP_BUFFER_MAX;
	jump_buffer = max(jump_buffer - 1, 0);

	if (!ground_on)
	{
		if (lock_gravity <= 0 && speed_v < speed_fall)
		{
			if (button_jump != controls_action_states.hold) && (speed_v < -1)
				speed_v += min(speed_grv * 2, _speed_fall - speed_v);
			else
				speed_v += min(speed_grv, _speed_fall - speed_v);
		}
		coyote_time = max(coyote_time - 1, 0);
		angle = 0;
		_speed_acc = speed_acc_air;
		_speed_dec = speed_dec_air;
		_speed_frc = speed_frc_air;
	}
			
	#region Horizontal Movement
		switch (_move_h)
		{
			case -1:
				if (speed_h > 0)
				{
					speed_h += -_speed_dec;
					platform_jump_off = false;
					if (ground_on)
						skid = true;
				}
				else
				{
					if (speed_h > -speed_run)
						speed_h = max(speed_h - _speed_acc, -speed_run);
						//speed_h += max(-speed_acc, -speed_run - (speed_h));
					else
						player_friction_normal();
					face = -1;
					skid = false;
				}
				break;
			case 0:
				if (physics != player_physics_modifiers.rail)
					player_friction_normal();
				break;
			case 1:
				if (speed_h < 0)
				{
					speed_h += _speed_dec;
					platform_jump_off = false;
					if (ground_on)
						skid = true;
				}
				else
				{
					if (speed_h < speed_run)
						speed_h = min(speed_h + _speed_acc, speed_run);
						//speed_h += min(speed_acc, speed_run - (speed_h));
					else
						player_friction_normal();
					face = 1;
					skid = false;
				}
				break;
		}
	#endregion
		
	if (jump_buffer > 0)
	{
		if (!ball)
			ball = true;
			
		if (!underwater && ground_on) || (underwater) || (coyote_time > 0)
		{
			sfx_play_global(sfx_jump);
			speed_v = -speed_jump;
			ground_on = false;
			coyote_time = 0;
			if (skid)
			{
				speed_h = 0;
				skid = false;
			}
			jump_buffer = 0;
			
			_collider = collider_attach[collider_attach_data.collider];
			if (!is_undefined(_collider))
			{
				_collider_speed_x = collider_attach[collider_attach_data.speed_x];
				_collider_speed_y = collider_attach[collider_attach_data.speed_y];
				speed_h += _collider_speed_x;
				speed_v = min(speed_v, _collider_speed_y);
				collider_attach_clear();
			}
		}
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
			collision_right_simple(,,,,,,, false);
			collision_left(x_start_frame - collider_detector_sides_width_get(), x - collider_detector_sides_width_get());
			behavior_wall_left = global.collider_collision[collider_collision.behavior];
			break;
		case 0:
			collision_left_simple();
			behavior_wall_left = global.collider_collision[collider_collision.behavior];
			collision_right_simple();
			behavior_wall_right = global.collider_collision[collider_collision.behavior];
			break;
		case 1:
			collision_left_simple(,,,,,,, false);
			collision_right(x_start_frame + collider_detector_sides_width_get(), x + collider_detector_sides_width_get());
			behavior_wall_right = global.collider_collision[collider_collision.behavior];
			break;
	}
		
	if (ground_on)
	{
		collision_up_simple();
		behavior_ceiling = global.collider_collision[collider_collision.behavior];
		collision_down_simple(,,,, 16,, true);
		angle_ground = global.collider_collision[collider_collision.angle];
		behavior_floor = global.collider_collision[collider_collision.behavior];
	}
	else
	{
		switch sign(y - y_previous)
		{
			case -1:
				collision_down_simple(,,,,,,, false);
				collision_up(,,, y_start_frame + collider_detector_up_y_get(), y + collider_detector_up_y_get());
				behavior_ceiling = global.collider_collision[collider_collision.behavior];
				break;
			case 0:
			case 1:
				collision_up_simple();
				behavior_ceiling = global.collider_collision[collider_collision.behavior];
				collision_down(,,, y_start_frame + collider_detector_down_y_get(), y + collider_detector_down_y_get(),, true);
				angle_ground = global.collider_collision[collider_collision.angle];
				behavior_floor = global.collider_collision[collider_collision.behavior];
				break;
		}
	}
		
	_collision_left = collision_flag_get_left();
	_collision_up = collision_flag_get_up();
	_collision_right = collision_flag_get_right();
	_collision_down = collision_flag_get_down();
		
	if (_collision_left)
	{
		crush_flags = bit_set(crush_flags, collision_flag_bits.left);
		if (speed_h < 0)
		{
			speed_h = 0;
			if (behavior_wall_left != collider_behaviors_solid.ice && !underwater && !ground_on && (((_move_h == -1 && speed_y > -3) || walljump_auto > 0)))
			{
				face = -1;
				state_next_set(player_states.wall_slide);
			}
		}
		switch (behavior_wall_left)
		{
			case collider_behaviors_solid.hazard:
				physics = player_physics_modifiers.normal;
				player_hurt();
				break;
			default:
				//physics = player_physics_modifiers.normal;
				break;
		}
	}
	if (_collision_right)
	{
		crush_flags = bit_set(crush_flags, collision_flag_bits.right);
		if (speed_h > 0)
		{
			speed_h = 0;
			if (behavior_wall_right != collider_behaviors_solid.ice && !underwater && !ground_on && (((_move_h == 1 && speed_y > -3) || walljump_auto > 0)))
			{
				face = 1;
				state_next_set(player_states.wall_slide);
			}
		}
		switch (behavior_wall_right)
		{
			case collider_behaviors_solid.hazard:
				physics = player_physics_modifiers.normal;
				player_hurt();
				break;
			default:
				//physics = player_physics_modifiers.normal;
				break;
		}
	}
	if (_collision_up)
	{
		crush_flags = bit_set(crush_flags, collision_flag_bits.up);
		if (speed_v < 0)
		{
			speed_v = 0;
			if (sign(y - yprevious) == -1)
				sfx_play_global(sfx_honk);
		}
		if (behavior_ceiling == collider_behaviors_solid.hazard)
			player_hurt();
	}
	if (_collision_down)
	{
		crush_flags = bit_set(crush_flags, collision_flag_bits.down);
		if (speed_v >= 0)
		{
			speed_v = 0;
			if (!ground_on)
			{
				ground_on = true;
				platform_jump_off = false;
				ball = false;
				walljump_auto = 0;
			}
			switch (behavior_floor)
			{
				case collider_behaviors_solid.NA:
					player_physics_set_normal();
					break;
				case collider_behaviors_solid.hazard:
					physics = player_physics_modifiers.normal;
					player_hurt();
					break;
				case collider_behaviors_solid.ice:
					player_physics_set_ice();
					break;
				case collider_behaviors_solid.sticky:
					if (physics != player_physics_modifiers.slime)
					{
						physics = player_physics_modifiers.slime;
						speed_h = 0;
						sfx_play_global(sfx_splat);
					}
					break;
				case collider_behaviors_solid.rail:
					if (physics != player_physics_modifiers.rail)
						physics = player_physics_modifiers.rail;
						
					speed_h = 5 * face;
					break;
				case collider_behaviors_solid.rail_left:
					if (physics != player_physics_modifiers.rail)
						physics = player_physics_modifiers.rail;
						
					speed_h = -5;
					break;
				case collider_behaviors_solid.rail_right:
					if (physics != player_physics_modifiers.rail)
						physics = player_physics_modifiers.rail;
						
					speed_h = 5;
					break;
			}
		}
	}
	else
	{
		if (ground_on)
		{
			ground_on = false;
			skid = false;
			coyote_time = COYOTE_TIME_MAX;
			angle_ground = 0;
			speed_h = speed_x;
			speed_v = speed_y;
		}
		collider_attach_clear();
		if (physics == player_physics_modifiers.slime)
			physics = player_physics_modifiers.normal;
	}
	
	player_fall();
		
	#region Sprites
		if (ground_on)
		{
			if (physics == player_physics_modifiers.rail)
			{
				sprite_index = player_animation_get(character_index, player_animations.rail_grind);
				image_index = 0;
				animate_speed = 0;
			}
			else
			{
				if (skid)
				{
					sprite_index = player_animation_get(character_index, player_animations.skid);
					image_index = 0;
					animate_speed = 0;
				}
				else
				{
					if (abs(speed_h) > 0)
					{
						sprite_index = player_animation_get(character_index, player_animations.walk);
						animate_speed = 0.125;
					}
					else
					{
						sprite_index = player_animation_get(character_index, player_animations.idle);
						image_index = 0;
						animate_speed = 0;
					}
				}
			}
		}
		else
		{
			if (ball)
			{
				sprite_index = player_animation_get(character_index, player_animations.jump);
				animate_speed = 0.25;
			}
			else
			{
				sprite_index = player_animation_get(character_index, player_animations.air);
				animate_speed = 0;
				
				if ((y - y_previous) < -2)
					image_index = 0;
				else if ((y - y_previous) > 2)
					image_index = 2;
				else
					image_index = 1;
			}
		}
	#endregion
}