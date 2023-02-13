/// @description Step

var _cutscene_room;

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
			animate = 1;
			frame = 15;
		}
		
		switch (global.game_mode)
		{
			case game_modes.speedrun:
			case game_modes.boss_rush:
				sfx_play_global(sfx_unlock_level);
				state_next_set(2);
				break;
			default:
				if (frame == 15)
				{
					if (trophy_count < global.trophies_max)
					{
						trophy_count++;
						frame = 0;
						sfx_play_global(sfx_pop);
					}
					else
					{
						if (perfect_flag)
						{
							clear_text = "perfect";
							sfx_play_global(sfx_unlock_level);
						}
						state_next_set(2);
					}
				}
				break;
		}
		break;
	case 2:
		frame = 0;
		if (input_check_pressed("confirm", 0))
			state_next_set(3);
		break;
	case 3:
		if (state_begin)
		{
			_cutscene_room = global.levels[global.level_id][level_data.cutscene_room_end];
			if (global.game_state == game_states.gameplay && global.game_mode == game_modes.normal && global.levels[global.level_id][level_data.status] == level_status.open && _cutscene_room != -1)
			{
				spawn_point_set(_cutscene_room);
				instance_create_layer(0, 0, "layer_instances", obj_room_transition_fade);
			}
			else
				instance_create(obj_room_transition_return);
			if (perfect_flag)
				global.levels[global.level_id][level_data.status] = level_status.clear_perfect;
			else
				global.levels[global.level_id][level_data.status] = level_status.clear_normal;
			levels_unlock();
		}
		frame = 0;
		break;
}
