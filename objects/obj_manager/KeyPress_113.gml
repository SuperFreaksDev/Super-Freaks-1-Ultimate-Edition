/// @description Debug Next Room

var _transition_effect;

if (global.debug)
{
	if ((room != room_last) && !room_transition_active_get())
	{
		spawn_point_set(room_next(room));
		_transition_effect = instance_create(obj_room_transition_fade);
		_transition_effect.color = c_black;
		sfx_play_global(sfx_teleport);
	}
}