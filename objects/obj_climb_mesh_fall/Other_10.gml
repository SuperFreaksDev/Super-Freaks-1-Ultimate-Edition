/// @description Step

switch (state)
{
	case 0:
		break;
	case 1:
		if (state_begin)
			timer = 0;
		timer++;
		y = ystart + ((timer & 1) * 4);
		if (timer >= activate_timer)
			state_next_set(2);
		break;
	case 2:
		if (state_begin)
		{
			y = ystart;
			sfx_play_global(sfx_fall);
		}
		speed_v = min(speed_v + speed_grv, 6);
		y += speed_v;
		break;
}

// Inherit the parent event
event_inherited();

