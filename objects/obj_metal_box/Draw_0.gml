/// @description 

var _frame_delta = frame_delta_level_get();
var _x = lerp(x_start_frame, x, _frame_delta);
var _y = lerp(y_start_frame, y, _frame_delta);
var _height = abs(image_yscale * sprite_get_height(sprite_index));

//draw_sprite_ext(spr_metal_box_top, image_index, _x, _y - _height, image_xscale, 1, 0, c_white, 1);
draw_sprite_ext(spr_metal_box, image_index, _x, _y, image_xscale, image_yscale, 0, c_white, 1);