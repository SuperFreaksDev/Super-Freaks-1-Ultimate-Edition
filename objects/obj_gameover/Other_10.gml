/// @description Step

// Inherit the parent event
event_inherited();

switch (state)
{
	case 0:
		animate = frame / 20;
		if (frame == 20)
			state_next_set(1);
		break;
	case 1:
		frame = 0;
		if (input_check_pressed("confirm", 0))
			state_next_set(2);
		break;
	case 2:
		if (state_begin)
			instance_create(obj_room_transition_return);
		frame = 0;
		break;
}
