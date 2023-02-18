/// @description Gamepads

//var _pad = async_load[? "pad_index"];
//var _guid, _name;

//show_debug_message("Event: " + async_load[? "event_type"]);        // Debug code so you can see which event has been


//switch(async_load[? "event_type"])             // Parse the async_load map to see which event has been triggered
//{
//	case "gamepad discovered":                     // A game pad has been discovered
//		gamepad_add(_pad);
//		_guid = gamepad_get_guid(_pad);
//		_name = gamepad_get_description(_pad);
//		show_debug_message("Gamepad Discovered: " + string(_pad) + ", " + string(_name) + ", " + string(_guid));   // triggered and the pad associated with it.
//	    break;
//	case "gamepad lost":                           // Gamepad has been removed or otherwise disabled
//		gamepad_remove(_pad);
//		_guid = gamepad_get_guid(_pad);
//		_name = gamepad_get_description(_pad);
//		show_debug_message("Gamepad Lost: " + string(_pad) + ", " + string(_name) + ", " + string(_guid));   // triggered and the pad associated with it.
//	    break;
//}
