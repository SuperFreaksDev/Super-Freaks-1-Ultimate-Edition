/// @description 

var _hitbox_self = global.hitbox_collision_stored[hitbox_collision_stored_data.hitbox];

if (_hitbox_self == hitbox)
{
	with (other)
		event_inherited();
}
else
{
	with (other)
		player_hurt();
}