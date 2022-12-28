/// @description

var _frame_delta = frame_delta_level_get();

if (state == 1)
	draw_sprite_interpolated(spr_boss_larry_spikes,,,,,, image_xscale, image_yscale,,,,,, image_alpha, _frame_delta);
draw_sprite_interpolated(sprite_index,,,,,, image_xscale, image_yscale,,,,,, image_alpha, _frame_delta);