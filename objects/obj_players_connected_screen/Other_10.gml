/// @description Step

var _player_index = 0;

animation_previous = animation;

switch (state)
{
	case pause_menu_states.opening:
		if (state_begin)
		{
			animation = 0;
			animation_previous = 0;
			global.input_source_mode_previous = input_source_mode_get();
			input_source_mode_set(INPUT_SOURCE_MODE.JOIN);
		}
		animation = min(animation + 0.1, 1);
		if (animation == 1)
			state_next_set(pause_menu_states.active);
		break;
	case pause_menu_states.closing:
		if (state_begin)
		{
			animation = 1;
			animation_previous = 1;
		}
		animation = max(animation - 0.1, 0);
		if (animation == 0)
		{
			state_next_set(pause_menu_states.inactive);
			input_source_mode_set(global.input_source_mode_previous);
			instance_destroy();
		}
		break;
	case pause_menu_states.active:
		if (state_begin)
		{
			//visible = true;
		}
		
		if (is_undefined(global.player_lead))
		{
			for (_player_index = 0; _player_index < INPUT_MAX_PLAYERS; ++_player_index)
			{
				if (input_player_connected(_player_index))
				{
					global.player_lead = _player_index;
					break;
				}
			}
		}
		else if (input_check_pressed("confirm", global.player_lead))
		{
			state_next_set(pause_menu_states.closing);
		}
		break;
	default:
		if (state_begin)
		{
			animation = 0;
			//visible = false;
			option = 0;
			//audio_resume_all();
		}
		break;
}