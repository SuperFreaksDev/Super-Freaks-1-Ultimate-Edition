/// @description Step

var _player;
var _attack_angle = 180;

switch (state)
{
	case 0:
		if (state_begin)
		{
			animate_speed = 0.125;
			timer = 0;
		}
		timer++;
		if (animation_at_end())
		{
			screen_shake(0, 6);
			sfx_play_global(sfx_crash_1);
		}
		if (timer >= 64)
		{
			timer = 0;
			state_next_set(1);
		}
		x -= 6;
		break;
	case 1: //Laser Warning
		if (state_begin)
		{
			timer = 0;
			multiplier = 0;
			laser_alpha = 1;
			hitbox_laser.active = hitbox_active.inactive;
			sfx_play_global(sfx_laser_huge_charge, false);
			_player = player_nearest_alive();
			if (!is_undefined(_player))
				_attack_angle = point_direction(x, y, _player.x, _player.y);
		}
		
		laser_alpha = min(laser_alpha + 0.1, 0.5);
		multiplier = min(multiplier + 0.1, 1);
		timer++;
		
		if (timer >= 96)
			state_next_set(2);
		break;
	case 2: //Laser Strike
		if (state_begin)
		{
			timer = 0;
			laser_alpha = 1;
			audio_stop_sound(sfx_laser_huge_charge);
			sfx_play_global(sfx_laser_huge_fire, false);
			hitbox_laser.active = hitbox_active.passive;
		}
		
		screen_shake(0, choose(-6, 6));
		timer++;
		
		if (timer >= 32)
			state_next_set(3);
		break;
	case 3: //Laser Disappear
		if (state_begin)
		{
			timer = 0;
			laser_alpha = 1;
			hitbox_laser.active = hitbox_active.inactive;
		}
		
		laser_alpha = max(laser_alpha - 0.05, 0);
		
		if (laser_alpha == 0)
			state_next_set(1);
		break;
}