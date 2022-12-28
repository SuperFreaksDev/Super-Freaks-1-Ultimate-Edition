/// @description Debug Menu Shortcut

if (global.debug && !room_transition_active_get() && room != rm_menu_main)
{
	spawn_point_set(rm_menu_main);
	instance_create_layer(0, 0, "layer_instances", obj_room_transition_fade);
}
