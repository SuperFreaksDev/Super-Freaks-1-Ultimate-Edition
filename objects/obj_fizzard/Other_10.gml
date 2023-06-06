/// @description Step

// Inherit the parent event
event_inherited();

if (is_undefined(target) || !instance_exists(target))
	target = player_nearest_alive();

switch (state)
{
	case 0: //Search
		if (state_begin)
		{
			animate_speed = 0.025;
			sprite_index = spr_fizzard_search;
			image_index = 0;
			speed_v = 0;
			blink = false;
		}
		
		if (!is_undefined(target))
		{
			if (target.x == clamp(target.x, x - 32, x + 32))
				state_next_set(1);
		}
		break;
	case 1: //Chase Player
		if (state_begin)
		{
			sprite_index = spr_fizzard_attack;
			image_index = 0;
			animate_speed = 0;
			timer = 96;
			speed_move = 10;
			speed_h = 0;
			speed_v = 0;
			blink = false;
		}
		
		if (!is_undefined(target))
		{
			x = lerp(x, target.x, 0.125);
			
			timer--;
			
			if (timer <= 0)
				state_next_set(2);
			else if (timer <= 32)
			{
				if (timer mod 2 == 0)
					blink = !blink;
			}
			if (collision_down_simple(x, x, x, y, infinity,,, true, false))
				attack_y = global.collider_collision[collider_attach_data.collision_y];
			else
				attack_y = room_height;
		}
		else
		{
			state_next_set(0);
		}
		break;
	case 2: //Attack
		if (state_begin)
		{
			animate_speed = 0.5;
			timer = 0;
			speed_v = 0;
			blink = false;
		}
		
		if (animate_speed > 0)
		{
			if (animation_at_end())
			{
				animate_speed = 0;
				image_index = 2;
				if (collision_down_simple(x, x, x, y, infinity,,, true, false))
				{
					attack_y = global.collider_collision[collider_attach_data.collision_y];
					instance_create_layer(x, attack_y, "layer_instances", obj_explosion_bomb);
				}
			}
		}
		else
		{
			timer++;
			if (timer > 16)
				state_next_set(3);
		}
		break;
	case 3: //Search 2
		if (state_begin)
		{
			animate_speed = 0.05;
			sprite_index = spr_fizzard_search;
			image_index = 0;
			speed_v = 0;
			timer = 0;
			blink = false;
		}
		
		if (!is_undefined(target))
		{
			timer++;
			if (timer >= 48)
				state_next_set(1);
		}
		else
			state_next_set(0);
		break;
}