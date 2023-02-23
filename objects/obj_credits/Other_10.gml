/// @description Step

var _speed = (1 / screen_height_get()) * my_speed;

if (!room_transition_active_get())
{
	pos += _speed;

	if (pos >= 2 || input_check_pressed("confirm", global.player_lead) || input_check_pressed("start", global.player_lead))
	{
		music_stop();
		instance_create_layer(0, 0, "layer_instances", obj_room_transition_return);
	}
}