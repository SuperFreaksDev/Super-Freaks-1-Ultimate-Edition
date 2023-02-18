/// @description Step

// Inherit the parent event
event_inherited();

switch (state)
{
	case 0:
		animate = frame / 20;
		if (frame == 20)
			state_next_set(1);
		break;
	case 1:
		if (state_begin)
		{
			frame = 0;
			animate = 1;
			music_stop();
			draw_texture_flush();
		}
		if (frame == 20)
		{
			spawn_point_set(level_room_get(), undefined, undefined);
			checkpoint_set(level_room_get(),,, -1);
			room_destination_set(spawn_point_room_get());
			global.boss_phase = 0;
			state_next_set(2);
		}
		break;
	case 2:
		if (state_begin)
		{
			trophies_init(level_trophies_get(), level_trophy_count_max_get());
			audio_stop_all();
			global.checkpoint_death_count = 0;
			frame = 0;
			
			switch (global.game_mode)
			{
				case game_modes.randomizer:
				case game_modes.boss_rush:
					global.score++;
					break;
				case game_modes.speedrun:
					global.hearts = hearts_minimum_get();
					global.heart_meter = 0;
					game_timer_pause(false);
					break;
				default:
					global.hearts = hearts_minimum_get();
					global.heart_meter = 0;
					game_timer_reset();
					game_timer_pause(false);
					break;
			}
		}
		animate = (frame / 20) + 1;
		if (frame == 20)
			instance_destroy();
		break;
}
