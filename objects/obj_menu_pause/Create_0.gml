/// @description 

enum pause_menu_states
{
	inactive = 0,
	active = 1,
	opening = 2,
	closing = 3,
}

// Inherit the parent event
event_inherited();

animation = 0;
animation_previous = 0;
player_number = 0;
depth = -9997;

state_machine_init();

menu_option_add(0, 0, "Continue", function()
{
	if (button_confirm == controls_action_states.press)
	{
		state_next_set(pause_menu_states.closing);
	}
});
menu_option_add(0, 1, "Restart", function()
{
	if (button_confirm == controls_action_states.press)
	{
		if (options[0][1][menu_option_data.unlocked] == true)
			instance_create(obj_room_transition_level);
		else
			sfx_play_global(sfx_honk);
	}
});
menu_option_add(0, 2, "Restart from Checkpoint", function()
{
	if (button_confirm == controls_action_states.press)
	{
		if (options[0][2][menu_option_data.unlocked] == true)
			instance_create(obj_room_transition_death);
		else
			sfx_play_global(sfx_honk);
	}
});
menu_option_add(0, 3, "Exit", function()
{
	if (button_confirm == controls_action_states.press)
	{
		spawn_point_set(rm_menu_main);
		instance_create(obj_room_transition_return);
	}
});
