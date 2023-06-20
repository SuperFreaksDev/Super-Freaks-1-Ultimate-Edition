/// @description Step

var _shockwave;

// Inherit the parent event
event_inherited();

collision_flags = 0;

switch (state)
{
	case boss_kranion_states.normal:
		if (state_begin)
		{
			sprite_index = spr_boss_kranion_stand;
			image_index = 0;
			animate_speed = 0.15;
			hitbox.behavior = enemy_hitbox_behaviors.heavy;
			hitbox.active = hitbox_active.passive;
			timer = 0;
			hitbox.shape_x1 = -40;
			hitbox.shape_y1 = -40;
			hitbox.shape_x2 = 40;
			hitbox.shape_y2 = 64;
		}
		timer = min(timer + 1, 128);
		
		if (timer == 128)
		{
			switch (choose(0, 1, 2))
			{
				case 0:
					state_next_set(boss_kranion_states.spin);
					break;
				case 1:
					state_next_set(boss_kranion_states.bounce);
					break;
				case 2:
					state_next_set(boss_kranion_states.jump);
					break;
			}
		}
		else if (timer >= 80)
			sprite_index = spr_boss_kranion_prepare;
		break;
	case boss_kranion_states.spin:
		if (state_begin)
		{
			sprite_index = spr_boss_kranion_spin;
			image_index = 0;
			animate_speed = 0.5;
			hitbox.behavior = enemy_hitbox_behaviors.hazard;
			timer = 0;
			speed_h = 0;
			hitbox.shape_x1 = -60;
			hitbox.shape_x2 = 60;
			counter = 3;
			sfx_play_global(sfx_run_1, true);
		}
		timer = min(timer + 1, 52);
		
		if (timer == 52 && speed_h == 0)
		{
			switch (face)
			{
				case -1:
					speed_h = -4.5;
					break;
				case 0:
					break;
				case 1:
					speed_h = 4.5;
					break;
			}
			animate_speed += 0.0025;
		}
		
		x += speed_h;
		
		switch (sign(x - x_previous))
		{
			case -1:
				collision_left_simple();
				break;
			case 0:
				break;
			case 1:
				collision_right_simple();
				break;
		}
		
		if (collision_flag_get_left() || collision_flag_get_right())
		{
			counter--;
			if (counter > 0)
			{
				speed_h = (abs(speed_h) + 4) * -sign(face);
				face = -face;
				screen_shake(12, 0);
			}
			else
			{
				speed_h = -6 * sign(face);
				speed_v = -2;
				state_next_set(boss_kranion_states.stun);
				audio_stop_sound(sfx_run_1);
				screen_shake(12, 0);
			}
		}
		break;
	case boss_kranion_states.bounce:
		if (state_begin)
		{
			sprite_index = spr_boss_kranion_roll;
			image_index = 0;
			animate_speed = 0.5;
			hitbox.behavior = enemy_hitbox_behaviors.hazard;
			timer = 0;
			speed_h = 0;
			speed_v = 0;
			hitbox.shape_x1 = -60;
			hitbox.shape_x2 = 60;
			counter = 3;
			sfx_play_global(sfx_run_1, true);
		}
		timer = min(timer + 1, 48);
		
		if (timer == 48 && speed_h == 0)
		{
			speed_h = 6 * face;
			speed_v = -8;
			animate_speed += 0.0025;
		}
		
		x += speed_h;
		y += speed_v;
		
		switch (sign(x - x_previous))
		{
			case -1:
				collision_left_simple();
				break;
			case 0:
				break;
			case 1:
				collision_right_simple();
				break;
		}
		switch (sign(y - y_previous))
		{
			case -1:
				collision_up_simple();
				break;
			case 0:
				break;
			case 1:
				collision_down_simple();
				break;
		}
		
		if (collision_flag_get_left() || collision_flag_get_right())
		{
			counter--;
			if (counter > 0)
			{
				speed_h = -speed_h;
				face = -face;
				screen_shake(12, 0);
			}
			else
			{
				speed_h = -3 * sign(face);
				speed_v = 0;
				state_next_set(boss_kranion_states.stun);
				audio_stop_sound(sfx_run_1);
				screen_shake(12, 0);
			}
		}
		
		if (collision_flag_get_up() || collision_flag_get_down())
		{
			speed_v = -speed_v;
			screen_shake(0, 12);
		}
		break;
	case boss_kranion_states.jump:
		if (state_begin)
		{
			sprite_index = spr_boss_kranion_stand;
			image_index = 0;
			animate_speed = 0;
			hitbox.behavior = enemy_hitbox_behaviors.heavy;
			hit_counter = 0;
			timer = 0;
			counter = 0;
			hitbox.shape_x1 = -40;
			hitbox.shape_y1 = -40;
			hitbox.shape_x2 = 40;
			hitbox.shape_y2 = 64;
			speed_h = 0;
			speed_v = choose(-4, -8);
		}
		
		speed_v = min(speed_v + speed_grv, 6);
		
		x += speed_h;
		y += speed_v;
		
		switch (sign(x - x_previous))
		{
			case -1:
				collision_left_simple();
				break;
			case 0:
				break;
			case 1:
				collision_right_simple();
				break;
		}
		
		switch (sign(y - y_previous))
		{
			case -1:
				collision_up_simple();
				break;
			case 0:
				break;
			case 1:
				collision_down_simple();
				break;
		}
		
		if (collision_flag_get_left() || collision_flag_get_right())
			speed_h = 0;
			
		if (collision_flag_get_up())
			speed_v = max(speed_v, 0);
		
		if (collision_flag_get_down())
		{
			counter++;
			if (counter >= 5)
				state_next_set(boss_kranion_states.normal);
			else
			{
				speed_v = choose(-4, -8);
				screen_shake(0, 12);
				_shockwave = instance_create_layer(x, y + 64, "layer_instances", obj_enemy_shockwave);
				_shockwave.speed_h = -6;
				_shockwave = instance_create_layer(x, y + 64, "layer_instances", obj_enemy_shockwave);
				_shockwave.speed_h = 6;
			}
		}
		break;
	case boss_kranion_states.stun:
		if (state_begin)
		{
			sprite_index = spr_boss_kranion_death;
			image_index = 0;
			animate_speed = 0;
			hitbox.behavior = enemy_hitbox_behaviors.heavy;
			hit_counter = 0;
			timer = 0;
			hitbox.shape_x1 = -40;
			hitbox.shape_y1 = -40;
			hitbox.shape_x2 = 40;
			hitbox.shape_y2 = 64;
			sfx_play_global(sfx_crash_2);
		}
		
		speed_v = min(speed_v + speed_grv, 6);
		
		x += speed_h;
		y += speed_v;
		
		switch (sign(x - x_previous))
		{
			case -1:
				collision_left_simple();
				break;
			case 0:
				break;
			case 1:
				collision_right_simple();
				break;
		}
		
		switch (sign(y - y_previous))
		{
			case -1:
				collision_up_simple();
				break;
			case 0:
				break;
			case 1:
				collision_down_simple();
				break;
		}
		
		if (collision_flag_get_left() || collision_flag_get_right())
			speed_h = 0;
			
		if (collision_flag_get_up())
			speed_v = max(speed_v, 0);
		
		if (collision_flag_get_down())
		{
			state_next_set(boss_kranion_states.normal);
			face = -face;
		}
		break;
	case boss_kranion_states.death:
		if (state_begin)
		{
			sprite_index = spr_boss_kranion_death;
			image_index = 0;
			animate_speed = 0.15;
			hitbox.behavior = enemy_hitbox_behaviors.normal;
			hitbox.active = hitbox_active.inactive;
			timer = 0;
			audio_stop_sound(sfx_run_1);
			music_stop();
		}
			
		if (timer < 128)
		{
			if (timer mod 16 == 0)
				instance_create_layer(x - 80 + random(160), y - 80 + random(160), "layer_instances", obj_boss_explosion);
			timer++;
		}
		else
		{
			state_next_set(-1);
			instance_create_layer(0, 0, "layer_instances", obj_level_win_screen_fake);
		}
		break;
	default:
		break;
}