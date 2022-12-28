/// @description 

var _frame_delta = frame_delta_level_get();

draw_sprite_interpolated(sprite_index, 0,,,,,,,,, angle, angle_previous,,, _frame_delta);
draw_sprite_interpolated(sprite_index, 1,,,,,,,,,,,,, _frame_delta);