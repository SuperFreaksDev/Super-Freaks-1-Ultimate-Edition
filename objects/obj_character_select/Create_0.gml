/// @description Init

// Inherit the parent event
event_inherited();

button_up = array_create(player_numbers.count + 1, controls_action_states.NA);
button_down = array_create(player_numbers.count + 1, controls_action_states.NA);
button_confirm = array_create(player_numbers.count + 1, controls_action_states.NA);
button_deny = array_create(player_numbers.count + 1, controls_action_states.NA);
pause_inputs = false;
y_offset = 1;

depth = -9994;