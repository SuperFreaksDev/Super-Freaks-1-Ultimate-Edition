/// @description Step

var _i;
animation_previous = animation;

switch (state)
{
	case pause_menu_states.opening:
		if (state_begin)
		{
			animation = 0;
			animation_previous = 0;
			audio_pause_all();
			music_resume();
			sfx_play_global(sfx_ding);
			visible = true;
		}
		if (room_transition_active_get())
			exit;
		animation = min(animation + 0.1, 1);
		if (animation == 1)
			state_next_set(pause_menu_states.active);
		break;
	case pause_menu_states.closing:
		if (state_begin)
		{
			animation = 1;
			animation_previous = 1;
			visible = true;
		}
		animation = max(animation - 0.1, 0);
		if (animation == 0)
		{
			state_next_set(pause_menu_states.inactive);
			visible = false;
			game_pause_set(false);
		}
		break;
	case pause_menu_states.active:
		if (state_begin)
		{
			visible = true;
		}
		if (room_transition_active_get())
			exit;
		
		for (_i = 0; _i <= player_numbers.count; ++_i)
		{
			if (input_check_pressed("confirm", _i))
				state_next_set(pause_menu_states.closing);
		}
		break;
	default:
		if (state_begin)
		{
			animation = 0;
			visible = false;
			option = 0;
			audio_resume_all();
		}
		break;
}
