/// @description Step

// Inherit the parent event
event_inherited();

switch (state)
{
	case 0:
		image_alpha = (frame / 10);
		if (frame == 10)
			state_next_set(1);
		break;
	case 1:
		if (state_begin)
		{
			room_destination_set(spawn_point_room_get());
			frame = 0;
		}
		image_alpha = 1 - (frame / 10);
		if (frame == 10)
			instance_destroy();
		break;
}
