/// @description 

var _hitbox_self = global.hitbox_collision_stored[hitbox_collision_stored_data.hitbox];

if (_hitbox_self == hitbox)
{
	with (other)
		player_kill();
}
else
{
	with (other)
		player_hurt();
}