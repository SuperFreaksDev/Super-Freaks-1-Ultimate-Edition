/// @description 

var _transition_effect;

if (!room_transition_active_get())
{
	spawn_point_set(destination_room, destination_x, destination_y);
	_transition_effect = instance_create(obj_room_transition_fade);
	_transition_effect.color = c_black;
	sfx_play_global(sfx_teleport);
}