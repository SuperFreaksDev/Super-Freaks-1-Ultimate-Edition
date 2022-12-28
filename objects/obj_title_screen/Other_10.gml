/// @description Step

controls_step();

if (!room_transition_active_get())
{
	if (controls_action_state_get(controls_actions.jump, 0) || controls_action_state_get(controls_actions.start, 0))
	{
		spawn_point_set(rm_menu_main);
		instance_create_layer(0, 0, "layer_instances", obj_room_transition_return);
	}
}