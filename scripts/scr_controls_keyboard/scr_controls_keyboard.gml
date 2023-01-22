/// @function controls_action_button_key_add
/// @description Adds a keyboard key to the list of keyboard keys a player can press to perform an action. The key will be deleted if already assigned, and will also be erased from other actions as to prevent double mapping.
/// @param {int} _action
/// @param {int} _player_number = 0
/// @param _key
function controls_action_button_key_add(_action, _player_number = 0, _key)
{
	var _action_number;
	var _player_number_pos;
	var _delete = false;
	var _list_OG;
	var _list;
	var _list_pos;
	
	//Checks if the key is already assigned to said action
	_list_OG = global.controls_settings[_action][_player_number][controls_action_data.list_kb];
		
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
	if (_delete)
	{
		for (_action_number = 0; _action_number <= controls_actions.count; ++_action_number)
		{
			for (_player_number_pos = 0; _player_number_pos <= player_numbers.count; ++_player_number_pos)
			{
				_list = global.controls_settings[_action_number][_player_number_pos][controls_action_data.list_kb];
					
				if (_player_number_pos == _player_number)
					continue;
				
				for (_list_pos = array_length(_list) - 1; _list_pos >= 0; --_list_pos)
				{
					if (_list[_list_pos] == _key)
						array_delete(_list, _list_pos, 1);
				}
			}
		}
	}
	else
		array_push(_list_OG, _key);
}

/// @function controls_action_button_key_string
/// @description Writes out a string of all of the keyboard keys a player's action uses
/// @param {int} _action
/// @param {int} _player_number = 0
function controls_action_button_key_string(_action, _player_number = 0)
{
	var _list, _list_pos;
	var _key;
	var _string = "";
	
	_list = global.controls_settings[_action][_player_number][controls_action_data.list_kb];
				
	for (_list_pos = 0; _list_pos < array_length(_list); ++_list_pos)
	{
		_key = _list[_list_pos];
		_string = string_insert(string(key_return_string(_key)) + ",", _string, string_length(_string) + 1);
	}
	
	return _string;
}

/// @function key_stored_set
function key_stored_set()
{
	var _key_temp = keyboard_lastkey;
	keyboard_lastkey = -1;
	
	if (_key_temp != -1)
	{
		if keyboard_check(_key_temp)
		{
			global.key_stored = _key_temp;
			exit;
		}
	}
	
	global.key_stored = -1;
}

/// @function key_stored_get
function key_stored_get()
{
	return global.key_stored;
}

/// @function key_return_string
/// @param _key
function key_return_string(_key)
{
	/*//
	Script by D.W. O'Boyle (@dwoboyle)
	How to use:
	Simply call this script in a draw_text function.
	_key should be a keyboard key such as vk_enter or ord('Z').
	//*/
	
	//if is_undefined(_key)
	//	return "N/A";
	if _key = clamp(_key, 48, 91)
		return chr(_key);
	switch (_key)
	{
		case -1: return "N/A";
		case 8: return "Backspace";
		case 9: return "Tab";
		case 13: return "Enter";
		case 16: return "Shift";
		case 17: return "Ctrl";
		case 18: return "Alt";
		case 19: return "Pause/Break";
		case 20: return "Caps Lock";
		case 27: return "Esc";
		case 33: return "Page Up";
		case 34: return "Page Down";
		case 35: return "End";
		case 36: return "Home";
		case 37: return "Left Arrow";
		case 38: return "Up Arrow";
		case 39: return "Right Arrow";
		case 40: return "Down Arrow";
		case 45: return "Insert";
		case 46: return "Delete";
		case 96: return "Numpad 0";
		case 97: return "Numpad 1";
		case 98: return "Numpad 2";
		case 99: return "Numpad 3";
		case 100: return "Numpad 4";
		case 101: return "Numpad 5";
		case 102: return "Numpad 6";
		case 103: return "Numpad 7";
		case 104: return "Numpad 8";
		case 105: return "Numpad 9";
		case 106: return "Numpad *";
		case 107: return "Numpad +";
		case 109: return "Numpad -";
		case 110: return "Numpad .";
		case 111: return "Numpad /";
		case 112: return "F1";
		case 113: return "F2";
		case 114: return "F3";
		case 115: return "F4";
		case 116: return "F5";
		case 117: return "F6";
		case 118: return "F7";
		case 119: return "F8";
		case 120: return "F9";
		case 121: return "F10";
		case 122: return "F11";
		case 123: return "F12";
		case 144: return "Num Lock";
		case 145: return "Scroll Lock";
		case 162: return "Left Ctrl";
		case 163: return "Right Ctrl";
		case 164: return "Left Alt";
		case 165: return "Right Alt";
		case 186: return ";";
		case 187: return "=";
		case 188: return ",";
		case 189: return "-";
		case 190: return ".";
		case 191: return "Backslash";
		case 192: return "`";
		case 219: return "[";
		case 220: return "Forward Slash";
		case 221: return "]";
		case 222: return "'";
		default: return "Yo what?";
	}
}

/// @function draw_action_keyboard
/// @param {Int} _player_number = 0
/// @param {Int} _action
/// @param {Real} _x
/// @param {Real} _y
function draw_action_keyboard(_player_number = 0, _action, _x, _y)
{
	var _frame = floor(global.animate);
	var _sprite;
	var _list = global.controls_settings[_action][_player_number][controls_action_data.list_kb];
	var _key;
	
	if (array_length(_list) == 0)
		exit;
	_key = _list[0];
	
	if (_frame < 4)
		_sprite = spr_keyboard_buttons;
	else
		_sprite = spr_keyboard_buttons_pressed;
	
	draw_sprite(_sprite, _key, _x, _y);
}

/// @function draw_action_list_keyboard
/// @param {Int} _player_number = 0
/// @param {Int} _action
/// @param {Real} _x
/// @param {Real} _y
function draw_action_list_keyboard(_player_number = 0, _action, _x, _y)
{
	var _i;
	var _frame = floor(global.animate);
	var _sprite, _sprite_width;
	var _list = global.controls_settings[_action][_player_number][controls_action_data.list_kb];
	var _key;
	
	if (_frame < 4)
		_sprite = spr_keyboard_buttons;
	else
		_sprite = spr_keyboard_buttons_pressed;
	_sprite_width = sprite_get_width(_sprite);
	
	for (_i = 0; _i < array_length(_list); ++_i)
	{
		_key = _list[_i];
		draw_sprite(_sprite, _key, _x + (_i * _sprite_width), _y);
	}
}
