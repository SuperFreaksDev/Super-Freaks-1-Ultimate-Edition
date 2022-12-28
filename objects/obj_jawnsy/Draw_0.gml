/// @description 

var _frame_delta = frame_delta_level_get();

switch (state)
{
	case enemy_jawnsy_states.jump:
		draw_sprite_interpolated(sprite_index, image_index, x, y,,, 1, 1,,, 90,, c_white, 1, _frame_delta);
		break;
	default:
		draw_sprite_interpolated(sprite_index, image_index, x, y,,, face, 1,,, 0,, c_white, 1, _frame_delta);
		break;
}