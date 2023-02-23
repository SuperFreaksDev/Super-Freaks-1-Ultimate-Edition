/// @description 

var _i, _text, _count, _player_instance;

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
	multiplayer,
	multiplayer_leader,
	multiplayer_kick,
}

// Inherit the parent event
event_inherited();

animation = 0;
animation_previous = 0;
player_number = 0;
depth = -9997;

state_machine_init();

function options_reset()
{
	var _i;
	var _is_leader = false;
	var _text;
	
	if (player_number == global.player_lead)
		_is_leader = true;
	
	#region Main
		menu_option_add(0, 0, "Continue", function()
		{
			if (input_check_pressed("confirm", player_number))
			{
				state_next_set(pause_menu_states.closing);
			}
		});
		menu_option_add(0, 1, "Restart Level", function()
		{
			if (input_check_pressed("confirm", player_number))
			{
				if (options[0][1][menu_option_data.unlocked] == true)
					instance_create(obj_room_transition_level);
				else
					sfx_play_global(sfx_honk);
			}
		});
		menu_option_add(0, 2, "Restart from Checkpoint", function()
		{
			if (input_check_pressed("confirm", player_number))
			{
				if (options[0][2][menu_option_data.unlocked] == true)
					instance_create(obj_room_transition_death);
				else
					sfx_play_global(sfx_honk);
			}
		});

		if (_is_leader)
		{
			menu_option_add(0, 3, "Kick Players", function()
			{
				if (input_check_pressed("confirm", player_number))
				{
					if (options[0][3][menu_option_data.unlocked] == true)
					{
						page = menu_pause_pages.multiplayer_kick;
						option = 0;
					}
					else
						sfx_play_global(sfx_honk);
				}
			});
		}
		else
		{
			menu_option_add(0, 3, "Drop Out", function()
			{
				if (input_check_pressed("confirm", player_number))
				{
					if (options[0][3][menu_option_data.unlocked] == true)
					{
						player_drop_out_force(player_number);
					}
					else
						sfx_play_global(sfx_honk);
				}
			});
		}
		
		menu_option_add(0, 4, "Controls", function()
		{
			var _screen;
			var _player_number = player_number;
			if (input_check_pressed("confirm", player_number))
			{
				_screen = instance_create_layer(0, 0, "layer_instances", obj_remapping_screen);
				with (_screen)
					player_number = _player_number;
			}
		});

		menu_option_add(0, 5, "Exit Level", function()
		{
			if (input_check_pressed("confirm", player_number))
			{
				spawn_point_set(rm_menu_main);
				instance_create(obj_room_transition_return);
			}
		});
	#endregion

	for (_i = 0; _i < INPUT_MAX_PLAYERS; ++_i)
	{
		_text = "Player " + string(_i + 1);
		menu_option_add(menu_pause_pages.multiplayer_kick, _i, _text, function()
		{
			var _player_num = option;
		
			if (input_check_pressed("confirm", player_number))
			{
				if (_player_num != player_number && global.player_list[_player_num][player_data.active] == true)
				{
					player_drop_out_force(_player_num);
					sfx_play_global(sfx_record_scratch);
				}
				else
					sfx_play_global(sfx_honk);
			}
			else if (input_check_pressed("deny", player_number))
			{
				page = menu_pause_pages.main;
				option = 3;
			}
		});
	
		if (_i == player_number)
		{
			options[menu_pause_pages.multiplayer_kick][_i][menu_option_data.unlocked] = false;
		}
	}
}

options_reset();