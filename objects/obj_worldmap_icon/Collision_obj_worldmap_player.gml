/// @description 

var _level_id = level_id;

if (!room_transition_active_get() && visible && obj_worldmap_manager.state == 4)
{
	with (other)
		obj_worldmap_manager.level_id = _level_id;
	hover_over = true;
}
