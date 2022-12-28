/// @description Step

// Inherit the parent event
event_inherited();

controls_step(0);

switch (state)
{
	case 0:
		animate = frame / 20;
		if (frame == 20)
			state_next_set(1);
		break;
	case 1:
		frame = 0;
		if (controls_action_state_get(controls_actions.jump, 0) == controls_action_states.press)
			state_next_set(2);
		break;
	case 2:
		if (state_begin)
			instance_create(obj_room_transition_return);
		frame = 0;
		break;
}
