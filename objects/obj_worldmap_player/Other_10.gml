/// @description Step

var _move_h = 0, _move_v = 0;

controls_step(0);

button_left = controls_action_state_get(controls_actions.left, 0);
button_right = controls_action_state_get(controls_actions.right, 0);
button_up = controls_action_state_get(controls_actions.up, 0);
button_down = controls_action_state_get(controls_actions.down, 0);
button_pause = controls_action_state_get(controls_actions.start, 0);
button_jump = controls_action_state_get(controls_actions.jump, 0);
button_deny = controls_action_state_get(controls_actions.attack, 0);

obj_worldmap_manager.level_id = -1;

switch (state)
{
	case 0:
		break;
	case 1:
		if (!room_transition_active_get() && !instance_exists(obj_character_select))
		{
			if (button_left == controls_action_states.hold) || (button_left == controls_action_states.press)
				_move_h -= 1;
			if (button_right == controls_action_states.hold) || (button_right == controls_action_states.press)
				_move_h += 1;
			
			if (button_up == controls_action_states.hold) || (button_up == controls_action_states.press)
				_move_v -= 1;
			if (button_down == controls_action_states.hold) || (button_down == controls_action_states.press)
				_move_v += 1;
		}
			
		x += _move_h * 4;
		y += _move_v * 4;
		x = clamp(x, 0, room_width);
		y = clamp(y, 0, room_height);
		break;
}
