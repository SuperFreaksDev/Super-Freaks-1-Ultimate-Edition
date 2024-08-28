/// @description 

var _hitbox_self = global.hitbox_collision_stored[hitbox_collision_stored_data.hitbox];

if (_hitbox_self == hitbox && other.hit)
{
	enemy_hurt();
	with (other)
		instance_destroy();
}