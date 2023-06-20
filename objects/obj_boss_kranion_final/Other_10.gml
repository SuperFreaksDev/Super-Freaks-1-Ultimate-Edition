/// @description Step

// Inherit the parent event
event_inherited();

switch (state)
{
	case boss_kranion_final_states.intro_1:
		if (state_begin)
		{
			speed_x = 2;
			speed_y = 6;
			hitbox.active = hitbox_active.inactive;
			depth = -9999;
		}
		speed_y -= 0.25;
		x += speed_x;
		y += speed_y;
		
		if (y < 368)
			state_next_set(boss_kranion_final_states.intro_2);
		break;
	case boss_kranion_final_states.intro_2:
		if (state_begin)
		{
			x = 864;
			y = 368;
			speed_x = 0;
			speed_y = 6;
			hitbox.active = hitbox_active.passive;
			depth = 3;
		}
		y = min(y + speed_y, 782);
		break;
	case boss_kranion_final_states.death_1:
		if (state_begin)
		{
			hitbox.active = hitbox_active.inactive;
			timer = 0;
			music_stop();
		}
			
		if (timer < 128)
		{
			if (timer mod 16 == 0)
				instance_create_layer(x - 80 + random(160), y - 80 + random(160), "layer_instances", obj_boss_explosion);
			timer++;
		}
		else
			state_next_set(boss_kranion_final_states.death_2);
		break;
	case boss_kranion_final_states.death_2:
		if (state_begin)
		{
			sprite_index = spr_boss_kranion_death;
			image_index = 0;
			speed_y = -2;
			hitbox.active = hitbox_active.inactive;
			music_stop();
		}
		
		speed_y = min(speed_y + 0.125, 6);
		
		x += 1;
		y += speed_y;
			
		if (timer mod 16 == 0)
			instance_create_layer(x - 80 + random(160), y - 80 + random(160), "layer_instances", obj_boss_explosion);
		timer++;
		
		if (y >= room_height + 128)
		{
			state_next_set(-1);
			level_beat();
		}
		break;
}