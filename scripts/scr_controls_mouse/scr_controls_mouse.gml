/// @function controls_action_button_mouse_add
/// @description Adds a mouse button to the list of mouse buttons a player can press to perform an action. The button will be deleted if already assigned, and will also be erased from other actions as to prevent double mapping.
/// @param {int} _action
/// @param {int} _player_number = 0
/// @param _key
function controls_action_button_mouse_add(_action, _player_number = 0, _key)
{
	var _action_number;
	var _player_number_pos;
	var _delete = false;
	var _list_OG;
	var _list;
	var _list_pos;
	
	//Checks if the key is already assigned to said action
	_list_OG = global.controls_settings[_action][_player_number][controls_action_data.list_mb];
		
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
		for (_player_number_pos = 0; _player_number_pos <= player_numbers.count; ++_player_number_pos)
		{
			_list = global.controls_settings[_action_number][_player_number_pos][controls_action_data.list_mb];
				
			if (_player_number_pos == _player_number)
				continue;
				
			for (_list_pos = array_length(_list) - 1; _list_pos >= 0; --_list_pos)
			{
				if (_list[_list_pos] == _key)
					array_delete(_list, _list_pos, 1);
			}
		}
	}
		
	if (_delete == false)
		array_push(_list_OG, _key);
}

/// @function controls_action_button_mouse_string
/// @description Writes out a string of all of the mouse buttons a player's action uses
/// @param {int} _action
/// @param {int} _player_number = 0
function controls_action_button_mouse_string(_action, _player_number = 0)
{
	var _list, _list_pos;
	var _key;
	var _string = "";
	
	_list = global.controls_settings[_action][_player_number][controls_action_data.list_mb];
				
	for (_list_pos = 0; _list_pos < array_length(_list); ++_list_pos)
	{
		_key = _list[_list_pos];
		_string = string_insert(string(mouse_return_string(_key)) + ",", _string, string_length(_string) + 1);
	}
	
	return _string;
}

/// @function mouse_button_stored_set
function mouse_button_stored_set()
{
	var _key_temp = mouse_lastbutton;
	mouse_lastbutton = mb_none;
	
	if (_key_temp != mb_none)
	{
		if mouse_check_button(_key_temp)
		{
			global.mouse_button_stored = _key_temp;
			exit;
		}
	}
	
	global.mouse_button_stored = mb_none;
}

/// @function mouse_button_stored_get
function mouse_button_stored_get()
{
	return global.mouse_button_stored;
}

/// @function mouse_return_string
/// @param _button
function mouse_return_string(_button)
{
	switch (_button)
	{
		case mb_left:
			return "Left Click";
		case mb_right:
			return "Right Click";
		case mb_middle:
			return "Middle Click";
		case mb_side1:
			return "Mouse Side 1";
		case mb_side2:
			return "Mouse Side 2";
		case mb_none:
			return "Nothing";
		default:
			return "Yo what?"
	}
}
