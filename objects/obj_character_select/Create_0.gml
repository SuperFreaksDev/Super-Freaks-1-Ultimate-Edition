/// @description Init

enum menu_character_select_pages
{
	difficulty_select = 0,
	character_select,
}

// Inherit the parent event
event_inherited();

button_up = array_create(player_numbers.count + 1, controls_action_states.NA);
button_down = array_create(player_numbers.count + 1, controls_action_states.NA);
button_left = array_create(player_numbers.count + 1, controls_action_states.NA);
button_right = array_create(player_numbers.count + 1, controls_action_states.NA);
button_confirm = array_create(player_numbers.count + 1, controls_action_states.NA);
button_deny = array_create(player_numbers.count + 1, controls_action_states.NA);
hold_up = array_create(player_numbers.count + 1, 0);
hold_down = array_create(player_numbers.count + 1, 0);
pause_inputs = false;
y_offset = 1;

page = menu_character_select_pages.difficulty_select;
option = 0;

depth = -9994;