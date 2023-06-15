/// @description Step

var _options_length = array_length(options[page]);
var _player_number;

bottom_text = "";

if (!room_transition_active_get() && !instance_exists(obj_character_select) && !instance_exists(obj_remapping_screen))
{
	for (_player_number = 0; _player_number < INPUT_MAX_PLAYERS; ++_player_number)
	{
		options[main_menu_pages.options_controls][_player_number][menu_option_data.unlocked] = input_player_connected(_player_number);
	}
	menu_step(global.player_lead);
	if (!option_selected)
	{
		if (input_check_pressed("up", global.player_lead))
		{
			option -= 1;
			if (option < 0)
				option = _options_length - 1;
		}
		else if (input_check_pressed("down", global.player_lead))
		{
			option = (option + 1) mod _options_length;
		}
	}
}