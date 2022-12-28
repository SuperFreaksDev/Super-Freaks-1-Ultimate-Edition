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
			global.checkpoint_death_count++;
			global.checkpoint[spawn_point_data.go_to_checkpoint] = true;
			room_destination_set(checkpoint_room_get());
			with (obj_player)
				invincible = false;
			frame = 0;
		}
		image_alpha = 1 - (frame / 10);
		if (frame == 10)
			instance_destroy();
		break;
}
