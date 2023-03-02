/// @description Step
var _missile, _shoot_direction;

// Inherit the parent event
event_inherited();

switch (state)
{
	case 0: //Normal
		if (state_begin)
		{
			timer = 0;
			speed_walk = walk_speed;
			sprite_index = spr_boneblaster_walk;
			animate_speed = 0.125;
		}
		timer++;
		
		if (timer >= 96)
			state_next_set(1);
		break;
	case 1: //Shoot 1
		if (state_begin)
		{
			speed_walk = 0;
			sprite_index = spr_boneblaster_shoot_1;
			image_index = 0;
			animate_speed = 0.125;
		}
		
		if (animation_at_end())
			state_next_set(2);
		break;
	case 2: //Shoot 2
		if (state_begin)
		{
			speed_walk = 0;
			sprite_index = spr_boneblaster_shoot_2;
			image_index = 0;
			animate_speed = 0.125;
			timer = 0;
		}
		
		timer++;
		
		if (timer >= 8)
			state_next_set(3);
		break;
	case 3: //Shoot 3
		if (state_begin)
		{
			speed_walk = 0;
			sprite_index = spr_boneblaster_shoot_3;
			image_index = 0;
			animate_speed = 0.125;
			switch (face)
			{
				case -1:
					_shoot_direction = 180;
					break;
				default:
					_shoot_direction = 0;
					break;
			}
			_missile = instance_create_layer(x + (48 * face), y, "layer_instances", obj_enemy_missile,
			{
				speed: 3,
				direction: _shoot_direction,
			});
			sfx_play_global(sfx_explode_short);
		}
		
		if (animation_at_end())
			state_next_set(0);
		break;
}