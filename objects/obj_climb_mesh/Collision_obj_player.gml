/// @description 

var _my_id = id;
var _grab = false;

if (other.instance_attach == _my_id)
{
	other.hang_on = true;
}
else
{
	switch (other.state)
	{
		case player_states.climb:
			_grab = true;
			break;
		case player_states.inactive:
		case player_states.debug:
		case player_states.death:
		case player_states.death_fall:
		case player_states.bubble:
			break;
		default:
			if (other.button_up == controls_action_states.press || (other.speed_v >= 0 && other.button_up == controls_action_states.hold))
				_grab = true;
			break;
	}
}

if (_grab)
{
	if (!array_contains(instance_attach_list, other))
	{
		if (state == 0)
			state_next_set(1);
		array_push(instance_attach_list, other);
		with (other)
		{
			instance_attach = _my_id;
			hang_on = true;
				
			if (state != player_states.climb)
				state_next_set(player_states.climb, 5);
		}
	}
}