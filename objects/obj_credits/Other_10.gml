/// @description Step

var _speed = (1 / screen_height_get()) * my_speed;

if (!room_transition_active_get())
{
	pos -= _speed;
	if (input_check("up", global.player_lead))
		pos -= (_speed * 2);

	if (pos <= 0 || input_check_pressed("confirm", global.player_lead) || input_check_pressed("start", global.player_lead))
	{
		music_stop();
		instance_create_layer(0, 0, "layer_instances", obj_room_transition_return);
	}
}