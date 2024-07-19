/// @description Step

var _zone = zone_index;

// Inherit the parent event
event_inherited();

/*
enum boss_shadow_states
{
	intro = 0,
	idle,
	teleport_1,
	teleport_2,
	attack_prepare,
	attack_shurikens,
	attack_dragon,
	attack_bombs,
	death,
}
*/

switch (state)
{
	case boss_shadow_states.intro:
		if (state_begin)
		{
			hitbox.active = hitbox_active.inactive;
			timer = 64;
			sprite_index = spr_boss_shadow_idle;
			image_index = 0;
			animate_speed = 0.125;
		}
		
		timer--;
		
		if (timer < 0)
			state_next_set(boss_shadow_states.teleport_1);
		break;
	case boss_shadow_states.idle:
		if (state_begin)
		{
			hitbox.active = hitbox_active.passive;
			timer = 64;
			sprite_index = spr_boss_shadow_idle;
			image_index = 0;
			animate_speed = 0.125;
		}
		
		timer--;
		
		if (timer < 0)
			state_next_set(boss_shadow_states.attack_prepare);
		break;
	case boss_shadow_states.attack_prepare:
		if (state_begin)
		{
			hitbox.active = hitbox_active.passive;
			sprite_index = spr_boss_shadow_attack;
			image_index = 0;
			animate_speed = 0.125;
		}
		
		if (animation_at_end())
			state_next_set(boss_shadow_states.attack_dragon);
		break;
	case boss_shadow_states.attack_dragon:
		if (state_begin)
		{
			hitbox.active = hitbox_active.passive;
			animate_speed = 0;
			timer = 72;
			instance_create_layer(x, y, "layer_instances", obj_boss_shadow_dragon, 
					{
						speed: 3,
						direction: 90,
						zone_index: _zone
					});
		}
		
		timer--;
		
		if (timer < 0)
			state_next_set(boss_shadow_states.teleport_1);
		break;
	case boss_shadow_states.teleport_1:
		if (state_begin)
		{
			hitbox.active = hitbox_active.inactive;
			sprite_index = spr_boss_shadow_melt;
			image_index = 0;
			animate_speed = 0;
		}
		
		image_index = min(image_index + 0.15, 3);
		if (image_index == 3)
			state_next_set(boss_shadow_states.teleport_2);
		break;
	case boss_shadow_states.teleport_2:
		if (state_begin)
		{
			hitbox.active = hitbox_active.inactive;
			sprite_index = spr_boss_shadow_melt;
			image_index = 3;
			animate_speed = 0;
			x = locations[location_current][0];
			y = locations[location_current][1];
			location_current = (location_current + 1) mod array_length(locations);
		}
		
		image_index = max(image_index - 0.15, 0);
		if (image_index == 0)
			state_next_set(boss_shadow_states.idle);
		break;
}