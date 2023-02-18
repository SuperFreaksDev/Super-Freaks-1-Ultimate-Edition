/// @description Step

var _player_index;
var _go_to_next = false;

show_debug_message(global.player_lead);

if (!room_transition_active_get())
{
	if (is_undefined(global.player_lead))
	{
		for (_player_index = 0; _player_index < INPUT_MAX_PLAYERS; ++_player_index)
		{
			if (input_player_connected(_player_index))
			{
				global.player_lead = _player_index;
				_go_to_next = true;
				break;
			}
		}
	}
	else
	{
		if (input_check_pressed("confirm", global.player_lead) || input_check_pressed("start", global.player_lead))
			_go_to_next = true;
	}
	
	if (_go_to_next)
	{	
		spawn_point_set(rm_menu_main);
		instance_create_layer(0, 0, "layer_instances", obj_room_transition_return);
	}
}