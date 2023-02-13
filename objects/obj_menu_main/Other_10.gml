/// @description Step

var _options_length = array_length(options[page]);
var _player_number;

bottom_text = "";
key_stored_set();
mouse_button_stored_set();
array_copy(global.gamepad_keylast, 0, global.gamepad_key, 0, array_length(global.gamepad_key));
for (_player_number = 0; _player_number <= player_numbers.count; ++_player_number)
{
	gamepad_key_set(_player_number);
}

if (!room_transition_active_get() && !instance_exists(obj_character_select))
{
	menu_step();
	if (!option_selected)
	{
		if (input_check_pressed("up", 0))
		{
			option -= 1;
			if (option < 0)
				option = _options_length - 1;
		}
		else if (input_check_pressed("down", 0))
		{
			option = (option + 1) mod _options_length;
		}
	}
}