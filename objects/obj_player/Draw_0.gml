/// @description 

var _frame_delta = frame_delta_player_get();
var _x = lerp(x_start_frame, x, _frame_delta);
var _y = lerp(y_start_frame, y, _frame_delta);
var _icon, _icon_frame = 0, _height;

var _average_x, _average_y, _average_x_previous, _average_y_previous;
var _rubber_band_distance, _rubber_band_direction, _rubber_band_draw = true;
_average_x = global.player_rubberband_average[rubber_band_color][0];
_average_y = global.player_rubberband_average[rubber_band_color][1];
_average_x_previous = global.player_rubberband_average_previous[rubber_band_color][0];
_average_y_previous = global.player_rubberband_average_previous[rubber_band_color][1];

switch (state)
{
	case player_states.normal:
		if (physics == player_physics_modifiers.rail && ground_on)
		{
			_height = collider_detector_down[collider_detector_vertical_data.y];
			draw_sprite_ext(sprite_index, image_index, _x + lengthdir_x(_height, angle_ground + 90), _y + _height + lengthdir_y(_height, angle_ground + 90), 1, 1, angle_ground, c_white, 1);
		}
		else
		{
			if (jetpack)
				draw_sprite_ext(spr_jetpack, jetpack_index, _x - (24 * face), _y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(sprite_index, image_index, _x, _y, face, 1, 0, c_white, 1);
		}
		break;
	case player_states.bubble:
		draw_sprite_ext(sprite_index, image_index, _x, _y, face, 1, 0, c_white, 1);
		draw_sprite_ext(spr_player_bubble, image_index, _x, _y, 1, 1, 0, c_white, 0.5);
		_icon = input_binding_get_icon("bubble", player_number);
		if (!is_string(_icon))
		{
			if (floor(global.animate) > 4)
				_icon_frame = 1;
			draw_sprite(_icon, _icon_frame, _x + 36, _y - 48);
		}
		_rubber_band_draw = false;
		break;
	case player_states.death:
	case player_states.death_fall:
		draw_sprite_ext(sprite_index, image_index, _x, _y, face, 1, 0, c_white, 1);
		_rubber_band_draw = false;
		break;
	default:
		if (jetpack)
			draw_sprite_ext(spr_jetpack, jetpack_index, _x - (24 * face), _y, 1, 1, 0, c_white, 1);
		draw_sprite_ext(sprite_index, image_index, _x, _y, face, 1, 0, c_white, 1);
		break;
}

if (_rubber_band_draw == true && rubber_band && !is_undefined(_average_x) && !is_undefined(_average_x_previous))
{
	_average_x = lerp(_average_x_previous, _average_x, frame_delta_player_get());
	_average_y = lerp(_average_y_previous, _average_y, frame_delta_player_get());
	_rubber_band_distance = point_distance(x, y, _average_x, _average_y);
	_rubber_band_direction = point_direction(x, y, _average_x, _average_y);
	draw_sprite_ext(spr_elastiband, rubber_band_color, x, y, _rubber_band_distance / 32, clamp(32 / _rubber_band_distance, 0.5, 1), _rubber_band_direction, c_white, 1);
}