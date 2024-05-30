/// @description Step

var _i,
	_target,
	_attack_choice;

// Inherit the parent event
event_inherited();

switch (state)
{
	case boss_marrow1_states.idle:
		if (state_begin)
		{
			timer = 72;
			sprite_index = spr_boss_marrow_prime_sit;
			animate_speed = 0;
		}
		
		timer--;
		
		if (timer < 1)
			state_next_set(boss_marrow1_states.finger_raise);
		break;
	case boss_marrow1_states.finger_raise:
		if (state_begin)
		{
			timer = 48;
			sprite_index = spr_boss_marrow_prime_sit_attack_prepare;
			animate_speed = 0.25;
		}
		
		if (sprite_index == spr_boss_marrow_prime_sit_attack_prepare && animation_at_end())
		{
			sprite_index = spr_boss_marrow_prime_sit_attack;
			image_index = 0;
			sfx_play_global(sfx_powerup);
		}
		
		timer--;
		
		if (timer < 1)
		{
			_attack_choice = choose(0, 1, 2);
			if (_attack_choice == 1 && instance_exists(obj_marrow_lightning))
				_attack_choice = choose(0, 2);
				
			switch (_attack_choice)
			{
				case 0:
					for (_i = 0; _i < 8; ++_i)
					{
						instance_create_layer(x - 72, y - 72, "layer_instances", obj_marrow_fireball, 
						{
							speed: 3,
							direction: 45 * _i,
						});
					}
			
					sfx_play_global(sfx_explode);
					screen_shake(0, 6);
					break;
				case 1:
					instance_create_layer(random_range(600, 1000), 840, "layer_instances", obj_marrow_lightning);
					break;
				case 2:
					instance_create_layer(x, y - 424, "layer_instances", obj_marrow_meteor);
					break;
			}
			state_next_set(boss_marrow1_states.idle);
		}
		break;
	default:
		break;
}