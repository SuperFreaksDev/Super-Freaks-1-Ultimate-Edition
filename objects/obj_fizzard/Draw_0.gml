/// @description 

if (blink)
	gpu_set_fog(1, c_red, 0, 0);
draw_sprite_interpolated(sprite_index, image_index, x, y,,, 1, 1,,, 0,, c_white, 1, frame_delta_level_get());
if (blink)
	gpu_set_fog(0, c_white, 0, 0);