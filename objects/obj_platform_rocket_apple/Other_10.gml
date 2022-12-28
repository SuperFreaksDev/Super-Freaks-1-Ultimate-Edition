/// @description Step

switch (state)
{
	case 0:
		if (state_begin)
		{
			timer = -1;
			animate_speed = 0;
			image_index = 0;
		}
		
		y += lower_speed;
		
		if (y >= ystart)
		{
			y = ystart;
			if (ground_on == false)
			{
				ground_on = true;
				timer = 32;
			}
			timer = max(timer - 1, 0);
		}
		else
		{
			ground_on = false;
			timer = -1;
		}
		
		if (timer == 0)
			state_next_set(1);
		break;
	case 1:
		if (state_begin)
		{
			animate_speed = 0.5;
			target_y = y - rocket_height;
			timer = 32;
		}
		
		y = max(y - rocket_speed, target_y);
		
		if (y == target_y)
		{
			timer = max(timer - 1, 0);
			if (timer == 0)
				state_next_set(0);
		}
		break;
}