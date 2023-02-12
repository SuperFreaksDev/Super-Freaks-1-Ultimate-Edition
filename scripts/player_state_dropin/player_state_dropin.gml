function player_state_dropin()
{
	if (state_begin)
	{
		visible = false;
		camera.active = false;
		physics = player_physics_modifiers.normal;
		ball = false;
		hitbox.active = hitbox_active.inactive;
		rubber_band_can_slingshot = false;
		sfx_play_global(sfx_ding);
	}
	
	//if (button_left == controls_action_states.press)
	if (input_check_pressed("left", player_number))
	{
		global.player_list[player_number][player_data.character_index]++;
					
		if (global.player_list[player_number][player_data.character_index] >= character_indexes.count)
			global.player_list[player_number][player_data.character_index] = 0;
					
		while (global.characters_unlocked[global.player_list[player_number][player_data.character_index]] == false)
		{
			global.player_list[player_number][player_data.character_index]++;
					
			if (global.player_list[player_number][player_data.character_index] >= character_indexes.count)
				global.player_list[player_number][player_data.character_index] = 0;
		}
		
		character_index = global.player_list[player_number][player_data.character_index];
	}
	//else if (button_right == controls_action_states.press)
	else if (input_check_pressed("right", player_number))
	{
		global.player_list[player_number][player_data.character_index]--;
					
		if (global.player_list[player_number][player_data.character_index] < 0)
			global.player_list[player_number][player_data.character_index] = character_indexes.count - 1;
						
		while (global.characters_unlocked[global.player_list[player_number][player_data.character_index]] == false)
		{
			global.player_list[player_number][player_data.character_index]--;
			if (global.player_list[player_number][player_data.character_index] < 0)
				global.player_list[player_number][player_data.character_index] = character_indexes.count - 1;
		}
		
		character_index = global.player_list[player_number][player_data.character_index];
	}
	//else if (button_jump == controls_action_states.press)
	else if (input_check_pressed("jump", player_number))
	{
		state_next_set(player_states.bubble, 999999999);
		global.player_list[player_number][player_data.active] = true;
		global.player_list[player_number][player_data.character_index] = character_index;
		x = view_x1_get();
		y = view_y1_get();
		x_start_frame = x;
		y_start_frame = y;
	}
}
