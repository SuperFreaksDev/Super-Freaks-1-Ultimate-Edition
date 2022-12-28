#macro gamepad_PS4 "4c05cc09000000000000504944564944"
#macro gamepad_switch_pro "7e050920000000000000504944564944"
#macro gamepad_switch_joycon_l "7e050620000000000000504944564944"
#macro gamepad_switch_joycon_r "7e050720000000000000504944564944"

#macro gp_axisl_left gp_padr + 1
#macro gp_axisl_right gp_padr + 2
#macro gp_axisl_up gp_padr + 3
#macro gp_axisl_down gp_padr + 4
#macro gp_axisr_left gp_padr + 5
#macro gp_axisr_right gp_padr + 6
#macro gp_axisr_up gp_padr + 7
#macro gp_axisr_down gp_padr + 8

/// @function gamepad_array_init
/// @description Initializes the array of gamepads
function gamepad_array_init()
{
	global.gamepad_array = array_create(player_numbers.count + 1, undefined);
}

/// @function gamepad_array_get
function gamepad_array_get()
{
	return global.gamepad_array;
}

/// @function gamepad_get
/// @param {int} _gamepad_index = 0
function gamepad_get(_gamepad_index = 0)
{
	return global.gamepad_array[_gamepad_index];
}

/// @function gamepad_add
/// @param {int} _pad
function gamepad_add(_pad)
{
	var _i = 0;
	var end_loop = false;
	var gamepad_plugged;
	
	do
	{
		gamepad_plugged = gamepad_get(_i);
		if (is_undefined(gamepad_plugged))
		{
			global.gamepad_array[_i] = _pad;
			global.controls_device_last_used[_i] = controls_devices.gamepad;
			end_loop = true;
		}
		else
		{
			++_i;
			if (_i >= array_length(global.gamepad_array))
				end_loop = true;
		}
	} until (end_loop)
}

/// @function gamepad_remove
/// @param _pad
function gamepad_remove(_pad)
{
	var _i = 0;
	var end_loop = false;
	var gamepad_plugged;
	
	do
	{
		gamepad_plugged = gamepad_get(_i);
		if (gamepad_plugged == _pad)
		{
			if (!gamepad_is_connected(_pad))
			{
				global.gamepad_array[_i] = undefined;
				global.controls_device_last_used[_i] = controls_devices.keyboard;
				end_loop = true;
			}
		}
		else
		{
			++_i;
			if (_i >= array_length(global.gamepad_array))
				end_loop = true;
		}
	} until (end_loop)
}

/// @function gamepad_button_check_analog
/// @param {int} _gamepad_index = 0
/// @param _button
function gamepad_button_check_analog(_gamepad_index = 0, _button)
{
	switch (_button)
	{
		case gp_axisl_left:
			if (gamepad_axis_value(_gamepad_index, gp_axislh) < -0.4)
				return true;
			break;
		case gp_axisl_right:
			if (gamepad_axis_value(_gamepad_index, gp_axislh) > 0.4)
				return true;
			break;
		case gp_axisl_up:
			if (gamepad_axis_value(_gamepad_index, gp_axislv) < -0.4)
				return true;
			break;
		case gp_axisl_down:
			if (gamepad_axis_value(_gamepad_index, gp_axislv) > 0.4)
				return true;
			break;
		case gp_axisr_left:
			if (gamepad_axis_value(_gamepad_index, gp_axisrh) < -0.4)
				return true;
			break;
		case gp_axisr_right:
			if (gamepad_axis_value(_gamepad_index, gp_axisrh) > 0.4)
				return true;
			break;
		case gp_axisr_up:
			if (gamepad_axis_value(_gamepad_index, gp_axisrv) < -0.4)
				return true;
			break;
		case gp_axisr_down:
			if (gamepad_axis_value(_gamepad_index, gp_axisrv) > 0.4)
				return true;
			break;
		default:
			if (gamepad_button_check(_gamepad_index, _button))
				return true;
			break;
	}
	
	return false;
}

/// @function controls_action_button_gamepad_add
/// @description Adds a gamepad button to the list of gamepad buttons a player can press to perform an action. The button will be deleted if already assigned, and will also be erased from other actions as to prevent double mapping.
/// @param {int} _action
/// @param {int} _player_number = 0
/// @param _key
function controls_action_button_gamepad_add(_action, _player_number = 0, _key)
{
	var _action_number;
	var _delete = false;
	var _list_OG;
	var _list;
	var _list_pos;
	
	//Checks if the key is already assigned to said action
	_list_OG = global.controls_settings[_action][_player_number][controls_action_data.list_gb];
		
	//Will only delete the button if there are more than one assigned to the action
	switch (array_length(_list_OG))
	{
		case 0:
			break;
		case 1:
			if (_list_OG[0] == _key)
				_delete = true;
			break;
		default:
			for (_list_pos = array_length(_list_OG) - 1; _list_pos >= 0; --_list_pos)
			{
				if (_list_OG[_list_pos] == _key)
				{
					array_delete(_list_OG, _list_pos, 1);
					_delete = true;
				}
			}
			break;
	}
		
	//Deletes duplicates of the key from other actions
	for (_action_number = 0; _action_number <= controls_actions.count; ++_action_number)
	{
		_list = global.controls_settings[_action_number][_player_number][controls_action_data.list_gb];
			
		if (_action_number == _action)
			continue;
				
		for (_list_pos = array_length(_list) - 1; _list_pos >= 0; --_list_pos)
		{
			if (_list[_list_pos] == _key)
				array_delete(_list, _list_pos, 1);
		}
	}
		
	if (_delete == false)
		array_push(_list_OG, _key);
}

/// @function controls_action_button_gamepad_string
/// @description Writes out a string of all of the gamepad buttons a player's action uses
/// @param {int} _action
/// @param {int} _player_number = 0
function controls_action_button_gamepad_string(_action, _player_number = 0)
{
	var _list, _list_pos;
	var _key;
	var _string = "";
	
	_list = global.controls_settings[_action][_player_number][controls_action_data.list_gb];
				
	for (_list_pos = 0; _list_pos < array_length(_list); ++_list_pos)
	{
		_key = _list[_list_pos];
		_string = string_insert(string(gamepad_return_string(_key)) + ",", _string, string_length(_string) + 1);
	}
	
	return _string;
}

/// @function gamepad_key_set
/// @param {int} _player_number = 0
function gamepad_key_set(_player_number = 0)
{
	var _i;
	var _gamepad_array = gamepad_array_get();
	var _gamepad_index = _gamepad_array[_player_number];
	
	if (is_undefined(_gamepad_index))
	{
		global.gamepad_key[_player_number] = -1;
		exit;
	}
	
	for (_i = gp_face1; _i <= gp_axisr_down; ++_i)
	{
		if gamepad_button_check_analog(_gamepad_index, _i) 
		{
			global.gamepad_key[_player_number] = _i;
			exit;
		}
	}
	global.gamepad_key[_player_number] = -1;
}

/// @function gamepad_return_string
/// @param _button
function gamepad_return_string(_button)
{
	switch (_button)
	{
		case gp_face1:
			return "Gamepad A";
		case gp_face2:
			return "Gamepad B";
		case gp_face3:
			return "Gamepad X";
		case gp_face4:
			return "Gamepad Y";
		case gp_padl:
			return "D-Pad Left";
		case gp_padu:
			return "D-Pad Up";
		case gp_padr:
			return "D-Pad Right";
		case gp_padd:
			return "D-Pad Down";
		case gp_shoulderl:
			return "Left Shoulder";
		case gp_shoulderr:
			return "Right Shoulder";
		case gp_shoulderlb:
			return "Left Bumper";
		case gp_shoulderrb:
			return "Right Bumper";
		case gp_start:
			return "Gamepad Start";
		case gp_select:
			return "Gamepad Select";
		case gp_stickl:
			return "Left-Stick Button";
		case gp_stickr:
			return "Right-Stick Button";
		case gp_axisl_left:
			return "Left-Stick Left";
		case gp_axisl_right:
			return "Left-Stick Right";
		case gp_axisl_up:
			return "Left-Stick Up";
		case gp_axisl_down:
			return "Left-Stick Down";
		case gp_axisr_left:
			return "Right-Stick Left";
		case gp_axisr_right:
			return "Right-Stick Right";
		case gp_axisr_up:
			return "Right-Stick Up";
		case gp_axisr_down:
			return "Right-Stick Down";
		default:
			return "NA";
	}
}

/// @function gamepad_constants_debug
function gamepad_constants_debug()
{
	var _i;
	
	for (_i = gp_face1; _i <= gp_axisr_down; ++_i)
	{
		show_debug_message(gamepad_return_string(_i));
	}
}

/// @function draw_action_gamepad
/// @param {Int} _player_number = 0
/// @param {Int} _action
/// @param {Real} _x
/// @param {Real} _y
function draw_action_gamepad(_player_number = 0, _action, _x, _y)
{
	var _frame = floor(global.animate);
	var _sprite;
	var _key = global.controls_settings[_action][_player_number][controls_action_data.list_gb][0];
	var _gamepad = gamepad_get(_player_number);
	var _guid = 0;
	
	if (!is_undefined(_gamepad))
		_guid = gamepad_get_guid(_gamepad);
	
	switch (_guid)
	{
		case gamepad_PS4:
			if (_frame < 4)
				_sprite = spr_gamepad_buttons_ps4;
			else
				_sprite = spr_gamepad_buttons_pressed_ps4;
			break;
		case gamepad_switch_pro:
			if (_frame < 4)
				_sprite = spr_gamepad_buttons_switchpro;
			else
				_sprite = spr_gamepad_buttons_switchpro_pressed;
			break;
		case gamepad_switch_joycon_l:
			if (_frame < 4)
				_sprite = spr_gamepad_buttons_switchjoyconl;
			else
				_sprite = spr_gamepad_buttons_switchjoyconl_pressed;
			break;
		case gamepad_switch_joycon_r:
			if (_frame < 4)
				_sprite = spr_gamepad_buttons_switchjoyconr;
			else
				_sprite = spr_gamepad_buttons_switchjoyconr_pressed;
			break;
		default:
			if (_frame < 4)
				_sprite = spr_gamepad_buttons_xbox;
			else
				_sprite = spr_gamepad_buttons_pressed_xbox;
			break;
	}
	
	draw_sprite(_sprite, _key - gp_face1, _x, _y);
}

/// @function draw_action_list_gamepad
/// @param {Int} _player_number = 0
/// @param {Int} _action
/// @param {Real} _x
/// @param {Real} _y
function draw_action_list_gamepad(_player_number = 0, _action, _x, _y)
{
	var _i;
	var _frame = floor(global.animate);
	var _sprite, _sprite_width;
	var _list = global.controls_settings[_action][_player_number][controls_action_data.list_gb];
	var _key;
	var _gamepad = gamepad_get(_player_number);
	var _guid = 0;
	
	if (!is_undefined(_gamepad))
		_guid = gamepad_get_guid(_gamepad);
	
	switch (_guid)
	{
		case gamepad_PS4:
			if (_frame < 4)
				_sprite = spr_gamepad_buttons_ps4;
			else
				_sprite = spr_gamepad_buttons_pressed_ps4;
			break;
		case gamepad_switch_pro:
			if (_frame < 4)
				_sprite = spr_gamepad_buttons_switchpro;
			else
				_sprite = spr_gamepad_buttons_switchpro_pressed;
			break;
		case gamepad_switch_joycon_l:
			if (_frame < 4)
				_sprite = spr_gamepad_buttons_switchjoyconl;
			else
				_sprite = spr_gamepad_buttons_switchjoyconl_pressed;
			break;
		case gamepad_switch_joycon_r:
			if (_frame < 4)
				_sprite = spr_gamepad_buttons_switchjoyconr;
			else
				_sprite = spr_gamepad_buttons_switchjoyconr_pressed;
			break;
		default:
			if (_frame < 4)
				_sprite = spr_gamepad_buttons_xbox;
			else
				_sprite = spr_gamepad_buttons_pressed_xbox;
			break;
	}
		
	_sprite_width = sprite_get_width(_sprite);
	
	for (_i = 0; _i < array_length(_list); ++_i)
	{
		_key = _list[_i];
		draw_sprite(_sprite, _key - gp_face1, _x + (_i * 16), _y);
	}
}