/// @description Step

var _screen_width = screen_width_get();
var _screen_height = screen_height_get();
var _screen_width_half = _screen_width / 2;
var _screen_height_half = _screen_height / 2;
var _i;

switch (state)
{
	case 0: //Loop Through Icons
		for (_i = level_num; _i < array_length(global.worldmap_icons); ++_i)
		{
			if (global.worldmap_icons[_i][worldmap_icon_data.status] == global.levels[_i][level_data.status])
				continue;
			else
			{
				if (is_undefined(global.worldmap_icons[_i][worldmap_icon_data.instance]))
					continue;
				else
				{
					level_num = _i;
					state_next_set(1);
					exit;
				}
			}
		}
		state_next_set(3);
		break;
	case 1: //Move to Icon
		if (state_begin)
		{
			target_x = clamp(global.worldmap_icons[level_num][worldmap_icon_data.x], _screen_width_half, room_width - _screen_width_half);
			target_y = clamp(global.worldmap_icons[level_num][worldmap_icon_data.y], _screen_height_half, room_height - _screen_height_half);
		}
		
		camera.x = lerp(camera.x, target_x, 0.25);
		camera.y = lerp(camera.y, target_y, 0.25);
		
		if (round(camera.x) == target_x && round(camera.y) == target_y)
			state_next_set(2);
		break;
	case 2: //Unlock Icon
		if (state_begin)
		{
			frame = 0;
			global.worldmap_icons[level_num][worldmap_icon_data.status] = global.levels[level_num][level_data.status];
			sfx_play_global(sfx_unlock_level);
			with (global.worldmap_icons[level_num][worldmap_icon_data.instance])
			{
				switch (global.worldmap_icons[level_id][worldmap_icon_data.status])
				{
					case level_status.locked:
						visible = false;
						image_index = 0;
						break;
					case level_status.open:
						visible = true;
						image_index = 0;
						break;
					case level_status.clear_normal:
						visible = true;
						image_index = 1;
						break;
					case level_status.clear_perfect:
						visible = true;
						image_index = 2;
						break;
				}
			}
		}
		
		frame++;
		if (frame == 60)
			state_next_set(0);
		break;
	case 3: //Return to Player
		if (state_begin)
		{
			target_x = clamp(obj_worldmap_player.x, _screen_width_half, room_width - _screen_width_half);
			target_y = clamp(obj_worldmap_player.y, _screen_height_half, room_height - _screen_height_half);
		}
		
		camera.x = lerp(camera.x, target_x, 0.25);
		camera.y = lerp(camera.y, target_y, 0.25);
		
		if (round(camera.x) == target_x && round(camera.y) == target_y)
			state_next_set(4);
		break;
	case 4: //Normal
		if (state_begin)
		{
			with (obj_worldmap_player)
				state_next_set(1);
				
			music_set(msc_worldmap);
		}
		
		camera.x = obj_worldmap_player.x;
		camera.y = obj_worldmap_player.y;
		break;
}
