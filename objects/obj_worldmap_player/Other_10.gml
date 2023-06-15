/// @description Step

var _move_h = 0, _move_v = 0;

obj_worldmap_manager.level_id = -1;

switch (state)
{
	case 0:
		break;
	case 1:
		if (!room_transition_active_get() && !instance_exists(obj_character_select))
		{
			if (input_check("left", global.player_lead))
				_move_h -= 1;
			if (input_check("right", global.player_lead))
				_move_h += 1;
				
			if (input_check("up", global.player_lead))
				_move_v -= 1;
			if (input_check("down", global.player_lead))
				_move_v += 1;
		}
			
		x += _move_h * 4;
		y += _move_v * 4;
		x = clamp(x, 0, room_width);
		y = clamp(y, 0, room_height);
		break;
}
