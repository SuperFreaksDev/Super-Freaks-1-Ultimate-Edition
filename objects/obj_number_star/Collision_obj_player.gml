/// @description 

var _hitbox_self = global.hitbox_collision_stored[hitbox_collision_stored_data.hitbox];
var _hitbox_num = _hitbox_self.behavior;

//show_debug_message("Star Current: " + string(star_current) + " Hitbox: " + string(_hitbox_num) + " Active: " + string(_hitbox_self.active));

if (_hitbox_self.active != hitbox_active.inactive)
{
	if (_hitbox_num == star_current)
	{
		_hitbox_self.active = hitbox_active.inactive;
		star_current++;
		if (star_current == array_length(stars))
		{
			my_method();
			sfx_play_global(sfx_cymbal_crash);
			instance_destroy();
		}
		else
		{
			sfx_play_global(sfx);
			audio_sound_pitch(sfx, pitch);
		
			pitch += 0.125;
		}
	}
	else
	{
		instance_destroy();
		sfx_play_global(sfx_record_scratch);
	}
}