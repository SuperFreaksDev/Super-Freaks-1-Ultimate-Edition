/// @description Step

var _angle;
var _length;

// Inherit the parent event
event_inherited();

switch (state)
{
	case boss_spike_states.intro:
		if (state_begin)
		{
			angle = 270;
			swing_speed = 0;
			timer = 48;
			image_index = 2;
			chain_multiplier = 0;
		}
		
		timer--;
		
		if (timer < 0)
			state_next_set(boss_spike_states.normal);
		break;
	case boss_spike_states.normal:
		if (state_begin)
		{
			timer = 112;
			image_index = 0;
			hitbox.behavior = enemy_hitbox_behaviors.heavy_360;
		}
		//swing_speed = min(swing_speed + 0.1, 1.5);
		spike_size = max(spike_size - 0.1, 0);
		
		timer--;
		
		if (timer < 0)
			state_next_set(boss_spike_states.prepare);
		break;
	case boss_spike_states.prepare:
		if (state_begin)
		{
			timer = 48;
			image_index = 1;
		}
		//swing_speed = min(swing_speed + 0.1, 1.5);
		
		timer--;
		
		if (timer < 0)
			state_next_set(boss_spike_states.spike);
		break;
	case boss_spike_states.spike:
		if (state_begin)
		{
			timer = 48;
			image_index = 2;
			sfx_play_global(sfx_pluck);
			hitbox.behavior = enemy_hitbox_behaviors.heavy_hazard;
		}
		//swing_speed = min(swing_speed + 0.1, 1.5);
		spike_size = min(spike_size + 0.1, 1);
		
		timer--;
		
		if (timer < 0)
			state_next_set(boss_spike_states.normal);
		break;
	case boss_spike_states.death:
		if (state_begin)
		{
			timer = 0;
			global.boss_phase = 2;
			hitbox.active = hitbox_active.inactive;
			image_index = 1;
			swing_speed = sign(swing_speed) * 8;
			if (global.game_mode != game_modes.boss_rush)
				music_stop();
		}
		
		if (timer < 128)
		{
			if (timer mod 16 == 0)
				instance_create_layer(x + thing_x - 64 + random(128), y + thing_y - 64 + random(128), "layer_instances", obj_boss_explosion);
			timer++;
		}
		else
		{
			state_next_set(-1);
			level_beat();
		}
		break;
}

chain_multiplier = min(chain_multiplier + 0.025, chain_multiplier_max);
_length = chain_segments * 32 * chain_multiplier;

angle = (angle + swing_speed);
if (angle < 0)
	angle += 360;
angle = angle mod 360;

_angle = (lengthdir_x(90, angle) + 270) mod 360;

thing_x = lengthdir_x(_length, _angle);
thing_y = lengthdir_y(_length, _angle);

hitbox.x_offset = thing_x;
hitbox.y_offset = thing_y;

//show_debug_message("Spike Angle: " + string(angle));