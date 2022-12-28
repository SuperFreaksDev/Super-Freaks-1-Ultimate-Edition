/// @description Step

var _speed = (1 / screen_height_get()) * my_speed;
var _button, _button_start;

controls_step(0);

_button = controls_action_state_get(controls_actions.jump, 0);
_button_start = controls_action_state_get(controls_actions.start, 0);

if (!room_transition_active_get())
{
	pos += _speed;

	if (pos >= 2 || _button == controls_action_states.press || _button_start == controls_action_states.press)
	{
		music_stop();
		instance_create_layer(0, 0, "layer_instances", obj_room_transition_return);
	}
}