/// @description Step

// Inherit the parent event
event_inherited();

if (is_undefined(target) || !instance_exists(target))
	target = player_nearest_alive();
	
collision_flags = 0;

switch (state)
{
	case 0: //Rise Up
		if (state_begin)
		{
			animate_speed = 0;
			hitbox.behavior = enemy_hitbox_behaviors.normal;
			sprite_index = spr_enemy_drillobee_drill;
			image_index = 0;
			timer = 0;
			speed_v = -8;
		}
		
		speed_v = min(speed_v + 0.25, 0);
		
		y += speed_v;
		
		if (!is_undefined(target) && speed_v == 0)
		{
			timer++;
			
			if (timer >= 32)
				state_next_set(1);
		}
		else
		break;
	case 1: //Chase Player
		if (state_begin)
		{
			animate_speed = 0.125;
			hitbox.behavior = enemy_hitbox_behaviors.normal;
			sprite_index = spr_enemy_drillobee_drill;
			image_index = 0;
			timer = -1;
			speed_move = 10;
			speed_h = 0;
			speed_v = 0;
		}
		
		if (!is_undefined(target))
		{
			switch (sign(target.x - x))
			{
				case -1:
					if (speed_h > 0)
						speed_h -= speed_dec;
					else
						speed_h = max(speed_h - speed_acc, -speed_move);
					break;
				case 0:
					break;
				case 1:
					if (speed_h < 0)
						speed_h += speed_dec;
					else
						speed_h = min(speed_h + speed_acc, speed_move);
					break;
			}
			
			switch (sign((target.y - 128) - y))
			{
				case -1:
					y = max(y - 8, target.y - 128);
					break;
				case 0:
					break;
				case 1:
					y = min(y + 8, target.y - 128);
					break;
			}
			
			x += speed_h;
			
			if (timer >= 64)
				state_next_set(2);
			else if (timer >= 0)
				timer++;
			else if (x == clamp(x, target.x - 32, target.x + 32))
			{
				speed_move = 6;
				timer = 0;
			}
		}
		break;
	case 2: //Drill Down
		if (state_begin)
		{
			animate_speed = 1;
			hitbox.behavior = enemy_hitbox_behaviors.hazard;
			timer = -1;
			speed_h = 0;
			speed_v = -4;
		}
		
		speed_v = min(speed_v + speed_grv, 6);
		
		//x += speed_h;
		y += speed_v;
		
		if (collision_down(,,,,, true))
			state_next_set(3);
		break;
	case 3: //Stuck
		if (state_begin)
		{
			animate_speed = 0.125;
			sprite_index = spr_enemy_drillobee_stuck;
			image_index = 0;
			hitbox.behavior = enemy_hitbox_behaviors.normal;
			timer = 0;
			speed_h = 0;
			speed_v = 0;
		}
		
		x += speed_h;
		y += speed_v;
		
		timer++;
		
		if (!collision_down(,,,, 8, true) || timer >= 72)
			state_next_set(0);
		break;
}