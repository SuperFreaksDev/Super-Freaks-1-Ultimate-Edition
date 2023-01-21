/// @description Step

// Inherit the parent event
event_inherited();

if (countdown == true)
{
	sprite_index = spr_fusey_danger;
	animate_speed = 0.5;
	countdown_timer--;
	if (countdown_timer <= 0)
		event_user(5);
		
	timer_seek--;
	
	if (timer_seek <= 0)
	{
		target = player_nearest_alive();
	
		if (!is_undefined(target))
		{
			switch (sign(target.x - x))
			{
				case -1:
					face = -1;
					break;
				case 0:
				case 1:
					face = 1;
					break;
			}
		}
	
		timer_seek = 24;
	}
}
else
{
	sprite_index = spr_fusey_normal;
	animate_speed = 0.25;
}