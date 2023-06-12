/// @description Step

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
			hitbox.shape_y2 = 80;
		}
		timer = min(timer + 1, 80);
		
		if (timer == 80)
			state_next_set(boss_kranion_states.charge);
		break;
	case boss_kranion_states.charge:
		if (state_begin)
		{
			sprite_index = spr_boss_cinge_fireball;
			image_index = 0;
			animate_speed = 0.5;
			hitbox.behavior = enemy_hitbox_behaviors.heavy;
			timer = 0;
			speed_h = 0;
			hitbox.shape_x1 = -60;
			hitbox.shape_x2 = 60;
			sfx_play_global(sfx_run_1, true);
		}
		timer = min(timer + 1, 32);
		
		if (timer == 32)
		{
			hitbox.behavior = enemy_hitbox_behaviors.hazard;
			switch (face)
			{
				case -1:
					speed_h = max(speed_h - 1, -8);
					break;
				case 0:
					break;
				case 1:
					speed_h = min(speed_h + 1, 8);
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
			speed_h = -6 * sign(face);
			speed_v = -2;
			state_next_set(boss_kranion_states.stun);
			audio_stop_sound(sfx_run_1);
			screen_shake(12, 0);
		}
		break;
	case boss_kranion_states.stun:
		if (state_begin)
		{
			sprite_index = spr_boss_cinge_stun;
			image_index = 0;
			animate_speed = 0;
			hitbox.behavior = enemy_hitbox_behaviors.heavy;
			hit_counter = 0;
			timer = 0;
			hitbox.shape_x1 = -40;
			hitbox.shape_y1 = -40;
			hitbox.shape_x2 = 40;
			hitbox.shape_y2 = 80;
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
	case boss_cinge_states.death:
		if (state_begin)
		{
			sprite_index = spr_boss_cinge_death;
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
			level_beat();
		}
		break;
	default:
		break;
}