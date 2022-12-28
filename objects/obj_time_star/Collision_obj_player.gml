/// @description 

var _hitbox_self = global.hitbox_collision_stored[hitbox_collision_stored_data.hitbox];

//show_debug_message("Star Current: " + string(star_current) + " Hitbox: " + string(_hitbox_num) + " Active: " + string(_hitbox_self.active));

if (_hitbox_self.active != hitbox_active.inactive)
{
	if (countdown == false)
	{
		countdown = true;
		sfx_play_global(countdown_sfx, true);
	}
	
	_hitbox_self.active = hitbox_active.inactive;
	stars_collected++;
	if (stars_collected >= array_length(stars))
	{
		my_method();
		sfx_play_global(sfx_cymbal_crash);
		audio_stop_sound(countdown_sfx);
		instance_destroy();
	}
	else
	{
		sfx_play_global(sfx);
		audio_sound_pitch(sfx, pitch);
		
		pitch += 0.125;
	}
}