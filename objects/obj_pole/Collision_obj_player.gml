/// @description 

var _my_id = id;
var _grab = false;
var _center_x = x;
var _player_facing_pole_sign = sign(other.x - _center_x);
var _player_move_sign = sign(other.x - other.x_previous);
var _hitbox_width = abs(other.hitbox.shape_x2 - other.hitbox.shape_x1);

if (other.instance_attach == _my_id)
{
	other.hang_on = true;
}
else
{
	switch (other.state)
	{
		case player_states.pole_climb:
			_grab = true;
			break;
		case player_states.inactive:
		case player_states.debug:
		case player_states.death:
		case player_states.death_fall:
		case player_states.bubble:
			break;
		default:
			if (_player_facing_pole_sign != _player_move_sign)
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
				
			if (state != player_states.pole_climb)
				state_next_set(player_states.pole_climb, 5);
			face = -_player_facing_pole_sign;
			x = (_center_x - _hitbox_width * face);
		}
	}
}