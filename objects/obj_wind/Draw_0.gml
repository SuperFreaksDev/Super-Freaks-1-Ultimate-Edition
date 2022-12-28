/// @description 

var _x_offset_delta = lerp(offset_x_previous, offset_x, frame_delta_level_get());
var _y_offset_delta = lerp(offset_y_previous, offset_y, frame_delta_level_get());

draw_sprite_tiled(spr_hippie_wind, image_index, _x_offset_delta, _y_offset_delta);