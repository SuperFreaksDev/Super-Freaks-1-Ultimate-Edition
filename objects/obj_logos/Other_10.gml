/// @description Step

timer++;

if (timer > 10 && !room_transition_active_get())
{
	spawn_point_set(rm_title);
	instance_create_layer(0, 0, "layer_instances", obj_room_transition_fade);
}