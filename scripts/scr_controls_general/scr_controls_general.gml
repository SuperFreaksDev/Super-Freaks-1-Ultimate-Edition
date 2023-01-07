enum controls_actions
{
	left = 0,
	right,
	up,
	down,
	start,
	drop_out,
	jump,
	attack,
	bubble,
	rubberband,
	rubberband_color,
	
	count = 10,
}

enum controls_devices
{
	keyboard = 0,
	gamepad,
	mouse,
}

enum controls_action_data
{
	name = 0,
	state = 1,
	list_kb = 2,
	list_gb = 3,
	list_mb = 4,
}

enum controls_action_states
{
	NA = 0,
	press = 1,
	hold = 2,
	release = 3,
}

/// @function controls_init
/// @description Initializes the controls
function controls_init()
{
	with (obj_manager)
	{
		global.controls_settings = [];
		global.controls_device_last_used = array_create(player_numbers.count + 1, controls_devices.gamepad);
		controls_default();
		controls_load();
		
		global.key_stored = -1;
		keyboard_lastkey = -1;
		
		global.mouse_active = false;
		global.mouse_button_stored = -1;
		mouse_lastbutton = mb_none;
		
		gamepad_array_init();
		global.gamepad_key = array_create(player_numbers.count + 1, -1);
		global.gamepad_keylast = array_create(player_numbers.count + 1, -1);
		
		if (is_undefined(global.gamepad_array[0]))
			global.controls_device_last_used[0] = controls_devices.keyboard;
	}
}

/// @function controls_save
/// @description Saves the current control scheme
function controls_save()
{
	var _json = json_stringify(global.controls_settings);
	string_save(_json, "controls.settings");
}

/// @function controls_load
/// @description If the controls file can be found, the game will attempt to load the saved control scheme from it. Otherwise it will load the default scheme in
function controls_load()
{
	var _json;
	var _array;
	var _action_number, _player_number;
	
	if (file_exists("controls.settings"))
	{
		_json = string_load("controls.settings");
		_array = json_parse(_json);
		
		for (_action_number = 0; _action_number < array_length(_array); ++_action_number)
		{
			//global.controls_settings[_action_number] = _array[_action_number];
			
			for (_player_number = 0; _player_number < array_length(_array[_action_number]); ++_player_number)
			{
				global.controls_settings[_action_number][_player_number] = _array[_action_number][_player_number];
			}
		}
	}
	else
		controls_save();
}

/// @function controls_default
/// @description Sets the default control scheme
function controls_default()
{
	var _player_number;
	
	controls_action_create(controls_actions.left, "Left");
	controls_action_create(controls_actions.right, "Right");
	controls_action_create(controls_actions.up, "Up");
	controls_action_create(controls_actions.down, "Down");
	controls_action_create(controls_actions.start, "Start / Pause");
	controls_action_create(controls_actions.drop_out, "Drop Out (Co-op)");
	controls_action_create(controls_actions.jump, "Jump / Confirm");
	controls_action_create(controls_actions.attack, "Deny");
	controls_action_create(controls_actions.bubble, "Bubble");
	controls_action_create(controls_actions.rubberband, "Elastiband Toggle");
	controls_action_create(controls_actions.rubberband_color, "Elastiband Color");
	
	controls_action_button_key_add(controls_actions.left, player_numbers.player_1, vk_left);
	controls_action_button_key_add(controls_actions.right, player_numbers.player_1, vk_right);
	controls_action_button_key_add(controls_actions.up, player_numbers.player_1, vk_up);
	controls_action_button_key_add(controls_actions.down, player_numbers.player_1, vk_down);
	controls_action_button_key_add(controls_actions.start, player_numbers.player_1, vk_enter);
	controls_action_button_key_add(controls_actions.drop_out, player_numbers.player_1, ord("A"));
	controls_action_button_key_add(controls_actions.jump, player_numbers.player_1, ord("Z"));
	controls_action_button_key_add(controls_actions.attack, player_numbers.player_1, ord("X"));
	controls_action_button_key_add(controls_actions.bubble, player_numbers.player_1, ord("C"));
	controls_action_button_key_add(controls_actions.rubberband, player_numbers.player_1, ord("D"));
	controls_action_button_key_add(controls_actions.rubberband, player_numbers.player_1, ord("E"));
	
	for (_player_number = 0; _player_number <= player_numbers.count; ++_player_number)
	{
		controls_action_button_gamepad_add(controls_actions.left, _player_number, gp_padl);
		controls_action_button_gamepad_add(controls_actions.left, _player_number, gp_axisl_left);
		controls_action_button_gamepad_add(controls_actions.right, _player_number, gp_padr);
		controls_action_button_gamepad_add(controls_actions.right, _player_number, gp_axisl_right);
		controls_action_button_gamepad_add(controls_actions.up, _player_number, gp_padu);
		controls_action_button_gamepad_add(controls_actions.up, _player_number, gp_axisl_up);
		controls_action_button_gamepad_add(controls_actions.down, _player_number, gp_padd);
		controls_action_button_gamepad_add(controls_actions.down, _player_number, gp_axisl_down);
		controls_action_button_gamepad_add(controls_actions.start, _player_number, gp_start);
		controls_action_button_gamepad_add(controls_actions.drop_out, _player_number, gp_select);
		controls_action_button_gamepad_add(controls_actions.jump, _player_number, gp_face1);
		controls_action_button_gamepad_add(controls_actions.attack, _player_number, gp_face2);
		controls_action_button_gamepad_add(controls_actions.bubble, _player_number, gp_face4);
		controls_action_button_gamepad_add(controls_actions.rubberband, _player_number, gp_shoulderlb);
		controls_action_button_gamepad_add(controls_actions.rubberband_color, _player_number, gp_shoulderrb);
	}
}

/// @function controls_step
/// @param {int} _player_number = 0
/// @description Loops through all of the players' actions each frame and determines if any of their buttons are being pressed
function controls_step(_player_number = 0)
{
	var _action_number;
	var _state_new;
	var _state_previous;
	
	for (_action_number = 0; _action_number <= controls_actions.count; ++_action_number)
	{
		_state_previous = controls_action_state_get(_action_number, _player_number);
				
		if (controls_action_step(_action_number, _player_number))
		{
			switch (_state_previous)
			{
				case controls_action_states.NA:
				case controls_action_states.release:
					_state_new = controls_action_states.press;
					break;
				default:
					_state_new = controls_action_states.hold;
					break;
			}
		}
		else
		{
			switch (_state_previous)
			{
				case controls_action_states.press:
				case controls_action_states.hold:
					_state_new = controls_action_states.release;
					break;
				default:
					_state_new = controls_action_states.NA;
					break;
			}
		}
				
		global.controls_settings[_action_number][_player_number][controls_action_data.state] = _state_new;
	}
}

/// @function controls_action_create
/// @description Creates an action the player(s) can perform
/// @param {int} _action
/// @param {string} _name
function controls_action_create(_action, _name = "")
{
	var _player_number;
	
	for (_player_number = 0; _player_number <= player_numbers.count; ++_player_number)
	{
		global.controls_settings[_action][_player_number][controls_action_data.name] = _name;
		global.controls_settings[_action][_player_number][controls_action_data.state] = controls_action_states.NA;
		global.controls_settings[_action][_player_number][controls_action_data.list_kb] = [];
		global.controls_settings[_action][_player_number][controls_action_data.list_gb] = [];
		global.controls_settings[_action][_player_number][controls_action_data.list_mb] = [];
	}
}

/// @function controls_action_step
/// @description Checks if a player is pressing one of the keys/buttons assigned to the action being checked; returns true if so, returns false otherwise
/// @param {int} _action
/// @param {int} _player_number = 0
function controls_action_step(_action, _player_number = 0)
{
	var _list;
	var _list_pos;
	var _key;
	var _gamepad;
	
	_list = global.controls_settings[_action][_player_number][controls_action_data.list_kb];
				
	for (_list_pos = 0; _list_pos < array_length(_list); ++_list_pos)
	{
		_key = _list[_list_pos];
				
		if (keyboard_check(_key))
		{
			global.controls_device_last_used[_player_number] = controls_devices.keyboard;
			return true;
		}
	}
	
	_list = global.controls_settings[_action][_player_number][controls_action_data.list_gb];
	_gamepad = global.gamepad_array[_player_number];
	
	if (!is_undefined(_gamepad))
	{
		for (_list_pos = 0; _list_pos < array_length(_list); ++_list_pos)
		{
			_key = _list[_list_pos];
				
			if (gamepad_button_check_analog(global.gamepad_array[_player_number], _key))
			{
				global.controls_device_last_used[_player_number] = controls_devices.gamepad;
				return true;
			}
		}
	}
	
	_list = global.controls_settings[_action][_player_number][controls_action_data.list_mb];
				
	for (_list_pos = 0; _list_pos < array_length(_list); ++_list_pos)
	{
		_key = _list[_list_pos];
				
		if (mouse_check_button(_key))
		{
			global.controls_device_last_used[_player_number] = controls_devices.mouse;
			return true;
		}
	}
	
	return false;
}

/// @function controls_action_name_set
/// @description Sets the state of whichever player's action
/// @param {int} _action
/// @param {int} _player_number = 0
function controls_action_name_set(_action, _player_number = 0, _name = "")
{
	global.controls_settings[_action][_player_number][controls_action_data.name] = _name;
}

/// @function controls_action_name_get
/// @description Returns the state of whichever player's action
/// @param {int} _action
/// @param {int} _player_number = 0
function controls_action_name_get(_action, _player_number = 0)
{
	return global.controls_settings[_action][_player_number][controls_action_data.name];
}

/// @function controls_action_state_get
/// @description Returns the state of whichever player's action
/// @param {int} _action
/// @param {int} _player_number = 0
function controls_action_state_get(_action, _player_number = 0)
{
	return global.controls_settings[_action][_player_number][controls_action_data.state];
}

/// @function draw_action
/// @param {Int} _player_number = 0
/// @param {Int} _action
/// @param {Real} _x
/// @param {Real} _y
function draw_action(_player_number = 0, _action, _x, _y)
{
	var _device = global.controls_device_last_used[_player_number];
	var _list_kb = global.controls_settings[_action][_player_number][controls_action_data.list_kb];
	var _list_gb = global.controls_settings[_action][_player_number][controls_action_data.list_gb];
	var _list_mb = global.controls_settings[_action][_player_number][controls_action_data.list_mb];
	
	if (_device == controls_devices.gamepad && array_length(_list_gb) > 0)
		draw_action_gamepad(_player_number, _action, _x, _y);
	else
		draw_action_keyboard(_player_number, _action, _x, _y);
}