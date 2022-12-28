/// @description Step

event_inherited();

switch (state)
{
	case 0: //On
		if (state_begin)
		{
			animate_speed = 0.25;
			sprite_index = spr_platform_fan_on;
			hitbox.active = hitbox_active.passive;
			timer = timer_turn_off;
		}
		
		if (timer > 0)
		{
			timer = max(timer - 1, 0);
			
			if (timer == 0)
				state_next_set(1);
		}
		break;
	case 1: //Off
		if (state_begin)
		{
			animate_speed = 0;
			sprite_index = spr_platform_fan_off;
			hitbox.active = hitbox_active.inactive;
			timer = timer_turn_on;
		}
		
		if (timer > 0)
		{
			timer = max(timer - 1, 0);
			
			if (timer == 0)
				state_next_set(0);
		}
		break;
}