/// @description 

var _frame_delta = frame_delta_level_get();
var _x = lerp(x_start_frame, x, _frame_delta);
var _y = lerp(y_start_frame, y, _frame_delta);

draw_sprite_ext(sprite_index, active, _x, _y, 4, 4, 0, c_white, 1);