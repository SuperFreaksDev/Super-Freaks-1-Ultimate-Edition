function player_state_debug()
{
	if (state_begin)
	{
		visible = true;
		camera.active = true;
		physics = player_physics_modifiers.normal;
		ball = false;
		rubber_band_can_slingshot = false;
	}
		
	if (button_left == controls_action_states.hold) || (button_left == controls_action_states.press)
		x -= 3;
	if (button_right == controls_action_states.hold) || (button_right == controls_action_states.press)
		x += 3;
	if (button_up == controls_action_states.hold) || (button_up == controls_action_states.press)
		y -= 3;
	if (button_down == controls_action_states.hold) || (button_down == controls_action_states.press)
		y += 3;
		
	if (!room_transition_active_get() && button_pause == controls_action_states.press)
		game_pause(player_number);
}
