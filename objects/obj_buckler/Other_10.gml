/// @description Step

var _fireball, _shoot_direction;
var _zone = zone_index;

// Inherit the parent event
event_inherited();

switch (state)
{
	case enemy_buckler_states.shield:
		if (state_begin)
		{
			sprite_index = spr_buckler_guard;
			image_index = 0;
			timer = 0;
			shoot_counter = 0;
			hitbox.radius = 32;
			hitbox.behavior = enemy_hitbox_behaviors.heavy_invulnerable;
		}
		timer++;
		if (timer >= 64)
			state_next_set(enemy_buckler_states.ready);
		break;
	case enemy_buckler_states.ready:
		if (state_begin)
		{
			sprite_index = spr_buckler_stand;
			image_index = 0;
			timer = 0;
			hitbox.radius = 24;
			hitbox.behavior = enemy_hitbox_behaviors.normal;
		}
		timer++;
		if (timer >= 24)
		{
			if (shoot_counter < 3)
				state_next_set(enemy_buckler_states.shoot_1);
			else
				state_next_set(enemy_buckler_states.shield);
		}
		break;
	case enemy_buckler_states.shoot_1:
		if (state_begin)
		{
			sprite_index = spr_buckler_shoot;
			image_index = 0;
			timer = 0;
			shoot_counter++;
		}
		timer++;
		if (timer >= 16)
		{
			switch (face)
			{
				case -1:
					_shoot_direction = 180;
					break;
				default:
					_shoot_direction = 0;
					break;
			}
			_fireball = instance_create_layer(x, y, "layer_instances", obj_enemy_fireball, 
			{
				speed: 4,
				direction: _shoot_direction,
				zone_index: _zone
			});
			state_next_set(enemy_buckler_states.shoot_2);
		}
		break;
	case enemy_buckler_states.shoot_2:
		if (state_begin)
		{
			sprite_index = spr_buckler_shoot;
			image_index = 1;
			timer = 0;
		}
		timer++;
		if (timer >= 16)
			state_next_set(enemy_buckler_states.ready);
		break;
}

