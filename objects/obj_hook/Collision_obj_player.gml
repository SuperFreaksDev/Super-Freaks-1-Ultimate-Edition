var _my_id = id;
var _grab = false;
var _x = x, _y = y;

if (other.instance_attach == _my_id)
{
	other.hang_on = true;
}
else
{
	switch (other.state)
	{
		case player_states.hang:
			if (other.hang_dismount_frames == 0)
				_grab = true;
			break;
		case player_states.inactive:
		case player_states.debug:
		case player_states.death:
		case player_states.death_fall:
		case player_states.bubble:
		case player_states.climb:
		case player_states.pole_climb:
			break;
		default:
			if (other.hang_dismount_frames == 0 &&
			(other.speed_v < 0 && other.y_previous > (y + 72)) || (other.speed_v > 0) && other.y_previous < (y + 72))
				_grab = true;
			break;
	}
}

if (_grab)
{
	if (!array_contains(instance_attach_list, other))
	{
		//if (state == 0)
		//	state_next_set(1);
		array_push(instance_attach_list, other);
		with (other)
		{
			instance_attach = _my_id;
			hang_on = true;
			x = _x;
			y = _y + 72;
				
			if (state != player_states.hang)
				state_next_set(player_states.hang, 5);
		}
	}
}