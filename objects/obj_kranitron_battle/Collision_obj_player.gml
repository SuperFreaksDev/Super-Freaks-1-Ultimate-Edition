/// @description 

var _hitbox_self = global.hitbox_collision_stored[hitbox_collision_stored_data.hitbox];

if (_hitbox_self == hitbox)
{
	with (other)
		state_next_set(player_states.death, 999999);
}
else
{
	with (other)
		player_hurt();
}