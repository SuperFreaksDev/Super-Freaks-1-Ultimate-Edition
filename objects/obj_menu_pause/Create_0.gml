/// @description 

var _i, _text, _player_instance;

enum pause_menu_states
{
	inactive = 0,
	active = 1,
	opening = 2,
	closing = 3,
}

enum menu_pause_pages
{
	main = 0,
	kick,
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
menu_option_add(0, 1, "Restart Level", function()
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
menu_option_add(0, 3, "Kick Players", function()
{
	if (button_confirm == controls_action_states.press)
	{
		if (options[0][3][menu_option_data.unlocked] == true)
		{
			page = menu_pause_pages.kick;
			option = 0;
		}
		else
			sfx_play_global(sfx_honk);
	}
});

menu_option_add(0, 4, "Exit Level", function()
{
	if (button_confirm == controls_action_states.press)
	{
		spawn_point_set(rm_menu_main);
		instance_create(obj_room_transition_return);
	}
});


for (_i = 1; _i <= player_numbers.count; ++_i)
{
	_text = "Player " + string(_i + 1);
	menu_option_add(menu_pause_pages.kick, _i - 1, _text, function()
	{
		var _player_instance;
		var _player_num = option + 1;
		
		if (button_confirm == controls_action_states.press)
		{
			_player_instance = global.player_list[_player_num][player_data.instance];
			if (global.player_list[_player_num][player_data.active] == true)
			{
				player_drop_out_force(_player_num);
				sfx_play_global(sfx_record_scratch);
			}
			else
				sfx_play_global(sfx_honk);
		}
		else if (button_deny == controls_action_states.press)
		{
			page = menu_pause_pages.main;
			option = 3;
		}
	});
}