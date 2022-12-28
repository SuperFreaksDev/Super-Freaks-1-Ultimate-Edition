/// @description Step

switch (trigger_get(trigger_id))
{
	case true:
		move_pos = min(move_pos + 0.125, 1);
		break;
	case false:
		move_pos = max(move_pos - 0.125, 0);
		break;
}

x = lerp(start_x, destination_x, move_pos);
y = lerp(start_y, destination_y, move_pos);