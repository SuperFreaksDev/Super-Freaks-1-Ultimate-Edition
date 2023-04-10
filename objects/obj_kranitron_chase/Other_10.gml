/// @description Step

switch (state)
{
	case 0:
		if (state_begin)
		{
			fade = 2;
		}
		fade = max(fade - 0.1, -0.5);
		if (fade == 0.5)
			state_next_set(1);
		break;
	case 1:
		if (state_begin)
		{
			animate_speed = 0.125;
			fade = 0;
			with (camera_blocker)
				solid_left = false;
		}
		if (animation_at_end())
		{
			//screen_shake(0, 4);
			//sfx_play_global(sfx_crash_2);
		}
		x += 1;
		break;
}