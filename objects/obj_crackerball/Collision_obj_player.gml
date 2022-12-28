/// @description 

if (!indestructible)
{
	with (other)
		player_hurt();
	instance_create_layer(x, y, "layer_instances", obj_explosion_bomb);
	instance_destroy();
}
else
{
	with (other)
		state_next_set(player_states.death, 999999);
}