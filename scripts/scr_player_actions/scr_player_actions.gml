/// @function player_pause_game
function player_pause_game()
{
	//if (!room_transition_active_get() && button_pause == controls_action_states.press)
	if (!room_transition_active_get() && input_check_pressed("start", player_number))
		game_pause(player_number);
		
	gml_pragma("forceinline");
}

/// @function player_drop_out
function player_drop_out()
{
	//if (player_number > 0 && button_drop_out == controls_action_states.press)
	if (player_number > 0 && input_check_pressed("drop_out", player_number))
	{
		state_next_set(player_states.inactive, 999999999999);
		global.player_list[player_number][player_data.active] = false;
	}
	
	gml_pragma("forceinline");
}

/// @function player_drop_out_force
/// @param _player_number = 0
function player_drop_out_force(_player_number = 0)
{
	var _player_instance;
	
	if (_player_number == 0)
		exit;
		
	_player_instance = global.player_list[_player_number][player_data.instance];
	
	if (global.player_list[_player_number][player_data.active] == true)
	{
		with (_player_instance)
		{
			state_next_set(player_states.inactive, 999999999999);
			state_machine_step();
			EVENT_STEP;
		}
		global.player_list[_player_number][player_data.active] = false;
	}
	
	gml_pragma("forceinline");
}

/// @function player_enter_bubble
function player_enter_bubble()
{
	//if (players_exist() && button_bubble == controls_action_states.press)
	if (players_exist() && input_check_pressed("bubble", player_number))
		state_next_set(player_states.bubble, 999999999999);
	
	gml_pragma("forceinline");
}

/// @function player_rubberband_activate
function player_rubberband_activate()
{
	//if (button_rubberband == controls_action_states.press)
	if (input_check_pressed("rubberband", player_number))
	{
		sfx_play_global(sfx_elastiband);
		rubber_band = !rubber_band;
	}
	if (input_check_pressed("rubberband_color", player_number))
	{
		sfx_play_global(sfx_elastiband);
		rubber_band_color = !rubber_band_color;
	}
	
	gml_pragma("forceinline");
}

/// @function player_hurt
function player_hurt()
{
	if (invincible == false && hurt_timer == 0 && state != player_states.hurt)
	{
		hurt_timer_set(120);
		if (global.hearts > 0)
		{
			global.hearts--;
			if (underwater)
			{
				speed_h = 1 * -face;
				speed_v = -4;
				sfx_play_global(sfx_hurt);
			}
			else
			{
				if (state != player_states.hang)
					state_next_set(player_states.hurt);
				else
					sfx_play_global(sfx_hurt);
			}
		}
		else
			state_next_set(player_states.death, 999);
	}
	
	gml_pragma("forceinline");
}

/// @function player_crush
function player_crush()
{
	var _crush_left = bit_get(crush_flags, collision_flag_bits.left);
	var _crush_up = bit_get(crush_flags, collision_flag_bits.up);
	var _crush_right = bit_get(crush_flags, collision_flag_bits.right);
	var _crush_down = bit_get(crush_flags, collision_flag_bits.down);
	
	if (_crush_left && _crush_right) || (_crush_up && _crush_down)
	{
		state_next_set(player_states.death, 9999999);
		sfx_play_global(sfx_hurt);
		global.hearts = max(global.hearts - 1, 0);
	}
}

/// @function player_fall
function player_fall()
{
	if (y > view_y2_get() + 64)
		state_next_set(player_states.death_fall, 99999);
		
	gml_pragma("forceinline");
}

/// @function player_water_step
function player_water_step()
{
	if (global.water_active == false)
		exit;
		
	switch (global.water_type)
	{
		case water_types.water:
			if (underwater)
			{
				water_meter = max(water_meter - 0.18, 0);
		
				x += global.water_current;
				if (global.water_electric_timer > 0 || water_meter == 0)
					player_hurt();
			}
			break;
		case water_types.lava:
		case water_types.lemonade:
			if (y + collider_detector_down[collider_detector_vertical_data.y] > global.water_height)
			{
				speed_v = -10;
				if (!ground_on)
					speed_h = 0;
				if (hurt_timer == 0)
				{
					if (global.hearts > 0)
					{
						global.hearts = max(global.hearts - 1, 0);
						sfx_play_global(sfx_hurt);
						hurt_timer_set(120);
						state_next_set(player_states.normal, 999);
					}
					else
						state_next_set(player_states.death, 999);
				}
				else
					state_next_set(player_states.normal, 999);
			}
			break;
	}
}